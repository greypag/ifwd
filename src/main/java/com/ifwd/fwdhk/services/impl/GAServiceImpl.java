package com.ifwd.fwdhk.services.impl;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.joda.time.LocalDate;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.api.controller.RestServiceImpl;
import com.ifwd.fwdhk.connector.ECommWsConnector;
import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.CreatePolicy;
import com.ifwd.fwdhk.model.HomeCareDetailsBean;
import com.ifwd.fwdhk.model.HomeQuoteBean;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.services.GAService;
import com.ifwd.fwdhk.util.ClientBrowserUtil;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.DateApi;
import com.ifwd.fwdhk.util.HeaderUtil;
import com.ifwd.fwdhk.util.JsonUtils;
import com.ifwd.fwdhk.util.Methods;
import com.ifwd.fwdhk.util.StringHelper;
import com.ifwd.fwdhk.util.WebServiceUtils;
@Service
public class GAServiceImpl implements GAService {
	private final static Logger logger = LoggerFactory.getLogger(GAServiceImpl.class);
	
	@Autowired
	private RestServiceDao restService;
	
	@Autowired
	private CommonUtils commonUtils;
	
	@Autowired 
	protected ECommWsConnector connector;
	
	@Autowired
	protected HeaderUtil headerUtil;
	
	@Autowired
	protected ClientBrowserUtil clientBrowserUtil;
	
	public CreatePolicy createPolicy(HomeCareDetailsBean homeCareDetails, HttpServletResponse response, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		String referralCode = (String)session.getAttribute("referralCode");
		String theClubMembershipNo = (String)session.getAttribute("theClubMembershipNo");
		
		JSONObject parameters = new JSONObject();
		JSONObject correspondenceAddress = new JSONObject();
		JSONObject insuredAddress = new JSONObject();
		JSONObject applicant = new JSONObject();
		
		String passportORhkid = WebServiceUtils.getParameterValue("apphkidandpassport", session, request);
		String hkId = StringHelper.emptyIfNull(WebServiceUtils.getParameterValue("hkId", session, request));
		String applicantName = WebServiceUtils.getParameterValue("applicantName", session, request);
		String emailAddress = WebServiceUtils.getParameterValue("emailAddress", session, request);
		String mobileNo = WebServiceUtils.getParameterValue("mobileNo", session, request);
		String dob = DateApi.formatString(WebServiceUtils.getParameterValue("dob", session, request));
		Date effectiveDate = DateApi.formatDate(homeCareDetails.getEffectiveDate());
		LocalDate date = new LocalDate(effectiveDate);
		String edate = date.toString();
		
		UserDetails userDetails = new UserDetails();
		if ("appHkid".equalsIgnoreCase(passportORhkid)) {
			userDetails.setHkid(hkId);
			userDetails.setPassport("");
		} else {
			userDetails.setHkid("");
			userDetails.setPassport(hkId);
		}
		userDetails.setFullName(applicantName);
		userDetails.setEmailAddress(emailAddress);
		userDetails.setMobileNo(mobileNo);
		userDetails.setDob(WebServiceUtils.getParameterValue("dob", session, request));
		session.setAttribute("applicantDetails", userDetails);
		
		parameters.put("commencementDate", edate);
		parameters.put("netFloorArea", homeCareDetails.getNetFloorArea());
		//parameters.put("planCode", homeCareDetails.getPlanCode());
		parameters.put("planCode", "EasyHomeCare");
		parameters.put("correspondenceAddress", correspondenceAddress);
		applicant.put("name", applicantName);
		applicant.put("gender", "M");
		applicant.put("dob", dob);

		if("appHkid".equalsIgnoreCase(passportORhkid)) {
			applicant.put("hkId", hkId);
			applicant.put("passport", "");
		}else {
			applicant.put("hkId", "");
			applicant.put("passport", hkId);			
		}
		
		applicant.put("email", emailAddress);
		applicant.put("mobileNo", mobileNo);
		applicant.put("occupation", "");
		applicant.put("optIn1", homeCareDetails.getCheckbox3());
		applicant.put("optIn2", homeCareDetails.getCheckbox4());

		parameters.put("applicant", applicant);

		correspondenceAddress.put("room", homeCareDetails.getApplicantRoom());
		correspondenceAddress.put("floor", homeCareDetails.getApplicantFloor());
		correspondenceAddress.put("block", homeCareDetails.getApplicantBlock());
		correspondenceAddress.put("building", homeCareDetails.getApplicantBuilding());
		correspondenceAddress.put("estate", homeCareDetails.getApplicantEstate());
		correspondenceAddress.put("streetNo", homeCareDetails.getApplicantStreetNo());
		correspondenceAddress.put("streetName", homeCareDetails.getApplicantStreetName());
		correspondenceAddress.put("district", homeCareDetails.getApplicantDistrict());
		correspondenceAddress.put("area", homeCareDetails.getApplicantArea());

		insuredAddress.put("room", homeCareDetails.getaRoom());
		insuredAddress.put("floor", homeCareDetails.getaFloor());
		insuredAddress.put("block", homeCareDetails.getaBlock());
		insuredAddress.put("building", homeCareDetails.getaBuilding());
		insuredAddress.put("estate", homeCareDetails.getaEstate());
		insuredAddress.put("streetNo", homeCareDetails.getaStreetNo());
		insuredAddress.put("streetName", homeCareDetails.getaStreetName());
		insuredAddress.put("district", homeCareDetails.getaDistrict());
		insuredAddress.put("area", homeCareDetails.getaArea());
		
		parameters.put("insuredAddress", insuredAddress);
		parameters.put("referralCode", referralCode);
		parameters.put("externalParty", StringUtils.isEmpty(theClubMembershipNo) ? "" : "THE CLUB");
		parameters.put("externalPartyCode", theClubMembershipNo);
		
		Map<String, String> header = headerUtil.getHeader(request);
		logger.info("HOME_LIABILITY_CREATE_POLICY Request" + JsonUtils.jsonPrint(parameters));
		JSONObject responsObject = restService
				.consumeApi(HttpMethod.PUT,
						UserRestURIConstants.HOMECARE_CREATE_POLICY, header,
						parameters);
		logger.info("HOME_LIABILITY_CREATE_POLICY Response" + JsonUtils.jsonPrint(responsObject));

		CreatePolicy createdPolicy = new CreatePolicy();
		if (responsObject.get("errMsgs") == null) {
			createdPolicy.setReferralCode(JsonUtils.checkJsonObjNull(responsObject, "referralCode"));
			createdPolicy.setReferenceNo(JsonUtils.checkJsonObjNull(responsObject, "referenceNo"));
			createdPolicy.setPlanCode(JsonUtils.checkJsonObjNull(responsObject, "planCode"));
			createdPolicy.setPaymentGateway(JsonUtils.checkJsonObjNull(responsObject, "paymentGateway"));
			createdPolicy.setMerchantId(JsonUtils.checkJsonObjNull(responsObject, "merchantId"));
			createdPolicy.setCurrCode(JsonUtils.checkJsonObjNull(responsObject, "currCode"));
			createdPolicy.setPaymentType(JsonUtils.checkJsonObjNull(responsObject, "paymentType"));
			createdPolicy.setLang(JsonUtils.checkJsonObjNull(responsObject, "lang"));
			session.setAttribute("createdPolicy", createdPolicy);
			session.setAttribute("homeCareDetails", homeCareDetails);
		} else {
			createdPolicy.setErrMsgs(responsObject.get("errMsgs").toString());
		}
		return createdPolicy;
	}
	
	public JSONObject confirmPolicy(String referenceNo,
			HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		HttpSession session = request.getSession();
		JSONObject confirmPolicyParameter = new JSONObject();
		
		confirmPolicyParameter.put("referenceNo", referenceNo);
		Map<String, String> header = headerUtil.getHeader(request);
		logger.info("HOMECARE_CONFIRM_POLICY Requset" + confirmPolicyParameter);
		JSONObject jsonResponse = restService.consumeApi(HttpMethod.POST,
				UserRestURIConstants.HOMECARE_CONFIRM_POLICY, header,
				confirmPolicyParameter);
		logger.info("HOMECARE_CONFIRM_POLICY Response" + JsonUtils.jsonPrint(jsonResponse));
		
		CreatePolicy confirm = new CreatePolicy();
		confirm.setSecureHash(JsonUtils.checkJsonObjNull(jsonResponse, "secureHash"));
		confirm.setTransactionNo(JsonUtils.checkJsonObjNull(jsonResponse, "transactionNumber"));
		confirm.setTransactionDate(JsonUtils.checkJsonObjNull(jsonResponse, "transactionDate"));
		session.setAttribute("confirm", confirm);
		session.setAttribute("HomeCareReferenceNo", referenceNo);
		session.setAttribute("HomeCareTransactionDate", confirm.getTransactionDate());
		session.setAttribute("transNo", confirm.getTransactionNo());
		return jsonResponse;
	}
	
	public JSONObject SubmitPolicy(String referenceNo,
			HttpServletResponse response, HttpServletRequest request, HttpSession session) {
		JSONObject result = new JSONObject();
		JSONObject submitPolicy = new JSONObject();
		submitPolicy.put("referenceNo", referenceNo);
		Map<String, String> header = headerUtil.getHeader(request);
		
		logger.info("HOMECARE_SUBMIT_POLICY Request" + JsonUtils.jsonPrint(submitPolicy));
		JSONObject jsonResponse = restService.consumeApi(
				HttpMethod.POST,
				UserRestURIConstants.HOMECARE_SUBMIT_POLICY, header,
				submitPolicy);
		
		logger.info("HOMECARE_SUBMIT_POLICY Response" + JsonUtils.jsonPrint(jsonResponse));
		
		if (JsonUtils.checkJsonObjNull(jsonResponse, "errMsgs").equals("")) {
			if (JsonUtils.checkJsonObjNull(jsonResponse, "policyNo").equals("")) {
				try {
					String cardNo = request.getParameter("cardNo");
					session.setAttribute("HomeCareCreditCardNo", Methods.encryptStr(cardNo));
				} catch (Exception e) {
					e.printStackTrace();
				}
				session.setAttribute("HomeCareCardexpiryDate", String.format("%02d", Integer.parseInt(request.getParameter("epMonth"))) + request.getParameter("epYear"));
				session.setAttribute("emailAddress", request.getParameter("emailAddress"));
				result.put("errMsgs", null);
				
			} else {
				result.put("errMsgs", "policyNo is null");
			}
		} else {
			result.put("errMsgs", JsonUtils.checkJsonObjNull(jsonResponse, "errMsgs"));
		}
		return result;
	}
	
	public CreatePolicy finalizeHomeCarePolicy(String userName, String token,
			String referenceNo, String transactionNumber,
			String transactionDate, String creditCardNo, String expiryDate,
			String emailId, String language, String paymentFail) throws Exception {
		if (paymentFail.equals("1")) {
			RestServiceDao restService = new RestServiceImpl();
			CreatePolicy finalizeObject = new CreatePolicy();
			HashMap<String, String> header = new HashMap<String, String>(
					COMMON_HEADERS);
			header.put("userName", userName);
			header.put("token", token);
			JSONObject parameters = new JSONObject();
			parameters.put("referenceNo", referenceNo);
			parameters.put("transactionNumber", transactionNumber);
			parameters.put("transactionDate", transactionDate);
			parameters.put("creditCardNo", creditCardNo);
			parameters.put("expiryDate", expiryDate);
			parameters.put("paymentFail", "1");
			
			logger.info("HOMECARE_FINALIZE_POLICY Request" + JsonUtils.jsonPrint(parameters));
			JSONObject apiResponsObject = restService.consumeApi(HttpMethod.POST,
					UserRestURIConstants.HOMECARE_FINALIZE_POLICY, header,
					parameters);
			logger.info("HOMECARE_FINALIZE_POLICY Response" + JsonUtils.jsonPrint(apiResponsObject));
			return null;
		} else {
		
			RestServiceDao restService = new RestServiceImpl();
			CreatePolicy finalizeObject = new CreatePolicy();
			HashMap<String, String> header = new HashMap<String, String>(
					COMMON_HEADERS);
			header.put("userName", userName);
			header.put("token", token);
			JSONObject parameters = new JSONObject();
			parameters.put("paymentFail", "0");
			parameters.put("referenceNo", referenceNo);
			parameters.put("transactionNumber", transactionNumber);
			parameters.put("transactionDate", transactionDate);
			parameters.put("creditCardNo", creditCardNo);
			parameters.put("expiryDate", expiryDate);
			
			logger.info("HOMECARE_FINALIZE_POLICY Request" + JsonUtils.jsonPrint(parameters));
			JSONObject apiResponsObject = restService.consumeApi(HttpMethod.POST,
					UserRestURIConstants.HOMECARE_FINALIZE_POLICY, header,
					parameters);
			logger.info("HOMECARE_FINALIZE_POLICY Response" + JsonUtils.jsonPrint(apiResponsObject));
	
			if (apiResponsObject.get("errMsgs") == null) {
				finalizeObject.setPolicyNo(checkJsonObjNull(apiResponsObject, "policyNo"));
				finalizeObject.setReferralCode(referenceNo);
			} else {
				finalizeObject.setErrMsgs(apiResponsObject.get("errMsgs").toString());
			}
			
			return finalizeObject;
		}
	}

	public void getHomeCareQuote(HttpServletRequest request,HttpSession session)throws ECOMMAPIException{
		HomeQuoteBean quoteDetails = new HomeQuoteBean();
		String referralCode = request.getParameter("referralCode");
		String answer1 = request.getParameter("answer1");
		String answer2 = request.getParameter("answer2");
		
		StringBuffer url = new StringBuffer();
		url.append(UserRestURIConstants.HOMECARE_GET_QUOTE);
		url.append("?planCode=EasyHomeCare");
		url.append("&referralCode=");
		url.append(referralCode);
		url.append("&room&floor&block=block1&building=building1&estate=estate1&streetNo&streetName&district&area");
		url.append("&answer1=");
		url.append(answer1);
		url.append("&answer2=");
		url.append(answer2);
		final Map<String,String> header = headerUtil.getHeader(request);
		JSONObject jsonObject = new JSONObject();
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,url.toString(), header, jsonObject);
		if(responseJsonObj.get("errMsgs") == null || responseJsonObj.get("errMsgs").toString().contains("Promotion code is not valid")){
			JSONObject priceInfo = new JSONObject();
			priceInfo = (JSONObject) responseJsonObj.get("priceInfo");
			
			quoteDetails.setDiscountPercentage(priceInfo.get("discountPercentage").toString());
			quoteDetails.setTotalDue(priceInfo.get("totalDue").toString());
			quoteDetails.setGrossPremium(priceInfo.get("grossPremium").toString());
			quoteDetails.setTotalNetPremium(priceInfo.get("totalNetPremium").toString());
			quoteDetails.setDiscountAmount(priceInfo.get("discountAmount").toString());
			quoteDetails.setReferralCode(responseJsonObj.get("referralCode")!=null?responseJsonObj.get("referralCode").toString():"");
			quoteDetails.setReferralName(responseJsonObj.get("referralName")!=null?responseJsonObj.get("referralName").toString():"");
			quoteDetails.setPlanCode(responseJsonObj.get("planCode").toString());
			quoteDetails.setErrormsg(checkJsonObjNull(responseJsonObj,"errMsgs"));
			
			session.setAttribute("referralCode", quoteDetails.getReferralCode());
			session.setAttribute("planQuote", quoteDetails);
		} 
		else {
			quoteDetails.setErrormsg(responseJsonObj.get("errMsgs").toString());
			throw new ECOMMAPIException(responseJsonObj.get("errMsgs").toString());
		}
	}
	
	public String checkJsonObjNull(JSONObject obj, String checkByStr) {
		if (obj.get(checkByStr) != null) {
			return obj.get(checkByStr).toString();
		} else {
			return "null";
		}
	}
}
