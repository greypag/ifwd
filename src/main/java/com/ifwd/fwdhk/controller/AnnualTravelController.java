package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.text.DecimalFormat;
import java.text.NumberFormat;
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
import com.ifwd.fwdhk.model.PlanDetailsForm;
import com.ifwd.fwdhk.model.QuoteDetails;
import com.ifwd.fwdhk.model.TravelQuoteBean;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.services.AnnualTravelService;
import com.ifwd.fwdhk.util.DateApi;
import com.ifwd.fwdhk.util.JsonUtils;
import com.ifwd.fwdhk.util.Methods;
import com.ifwd.fwdhk.util.StringHelper;
import com.ifwd.fwdhk.util.WebServiceUtils;

@Controller
public class AnnualTravelController {
	
	private final static Logger logger = LoggerFactory.getLogger(AnnualTravelController.class);

	@Autowired
	private RestServiceDao restService;

	@Autowired
	private AnnualTravelService annualTravelService;
	
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
			return new TravelController().getTravelHomePage((String)session.getAttribute("referralCode"), request, model, "", "", "", "");	
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
				return new TravelController().getTravelHomePage((String)session.getAttribute("referralCode"), request, model, "", "", "", "");
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
	
	
	@SuppressWarnings({"unused" })
	@RequestMapping(value = {"/{lang}/annual-travel-insurance/summary"})
	public ModelAndView prepareSummary(
			@ModelAttribute("frmYourDetails") PlanDetailsForm planDetailsForm,
			BindingResult result, Model model, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		
		TravelQuoteBean travelQuote = (TravelQuoteBean) session.getAttribute("travelQuote");
		String planSelected = (String) session.getAttribute("planSelected");
		if (session.getAttribute("token") == null) {
			model.addAttribute("errMsgs", "Session Expired");
			return new TravelController().getTravelHomePage((String)session.getAttribute("referralCode"), request, model, "", "", "", "");	
		}
		if(travelQuote == null || planSelected == null){
			return new TravelController().getTravelHomePage((String)session.getAttribute("referralCode"), request, model, "", "", "", "");		
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
				
		planDetailsForm = (PlanDetailsForm) session.getAttribute("travelPlanDetailsFormBySummary");
		
		userDetails.setFullName(applicantFullName);
		userDetails.setHkid(applicantHKID);
		userDetails.setMobileNo(applicantMobNo);
		userDetails.setEmailAddress(emailAddress);
		userDetails.setDob(dob);
        final String BENE_RELATIONSHIP_SELF = "SE";

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
		model.addAttribute("path", path.replace("travel-summary", "confirmation?utm_nooverride=1"));
		model.addAttribute("path", path.replace("travel-summary", "confirmation?utm_nooverride=1"));
		model.addAttribute("failurePath", path + "?paymentGatewayFlag=true");
        String paymentGatewayFlag =request.getParameter("paymentGatewayFlag");
        String errorMsg =request.getParameter("errorMsg");
        if(paymentGatewayFlag != null && paymentGatewayFlag.compareToIgnoreCase("true") == 0 && errorMsg == null){            
            errorMsg = "Payment failure";     
        }        
        model.addAttribute("errormsg", errorMsg);        
        model.addAttribute("referralCode", session.getAttribute("referralCode"));
        model.addAttribute(session.getAttribute("createPolicy"));
        
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