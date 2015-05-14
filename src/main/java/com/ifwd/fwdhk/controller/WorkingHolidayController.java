package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;
import groovyjarjarantlr.StringUtils;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.joda.time.Days;
import org.joda.time.LocalDate;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.model.CreatePolicy;
import com.ifwd.fwdhk.model.DistrictBean;
import com.ifwd.fwdhk.model.PlanDetailsForm;
import com.ifwd.fwdhk.model.QuoteDetails;
import com.ifwd.fwdhk.model.TravelQuoteBean;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.model.WorkingHolidayQuoteBean;
import com.ifwd.fwdhk.model.WorkingHolidayQuoteDetails;
import com.ifwd.fwdhk.services.HomeCareService;
import com.ifwd.fwdhk.services.HomeCareServiceImpl;
import com.ifwd.fwdhk.util.DateApi;
import com.ifwd.fwdhk.util.StringHelper;
import com.ifwd.fwdhk.util.WebServiceUtils;
import com.ifwd.fwdhk.utils.services.SendEmailDao;

@Controller
public class WorkingHolidayController {

	@Autowired
	private RestServiceDao restService;

	@Autowired
	private SendEmailDao sendEmail;

	@Autowired
	private MessageSource messageSource;
	
	@RequestMapping(value = {"/{lang}/workingholiday", "/{lang}/workingholiday-insurance"})
	public ModelAndView getWorkingHolidayHomePage(@RequestParam(required = false) final String promo, HttpServletRequest request, Model model) {

		UserRestURIConstants.setController("Working");
		request.setAttribute("controller", UserRestURIConstants.getController());
		//return UserRestURIConstants.checkLangSetPage(request) + "workingholiday/workingholiday";
		
		HttpSession session = request.getSession();
		session.setAttribute("referralCode", StringHelper.emptyIfNull(promo));
		WorkingHolidayQuoteBean workingholidayQuote;
		
		workingholidayQuote = (WorkingHolidayQuoteBean) session.getAttribute("workingholidayQuote");
		
		if(workingholidayQuote == null){
			workingholidayQuote = new WorkingHolidayQuoteBean();
			
			workingholidayQuote.setTotalPersonalWorkingHolidayer(1);
			workingholidayQuote.setTotalAdultWorkingHolidayer(1);
			workingholidayQuote.setTotalChildWorkingHolidayer(1);
			workingholidayQuote.setTotalOtherWorkingHolidayer(0);
			workingholidayQuote.setPlanSelected("personal");
		}
		else{
			System.out.println("Plan selected : "+workingholidayQuote.getPlanSelected());
		}
		
		
		model.addAttribute("workingholidayQuote", workingholidayQuote);
		String pageTitle = WebServiceUtils.getPageTitle("page.workingholiday", UserRestURIConstants.getLanaguage(request));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.workingholiday", UserRestURIConstants.getLanaguage(request));
		
		String ogTitle = "";
		String ogType = "";
		String ogUrl = "";
		String ogImage = "";
		String ogDescription = "";
		System.out.println("working holiday path " + request.getRequestURI().toString());
		if (request.getRequestURI().toString().equals(request.getContextPath() + "/tc/workingholiday-insurance/sharing/") || request.getRequestURI().toString().equals(request.getContextPath() + "/en/workingholiday-insurance/sharing/")) 
		{
			ogTitle = WebServiceUtils.getPageTitle("workingholiday.og.title", UserRestURIConstants.getLanaguage(request));
			ogType = WebServiceUtils.getPageTitle("workingholiday.og.type", UserRestURIConstants.getLanaguage(request));
			ogUrl = WebServiceUtils.getPageTitle("workingholiday.og.url", UserRestURIConstants.getLanaguage(request));
			ogImage = WebServiceUtils.getPageTitle("workingholiday.og.image", UserRestURIConstants.getLanaguage(request));
			ogDescription = WebServiceUtils.getPageTitle("workingholiday.og.description", UserRestURIConstants.getLanaguage(request));
		} else {
			ogTitle = WebServiceUtils.getPageTitle("workingholiday.sharing.og.title", UserRestURIConstants.getLanaguage(request));
			ogType = WebServiceUtils.getPageTitle("workingholiday.sharing.og.type", UserRestURIConstants.getLanaguage(request));
			ogUrl = WebServiceUtils.getPageTitle("workingholiday.sharing.og.url", UserRestURIConstants.getLanaguage(request));
			ogImage = WebServiceUtils.getPageTitle("workingholiday.sharing.og.image", UserRestURIConstants.getLanaguage(request));
			ogDescription = WebServiceUtils.getPageTitle("workingholiday.sharing.og.description", UserRestURIConstants.getLanaguage(request));
			
		}
		
		
		/*String pageTitle = WebServiceUtils.getPageTitle("page.workingholiday", UserRestURIConstants.getLanaguage(request));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.workingholiday", UserRestURIConstants.getLanaguage(request));
		String ogTitle = WebServiceUtils.getPageTitle("workingholiday.og.title", UserRestURIConstants.getLanaguage(request));
		String ogType = WebServiceUtils.getPageTitle("workingholiday.og.type", UserRestURIConstants.getLanaguage(request));
		String ogUrl = WebServiceUtils.getPageTitle("workingholiday.og.url", UserRestURIConstants.getLanaguage(request));
		String ogImage = WebServiceUtils.getPageTitle("workingholiday.og.image", UserRestURIConstants.getLanaguage(request));
		String ogDescription = WebServiceUtils.getPageTitle("workingholiday.og.description", UserRestURIConstants.getLanaguage(request));*/
		
		
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
		model.addAttribute("ogTitle", ogTitle);
		model.addAttribute("ogType", ogType);
		model.addAttribute("ogUrl", ogUrl);
		model.addAttribute("ogImage", ogImage);
		model.addAttribute("ogDescription", ogDescription);
		
		return new ModelAndView(UserRestURIConstants.getSitePath(request) + "workingholiday/workingholiday");			
	}
	
	
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value = {"/{lang}/getWorkingHolidayQuote", "/{lang}/workingholiday-insurance/quote"})
	public ModelAndView prepareWorkingHolidayPlan(
			@ModelAttribute("workingholidayQuote") WorkingHolidayQuoteBean workingholidayQuote,
			BindingResult result, Model model, HttpServletRequest request) {
		
		System.out.println("PERSONAL " + workingholidayQuote.getTotalPersonalWorkingHolidayer());
		System.out.println("ADULT " + workingholidayQuote.getTotalAdultWorkingHolidayer());
		System.out.println("CHILD " + workingholidayQuote.getTotalChildWorkingHolidayer());
		System.out.println("OTHER " + workingholidayQuote.getTotalOtherWorkingHolidayer());
		
		
		
		System.out.println("LeavingDate " + workingholidayQuote.getTrLeavingDate());
		System.out.println("BackDate " + workingholidayQuote.getTrBackDate());
		
		UserRestURIConstants.setController("Working");
		request.setAttribute("controller", UserRestURIConstants.getController());
		HttpSession session = request.getSession();
		if (workingholidayQuote.getTrLeavingDate() != null) {
			session.setAttribute("workingholidayQuote", workingholidayQuote);
		} else {
			workingholidayQuote = (WorkingHolidayQuoteBean) session.getAttribute("workingholidayQuote");
			if(workingholidayQuote == null){
				return getWorkingHolidayHomePage((String)session.getAttribute("referralCode"), request, model);		
			}				
		}
		try {
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

			int days = 0;

			/* Calculate total Days */
			Date dateD1 = new Date(workingholidayQuote.getTrLeavingDate());
			Date dateD2 = new Date(workingholidayQuote.getTrBackDate());
			LocalDate commencementDate = new LocalDate(dateD1);
			LocalDate expiryDate = new LocalDate(dateD2);
			days = Days.daysBetween(commencementDate, expiryDate).getDays();
			workingholidayQuote.setTotalWorkingHolidayingDays(days + 1);

			int otherCount = 0, childCount = 0, adultCount = 0;
			boolean spouseCover = false, selfCover = false;
			if (workingholidayQuote.getPlanSelected().equals("personal")) {
				selfCover = true;
				spouseCover = false;
				otherCount = workingholidayQuote.getTotalPersonalWorkingHolidayer();
				workingholidayQuote.setTotalChildWorkingHolidayer(0);
				workingholidayQuote.setTotalAdultWorkingHolidayer(0);
				workingholidayQuote.setTotalOtherWorkingHolidayer(otherCount - 1);
				otherCount = workingholidayQuote.getTotalOtherWorkingHolidayer();

			} else {
				workingholidayQuote.setTotalPersonalWorkingHolidayer(0);
				adultCount = workingholidayQuote.getTotalAdultWorkingHolidayer();
				childCount = workingholidayQuote.getTotalChildWorkingHolidayer();
				otherCount = workingholidayQuote.getTotalOtherWorkingHolidayer();
				selfCover = true;
				if (adultCount > 1) {
					spouseCover = true;
				} else {
					spouseCover = false;
				}
			}
			
			WorkingHolidayQuoteBean workingholidayQuoteCount = new WorkingHolidayQuoteBean();
			workingholidayQuoteCount.setSelfCover(selfCover);
			workingholidayQuoteCount.setSpouseCover(spouseCover);
			workingholidayQuoteCount.setTotalChildWorkingHolidayer(childCount);
			workingholidayQuoteCount.setTotalOtherWorkingHolidayer(otherCount);
			session.setAttribute("workingholidayQuoteCount", workingholidayQuoteCount);
			
			System.out.println("------------------------------------------------------------");
			System.out.println("CALLING API");
			System.out.println("SELF COVER " + selfCover);
			System.out.println("SPOUSE COVER " + spouseCover);
			System.out.println("CHILD COUNT " + childCount);
			System.out.println("OTHER COUNT " + otherCount);		
			System.out.print("------------------------------------------------------------");
			
			session.setAttribute("planSelected", workingholidayQuote.getPlanSelected());
			String Url = UserRestURIConstants.WORKINGHOLIDAY_GET_QUOTE + "?planCode=WorkingHoliday"
					+ "&commencementDate=" + commencementDate + "&referralCode=" + (String) session.getAttribute("referralCode");

			System.out.println("Travel Quote user " + Url);

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

			System.out.println("Get Working Holiday Quotes API " + responseJsonObj);
			if (responseJsonObj.get("errMsgs") == null) {
				QuoteDetails quoteDetails = new QuoteDetails();
				quoteDetails.setPlanSelected(workingholidayQuote.getPlanSelected());
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

				request.setAttribute("quoteDetails", quoteDetails);
				model.addAttribute("quoteDetails", quoteDetails);
				session.setAttribute("quoteDetails", quoteDetails);
				model.addAttribute("workingholidayQuoteBean", workingholidayQuote);
			} else {
				model.addAttribute("errMsgs", responseJsonObj.get("errMsgs"));
				return new ModelAndView(UserRestURIConstants.getSitePath(request)
						+ "workingholiday/workingholiday");
			}
				
			
			

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errMsgs", "System Error");
			return new ModelAndView(UserRestURIConstants.getSitePath(request)
					+ "workingholiday/workingholiday");
		}
		String pageTitle = WebServiceUtils.getPageTitle("page.workingholidayQuote", UserRestURIConstants.getLanaguage(request));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.workingholidayQuote", UserRestURIConstants.getLanaguage(request));
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
		
		
		return new ModelAndView(UserRestURIConstants.getSitePath(request)
				+ "workingholiday/workingholiday-plan");
	}
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = {"/{lang}/workingholiday-insurance/user-details" })
	public ModelAndView prepareYourDetails(@ModelAttribute("workingholidayQuote") WorkingHolidayQuoteBean workingholidayQuote, 
			BindingResult result, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("token") == null) {
			model.addAttribute("errMsgs", "Session Expired");
			return getWorkingHolidayHomePage((String) session.getAttribute("referralCode"), request, model);
		}
		UserRestURIConstants.setController("WorkingHoliday");
		request.setAttribute("controller", UserRestURIConstants.getController());

		String planName = WebServiceUtils.getParameterValue("planName", session, request);
		String planSummary = WebServiceUtils.getParameterValue("selectedAmountDue", session, request);
		String selectPlanPremium = WebServiceUtils.getParameterValue("selectPlanPremium", session, request);
		String selectPlanName = WebServiceUtils.getParameterValue("selectPlanName", session, request);
		selectPlanName = planName;
		System.out.println("Seeeeeee" + selectPlanName);

		try {
			model.addAttribute("planName", planName);
			model.addAttribute("selectPlanName", selectPlanName);
			QuoteDetails quoteDetails = (QuoteDetails) session.getAttribute("quoteDetails");
			if ("A".equals(selectPlanName)) {
				session.setAttribute("planSelected", "A");
				model.addAttribute("planDiscount", quoteDetails.getDiscountAmount()[0]);
				model.addAttribute("planSummary", quoteDetails.getToalDue()[0]);
				model.addAttribute("planPremium", quoteDetails.getTotalNetPremium()[0]);
			} else {
				session.setAttribute("planSelected", "B");
				model.addAttribute("planDiscount", quoteDetails.getDiscountAmount()[1]);
				model.addAttribute("planSummary", quoteDetails.getToalDue()[1]);
				model.addAttribute("planPremium", quoteDetails.getTotalNetPremium()[1]);
			}
			
			String Url = UserRestURIConstants.GET_AGE_TYPE + "?itemTable=AgeType";
			HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
			String lang = UserRestURIConstants.getLanaguage(request);
			
			if (lang.equals("tc")){
				lang = "CN";
			}
			header.put("language", WebServiceUtils.transformLanaguage(lang));
			if (request.getSession().getAttribute("username") != null) {
				header.put("userName", session.getAttribute("username").toString());
				header.put("token", session.getAttribute("token").toString());
			}
			JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET, Url, header, null);

			if (responseJsonObj.get("errMsgs") == null) {
				JSONArray jsonAgeTypeArray = (JSONArray) responseJsonObj.get("optionItemDesc");
				Map<String, String> mapAgeType = new HashMap<String, String>();
				Map<String, String> mapSelfType = new HashMap<String, String>();
				Map<String, String> mapChildType = new HashMap<String, String>();
				for (int i = 0; i < jsonAgeTypeArray.size(); i++) {
					JSONObject obj = (JSONObject) jsonAgeTypeArray.get(i);
					mapAgeType.put(checkJsonObjNull(obj, "itemCode"), checkJsonObjNull(obj, "itemDesc"));
				}
				Iterator iterator = mapAgeType.entrySet().iterator();
				while (iterator.hasNext()) {
					Map.Entry mapEntry = (Map.Entry) iterator.next();
					if (mapEntry.getKey().equals("2") || mapEntry.getKey().equals("3")) {
						mapSelfType.put((String) mapEntry.getKey(), (String) mapEntry.getValue());
					}

				}
				iterator = mapAgeType.entrySet().iterator();
				while (iterator.hasNext()) {
					Map.Entry mapEntry = (Map.Entry) iterator.next();
					System.out.println("key " + mapEntry.getKey() + " value " + mapEntry.getValue());
					if (mapEntry.getKey().equals("1")) {
						mapChildType.put((String) mapEntry.getKey(), (String) mapEntry.getValue());
					}

				}
				model.addAttribute("mapAgeType", mapAgeType);
				model.addAttribute("mapSelfType", mapSelfType);
				model.addAttribute("mapChildType", mapChildType);

				/*
				 * API Call for get Benifitiary Relationship
				 */
				String relationshipCode = UserRestURIConstants.GET_BENE_RELATIONSHIP_CODE + "?itemTable=BeneRelationshipCode";
				JSONObject jsonRelationShipCode = restService.consumeApi(HttpMethod.GET, relationshipCode, header, null);

				if (responseJsonObj.get("errMsgs") == null) {
					JSONArray jsonRelationshipCode = (JSONArray) jsonRelationShipCode.get("optionItemDesc");
					System.out.println(" jsonRelationShipArray ====>>>>>>" + jsonRelationshipCode);

					Map<String, String> mapRelationshipCode = new HashMap<String, String>();
					for (int i = 0; i < jsonRelationshipCode.size(); i++) {
						JSONObject obj = (JSONObject) jsonRelationshipCode.get(i);
						mapRelationshipCode.put(checkJsonObjNull(obj, "itemCode"), checkJsonObjNull(obj, "itemDesc"));
					}
					model.addAttribute("mapRelationshipCode", mapRelationshipCode);

				}
			} else {
				model.addAttribute("errMsgs", responseJsonObj.get("errMsgs"));
				return new ModelAndView(UserRestURIConstants.getSitePath(request) + "travel/travel-plan");
			}

			model.addAttribute("planName", planName);
			model.addAttribute("planSummary", planSummary);
			model.addAttribute("planPremium", selectPlanPremium);

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errMsgs", "System Error");
			return new ModelAndView(UserRestURIConstants.getSitePath(request) + "workingholiday/workingholiday-plan");
		}
		Map<String, String> mapHkId = new TreeMap<>();
		String lang = UserRestURIConstants.getLanaguage(request);
		String hkIdLbl = "HKID";
		String passportLbl = "Passport";
		if ("tc".equals(lang)) {
			hkIdLbl = "香港身份證";
			passportLbl = "護照號碼";
		} else {
			hkIdLbl = "HKID";
			passportLbl = "Passport";
		}
		mapHkId.put("HKID", hkIdLbl);
		mapHkId.put("passport", passportLbl);
		model.addAttribute("mapHkId", mapHkId);
		
		//get District
		String token = session.getAttribute("token").toString();
		String userName = session.getAttribute("username").toString();
		HomeCareService homecareService = new HomeCareServiceImpl();
		List<DistrictBean> districtList = homecareService.getDistrict(userName, token, lang);
		request.setAttribute("districtList", districtList);
		model.addAttribute("districtList", districtList);
		
		String pageTitle = WebServiceUtils.getPageTitle("page.workingholidayUserDetails", UserRestURIConstants.getLanaguage(request));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.workingholidayPlanSummary", UserRestURIConstants.getLanaguage(request));
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
		return new ModelAndView(UserRestURIConstants.getSitePath(request) + "workingholiday/workingholiday-plan-details");
	}
	
	
	@SuppressWarnings({ "unchecked" })
	@RequestMapping(value = {"/{lang}/workingholiday-insurance/workingholiday-summary" })
	public ModelAndView prepareSummary(@ModelAttribute("frmYourDetails") PlanDetailsForm planDetailsForm, BindingResult result, Model model,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		//TravelQuoteBean travelQuote = (TravelQuoteBean) session.getAttribute("travelQuote");
		WorkingHolidayQuoteDetails workingHolidayQuoteDetails = (WorkingHolidayQuoteDetails) session.getAttribute("workingHolidayQuoteDetails");
		
		String planSelected = (String) session.getAttribute("planSelected");
		if (session.getAttribute("token") == null) {
			model.addAttribute("errMsgs", "Session Expired");
			return getWorkingHolidayHomePage((String) session.getAttribute("referralCode"), request, model);
		}
		if (workingHolidayQuoteDetails == null || planSelected == null) {
			return getWorkingHolidayHomePage((String) session.getAttribute("referralCode"), request, model);
		}
		UserRestURIConstants.setController("WorkingHoliday");
		request.setAttribute("controller", UserRestURIConstants.getController());

		UserDetails userDetails = new UserDetails();
		DateApi dateApi = new DateApi();

		String dueAmount = WebServiceUtils.getParameterValue("finalDueAmount", session, request);
		String selectPlanName = WebServiceUtils.getParameterValue("selectedPlanName", session, request);

		System.out.println("inside Controller fro prepare Summary" + selectPlanName);

		String deaprtureDate = dateApi.pickDate((String) session.getAttribute("departureDate"));
		String returnDate = dateApi.pickDate((String) session.getAttribute("returnDate"));

		String applicantFullName = WebServiceUtils.getParameterValue("fullName", session, request);
		String applicantHKID = WebServiceUtils.getParameterValue("hkid", session, request);
		String applicantMobNo = WebServiceUtils.getParameterValue("mobileNo", session, request);
		String emailAddress = WebServiceUtils.getParameterValue("emailAddress", session, request);

		//add new
		String workingHolidayCountry = WebServiceUtils.getParameterValue("workingHolidayCountry", session, request);

		if (planDetailsForm.getDepartureDate() != null) {
			session.setAttribute("workingHolidayPlanDetailsForm", planDetailsForm);
		} else {
			planDetailsForm = (PlanDetailsForm) session.getAttribute("workingHolidayPlanDetailsForm");
		}

		userDetails.setFullName(applicantFullName);
		userDetails.setHkid(applicantHKID);
		userDetails.setMobileNo(applicantMobNo);
		userDetails.setEmailAddress(emailAddress);

		JSONObject parameters = new JSONObject();
		parameters.put("planCode", session.getAttribute("planSelected"));
		parameters.put("commencementDate", deaprtureDate);
		parameters.put("expiryDate", returnDate);
		parameters.put("workingHolidayCountry", workingHolidayCountry);
		
		JSONObject insured = new JSONObject();
		insured.put("name", "");
		insured.put("ageRange", "");
		insured.put("hkId", "");
		insured.put("passport", "");
		insured.put("relationship", "");
		JSONObject beneficiary = new JSONObject();
		beneficiary.put("name", "");
		beneficiary.put("hkId", "");
		beneficiary.put("passport", "");
		beneficiary.put("relationship", "");
		insured.put("beneficiary", beneficiary);
		parameters.put("insured", insured);

		parameters.put("referralCode", session.getAttribute("referralCode"));

		JSONObject applicantJsonObj = new JSONObject();
		applicantJsonObj.put("name", session.getAttribute("username"));
		applicantJsonObj.put("hkId", "");
		applicantJsonObj.put("email", request.getParameter("emailAddress"));
		applicantJsonObj.put("mobileNo", "");
		applicantJsonObj.put("dob", "");
		parameters.put("applicant", applicantJsonObj);
		
		JSONObject addressJsonObj = new JSONObject();
		addressJsonObj.put("room", "");
		addressJsonObj.put("floor", "");
		addressJsonObj.put("building", "");
		addressJsonObj.put("estate", "");
		parameters.put("address", addressJsonObj);


		HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
		header.put("userName", (String) session.getAttribute("username"));
		header.put("token", (String) session.getAttribute("token"));
		header.put("language", WebServiceUtils.transformLanaguage(UserRestURIConstants.getLanaguage(request)));

		CreatePolicy createPolicy = (CreatePolicy) session.getAttribute("createPolicy");
		JSONObject responsObject = new JSONObject();
		if (createPolicy == null) {
			responsObject = restService.consumeApi(HttpMethod.PUT, UserRestURIConstants.TRAVEL_CREATE_POLICY, header, parameters);
			createPolicy = new CreatePolicy();
			String finalizeReferenceNo = "";
			System.out.println("TRAVEL_CREATE_POLICY Response" + responsObject);

			if (responsObject.get("errMsgs") == null) {
				finalizeReferenceNo = checkJsonObjNull(responsObject, "referenceNo");
				createPolicy.setReferenceNo(checkJsonObjNull(responsObject, "referenceNo"));
				createPolicy.setPolicyNo(checkJsonObjNull(responsObject, "policyNo"));
				createPolicy.setReferralCode(checkJsonObjNull(responsObject, "referralCode"));
				createPolicy.setPlanCode(checkJsonObjNull(responsObject, "planCode"));
				createPolicy.setPaymentGateway(checkJsonObjNull(responsObject, "paymentGateway"));
				createPolicy.setMerchantId(checkJsonObjNull(responsObject, "merchantId"));
				createPolicy.setCurrCode(checkJsonObjNull(responsObject, "currCode"));
				createPolicy.setPaymentType(checkJsonObjNull(responsObject, "paymentType"));
				createPolicy.setLang(checkJsonObjNull(responsObject, "lang"));

				// Calling Api of Confirm WorkingHoliday Care Policy
				JSONObject confirmPolicyParameter = new JSONObject();
				confirmPolicyParameter.put("referenceNo", finalizeReferenceNo);
				session.setAttribute("finalizeReferenceNo", finalizeReferenceNo);
				System.out.println("Header Object for Confirm" + confirmPolicyParameter);
				JSONObject jsonResponse = restService.consumeApi(HttpMethod.POST, UserRestURIConstants.WORKINGHOLIDAY_CONFIRM_POLICY, header,
						confirmPolicyParameter);

				System.out.println("Response From Confirm WorkingHoliday Policy " + jsonResponse);

				createPolicy.setSecureHash(checkJsonObjNull(jsonResponse, "secureHash"));
				createPolicy.setTransactionNo(checkJsonObjNull(jsonResponse, "transactionNumber"));
				createPolicy.setTransactionDate(checkJsonObjNull(jsonResponse, "transactionDate"));
				
				model.addAttribute(createPolicy);
				session.setAttribute("createPolicy", createPolicy);
			}

		}
		session.setAttribute("finalizeReferenceNo", createPolicy.getReferenceNo());

		String path = request.getRequestURL().toString();
		model.addAttribute("selectPlanName", selectPlanName);
		model.addAttribute("dueAmount", dueAmount);
		model.addAttribute("userDetails", userDetails);
		model.addAttribute("planDetailsForm", planDetailsForm);
		System.out.println("path " + path);

		model.addAttribute("path", path.replace("workingholiday-summary", "confirmation"));

		System.out.println("modal path " + path.replace("workingholiday-summary", "confirmation"));
		model.addAttribute("failurePath", path + "?paymentGatewayFlag=true");
		String paymentGatewayFlag = request.getParameter("paymentGatewayFlag");
		String errorMsg = request.getParameter("errorMsg");
		if (paymentGatewayFlag != null && paymentGatewayFlag.compareToIgnoreCase("true") == 0 && errorMsg == null) {
			errorMsg = "Payment failure";
		}
		model.addAttribute("errormsg", errorMsg);
		String pageTitle = WebServiceUtils.getPageTitle("page.workingholidayPlanSummary", UserRestURIConstants.getLanaguage(request));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.workingholidayPlanSummary", UserRestURIConstants.getLanaguage(request));
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
		return new ModelAndView(UserRestURIConstants.getSitePath(request) + "/workingholiday/workingholiday-payment");
	}
	
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/applyWorkingHolidayPromoCode", method = RequestMethod.POST)
	@ResponseBody
	public String applyPromotionCode(
			@ModelAttribute("workingholidayQuote") WorkingHolidayQuoteBean workingholidayQuote,
			BindingResult result, Model model, HttpServletRequest request) {

		JSONObject responseJsonObj = new JSONObject();
		HttpSession session = request.getSession();
		if (session.getAttribute("token") == null) {
			model.addAttribute("errMsgs", "Session Expired");
			return "fail";		
		}
		int days = 0;
		int otherCount = 0, childCount = 0, adultCount = 0;
		boolean spouseCover = false, selfCover = false;
		//Date dateD1 = new Date(workingholidayQuote.getTrLeavingDate());
		//Date dateD2 = new Date(workingholidayQuote.getTrBackDate());
		LocalDate commencementDate = new LocalDate(new Date());
		//LocalDate expiryDate = new LocalDate(dateD2);
		//days = Days.daysBetween(commencementDate, expiryDate).getDays();
		WorkingHolidayQuoteBean workingholidayQuoteCount = (WorkingHolidayQuoteBean)session.getAttribute("workingholidayQuoteCount");
		selfCover = workingholidayQuoteCount.isSelfCover();
		spouseCover = workingholidayQuoteCount.isSpouseCover();
		childCount = workingholidayQuoteCount.getTotalChildWorkingHolidayer();
		otherCount = workingholidayQuoteCount.getTotalOtherWorkingHolidayer();
		System.out.println("------------------------------------------------------------");
		System.out.println("CALLING API");
		System.out.println("SELF COVER " + selfCover);
		System.out.println("SPOUSE COVER " + spouseCover);
		System.out.println("CHILD COUNT " + childCount);
		System.out.println("OTHER COUNT " + otherCount);		
		System.out.println("------------------------------------------------------------");
		
		try {
			workingholidayQuote.setTotalWorkingHolidayingDays(days + 1);
			String Url = UserRestURIConstants.WORKINGHOLIDAY_GET_QUOTE + "?planCode=WorkingHoliday"
					+ "&commencementDate=" + commencementDate
					+ "&referralCode=" + request.getParameter("promoCode");

			String lang = UserRestURIConstants.getLanaguage(request);
			if (lang.equals("tc"))
				lang = "CN";
			
			HashMap<String, String> header = new HashMap<String, String>(
					COMMON_HEADERS);
			if (request.getSession().getAttribute("username") != null) {
				header.put("userName",
						request.getSession().getAttribute("username")
								.toString());
				header.put("token", request.getSession().getAttribute("token")
						.toString());
			}
			header.put("language", WebServiceUtils.transformLanaguage(lang));
			responseJsonObj = restService.consumeApi(HttpMethod.GET, Url,
					header, null);

			System.out.println("Response Get Working Holiday Quotes API "
					+ responseJsonObj);
			if (responseJsonObj.toJSONString().contains("Promotion code is not valid")) {
				session.setAttribute("referralCode", "");
			} else {
				session.setAttribute("referralCode", StringHelper.emptyIfNull(request.getParameter("promoCode")));
			}
			if (responseJsonObj.get("errMsgs") == null) {
				QuoteDetails quoteDetails = new QuoteDetails();
				
				JSONObject jsonPriceInfoA = new JSONObject();
				jsonPriceInfoA = (JSONObject) responseJsonObj.get("priceInfoA");
				JSONObject jsonPriceInfoB = new JSONObject();
				jsonPriceInfoB = (JSONObject) responseJsonObj.get("priceInfoB");
				String planeName[] = { "A", "B" };
				String grossPrem[] = {
						StringHelper.formatPrice(jsonPriceInfoA.get("grossPremium").toString()),
						StringHelper.formatPrice(jsonPriceInfoB.get("grossPremium").toString()) };

				String discountPercentage[] = {
						StringHelper.formatPrice(jsonPriceInfoA.get("discountPercentage").toString()),
						StringHelper.formatPrice(jsonPriceInfoB.get("discountPercentage").toString()) };

				String discountAmount[] = {
						StringHelper.formatPrice(jsonPriceInfoA.get("discountAmount").toString()),
						StringHelper.formatPrice(jsonPriceInfoB.get("discountAmount").toString()) };

				String totalNetPremium[] = {
						StringHelper.formatPrice(jsonPriceInfoA.get("totalNetPremium").toString()),
						StringHelper.formatPrice(jsonPriceInfoB.get("totalNetPremium").toString()) };

				String totalDue[] = {
						StringHelper.formatPrice(jsonPriceInfoA.get("totalDue").toString()),
						StringHelper.formatPrice(jsonPriceInfoB.get("totalDue").toString()) };

				quoteDetails.setGrossPremium(grossPrem);
				quoteDetails.setDiscountPercentage(discountPercentage);
				quoteDetails.setDiscountAmount(discountAmount);
				quoteDetails.setTotalNetPremium(totalNetPremium);
				quoteDetails.setToalDue(totalDue);
				quoteDetails.setPlanName(planeName);
				session.setAttribute("priceInfoA", jsonPriceInfoA);
				session.setAttribute("priceInfoB", jsonPriceInfoB);
				request.setAttribute("quoteDetails", quoteDetails);
				
				session.setAttribute("quoteDetails", quoteDetails);
				System.out.println(responseJsonObj.toString());
				return responseJsonObj.toString();
			} else {
				model.addAttribute("quoteDetails", session.getAttribute("quoteDetails"));
				System.out.println(responseJsonObj.toString());
				return responseJsonObj.get("errMsgs").toString();
			}

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errMsgs", "System Error");
			return "System Error";
		}
		
	}
	
	
	
	public String checkJsonObjNull(JSONObject obj, String checkByStr) {
		if (obj.get(checkByStr) != null) {
			return obj.get(checkByStr).toString();
		} else {
			return "";
		}
	}
	
	
	/*
	 * if("hkId".equalsIgnoreCase(planDetailsForm.getSelectedAdHkidPass()[inx])){
	 * adult.put("hkId", planDetailsForm.getAdultHKID()[inx]); }else{
	 * adult.put("hkId", ""); }
	 * 
	 * if("Passport".equalsIgnoreCase(planDetailsForm.getSelectedAdHkidPass()[inx
	 * ])){ adult.put("passport", planDetailsForm.getAdultHKID()[inx]); }else{
	 * adult.put("passport", ""); }
	 */

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
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/{lang}/applyWHQuote", method = RequestMethod.POST)
	@ResponseBody
	public String processWHQuote(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
//		String trLeavingDate = request.getParameter("trLeavingDate");
//		String trBackDate = request.getParameter("trBackDate");
		String trLeavingDate = "11 May 2015";
		String trBackDate = "11 May 2016";
		
		
		String referralCode = request.getParameter("referralCode");
		String selectedPlanName = request.getParameter("selectedPlanName");
		LocalDate commencementDate = new LocalDate(new Date(trLeavingDate));
  		LocalDate expiryDate = new LocalDate(new Date(trBackDate));
		
		String lang = UserRestURIConstants.getLanaguage(request);
		HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
		header.put("language", WebServiceUtils.transformLanaguage(lang));
		if (lang.equals("tc")) {
			lang = "CN";
		}
		if (request.getSession().getAttribute("username") != null) {
			header.put("userName", session.getAttribute("username").toString());
			header.put("token", session.getAttribute("token").toString());
		}
  		StringBuffer sb = new StringBuffer("?commencementDate=").append(commencementDate).append("&expiryDate=").append(expiryDate)
 				.append("&referralCode=").append(referralCode).append("&planCode=").append("WorkingHoliday");
 		String Url = UserRestURIConstants.WORKINGHOLIDAY_GET_QUOTE + sb.toString();
		
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET, Url, header, null);
		
		System.out.println("------------------------------------------------------------");
		System.out.println(Url);
		System.out.println(responseJsonObj);
		return responseJsonObj.toJSONString();
	}
	
}