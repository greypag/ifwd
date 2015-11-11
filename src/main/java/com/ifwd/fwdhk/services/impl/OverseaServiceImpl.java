package com.ifwd.fwdhk.services.impl;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

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
import org.springframework.validation.BindingResult;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.AnnualDetailsForm;
import com.ifwd.fwdhk.model.CreatePolicy;
import com.ifwd.fwdhk.model.OverseaDetailsForm;
import com.ifwd.fwdhk.services.OverseaService;
import com.ifwd.fwdhk.util.DateApi;
import com.ifwd.fwdhk.util.JsonUtils;
import com.ifwd.fwdhk.util.Methods;
import com.ifwd.fwdhk.util.StringHelper;
import com.ifwd.fwdhk.util.ValidationUtils;
import com.ifwd.fwdhk.util.WebServiceUtils;

@Service
public class OverseaServiceImpl implements OverseaService {
	private final static Logger logger = LoggerFactory.getLogger(OverseaServiceImpl.class);
	
	@Autowired
	private RestServiceDao restService;
	
	@Override
	public void preparePlanDetails(Model model, HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws ECOMMAPIException {
		String token = null, username = null;
		if ((session.getAttribute("token") != null)
				&& (session.getAttribute("username") != null)) {
			token = session.getAttribute("token").toString();
			username = session.getAttribute("username").toString();
		} else {
			restService.consumeLoginApi(request);
			if ((session.getAttribute("token") != null)) {
				token = session.getAttribute("token").toString();
				username = session.getAttribute("username").toString();
			}
		}
		
		String Url = UserRestURIConstants.OVERSEA_GET_QUOTE + "?planCode=Overseas"
				+ "&referralCode=";// + (String) session.getAttribute("referralCode");

		HashMap<String, String> header = new HashMap<String, String>(
				COMMON_HEADERS);
		if (request.getSession().getAttribute("username") != null) {
			header.put("userName", username);
			header.put("token", token);
		}
		
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		
		header.put("language", WebServiceUtils.transformLanaguage(lang));
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,
				Url, header, null);
		logger.info("OVERSEA_GET_QUOTE Response " + responseJsonObj);
		
		if (responseJsonObj.get("errMsgs") == null) {
			/*QuoteDetails quoteDetails = new QuoteDetails();
			responseJsonObj.get("referralCode");
			responseJsonObj.get("referralName");
			responseJsonObj.get("priceInfoA");
			responseJsonObj.get("priceInfoB");
			JSONObject jsonPriceInfoA = new JSONObject();
			jsonPriceInfoA = (JSONObject) responseJsonObj.get("priceInfoA");
			JSONObject jsonPriceInfoB = new JSONObject();
			jsonPriceInfoB = (JSONObject) responseJsonObj.get("priceInfoB");
			String planeName[] = { "A", "B" };
			String grossPrem[] = {
					jsonPriceInfoA.get("grossPremium").toString(),
					jsonPriceInfoB.get("grossPremium").toString() };

			String discountPercentage[] = {
					jsonPriceInfoA.get("discountPercentage").toString(),
					jsonPriceInfoB.get("discountPercentage").toString() };

			String discountAmount[] = {
					jsonPriceInfoA.get("discountAmount").toString(),
					jsonPriceInfoB.get("discountAmount").toString() };

			String totalNetPremium[] = {
					jsonPriceInfoA.get("totalNetPremium").toString(),
					jsonPriceInfoB.get("totalNetPremium").toString() };

			String totalDue[] = {
					jsonPriceInfoA.get("totalDue").toString(),
					jsonPriceInfoB.get("totalDue").toString() };

			quoteDetails.setGrossPremium(grossPrem);
			quoteDetails.setDiscountPercentage(discountPercentage);
			quoteDetails.setDiscountAmount(discountAmount);
			quoteDetails.setTotalNetPremium(totalNetPremium);
			quoteDetails.setToalDue(totalDue);
			quoteDetails.setPlanName(planeName);
			session.setAttribute("quoteDetails", quoteDetails);*/
			responseJsonObj.put("result", "success");
		}else{
			responseJsonObj.put("result", "fail");
		}
		
		try {
			logger.info(responseJsonObj.toString());
			response.getWriter().print(responseJsonObj.toString());
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public String prepareOverseaSummary(OverseaDetailsForm planDetailsForm,
			BindingResult result, Model model, HttpServletRequest request)
			throws Exception {
		HttpSession session = request.getSession();
		String username = session.getAttribute("username").toString();
		String token = session.getAttribute("token").toString();
		String language =  WebServiceUtils.transformLanaguage(UserRestURIConstants.getLanaguage(request));
		
		if (planDetailsForm.getDepartureDate() != null) {
			session.removeAttribute("travelCreatePolicy");
		} else {
			JSONObject parameters = new JSONObject();
			JSONObject responsObject = new JSONObject();
			String creditCardNo = (String)session.getAttribute("creditCardNo");
			
			HashMap<String, String> header = new HashMap<String, String>(
					COMMON_HEADERS);
			header.put("userName", username);
			header.put("token", token);
			header.put("language", language);
			parameters.put("referenceNo", session.getAttribute("finalizeReferenceNo"));
			parameters.put("transactionNumber", session.getAttribute("transNo"));
			parameters.put("transactionDate", session.getAttribute("transactionDate"));
			parameters.put("paymentFail", "1");
			
			if (creditCardNo !=null) { 
				try {
					parameters.put("creditCardNo", Methods.decryptStr((String)session.getAttribute("creditCardNo")));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			parameters.put("expiryDate", session.getAttribute("expiryDate"));
			logger.info("TRAVEL_FINALIZE_POLICY Request " + JsonUtils.jsonPrint(parameters));
			responsObject = restService.consumeApi(HttpMethod.POST, UserRestURIConstants.ANNUAL_TRAVEL_FINALIZE_POLICY, header, parameters);
			logger.info("TRAVEL_FINALIZE_POLICY Response " + JsonUtils.jsonPrint(responsObject));
			
		}
		
		String hkId = "hkId", passId = "passport";
		String deaprtureDate = DateApi.pickDate1((String)session.getAttribute("departureDate"));
		String returnDate = DateApi.pickDate1((String) session.getAttribute("returnDate"));
		String applicantFullName = WebServiceUtils.getParameterValue("fullName", session, request);
		String applicantHKID = WebServiceUtils.getParameterValue("hkid", session, request);
		String applicantMobNo = WebServiceUtils.getParameterValue("mobileNo", session, request);
		String emailAddress = WebServiceUtils.getParameterValue("emailAddress",	session, request);
		String dob = WebServiceUtils.getParameterValue("applicantDob",	session, request);
		dob = DateApi.pickDate1(dob);
		
		if (planDetailsForm.getDepartureDate() != null) {
			session.setAttribute("travelPlanDetailsForm", planDetailsForm);
		} else {
			planDetailsForm = (OverseaDetailsForm) session.getAttribute("travelPlanDetailsForm");
		}
		
        final String BENE_RELATIONSHIP_SELF = "SE";
        String relationOfChildTraveller = "", relationOfOtherTraveller = "";

		if (planDetailsForm.getPlanSelected().equals("personal")) {
		} else if (planDetailsForm.getPlanSelected().equals("family")) {
			relationOfChildTraveller = "CH";
			relationOfOtherTraveller = "OT";
		}
		
		JSONObject parameters = new JSONObject();
		parameters.put("planCode", session.getAttribute("planSelected"));
		parameters.put("commencementDate", deaprtureDate);
		parameters.put("expiryDate", returnDate);
		JSONArray insured = new JSONArray();
		
		String HKID = "HKID";
 		
		parameters.put("insured", insured);
		parameters.put("referralCode", session.getAttribute("referralCode"));

		String name     = StringHelper.emptyIfNull( applicantFullName ).toUpperCase();
		emailAddress 	= StringHelper.emptyIfNull( emailAddress ).toUpperCase();
		applicantHKID   = StringHelper.emptyIfNull( applicantHKID ).toUpperCase();
		
		JSONObject applicantJsonObj = new JSONObject();
		applicantJsonObj.put("name", name);
		applicantJsonObj.put("hkId", applicantHKID);
		applicantJsonObj.put("mobileNo", applicantMobNo);
		applicantJsonObj.put("email", emailAddress);
		applicantJsonObj.put("dob", dob);
		applicantJsonObj.put("optIn1", planDetailsForm.getCheckbox3());
		applicantJsonObj.put("optIn2", planDetailsForm.getCheckbox4());
		parameters.put("applicant", applicantJsonObj);

		JSONObject addressJsonObj = new JSONObject();
		addressJsonObj.put("room", planDetailsForm.getCorrespondenceAddressRoom());
		addressJsonObj.put("floor", planDetailsForm.getCorrespondenceAddressFloor());
		addressJsonObj.put("block", planDetailsForm.getCorrespondenceAddressBlock());
		addressJsonObj.put("building", planDetailsForm.getCorrespondenceAddressBuilding());
		addressJsonObj.put("estate", planDetailsForm.getCorrespondenceAddressEstate());
		addressJsonObj.put("streetNo", planDetailsForm.getCorrespondenceAddressStreetNo());
		addressJsonObj.put("streetName", planDetailsForm.getCorrespondenceAddressStreetName());
		addressJsonObj.put("district", planDetailsForm.getDistrictSelected());
		addressJsonObj.put("area", planDetailsForm.getApplicantDistrict());
		parameters.put("address", addressJsonObj);
		
		parameters.put("externalParty", "THE CLUB");
		parameters.put("externalPartyCode", session.getAttribute("theClubMembershipNo"));

		HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
		header.put("userName", username);
		header.put("token", token);
		header.put("language", language);
		//TO ENFORCE THE POLICY IS CREATED AND MAKE SURE THE TRANSACTION NUMBER IS NOT REUSED
		CreatePolicy createPolicy = (CreatePolicy)session.getAttribute("travelCreatePolicy");
		
		JSONObject responsObject = new JSONObject();
 		if (createPolicy == null) {

 			logger.info("TRAVEL_CREATE_POLICY Request " + JsonUtils.jsonPrint(parameters));
			responsObject = restService.consumeApi(HttpMethod.PUT,
					UserRestURIConstants.ANNUAL_TRAVEL_CREATE_POLICY, header,
					parameters);
			logger.info("TRAVEL_CREATE_POLICY Response " + JsonUtils.jsonPrint(responsObject));
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
				// Calling Api of Confirm Travel Care Policy
				JSONObject confirmPolicyParameter = new JSONObject();
				confirmPolicyParameter.put("referenceNo", finalizeReferenceNo);
				session.setAttribute("finalizeReferenceNo", finalizeReferenceNo);
				logger.info("Request From Confirm Travel Policy " + confirmPolicyParameter);
				JSONObject jsonResponse = restService.consumeApi(
						HttpMethod.POST,
						UserRestURIConstants.ANNUAL_TRAVEL_CONFIRM_POLICY, header,
						confirmPolicyParameter);
				logger.info("Response From Confirm Travel Policy " + JsonUtils.jsonPrint(jsonResponse));

				createPolicy.setSecureHash(checkJsonObjNull(jsonResponse, "secureHash"));
				createPolicy.setTransactionNo(checkJsonObjNull(jsonResponse, "transactionNumber"));
				createPolicy.setTransactionDate(checkJsonObjNull(jsonResponse, "transactionDate"));
				session.setAttribute("travelCreatePolicy", createPolicy);
				session.setAttribute("createPolicy", createPolicy);
			} else {
				model.addAttribute("errMsgs", responsObject.get("errMsgs"));
				return responsObject.get("errMsgs").toString();
			}
		}
 		
		session.setAttribute("finalizeReferenceNo", createPolicy.getReferenceNo());
		session.setAttribute("transactionDate", createPolicy.getTransactionDate());
		session.setAttribute("transNo", createPolicy.getTransactionNo());
		session.setAttribute("travelPlanDetailsFormBySummary", planDetailsForm);
		return "success";
	}
	
	private String checkJsonObjNull(JSONObject obj, String checkByStr) {
		if (obj.get(checkByStr) != null) {
			return obj.get(checkByStr).toString();
		} else {
			return "";
		}
	}
	
	private String checkPasswortAndHkid(String check, String selected,
			String selectedHkidOrPassport) {
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
