package com.ifwd.fwdhk.services.impl;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.CreatePolicy;
import com.ifwd.fwdhk.model.OverseaDetailsForm;
import com.ifwd.fwdhk.model.QuoteDetails;
import com.ifwd.fwdhk.services.OverseaService;
import com.ifwd.fwdhk.util.DateApi;
import com.ifwd.fwdhk.util.JsonUtils;
import com.ifwd.fwdhk.util.Methods;
import com.ifwd.fwdhk.util.StringHelper;
import com.ifwd.fwdhk.util.WebServiceUtils;

@Service
public class OverseaServiceImpl implements OverseaService {
	private final static Logger logger = LoggerFactory.getLogger(OverseaServiceImpl.class);

	@Autowired
	private RestServiceDao restService;

	@Override
	public void prepareOverseaQuote(HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws Exception {
		String token = null, username = null, result = "fail";
		if ((session.getAttribute("token") != null) && (session.getAttribute("username") != null)) {
			token = session.getAttribute("token").toString();
			username = session.getAttribute("username").toString();
		} else {
			restService.consumeLoginApi(request);
			if ((session.getAttribute("token") != null)) {
				token = session.getAttribute("token").toString();
				username = session.getAttribute("username").toString();
			}
		}

		String referralCode = (String) session.getAttribute("referralCode");
		if(!StringUtils.isEmpty(referralCode)) {
			referralCode = java.net.URLEncoder.encode(referralCode, "UTF-8").replace("+", "%20");
		}
		String Url = UserRestURIConstants.OVERSEA_GET_QUOTE + "?planCode=Overseas" + "&referralCode="
				+ (referralCode != null ? referralCode : "");

		HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
		if (request.getSession().getAttribute("username") != null) {
			header.put("userName", username);
			header.put("token", token);
		}

		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";

		header.put("language", WebServiceUtils.transformLanaguage(lang));
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET, Url, header, null);
		logger.info("OVERSEA_GET_QUOTE Response " + responseJsonObj);
		if (responseJsonObj.toJSONString().contains("Promotion code is not valid")) {
			session.setAttribute("referralCode", "");
		} else {
			session.setAttribute("referralCode", StringHelper.emptyIfNull(referralCode));
		}
		if (responseJsonObj != null && responseJsonObj.get("errMsgs") == null) {
			
			QuoteDetails quoteDetails = new QuoteDetails();
			
			String planeName[] = { "basicA", "basicB", "medicalWorldwideA", "medicalWorldwideB", "medicalAsiaA", "medicalAsiaB" };
			String grossPrem[] = new String[6];
			String discountPercentage[] = new String[6];
			String discountAmount[] = new String[6];
			String totalNetPremium[] = new String[6];
			String totalDue[] = new String[6];
			JSONObject obj;
			for(int i = 0; i < planeName.length; i++) {
				obj = (JSONObject) responseJsonObj.get(planeName[i]);
				grossPrem[i] = obj.get("grossPremium").toString();
				discountPercentage[i] = obj.get("discountPercentage").toString();
				discountAmount[i] = obj.get("discountAmount").toString();
				totalNetPremium[i] = obj.get("totalNetPremium").toString();
				totalDue[i] = obj.get("totalDue").toString();
			}

			quoteDetails.setGrossPremium(grossPrem);
			quoteDetails.setDiscountPercentage(discountPercentage);
			quoteDetails.setDiscountAmount(discountAmount);
			quoteDetails.setTotalNetPremium(totalNetPremium);
			quoteDetails.setToalDue(totalDue);
			quoteDetails.setPlanName(planeName);
			session.setAttribute("quoteDetails", quoteDetails);
			result = "success";
		}
		try {
			response.getWriter().print(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

	@Override
	public String applyPromotionCode(HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws Exception {
		String token = null, username = null;
		if ((session.getAttribute("token") != null) && (session.getAttribute("username") != null)) {
			token = session.getAttribute("token").toString();
			username = session.getAttribute("username").toString();
		} else {
			restService.consumeLoginApi(request);
			if ((session.getAttribute("token") != null)) {
				token = session.getAttribute("token").toString();
				username = session.getAttribute("username").toString();
			}
		}

		String promoCode = request.getParameter("promoCode");
		promoCode = java.net.URLEncoder.encode(promoCode, "UTF-8").replace("+", "%20");
		String Url = UserRestURIConstants.OVERSEA_GET_QUOTE + "?planCode=Overseas" + "&referralCode="
				+ (promoCode != null ? promoCode : "");

		HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
		if (request.getSession().getAttribute("username") != null) {
			header.put("userName", username);
			header.put("token", token);
		}

		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";

		header.put("language", WebServiceUtils.transformLanaguage(lang));
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET, Url, header, null);
		logger.info("OVERSEA_GET_QUOTE Response " + responseJsonObj);
		if (responseJsonObj.toJSONString().contains("Promotion code is not valid")) {
			session.setAttribute("referralCode", "");
		} else {
			session.setAttribute("referralCode", StringHelper.emptyIfNull(request.getParameter("promoCode")));
		}
		if (responseJsonObj.get("errMsgs") == null) {
			QuoteDetails quoteDetails = new QuoteDetails();
			
			String planeName[] = { "basicA", "basicB", "medicalWorldwideA", "medicalWorldwideB", "medicalAsiaA", "medicalAsiaB" };
			String grossPrem[] = new String[6];
			String discountPercentage[] = new String[6];
			String discountAmount[] = new String[6];
			String totalNetPremium[] = new String[6];
			String totalDue[] = new String[6];
			JSONObject obj;
			for(int i = 0; i < planeName.length; i++) {
				obj = (JSONObject) responseJsonObj.get(planeName[i]);
				grossPrem[i] = obj.get("grossPremium").toString();
				discountPercentage[i] = obj.get("discountPercentage").toString();
				discountAmount[i] = obj.get("discountAmount").toString();
				totalNetPremium[i] = obj.get("totalNetPremium").toString();
				totalDue[i] = obj.get("totalDue").toString();
			}

			quoteDetails.setGrossPremium(grossPrem);
			quoteDetails.setDiscountPercentage(discountPercentage);
			quoteDetails.setDiscountAmount(discountAmount);
			quoteDetails.setTotalNetPremium(totalNetPremium);
			quoteDetails.setToalDue(totalDue);
			quoteDetails.setPlanName(planeName);
			session.setAttribute("quoteDetails", quoteDetails);
			return responseJsonObj.toString();
		} else {
			return responseJsonObj.get("errMsgs").toString();
		}
	}
	
	@Override
	public void prepareOverseaDetails(Model model, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws ECOMMAPIException {
		String result = "fail";
		String Url = UserRestURIConstants.GET_AGE_TYPE + "?itemTable=AgeType";
		HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc")) {
			lang = "CN";
		}
		String planName = WebServiceUtils.getParameterValue("planName", session, request);
		String planSummary = WebServiceUtils.getParameterValue("selectedAmountDue", session, request);
		String selectPlanPremium = WebServiceUtils.getParameterValue("selectPlanPremium", session, request);
		String selectPlanName = WebServiceUtils.getParameterValue("selectPlanName", session, request);
		selectPlanName = planName;
		model.addAttribute("planName", planName);
		model.addAttribute("selectPlanName", selectPlanName);
		model.addAttribute("planSummary", planSummary);
		session.setAttribute("planSelected", selectPlanName);
		
		header.put("language", WebServiceUtils.transformLanaguage(lang));
		if (request.getSession().getAttribute("username") != null) {
			header.put("userName", session.getAttribute("username").toString());
			header.put("token", session.getAttribute("token").toString());
		}
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET, Url, header, null);

		if (responseJsonObj.get("errMsgs") == null) {
			JSONArray jsonAgeTypeArray = (JSONArray) responseJsonObj.get("optionItemDesc");
			logger.info("GET_AGE_TYPE Response" + jsonAgeTypeArray);
			String relationshipCode = UserRestURIConstants.GET_BENE_RELATIONSHIP_CODE
					+ "?itemTable=BeneRelationshipCode";

			JSONObject jsonRelationShipCode = restService.consumeApi(HttpMethod.GET, relationshipCode, header, null);

			if (responseJsonObj.get("errMsgs") == null) {
				JSONArray jsonRelationshipCode = (JSONArray) jsonRelationShipCode.get("optionItemDesc");
				logger.info("jsonRelationShipArray ====>>>>>>" + jsonRelationshipCode);
				result = "success";
			} else {
				model.addAttribute("errMsgs", responseJsonObj.get("errMsgs"));
			}
		} else {
			model.addAttribute("errMsgs", responseJsonObj.get("errMsgs"));
		}
		try {
			response.getWriter().print(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public String prepareOverseaSummary(OverseaDetailsForm planDetailsForm, BindingResult result, Model model,
			HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String username = session.getAttribute("username").toString();
		String token = session.getAttribute("token").toString();
		String language = WebServiceUtils.transformLanaguage(UserRestURIConstants.getLanaguage(request));

		if (planDetailsForm.getOverseaDepartureDate() != null) {
			session.removeAttribute("overseaCreatePolicy");
		} else {
			JSONObject parameters = new JSONObject();
			JSONObject responsObject = new JSONObject();
			String creditCardNo = (String) session.getAttribute("creditCardNo");

			HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
			header.put("userName", username);
			header.put("token", token);
			header.put("language", language);
			parameters.put("referenceNo", session.getAttribute("finalizeReferenceNo"));
			parameters.put("transactionNumber", session.getAttribute("transNo"));
			parameters.put("transactionDate", session.getAttribute("transactionDate"));
			parameters.put("paymentFail", "1");

			if (creditCardNo != null) {
				try {
					parameters.put("creditCardNo", Methods.decryptStr((String) session.getAttribute("creditCardNo")));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			parameters.put("expiryDate", session.getAttribute("expiryDate"));
			logger.info("OVERSEA_FINALIZE_POLICY Request " + JsonUtils.jsonPrint(parameters));
			responsObject = restService.consumeApi(HttpMethod.POST, UserRestURIConstants.OVERSEA_FINALIZE_POLICY,
					header, parameters);
			logger.info("OVERSEA_FINALIZE_POLICY Response " + JsonUtils.jsonPrint(responsObject));

		}

		
		planDetailsForm.setFullName(planDetailsForm.getFullName().toUpperCase());
		planDetailsForm.setPersonalName(planDetailsForm.getPersonalName().toUpperCase());
		if(planDetailsForm.getPersonalBeneficiary() != null && !"SE".equals(planDetailsForm.getPersonalBeneficiary())) {
			planDetailsForm.setBeneficiaryFullName(planDetailsForm.getBeneficiaryFullName().toUpperCase());
		}
		String deaprtureDate = DateApi.pickDate1(planDetailsForm.getOverseaDepartureDate());
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(DateApi.formatDate1(deaprtureDate));
		calendar.add(Calendar.DATE, -1);
		calendar.add(Calendar.YEAR, 1);
		String returnDate = DateApi.formatString1(calendar.getTime());
		String applicantFullName = planDetailsForm.getFullName();
		String applicantHKID = planDetailsForm.getHkid();
		String applicantMobNo = planDetailsForm.getMobileNo();
		String emailAddress = planDetailsForm.getEmailAddress();
		String dob = planDetailsForm.getApplicantDob();
		dob = DateApi.pickDate1(dob);
		
		planDetailsForm.setDepartureDate(planDetailsForm.getOverseaDepartureDate());
		planDetailsForm.setReturnDate(DateApi.pickDate1(returnDate));

		if (planDetailsForm.getHkid() != null) {
			session.setAttribute("overseaPlanDetailsForm", planDetailsForm);
		} else {
			planDetailsForm = (OverseaDetailsForm) session.getAttribute("overseaPlanDetailsForm");
		}

		JSONObject parameters = new JSONObject();
		parameters.put("planCode", session.getAttribute("planSelected"));
		parameters.put("commencementDate", deaprtureDate);
		parameters.put("expiryDate", returnDate);
		
		JSONObject overseas = new JSONObject();
		overseas.put("country", planDetailsForm.getCountryOfInstitution());
		overseas.put("institutionName", planDetailsForm.getNameOfInstitution());
		overseas.put("institutionAddress1", planDetailsForm.getAddressofInstitutionLine1());
		overseas.put("institutionAddress2", planDetailsForm.getAddressofInstitutionLine2());
		overseas.put("institutionAddress3", planDetailsForm.getAddressofInstitutionLine3());
		parameters.put("overseas", overseas);
		
		JSONArray insured = new JSONArray();
		JSONObject insuredOjb = new JSONObject();
		insuredOjb.put("name", planDetailsForm.getPersonalName());
		insuredOjb.put("ageRange", "2");
		insuredOjb.put("dob", DateApi.pickDate1(planDetailsForm.getInsuredDob()));
		insuredOjb.put("hkId", planDetailsForm.getPersonalHKID());
		insuredOjb.put("passport", "");
		insuredOjb.put("relationship", planDetailsForm.getApplicantRelationship());
		JSONObject beneficiary = new JSONObject();
		if(planDetailsForm.getPersonalBeneficiary() != null && !"SE".equals(planDetailsForm.getPersonalBeneficiary())) {
			beneficiary.put("name", planDetailsForm.getBeneficiaryFullName());
			if("HKID".equals(planDetailsForm.getBeneficiaryIDType())) {
				beneficiary.put("hkId", planDetailsForm.getBeneficiaryID());
				beneficiary.put("passport", "");
			}else {
				beneficiary.put("hkId", "");
				beneficiary.put("passport", planDetailsForm.getBeneficiaryID());
			}
			beneficiary.put("relationship", planDetailsForm.getPersonalBeneficiary());
		}else {
			beneficiary.put("name", planDetailsForm.getPersonalName());
			beneficiary.put("hkId", planDetailsForm.getPersonalHKID());
			beneficiary.put("passport", "");
			beneficiary.put("relationship", "SE");
		}
		insuredOjb.put("beneficiary", beneficiary);
		insured.add(insuredOjb);
		parameters.put("insured", insured);
		
		parameters.put("referralCode", session.getAttribute("referralCode"));

		String name = StringHelper.emptyIfNull(applicantFullName).toUpperCase();
		emailAddress = StringHelper.emptyIfNull(emailAddress).toUpperCase();
		applicantHKID = StringHelper.emptyIfNull(applicantHKID).toUpperCase();

		JSONObject applicant = new JSONObject();
		applicant.put("name", name);
		applicant.put("hkId", applicantHKID);
		applicant.put("mobileNo", applicantMobNo);
		applicant.put("email", emailAddress);
		applicant.put("dob", dob);
		applicant.put("optOut1", planDetailsForm.getCheckbox3()==true?"1":"0");
		applicant.put("optOut2", planDetailsForm.getCheckbox4()==true?"1":"0");
		parameters.put("applicant", applicant);

		JSONObject correspondenceAddress = new JSONObject();
		correspondenceAddress.put("room", planDetailsForm.getCorrespondenceAddressRoom());
		correspondenceAddress.put("floor", planDetailsForm.getCorrespondenceAddressFloor());
		correspondenceAddress.put("block", planDetailsForm.getCorrespondenceAddressBlock());
		correspondenceAddress.put("building", planDetailsForm.getCorrespondenceAddressBuilding());
		correspondenceAddress.put("estate", planDetailsForm.getCorrespondenceAddressEstate());
		correspondenceAddress.put("streetNo", planDetailsForm.getCorrespondenceAddressStreetNo());
		correspondenceAddress.put("streetName", planDetailsForm.getCorrespondenceAddressStreetName());
		correspondenceAddress.put("district", planDetailsForm.getApplicantDistrict());
		correspondenceAddress.put("area", planDetailsForm.getCorrespondenceAddressDistrict());
		parameters.put("correspondenceAddress", correspondenceAddress);

		parameters.put("externalParty", "THE CLUB");
		parameters.put("externalPartyCode", "");

		HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
		header.put("userName", username);
		header.put("token", token);
		header.put("language", language);
		// TO ENFORCE THE POLICY IS CREATED AND MAKE SURE THE TRANSACTION NUMBER
		// IS NOT REUSED
		CreatePolicy createPolicy = (CreatePolicy) session.getAttribute("overseaCreatePolicy");

		JSONObject responsObject = new JSONObject();
		if (createPolicy == null) {

			logger.info("OVERSEA_CREATE_POLICY Request " + JsonUtils.jsonPrint(parameters));
			responsObject = restService.consumeApi(HttpMethod.PUT, UserRestURIConstants.OVERSEA_CREATE_POLICY,
					header, parameters);
			logger.info("OVERSEA_CREATE_POLICY Response " + JsonUtils.jsonPrint(responsObject));
			createPolicy = new CreatePolicy();
			String finalizeReferenceNo = "";
			if (responsObject.get("errMsgs") == null) {
				finalizeReferenceNo = checkJsonObjNull(responsObject, "referenceNo");
				createPolicy.setReferenceNo(checkJsonObjNull(responsObject, "referenceNo"));
				createPolicy.setCurrCode(checkJsonObjNull(responsObject, "currCode"));
				createPolicy.setMerchantId(checkJsonObjNull(responsObject, "merchantId"));
				createPolicy.setPolicyNo(checkJsonObjNull(responsObject, "policyNo"));
				createPolicy.setLang(checkJsonObjNull(responsObject, "lang"));
				createPolicy.setPaymentGateway(checkJsonObjNull(responsObject, "paymentGateway"));
				createPolicy.setPaymentType(checkJsonObjNull(responsObject, "paymentType"));
				JSONObject confirmPolicyParameter = new JSONObject();
				confirmPolicyParameter.put("referenceNo", finalizeReferenceNo);
				session.setAttribute("finalizeReferenceNo", finalizeReferenceNo);
				logger.info("Request From Confirm Oversea Policy " + confirmPolicyParameter);
				JSONObject jsonResponse = restService.consumeApi(HttpMethod.POST,
						UserRestURIConstants.OVERSEA_CONFIRM_POLICY, header, confirmPolicyParameter);
				logger.info("Response From Confirm Oversea Policy " + JsonUtils.jsonPrint(jsonResponse));

				createPolicy.setSecureHash(checkJsonObjNull(jsonResponse, "secureHash"));
				createPolicy.setTransactionNo(checkJsonObjNull(jsonResponse, "transactionNumber"));
				createPolicy.setTransactionDate(checkJsonObjNull(jsonResponse, "transactionDate"));
				session.setAttribute("overseaCreatePolicy", createPolicy);
				session.setAttribute("createPolicy", createPolicy);
			} else {
				model.addAttribute("errMsgs", responsObject.get("errMsgs"));
				return responsObject.get("errMsgs").toString();
			}
		}

		session.setAttribute("finalizeReferenceNo", createPolicy.getReferenceNo());
		session.setAttribute("transactionDate", createPolicy.getTransactionDate());
		session.setAttribute("transNo", createPolicy.getTransactionNo());
		session.setAttribute("overseaPlanDetailsFormBySummary", planDetailsForm);
		return "success";
	}

	@SuppressWarnings("unchecked")
	public String processOverseaPayment(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String referenceNo = request.getParameter("referenceNo");
		JSONObject submitPolicy = new JSONObject();
		submitPolicy.put("referenceNo", referenceNo);
		HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
		header.put("userName", (String) session.getAttribute("username"));
		header.put("token", (String) session.getAttribute("token"));
		header.put("language", WebServiceUtils.transformLanaguage(UserRestURIConstants.getLanaguage(request)));

		logger.info("OVERSEA_SUBMIT_POLICY Request" + submitPolicy);
		JSONObject jsonResponse = restService.consumeApi(HttpMethod.POST, UserRestURIConstants.OVERSEA_SUBMIT_POLICY,
				header, submitPolicy);
		logger.info("OVERSEA_SUBMIT_POLICY Response" + jsonResponse);
		if (checkJsonObjNull(jsonResponse, "errMsgs").equals("")) {
			if (checkJsonObjNull(jsonResponse, "policyNo").equals("")) {
				String month = request.getParameter("epMonth");
				session.setAttribute("transactionNo", request.getParameter("transNo"));
				String encryptedCreditCard = request.getParameter("cardNo");

				try {
					encryptedCreditCard = Methods.encryptStr(request.getParameter("cardNo"));
					session.setAttribute("creditCardNo", encryptedCreditCard);
				} catch (Exception e) {
					session.setAttribute("creditCardNo", "");
					e.printStackTrace();
				}
				session.setAttribute(
						"expiryDate",
						String.format("%02d", Integer.parseInt(request.getParameter("epMonth")))
								+ request.getParameter("epYear"));
				session.setAttribute("emailAddress", request.getParameter("emailAddress"));
				return "success";
			} else {
				return checkJsonObjNull(jsonResponse, "policyNo");
			}
		} else {
			checkJsonObjNull(jsonResponse, "errMsgs");
		}
		return "fail";
	}

	private String checkJsonObjNull(JSONObject obj, String checkByStr) {
		if (obj.get(checkByStr) != null) {
			return obj.get(checkByStr).toString();
		} else {
			return "";
		}
	}

	private String checkPasswortAndHkid(String check, String selected, String selectedHkidOrPassport) {
		String response = "";
		switch (check) {
		case "hkId":
			if ("hkId".equalsIgnoreCase(selected)) {
				response = selectedHkidOrPassport;
			}
			return response;

		case "passport":
			if ("passport".equalsIgnoreCase(selected)) {
				response = selectedHkidOrPassport;
			}
			return response;

		}

		return response;
	}

}
