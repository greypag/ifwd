package com.ifwd.fwdhk.services.impl;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.joda.time.LocalDate;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.api.controller.RestServiceImpl;
import com.ifwd.fwdhk.connector.ECommWsConnector;
import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.CreatePolicy;
import com.ifwd.fwdhk.model.HomeCareDetailsBean;
import com.ifwd.fwdhk.model.HomeQuoteBean;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.services.HomeService;
import com.ifwd.fwdhk.util.ClientBrowserUtil;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.DateApi;
import com.ifwd.fwdhk.util.HeaderUtil;
import com.ifwd.fwdhk.util.HomePageFlowControl;
import com.ifwd.fwdhk.util.JsonUtils;
import com.ifwd.fwdhk.util.Methods;
import com.ifwd.fwdhk.util.StringHelper;
import com.ifwd.fwdhk.util.WebServiceUtils;
@Service
public class HomeServiceImpl implements HomeService {
	private final static Logger logger = LoggerFactory.getLogger(HomeServiceImpl.class);
	
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
	
	public CreatePolicy createPolicy(String plan, HomeCareDetailsBean homeCareDetails, HttpServletResponse response, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		String referralCode = (String)session.getAttribute("referralCode");
		String theClubMembershipNo = (String)session.getAttribute("theClubMembershipNo");
		
		JSONObject parameters = new JSONObject();
		JSONObject correspondenceAddress = new JSONObject();
		JSONObject insuredAddress = new JSONObject();
		JSONObject applicant = new JSONObject();
		
		String passportORhkid = WebServiceUtils.getParameterValue("apphkidandpassport", session, request);
		String hkId = StringHelper.emptyIfNull(WebServiceUtils.getParameterValue("hkId", session, request)).toUpperCase();
		String applicantName = WebServiceUtils.getParameterValue("applicantName", session, request);
		String emailAddress = WebServiceUtils.getParameterValue("emailAddress", session, request);
		String mobileNo = Methods.formatMobile(WebServiceUtils.getParameterValue("mobileNo", session, request));
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
		parameters.put("planCode", homeCareDetails.getPlanCode());
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
		logger.info(plan + " CREATE_POLICY Request" + JsonUtils.jsonPrint(parameters));
		String url;
		if(UserRestURIConstants.URL_HOME_LIABILITY_LANDING.equals(plan)) {
			url = UserRestURIConstants.HOMELIABILITY_CREATE_POLICY;
		}else {
			url = UserRestURIConstants.EASYHOME_CREATE_POLICY;
		}
		JSONObject responsObject = restService.consumeApi(HttpMethod.PUT, url, header, parameters);
		logger.info(plan + " CREATE_POLICY Response" + JsonUtils.jsonPrint(responsObject));

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
	
	public JSONObject confirmPolicy(String plan, String referenceNo,
			HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		HttpSession session = request.getSession();
		JSONObject confirmPolicyParameter = new JSONObject();
		
		confirmPolicyParameter.put("referenceNo", referenceNo);
		Map<String, String> header = headerUtil.getHeader(request);
		logger.info(plan + " CONFIRM_POLICY Requset" + confirmPolicyParameter);
		String url;
		if(UserRestURIConstants.URL_HOME_LIABILITY_LANDING.equals(plan)) {
			url = UserRestURIConstants.HOMELIABILITY_CONFIRM_POLICY;
		}else {
			url = UserRestURIConstants.EASYHOME_CONFIRM_POLICY;
		}
		JSONObject jsonResponse = restService.consumeApi(HttpMethod.POST, url, header, confirmPolicyParameter);
		logger.info(plan + " CONFIRM_POLICY Response" + JsonUtils.jsonPrint(jsonResponse));
		
		CreatePolicy confirm = new CreatePolicy();
		confirm.setSecureHash(JsonUtils.checkJsonObjNull(jsonResponse, "secureHash"));
		confirm.setTransactionNo(JsonUtils.checkJsonObjNull(jsonResponse, "transactionNumber"));
		confirm.setTransactionDate(JsonUtils.checkJsonObjNull(jsonResponse, "transactionDate"));
		session.setAttribute("confirm", confirm);
		session.setAttribute("HomeCareTransactionNo", confirm.getTransactionNo());
		session.setAttribute("HomeCareReferenceNo", referenceNo);
		session.setAttribute("HomeCareTransactionDate", confirm.getTransactionDate());
		session.setAttribute("transNo", confirm.getTransactionNo());
		return jsonResponse;
	}
	
	public JSONObject SubmitPolicy(String plan, String referenceNo,
			HttpServletResponse response, HttpServletRequest request, HttpSession session) {
		JSONObject result = new JSONObject();
		JSONObject submitPolicy = new JSONObject();
		submitPolicy.put("referenceNo", referenceNo);
		Map<String, String> header = headerUtil.getHeader(request);
		
		logger.info(plan + " SUBMIT_POLICY Request" + JsonUtils.jsonPrint(submitPolicy));
		String url;
		if(UserRestURIConstants.URL_HOME_LIABILITY_LANDING.equals(plan)) {
			url = UserRestURIConstants.HOMECARE_SUBMIT_POLICY;
		}else {
			url = UserRestURIConstants.HOMECARE_SUBMIT_POLICY;
		}
		JSONObject jsonResponse = restService.consumeApi(HttpMethod.POST, url, header, submitPolicy);
		logger.info(plan + " SUBMIT_POLICY Response" + JsonUtils.jsonPrint(jsonResponse));
		
		if (JsonUtils.checkJsonObjNull(jsonResponse, "errMsgs").equals("")) {
			if (JsonUtils.checkJsonObjNull(jsonResponse, "policyNo").equals("")) {
				try {
					String cardNo = request.getParameter("cardNo");
					session.setAttribute("HomeCareCreditCardNo", Methods.encryptStr(cardNo));
				} catch (Exception e) {
					logger.error(e.getMessage());
					logger.error(ExceptionUtils.getStackTrace(e));
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
	
	public JSONObject finalizeHomeCarePolicy(String plan, String paymentFail,
			HttpServletRequest request, HttpSession session) throws Exception {
		JSONObject result = new JSONObject();
		String referenceNo = (String) session.getAttribute("HomeCareReferenceNo");
		String transactionNumber = (String) session.getAttribute("HomeCareTransactionNo");
		String transactionDate = (String) session.getAttribute("HomeCareTransactionDate");
		String creditCardNo = (String)session.getAttribute("HomeCareCreditCardNo");
		String expiryDate = (String) session.getAttribute("HomeCareCardexpiryDate");
		
		HomeQuoteBean homeQuoteDetails = (HomeQuoteBean)session.getAttribute("homeQuoteDetails");
		
		float totalDue = Float.valueOf(homeQuoteDetails.getTotalDue());
		if(totalDue == 0 && creditCardNo == null) {
			creditCardNo = "0000000000000000";
			expiryDate = "122030";
		}else {
			if (creditCardNo !=null && creditCardNo != "") {
				try {
					creditCardNo = Methods.decryptStr((String) session.getAttribute("HomeCareCreditCardNo"));
				} catch (Exception e) {
					logger.error(e.getMessage());
					logger.error(ExceptionUtils.getStackTrace(e));
					e.printStackTrace();
				}
			}else {
				result.put("errMsgs", "creditCardNo is null");
				return result;
			}
		}
		
		if (paymentFail.equals("1")) {
			RestServiceDao restService = new RestServiceImpl();
			CreatePolicy finalizeObject = new CreatePolicy();
			Map<String, String> header = headerUtil.getHeader(request);
			JSONObject parameters = new JSONObject();
			parameters.put("referenceNo", referenceNo);
			parameters.put("transactionNumber", transactionNumber);
			parameters.put("transactionDate", transactionDate);
			parameters.put("creditCardNo", creditCardNo);
			parameters.put("expiryDate", expiryDate);
			parameters.put("paymentFail", paymentFail);
			
			logger.info(plan + " FINALIZE_POLICY Request" + JsonUtils.jsonPrint(parameters));
			String url;
			if(UserRestURIConstants.URL_HOME_LIABILITY_LANDING.equals(plan)) {
				url = UserRestURIConstants.HOMELIABILITY_FINALIZE_POLICY;
			}else {
				url = UserRestURIConstants.EASYHOME_FINALIZE_POLICY;
			}
			JSONObject apiResponsObject = restService.consumeApi(HttpMethod.POST, url, header, parameters);
			logger.info(plan + " FINALIZE_POLICY Response" + JsonUtils.jsonPrint(apiResponsObject));
			return null;
		} else {
			RestServiceDao restService = new RestServiceImpl();
			//CreatePolicy finalizeObject = new CreatePolicy();
			Map<String, String> header = headerUtil.getHeader(request, session);
			JSONObject parameters = new JSONObject();
			parameters.put("paymentFail", "0");
			parameters.put("referenceNo", referenceNo);
			parameters.put("transactionNumber", transactionNumber);
			parameters.put("transactionDate", transactionDate);
			parameters.put("creditCardNo", creditCardNo);
			parameters.put("expiryDate", expiryDate);
			
			logger.info(plan + " FINALIZE_POLICY Request" + JsonUtils.jsonPrint(parameters));
			String url;
			if(UserRestURIConstants.URL_HOME_LIABILITY_LANDING.equals(plan)) {
				url = UserRestURIConstants.HOMELIABILITY_FINALIZE_POLICY;
			}else {
				url = UserRestURIConstants.EASYHOME_FINALIZE_POLICY;
			}
			JSONObject apiResponsObject = restService.consumeApi(HttpMethod.POST, url, header, parameters);
			logger.info(plan + " FINALIZE_POLICY Response" + JsonUtils.jsonPrint(apiResponsObject));
	
			if (apiResponsObject.get("errMsgs") == null) {
				session.removeAttribute("HomeCareCreditCardNo");
				session.removeAttribute("HomeCareCardexpiryDate");
				session.removeAttribute("createdPolicy");
				session.removeAttribute("home-temp-save");
				session.removeAttribute("referralCode"); // vincent - remove session attribute "referral code" if success
			}
			
			return apiResponsObject;
		}
	}

	public JSONObject getHomeCareQuote(String plan,HttpServletRequest request,HttpSession session)throws ECOMMAPIException{
		HomeQuoteBean quoteDetails = new HomeQuoteBean();
		String referralCode;
		if(StringUtils.hasText(request.getParameter("referralCode"))) {
			referralCode = request.getParameter("referralCode");
		}else {
			referralCode = (String)session.getAttribute("referralCode");
		}
		String answer1 = request.getParameter("answer1");
		String answer2 = request.getParameter("answer2");
		
		StringBuffer url = new StringBuffer();
		if(UserRestURIConstants.URL_HOME_LIABILITY_LANDING.equals(plan)) {
			url.append(UserRestURIConstants.HOMELIABILITY_GET_QUOTE);
			url.append("?planCode=HomeLiability");
		}else {
			url.append(UserRestURIConstants.HOMECARE_GET_QUOTE);
			url.append("?planCode=EasyHomeCare");
		}
		url.append("&referralCode=");
		try {
			
			url.append(referralCode!=null?URLEncoder.encode(referralCode, "UTF-8").replace("+", "%20"):"");
		} catch (UnsupportedEncodingException e) {
			url.append("");
			e.printStackTrace();
		}
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
			quoteDetails.setReferralCode((responseJsonObj.get("referralCode")!=null && responseJsonObj.get("errMsgs") == null)?
					responseJsonObj.get("referralCode").toString():"");
			quoteDetails.setReferralName(responseJsonObj.get("referralName")!=null?responseJsonObj.get("referralName").toString():"");
			quoteDetails.setPlanCode(responseJsonObj.get("planCode").toString());
			quoteDetails.setErrormsg(checkJsonObjNull(responseJsonObj,"errMsgs"));
			if(responseJsonObj.get("errMsgs") == null) {
				session.setAttribute("referralCode", quoteDetails.getReferralCode());
			}else {
				session.setAttribute("referralCode", "");
			}
			session.setAttribute("planQuote", quoteDetails);
		} 
		else {
			quoteDetails.setErrormsg(responseJsonObj.get("errMsgs").toString());
			throw new ECOMMAPIException(responseJsonObj.get("errMsgs").toString());
		}
		return responseJsonObj;
	}
	
	public JSONObject getHomeCareQuote(String plan, HttpServletRequest request
										, String referralCode, String answer1, String answer2) throws ECOMMAPIException{
		HomeQuoteBean quoteDetails = new HomeQuoteBean();
		HttpSession session = request.getSession();
		
		StringBuffer url = new StringBuffer();
		if(UserRestURIConstants.URL_HOME_LIABILITY_LANDING.equals(plan)) {
			url.append(UserRestURIConstants.HOMELIABILITY_GET_QUOTE);
			url.append("?planCode=HomeLiability");
		}else {
			url.append(UserRestURIConstants.HOMECARE_GET_QUOTE);
			url.append("?planCode=EasyHomeCare");
		}
		url.append("&referralCode=");
		url.append(referralCode!=null?referralCode.replace(" ", ""):"");
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
			quoteDetails.setReferralCode((responseJsonObj.get("referralCode")!=null && responseJsonObj.get("errMsgs") == null)?
					responseJsonObj.get("referralCode").toString():"");
			quoteDetails.setReferralName(responseJsonObj.get("referralName")!=null?responseJsonObj.get("referralName").toString():"");
			quoteDetails.setPlanCode(responseJsonObj.get("planCode").toString());
			quoteDetails.setErrormsg(checkJsonObjNull(responseJsonObj,"errMsgs"));
			if(responseJsonObj.get("errMsgs") == null) {
				session.setAttribute("referralCode", quoteDetails.getReferralCode());
			}else {
				session.setAttribute("referralCode", "");
			}
			session.setAttribute("planQuote", quoteDetails);
		} 
		else {
			quoteDetails.setErrormsg(responseJsonObj.get("errMsgs").toString());
			throw new ECOMMAPIException(responseJsonObj.get("errMsgs").toString());
		}
		return responseJsonObj;
	}
	
	public String checkJsonObjNull(JSONObject obj, String checkByStr) {
		if (obj.get(checkByStr) != null) {
			return obj.get(checkByStr).toString();
		} else {
			return "null";
		}
	}
}
