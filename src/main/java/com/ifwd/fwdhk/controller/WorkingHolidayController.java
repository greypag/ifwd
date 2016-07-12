package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.io.IOException;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.model.CreatePolicy;
import com.ifwd.fwdhk.model.DistrictBean;
import com.ifwd.fwdhk.model.QuoteDetails;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.model.WorkingHolidayDetailsBean;
import com.ifwd.fwdhk.model.WorkingHolidayQuoteBean;
import com.ifwd.fwdhk.services.HomeCareService;
import com.ifwd.fwdhk.services.HomeCareServiceImpl;
import com.ifwd.fwdhk.util.DateApi;
import com.ifwd.fwdhk.util.JsonUtils;
import com.ifwd.fwdhk.util.Methods;
import com.ifwd.fwdhk.util.StringHelper;
import com.ifwd.fwdhk.util.WebServiceUtils;
import com.ifwd.fwdhk.utils.services.SendEmailDao;

@Controller
public class WorkingHolidayController {

	private final static Logger logger = LoggerFactory.getLogger(WorkingHolidayController.class);
	
	@Autowired
	private RestServiceDao restService;

	@Autowired
	private SendEmailDao sendEmail;

	@Autowired
	private MessageSource messageSource;
	
	@RequestMapping(value = {"/{lang}/workingholiday", "/{lang}/working-holiday-insurance", "/{lang}/working-holiday-insurance/sharing/"})
	public ModelAndView getWorkingHolidayHomePage(@RequestParam(required = false) final String promo, HttpServletRequest request, Model model) {

		UserRestURIConstants.setController("WorkingHoliday");
		request.setAttribute("controller", UserRestURIConstants.getController());
		//return UserRestURIConstants.checkLangSetPage(request) + "workingholiday/workingholiday";
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		HttpSession session = request.getSession();
		session.setAttribute("referralCode", StringHelper.emptyIfNull(promo));
		WorkingHolidayQuoteBean workingholidayQuote;
		
		workingholidayQuote = (WorkingHolidayQuoteBean) session.getAttribute("workingholidayQuote");
		
		if(workingholidayQuote == null){
			workingholidayQuote = new WorkingHolidayQuoteBean();
			
			/*workingholidayQuote.setTotalPersonalWorkingHolidayer(1);
			workingholidayQuote.setTotalAdultWorkingHolidayer(1);
			workingholidayQuote.setTotalChildWorkingHolidayer(1);
			workingholidayQuote.setTotalOtherWorkingHolidayer(0);
			workingholidayQuote.setPlanSelected("personal");*/
		}
		
		model.addAttribute("workingholidayQuote", workingholidayQuote);
		String pageTitle = WebServiceUtils.getPageTitle("page.workingholiday", UserRestURIConstants.getLanaguage(request));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.workingholiday", UserRestURIConstants.getLanaguage(request));
		
		String ogTitle = "";
		String ogType = "";
		String ogUrl = "";
		String ogImage = "";
		String ogDescription = "";
		
		String googleRickSnippetBrand ="";
		String googleRickSnippetName ="";
		String googleRickSnippetImageUrl ="";
		String googleRickSnippetImageAlt ="";
		String googleRickSnippetRating ="";
		String googleRickSnippetPrice ="";
		String googleRickSnippetAvailability = "";
		String googleRickSnippetAvailabilityText ="";
		String googleRickSnippetDescription1 ="";
		String googleRickSnippetDescription2 ="";
		
		
		if (request.getRequestURI().toString().equals(request.getContextPath() + "/tc/working-holiday-insurance/sharing/") || request.getRequestURI().toString().equals(request.getContextPath() + "/en/working-holiday-insurance/sharing/")) 
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
			googleRickSnippetBrand =WebServiceUtils.getPageTitle(
					"workingholiday.googleRickSnippetBrand",
					UserRestURIConstants.getLanaguage(request));
			googleRickSnippetName =WebServiceUtils.getPageTitle(
					"workingholiday.googleRickSnippetName",
					UserRestURIConstants.getLanaguage(request));
			
			googleRickSnippetImageUrl =WebServiceUtils.getPageTitle(
					"workingholiday.googleRickSnippetImageUrl",
					UserRestURIConstants.getLanaguage(request));
			googleRickSnippetImageAlt =WebServiceUtils.getPageTitle(
					"workingholiday.googleRickSnippetImageAlt",
					UserRestURIConstants.getLanaguage(request));
			googleRickSnippetRating =WebServiceUtils.getPageTitle(
					"workingholiday.googleRickSnippetRating",
					UserRestURIConstants.getLanaguage(request));
			googleRickSnippetPrice =WebServiceUtils.getPageTitle(
					"workingholiday.googleRickSnippetPrice",
					UserRestURIConstants.getLanaguage(request));
			googleRickSnippetAvailability =WebServiceUtils.getPageTitle(
					"workingholiday.googleRickSnippetAvailability",
					UserRestURIConstants.getLanaguage(request));
			googleRickSnippetAvailabilityText =WebServiceUtils.getPageTitle(
					"workingholiday.googleRickSnippetAvailabilityText",
					UserRestURIConstants.getLanaguage(request));
			googleRickSnippetDescription1 =WebServiceUtils.getPageTitle(
					"workingholiday.googleRickSnippetDescription1",
					UserRestURIConstants.getLanaguage(request));
			googleRickSnippetDescription2 =WebServiceUtils.getPageTitle(
					"workingholiday.googleRickSnippetDescription2",
					UserRestURIConstants.getLanaguage(request));
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
		
		model.addAttribute("googleRickSnippetBrand", googleRickSnippetBrand);
		model.addAttribute("googleRickSnippetName", googleRickSnippetName);
		model.addAttribute("googleRickSnippetImageUrl", googleRickSnippetImageUrl);
		model.addAttribute("googleRickSnippetImageAlt", googleRickSnippetImageAlt);
		model.addAttribute("googleRickSnippetRating", googleRickSnippetRating);
		model.addAttribute("googleRickSnippetPrice", googleRickSnippetPrice);
		model.addAttribute("googleRickSnippetAvailability", googleRickSnippetAvailability);
		model.addAttribute("googleRickSnippetAvailabilityText", googleRickSnippetAvailabilityText);
		model.addAttribute("googleRickSnippetDescription1", googleRickSnippetDescription1);
		model.addAttribute("googleRickSnippetDescription2", googleRickSnippetDescription2);
		
		String twitterCard = WebServiceUtils.getPageTitle("twitter.working.holiday.card",
				UserRestURIConstants.getLanaguage(request));
		String twitterImage = WebServiceUtils.getPageTitle("twitter.working.holiday.image",
				UserRestURIConstants.getLanaguage(request));
		String twitterSite = WebServiceUtils.getPageTitle("twitter.working.holiday.site",
				UserRestURIConstants.getLanaguage(request));
		String twitterUrl = WebServiceUtils.getPageTitle("twitter.working.holiday.url",
				UserRestURIConstants.getLanaguage(request));
		String canonical = WebServiceUtils.getPageTitle("canonical.working.holiday",
				UserRestURIConstants.getLanaguage(request));
		model.addAttribute("twitterCard", twitterCard);
		model.addAttribute("twitterImage", twitterImage);
		model.addAttribute("twitterSite", twitterSite);
		model.addAttribute("twitterUrl", twitterUrl);
		model.addAttribute("canonical", canonical);
		
		
		String scriptName = WebServiceUtils.getPageTitle("workingholiday.script.name",
				UserRestURIConstants.getLanaguage(request));
		String scriptDescription = WebServiceUtils.getPageTitle("workingholiday.script.description",
				UserRestURIConstants.getLanaguage(request));
		String scriptChildName = WebServiceUtils.getPageTitle("workingholiday.script.child.name",
				UserRestURIConstants.getLanaguage(request));
		String scriptImg = WebServiceUtils.getPageTitle("workingholiday.sharing.og.image",
				UserRestURIConstants.getLanaguage(request));
		model.addAttribute("scriptName", scriptName);
		model.addAttribute("scriptDescription", scriptDescription);
		model.addAttribute("scriptChildName", scriptChildName);
		model.addAttribute("scriptImg", scriptImg);
		return new ModelAndView(UserRestURIConstants.getSitePath(request) + "workingholiday/workingholiday");			
	}
	
	
	@RequestMapping(value = "/prepareWorkingHolidayPlan")
	@ResponseBody
	public String prepareWorkingHolidayPlan(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
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
		
		LocalDate commencementDate = new LocalDate(new Date());
		String Url = UserRestURIConstants.WORKINGHOLIDAY_GET_QUOTE + "?planCode=WorkingHoliday"
				+ "&commencementDate=" + commencementDate + "&referralCode=" + (String) session.getAttribute("referralCode");

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
		logger.info("WORKINGHOLIDAY_GET_QUOTE Response " + responseJsonObj);
		
		if (responseJsonObj.get("errMsgs") == null) {
			QuoteDetails quoteDetails = new QuoteDetails();
			//quoteDetails.setPlanSelected(workingholidayQuote.getPlanSelected());
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
			session.setAttribute("quoteDetails", quoteDetails);
			return "success";
		}else{
			session.setAttribute("errMsgs", responseJsonObj.get("errMsgs"));
			return "fail";
		}

		
	}
	
	
	@RequestMapping(value = {"/{lang}/getWorkingHolidayQuote", "/{lang}/working-holiday-insurance/quote"})
	public ModelAndView prepareWorkingHolidayPlan(
			@ModelAttribute("workingholidayQuote") WorkingHolidayQuoteBean workingholidayQuote,
			BindingResult result, Model model, HttpServletRequest request) {
		
		UserRestURIConstants.setController("WorkingHoliday");
		request.setAttribute("controller", UserRestURIConstants.getController());
		HttpSession session = request.getSession();
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		try {
			
			session.setAttribute("planSelected", workingholidayQuote.getPlanSelected());
			
			QuoteDetails quoteDetails;
			if (session.getAttribute("quoteDetails") != null) {
				quoteDetails = (QuoteDetails)session.getAttribute("quoteDetails");
				
				request.setAttribute("quoteDetails", quoteDetails);
				model.addAttribute("quoteDetails", quoteDetails);
				model.addAttribute("workingholidayQuoteBean", workingholidayQuote);
			} else {
				model.addAttribute("errMsgs", session.getAttribute("errMsgs"));
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
		
		String twitterCard = WebServiceUtils.getPageTitle("twitter.working.holiday.card",
				UserRestURIConstants.getLanaguage(request));
		String twitterImage = WebServiceUtils.getPageTitle("twitter.working.holiday.image",
				UserRestURIConstants.getLanaguage(request));
		String twitterSite = WebServiceUtils.getPageTitle("twitter.working.holiday.site",
				UserRestURIConstants.getLanaguage(request));
		String twitterUrl = WebServiceUtils.getPageTitle("twitter.working.holiday.url",
				UserRestURIConstants.getLanaguage(request));
		String canonical = WebServiceUtils.getPageTitle("canonical.working.holiday",
				UserRestURIConstants.getLanaguage(request));
		model.addAttribute("twitterCard", twitterCard);
		model.addAttribute("twitterImage", twitterImage);
		model.addAttribute("twitterSite", twitterSite);
		model.addAttribute("twitterUrl", twitterUrl);
		model.addAttribute("canonical", canonical);
		
		session.removeAttribute("workingHolidayPlanDetailsForm");
		
		return new ModelAndView(UserRestURIConstants.getSitePath(request)
				+ "workingholiday/workingholiday-plan");
	}
	
	@SuppressWarnings({ "rawtypes", "unused" })
	@RequestMapping(value = {"/wh-details" })
	@ResponseBody
	public String prepareYourDetails(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("token") == null) {
			return "token is null";
		}
		try {
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
			logger.info("GET_AGE_TYPE Response " + responseJsonObj);

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
					if (mapEntry.getKey().equals("1")) {
						mapChildType.put((String) mapEntry.getKey(), (String) mapEntry.getValue());
					}

				}
				//session.setAttribute("whMapAgeType", mapAgeType);
				//session.setAttribute("whMapSelfType", mapSelfType);
				//session.setAttribute("whMapChildType", mapChildType);

				/*
				 * API Call for get Benifitiary Relationship
				 */
				String relationshipCode = UserRestURIConstants.GET_BENE_RELATIONSHIP_CODE + "?itemTable=BeneRelationshipCode";
				JSONObject jsonRelationShipCode = restService.consumeApi(HttpMethod.GET, relationshipCode, header, null);
				logger.info("GET_BENE_RELATIONSHIP_CODE Response " + jsonRelationShipCode);

				if (responseJsonObj.get("errMsgs") == null) {
					JSONArray jsonRelationshipCode = (JSONArray) jsonRelationShipCode.get("optionItemDesc");
					logger.info("jsonRelationShipArray ====>>>>>>" + jsonRelationshipCode);
					Map<String, String> mapRelationshipCode = new LinkedHashMap<String, String>();

					for (int i = 0; i < jsonRelationshipCode.size(); i++) {
						JSONObject obj = (JSONObject) jsonRelationshipCode.get(i);
						mapRelationshipCode.put(checkJsonObjNull(obj, "itemCode"), checkJsonObjNull(obj, "itemDesc"));
					}
					//session.setAttribute("whMapRelationshipCode", mapRelationshipCode);

				}
			} else {
				return responseJsonObj.get("errMsgs").toString();
			}
			//get country
			String getCountryUrl = UserRestURIConstants.GET_COUNTRY + "?itemTable=WorkingHolidayCountry";
			JSONObject jsonCountry = restService.consumeApi(HttpMethod.GET, getCountryUrl, header, null);
			logger.info("GET_COUNTRY Response " + jsonCountry);
			if (jsonCountry.get("errMsgs") == null) {
				JSONArray jsonRelationshipCode = (JSONArray) jsonCountry.get("optionItemDesc");
				
				Map<String, String> countryInfo = new HashMap<String, String>();
				for (int i = 0; i < jsonRelationshipCode.size(); i++) {
					JSONObject obj = (JSONObject) jsonRelationshipCode.get(i);
					countryInfo.put(checkJsonObjNull(obj, "itemCode"),
							WebServiceUtils.getPageTitle("workingholiday.country." + checkJsonObjNull(obj, "itemCode"), UserRestURIConstants.getLanaguage(request)));
				}
				//session.setAttribute("whCountryInfo", countryInfo);
			}

		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		String lang = UserRestURIConstants.getLanaguage(request);
		
		//get District
		String token = session.getAttribute("token").toString();
		String userName = session.getAttribute("username").toString();
		HomeCareService homecareService = new HomeCareServiceImpl();
		if (lang.equals("tc")) {
			lang = "CN";
		}
		List<DistrictBean> districtList = homecareService.getDistrict(userName, token, lang);
		//session.setAttribute("whDistrictList", districtList);
		
		return "success";
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = {"/{lang}/working-holiday-insurance/user-details" })
	public ModelAndView prepareYourDetails(@ModelAttribute("workingholidayQuote") WorkingHolidayQuoteBean workingholidayQuote, 
			BindingResult result, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		//session.removeAttribute("workingHolidayPlanDetailsForm");
		if (session.getAttribute("token") == null) {
			model.addAttribute("errMsgs", "Session Expired");
			return getWorkingHolidayHomePage((String) session.getAttribute("referralCode"), request, model);
		}
		UserRestURIConstants.setController("WorkingHoliday");
		request.setAttribute("controller", UserRestURIConstants.getController());
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		String planName = WebServiceUtils.getParameterValue("planName", session, request);
		String planSummary = WebServiceUtils.getParameterValue("selectedAmountDue", session, request);
		String selectPlanPremium = WebServiceUtils.getParameterValue("selectPlanPremium", session, request);
		String selectPlanName = WebServiceUtils.getParameterValue("selectPlanName", session, request);
		String planDiscount = WebServiceUtils.getParameterValue("selectedDiscountAmt", session, request);
		
		selectPlanName = planName;

		try {
			model.addAttribute("planName", planName);
			model.addAttribute("selectPlanName", selectPlanName);
			QuoteDetails quoteDetails = (QuoteDetails) session.getAttribute("quoteDetails");
			
			if (quoteDetails == null) {
				model.addAttribute("errMsgs", "Session Expired");
				return getWorkingHolidayHomePage((String) session.getAttribute("referralCode"), request, model);
			}
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
			logger.info("GET_AGE_TYPE Response " + responseJsonObj);

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
				logger.info("GET_BENE_RELATIONSHIP_CODE Response " + jsonRelationShipCode);

				if (responseJsonObj.get("errMsgs") == null) {
					JSONArray jsonRelationshipCode = (JSONArray) jsonRelationShipCode.get("optionItemDesc");
					Map<String, String> mapRelationshipCode = new LinkedHashMap<String, String>();
					
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
			model.addAttribute("planDiscount", planDiscount);
			
			//get country
			String getCountryUrl = UserRestURIConstants.GET_COUNTRY + "?itemTable=WorkingHolidayCountry";
			JSONObject jsonCountry = restService.consumeApi(HttpMethod.GET, getCountryUrl, header, null);
			logger.info("GET_COUNTRY Response " + jsonCountry);
			
			if (jsonCountry.get("errMsgs") == null) {
				JSONArray jsonRelationshipCode = (JSONArray) jsonCountry.get("optionItemDesc");
				
				Map<String, String> countryInfo = new LinkedHashMap<String, String>();
				for (int i = 0; i < jsonRelationshipCode.size(); i++) {
					JSONObject obj = (JSONObject) jsonRelationshipCode.get(i);
					countryInfo.put(checkJsonObjNull(obj, "itemCode"),
							WebServiceUtils.getPageTitle("workingholiday.country." + checkJsonObjNull(obj, "itemCode"), UserRestURIConstants.getLanaguage(request)));
				}
				model.addAttribute("countryInfo", countryInfo);
			}

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
		if (lang.equals("tc")) {
			lang = "CN";
		}
		List<DistrictBean> districtList = homecareService.getDistrict(userName, token, lang);
		request.setAttribute("districtList", districtList);
		model.addAttribute("districtList", districtList);
		
		String pageTitle = WebServiceUtils.getPageTitle("page.workingholidayUserDetails", UserRestURIConstants.getLanaguage(request));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.workingholidayPlanSummary", UserRestURIConstants.getLanaguage(request));
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
		
		String twitterCard = WebServiceUtils.getPageTitle("twitter.working.holiday.card",
				UserRestURIConstants.getLanaguage(request));
		String twitterImage = WebServiceUtils.getPageTitle("twitter.working.holiday.image",
				UserRestURIConstants.getLanaguage(request));
		String twitterSite = WebServiceUtils.getPageTitle("twitter.working.holiday.site",
				UserRestURIConstants.getLanaguage(request));
		String twitterUrl = WebServiceUtils.getPageTitle("twitter.working.holiday.url",
				UserRestURIConstants.getLanaguage(request));
		String canonical = WebServiceUtils.getPageTitle("canonical.working.holiday",
				UserRestURIConstants.getLanaguage(request));
		model.addAttribute("twitterCard", twitterCard);
		model.addAttribute("twitterImage", twitterImage);
		model.addAttribute("twitterSite", twitterSite);
		model.addAttribute("twitterUrl", twitterUrl);
		model.addAttribute("canonical", canonical);
		
		return new ModelAndView(UserRestURIConstants.getSitePath(request) + "workingholiday/workingholiday-plan-details");
	}
	
	@SuppressWarnings({ "unchecked" })
	@RequestMapping(value = "/wh-summary", method=RequestMethod.POST)
	@ResponseBody
	public String prepareSummary(@RequestBody  WorkingHolidayDetailsBean planDetailsForm, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		 
		HttpSession session = request.getSession();
		QuoteDetails quoteDetails = (QuoteDetails) session.getAttribute("quoteDetails");
		String planSelected = (String) session.getAttribute("planSelected");
		if (session.getAttribute("token") == null) {
			return "Token is null";
		}
		if (quoteDetails == null || planSelected == null) {
			return "Session Expired";
		}
		if (planDetailsForm.getWhInseffectiveDate() != null) {
			planDetailsForm.setWhAppMobileNO(Methods.formatMobile(planDetailsForm.getWhAppMobileNO()));
			session.setAttribute("workingHolidayPlanDetailsForm", planDetailsForm);
			
		} else {
			planDetailsForm = (WorkingHolidayDetailsBean) session.getAttribute("workingHolidayPlanDetailsForm");
		}

		UserDetails userDetails = new UserDetails();
		userDetails.setFullName(planDetailsForm.getWhAppFullName());
		userDetails.setHkid(planDetailsForm.getWhAppHKID());
		userDetails.setMobileNo(planDetailsForm.getWhAppMobileNO());
		userDetails.setEmailAddress(planDetailsForm.getWhAppEmailAdd());

		JSONObject parameters = new JSONObject();
		parameters.put("planCode", planSelected.toUpperCase());
		
		
		Calendar calendar=Calendar.getInstance();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		calendar.setTime(DateApi.formatDate(planDetailsForm.getWhInseffectiveDate()));
		String commencementDate = df.format(calendar.getTime());
		calendar.add(Calendar.YEAR, 1);
		calendar.add(Calendar.DAY_OF_YEAR, -1);
		String expiryDate = df.format(calendar.getTime());
		
		calendar.setTime(DateApi.formatDate(planDetailsForm.getWhAppDob()));
		String dob = df.format(calendar.getTime());
		
		parameters.put("commencementDate", commencementDate);
		parameters.put("expiryDate", expiryDate);
		parameters.put("workingHolidayCountry", planDetailsForm.getWhInsWorkingCty());
		
		JSONArray insureds = new JSONArray();
		JSONObject insured = new JSONObject();
		insured.put("name", planDetailsForm.getWhAppFullName().toUpperCase());
		//insured.put("ageRange", planDetailsForm.getWhInsAgeRange());
		insured.put("ageRange", "4");
		
		insured.put("hkid".equals(planDetailsForm.getSelectWhAppHKID().toLowerCase()) ? "hkId" : "passport", planDetailsForm.getWhAppHKID());
		insured.put(!"hkid".equals(planDetailsForm.getSelectWhAppHKID().toLowerCase()) ? "hkId" : "passport", "");
		insured.put("dob", dob);
		insured.put("relationship", "SE");
		JSONObject beneficiary = new JSONObject();
		
		if("SE".equals(planDetailsForm.getWhInsBeneficary())) {
			beneficiary.put("name", planDetailsForm.getWhAppFullName().toUpperCase());
			if (planDetailsForm.getSelectWhAppHKID().toLowerCase().equals("hkid")) {
				beneficiary.put("hkId", planDetailsForm.getWhAppHKID());
				beneficiary.put("passport", "");
			}else {
				beneficiary.put("hkId", "");
				beneficiary.put("passport", planDetailsForm.getWhAppHKID());
			}
		} else {
			beneficiary.put("name", planDetailsForm.getWhInsFullName().toUpperCase());
			if (planDetailsForm.getSelectWhInsHKID().toLowerCase().equals("hkid")) {
				beneficiary.put("hkId", planDetailsForm.getWhInsHKID());
				beneficiary.put("passport", "");
				
			}else {
				beneficiary.put("hkId", "");
				beneficiary.put("passport", planDetailsForm.getWhInsHKID());
			}
		}
		beneficiary.put("relationship", planDetailsForm.getWhInsBeneficary());
		insured.put("beneficiary", beneficiary);
		insureds.add(insured);
		parameters.put("insured", insureds);

		parameters.put("referralCode", (session.getAttribute("referralCode")+"").toUpperCase());

		JSONObject applicantJsonObj = new JSONObject();
		applicantJsonObj.put("name", planDetailsForm.getWhAppFullName().toUpperCase());
		
		if (planDetailsForm.getSelectWhAppHKID().toLowerCase().equals("hkid")) {
			applicantJsonObj.put("hkId", planDetailsForm.getWhAppHKID());
			applicantJsonObj.put("passport", "");
		}
		else {
			applicantJsonObj.put("hkId", "");
			applicantJsonObj.put("passport", planDetailsForm.getWhAppHKID());
			
		}
			
		applicantJsonObj.put("email", planDetailsForm.getWhAppEmailAdd().toUpperCase());
		applicantJsonObj.put("mobileNo", planDetailsForm.getWhAppMobileNO());
		applicantJsonObj.put("optIn1", planDetailsForm.getCheckbox3());
		applicantJsonObj.put("optIn2", planDetailsForm.getCheckbox4());
		applicantJsonObj.put("dob", dob);
		parameters.put("applicant", applicantJsonObj);
		
		JSONObject addressJsonObj = new JSONObject();
		addressJsonObj.put("room", (planDetailsForm.getWhInsRoom()+"").toUpperCase());
		addressJsonObj.put("floor", (planDetailsForm.getWhInsFloor()+"").toUpperCase());
		addressJsonObj.put("block", (planDetailsForm.getWhInsBlock()+"").toUpperCase());
		addressJsonObj.put("building", (planDetailsForm.getWhInsBuilding()+"").toUpperCase());
		addressJsonObj.put("estate", (planDetailsForm.getWhInsEstate()+"").toUpperCase());
		addressJsonObj.put("streetNo", (planDetailsForm.getWhInsStreetNo()+"").toUpperCase());
		addressJsonObj.put("streetName", (planDetailsForm.getWhInsStreetName()+"").toUpperCase());
		addressJsonObj.put("district", (planDetailsForm.getWhInsDistrict()+"").toUpperCase());
		addressJsonObj.put("area", (planDetailsForm.getWhInsArea()+"").toUpperCase());
		parameters.put("address", addressJsonObj);
		
		parameters.put("externalParty", "");
		parameters.put("externalPartyCode", "");

		HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
		header.put("userName", (String) session.getAttribute("username"));
		header.put("token", (String) session.getAttribute("token"));
		header.put("language", WebServiceUtils.transformLanaguage(UserRestURIConstants.getLanaguage(request)));

		CreatePolicy createPolicy = new CreatePolicy();
		JSONObject responsObject = new JSONObject();
			
		logger.info("WORKINGHOLIDAY_CREATE_POLICY Request:" + JsonUtils.jsonPrint(parameters));
		responsObject = restService.consumeApi(HttpMethod.PUT, UserRestURIConstants.WORKINGHOLIDAY_CREATE_POLICY, header, parameters);
		String finalizeReferenceNo = "";
		logger.info("WORKINGHOLIDAY_CREATE_POLICY Response:" + JsonUtils.jsonPrint(responsObject));

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
			
			logger.info("WORKINGHOLIDAY_CONFIRM_POLICY Request:" + JsonUtils.jsonPrint(confirmPolicyParameter));
			JSONObject jsonResponse = restService.consumeApi(HttpMethod.POST, UserRestURIConstants.WORKINGHOLIDAY_CONFIRM_POLICY, header,
					confirmPolicyParameter);
			logger.info("WORKINGHOLIDAY_CONFIRM_POLICY Response:" + JsonUtils.jsonPrint(jsonResponse));

			createPolicy.setSecureHash(checkJsonObjNull(jsonResponse, "secureHash"));
			createPolicy.setTransactionNo(checkJsonObjNull(jsonResponse, "transactionNumber"));
			createPolicy.setTransactionDate(checkJsonObjNull(jsonResponse, "transactionDate"));
			
			session.setAttribute("transNo", createPolicy.getTransactionNo());
			session.setAttribute("transactionDate", createPolicy.getTransactionDate());
			session.setAttribute("whCreatePolicy", createPolicy);
			session.setAttribute("finalizeReferenceNo", createPolicy.getReferenceNo());
			session.setAttribute("policyNo", createPolicy.getPolicyNo());
			session.setAttribute("emailAddress", planDetailsForm.getWhAppEmailAdd());
			
			return "success";
		}else {
			return responsObject.get("errMsgs").toString();
		}
	}
	
	@RequestMapping(value = {"/{lang}/working-holiday-insurance/working-holiday-summary" })
	public ModelAndView prepareSummary(HttpServletRequest request, HttpServletResponse response, Model model) {
		HttpSession session = request.getSession();
		QuoteDetails quoteDetails = (QuoteDetails) session.getAttribute("quoteDetails");
		
		String planSelected = (String) session.getAttribute("planSelected");
		if (session.getAttribute("token") == null) {
			model.addAttribute("errMsgs", "Session Expired");
			return getWorkingHolidayHomePage((String) session.getAttribute("referralCode"), request, model);
		}
		if (quoteDetails == null || planSelected == null) {
			return getWorkingHolidayHomePage((String) session.getAttribute("referralCode"), request, model);
		}
		UserRestURIConstants.setController("WorkingHoliday");
		request.setAttribute("controller", UserRestURIConstants.getController());
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		String dueAmount = WebServiceUtils.getParameterValue("finalDueAmount", session, request);
		String originalAmount = WebServiceUtils.getParameterValue("finalOriginalAmount",session, request);
		session.setAttribute("dueAmount", dueAmount.replace(",","").trim());
		session.setAttribute("originalAmount", originalAmount.replace(",","").trim());
		String selectPlanName = WebServiceUtils.getParameterValue("selectedPlanName", session, request);

		WorkingHolidayDetailsBean planDetailsForm = (WorkingHolidayDetailsBean) session.getAttribute("workingHolidayPlanDetailsForm");

		UserDetails userDetails = new UserDetails();
		userDetails.setFullName(planDetailsForm.getWhAppFullName());
		userDetails.setHkid(planDetailsForm.getWhAppHKID());
		userDetails.setMobileNo(planDetailsForm.getWhAppMobileNO());
		userDetails.setEmailAddress(planDetailsForm.getWhAppEmailAdd());
		
		Calendar calendar=Calendar.getInstance();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		calendar.setTime(DateApi.formatDate(planDetailsForm.getWhInseffectiveDate()));
		String commencementDate = df.format(calendar.getTime());
		calendar.add(Calendar.YEAR, 1);
		calendar.add(Calendar.DAY_OF_YEAR, -1);
		String expiryDate = df.format(calendar.getTime());
		
		calendar.setTime(DateApi.formatDate(planDetailsForm.getWhAppDob()));
		
		CreatePolicy createPolicy = (CreatePolicy) session.getAttribute("whCreatePolicy");
		model.addAttribute(createPolicy);

		String path = request.getRequestURL().toString();
		model.addAttribute("selectPlanName", selectPlanName);
		model.addAttribute("dueAmount", dueAmount);
		model.addAttribute("originalAmount", originalAmount);
		model.addAttribute("userDetails", userDetails);
		model.addAttribute("commencementDate", commencementDate);
		model.addAttribute("expiryDate", expiryDate);
		model.addAttribute("planDetailsForm", planDetailsForm);
		model.addAttribute("whInsBeneficaryDesc", WebServiceUtils.getBeneRelationshipDesc(planDetailsForm.getWhInsBeneficary(), WebServiceUtils.transformLanaguage(UserRestURIConstants.getLanaguage(request))));
		
		LocalDate dateL1 = new LocalDate(commencementDate);
		LocalDate dateL2 = new LocalDate(expiryDate);
		int days = Days.daysBetween(dateL1, dateL2).getDays() + 1;
		model.addAttribute("totalDays", days);
		model.addAttribute("path", path.replace("working-holiday-summary", "confirmation"));
		model.addAttribute("failurePath", path + "?paymentGatewayFlag=true");
		model.addAttribute("utm_nooverride", 1);
		
		String paymentGatewayFlag = request.getParameter("paymentGatewayFlag");
		String errorMsg = request.getParameter("errorMsg");
		if (paymentGatewayFlag != null && paymentGatewayFlag.compareToIgnoreCase("true") == 0 && errorMsg == null) {
			errorMsg = "Payment failure";
		}
		String pageTitle = WebServiceUtils.getPageTitle("page.workingholidayPlanSummary", UserRestURIConstants.getLanaguage(request));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.workingholidayPlanSummary", UserRestURIConstants.getLanaguage(request));
		model.addAttribute("errormsg", errorMsg);
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
		
		String twitterCard = WebServiceUtils.getPageTitle("twitter.working.holiday.card",
				UserRestURIConstants.getLanaguage(request));
		String twitterImage = WebServiceUtils.getPageTitle("twitter.working.holiday.image",
				UserRestURIConstants.getLanaguage(request));
		String twitterSite = WebServiceUtils.getPageTitle("twitter.working.holiday.site",
				UserRestURIConstants.getLanaguage(request));
		String twitterUrl = WebServiceUtils.getPageTitle("twitter.working.holiday.url",
				UserRestURIConstants.getLanaguage(request));
		String canonical = WebServiceUtils.getPageTitle("canonical.working.holiday",
				UserRestURIConstants.getLanaguage(request));
		model.addAttribute("twitterCard", twitterCard);
		model.addAttribute("twitterImage", twitterImage);
		model.addAttribute("twitterSite", twitterSite);
		model.addAttribute("twitterUrl", twitterUrl);
		model.addAttribute("canonical", canonical);
		
		return new ModelAndView(UserRestURIConstants.getSitePath(request) + "workingholiday/workingholiday-payment");
	}
	
	
	@SuppressWarnings({ "unchecked", "unused" })
	@RequestMapping(value = "/processWorkingHolidayPayment")
	@ResponseBody
	public String processPayment(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		
		
		String referenceNo = request.getParameter("referenceNo");
		
		JSONObject submitPolicy = new JSONObject();
		submitPolicy.put("referenceNo", referenceNo);
		HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
		header.put("userName", (String) session.getAttribute("username"));
		header.put("token", (String) session.getAttribute("token"));
		header.put("language", WebServiceUtils.transformLanaguage(UserRestURIConstants.getLanaguage(request)));
		
		logger.info("TRAVEL_SUBMIT_POLICY request " + JsonUtils.jsonPrint(submitPolicy));
		JSONObject jsonResponse = restService.consumeApi(
				HttpMethod.POST,
				UserRestURIConstants.TRAVEL_SUBMIT_POLICY, header,
				submitPolicy);
		logger.info("TRAVEL_SUBMIT_POLICY Response" + JsonUtils.jsonPrint(jsonResponse));
		
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
				session.setAttribute("expiryDate", String.format("%02d", Integer.parseInt(request.getParameter("epMonth"))) + request.getParameter("epYear"));
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
	
	
	@SuppressWarnings("unchecked")
	
	
	@RequestMapping(value = {"/{lang}/working-holiday-insurance/workingholiday-confirmation", "/{lang}/working-holiday-insurance/confirmation"})
	public String processPayment(Model model, HttpServletRequest request
			 ) {
		HttpSession session = request.getSession();
		if (session.getAttribute("token") == null) {
			model.addAttribute("errormsg", "Session Expired");
			return UserRestURIConstants.getSitePath(request) + "workingholiday/workingholiday-confirmation";
		}
		
		UserRestURIConstants.setController("WorkingHoliday");
		request.setAttribute("controller", UserRestURIConstants.getController());
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		
		JSONObject parameters = new JSONObject();
		String referenceNo = (String)session.getAttribute("finalizeReferenceNo");
		model.addAttribute("referenceNo", referenceNo);
		parameters.put("referenceNo",referenceNo);
		parameters.put("transactionNumber", session.getAttribute("transNo"));
		parameters.put("transactionDate",session.getAttribute("transactionDate"));
		parameters.put("paymentFail", "0");
		
		String creditCardNo = (String)session.getAttribute("creditCardNo");
		
		if (creditCardNo !=null) { 
			try {
				parameters.put("creditCardNo", Methods.decryptStr((String)session.getAttribute("creditCardNo")));
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("errMsgs", e.toString());
				return UserRestURIConstants.getSitePath(request)
						+ "workingholiday/working-holiday-summary-payment";
			} 
		} else {
			
			model.addAttribute("policyNo", StringHelper.emptyIfNull((String)session.getAttribute("policyNo")));
			model.addAttribute("emailAddress",session.getAttribute("emailAddress"));
			model.addAttribute("referralCode",session.getAttribute("referralCode"));
			String pageTitle = WebServiceUtils.getPageTitle("page.workingholidayPlanConfirmation", UserRestURIConstants.getLanaguage(request));
			String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.workingholidayPlanConfirmation", UserRestURIConstants.getLanaguage(request));
			model.addAttribute("pageTitle", pageTitle);
			model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
			return UserRestURIConstants.getSitePath(request) + "workingholiday/workingholiday-confirmation";
		}
			
		parameters.put("expiryDate", session.getAttribute("expiryDate"));
		
		if(JsonUtils.hasEmpty(parameters)) {
			return UserRestURIConstants.getSitePath(request) + "workingholiday/workingholiday";
		}

		HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
		header.put("userName", session.getAttribute("username").toString());
		header.put("token", session.getAttribute("token").toString());
		header.put("language", WebServiceUtils.transformLanaguage(UserRestURIConstants.getLanaguage(request)));
		logger.info("WORKINGHOLIDAY_FINALIZE_POLICY Request " + JsonUtils.jsonPrint(parameters));
		new Thread(){
			public void run() {
				JSONObject responsObject = restService.consumeApi(HttpMethod.POST,UserRestURIConstants.WORKINGHOLIDAY_FINALIZE_POLICY, header,parameters);
				logger.info("WORKINGHOLIDAY_FINALIZE_POLICY Response " + JsonUtils.jsonPrint(responsObject));
			};
		}.start();
		
		session.removeAttribute("creditCardNo");
		session.removeAttribute("expiryDate");
		String dueAmount = (String) session.getAttribute("dueAmount");
		model.addAttribute("dueAmount", dueAmount.replace(",", "").trim());
		session.removeAttribute("travel-temp-save");
		/*session.setAttribute("policyNo", responsObject.get("policyNo"));
		model.addAttribute("policyNo", responsObject.get("policyNo"));*/
		model.addAttribute("emailAddress",session.getAttribute("emailAddress"));
		model.addAttribute("referralCode",session.getAttribute("referralCode"));
		String pageTitle = WebServiceUtils.getPageTitle("page.workingholidayPlanConfirmation", UserRestURIConstants.getLanaguage(request));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.workingholidayPlanConfirmation", UserRestURIConstants.getLanaguage(request));
		
		session.removeAttribute("referralCode");  // vincent - remove session attribute "referral code" if success
		
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
		
		String twitterCard = WebServiceUtils.getPageTitle("twitter.working.holiday.card",
				UserRestURIConstants.getLanaguage(request));
		String twitterImage = WebServiceUtils.getPageTitle("twitter.working.holiday.image",
				UserRestURIConstants.getLanaguage(request));
		String twitterSite = WebServiceUtils.getPageTitle("twitter.working.holiday.site",
				UserRestURIConstants.getLanaguage(request));
		String twitterUrl = WebServiceUtils.getPageTitle("twitter.working.holiday.url",
				UserRestURIConstants.getLanaguage(request));
		String canonical = WebServiceUtils.getPageTitle("canonical.working.holiday",
				UserRestURIConstants.getLanaguage(request));
		model.addAttribute("twitterCard", twitterCard);
		model.addAttribute("twitterImage", twitterImage);
		model.addAttribute("twitterSite", twitterSite);
		model.addAttribute("twitterUrl", twitterUrl);
		model.addAttribute("canonical", canonical);
		
		return UserRestURIConstants.getSitePath(request)
				+ "workingholiday/workingholiday-confirmation";
	}
	
	
	
	
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
		/*int days = 0;
		int otherCount = 0, childCount = 0, adultCount = 0;
		boolean spouseCover = false, selfCover = false;
		Date dateD1 = new Date(workingholidayQuote.getTrLeavingDate());
		Date dateD2 = new Date(workingholidayQuote.getTrBackDate());
		LocalDate commencementDate = new LocalDate(new Date());
		LocalDate expiryDate = new LocalDate(dateD2);
		days = Days.daysBetween(commencementDate, expiryDate).getDays();
		WorkingHolidayQuoteBean workingholidayQuoteCount = (WorkingHolidayQuoteBean)session.getAttribute("workingholidayQuoteCount");
		selfCover = workingholidayQuoteCount.isSelfCover();
		spouseCover = workingholidayQuoteCount.isSpouseCover();
		childCount = workingholidayQuoteCount.getTotalChildWorkingHolidayer();
		otherCount = workingholidayQuoteCount.getTotalOtherWorkingHolidayer();
*/
		
		LocalDate commencementDate = new LocalDate(new Date());
		
		try {
			//workingholidayQuote.setTotalWorkingHolidayingDays(days + 1);
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
			logger.info("Response Get Working Holiday Quotes API " + JsonUtils.jsonPrint(responseJsonObj));
			
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
				return responseJsonObj.toString();
			} else {
				model.addAttribute("quoteDetails", session.getAttribute("quoteDetails"));
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
	
	@RequestMapping(value = "/saveAtt", method=RequestMethod.POST)
	@ResponseBody
	public String setDetailsFrom(String att, String value, HttpServletRequest request) {
		Method method;
		try {
			Object obj = request.getSession().getAttribute("workingHolidayPlanDetailsForm") != null ? 
					request.getSession().getAttribute("workingHolidayPlanDetailsForm") : WorkingHolidayDetailsBean.class.newInstance();
			method = obj.getClass().getMethod("set" + att, String.class);
			method.invoke(obj, value);
			request.getSession().setAttribute("workingHolidayPlanDetailsForm", obj);
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
		return "success";
	}
}