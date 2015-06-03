package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.Format;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
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
import com.ifwd.fwdhk.model.PlanDetailsForm;
import com.ifwd.fwdhk.model.QuoteDetails;
import com.ifwd.fwdhk.model.TravelQuoteBean;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.util.DateApi;
import com.ifwd.fwdhk.util.Methods;
import com.ifwd.fwdhk.util.StringHelper;
import com.ifwd.fwdhk.util.WebServiceUtils;
import com.ifwd.fwdhk.utils.services.SendEmailDao;

@Controller
public class TravelController {

	@Autowired
	private RestServiceDao restService;

	@Autowired
	private SendEmailDao sendEmail;

	@Autowired
	private MessageSource messageSource;
	
	@RequestMapping(value = {"/{lang}/travel", "/{lang}/travel-insurance", "/{lang}/travel-insurance/sharing/"})
	public ModelAndView getTravelHomePage(@RequestParam(required = false) final String promo, HttpServletRequest request, Model model,
			@RequestParam(required = false) final String utm_source,
			@RequestParam(required = false) final String utm_medium,
			@RequestParam(required = false) final String utm_campaign,
			@RequestParam(required = false) final String utm_content)  {

		UserRestURIConstants.setController("Travel");
		
		UserRestURIConstants urc = new UserRestURIConstants(); 
		urc.updateLanguage(request);
		
		request.setAttribute("controller", UserRestURIConstants.getController());
		//return UserRestURIConstants.checkLangSetPage(request) + "travel/travel";
		
		HttpSession session = request.getSession();
//		if (promo != null) {
//			if (!promo.equals("")) {
//				session.setAttribute("referralCode", StringHelper.emptyIfNull(promo));
//			}	
//		}
		session.setAttribute("referralCode", StringHelper.emptyIfNull(promo));
		System.out.println("travel promo " + (String)session.getAttribute("referralCode"));
		TravelQuoteBean travelQuote;
		
		//travelQuote = (TravelQuoteBean) session.getAttribute("travelQuote");
		travelQuote = (TravelQuoteBean) session.getAttribute("corrTravelQuote");
		
		if(travelQuote == null){
			travelQuote = new TravelQuoteBean();
			
			travelQuote.setTotalPersonalTraveller(1);
			travelQuote.setTotalAdultTraveller(1);
			travelQuote.setTotalChildTraveller(1);
			travelQuote.setTotalOtherTraveller(0);
			travelQuote.setPlanSelected("personal");
		}
		else{
			System.out.println("Plan selected : "+travelQuote.getPlanSelected());
		}
		
		session.setAttribute("corrTravelQuote", travelQuote);
		
		//default 
		/*
		travelQuote.setTotalPersonalTraveller(1);
		travelQuote.setTotalAdultTraveller(1);
		travelQuote.setTotalChildTraveller(1);
		travelQuote.setTotalOtherTraveller(0);
		travelQuote.setPlanSelected("personal");
		*/
		
		
		model.addAttribute("travelQuote", travelQuote);
		String pageTitle = WebServiceUtils.getPageTitle("page.travel", UserRestURIConstants.getLanaguage(request));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.travel", UserRestURIConstants.getLanaguage(request));
		
		String ogTitle = "";
		String ogType = "";
		String ogUrl = "";
		String ogImage = "";
		String ogDescription = "";
		System.out.println("travel path " + request.getRequestURI().toString());
		if (request.getRequestURI().toString().equals(request.getContextPath() + "/tc/travel-insurance/sharing/") || request.getRequestURI().toString().equals(request.getContextPath() + "/en/travel-insurance/sharing/")) 
		{
			ogTitle = WebServiceUtils.getPageTitle("travel.og.title", UserRestURIConstants.getLanaguage(request));
			ogType = WebServiceUtils.getPageTitle("travel.og.type", UserRestURIConstants.getLanaguage(request));
			ogUrl = WebServiceUtils.getPageTitle("travel.og.url", UserRestURIConstants.getLanaguage(request));
			ogImage = WebServiceUtils.getPageTitle("travel.og.image", UserRestURIConstants.getLanaguage(request));
			ogDescription = WebServiceUtils.getPageTitle("travel.og.description", UserRestURIConstants.getLanaguage(request));
		} else {
			ogTitle = WebServiceUtils.getPageTitle("travel.sharing.og.title", UserRestURIConstants.getLanaguage(request));
			ogType = WebServiceUtils.getPageTitle("travel.sharing.og.type", UserRestURIConstants.getLanaguage(request));
			ogUrl = WebServiceUtils.getPageTitle("travel.sharing.og.url", UserRestURIConstants.getLanaguage(request));
			ogImage = WebServiceUtils.getPageTitle("travel.sharing.og.image", UserRestURIConstants.getLanaguage(request));
			ogDescription = WebServiceUtils.getPageTitle("travel.sharing.og.description", UserRestURIConstants.getLanaguage(request));
			
		}
		
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
		model.addAttribute("ogTitle", ogTitle);
		model.addAttribute("ogType", ogType);
		model.addAttribute("ogUrl", ogUrl);
		model.addAttribute("ogImage", ogImage);
		model.addAttribute("ogDescription", ogDescription);
		
		return new ModelAndView(UserRestURIConstants.getSitePath(request) + "travel/travel");			
	}

	

	@RequestMapping(value = {"/{lang}/getTravelQuote", "/{lang}/travel-insurance/quote"})
	public ModelAndView prepareTravelPlan(
			@ModelAttribute("travelQuote") TravelQuoteBean travelQuote,
			BindingResult result, Model model, HttpServletRequest request) {
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		System.out.println("/{lang}/travel-insurance/quote");
		System.out.println("PLAN SELECTED " + travelQuote.getPlanSelected());
		System.out.println("PERSONAL " + travelQuote.getTotalPersonalTraveller());
		System.out.println("ADULT " + travelQuote.getTotalAdultTraveller());
		System.out.println("CHILD " + travelQuote.getTotalChildTraveller());
		System.out.println("OTHER " + travelQuote.getTotalOtherTraveller());
		
		UserRestURIConstants.setController("Travel");
		request.setAttribute("controller", UserRestURIConstants.getController());
		HttpSession session = request.getSession();
		session.removeAttribute("createPolicy");
		session.removeAttribute("policyNo");
		
		if (travelQuote.getTrLeavingDate() != null) 
		{
			session.setAttribute("travelQuote", travelQuote);
		} 
		else 
		{
			travelQuote = (TravelQuoteBean) session.getAttribute("corrTravelQuote");
			
			if(travelQuote == null)
			{
				return getTravelHomePage((String)session.getAttribute("referralCode"), request, model, "", "", "", "");		
			}				
		}
		System.out.println("plan: " + travelQuote.getPlanSelected() );
		session.setAttribute("corrTravelQuote", travelQuote);
		
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
			Date dateD1 = new Date(travelQuote.getTrLeavingDate());
			Date dateD2 = new Date(travelQuote.getTrBackDate());
			LocalDate commencementDate = new LocalDate(dateD1);
			LocalDate expiryDate = new LocalDate(dateD2);
			days = Days.daysBetween(commencementDate, expiryDate).getDays();
			travelQuote.setTotalTravellingDays(days + 1);
			
			int otherCount = 0, childCount = 0, adultCount = 0;
			boolean spouseCover = false, selfCover = false;
			if (travelQuote.getPlanSelected().equals("personal")) 
			{
				selfCover = true;
				spouseCover = false;
				otherCount = travelQuote.getTotalPersonalTraveller();
				otherCount -= 1;
			} 
			else 
			{
				adultCount = travelQuote.getTotalAdultTraveller();
				childCount = travelQuote.getTotalChildTraveller();
				otherCount = travelQuote.getTotalOtherTraveller();
				
				selfCover = true;
				if (adultCount > 1) 
				{
					spouseCover = true;
				} 
				else 
				{
					spouseCover = false;
				}
			}
			
			System.out.println("------------------------------------------------------------");
			System.out.println("CALLING API");
			System.out.println("SELF COVER " + selfCover);
			System.out.println("SPOUSE COVER " + spouseCover);
			System.out.println("CHILD COUNT " + childCount);
			System.out.println("OTHER COUNT " + otherCount);		
			System.out.print("------------------------------------------------------------");
			TravelQuoteBean travelQuoteCount = new TravelQuoteBean();
			travelQuoteCount.setSelfCover(selfCover);
			travelQuoteCount.setSpouseCover(spouseCover);
			travelQuoteCount.setTotalChildTraveller(childCount);
			travelQuoteCount.setTotalOtherTraveller(otherCount);
			session.setAttribute("travelQuoteCount", travelQuoteCount);
			session.setAttribute("planSelected", travelQuote.getPlanSelected());
			
			String promoCode = (String) session.getAttribute("referralCode");
			promoCode = java.net.URLEncoder.encode(promoCode, "UTF-8").replace("+", "%20");
			
			
			String Url = UserRestURIConstants.TRAVEL_GET_QUOTE + "?planCode=A"
					+ "&selfCover=" + selfCover + "&spouseCover=" + spouseCover
					+ "&childInput=" + childCount + "&otherInput="
					+ otherCount + "&commencementDate="
					+ commencementDate + "&expiryDate=" + expiryDate
					+ "&referralCode=" + promoCode;

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

			System.out.println("Get Travel Quotes API " + responseJsonObj);
			if (responseJsonObj.get("errMsgs") == null) {
				QuoteDetails quoteDetails = new QuoteDetails();
				quoteDetails.setPlanSelected(travelQuote.getPlanSelected());
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
				
				model.addAttribute("travelQuoteBean", travelQuote);
			} else {
				model.addAttribute("errMsgs", responseJsonObj.get("errMsgs"));
				return new ModelAndView(UserRestURIConstants.getSitePath(request)
						+ "travel/travel");
			}
				
			
			

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errMsgs", "System Error");
			return new ModelAndView(UserRestURIConstants.getSitePath(request)
					+ "travel/travel");
		}
		String pageTitle = WebServiceUtils.getPageTitle("page.travelQuote", UserRestURIConstants.getLanaguage(request));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.travelQuote", UserRestURIConstants.getLanaguage(request));
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
		System.out.println("plan: " + travelQuote.getPlanSelected() );
		
		return new ModelAndView(UserRestURIConstants.getSitePath(request)
				+ "travel/travel-plan");
	}


	// BMG updateTravelQuote
	// return JSON
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/updateTravelQuote", method = RequestMethod.POST)
	@ResponseBody
	public String updateTravelQuote(
			@ModelAttribute("travelQuote") TravelQuoteBean travelQuote,
			BindingResult result, Model model, HttpServletRequest request) {
		UserRestURIConstants.setController("Travel");
		
		System.out.println("/updateTravelQuote");
		//System.out.println("PLAN SELECTED " + travelQuote.getPlanSelected());
		System.out.println("PERSONAL " + travelQuote.getTotalPersonalTraveller());
		System.out.println("ADULT " + travelQuote.getTotalAdultTraveller());
		System.out.println("CHILD " + travelQuote.getTotalChildTraveller());
		System.out.println("OTHER " + travelQuote.getTotalOtherTraveller());
		
		// test planselected
		if( travelQuote.getTotalPersonalTraveller() > 0 ) {
			travelQuote.setPlanSelected("personal");
		}
		else if( travelQuote.getTotalAdultTraveller() > 0 ) {
			travelQuote.setPlanSelected("family");
		}
		travelQuote.setTotalPersonalTraveller(Integer.parseInt(request.getParameter("totalPersonalTraveller")));
		travelQuote.setTotalAdultTraveller(Integer.parseInt(request.getParameter("totalAdultTraveller")));
		travelQuote.setTotalChildTraveller(Integer.parseInt(request.getParameter("totalChildTraveller")));
		travelQuote.setTotalOtherTraveller(Integer.parseInt(request.getParameter("totalOtherTraveller")));
		travelQuote.setTrLeavingDate(request.getParameter("trLeavingDate"));
		travelQuote.setTrBackDate(request.getParameter("trBackDate"));
		travelQuote.setTotalTraveller(travelQuote.getTotalAdultTraveller()
				+ travelQuote.getTotalChildTraveller()
				+ travelQuote.getTotalOtherTraveller()
				+ travelQuote.getTotalPersonalTraveller());
		
		UserRestURIConstants.setController("Travel");
		request.setAttribute("controller", UserRestURIConstants.getController());
		HttpSession session = request.getSession();
		session.removeAttribute("createPolicy");
		session.removeAttribute("policyNo");
		
		if (travelQuote.getTrLeavingDate() != null) 
		{
			session.setAttribute("travelQuote", travelQuote);
		} 
		else 
		{
			travelQuote = (TravelQuoteBean) session.getAttribute("corrTravelQuote");
			
			if(travelQuote == null)
			{
				//return getTravelHomePage((String)session.getAttribute("referralCode"), request, model);
				return "travelQuote == null";
			}				
		}
		
		session.setAttribute("corrTravelQuote", travelQuote);
		//System.out.println("plan: " + travelQuote.getPlanSelected() );
		
		try {
			System.out.println("=1");
			
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
			
			System.out.println("=2");
			int days = 0;

			/* Calculate total Days */
			Date dateD1 = new Date(travelQuote.getTrLeavingDate());
			Date dateD2 = new Date(travelQuote.getTrBackDate());
			LocalDate commencementDate = new LocalDate(dateD1);
			LocalDate expiryDate = new LocalDate(dateD2);
			days = Days.daysBetween(commencementDate, expiryDate).getDays();
			travelQuote.setTotalTravellingDays(days + 1);
			
			System.out.println("=3" + travelQuote );
			System.out.println("plan:"+travelQuote.getPlanSelected());
			int otherCount = 0, childCount = 0, adultCount = 0;
			boolean spouseCover = false, selfCover = false;
			if (travelQuote.getPlanSelected().equals("personal")) 
			{
				System.out.println("=4");
				selfCover = true;
				spouseCover = false;
				otherCount = travelQuote.getTotalPersonalTraveller();
				otherCount -= 1;
			} 
			else 
			{
				System.out.println("=5");
				adultCount = travelQuote.getTotalAdultTraveller();
				childCount = travelQuote.getTotalChildTraveller();
				otherCount = travelQuote.getTotalOtherTraveller();
				
				selfCover = true;
				if (adultCount > 1) 
				{
					spouseCover = true;
				} 
				else 
				{
					spouseCover = false;
				}
			}
			
			System.out.println("------------------------------------------------------------");
			System.out.println("UpdateTravelQuote CALLING API");
			System.out.println("SELF COVER " + selfCover);
			System.out.println("SPOUSE COVER " + spouseCover);
			System.out.println("CHILD COUNT " + childCount);
			System.out.println("OTHER COUNT " + otherCount);		
			System.out.print("------------------------------------------------------------");
			TravelQuoteBean travelQuoteCount = new TravelQuoteBean();
			travelQuoteCount.setSelfCover(selfCover);
			travelQuoteCount.setSpouseCover(spouseCover);
			travelQuoteCount.setTotalChildTraveller(childCount);
			travelQuoteCount.setTotalOtherTraveller(otherCount);
			session.setAttribute("travelQuoteCount", travelQuoteCount);
			session.setAttribute("planSelected", travelQuote.getPlanSelected());
			
			
			String promoCode = (String) session.getAttribute("referralCode");
			promoCode = java.net.URLEncoder.encode(promoCode, "UTF-8").replace("+", "%20");
			String Url = UserRestURIConstants.TRAVEL_GET_QUOTE + "?planCode=A"
					+ "&selfCover=" + selfCover + "&spouseCover=" + spouseCover
					+ "&childInput=" + childCount + "&otherInput="
					+ otherCount + "&commencementDate="
					+ commencementDate + "&expiryDate=" + expiryDate
					+ "&referralCode=" + promoCode;

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

			System.out.println("total days: " + travelQuote.getTotalTravellingDays());
			System.out.println("Get Travel Quotes API " + responseJsonObj);
			if (responseJsonObj.get("errMsgs") == null) {
				
				
				responseJsonObj.put("totalDays", travelQuote.getTotalTravellingDays());
				
				QuoteDetails quoteDetails = new QuoteDetails();
				quoteDetails.setPlanSelected(travelQuote.getPlanSelected());
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
				
				
				model.addAttribute("travelQuoteBean", travelQuote);
				
				return responseJsonObj.toString();
			} else {
				model.addAttribute("errMsgs", responseJsonObj.get("errMsgs"));
				//return new ModelAndView(UserRestURIConstants.getSitePath(request)
				//		+ "travel/travel");
				return "exception error";
			}
				
			
			

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errMsgs", "System Error");
			//return new ModelAndView(UserRestURIConstants.getSitePath(request)
			//		+ "travel/travel");
			return "System Error";
		}
//		String pageTitle = WebServiceUtils.getPageTitle("page.travelQuote", UserRestURIConstants.getLanaguage(request));
//		String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.travelQuote", UserRestURIConstants.getLanaguage(request));
//		model.addAttribute("pageTitle", pageTitle);
//		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
		
		
		
//		return new ModelAndView(UserRestURIConstants.getSitePath(request)
//				+ "travel/travel-plan");
//		return "JSON";
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/applyTravelPromoCode", method = RequestMethod.POST)
	@ResponseBody
	public String applyPromotionCode(
			@ModelAttribute("travelQuote") TravelQuoteBean travelQuote,
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
		Date dateD1 = new Date(travelQuote.getTrLeavingDate());
		Date dateD2 = new Date(travelQuote.getTrBackDate());
		LocalDate commencementDate = new LocalDate(dateD1);
		LocalDate expiryDate = new LocalDate(dateD2);
		days = Days.daysBetween(commencementDate, expiryDate).getDays();
		TravelQuoteBean travelQuoteCount = (TravelQuoteBean)session.getAttribute("travelQuoteCount");
		selfCover = travelQuoteCount.isSelfCover();
		spouseCover = travelQuoteCount.isSpouseCover();
		childCount = travelQuoteCount.getTotalChildTraveller();
		otherCount = travelQuoteCount.getTotalOtherTraveller();
		System.out.println("------------------------------------------------------------");
		System.out.println("CALLING API");
		System.out.println("SELF COVER " + selfCover);
		System.out.println("SPOUSE COVER " + spouseCover);
		System.out.println("CHILD COUNT " + childCount);
		System.out.println("OTHER COUNT " + otherCount);		
		System.out.println("------------------------------------------------------------");
		
		try {
			travelQuote.setTotalTravellingDays(days + 1);
			String promoCode = request.getParameter("promoCode");
			promoCode = java.net.URLEncoder.encode(promoCode, "UTF-8").replace("+", "%20");
			String Url = UserRestURIConstants.TRAVEL_GET_QUOTE + "?planCode=A"
					+ "&selfCover=" + selfCover + "&spouseCover=" + spouseCover
					+ "&childInput=" + childCount + "&otherInput=" + otherCount
					+ "&commencementDate=" + commencementDate + "&expiryDate="
					+ expiryDate + "&referralCode=" + promoCode;

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

			System.out.println("Response Get Travel Quotes API "
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

	@RequestMapping(value = {"/{lang}/getYourDetails", "/{lang}/travel-insurance/user-details"})
	public ModelAndView prepareYourDetails(
			@ModelAttribute("travelQuote") TravelQuoteBean travelQuote,
			BindingResult result, Model model, HttpServletRequest request) {
		UserRestURIConstants.setController("Travel");
		
		HttpSession session = request.getSession();
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		if (session.getAttribute("token") == null) 
		{
			model.addAttribute("errMsgs", "Session Expired");
			return getTravelHomePage((String)session.getAttribute("referralCode"), request, model, "", "", "", "");	
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
		System.out.println("Seeeeeee" + selectPlanName);
		
		if (travelQuote.getTrLeavingDate() != null) {
			session.setAttribute("travelQuote", travelQuote);
		} else {
			travelQuote = (TravelQuoteBean) session.getAttribute("travelQuote");
			if(travelQuote == null){
				//return getTravelHomePage((String)session.getAttribute("referralCode"), request, model);	
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
					System.out.println("key " + mapEntry.getKey() + " value " + mapEntry.getValue());
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
					System.out.println(" jsonRelationShipArray ====>>>>>>"
							+ jsonRelationshipCode);

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
						+ "travel/travel-plan");		
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
					+ "travel/travel-plan");		
		}
		Map<String,String> mapHkId = new TreeMap<>();

		String lang = UserRestURIConstants.getLanaguage(request);
		// TODO please change to apply message bundle nicely
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
				+ "travel/travel-plan-details");		
	}

	@RequestMapping(value = { "/travel-temp-save"})
	@ResponseBody
	public String travelTempSave(
			@ModelAttribute("frmYourDetails") PlanDetailsForm planDetailsForm,
			BindingResult result, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("travel-temp-save", planDetailsForm);
		return "success";
		
	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = {"/{lang}/prepareUserSummary", "/{lang}/travel-insurance/travel-summary"})
	public ModelAndView prepareSummary(
			@ModelAttribute("frmYourDetails") PlanDetailsForm planDetailsForm,
			BindingResult result, Model model, HttpServletRequest request) {
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
			System.out.println(WebServiceUtils
					.transformLanaguage(UserRestURIConstants
							.getLanaguage(request)));
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
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			parameters.put("expiryDate", session.getAttribute("expiryDate"));
			responsObject = restService.consumeApi(HttpMethod.POST, UserRestURIConstants.TRAVEL_FINALIZE_POLICY, header, parameters);
			
			
		}
		
		
		System.out.println("planDetaisForm " + planDetailsForm.toString() );
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
			//return getTravelHomePage((String)session.getAttribute("referralCode"), request, model);				
			return getTravelHomePage((String)session.getAttribute("referralCode"), request, model, "", "", "", "");		
		}
		UserRestURIConstants.setController("Travel");
		request.setAttribute("controller", UserRestURIConstants.getController());
		 
		
		UserDetails userDetails = new UserDetails();
		DateApi dateApi = new DateApi();

		String dueAmount = WebServiceUtils.getParameterValue("finalDueAmount",
				session, request);
		String selectPlanName = WebServiceUtils.getParameterValue(
				"selectedPlanName", session, request);
		;

		System.out.println("inside Controller fro prepare Summary"
				+ selectPlanName);

		String deaprtureDate = dateApi.pickDate((String) session
				.getAttribute("departureDate"));
		String returnDate = dateApi.pickDate((String) session
				.getAttribute("returnDate"));
		
		System.out.println("departureDate " + deaprtureDate);
		System.out.println("returnDate " + returnDate);
		
		
		
		String applicantFullName = WebServiceUtils.getParameterValue("fullName", session, request);
		String applicantHKID = WebServiceUtils.getParameterValue("hkid", session, request);
		String applicantMobNo = WebServiceUtils.getParameterValue("mobileNo", session, request);
		String emailAddress = WebServiceUtils.getParameterValue("emailAddress",	session, request);
		String selectedHkidPassApplicant = WebServiceUtils.getParameterValue("selectedHkidPassApplicant",	session, request);
		String dob = WebServiceUtils.getParameterValue("applicantDob",	session, request);
		
		
		Enumeration<String> parameterNames = request.getParameterNames();
		while (parameterNames.hasMoreElements()) {
			String paramName = parameterNames.nextElement();
			
			String[] paramValues = request.getParameterValues(paramName);
			for (int i = 0; i < paramValues.length; i++) {
				String paramValue = paramValues[i];
				System.out.println(paramName + " t " + paramValue);
				
			}
		}
		
		//String dob = WebServiceUtils.getParameterValue("applicantDob", session, request);
		try {
			Calendar dateDob = Calendar.getInstance();
			dateDob.setTime(new Date(dob));
			Format f = new SimpleDateFormat("yyyy-MM-dd");
			dob = f.format(dateDob.getTime());
		} catch (Exception e) {
			
		}
		
		String totalTravellingDays = WebServiceUtils.getParameterValue("totalTravellingDays", session, request);
		System.out.println("totalTravellingDays " + totalTravellingDays);
		String strChildCount = WebServiceUtils.getParameterValue("totalChildTraveller", session, request);
		String strAdultCount = WebServiceUtils.getParameterValue("totalAdultTraveller", session, request);
		String strOtherCount = WebServiceUtils.getParameterValue("totalOtherTraveller", session, request);
				
		if (planDetailsForm.getDepartureDate() != null) {
			session.setAttribute("travelPlanDetailsForm", planDetailsForm);
		} else {
			planDetailsForm = (PlanDetailsForm) session
					.getAttribute("travelPlanDetailsForm");
		}
		int totalChild;
		int totalAdults;
		int totalOthers;
		int totalPersonal = planDetailsForm.getTotalPersonalTraveller();
		
		if (strChildCount != "" || strChildCount != null) {
			totalChild = Integer.valueOf(strChildCount);
		} else {
			totalChild = 0;
		}

		if (strAdultCount != "" || strAdultCount != null) {
			totalAdults = Integer.valueOf(strAdultCount);
		} else {
			totalAdults = 0;
		}
		if (strOtherCount != "" || strOtherCount != null) {
			totalOthers = Integer.valueOf(strOtherCount);
		} else {
			totalOthers = 0;
		}

		int totalCount = totalPersonal + totalAdults + totalChild + totalOthers;

		userDetails.setFullName(applicantFullName);
		userDetails.setHkid(applicantHKID);
		userDetails.setMobileNo(applicantMobNo);
		userDetails.setEmailAddress(emailAddress);
		userDetails.setDob(dob);
//		userDetails.setDob("");
		final String INSURED_RELATIONSHIP_SELF = "SE";
		String relationOfSelfTraveller = "", relationOfAdultTraveller = "";
		String relationOfChildTraveller = "", relationOfOtherTraveller = "";

		if (planDetailsForm.getPlanSelected().equals("personal")) {
			relationOfSelfTraveller = "SE";
			relationOfAdultTraveller = "FE";
		} else if (planDetailsForm.getPlanSelected().equals("family")) {
			relationOfSelfTraveller = "SE";
			relationOfAdultTraveller = "SP";
			relationOfChildTraveller = "CH";
			relationOfOtherTraveller = "OT";
		}

		JSONObject parameters = new JSONObject();
		parameters.put("planCode", session.getAttribute("planSelected"));
		
		//parameters.put("planCode", planDetailsForm.getPlanCode());
		
		parameters.put("commencementDate", deaprtureDate);
		parameters.put("expiryDate", returnDate);
		JSONArray insured = new JSONArray();

		String langSelected = UserRestURIConstants.getLanaguage(request);
		
		for (int inx = 0; inx < planDetailsForm.getTotalPersonalTraveller(); inx++) {
			planDetailsForm.setPersonalAgeRangeName(WebServiceUtils.getAgeRangeNames(planDetailsForm.getPersonalAgeRange(), langSelected));
		}
		
		for (int inx = 0; inx < planDetailsForm.getTotalAdultTraveller(); inx++) {
			planDetailsForm.setAdultAgeRangeName(WebServiceUtils.getAgeRangeNames(planDetailsForm.getAdultAgeRange(), langSelected));
		}
		
		for (int inx = 0; inx < planDetailsForm.getTotalChildTraveller(); inx++) {
			planDetailsForm.setChildAgeRangeName(WebServiceUtils.getAgeRangeNames(planDetailsForm.getChildAgeRange(), langSelected));
		}
		
		for (int inx = 0; inx < planDetailsForm.getTotalOtherTraveller(); inx++) {	
			planDetailsForm.setOtherAgeRangeName(WebServiceUtils.getAgeRangeNames(planDetailsForm.getOtherAgeRange(), langSelected));		
		}
		
		// personal
 		for (int inx = 0; inx < planDetailsForm.getTotalPersonalTraveller(); inx++) {
			JSONObject beneficiary = new JSONObject();
			JSONObject personal = new JSONObject();
		
			personal.put("name", StringHelper.emptyIfNull( planDetailsForm.getPersonalName()[inx] ).toUpperCase() );
			personal.put("ageRange", StringHelper.emptyIfNull( planDetailsForm.getPersonalAgeRange()[inx] ).toUpperCase() );
			
			
			personal.put(hkId,	checkPasswortAndHkid(hkId,
					planDetailsForm.getSelectedPersonalHkidPass()[inx],
					planDetailsForm.getPersonalHKID()[inx])
			 );
			personal.put(passId, checkPasswortAndHkid(passId,
					planDetailsForm.getSelectedPersonalHkidPass()[inx],
					planDetailsForm.getPersonalHKID()[inx])
			 );

			
			personal.put(hkId,	checkPasswortAndHkid(hkId,
							planDetailsForm.getSelectedPersonalHkidPass()[inx],
							planDetailsForm.getPersonalHKID()[inx])
					 );
					 
			personal.put(passId, checkPasswortAndHkid(passId,
							planDetailsForm.getSelectedPersonalHkidPass()[inx],
							planDetailsForm.getPersonalHKID()[inx])
					 );


			if (inx != 0) {// For other travelers skip first one
				personal.put("relationship", "FE");
				
			
				if (planDetailsForm.getPersonalBenificiaryFullName().length > 0) {
					if (!planDetailsForm.getPersonalBenificiaryFullName()[inx].isEmpty() 
							&& INSURED_RELATIONSHIP_SELF.compareToIgnoreCase(planDetailsForm.getPersonalBeneficiary()[inx]) != 0) {// If have beneficiary
						beneficiary.put("name", StringHelper.emptyIfNull( planDetailsForm.getPersonalBenificiaryFullName()[inx] ).toUpperCase());
						beneficiary.put(hkId,
										checkPasswortAndHkid(
												hkId,
												planDetailsForm.getSelectedPersonalBenefitiaryHkidPass()[inx],
												planDetailsForm.getPersonalBenificiaryHkid()[inx]));
						beneficiary.put(passId,
										checkPasswortAndHkid(
												passId,
												planDetailsForm.getSelectedPersonalBenefitiaryHkidPass()[inx],
												planDetailsForm.getPersonalBenificiaryHkid()[inx]));
						beneficiary.put("relationship", StringHelper.emptyIfNull( planDetailsForm.getPersonalBeneficiary()[inx] ).toUpperCase());
						personal.put("beneficiary", beneficiary);
					} else {// If don't have beneficiary then
						beneficiary.put("name", StringHelper.emptyIfNull( planDetailsForm.getPersonalName()[inx] ).toUpperCase());
						beneficiary.put(hkId,
										checkPasswortAndHkid(
												hkId,
												planDetailsForm.getSelectedPersonalHkidPass()[inx],
												planDetailsForm.getPersonalHKID()[inx]));
						beneficiary.put(passId,
										checkPasswortAndHkid(
												passId,
												planDetailsForm.getSelectedPersonalHkidPass()[inx],
												planDetailsForm.getPersonalHKID()[inx]));
						beneficiary.put("relationship", "SE");
						personal.put("beneficiary", beneficiary);
						
						// clear bene info if bene relationship is SE
						planDetailsForm.getPersonalBenificiaryFullName()[inx] = "";
						planDetailsForm.getPersonalBenificiaryHkid()[inx] = "";
						
					}
				} else {// If don't have beneficiary then
					
					beneficiary.put("name", StringHelper.emptyIfNull( planDetailsForm.getAdultName()[inx] ).toUpperCase());
					beneficiary
							.put(hkId,
									checkPasswortAndHkid(hkId, 
											planDetailsForm.getSelectedPersonalHkidPass()[inx],
											planDetailsForm.getPersonalHKID()[inx]));
					beneficiary
							.put(passId,
									checkPasswortAndHkid(
											passId,
											planDetailsForm.getSelectedPersonalHkidPass()[inx],
											planDetailsForm.getPersonalHKID()[inx]));
					beneficiary.put("relationship", "SE");
					personal.put("beneficiary", beneficiary);				
				}
			} else {// This is for Myself - with & wothout the beneficiary
				personal.put("relationship", "SE");
				if (planDetailsForm.getPersonalBenificiaryFullName().length > 0) {
					if (!planDetailsForm.getPersonalBenificiaryFullName()[inx].isEmpty()
							&& INSURED_RELATIONSHIP_SELF.compareToIgnoreCase(planDetailsForm.getPersonalBeneficiary()[inx]) != 0) {// If have beneficiary
						beneficiary.put("name", StringHelper.emptyIfNull( planDetailsForm.getPersonalBenificiaryFullName()[inx] ).toUpperCase());
						beneficiary
								.put(hkId,
										checkPasswortAndHkid(
												hkId,
												planDetailsForm.getSelectedPersonalBenefitiaryHkidPass()[inx],
												planDetailsForm.getPersonalBenificiaryHkid()[inx]));
						beneficiary
								.put(passId,
										checkPasswortAndHkid(
												passId,
												planDetailsForm.getSelectedPersonalBenefitiaryHkidPass()[inx],
												planDetailsForm.getPersonalBenificiaryHkid()[inx]));
						beneficiary.put("relationship", planDetailsForm.getPersonalBeneficiary()[inx]);
						personal.put("beneficiary", beneficiary);
					} else {// If don't have beneficiary then
						beneficiary.put("name", StringHelper.emptyIfNull( planDetailsForm.getPersonalName()[inx] ).toUpperCase());
						beneficiary
						.put(hkId,
								checkPasswortAndHkid(hkId, 
										planDetailsForm.getSelectedPersonalHkidPass()[inx],
										planDetailsForm.getPersonalHKID()[inx]));
						beneficiary
						.put(passId,
								checkPasswortAndHkid(
										passId,
										planDetailsForm.getSelectedPersonalHkidPass()[inx],
										planDetailsForm.getPersonalHKID()[inx]));
						beneficiary.put("relationship", "SE");
						personal.put("beneficiary", beneficiary);
						
						// clear bene info if bene relationship is SE
						planDetailsForm.getPersonalBenificiaryFullName()[inx] = "";
						//planDetailsForm.getPersonalBenificiaryHkid()[inx] = "";
					}
				} else {// If don't have beneficiary then
					
					beneficiary.put("name", StringHelper.emptyIfNull( planDetailsForm.getPersonalName()[inx] ).toUpperCase());
					System.out.println("planDetailsForm.getSelectedPersonalHkidPass()[inx] " + planDetailsForm.getSelectedPersonalHkidPass()[inx]);
					System.out.println("planDetailsForm.getPersonalHKID()[inx] " + planDetailsForm.getPersonalHKID()[inx]);
					
					beneficiary.put("hkId", 
							checkPasswortAndHkid(
									"hkId",
									planDetailsForm.getSelectedPersonalHkidPass()[inx],
									planDetailsForm.getPersonalHKID()[inx]));
					beneficiary.put("passport",
							checkPasswortAndHkid(
									"passport",
									planDetailsForm.getSelectedPersonalHkidPass()[inx],
									planDetailsForm.getPersonalHKID()[inx]));
					beneficiary.put("relationship", "SE");
					personal.put("beneficiary", beneficiary);
					
				}
			}
							
			insured.add(personal);
			
			// update relationship desc
			String[] relationships = planDetailsForm.getPersonalRelationDesc();
			if(relationships == null){
				// not found in ModelAttribute
				relationships = new String[planDetailsForm.getTotalPersonalTraveller()];
			}
			String[] beneRelationships = planDetailsForm.getPersonalBeneRelationDesc();
			if(beneRelationships == null){
				// not found in ModelAttribute
				beneRelationships = new String[planDetailsForm.getTotalPersonalTraveller()];
			}
			
			System.out.println("personal relationship " + personal.get("relationship").toString());
			System.out.println("beneficiary relationship " + beneficiary.get("relationship").toString());
			
			planDetailsForm.setPersonalRelationDesc(WebServiceUtils.getInsuredRelationshipDesc(relationships, langSelected, personal.get("relationship").toString(), inx));
			
			planDetailsForm.setPersonalBeneRelationDesc(WebServiceUtils.getBeneRelationshipDesc(beneRelationships, langSelected, beneficiary.get("relationship").toString(), inx));			
		}
		// personal
		System.out.println("personal done " + planDetailsForm.getTotalPersonalTraveller());		

		for (int inx = 0; inx < planDetailsForm.getTotalAdultTraveller(); inx++) {
			JSONObject beneficiary = new JSONObject();
			JSONObject adult = new JSONObject();
			adult.put("name", StringHelper.emptyIfNull( planDetailsForm.getAdultName()[inx] ).toUpperCase() );
			adult.put("ageRange", StringHelper.emptyIfNull( planDetailsForm.getAdultAgeRange()[inx] ).toUpperCase() );
			adult.put(hkId,	checkPasswortAndHkid(hkId,
							planDetailsForm.getSelectedAdHkidPass()[inx],
							planDetailsForm.getAdultHKID()[inx])
					 );
			adult.put(passId, checkPasswortAndHkid(passId,
							planDetailsForm.getSelectedAdHkidPass()[inx],
							planDetailsForm.getAdultHKID()[inx])
					 );


			if (inx != 0) {// For other travelers skip first one
				
				if (planDetailsForm.getPlanSelected().equals("personal")) {
					adult.put("relationship", "FE");
				} else {
					adult.put("relationship", "SP");
				}
				
				if (planDetailsForm.getAdultBenificiaryFullName().length > 0) {
					if (!planDetailsForm.getAdultBenificiaryFullName()[inx].isEmpty() 
							&& INSURED_RELATIONSHIP_SELF.compareToIgnoreCase(planDetailsForm.getAdultBeneficiary()[inx]) != 0) {// If have beneficiary
						beneficiary.put("name", StringHelper.emptyIfNull( planDetailsForm.getAdultBenificiaryFullName()[inx] ).toUpperCase());
						beneficiary.put(hkId,
										checkPasswortAndHkid(
												hkId,
												planDetailsForm.getSelectedAdBenefitiaryHkidPass()[inx],
												planDetailsForm.getAdultBenificiaryHkid()[inx]));
						beneficiary.put(passId,
										checkPasswortAndHkid(
												passId,
												planDetailsForm.getSelectedAdBenefitiaryHkidPass()[inx],
												planDetailsForm.getAdultBenificiaryHkid()[inx]));
						beneficiary.put("relationship", StringHelper.emptyIfNull( planDetailsForm.getAdultBeneficiary()[inx] ).toUpperCase());
						adult.put("beneficiary", beneficiary);
					} else {// If don't have beneficiary then
						beneficiary.put("name", StringHelper.emptyIfNull( planDetailsForm.getAdultName()[inx] ).toUpperCase());
						beneficiary.put(hkId,
										checkPasswortAndHkid(
												hkId,
												planDetailsForm.getSelectedAdHkidPass()[inx],
												planDetailsForm.getAdultHKID()[inx]));
						beneficiary.put(passId,
										checkPasswortAndHkid(
												passId,
												planDetailsForm.getSelectedAdHkidPass()[inx],
												planDetailsForm.getAdultHKID()[inx]));
						beneficiary.put("relationship", "SE");
						adult.put("beneficiary", beneficiary);
						
						// clear bene info if bene relationship is SE
						planDetailsForm.getAdultBenificiaryFullName()[inx] = "";
						planDetailsForm.getAdultBenificiaryHkid()[inx] = "";
						
					}
				} else {// If don't have beneficiary then
					beneficiary.put("name", StringHelper.emptyIfNull( planDetailsForm.getAdultName()[inx] ).toUpperCase());
					beneficiary
							.put(hkId,
									checkPasswortAndHkid(hkId, 
											planDetailsForm.getSelectedAdHkidPass()[inx],
											planDetailsForm.getAdultHKID()[inx]));
					beneficiary
							.put(passId,
									checkPasswortAndHkid(
											passId,
											planDetailsForm.getSelectedAdHkidPass()[inx],
											planDetailsForm.getAdultHKID()[inx]));
					beneficiary.put("relationship", "SE");
					adult.put("beneficiary", beneficiary);				
				}
			} else {// This is for Myself - with & wothout the beneficiary
				adult.put("relationship", relationOfSelfTraveller);
				if (planDetailsForm.getAdultBenificiaryFullName().length > 0) {
					if (!planDetailsForm.getAdultBenificiaryFullName()[inx].isEmpty()
							&& INSURED_RELATIONSHIP_SELF.compareToIgnoreCase(planDetailsForm.getAdultBeneficiary()[inx]) != 0) {// If have beneficiary
						beneficiary.put("name", StringHelper.emptyIfNull( planDetailsForm.getAdultBenificiaryFullName()[inx] ).toUpperCase());
						beneficiary
								.put(hkId,
										checkPasswortAndHkid(
												hkId,
												planDetailsForm.getSelectedAdBenefitiaryHkidPass()[inx],
												planDetailsForm.getAdultBenificiaryHkid()[inx]));
						beneficiary
								.put(passId,
										checkPasswortAndHkid(
												passId,
												planDetailsForm.getSelectedAdBenefitiaryHkidPass()[inx],
												planDetailsForm.getAdultBenificiaryHkid()[inx]));
						beneficiary.put("relationship", planDetailsForm.getAdultBeneficiary()[inx]);
						adult.put("beneficiary", beneficiary);
					} else {// If don't have beneficiary then
						beneficiary.put("name", StringHelper.emptyIfNull( planDetailsForm.getAdultName()[inx] ).toUpperCase());
						beneficiary
								.put(hkId,
										checkPasswortAndHkid(
												hkId,
												planDetailsForm.getSelectedAdHkidPass()[inx],
												planDetailsForm.getAdultHKID()[inx]));
						beneficiary
								.put(passId,
										checkPasswortAndHkid(
												passId,
												planDetailsForm.getSelectedAdHkidPass()[inx],
												planDetailsForm.getAdultHKID()[inx]));

						beneficiary.put("relationship", "SE");
						adult.put("beneficiary", beneficiary);
						
						// clear bene info if bene relationship is SE
						planDetailsForm.getAdultBenificiaryFullName()[inx] = "";
						planDetailsForm.getAdultBenificiaryHkid()[inx] = "";
					}
				} else {// If don't have beneficiary then
					beneficiary.put("name", StringHelper.emptyIfNull( planDetailsForm.getAdultName()[inx] ).toUpperCase());
					beneficiary.put(hkId,
									checkPasswortAndHkid(hkId, planDetailsForm
											.getSelectedAdHkidPass()[inx],
											planDetailsForm.getAdultHKID()[inx]));
					beneficiary.put(passId,
									checkPasswortAndHkid(
											passId,
											planDetailsForm.getSelectedAdHkidPass()[inx],
											planDetailsForm.getAdultHKID()[inx]));
					beneficiary.put("relationship", "SE");
					adult.put("beneficiary", beneficiary);
				}
			}
						
			insured.add(adult);
			
			// update relationship desc
			String[] relationships = planDetailsForm.getAdultRelationDesc();
			if(relationships == null){
				// not found in ModelAttribute
				relationships = new String[planDetailsForm.getTotalAdultTraveller()];
			}
			String[] beneRelationships = planDetailsForm.getAdultBeneRelationDesc();
			if(beneRelationships == null){
				// not found in ModelAttribute
				beneRelationships = new String[planDetailsForm.getTotalAdultTraveller()];
			}
			planDetailsForm.setAdultRelationDesc(WebServiceUtils.getInsuredRelationshipDesc(relationships, langSelected, adult.get("relationship").toString(), inx));
			planDetailsForm.setAdultBeneRelationDesc(WebServiceUtils.getBeneRelationshipDesc(beneRelationships, langSelected, beneficiary.get("relationship").toString(), inx));			
		}
		System.out.println("personal done " + planDetailsForm.getTotalAdultTraveller());
		if (planDetailsForm.getTotalChildTraveller() > 0) {
			for (int inx = 0; inx < planDetailsForm.getTotalChildTraveller(); inx++) {
				JSONObject child = new JSONObject();
				JSONObject beneficiary = new JSONObject();
				child.put("name",     StringHelper.emptyIfNull( planDetailsForm.getChildName()[inx] ).toUpperCase());
				child.put("ageRange", StringHelper.emptyIfNull( planDetailsForm.getChildAgeRange()[inx] ).toUpperCase());
				
				child.put(
						hkId,
						checkPasswortAndHkid(hkId,
								planDetailsForm.getSelectedChldHkidPass()[inx],
								planDetailsForm.getChildHKID()[inx]));
				child.put(
						passId,
						checkPasswortAndHkid(passId,
								planDetailsForm.getSelectedChldHkidPass()[inx],
								planDetailsForm.getChildHKID()[inx]));
				child.put("relationship", relationOfChildTraveller);

				/* String strings = planDetailsForm.getAdultBeneficiary()[inx]; */
				/* JSONObject beneficiary = new JSONObject(); */
				if (planDetailsForm.getChildBenificiaryFullName().length > 0) {
					if (!planDetailsForm.getChildBenificiaryFullName()[inx].isEmpty()
							&& INSURED_RELATIONSHIP_SELF.compareToIgnoreCase(planDetailsForm.getChildBeneficiary()[inx]) != 0) {// If have beneficiary
						beneficiary.put("name", StringHelper.emptyIfNull( planDetailsForm.getChildBenificiaryFullName()[inx] ).toUpperCase());
						beneficiary.put(hkId,
										checkPasswortAndHkid(
												hkId,
												planDetailsForm.getSelectedChldBenefitiaryHkidPass()[inx],
												planDetailsForm.getChildBenificiaryHkid()[inx]));
						beneficiary.put(passId,
										checkPasswortAndHkid(
												passId,
												planDetailsForm.getSelectedChldBenefitiaryHkidPass()[inx],
												planDetailsForm.getChildBenificiaryHkid()[inx]));
						beneficiary.put("relationship", planDetailsForm.getChildBeneficiary()[inx]);
						child.put("beneficiary", beneficiary);
					} else {// If don't have beneficiary
						beneficiary.put("name", StringHelper.emptyIfNull( planDetailsForm.getChildName()[inx] ).toUpperCase());
						beneficiary.put(hkId,
								checkPasswortAndHkid(hkId, planDetailsForm.getSelectedChldHkidPass()[inx],
										planDetailsForm.getChildHKID()[inx]));
						beneficiary.put(passId,	checkPasswortAndHkid(passId, planDetailsForm
										.getSelectedChldHkidPass()[inx],
										planDetailsForm.getChildHKID()[inx]));
						beneficiary.put("relationship", "SE");
						child.put("beneficiary", beneficiary);
						
						// clear bene info if bene relationship is SE
						planDetailsForm.getChildBenificiaryFullName()[inx] = "";
						planDetailsForm.getChildBenificiaryHkid()[inx] = "";
					}
				} else {// If don't have beneficiary
					beneficiary.put("name", StringHelper.emptyIfNull( planDetailsForm.getChildName()[inx] ).toUpperCase());
					beneficiary
							.put(hkId,
									checkPasswortAndHkid(hkId, planDetailsForm
											.getSelectedChldHkidPass()[inx],
											planDetailsForm.getChildHKID()[inx]));
					beneficiary
							.put(passId,
									checkPasswortAndHkid(
											passId,
											planDetailsForm
													.getSelectedChldHkidPass()[inx],
											planDetailsForm.getChildHKID()[inx]));
					beneficiary.put("relationship","SE");
					child.put("beneficiary", beneficiary);
				}
				insured.add(child);
				
				
				// update relationship desc
				String[] relationships = planDetailsForm.getChildRelationDesc();
				if(relationships == null){
					// not found in ModelAttribute
					relationships = new String[planDetailsForm.getTotalChildTraveller()];
				}
				String[] beneRelationships = planDetailsForm.getChildBeneRelationDesc();
				if(beneRelationships == null){
					// not found in ModelAttribute
					beneRelationships = new String[planDetailsForm.getTotalChildTraveller()];
				}
				planDetailsForm.setChildRelationDesc(WebServiceUtils.getInsuredRelationshipDesc(relationships, langSelected, child.get("relationship").toString(), inx));
				planDetailsForm.setChildBeneRelationDesc(WebServiceUtils.getBeneRelationshipDesc(beneRelationships, langSelected, beneficiary.get("relationship").toString(), inx));	
				
			}
		}
		System.out.println("personal done " + planDetailsForm.getTotalChildTraveller());
		if (planDetailsForm.getTotalOtherTraveller() > 0) {
			for (int inx = 0; inx < planDetailsForm.getTotalOtherTraveller(); inx++) {
				JSONObject other = new JSONObject();
				other.put("name", StringHelper.emptyIfNull( planDetailsForm.getOtherName()[inx] ).toUpperCase());
				other.put("ageRange", StringHelper.emptyIfNull( planDetailsForm.getOtherAgeRange()[inx]).toUpperCase());
				other.put(
						hkId,
						checkPasswortAndHkid(hkId,
								planDetailsForm.getSelectedOtHkidPass()[inx],
								planDetailsForm.getOtherHKID()[inx]));
				other.put(
						passId,
						checkPasswortAndHkid(passId,
								planDetailsForm.getSelectedOtHkidPass()[inx],
								planDetailsForm.getOtherHKID()[inx]));
				other.put("relationship", relationOfOtherTraveller);

				JSONObject beneficiary = new JSONObject();

				if (planDetailsForm.getOtherBenificiaryFullName().length > 0) {
					if (!planDetailsForm.getOtherBenificiaryFullName()[inx].isEmpty()
							&& INSURED_RELATIONSHIP_SELF.compareToIgnoreCase(planDetailsForm.getOtherBeneficiary()[inx]) != 0) {
						beneficiary.put("name", StringHelper.emptyIfNull( planDetailsForm.getOtherBenificiaryFullName()[inx] ).toUpperCase());
						beneficiary
								.put(hkId,
										checkPasswortAndHkid(
												hkId,
												planDetailsForm.getSelectedOtherBenefitiaryHkidPass()[inx],
												planDetailsForm.getOtherBenificiaryHkid()[inx]));
						beneficiary
								.put(passId,
										checkPasswortAndHkid(
												passId,
												planDetailsForm.getSelectedOtherBenefitiaryHkidPass()[inx],
												planDetailsForm.getOtherBenificiaryHkid()[inx]));
						beneficiary.put("relationship", planDetailsForm.getOtherBeneficiary()[inx]);
						other.put("beneficiary", beneficiary);
					} else {// If don't have beneficiary
						beneficiary.put("name", StringHelper.emptyIfNull( planDetailsForm.getOtherName()[inx] ).toUpperCase());
						beneficiary
								.put(hkId,
										checkPasswortAndHkid(
												hkId,
												planDetailsForm.getSelectedOtHkidPass()[inx],
												planDetailsForm.getOtherHKID()[inx]));
						beneficiary
								.put(passId,
										checkPasswortAndHkid(
												passId,
												planDetailsForm.getSelectedOtHkidPass()[inx],
												planDetailsForm.getOtherHKID()[inx]));
						beneficiary.put("relationship","SE");
						other.put("beneficiary", beneficiary);
						
						// clear bene info if bene relationship is SE
						planDetailsForm.getOtherBenificiaryFullName()[inx] = "";
						planDetailsForm.getOtherBenificiaryHkid()[inx] = "";						
					}
				} else {// If don't have beneficiary
					beneficiary.put("name", StringHelper.emptyIfNull( planDetailsForm.getOtherName()[inx] ).toUpperCase());
					beneficiary
							.put(hkId,
									checkPasswortAndHkid(hkId, planDetailsForm
											.getSelectedOtHkidPass()[inx],
											planDetailsForm.getOtherHKID()[inx]));
					beneficiary
							.put(passId,
									checkPasswortAndHkid(
											passId,
											planDetailsForm
													.getSelectedOtHkidPass()[inx],
											planDetailsForm.getOtherHKID()[inx]));
					beneficiary.put("relationship","SE");
					other.put("beneficiary", beneficiary);
				}
								
				insured.add(other);
				
				// update relationship desc
				String[] relationships = planDetailsForm.getOtherRelationDesc();
				if(relationships == null){
					// not found in ModelAttribute
					relationships = new String[planDetailsForm.getTotalOtherTraveller()];
				}
				String[] beneRelationships = planDetailsForm.getOtherBeneRelationDesc();
				if(beneRelationships == null){
					// not found in ModelAttribute
					beneRelationships = new String[planDetailsForm.getTotalOtherTraveller()];
				}
				planDetailsForm.setOtherRelationDesc(WebServiceUtils.getInsuredRelationshipDesc(relationships, langSelected, other.get("relationship").toString(), inx));
				planDetailsForm.setOtherBeneRelationDesc(WebServiceUtils.getBeneRelationshipDesc(beneRelationships, langSelected, beneficiary.get("relationship").toString(), inx));				
			}
		}
		System.out.println("personal done " + planDetailsForm.getTotalOtherTraveller());
		
		
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
		
		System.out.println("Travel optIn1 " + planDetailsForm.getCheckbox3());
		System.out.println("Travel optIn2 " + planDetailsForm.getCheckbox4());
		
		
		applicantJsonObj.put("optIn1", planDetailsForm.getCheckbox3());
		applicantJsonObj.put("optIn2", planDetailsForm.getCheckbox4());
		applicantJsonObj.put("email", emailAddress);

		parameters.put("applicant", applicantJsonObj);

		JSONObject addressJsonObj = new JSONObject();
		parameters.put("address", addressJsonObj);

		/* System.out.println(parameters); */

		HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
		header.put("userName", (String) session.getAttribute("username"));
		header.put("token", (String) session.getAttribute("token"));
		header.put("language", WebServiceUtils
				.transformLanaguage(UserRestURIConstants.getLanaguage(request)));
		/*
		 * System.out.println("headers=====>>>>>" + header);
		 */
		// Comment for to avoid over load Data

		System.out.println("TRAVEL_CREATE_POLICY Parameters" + parameters);
		//TO ENFORCE THE POLICY IS CREATED AND MAKE SURE THE TRANSACTION NUMBER IS NOT REUSED
		
		CreatePolicy createPolicy = (CreatePolicy)session.getAttribute("travelCreatePolicy");
		
		JSONObject responsObject = new JSONObject();
 		if (createPolicy == null) {

			responsObject = restService.consumeApi(HttpMethod.PUT,
					UserRestURIConstants.TRAVEL_CREATE_POLICY, header,
					parameters);
			createPolicy = new CreatePolicy();
			System.out.println("TRAVEL_CREATE_POLICY Response" + responsObject);

			String finalizeReferenceNo = "";

			if (responsObject.get("errMsgs") == null) {
				@SuppressWarnings("unused")
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
				System.out.println("Header Object for Confirm"
						+ confirmPolicyParameter);
				JSONObject jsonResponse = restService.consumeApi(
						HttpMethod.POST,
						UserRestURIConstants.TRAVEL_CONFIRM_POLICY, header,
						confirmPolicyParameter);

				System.out.println("Response From Confirm Travel Policy "
						+ jsonResponse);

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
				System.out.println("redirect back");
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
		System.out.println("path " + path);
		
		model.addAttribute("path",
				path.replace("travel-summary", "confirmation"));
		model.addAttribute("path",
				path.replace("travel-summary", "confirmation"));
		
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
				+ "/travel/travel-summary-payment");				
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/processTravePayment")
	@ResponseBody
	public String processPayment(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		
		
		
		String referenceNo = request.getParameter("referenceNo");
		
		System.out.print("referenceNo : " + referenceNo);
		
		JSONObject submitPolicy = new JSONObject();
		submitPolicy.put("referenceNo", referenceNo);
		HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
		header.put("userName", (String) session.getAttribute("username"));
		header.put("token", (String) session.getAttribute("token"));
		header.put("language", WebServiceUtils.transformLanaguage(UserRestURIConstants.getLanaguage(request)));
		
		JSONObject jsonResponse = restService.consumeApi(
				HttpMethod.POST,
				UserRestURIConstants.TRAVEL_SUBMIT_POLICY, header,
				submitPolicy);
		if (checkJsonObjNull(jsonResponse, "errMsgs").equals("")) {
			if (checkJsonObjNull(jsonResponse, "policyNo").equals("")) {
				String month = request.getParameter("epMonth");
				System.out.println("month " + month);
				System.out.println("pad month " + String.format("%02d", Integer.parseInt(request.getParameter("epMonth"))));
				System.out.println("expiryDate " + request.getSession().getAttribute("expiryDate"));
				session.setAttribute("transactionNo", request.getParameter("transNo"));
				String encryptedCreditCard = request.getParameter("cardNo");
				
				
				try {
					encryptedCreditCard = Methods.encryptStr(request.getParameter("cardNo"));
					System.out.println("encryptedCreditCard "+ encryptedCreditCard);
					
					session.setAttribute("creditCardNo", encryptedCreditCard);
				} catch (Exception e) {
					// TODO Auto-generated catch block
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

	@SuppressWarnings({ "unchecked", "finally" })
	@RequestMapping(value = {"/{lang}/travel-confirmation", "/{lang}/travel-confirmation", "/{lang}/travel-insurance/confirmation"})
	public String processPayment(Model model, HttpServletRequest request,
			@RequestParam(required = false) String Ref ) {
		UserRestURIConstants.setController("Travel");
		
		HttpSession session = request.getSession();
		if (session.getAttribute("token") == null) {
			System.out.println("Session Expired");
			model.addAttribute("errormsg", "Session Expired");
			return UserRestURIConstants.getSitePath(request)
					+ "travel/travel-confirmation";
		}
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		UserRestURIConstants.setController("Travel");
		request.setAttribute("controller", UserRestURIConstants.getController());
		

		JSONObject responsObject = new JSONObject();

		try {
			JSONObject parameters = new JSONObject();
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
				model.addAttribute("referralCode",
						session.getAttribute("referralCode"));
				String pageTitle = WebServiceUtils.getPageTitle("page.travelPlanConfirmation", UserRestURIConstants.getLanaguage(request));
				String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.travelPlanConfirmation", UserRestURIConstants.getLanaguage(request));
				model.addAttribute("pageTitle", pageTitle);
				model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
				return UserRestURIConstants.getSitePath(request)
						+ "travel/travel-confirmation";
			}
				
			parameters.put("expiryDate", session.getAttribute("expiryDate"));

			HashMap<String, String> header = new HashMap<String, String>(
					COMMON_HEADERS);
			header.put("userName", session.getAttribute("username").toString());
			header.put("token", session.getAttribute("token").toString());
			System.out.println(WebServiceUtils
					.transformLanaguage(UserRestURIConstants
							.getLanaguage(request)));
			header.put("language", WebServiceUtils
					.transformLanaguage(UserRestURIConstants
							.getLanaguage(request)));
			System.out.println("TRAVEL_FINALIZE_POLICY parameters-"
					+ parameters);
			System.out.println("TRAVEL_FINALIZE_POLICY Header-" + header);
			responsObject = restService.consumeApi(HttpMethod.POST,
					UserRestURIConstants.TRAVEL_FINALIZE_POLICY, header,
					parameters);
			
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
				
				model.addAttribute("pageTitle", pageTitle);
				model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
				return UserRestURIConstants.getSitePath(request)
						+ "travel/travel-confirmation";
			} else {
				
				System.out.println(responsObject.get("errMsgs").toString());
				
				if (responsObject.get("errMsgs").toString().contains("invalid payment amount")) {
					model.addAttribute("errorHeader1", "Invalid Payment Amount");
					model.addAttribute("errorDescription1", "There is a mismatch of the payment amount with the policy");
					model.addAttribute("errorHeader2", "Please DO NOT retry the payment");
					model.addAttribute("errorDescription2", "Contact our CS at 3123 3123");
				} else {
					model.addAttribute("errorHeader1", "Policy is not generated");
					model.addAttribute("errorDescription1", "There is a problem in the system " + responsObject.get("errMsgs").toString());
					model.addAttribute("errorHeader2", "Please DO NOT retry the payment");
					model.addAttribute("errorDescription2", "Contact our CS at 3123 3123");
				}
				
				System.out.println("travel confirmation" + UserRestURIConstants.getSitePath(request)
						+ "error");
				return UserRestURIConstants.getSitePath(request)
						+ "error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			
			model.addAttribute("errMsgs", e.toString());
			return UserRestURIConstants.getSitePath(request)
					+ "travel/travel-summary-payment";
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

	// @Link(label="Flight", family="FlightController", parent = "" )
	@RequestMapping(value = "/sendEmail")
	@ResponseBody
	public String sendEmail(HttpServletRequest request) {

		boolean mailed = false;
		HttpSession session = request.getSession();
		String planCode = request
				.getParameter("planCode");
		String usernameInSession = null;
		String tokenInSession = null;
		String emailToSendPromoCode = request
				.getParameter("emailToSendPromoCode");
		if (request.getSession().getAttribute("username") != null
				&& request.getSession().getAttribute("token") != null) {
			usernameInSession = request.getSession().getAttribute("username")
					.toString();
			tokenInSession = request.getSession().getAttribute("token")
					.toString();
		}

		HashMap<String, String> header = new HashMap<String, String>(
				COMMON_HEADERS);
		header.put("userName", usernameInSession);
		header.put("token", tokenInSession);
		header.put("language", WebServiceUtils
				.transformLanaguage(UserRestURIConstants.getLanaguage(request)));
		if (planCode == null)
			planCode = "TRAVELCARE";
		if (planCode.toUpperCase().equals("HOMECARE"))
		
		// String referalCOde = session.getAttribute("referralCode").toString();
			mailed = sendEmail.sendEmail(emailToSendPromoCode, "ECHOME", header);
		else
			mailed = sendEmail.sendEmail(emailToSendPromoCode, "TRA123", header);
		if (mailed) {
			return "success";
		} else {
			return "fail";
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
	
	

}