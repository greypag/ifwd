package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
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
import com.ifwd.fwdhk.model.PromoCodeDetail;
import com.ifwd.fwdhk.model.QuoteDetails;
import com.ifwd.fwdhk.model.TravelQuoteBean;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.services.TravelService;
import com.ifwd.fwdhk.util.DateApi;
import com.ifwd.fwdhk.util.JsonUtils;
import com.ifwd.fwdhk.util.Methods;
import com.ifwd.fwdhk.util.StringHelper;
import com.ifwd.fwdhk.util.ValidationUtils;
import com.ifwd.fwdhk.util.WebServiceUtils;
import com.ifwd.fwdhk.utils.services.SendEmailDao;

@Controller
public class TravelController {
	
	private final static Logger logger = LoggerFactory.getLogger(TravelController.class);

	@Autowired
	private RestServiceDao restService;

	@Autowired
	private SendEmailDao sendEmail;

	@Autowired
	private MessageSource messageSource;
	
	@Autowired
	private TravelService  travelService;
	
	@RequestMapping(value = {"/{lang}/travel", "/{lang}/travel-insurance", "/{lang}/travel-insurance/sharing/"})
	public ModelAndView getTravelHomePage(@RequestParam(required = false) final String promo, HttpServletRequest request, Model model,
			@RequestParam(required = false) final String utm_source,
			@RequestParam(required = false) final String utm_medium,
			@RequestParam(required = false) final String utm_campaign,
			@RequestParam(required = false) final String utm_content)  {

		//String promo = (String)request.getAttribute("promo");
		String departureDate = request.getParameter("departureDate");
		String returnDate = request.getParameter("returnDate");
		String plan = request.getParameter("plan");
		String traveler = request.getParameter("traveler");
		String adult = request.getParameter("adult");
		String child = request.getParameter("child");
		String other = request.getParameter("other");
		int iTraveler = 0;
		int iAdult = 0;
		int iChild = 0;
		int iOther = 0;
		boolean result = true; 
		
		UserRestURIConstants.setController("Travel");
		UserRestURIConstants urc = new UserRestURIConstants(); 
		urc.updateLanguage(request);
		
		request.setAttribute("controller", UserRestURIConstants.getController());
		HttpSession session = request.getSession();
		if (promo != null) {
			if (!promo.equals("")) {
				session.setAttribute("referralCode", StringHelper.emptyIfNull(promo));
			}	
		}
		session.setAttribute("referralCode", StringHelper.emptyIfNull(promo));
		TravelQuoteBean travelQuote = (TravelQuoteBean) session.getAttribute("corrTravelQuote");
		
		/**
		 * 判断URL是否带数据跟数据验证
		 */
		if("".equals(departureDate) || departureDate == null || (departureDate != null && !DateApi.isValidDate(departureDate))) {
			result = false;
		}else if("".equals(returnDate) || returnDate == null || (returnDate != null && !DateApi.isValidDate(returnDate))) {
			result = false;
		}else if(plan != null) {
			if("personal".equals(plan)) {
				if("".equals(traveler)) {
					result = false;
				}else {
					try{
						iTraveler = Integer.valueOf(traveler);
						if(1 > iTraveler || iTraveler > 15) {
							result = false;
						}
					} catch (Exception e) {
						e.printStackTrace();
						result = false;
					}
				}
			}else if("family".equals(plan)) {
				if("".equals(adult) || "".equals(child) || "".equals(other)) {
					result = false;
				}else {
					try{
						iAdult = Integer.valueOf(adult);
						iChild = Integer.valueOf(child);
						iOther = Integer.valueOf(other);
						if(1 > iAdult || iAdult > 2) {
							result = false;
						}else if (iChild < 1) {
							result = false;
						}else if(iAdult + iChild + iOther> 15){
							result = false;
						}
					} catch (Exception e) {
						e.printStackTrace();
						result = false;
					}
				}
			}else {
				result = false;
			}
		}else if("".equals(promo)) {
			result = false;
		}
		
		/**
		 * 如果由URL跳转传值将直接进入PLAN页面
		*/
		if(plan != null && plan != "" && result){
			if(travelQuote == null){
				travelQuote = new TravelQuoteBean();
			}
			travelQuote.setTotalPersonalTraveller(iTraveler);
			travelQuote.setTotalAdultTraveller(iAdult);
			travelQuote.setTotalChildTraveller(iChild);
			travelQuote.setTotalOtherTraveller(iOther);
			travelQuote.setPlanSelected(plan);
			travelQuote.setTrLeavingDate(departureDate);
			travelQuote.setTrBackDate(returnDate);
			session.setAttribute("corrTravelQuote", travelQuote);
			model.addAttribute("travelQuote", travelQuote);
			ModelAndView date = getTravelPlan(travelQuote, model, request);
			if(!date.getViewName().endsWith("travel-insurance") && !date.getViewName().endsWith("travel/travel")) {
				model.addAttribute("promo", promo);
				model.addAttribute("departureDate", departureDate);
				model.addAttribute("returnDate", returnDate);
				model.addAttribute("plan", plan);
				model.addAttribute("traveler", traveler);
				model.addAttribute("adult", adult);
				model.addAttribute("child", child);
				model.addAttribute("other", other);
				return date;
			}
			result = false;
		}
		
		if(travelQuote == null || !result){
			travelQuote = new TravelQuoteBean();
			travelQuote.setTotalPersonalTraveller(1);
			travelQuote.setTotalAdultTraveller(1);
			travelQuote.setTotalChildTraveller(1);
			travelQuote.setTotalOtherTraveller(0);
			travelQuote.setPlanSelected("personal");
		}
		session.setAttribute("corrTravelQuote", travelQuote);
		model.addAttribute("travelQuote", travelQuote);
		
		String pageTitle = WebServiceUtils.getPageTitle("page.travel", UserRestURIConstants.getLanaguage(request));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.travel", UserRestURIConstants.getLanaguage(request));
		
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
			if (promo != null) {
				ogUrl = ogUrl + "?promo=" + promo;	
			}
			ogImage = WebServiceUtils.getPageTitle("travel.sharing.og.image", UserRestURIConstants.getLanaguage(request));
			ogDescription = WebServiceUtils.getPageTitle("travel.sharing.og.description", UserRestURIConstants.getLanaguage(request));
			
			googleRickSnippetBrand =WebServiceUtils.getPageTitle(
					"travel.googleRickSnippetBrand",
					UserRestURIConstants.getLanaguage(request));
			googleRickSnippetName =WebServiceUtils.getPageTitle(
					"travel.googleRickSnippetName",
					UserRestURIConstants.getLanaguage(request));
			
			googleRickSnippetImageUrl =WebServiceUtils.getPageTitle(
					"travel.googleRickSnippetImageUrl",
					UserRestURIConstants.getLanaguage(request));
			googleRickSnippetImageAlt =WebServiceUtils.getPageTitle(
					"travel.googleRickSnippetImageAlt",
					UserRestURIConstants.getLanaguage(request));
			googleRickSnippetRating =WebServiceUtils.getPageTitle(
					"travel.googleRickSnippetRating",
					UserRestURIConstants.getLanaguage(request));
			googleRickSnippetPrice =WebServiceUtils.getPageTitle(
					"travel.googleRickSnippetPrice",
					UserRestURIConstants.getLanaguage(request));
			googleRickSnippetAvailability =WebServiceUtils.getPageTitle(
					"flight.googleRickSnippetAvailability",
					UserRestURIConstants.getLanaguage(request));
			googleRickSnippetAvailabilityText =WebServiceUtils.getPageTitle(
					"travel.googleRickSnippetAvailabilityText",
					UserRestURIConstants.getLanaguage(request));
			googleRickSnippetDescription1 =WebServiceUtils.getPageTitle(
					"travel.googleRickSnippetDescription1",
					UserRestURIConstants.getLanaguage(request));
			googleRickSnippetDescription2 =WebServiceUtils.getPageTitle(
					"travel.googleRickSnippetDescription2",
					UserRestURIConstants.getLanaguage(request));
			
			
		}
		
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
		
		String twitterCard = WebServiceUtils.getPageTitle("twitter.travel.card",
				UserRestURIConstants.getLanaguage(request));
		String twitterImage = WebServiceUtils.getPageTitle("twitter.travel.image",
				UserRestURIConstants.getLanaguage(request));
		String twitterSite = WebServiceUtils.getPageTitle("twitter.travel.site",
				UserRestURIConstants.getLanaguage(request));
		String twitterUrl = WebServiceUtils.getPageTitle("twitter.travel.url",
				UserRestURIConstants.getLanaguage(request));
		String canonical = WebServiceUtils.getPageTitle("canonical.travel",
				UserRestURIConstants.getLanaguage(request));
		model.addAttribute("twitterCard", twitterCard);
		model.addAttribute("twitterImage", twitterImage);
		model.addAttribute("twitterSite", twitterSite);
		model.addAttribute("twitterUrl", twitterUrl);
		model.addAttribute("canonical", canonical);
		
		
		String travelScriptName = WebServiceUtils.getPageTitle("travel.script.name",
				UserRestURIConstants.getLanaguage(request));
		String travelScriptDescription = WebServiceUtils.getPageTitle("travel.script.description",
				UserRestURIConstants.getLanaguage(request));
		String travelScriptChildName = WebServiceUtils.getPageTitle("travel.script.child.name",
				UserRestURIConstants.getLanaguage(request));
		String travelScriptImg = WebServiceUtils.getPageTitle("travel.og.image",
				UserRestURIConstants.getLanaguage(request));
		model.addAttribute("travelScriptName", travelScriptName);
		model.addAttribute("travelScriptDescription", travelScriptDescription);
		model.addAttribute("travelScriptChildName", travelScriptChildName);
		model.addAttribute("travelScriptImg", travelScriptImg);
		
		return new ModelAndView(UserRestURIConstants.getSitePath(request) + "travel/travel");			
	}

	

	@RequestMapping(value = {"/{lang}/getTravelQuote", "/{lang}/travel-insurance/quote"})
	public ModelAndView prepareTravelPlan(
			@ModelAttribute("travelQuote") TravelQuoteBean travelQuote,
			BindingResult result, Model model, HttpServletRequest request) {
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		
		UserRestURIConstants.setController("Travel");
		request.setAttribute("controller", UserRestURIConstants.getController());
		return getTravelPlan(travelQuote, model, request);
	}


	// BMG updateTravelQuote
	// return JSON
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/updateTravelQuote", method = RequestMethod.POST)
	@ResponseBody
	public String updateTravelQuote(
			@ModelAttribute("travelQuote") TravelQuoteBean travelQuote,
			BindingResult result, Model model, HttpServletRequest request) {
		UserRestURIConstants.setController("Travel");
		
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
			Date dateD1 = DateApi.formatDate(travelQuote.getTrLeavingDate());
			Date dateD2 = DateApi.formatDate(travelQuote.getTrBackDate());
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

			HashMap<String, String> header = new HashMap<String, String>(
					COMMON_HEADERS);
			if (request.getSession().getAttribute("username") != null) {
				header.put("userName", username);
				header.put("token", token);
			}
			
			String lang = UserRestURIConstants.getLanaguage(request);
			if (lang.equals("tc")) {
				lang = "CN";
			}
			
			header.put("language", WebServiceUtils.transformLanaguage(lang));
			JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,
					Url, header, null);

			logger.info("Get Travel Quotes API " + responseJsonObj);
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
				
				JSONObject jsonPromoCodeDetail = new JSONObject();
				jsonPromoCodeDetail = (JSONObject) responseJsonObj.get("promoCodeDetail");
				if(jsonPromoCodeDetail != null) {
					PromoCodeDetail promoCodeDetail = new PromoCodeDetail();
					promoCodeDetail.setCode(jsonPromoCodeDetail.get("code").toString());
					promoCodeDetail.setPromoCodeType(jsonPromoCodeDetail.get("promoCodeType").toString());
					promoCodeDetail.setDescription(jsonPromoCodeDetail.get("description").toString());
					promoCodeDetail.setPlanCode(jsonPromoCodeDetail.get("planCode").toString());
					promoCodeDetail.setValue(jsonPromoCodeDetail.get("value").toString());
					session.setAttribute("promoCodeDetail", promoCodeDetail); 
				}else {
					session.removeAttribute("promoCodeDetail");
				}

				model.addAttribute("travelQuoteBean", travelQuote);
				model.addAttribute("quoteDetails", quoteDetails);
				request.setAttribute("quoteDetails", quoteDetails);
				session.setAttribute("quoteDetails", quoteDetails);
				
				return responseJsonObj.toString();
			} else {
				model.addAttribute("errMsgs", responseJsonObj.get("errMsgs"));
				return "exception error";
			}

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errMsgs", "System Error");
			return "System Error";
		}
	}
	
	@SuppressWarnings({ "unused" })
	@RequestMapping(value = "/applyTravelPromoCode", method = RequestMethod.POST)
	@ResponseBody
	public String applyPromotionCode(
			@ModelAttribute("travelQuote") TravelQuoteBean travelQuote,
			BindingResult result, Model model, HttpServletRequest request) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		
		JSONObject responseJsonObj = new JSONObject();
		HttpSession session = request.getSession();
		if (session.getAttribute("token") == null) {
			model.addAttribute("errMsgs", "Session Expired");
			return "fail";		
		}
		int days = 0;
		int otherCount = 0, childCount = 0, adultCount = 0;
		boolean spouseCover = false, selfCover = false;
		/*Date dateD1 = new Date(travelQuote.getTrLeavingDate());
		Date dateD2 = new Date(travelQuote.getTrBackDate());*/
		Date dateD1 = sdf.parse(travelQuote.getTrLeavingDate());
		Date dateD2 = sdf.parse(travelQuote.getTrBackDate());
		LocalDate commencementDate = new LocalDate(dateD1);
		LocalDate expiryDate = new LocalDate(dateD2);
		days = Days.daysBetween(commencementDate, expiryDate).getDays();
		TravelQuoteBean travelQuoteCount = (TravelQuoteBean)session.getAttribute("travelQuoteCount");
		selfCover = travelQuoteCount.isSelfCover();
		spouseCover = travelQuoteCount.isSpouseCover();
		childCount = travelQuoteCount.getTotalChildTraveller();
		otherCount = travelQuoteCount.getTotalOtherTraveller();
		
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
			if (lang.equals("tc")) {
				lang = "CN";
			}
			
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

			logger.info("Response Get Travel Quotes API " + JsonUtils.jsonPrint(responseJsonObj));
			if (responseJsonObj.toJSONString().contains("Promotion code is not valid")) {
				session.setAttribute("referralCode", "");
			} else {
				session.setAttribute("referralCode", StringHelper.emptyIfNull(request.getParameter("promoCode")));
			}
			
			// in case responseJsonObj contains errors, likely promo code invalid, thus, still put the details to session
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
			
			JSONObject jsonPromoCodeDetail = new JSONObject();
			jsonPromoCodeDetail = (JSONObject) responseJsonObj.get("promoCodeDetail");
			if(jsonPromoCodeDetail != null) {
				PromoCodeDetail promoCodeDetail = new PromoCodeDetail();
				promoCodeDetail.setCode(jsonPromoCodeDetail.get("code").toString());
				promoCodeDetail.setPromoCodeType(jsonPromoCodeDetail.get("promoCodeType").toString());
				promoCodeDetail.setDescription(jsonPromoCodeDetail.get("description").toString());
				promoCodeDetail.setPlanCode(jsonPromoCodeDetail.get("planCode").toString());
				promoCodeDetail.setValue(jsonPromoCodeDetail.get("value").toString());
				session.setAttribute("promoCodeDetail", promoCodeDetail);
			}else {
				session.removeAttribute("promoCodeDetail");
			}
			
			session.setAttribute("priceInfoA", jsonPriceInfoA);
			session.setAttribute("priceInfoB", jsonPriceInfoB);
			request.setAttribute("quoteDetails", quoteDetails);
			
			session.setAttribute("quoteDetails", quoteDetails);
			return responseJsonObj.toString();

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errMsgs", "System Error");
			return "System Error";
		}
		
	}

	@SuppressWarnings({ "unused", "rawtypes" })
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
		
		String theClubMembershipNo = WebServiceUtils.getParameterValue("theClubMembershipNo", session, request);
		String placeholder = WebServiceUtils.getMessage("club.membership.number", UserRestURIConstants.getLanaguage(request));
		String MembershipNo = "";
		if(placeholder.equals(theClubMembershipNo)) {
			MembershipNo = "";
		}else {
			MembershipNo = theClubMembershipNo;
		}
		session.setAttribute("theClubMembershipNo", MembershipNo);
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
			if (lang.equals("tc")) {
				lang = "CN";
			}
			
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
						+ "travel/travel-plan");		
			}

			model.addAttribute("planName", planName);
			//model.addAttribute("planSummary", planSummary);
			//model.addAttribute("planPremium", selectPlanPremium);
			
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
		
		String twitterCard = WebServiceUtils.getPageTitle("twitter.travel.card",
				UserRestURIConstants.getLanaguage(request));
		String twitterImage = WebServiceUtils.getPageTitle("twitter.travel.image",
				UserRestURIConstants.getLanaguage(request));
		String twitterSite = WebServiceUtils.getPageTitle("twitter.travel.site",
				UserRestURIConstants.getLanaguage(request));
		String twitterUrl = WebServiceUtils.getPageTitle("twitter.travel.url",
				UserRestURIConstants.getLanaguage(request));
		String canonical = WebServiceUtils.getPageTitle("canonical.travel",
				UserRestURIConstants.getLanaguage(request));
		model.addAttribute("twitterCard", twitterCard);
		model.addAttribute("twitterImage", twitterImage);
		model.addAttribute("twitterSite", twitterSite);
		model.addAttribute("twitterUrl", twitterUrl);
		model.addAttribute("canonical", canonical);
		
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
	
	
	@SuppressWarnings({ "unchecked", "unused" })
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
		String planCode = (String)session.getAttribute("planSelected");
		
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
		String originalAmount = WebServiceUtils.getParameterValue("finalOriginalAmount",session, request);
		session.setAttribute("dueAmount", dueAmount);
		session.setAttribute("originalAmount", originalAmount);
		
		String selectPlanName = WebServiceUtils.getParameterValue("selectedPlanName", session, request);
		String deaprtureDate = DateApi.pickDate1((String)session.getAttribute("departureDate"));
		String returnDate = DateApi.pickDate1((String) session.getAttribute("returnDate"));
		String applicantFullName = WebServiceUtils.getParameterValue("fullName", session, request);
		String applicantHKID = WebServiceUtils.getParameterValue("hkid", session, request);
		String applicantMobNo = WebServiceUtils.getParameterValue("mobileNo", session, request);
		String emailAddress = WebServiceUtils.getParameterValue("emailAddress",	session, request);
		String selectedHkidPassApplicant = "HKID";
		String dob = WebServiceUtils.getParameterValue("applicantDob",	session, request);
		
		
		Enumeration<String> parameterNames = request.getParameterNames();
		while (parameterNames.hasMoreElements()) {
			String paramName = parameterNames.nextElement();
			
			String[] paramValues = request.getParameterValues(paramName);
			for (int i = 0; i < paramValues.length; i++) {
				String paramValue = paramValues[i];
			}
		}
		
		//String dob = WebServiceUtils.getParameterValue("applicantDob", session, request);
		/*try {
			Calendar dateDob = Calendar.getInstance();
			dateDob.setTime(new Date(dob));
			Format f = new SimpleDateFormat("yyyy-MM-dd");
			dob = f.format(dateDob.getTime());
		} catch (Exception e) {
			
		}*/
		
		dob = DateApi.pickDate1(dob);
		
		String totalTravellingDays = WebServiceUtils.getParameterValue("totalTravellingDays", session, request);
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
        final String BENE_RELATIONSHIP_SELF = "SE";

		String relationOfChildTraveller = "", relationOfOtherTraveller = "";

		if (planDetailsForm.getPlanSelected().equals("personal")) {
		} else if (planDetailsForm.getPlanSelected().equals("family")) {
			relationOfChildTraveller = "CH";
			relationOfOtherTraveller = "OT";
		}

		JSONObject parameters = new JSONObject();
		parameters.put("planCode", planCode);
		
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
				personal.put("relationship", "RF");
				
			
				if (planDetailsForm.getPersonalBenificiaryFullName().length > 0) {
					if (!planDetailsForm.getPersonalBenificiaryFullName()[inx].isEmpty() 
							&& BENE_RELATIONSHIP_SELF.compareToIgnoreCase(planDetailsForm.getPersonalBeneficiary()[inx]) != 0) {// If have beneficiary
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
                // update relationship 
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
			if(inx == 0) {
				personal.put("dob", dob);
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
			
			planDetailsForm.setPersonalRelationDesc(WebServiceUtils.getInsuredRelationshipDesc(relationships, langSelected, personal.get("relationship").toString(), inx));
			
			planDetailsForm.setPersonalBeneRelationDesc(WebServiceUtils.getBeneRelationshipDesc(beneRelationships, langSelected, beneficiary.get("relationship").toString(), inx));			
		}
		// personal

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
					adult.put("relationship", "RF");
				} else {
					adult.put("relationship", "SP");
				}
				
				if (planDetailsForm.getAdultBenificiaryFullName().length > 0) {
					if (!planDetailsForm.getAdultBenificiaryFullName()[inx].isEmpty() 
							&& BENE_RELATIONSHIP_SELF.compareToIgnoreCase(planDetailsForm.getAdultBeneficiary()[inx]) != 0) {// If have beneficiary
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
                // update relationship 
                String adultID;
                if(adult.get("hkId") != null && !adult.get("hkId").toString().isEmpty()){
                    adultID = adult.get("hkId").toString();
                }else if(adult.get("passport") != null && !adult.get("passport").toString().isEmpty()){
                    adultID = adult.get("passport").toString();
                }else {
                    adultID = "";
                }
                adult.put("relationship", ValidationUtils.getRelationshipById(applicantHKID, adultID));

				if (planDetailsForm.getAdultBenificiaryFullName().length > 0) {
					if (!planDetailsForm.getAdultBenificiaryFullName()[inx].isEmpty()
							&& BENE_RELATIONSHIP_SELF.compareToIgnoreCase(planDetailsForm.getAdultBeneficiary()[inx]) != 0) {// If have beneficiary
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
			if(inx == 0) {
				adult.put("dob", dob);
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
							&& BENE_RELATIONSHIP_SELF.compareToIgnoreCase(planDetailsForm.getChildBeneficiary()[inx]) != 0) {// If have beneficiary
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
							&& BENE_RELATIONSHIP_SELF.compareToIgnoreCase(planDetailsForm.getOtherBeneficiary()[inx]) != 0) {
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
		
		String theClubMembershipNo = (String)session.getAttribute("theClubMembershipNo");
		parameters.put("externalParty", StringUtils.isEmpty(theClubMembershipNo) ? "" : "THE CLUB");
		parameters.put("externalPartyCode", session.getAttribute("theClubMembershipNo"));
		
		PromoCodeDetail promoCodeDetail = (PromoCodeDetail)session.getAttribute("promoCodeDetail");
		if(promoCodeDetail != null) {
			JSONObject promoCodeDetailJsonObj = new JSONObject();
			promoCodeDetailJsonObj.put("code", promoCodeDetail.getCode());
			promoCodeDetailJsonObj.put("promoCodeType", promoCodeDetail.getPromoCodeType());
			promoCodeDetailJsonObj.put("description", promoCodeDetail.getDescription());
			promoCodeDetailJsonObj.put("planCode", promoCodeDetail.getPlanCode());
			promoCodeDetailJsonObj.put("value", promoCodeDetail.getValue());
			parameters.put("promoCodeDetail", promoCodeDetailJsonObj);
			
			JSONObject priceInfoJsonObj = new JSONObject();
			QuoteDetails quoteDetails = (QuoteDetails)session.getAttribute("quoteDetails");
			
			if ("A".equals(planCode)) {
				priceInfoJsonObj.put("grossPremium", quoteDetails.getGrossPremium()[0]);
				priceInfoJsonObj.put("discountPercentage", quoteDetails.getDiscountPercentage()[0]);
				priceInfoJsonObj.put("discountAmount", quoteDetails.getDiscountAmount()[0]);
				priceInfoJsonObj.put("totalNetPremium", quoteDetails.getTotalNetPremium()[0]);
				priceInfoJsonObj.put("totalDue", quoteDetails.getToalDue()[0]);
			}else {
				priceInfoJsonObj.put("grossPremium", quoteDetails.getGrossPremium()[1]);
				priceInfoJsonObj.put("discountPercentage", quoteDetails.getDiscountPercentage()[1]);
				priceInfoJsonObj.put("discountAmount", quoteDetails.getDiscountAmount()[1]);
				priceInfoJsonObj.put("totalNetPremium", quoteDetails.getTotalNetPremium()[1]);
				priceInfoJsonObj.put("totalDue", quoteDetails.getToalDue()[1]);
			}
			
			parameters.put("priceInfo", priceInfoJsonObj);
		}


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
		model.addAttribute("originalAmount", originalAmount.replace(",", ""));
		model.addAttribute("totalTravellingDays", totalTravellingDays);
		model.addAttribute("userDetails", userDetails);
		model.addAttribute("travelBean", travelBean);
		model.addAttribute("planDetailsForm", planDetailsForm);
		model.addAttribute("path", path.replace("travel-summary", "confirmation?utm_nooverride=1"));
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
		
		String twitterCard = WebServiceUtils.getPageTitle("twitter.travel.card",
				UserRestURIConstants.getLanaguage(request));
		String twitterImage = WebServiceUtils.getPageTitle("twitter.travel.image",
				UserRestURIConstants.getLanaguage(request));
		String twitterSite = WebServiceUtils.getPageTitle("twitter.travel.site",
				UserRestURIConstants.getLanaguage(request));
		String twitterUrl = WebServiceUtils.getPageTitle("twitter.travel.url",
				UserRestURIConstants.getLanaguage(request));
		String canonical = WebServiceUtils.getPageTitle("canonical.travel",
				UserRestURIConstants.getLanaguage(request));
		model.addAttribute("twitterCard", twitterCard);
		model.addAttribute("twitterImage", twitterImage);
		model.addAttribute("twitterSite", twitterSite);
		model.addAttribute("twitterUrl", twitterUrl);
		model.addAttribute("canonical", canonical);
		
		session.removeAttribute("creditCardNo");
		return new ModelAndView(UserRestURIConstants.getSitePath(request)
				+ "/travel/travel-summary-payment");				
	}
	
	@SuppressWarnings({ "unchecked", "unused" })
	@RequestMapping(value = "/processTravePayment")
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
		
		logger.info("TRAVEL_SUBMIT_POLICY Request" + submitPolicy);
		JSONObject jsonResponse = restService.consumeApi(
				HttpMethod.POST,
				UserRestURIConstants.TRAVEL_SUBMIT_POLICY, header,
				submitPolicy);
		logger.info("TRAVEL_SUBMIT_POLICY Response" + jsonResponse);
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

	@SuppressWarnings({ "unchecked"})
	@RequestMapping(value = {"/{lang}/travel-confirmation", "/{lang}/travel-confirmation", "/{lang}/travel-insurance/confirmation"})
	public String processPayment(Model model, HttpServletRequest request,HttpServletResponse response,
			@RequestParam(required = false) String Ref ) {
		UserRestURIConstants.setController("Travel");
		HttpSession session = request.getSession();
		
		if (session.getAttribute("token") == null) {
			model.addAttribute("errormsg", "Session Expired");
			return UserRestURIConstants.getSitePath(request)
					+ "travel/travel-confirmation";
		}
		
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		UserRestURIConstants.setController("Travel");
		request.setAttribute("controller", UserRestURIConstants.getController());
		
		new Thread(){
			public void run(){
				JSONObject result = new JSONObject();
				try {
					result = travelService.finalizeTravelCarePolicy(request, response, session);
					model.addAttribute("policyNo", result.get("policyNo"));
				} catch (Exception e) {
					logger.info(e.getMessage());
					e.printStackTrace();
				}
			}
		}.start();
		
		model.addAttribute("referenceNo", session.getAttribute("finalizeReferenceNo"));
		/*session.setAttribute("policyNo", session.getAttribute("policyNo"));
		model.addAttribute("policyNo", session.getAttribute("policyNo"));*/
		model.addAttribute("emailAddress", session.getAttribute("emailAddress"));
		model.addAttribute("referralCode", session.getAttribute("referralCode"));
		String pageTitle = WebServiceUtils.getPageTitle("page.travelPlanConfirmation", UserRestURIConstants.getLanaguage(request));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.travelPlanConfirmation", UserRestURIConstants.getLanaguage(request));
		session.removeAttribute("referralCode");  // vincent - remove session attribute "referral code" if success
		model.addAttribute("utm_nooverride", 1);
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
		
		String twitterCard = WebServiceUtils.getPageTitle("twitter.travel.card",
				UserRestURIConstants.getLanaguage(request));
		String twitterImage = WebServiceUtils.getPageTitle("twitter.travel.image",
				UserRestURIConstants.getLanaguage(request));
		String twitterSite = WebServiceUtils.getPageTitle("twitter.travel.site",
				UserRestURIConstants.getLanaguage(request));
		String twitterUrl = WebServiceUtils.getPageTitle("twitter.travel.url",
				UserRestURIConstants.getLanaguage(request));
		String canonical = WebServiceUtils.getPageTitle("canonical.travel",
				UserRestURIConstants.getLanaguage(request));
		model.addAttribute("twitterCard", twitterCard);
		model.addAttribute("twitterImage", twitterImage);
		model.addAttribute("twitterSite", twitterSite);
		model.addAttribute("twitterUrl", twitterUrl);
		model.addAttribute("canonical", canonical);
		
		return UserRestURIConstants.getSitePath(request) + "travel/travel-confirmation";
	}
	
	@RequestMapping(value = "/getPromoCode")
	@ResponseBody
	public String getPromoCode(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		
		
		HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
		header.put("userName", (String) session.getAttribute("username"));
		header.put("token", request.getSession().getAttribute("token").toString());
		
		String url = UserRestURIConstants.TRAVEL_GET_PROMOCODE + "?partner=Agoda";
		
		JSONObject jsonResponse = restService.consumeApi(
				HttpMethod.GET,
				url, header,
				null);
		logger.info("TRAVEL_GET_PROMOCODE Response " + jsonResponse);
		if (checkJsonObjNull(jsonResponse, "errMsgs").equals("")) {
			String promoCode = (String)jsonResponse.get("promoCode");
			return promoCode;
		} else {
			return checkJsonObjNull(jsonResponse, "errMsgs");
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
	@SuppressWarnings("unused")
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
		if (planCode.toUpperCase().equals("HOMECARE")) {
		
		// String referalCOde = session.getAttribute("referralCode").toString();
			mailed = sendEmail.sendEmail(emailToSendPromoCode, "ECHOME", header);
		}else if(planCode.toUpperCase().equals("OVERSEACARE")) {
			mailed = sendEmail.sendEmail(emailToSendPromoCode, "OVS123", header);
		}else {
			mailed = sendEmail.sendEmail(emailToSendPromoCode, "TRA123", header);
		}
		if (mailed) {
			return "success";
		} else {
			return "fail";
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
	
	private ModelAndView getTravelPlan(TravelQuoteBean travelQuote, Model model, HttpServletRequest request){
		HttpSession session = request.getSession();
		session.removeAttribute("createPolicy");
		session.removeAttribute("policyNo");
		
		if(travelQuote.getTrLeavingDate() != null) {
			session.setAttribute("travelQuote", travelQuote);
		}else {
			travelQuote = (TravelQuoteBean) session.getAttribute("corrTravelQuote");
			
			if(travelQuote == null) {
				return getTravelHomePage((String)session.getAttribute("referralCode"), request, model, "", "", "", "");		
			}				
		}
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
			Date dateD1 = DateApi.formatDate(travelQuote.getTrLeavingDate());
			Date dateD2 = DateApi.formatDate(travelQuote.getTrBackDate());
			LocalDate commencementDate = new LocalDate(dateD1);
			LocalDate expiryDate = new LocalDate(dateD2);
			days = Days.daysBetween(commencementDate, expiryDate).getDays();
			travelQuote.setTotalTravellingDays(days + 1);
			
			int otherCount = 0, childCount = 0, adultCount = 0;
			boolean spouseCover = false, selfCover = false;
			if (travelQuote.getPlanSelected().equals("personal")) {
				selfCover = true;
				spouseCover = false;
				otherCount = travelQuote.getTotalPersonalTraveller();
				otherCount -= 1;
			}else {
				adultCount = travelQuote.getTotalAdultTraveller();
				childCount = travelQuote.getTotalChildTraveller();
				otherCount = travelQuote.getTotalOtherTraveller();
				selfCover = true;
				if (adultCount > 1) {
					spouseCover = true;
				}else {
					spouseCover = false;
				}
			}
			
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

			HashMap<String, String> header = new HashMap<String, String>(
					COMMON_HEADERS);
			if (request.getSession().getAttribute("username") != null) {
				header.put("userName", username);
				header.put("token", token);
			}
			
			String lang = UserRestURIConstants.getLanaguage(request);
			if (lang.equals("tc")) {
				lang = "CN";
			}
			
			header.put("language", WebServiceUtils.transformLanaguage(lang));
			JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,
					Url, header, null);

			logger.info("Get Travel Quotes API " + responseJsonObj);
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
				
				JSONObject jsonPromoCodeDetail = new JSONObject();
				jsonPromoCodeDetail = (JSONObject) responseJsonObj.get("promoCodeDetail");
				if(jsonPromoCodeDetail != null) {
					PromoCodeDetail promoCodeDetail = new PromoCodeDetail();
					promoCodeDetail.setCode(jsonPromoCodeDetail.get("code").toString());
					promoCodeDetail.setPromoCodeType(jsonPromoCodeDetail.get("promoCodeType").toString());
					promoCodeDetail.setDescription(jsonPromoCodeDetail.get("description").toString());
					promoCodeDetail.setPlanCode(jsonPromoCodeDetail.get("planCode").toString());
					promoCodeDetail.setValue(jsonPromoCodeDetail.get("value").toString());
					session.setAttribute("promoCodeDetail", promoCodeDetail); 
				}else {
					session.removeAttribute("promoCodeDetail");
				}

				request.setAttribute("quoteDetails", quoteDetails);
				model.addAttribute("quoteDetails", quoteDetails);
				session.setAttribute("quoteDetails", quoteDetails);
				
				model.addAttribute("travelQuoteBean", travelQuote);
			} else if (responseJsonObj.get("errMsgs").toString().contains("Promotion code is not valid")) {
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
				session.setAttribute("referralCode", "");
			}else {
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
		
		String twitterCard = WebServiceUtils.getPageTitle("twitter.travel.card",
				UserRestURIConstants.getLanaguage(request));
		String twitterImage = WebServiceUtils.getPageTitle("twitter.travel.image",
				UserRestURIConstants.getLanaguage(request));
		String twitterSite = WebServiceUtils.getPageTitle("twitter.travel.site",
				UserRestURIConstants.getLanaguage(request));
		String twitterUrl = WebServiceUtils.getPageTitle("twitter.travel.url",
				UserRestURIConstants.getLanaguage(request));
		String canonical = WebServiceUtils.getPageTitle("canonical.travel",
				UserRestURIConstants.getLanaguage(request));
		model.addAttribute("twitterCard", twitterCard);
		model.addAttribute("twitterImage", twitterImage);
		model.addAttribute("twitterSite", twitterSite);
		model.addAttribute("twitterUrl", twitterUrl);
		model.addAttribute("canonical", canonical);
		
		return new ModelAndView(UserRestURIConstants.getSitePath(request)
				+ "travel/travel-plan");
	}

}
