package com.ifwd.fwdhk.services.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.joda.time.LocalDate;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.ifwd.ecomm.chinese.ZHConverter;
import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.connector.ECommWsConnector;
import com.ifwd.fwdhk.connector.response.eliteterm.CreateEliteTermPolicyResponse;
import com.ifwd.fwdhk.connector.response.ga.HomeCareUwQuestionsResponse;
import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.CreatePolicy;
import com.ifwd.fwdhk.model.HomeCareDetailsBean;
import com.ifwd.fwdhk.model.UserDetails;import com.ifwd.fwdhk.model.HomeCareQuetionaries;
import com.ifwd.fwdhk.model.easyhealth.EasyHealthPlanDetailBean;
import com.ifwd.fwdhk.model.easyhealth.EasyHealthPremiumSelectPlan;
import com.ifwd.fwdhk.model.life.LifeBeneficaryInfoBean;
import com.ifwd.fwdhk.model.life.LifeDeclarationBean;
import com.ifwd.fwdhk.model.life.LifeEmploymentInfoBean;
import com.ifwd.fwdhk.model.life.LifePersonalDetailsBean;import com.ifwd.fwdhk.services.GAService;
import com.ifwd.fwdhk.util.ClientBrowserUtil;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.DateApi;
import com.ifwd.fwdhk.util.HeaderUtil;
import com.ifwd.fwdhk.util.JsonUtils;
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
		session.setAttribute("userDetails", userDetails);
		
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

		CreatePolicy createPolicy = new CreatePolicy();
		if (responsObject.get("errMsgs") == null) {
			createPolicy.setReferralCode(JsonUtils.checkJsonObjNull(responsObject, "referralCode"));
			createPolicy.setReferenceNo(JsonUtils.checkJsonObjNull(responsObject, "referenceNo"));
			createPolicy.setPlanCode(JsonUtils.checkJsonObjNull(responsObject, "planCode"));
			createPolicy.setPaymentGateway(JsonUtils.checkJsonObjNull(responsObject, "paymentGateway"));
			createPolicy.setMerchantId(JsonUtils.checkJsonObjNull(responsObject, "merchantId"));
			createPolicy.setCurrCode(JsonUtils.checkJsonObjNull(responsObject, "currCode"));
			createPolicy.setPaymentType(JsonUtils.checkJsonObjNull(responsObject, "paymentType"));
			createPolicy.setLang(JsonUtils.checkJsonObjNull(responsObject, "lang"));
			session.setAttribute("createPolicy", createPolicy);
			session.setAttribute("homeCareDetails", homeCareDetails);
		} else {
			createPolicy.setErrMsgs(responsObject.get("errMsgs").toString());
		}
		return createPolicy;
	}
	
	public JSONObject confirmPolicy(CreatePolicy createPolicy,
			HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		HttpSession session = request.getSession();
		JSONObject confirmPolicyParameter = new JSONObject();
		
		confirmPolicyParameter.put("referenceNo", createPolicy.getReferenceNo());
		Map<String, String> header = headerUtil.getHeader(request);
		logger.info("HOMECARE_CONFIRM_POLICY Requset" + confirmPolicyParameter);
		JSONObject jsonResponse = restService.consumeApi(HttpMethod.POST,
				UserRestURIConstants.HOMECARE_CONFIRM_POLICY, header,
				confirmPolicyParameter);
		logger.info("HOMECARE_CONFIRM_POLICY Response" + JsonUtils.jsonPrint(jsonResponse));
		createPolicy.setSecureHash(JsonUtils.checkJsonObjNull(jsonResponse, "secureHash"));
		createPolicy.setTransactionNo(JsonUtils.checkJsonObjNull(jsonResponse, "transactionNumber"));
		createPolicy.setTransactionDate(JsonUtils.checkJsonObjNull(jsonResponse, "transactionDate"));
		session.setAttribute("createPolicy", createPolicy);
		return jsonResponse;
	}
	
	//public HomeCareUwQuestionsResponse getHomeCareUwQuestions(HttpServletRequest request,HttpSession session)throws ECOMMAPIException{
		/*final Map<String,String> header = headerUtil.getHeader1(request);
		HomeCareUwQuestionsResponse homeCareUwQuestions = new CreateEliteTermPolicyResponse();
		
		if(ZHConverter.hasSimpleChinese(inputMsg.toString())){
			logger.info("Some input information contains simplified Chinese");
			throw new ECOMMAPIException("Some input information contains simplified Chinese");
		}
		else{
			lifePolicy = connector.createLifePolicy(parameters, header);
			if(!lifePolicy.hasError()){
				request.getSession().setAttribute("lifePolicy", lifePolicy);
			}
			else{
				throw new ECOMMAPIException(lifePolicy.getErrMsgs()[0]);
			}
		}*/
	//}
}
