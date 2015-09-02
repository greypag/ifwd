package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.model.CreatePolicy;
import com.ifwd.fwdhk.model.PlanDetailsForm;
import com.ifwd.fwdhk.model.QuoteDetails;
import com.ifwd.fwdhk.model.TravelQuoteBean;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.services.AnnualTravelService;
import com.ifwd.fwdhk.util.DateApi;
import com.ifwd.fwdhk.util.JsonUtils;
import com.ifwd.fwdhk.util.Methods;
import com.ifwd.fwdhk.util.StringHelper;
import com.ifwd.fwdhk.util.ValidationUtils;
import com.ifwd.fwdhk.util.WebServiceUtils;

@Controller
public class AnnualTravelController {
	
	private final static Logger logger = LoggerFactory.getLogger(AnnualTravelController.class);

	@Autowired
	private RestServiceDao restService;

	@Autowired
	private AnnualTravelService annualTravelService;
	
	@RequestMapping(value = {"/{lang}/annual-travel", "/{lang}/annual-travel-insurance", "/{lang}/annual-travel-insurance/sharing/"})
	public ModelAndView getTravelHomePage(@RequestParam(required = false) final String promo, HttpServletRequest request, Model model,
			@RequestParam(required = false) final String utm_source,
			@RequestParam(required = false) final String utm_medium,
			@RequestParam(required = false) final String utm_campaign,
			@RequestParam(required = false) final String utm_content) throws Exception  {
		return annualTravelService.getTravelHomePage(promo, request, model, utm_source, utm_medium, utm_campaign, utm_content);
	}

	@RequestMapping(value = {"/{lang}/annual-travel-insurance/quote"})
	public ModelAndView prepareTravelPlan(
			@ModelAttribute("travelQuote") TravelQuoteBean travelQuote,
			BindingResult result, Model model, HttpServletRequest request) throws Exception {
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		
		UserRestURIConstants.setController("Travel");
		request.setAttribute("controller", UserRestURIConstants.getController());
		return annualTravelService.getTravelPlan(travelQuote, model, request);
	}

	@SuppressWarnings({ "unused", "rawtypes" })
	@RequestMapping(value = {"/{lang}/annual-travel-insurance/user-details"})
	public ModelAndView prepareYourDetails(
			@ModelAttribute("travelQuote") TravelQuoteBean travelQuote,
			BindingResult result, Model model, HttpServletRequest request) throws Exception {
		UserRestURIConstants.setController("Travel");
		
		HttpSession session = request.getSession();
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		if (session.getAttribute("token") == null) 
		{
			model.addAttribute("errMsgs", "Session Expired");
			return annualTravelService.getTravelHomePage((String)session.getAttribute("referralCode"), request, model, "", "", "", "");	
		}
		
		UserRestURIConstants.setController("Travel");
		request.setAttribute("controller", UserRestURIConstants.getController());
		
		String planName = WebServiceUtils.getParameterValue("planName", session, request);
		String planSummary = WebServiceUtils.getParameterValue(
				"selectedAmountDue", session, request);
		String selectPlanPremium = WebServiceUtils.getParameterValue(
				"selectPlanPremium", session, request);
		String selectPlanName = WebServiceUtils.getParameterValue(
				"selectPlanName", session, request);
		selectPlanName = planName;
		
		if (travelQuote.getTrLeavingDate() != null) {
			session.setAttribute("travelQuote", travelQuote);
		} else {
			travelQuote = (TravelQuoteBean) session.getAttribute("travelQuote");
			if(travelQuote == null){
				return getTravelHomePage((String)session.getAttribute("referralCode"), request, model, "", "", "", "");
			}				
		}
		try {

			request.setAttribute("travelQuote", travelQuote);
			model.addAttribute("planName", planName);
			
			model.addAttribute("selectPlanName", selectPlanName);
			QuoteDetails quoteDetails = (QuoteDetails)session.getAttribute("quoteDetails");
			if ("A".equals(selectPlanName)) {
				session.setAttribute("planSelected", "A");
				model.addAttribute("planDiscount", quoteDetails.getDiscountAmount()[0]);
				
				NumberFormat formatter = new DecimalFormat("#0.00");  
				
				String splanSummary = quoteDetails.getToalDue()[0];
				float fplanSummary = Float.parseFloat(splanSummary);
				quoteDetails.getToalDue()[0] = formatter.format(fplanSummary);
				model.addAttribute("planSummary", quoteDetails.getToalDue()[0]);
				
 
				String sgrossPremium = quoteDetails.getGrossPremium()[0];
				float grossPremium = Float.parseFloat(sgrossPremium);
				quoteDetails.getGrossPremium()[0] = formatter.format(grossPremium);
				
				model.addAttribute("planPremium", quoteDetails.getGrossPremium()[0]);
				
			} else {
				session.setAttribute("planSelected", "B");
				model.addAttribute("planDiscount", quoteDetails.getDiscountAmount()[1]);
				
				
				NumberFormat formatter = new DecimalFormat("#0.00");  
				
				String splanSummary = quoteDetails.getToalDue()[1];
				float fplanSummary = Float.parseFloat(splanSummary);
				quoteDetails.getToalDue()[1] = formatter.format(fplanSummary);
				model.addAttribute("planSummary", quoteDetails.getToalDue()[1]);
				
				
				String sgrossPremium = quoteDetails.getGrossPremium()[1];
				
				float grossPremium = Float.parseFloat(sgrossPremium);
				quoteDetails.getGrossPremium()[1] = formatter.format(grossPremium);
				
				model.addAttribute("planPremium", quoteDetails.getGrossPremium()[1]);
			}
			//travelQuote.setTotalAdultTraveller(travelQuote.getTotalAdultTraveller()	+ travelQuote.getTotalPersonalTraveller());
			request.getSession().setAttribute("departureDate",
					travelQuote.getTrLeavingDate());
			request.getSession().setAttribute("returnDate",
					travelQuote.getTrBackDate());
			String Url = UserRestURIConstants.GET_AGE_TYPE
					+ "?itemTable=AgeType";

			HashMap<String, String> header = new HashMap<String, String>(
					COMMON_HEADERS);
			
			String lang = UserRestURIConstants.getLanaguage(request);
			if (lang.equals("tc"))
				lang = "CN";
			
			header.put("language", WebServiceUtils
					.transformLanaguage(lang));
			
			if (request.getSession().getAttribute("username") != null) {
				header.put("userName", session.getAttribute("username")
						.toString());
				header.put("token", session.getAttribute("token").toString());
			}

			
			JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,
					Url, header, null);

			if (responseJsonObj.get("errMsgs") == null) {
				JSONArray jsonAgeTypeArray = (JSONArray) responseJsonObj
						.get("optionItemDesc");
				logger.info("GET_AGE_TYPE Response" + jsonAgeTypeArray);
				Map<String, String> mapAgeType = new HashMap<String, String>();
				Map<String, String> mapSelfType = new HashMap<String, String>();
				Map<String, String> mapChildType = new HashMap<String, String>();
				for (int i = 0; i < jsonAgeTypeArray.size(); i++) {
					JSONObject obj = (JSONObject) jsonAgeTypeArray.get(i);
					mapAgeType.put(checkJsonObjNull(obj, "itemCode"),
							checkJsonObjNull(obj, "itemDesc"));
				}
				Iterator iterator = mapAgeType.entrySet().iterator();
				while (iterator.hasNext()) {
					Map.Entry mapEntry = (Map.Entry) iterator.next();
					if (mapEntry.getKey().equals("2") || mapEntry.getKey().equals("3")) {
						mapSelfType.put((String)mapEntry.getKey(), (String)mapEntry.getValue());
					}
					
				}
				iterator = mapAgeType.entrySet().iterator();
				while (iterator.hasNext()) {
					Map.Entry mapEntry = (Map.Entry) iterator.next();
					if (mapEntry.getKey().equals("1")) {
						mapChildType.put((String)mapEntry.getKey(), (String)mapEntry.getValue());
					}
					
				}
				model.addAttribute("mapAgeType", mapAgeType);
				model.addAttribute("mapSelfType", mapSelfType);
				model.addAttribute("mapChildType", mapChildType);


				/*
				 * API Call for get Benifitiary Relationship
				 */

				String relationshipCode = UserRestURIConstants.GET_BENE_RELATIONSHIP_CODE
						+ "?itemTable=BeneRelationshipCode";

				JSONObject jsonRelationShipCode = restService.consumeApi(
						HttpMethod.GET, relationshipCode, header, null);

				if (responseJsonObj.get("errMsgs") == null) {
					JSONArray jsonRelationshipCode = (JSONArray) jsonRelationShipCode
							.get("optionItemDesc");
					logger.info("jsonRelationShipArray ====>>>>>>" + jsonRelationshipCode);

					Map<String, String> mapRelationshipCode = new LinkedHashMap<String, String>();
					for (int i = 0; i < jsonRelationshipCode.size(); i++) {
						JSONObject obj = (JSONObject) jsonRelationshipCode
								.get(i);
						mapRelationshipCode.put(
								checkJsonObjNull(obj, "itemCode"),
								checkJsonObjNull(obj, "itemDesc"));
					}
					model.addAttribute("mapRelationshipCode",
							mapRelationshipCode);

				}
			} else {
				model.addAttribute("errMsgs", responseJsonObj.get("errMsgs"));
				return new ModelAndView(UserRestURIConstants.getSitePath(request)
						+ "annualtravel/annual-travel-plan");		
			}

			model.addAttribute("planName", planName);
			model.addAttribute("planSummary", planSummary);
//			model.addAttribute("planPremium", selectPlanPremium);
			
			session.setAttribute("travelQuote", travelQuote); // vincent - fix back btn from 3rd page to 2nd page
			model.addAttribute("travelQuote", travelQuote);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errMsgs", "System Error");
			return new ModelAndView(UserRestURIConstants.getSitePath(request)
					+ "annualtravel/annual-travel-plan");		
		}
		Map<String,String> mapHkId = new TreeMap<>();

		String lang = UserRestURIConstants.getLanaguage(request);
		String hkIdLbl = "HKID";
		String passportLbl = "Passport";
		if("tc".equals(lang)){
			hkIdLbl = "香港身份證";
			passportLbl = "護照號碼";
		} else {
			hkIdLbl = "HKID";
			passportLbl = "Passport";
		}
		mapHkId.put("HKID", hkIdLbl);
		mapHkId.put("passport", passportLbl);		
		model.addAttribute("mapHkId", mapHkId);
		String pageTitle = WebServiceUtils.getPageTitle("page.travelUserDetails", UserRestURIConstants.getLanaguage(request));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.travelPlanSummary", UserRestURIConstants.getLanaguage(request));
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
		session.removeAttribute("travelCreatePolicy");
		
		return new ModelAndView(UserRestURIConstants.getSitePath(request)
				+ "annualtravel/annual-travel-plan-details");		
	}

	@RequestMapping(value = { "/annual-travel-temp-save"})
	@ResponseBody
	public String travelTempSave(
			@ModelAttribute("frmYourDetails") PlanDetailsForm planDetailsForm,
			BindingResult result, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("travel-temp-save", planDetailsForm);
		return "success";
		
	}
	
	
	@SuppressWarnings({ "unchecked", "unused" })
	@RequestMapping(value = {"/{lang}/annual-travel-insurance/summary"})
	public ModelAndView prepareSummary(
			@ModelAttribute("frmYourDetails") PlanDetailsForm planDetailsForm,
			BindingResult result, Model model, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		UserRestURIConstants.setController("Travel");
		if (planDetailsForm.getDepartureDate() != null) {
			session.removeAttribute("travelCreatePolicy");
			
		} else {
			JSONObject parameters = new JSONObject();
			JSONObject responsObject = new JSONObject();
			String creditCardNo = (String)session.getAttribute("creditCardNo");
			
			HashMap<String, String> header = new HashMap<String, String>(
					COMMON_HEADERS);
			header.put("userName", session.getAttribute("username").toString());
			header.put("token", session.getAttribute("token").toString());
			header.put("language", WebServiceUtils
					.transformLanaguage(UserRestURIConstants
							.getLanaguage(request)));
			
			parameters.put("referenceNo", session.getAttribute("finalizeReferenceNo"));
			parameters.put("transactionNumber", session.getAttribute("transNo"));
			parameters.put("transactionDate", session.getAttribute("transactionDate"));
			parameters.put("paymentFail", "1");
			
			if (creditCardNo !=null) { 
				try {
					parameters
							.put("creditCardNo", Methods.decryptStr((String)session.getAttribute("creditCardNo")));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			parameters.put("expiryDate", session.getAttribute("expiryDate"));
			logger.info("TRAVEL_FINALIZE_POLICY Request " + JsonUtils.jsonPrint(parameters));
			responsObject = restService.consumeApi(HttpMethod.POST, UserRestURIConstants.TRAVEL_FINALIZE_POLICY, header, parameters);
			logger.info("TRAVEL_FINALIZE_POLICY Response " + JsonUtils.jsonPrint(responsObject));
			
		}
		
		String hkId = "hkId", passId = "passport";
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		
		TravelQuoteBean travelQuote = (TravelQuoteBean) session.getAttribute("travelQuote");
		String planSelected = (String) session.getAttribute("planSelected");
		if (session.getAttribute("token") == null) {
			model.addAttribute("errMsgs", "Session Expired");
			return getTravelHomePage((String)session.getAttribute("referralCode"), request, model, "", "", "", "");	
		}
		if(travelQuote == null || planSelected == null){
			return getTravelHomePage((String)session.getAttribute("referralCode"), request, model, "", "", "", "");		
		}
		UserRestURIConstants.setController("Travel");
		request.setAttribute("controller", UserRestURIConstants.getController());
		 
		
		UserDetails userDetails = new UserDetails();
		String dueAmount = WebServiceUtils.getParameterValue("finalDueAmount",session, request);
		session.setAttribute("dueAmount", dueAmount);
		
		String selectPlanName = WebServiceUtils.getParameterValue("selectedPlanName", session, request);
		String deaprtureDate = DateApi.pickDate1((String)session.getAttribute("departureDate"));
		String returnDate = DateApi.pickDate1((String) session.getAttribute("returnDate"));
		String applicantFullName = WebServiceUtils.getParameterValue("fullName", session, request);
		String applicantHKID = WebServiceUtils.getParameterValue("hkid", session, request);
		String applicantMobNo = WebServiceUtils.getParameterValue("mobileNo", session, request);
		String emailAddress = WebServiceUtils.getParameterValue("emailAddress",	session, request);
		String selectedHkidPassApplicant = "HKID";
		String dob = WebServiceUtils.getParameterValue("applicantDob",	session, request);
		dob = DateApi.pickDate1(dob);
		
		String totalTravellingDays = WebServiceUtils.getParameterValue("totalTravellingDays", session, request);
				
		if (planDetailsForm.getDepartureDate() != null) {
			session.setAttribute("travelPlanDetailsForm", planDetailsForm);
		} else {
			planDetailsForm = (PlanDetailsForm) session
					.getAttribute("travelPlanDetailsForm");
		}
		
		userDetails.setFullName(applicantFullName);
		userDetails.setHkid(applicantHKID);
		userDetails.setMobileNo(applicantMobNo);
		userDetails.setEmailAddress(emailAddress);
		userDetails.setDob(dob);
        final String BENE_RELATIONSHIP_SELF = "SE";

		JSONObject parameters = new JSONObject();
		parameters.put("planCode", session.getAttribute("planSelected"));
		parameters.put("commencementDate", deaprtureDate);
		parameters.put("expiryDate", returnDate);
		JSONArray insured = new JSONArray();

		String langSelected = UserRestURIConstants.getLanaguage(request);
		
		for (int inx = 0; inx < planDetailsForm.getTotalPersonalTraveller(); inx++) {
			planDetailsForm.setPersonalAgeRangeName(WebServiceUtils.getAgeRangeNames(planDetailsForm.getPersonalAgeRange(), langSelected));
		}
		
		String HKID = "HKID";
 		for (int inx = 0; inx < planDetailsForm.getTotalPersonalTraveller(); inx++) {
			JSONObject beneficiary = new JSONObject();
			JSONObject personal = new JSONObject();
		
			personal.put("name", StringHelper.emptyIfNull( planDetailsForm.getPersonalName()[inx] ).toUpperCase() );
			personal.put("ageRange", StringHelper.emptyIfNull( planDetailsForm.getPersonalAgeRange()[inx] ).toUpperCase() );
			
			
			personal.put(hkId,	checkPasswortAndHkid(hkId,
					HKID,
					planDetailsForm.getPersonalHKID()[inx])
			 );
			personal.put(passId, checkPasswortAndHkid(passId,
					HKID,
					planDetailsForm.getPersonalHKID()[inx])
			 );

			
			personal.put(hkId,	checkPasswortAndHkid(hkId,
					HKID,
					planDetailsForm.getPersonalHKID()[inx])
			);
					 
			personal.put(passId, checkPasswortAndHkid(passId,
					HKID,
					planDetailsForm.getPersonalHKID()[inx])
			);


			if (inx != 0) {
				personal.put("relationship", "RF");
				if (planDetailsForm.getPersonalBenificiaryFullName().length > 0) {
					if (!planDetailsForm.getPersonalBenificiaryFullName()[inx].isEmpty() 
							&& BENE_RELATIONSHIP_SELF.compareToIgnoreCase(planDetailsForm.getPersonalBeneficiary()[inx]) != 0) {// If have beneficiary
						beneficiary.put("name", StringHelper.emptyIfNull( planDetailsForm.getPersonalBenificiaryFullName()[inx] ).toUpperCase());
						beneficiary.put(hkId,
										checkPasswortAndHkid(
												hkId,
												HKID,
												planDetailsForm.getPersonalBenificiaryHkid()[inx]));
						beneficiary.put(passId,
										checkPasswortAndHkid(
												passId,
												HKID,
												planDetailsForm.getPersonalBenificiaryHkid()[inx]));
						beneficiary.put("relationship", StringHelper.emptyIfNull( planDetailsForm.getPersonalBeneficiary()[inx] ).toUpperCase());
						personal.put("beneficiary", beneficiary);
					} else {
						beneficiary.put("name", StringHelper.emptyIfNull( planDetailsForm.getPersonalName()[inx] ).toUpperCase());
						beneficiary.put(hkId,
										checkPasswortAndHkid(
												hkId,
												HKID,
												planDetailsForm.getPersonalHKID()[inx]));
						beneficiary.put(passId,
										checkPasswortAndHkid(
												passId,
												HKID,
												planDetailsForm.getPersonalHKID()[inx]));
						beneficiary.put("relationship", "SE");
						personal.put("beneficiary", beneficiary);
						
						planDetailsForm.getPersonalBenificiaryFullName()[inx] = "";
						planDetailsForm.getPersonalBenificiaryHkid()[inx] = "";
						
					}
				} else {
					beneficiary.put("name", StringHelper.emptyIfNull( planDetailsForm.getAdultName()[inx] ).toUpperCase());
					beneficiary
							.put(hkId,
									checkPasswortAndHkid(hkId, 
											HKID,
											planDetailsForm.getPersonalHKID()[inx]));
					beneficiary
							.put(passId,
									checkPasswortAndHkid(
											passId,
											HKID,
											planDetailsForm.getPersonalHKID()[inx]));
					beneficiary.put("relationship", "SE");
					personal.put("beneficiary", beneficiary);				
				}
			} else {
                String personalID;
                if(personal.get("hkId") != null && !personal.get("hkId").toString().isEmpty()){
                    personalID = personal.get("hkId").toString();
                }else if(personal.get("passport") != null && !personal.get("passport").toString().isEmpty()){
                    personalID = personal.get("passport").toString();
                }else {
                    personalID = "";
                }
                personal.put("relationship", ValidationUtils.getRelationshipById(applicantHKID, personalID));
                
				if (planDetailsForm.getPersonalBenificiaryFullName().length > 0) {
					if (!planDetailsForm.getPersonalBenificiaryFullName()[inx].isEmpty()
							&& BENE_RELATIONSHIP_SELF.compareToIgnoreCase(planDetailsForm.getPersonalBeneficiary()[inx]) != 0) {// If have beneficiary
						beneficiary.put("name", StringHelper.emptyIfNull( planDetailsForm.getPersonalBenificiaryFullName()[inx] ).toUpperCase());
						beneficiary
								.put(hkId,
										checkPasswortAndHkid(
												hkId,
												HKID,
												planDetailsForm.getPersonalBenificiaryHkid()[inx]));
						beneficiary
								.put(passId,
										checkPasswortAndHkid(
												passId,
												HKID,
												planDetailsForm.getPersonalBenificiaryHkid()[inx]));
						beneficiary.put("relationship", planDetailsForm.getPersonalBeneficiary()[inx]);
						personal.put("beneficiary", beneficiary);
					} else {// If don't have beneficiary then
						beneficiary.put("name", StringHelper.emptyIfNull( planDetailsForm.getPersonalName()[inx] ).toUpperCase());
						beneficiary
						.put(hkId,
								checkPasswortAndHkid(hkId, 
										HKID,
										planDetailsForm.getPersonalHKID()[inx]));
						beneficiary
						.put(passId,
								checkPasswortAndHkid(
										passId,
										HKID,
										planDetailsForm.getPersonalHKID()[inx]));
						beneficiary.put("relationship", "SE");
						personal.put("beneficiary", beneficiary);
						
						planDetailsForm.getPersonalBenificiaryFullName()[inx] = "";
					}
				} else {
					beneficiary.put("name", StringHelper.emptyIfNull( planDetailsForm.getPersonalName()[inx] ).toUpperCase());
					beneficiary.put("hkId", 
							checkPasswortAndHkid(
									"hkId",
									HKID,
									planDetailsForm.getPersonalHKID()[inx]));
					beneficiary.put("passport",
							checkPasswortAndHkid(
									"passport",
									HKID,
									planDetailsForm.getPersonalHKID()[inx]));
					beneficiary.put("relationship", "SE");
					personal.put("beneficiary", beneficiary);
					
				}
			}
							
			insured.add(personal);
			
			String[] relationships = planDetailsForm.getPersonalRelationDesc();
			if(relationships == null){
				relationships = new String[planDetailsForm.getTotalPersonalTraveller()];
			}
			String[] beneRelationships = planDetailsForm.getPersonalBeneRelationDesc();
			if(beneRelationships == null){
				beneRelationships = new String[planDetailsForm.getTotalPersonalTraveller()];
			}
			planDetailsForm.setPersonalRelationDesc(WebServiceUtils.getInsuredRelationshipDesc(relationships, langSelected, personal.get("relationship").toString(), inx));
			planDetailsForm.setPersonalBeneRelationDesc(WebServiceUtils.getBeneRelationshipDesc(beneRelationships, langSelected, beneficiary.get("relationship").toString(), inx));			
		}
		// personal

		parameters.put("insured", insured);

		/* parameters.put("referralCode", userReferralCode); */
		parameters.put("referralCode", session.getAttribute("referralCode"));

		String name     = StringHelper.emptyIfNull( applicantFullName ).toUpperCase();
		emailAddress 	= StringHelper.emptyIfNull( emailAddress ).toUpperCase();
		applicantHKID   = StringHelper.emptyIfNull( applicantHKID ).toUpperCase();
		
		JSONObject applicantJsonObj = new JSONObject();
		applicantJsonObj.put("name", name);
		applicantJsonObj.put("gender", "M");
		
		if (selectedHkidPassApplicant.toUpperCase().equals("HKID")) {
			applicantJsonObj.put("hkId", applicantHKID);
			applicantJsonObj.put("passport", "");	
		} else {
			applicantJsonObj.put("hkId", "");
			applicantJsonObj.put("passport", applicantHKID);
		}
			
		
		
		
		
		applicantJsonObj.put("dob", dob);
		applicantJsonObj.put("mobileNo", applicantMobNo);
		applicantJsonObj.put("optIn1", planDetailsForm.getCheckbox3());
		applicantJsonObj.put("optIn2", planDetailsForm.getCheckbox4());
		applicantJsonObj.put("email", emailAddress);

		parameters.put("applicant", applicantJsonObj);

		JSONObject addressJsonObj = new JSONObject();
		parameters.put("address", addressJsonObj);


		HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
		header.put("userName", (String) session.getAttribute("username"));
		header.put("token", (String) session.getAttribute("token"));
		header.put("language", WebServiceUtils
				.transformLanaguage(UserRestURIConstants.getLanaguage(request)));
		//TO ENFORCE THE POLICY IS CREATED AND MAKE SURE THE TRANSACTION NUMBER IS NOT REUSED
		
		CreatePolicy createPolicy = (CreatePolicy)session.getAttribute("travelCreatePolicy");
		
		JSONObject responsObject = new JSONObject();
 		if (createPolicy == null) {

 			logger.info("TRAVEL_CREATE_POLICY Request " + JsonUtils.jsonPrint(parameters));
			responsObject = restService.consumeApi(HttpMethod.PUT,
					UserRestURIConstants.TRAVEL_CREATE_POLICY, header,
					parameters);
			logger.info("TRAVEL_CREATE_POLICY Response " + JsonUtils.jsonPrint(responsObject));
			createPolicy = new CreatePolicy();

			String finalizeReferenceNo = "";

			if (responsObject.get("errMsgs") == null) {
				JSONObject jsonPriceInfoA = (JSONObject) responsObject
						.get("priceInfoA");

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
						UserRestURIConstants.TRAVEL_CONFIRM_POLICY, header,
						confirmPolicyParameter);
				logger.info("Response From Confirm Travel Policy " + JsonUtils.jsonPrint(jsonResponse));

				createPolicy.setSecureHash(checkJsonObjNull(jsonResponse,
						"secureHash"));
				createPolicy.setTransactionNo(checkJsonObjNull(jsonResponse,
						"transactionNumber"));
				createPolicy.setTransactionDate(checkJsonObjNull(jsonResponse,
						"transactionDate"));
				session.setAttribute("travelCreatePolicy", createPolicy);
				model.addAttribute(createPolicy);
				session.setAttribute("createPolicy", createPolicy);
			} else {
				model.addAttribute("errMsgs", responsObject.get("errMsgs"));
				return new ModelAndView("redirect:" + "/" + (String) session.getAttribute("language") + "/travel-insurance/user-details");
			}

		} 
		session.setAttribute("finalizeReferenceNo",
				createPolicy.getReferenceNo());
		session.setAttribute("transactionDate",
				createPolicy.getTransactionDate());
		session.setAttribute("transNo", createPolicy.getTransactionNo());

		TravelQuoteBean travelBean = new TravelQuoteBean();
		travelBean.setTrLeavingDate(deaprtureDate);
		travelBean.setTrBackDate(returnDate);
		travelBean.setTotalTraveller(planDetailsForm.getTotalAdultTraveller()
				+ planDetailsForm.getTotalChildTraveller()
				+ planDetailsForm.getTotalOtherTraveller()
				+ planDetailsForm.getTravellerCount());
		String path = request.getRequestURL().toString();
		model.addAttribute("selectPlanName", selectPlanName);
		model.addAttribute("dueAmount", dueAmount.replace(",", ""));
		model.addAttribute("totalTravellingDays", totalTravellingDays);
		model.addAttribute("userDetails", userDetails);
		model.addAttribute("travelBean", travelBean);
		model.addAttribute("planDetailsForm", planDetailsForm);
		model.addAttribute("path",
				path.replace("travel-summary", "confirmation?utm_nooverride=1"));
		model.addAttribute("path",
				path.replace("travel-summary", "confirmation?utm_nooverride=1"));
		
		model.addAttribute("failurePath", path + "?paymentGatewayFlag=true");
        String paymentGatewayFlag =request.getParameter("paymentGatewayFlag");
        String errorMsg =request.getParameter("errorMsg");
        if(paymentGatewayFlag != null && paymentGatewayFlag.compareToIgnoreCase("true") == 0 && errorMsg == null){            
            errorMsg = "Payment failure";     
        }        
        model.addAttribute("errormsg", errorMsg);        
        model.addAttribute("referralCode", session.getAttribute("referralCode"));        
        
        String pageTitle = WebServiceUtils.getPageTitle("page.travelPlanSummary", UserRestURIConstants.getLanaguage(request));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.travelPlanSummary", UserRestURIConstants.getLanaguage(request));
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
		return new ModelAndView(UserRestURIConstants.getSitePath(request)
				+ "/annualtravel/annual-travel-summary-payment");	
	}

	@SuppressWarnings({ "unchecked"})
	@RequestMapping(value = {"/{lang}/annual-travel-insurance/confirmation"})
	public String processPayment(Model model, HttpServletRequest request,
			@RequestParam(required = false) String Ref ) {
		UserRestURIConstants.setController("Travel");
		
		HttpSession session = request.getSession();
		if (session.getAttribute("token") == null) {
			model.addAttribute("errormsg", "Session Expired");
			return UserRestURIConstants.getSitePath(request)
					+ "annualtravel/annual-travel-confirmation";
		}
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		UserRestURIConstants.setController("Travel");
		request.setAttribute("controller", UserRestURIConstants.getController());
		

		JSONObject responsObject = new JSONObject();

		try {
			JSONObject parameters = new JSONObject();
			String requestNo = (String) session.getAttribute("transNo");
			String email = (String) session.getAttribute("emailAddress");
			parameters.put("referenceNo",
					session.getAttribute("finalizeReferenceNo"));
			parameters
					.put("transactionNumber", session.getAttribute("transNo"));
			parameters.put("transactionDate",
					session.getAttribute("transactionDate"));
			parameters.put("paymentFail", "0");
			
			String creditCardNo = (String)session.getAttribute("creditCardNo");
			
			if (creditCardNo !=null) { 
				parameters
						.put("creditCardNo", Methods.decryptStr((String)session.getAttribute("creditCardNo"))); 
			} else {
				
				model.addAttribute("policyNo", StringHelper.emptyIfNull((String)session.getAttribute("policyNo")));
				
				model.addAttribute("emailAddress",
						session.getAttribute("emailAddress"));
				
				
				model.addAttribute("dueAmount", session.getAttribute("dueAmount"));
				
				model.addAttribute("referralCode",
						session.getAttribute("referralCode"));
				String pageTitle = WebServiceUtils.getPageTitle("page.travelPlanConfirmation", UserRestURIConstants.getLanaguage(request));
				String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.travelPlanConfirmation", UserRestURIConstants.getLanaguage(request));
				model.addAttribute("pageTitle", pageTitle);
				model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
				return UserRestURIConstants.getSitePath(request)
						+ "annualtravel/annual-travel-confirmation";
			}
				
			parameters.put("expiryDate", session.getAttribute("expiryDate"));

			HashMap<String, String> header = new HashMap<String, String>(
					COMMON_HEADERS);
			header.put("userName", session.getAttribute("username").toString());
			header.put("token", session.getAttribute("token").toString());
			header.put("language", WebServiceUtils
					.transformLanaguage(UserRestURIConstants
							.getLanaguage(request)));
			logger.info("TRAVEL_FINALIZE_POLICY Request " + JsonUtils.jsonPrint(parameters));
			responsObject = restService.consumeApi(HttpMethod.POST,
					UserRestURIConstants.TRAVEL_FINALIZE_POLICY, header,
					parameters);
			logger.info("TRAVEL_FINALIZE_POLICY Response " + responsObject);
			
			if (responsObject.get("errMsgs") == null) {
				session.removeAttribute("creditCardNo");
				session.removeAttribute("expiryDate");
				session.removeAttribute("upgradeTotalTravallingDays");
				session.removeAttribute("upgradeTotalTravallingDays");
				session.removeAttribute("upgradeUserDetails");
				session.removeAttribute("upgradePlandetailsForm");
				session.removeAttribute("upgradeCreateFlightPolicy");
				session.removeAttribute("upgradeSelectPlanName");
				session.removeAttribute("upgradeDueAmount");
				session.removeAttribute("travelQuote");
				session.removeAttribute("travelCreatePolicy");
				session.removeAttribute("travel-temp-save");
				session.setAttribute("policyNo", responsObject.get("policyNo"));
				model.addAttribute("policyNo", responsObject.get("policyNo"));
				model.addAttribute("emailAddress",
						session.getAttribute("emailAddress"));
				model.addAttribute("referralCode",
						session.getAttribute("referralCode"));
				String pageTitle = WebServiceUtils.getPageTitle("page.travelPlanConfirmation", UserRestURIConstants.getLanaguage(request));
				String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.travelPlanConfirmation", UserRestURIConstants.getLanaguage(request));
				session.removeAttribute("referralCode");  // vincent - remove session attribute "referral code" if success
				model.addAttribute("utm_nooverride", 1);
				model.addAttribute("pageTitle", pageTitle);
				model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
				return UserRestURIConstants.getSitePath(request)
						+ "annualtravel/annual-travel-confirmation";
			} else {
				if (responsObject.get("errMsgs").toString().contains("invalid payment amount")) {
					model.addAttribute("errorHeader1", "Invalid Payment Amount");
					model.addAttribute("errorDescription1", "There is a mismatch of the payment amount with the policy");
					model.addAttribute("errorHeader2", "Please DO NOT retry the payment");
					model.addAttribute("errorDescription2", "Contact our CS at 3123 3123");
				} else {
					model.addAttribute("errorHeader1", UserRestURIConstants.ERROR_HEADER1_1 + email + UserRestURIConstants.ERROR_HEADER1_2);
					model.addAttribute("errorDescription1", UserRestURIConstants.ERROR_DESCRIPTION1 + " " + requestNo);
					model.addAttribute("errorHeader2", UserRestURIConstants.ERROR_HEADER2_1 + " " + email + UserRestURIConstants.ERROR_HEADER2_2);
					model.addAttribute("errorDescription2", UserRestURIConstants.ERROR_DESCRIPTION2 + " " + requestNo);
				}		

				
				
				return UserRestURIConstants.getSitePath(request)
						+ "error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			
			model.addAttribute("errMsgs", e.toString());
			return UserRestURIConstants.getSitePath(request)
					+ "annualtravel/annual-travel-summary-payment";
		}
	}
	
	public String checkJsonObjNull(JSONObject obj, String checkByStr) {
		if (obj.get(checkByStr) != null) {
			return obj.get(checkByStr).toString();
		} else {
			return "";
		}
	}

	public String checkStringNull(String checkByStr) {
		if (checkByStr != null) {
			return checkByStr.toString();
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