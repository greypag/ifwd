package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.joda.time.Days;
import org.joda.time.LocalDate;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
import com.ifwd.fwdhk.model.CreateFlightPolicy;
import com.ifwd.fwdhk.model.CreatePolicy;
import com.ifwd.fwdhk.model.FlightQuoteDetails;
import com.ifwd.fwdhk.model.PlanDetails;
import com.ifwd.fwdhk.model.PlanDetailsForm;
import com.ifwd.fwdhk.model.QuoteDetails;
import com.ifwd.fwdhk.model.TravelQuoteBean;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.services.LocaleMessagePropertiesServiceImpl;
import com.ifwd.fwdhk.util.DateApi;
import com.ifwd.fwdhk.util.JsonUtils;
import com.ifwd.fwdhk.util.StringHelper;
import com.ifwd.fwdhk.util.ValidationUtils;
import com.ifwd.fwdhk.util.WebServiceUtils;
import com.ifwd.fwdhk.utils.services.SendEmailDao;

@Controller
@SuppressWarnings("unchecked")
public class FlightController {
	
	private final static Logger logger = LoggerFactory.getLogger(FlightController.class);

	@Autowired
	RestServiceDao restService;

	@Autowired
	SendEmailDao sendEmail;

	@Autowired
	LocaleMessagePropertiesServiceImpl localeMessagePropertiesService;

	// @Link(label="Flight", family="FlightController", parent = "" )
	@RequestMapping(value = { "/{lang}/flight", "/{lang}/flight-insurance",
			"/{lang}/flight-insurance/sharing/" })
	public ModelAndView flight(HttpServletRequest request, Model model,
			@RequestParam(required = false) final String utm_source,
			@RequestParam(required = false) final String utm_medium,
			@RequestParam(required = false) final String utm_campaign,
			@RequestParam(required = false) final String utm_content) {
		
		
		SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yyyy");
		Date now = new Date();
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DAY_OF_YEAR, 90);
		Date endDate = c.getTime();
		
		String departureDate = (String)request.getParameter("departureDate");
		String returnDate = (String)request.getParameter("returnDate");
		Date deparDate = null;
		Date retDate = null;
		
		if(departureDate != null && DateApi.isValidDate(departureDate)){				
			deparDate = DateApi.formatDate(departureDate);				
		}
		
		if(returnDate != null && DateApi.isValidDate(returnDate)){
			retDate = DateApi.formatDate(returnDate);	
		}
		
		
		
		UserRestURIConstants.setController("Flight");
		
		request.setAttribute("controller", UserRestURIConstants.getController());
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);

		HttpSession session = request.getSession();
		PlanDetails planDetails = (PlanDetails) session
				.getAttribute("flightPlanDetails");

		model.addAttribute("utm_source", utm_source);
		model.addAttribute("utm_medium", utm_medium);
		model.addAttribute("utm_campaign", utm_campaign);
		model.addAttribute("utm_content", utm_content);
		
		
		
		if(planDetails == null || planDetails.getPlanSelected() == null){
			planDetails = new PlanDetails();
			if(deparDate != null && retDate != null && (deparDate.compareTo(now) >= 0 || sf.format(now).equals(departureDate)) &&
					(retDate.compareTo(now) >= 0 || sf.format(now).equals(departureDate)) && endDate.compareTo(deparDate)>=0 && endDate.compareTo(retDate)>=0 &&
					retDate.compareTo(deparDate) >=0){
				planDetails.setDepartureDate(departureDate);
				planDetails.setReturnDate(returnDate);
			}
			
			planDetails.setTotalPersonalTraveller(1);
			planDetails.setTotalAdultTraveller(1);
			planDetails.setTotalChildTraveller(1);
			planDetails.setTotalOtherTraveller(0);
			planDetails.setPlanSelected("personal");
		}
		else{
		}

		// default
		/*
		planDetails.setTotalPersonalTraveller(1);
		planDetails.setTotalAdultTraveller(1);
		planDetails.setTotalChildTraveller(1);
		planDetails.setTotalOtherTraveller(0);
		planDetails.setPlanSelected("personal");
		planDetails.setTravellerCount(1);
		*/
		
		model.addAttribute(planDetails);

		String pageTitle = WebServiceUtils.getPageTitle("page.flight",
				UserRestURIConstants.getLanaguage(request));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle(
				"meta.flight", UserRestURIConstants.getLanaguage(request));

		
		
		
		String ogTitle = "";
		String ogType = "";
		String ogUrl = "";
		String ogImage = "";
		String ogDescription = "";
		String ogSiteName = "";
		
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
		
				
		
		
		
		if (request
				.getRequestURI()
				.toString()
				.equals(request.getContextPath() + "/tc/flight-insurance/sharing/") || request
				.getRequestURI()
				.toString()
				.equals(request.getContextPath() + "/en/flight-insurance/sharing/")) {
			ogTitle = WebServiceUtils.getPageTitle("flight.sharing.og.title",
					UserRestURIConstants.getLanaguage(request));
			ogType = WebServiceUtils.getPageTitle("flight.sharing.og.type",
					UserRestURIConstants.getLanaguage(request));
			ogUrl = WebServiceUtils.getPageTitle("flight.sharing.og.url",
					UserRestURIConstants.getLanaguage(request));
			ogImage = WebServiceUtils.getPageTitle("flight.sharing.og.image",
					UserRestURIConstants.getLanaguage(request));
			ogDescription = WebServiceUtils.getPageTitle(
					"flight.sharing.og.description",
					UserRestURIConstants.getLanaguage(request));
			ogSiteName = WebServiceUtils.getPageTitle(
					"flight.sharing.og.siteName",
					UserRestURIConstants.getLanaguage(request));
		} else {
			ogTitle = WebServiceUtils.getPageTitle("flight.og.title",
					UserRestURIConstants.getLanaguage(request));
			ogType = WebServiceUtils.getPageTitle("flight.og.type",
					UserRestURIConstants.getLanaguage(request));
			ogUrl = WebServiceUtils.getPageTitle("flight.og.url",
					UserRestURIConstants.getLanaguage(request));
			ogImage = WebServiceUtils.getPageTitle("flight.og.image",
					UserRestURIConstants.getLanaguage(request));
			ogDescription = WebServiceUtils.getPageTitle(
					"flight.og.description",
					UserRestURIConstants.getLanaguage(request));
			ogSiteName = WebServiceUtils.getPageTitle(
					"flight.og.siteName",
					UserRestURIConstants.getLanaguage(request));		
			googleRickSnippetBrand =WebServiceUtils.getPageTitle(
					"flight.googleRickSnippetBrand",
					UserRestURIConstants.getLanaguage(request));
			googleRickSnippetName =WebServiceUtils.getPageTitle(
					"flight.googleRickSnippetName",
					UserRestURIConstants.getLanaguage(request));
			
			googleRickSnippetImageUrl =WebServiceUtils.getPageTitle(
					"flight.googleRickSnippetImageUrl",
					UserRestURIConstants.getLanaguage(request));
			googleRickSnippetImageAlt =WebServiceUtils.getPageTitle(
					"flight.googleRickSnippetImageAlt",
					UserRestURIConstants.getLanaguage(request));
			googleRickSnippetRating =WebServiceUtils.getPageTitle(
					"flight.googleRickSnippetRating",
					UserRestURIConstants.getLanaguage(request));
			googleRickSnippetPrice =WebServiceUtils.getPageTitle(
					"flight.googleRickSnippetPrice",
					UserRestURIConstants.getLanaguage(request));
			googleRickSnippetAvailability =WebServiceUtils.getPageTitle(
					"flight.googleRickSnippetAvailability",
					UserRestURIConstants.getLanaguage(request));
			googleRickSnippetAvailabilityText =WebServiceUtils.getPageTitle(
					"flight.googleRickSnippetAvailabilityText",
					UserRestURIConstants.getLanaguage(request));
			googleRickSnippetDescription1 =WebServiceUtils.getPageTitle(
					"flight.googleRickSnippetDescription1",
					UserRestURIConstants.getLanaguage(request));
			googleRickSnippetDescription2 =WebServiceUtils.getPageTitle(
					"flight.googleRickSnippetDescription2",
					UserRestURIConstants.getLanaguage(request));
		}
		String flightScriptName = WebServiceUtils.getPageTitle("flight.script.name",
				UserRestURIConstants.getLanaguage(request));
		String flightScriptDescription = WebServiceUtils.getPageTitle("flight.script.description",
				UserRestURIConstants.getLanaguage(request));
		String flightScriptChildName = WebServiceUtils.getPageTitle("flight.script.child.name",
				UserRestURIConstants.getLanaguage(request));
		String flightScriptImg = WebServiceUtils.getPageTitle("flight.og.image",
				UserRestURIConstants.getLanaguage(request));
		model.addAttribute("flightScriptName", flightScriptName);
		model.addAttribute("flightScriptDescription", flightScriptDescription);
		model.addAttribute("flightScriptChildName", flightScriptChildName);
		model.addAttribute("flightScriptImg", flightScriptImg	);
		
		String twitterCard = WebServiceUtils.getPageTitle("twitter.flight.card",
				UserRestURIConstants.getLanaguage(request));
		String twitterImage = WebServiceUtils.getPageTitle("twitter.flight.image",
				UserRestURIConstants.getLanaguage(request));
		String twitterSite = WebServiceUtils.getPageTitle("twitter.flight.site",
				UserRestURIConstants.getLanaguage(request));
		String twitterUrl = WebServiceUtils.getPageTitle("twitter.flight.url",
				UserRestURIConstants.getLanaguage(request));
		String canonical = WebServiceUtils.getPageTitle("canonical.flight",
				UserRestURIConstants.getLanaguage(request));

		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);

		model.addAttribute("ogTitle", ogTitle);
		model.addAttribute("ogType", ogType);
		model.addAttribute("ogUrl", ogUrl);
		model.addAttribute("ogImage", ogImage);
		model.addAttribute("ogDescription", ogDescription);
		model.addAttribute("ogSiteName", ogSiteName);
		
		model.addAttribute("twitterCard", twitterCard);
		model.addAttribute("twitterImage", twitterImage);
		model.addAttribute("twitterSite", twitterSite);
		model.addAttribute("twitterUrl", twitterUrl);
		model.addAttribute("canonical", canonical);
		
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
		
		model.addAttribute(planDetails);
		return new ModelAndView(UserRestURIConstants.getSitePath(request)
				+ "flight/flight");
	}

	protected void removeSessionAttribute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("flightPlanDetails");
		session.removeAttribute("leavingDate");
		session.removeAttribute("backDate");
		session.removeAttribute("planType");
		session.removeAttribute("count");
		session.removeAttribute("days");
		session.removeAttribute("totalAdultTraveller");
		session.removeAttribute("totalChildTraveller");
		session.removeAttribute("totalOtherTraveller");
		session.removeAttribute("referralCode");
		session.removeAttribute("FlightResponseFrTrvl");
		session.removeAttribute("FlightObjectFrTrvl");
		session.removeAttribute("setReferenceNoForConfirmation");
		session.removeAttribute("policyNo");
		session.removeAttribute("setEmailForConfirmation");
		session.removeAttribute("createFlightPolicy");
	}

	// @Link(label="Flight Plan", family="FlightController", parent = "Flight" )
	@SuppressWarnings("deprecation")
	@RequestMapping(value = { "/{lang}/getFlightDate",
			"/{lang}/flight-insurance/quote" })
	public ModelAndView getFlightDate(HttpServletRequest request,
			@ModelAttribute("planBind") PlanDetails planDetails,
			BindingResult result, Model model) throws MalformedURLException,
			URISyntaxException {
		
		TravelQuoteBean travelQuote = new TravelQuoteBean();
		HttpSession session = request.getSession();
		//travelQuote = (TravelQuoteBean) session.getAttribute("travelQuote");
		//travelQuote = (TravelQuoteBean) session.getAttribute("corrTravelQuote");
		
		travelQuote.setTotalPersonalTraveller(planDetails.getTotalPersonalTraveller());
		travelQuote.setTotalAdultTraveller(planDetails.getTotalAdultTraveller());
		travelQuote.setTotalChildTraveller(planDetails.getTotalChildTraveller());
		travelQuote.setTotalOtherTraveller(planDetails.getTotalOtherTraveller());
		travelQuote.setPlanSelected(planDetails.getPlanSelected());
		travelQuote.setTrLeavingDate(planDetails.getDepartureDate());
		travelQuote.setTrBackDate(planDetails.getReturnDate());
		
		session.setAttribute("travelQuote", travelQuote);
		session.setAttribute("corrTravelQuote", travelQuote);
		
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);

		

		// removeSessionAttribute(request); // vincent, fix flight-plan-details
		// back btn to flight plan
		UserRestURIConstants.setController("Flight");
		request.setAttribute("controller", UserRestURIConstants.getController());

		if (planDetails.getDepartureDate() != null) {
			session.setAttribute("flightPlanDetails", planDetails);
		} else {
			planDetails = (PlanDetails) session.getAttribute("flightPlanDetails");

			if (planDetails == null) {
				return flight(request, model, "", "", "", "");
			}
		}
		FlightQuoteDetails flightQuoteDetails = new FlightQuoteDetails();
		int days = 0;

		Date dateD1 = DateApi.formatDate(planDetails.getDepartureDate());
		Date dateD2 = DateApi.formatDate(planDetails.getReturnDate());
		LocalDate commencementDate = new LocalDate(dateD1);
		LocalDate expiryDate = new LocalDate(dateD2);
		days = Days.daysBetween(commencementDate, expiryDate).getDays();
		planDetails.setDays(days + 1);
		travelQuote.setTotalTravellingDays(days + 1);
		if (session != null) {
			session.setAttribute("leavingDate", planDetails.getDepartureDate());
			session.setAttribute("backDate", planDetails.getReturnDate());
			session.setAttribute("planType", planDetails.getPlanSelected());
			session.setAttribute("count", planDetails.getTravellerCount());
			session.setAttribute("days", planDetails.getDays());
			session.setAttribute("totalAdultTraveller",
					planDetails.getTotalAdultTraveller());
			session.setAttribute("totalChildTraveller",
					planDetails.getTotalChildTraveller());
			session.setAttribute("totalOtherTraveller",
					planDetails.getTotalOtherTraveller());
			session.setAttribute("referralCode",
					StringHelper.emptyIfNull(planDetails.getReferralCode()));

		}

		int otherCount = 0, childCount = 0, adultCount = 0;
		boolean spouseCover = false, selfCover = false;

		if (planDetails.getPlanSelected().equals("personal")) {
			selfCover = true;
			spouseCover = false;
			otherCount = planDetails.getTotalPersonalTraveller();
			planDetails.setTotalChildTraveller(0);
			planDetails.setTotalAdultTraveller(0);
			planDetails.setTotalOtherTraveller(0);
			otherCount = otherCount - 1;

		} else if (planDetails.getPlanSelected().equals("family")) {
			selfCover = true;
			planDetails.setTravellerCount(0);
			childCount = planDetails.getTotalChildTraveller();
			adultCount = planDetails.getTotalAdultTraveller();
			if (adultCount > 1)
				spouseCover = true;
			else
				spouseCover = false;
			otherCount = planDetails.getTotalOtherTraveller();
		}
		TravelQuoteBean travelQuoteCount = new TravelQuoteBean();
		travelQuoteCount.setSelfCover(selfCover);
		travelQuoteCount.setSpouseCover(spouseCover);
		travelQuoteCount.setTotalChildTraveller(childCount);
		travelQuoteCount.setTotalOtherTraveller(otherCount);
		session.setAttribute("travelQuoteCount", travelQuoteCount);
		String base = UserRestURIConstants.GETFLIGHTQUOTE
				+ "?planCode=FlightCare" + "&selfCover=" + selfCover
				+ "&spouseCover=" + spouseCover + "&childInput=" + childCount
				+ "&otherInput=" + otherCount + "&commencementDate="
				+ commencementDate + "&expiryDate=" + expiryDate
				+ "&referralCode="
				+ (String) session.getAttribute("referralCode");
		
		/* flight landing page save date */
		String token = null, username = null;

		if ((session.getAttribute("token") != null)
				&& (session.getAttribute("username") != null)) {
			token = session.getAttribute("token").toString();
			username = session.getAttribute("username").toString();
		} else {
			restService.consumeLoginApi(request);
			token = session.getAttribute("token").toString();
			username = session.getAttribute("username").toString();

		}

		HashMap<String, String> header = new HashMap<String, String>(
				COMMON_HEADERS);
		header.put("token", token);
		header.put("userName", username);
		header.put("language", WebServiceUtils
				.transformLanaguage(UserRestURIConstants.getLanaguage(request)));
		JSONObject jsonObject = restService.consumeApi(HttpMethod.GET, base,
				header, null);
		logger.info("GETFLIGHTQUOTE Response" + jsonObject);

		if (jsonObject.get("errMsgs") == null & jsonObject != null) {

			JSONObject jsonPriceInfoA = new JSONObject();
			jsonPriceInfoA = (JSONObject) jsonObject.get("priceInfoA");

			flightQuoteDetails.setGrossPremium(StringHelper
					.formatPrice(checkJsonObjNull(jsonPriceInfoA,
							"grossPremium")));
			flightQuoteDetails.setDiscountPercentage(StringHelper
					.formatPrice(checkJsonObjNull(jsonPriceInfoA,
							"discountPercentage")));
			flightQuoteDetails.setDiscountAmount(StringHelper
					.formatPrice(checkJsonObjNull(jsonPriceInfoA,
							"discountAmount")));
			flightQuoteDetails.setTotalNetPremium(StringHelper
					.formatPrice(checkJsonObjNull(jsonPriceInfoA,
							"totalNetPremium")));
			flightQuoteDetails.setToalDue(StringHelper
					.formatPrice(checkJsonObjNull(jsonPriceInfoA, "totalDue")));
			planDetails.setFlightQuoteDetails(flightQuoteDetails);
			model.addAttribute(planDetails);
			model.addAttribute(flightQuoteDetails);
			String pageTitle = WebServiceUtils.getPageTitle(
					"page.flightQuotation",
					UserRestURIConstants.getLanaguage(request));
			String pageMetaDataDescription = WebServiceUtils.getPageTitle(
					"meta.flightQuotation",
					UserRestURIConstants.getLanaguage(request));
			model.addAttribute("pageTitle", pageTitle);
			model.addAttribute("pageMetaDataDescription",
					pageMetaDataDescription);
			
			String twitterCard = WebServiceUtils.getPageTitle("twitter.flight.card",
					UserRestURIConstants.getLanaguage(request));
			String twitterImage = WebServiceUtils.getPageTitle("twitter.flight.image",
					UserRestURIConstants.getLanaguage(request));
			String twitterSite = WebServiceUtils.getPageTitle("twitter.flight.site",
					UserRestURIConstants.getLanaguage(request));
			String twitterUrl = WebServiceUtils.getPageTitle("twitter.flight.url",
					UserRestURIConstants.getLanaguage(request));
			String canonical = WebServiceUtils.getPageTitle("canonical.flight",
					UserRestURIConstants.getLanaguage(request));
			model.addAttribute("twitterCard", twitterCard);
			model.addAttribute("twitterImage", twitterImage);
			model.addAttribute("twitterSite", twitterSite);
			model.addAttribute("twitterUrl", twitterUrl);
			model.addAttribute("canonical", canonical);
			
			return new ModelAndView(

			UserRestURIConstants.getSitePath(request) + "flight/flight-plan");

		} else {
			// return flight(request, model, "tc");
			return flight(request, model, "", "", "", "");
		}
	}

	// BMG updateFlightQuote
	// return JSON
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/updateFlightQuote", method = RequestMethod.POST)
	@ResponseBody
	public String updateFlightQuote(
			@ModelAttribute("planBind") PlanDetails planDetails,
			BindingResult result, Model model, HttpServletRequest request) {
		UserRestURIConstants.setController("Flight");
		
		// test planselected
		if( planDetails.getTotalPersonalTraveller() > 0 ) {
			planDetails.setPlanSelected("personal");
		}
		else if( planDetails.getTotalAdultTraveller() > 0 ) {
			planDetails.setPlanSelected("family");
		}
		planDetails.setTotalPersonalTraveller(Integer.parseInt(request.getParameter("totalPersonalTraveller")));
		planDetails.setTotalAdultTraveller(Integer.parseInt(request.getParameter("totalAdultTraveller")));
		planDetails.setTotalChildTraveller(Integer.parseInt(request.getParameter("totalChildTraveller")));
		planDetails.setTotalOtherTraveller(Integer.parseInt(request.getParameter("totalOtherTraveller")));
		planDetails.setDepartureDate(request.getParameter("departureDate"));
		planDetails.setReturnDate(request.getParameter("returnDate"));
		planDetails.setTravellerCount(planDetails.getTotalAdultTraveller()
				+ planDetails.getTotalChildTraveller()
				+ planDetails.getTotalOtherTraveller()
				+ planDetails.getTotalPersonalTraveller());
		
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		HttpSession session = request.getSession();
		// back btn to flight plan
		UserRestURIConstants.setController("Flight");
		request.setAttribute("controller", UserRestURIConstants.getController());

		if (planDetails.getDepartureDate() != null) {
			session.setAttribute("flightPlanDetails", planDetails);
		} else {
			planDetails = (PlanDetails) session.getAttribute("flightPlanDetails");

			if (planDetails == null) {
				return "planDetails == null";
			}
		}
		FlightQuoteDetails flightQuoteDetails = new FlightQuoteDetails();
		int days = 0;

		Date dateD1 = DateApi.formatDate(planDetails.getDepartureDate());
		Date dateD2 = DateApi.formatDate(planDetails.getReturnDate());
		LocalDate commencementDate = new LocalDate(dateD1);
		LocalDate expiryDate = new LocalDate(dateD2);
		
		days = Days.daysBetween(commencementDate, expiryDate).getDays();
		planDetails.setTotalTravellingDays(days + 1);
		planDetails.setDays(days + 1);
		if (session != null) {
			session.setAttribute("leavingDate", planDetails.getDepartureDate());
			session.setAttribute("backDate", planDetails.getReturnDate());
			session.setAttribute("planType", planDetails.getPlanSelected());
			session.setAttribute("count", planDetails.getTravellerCount());
			session.setAttribute("days", planDetails.getDays());		
			session.setAttribute("totalAdultTraveller",
					planDetails.getTotalAdultTraveller());
			session.setAttribute("totalChildTraveller",
					planDetails.getTotalChildTraveller());
			session.setAttribute("totalOtherTraveller",
					planDetails.getTotalOtherTraveller());
			session.setAttribute("referralCode",
					StringHelper.emptyIfNull(planDetails.getReferralCode()));

		}
		
		int otherCount = 0, childCount = 0, adultCount = 0;
		boolean spouseCover = false, selfCover = false;

		if (planDetails.getPlanSelected().equals("personal")) {
			selfCover = true;
			spouseCover = false;
			otherCount = planDetails.getTravellerCount();
			planDetails.setTotalChildTraveller(0);
			planDetails.setTotalAdultTraveller(0);
			planDetails.setTotalOtherTraveller(0);
			otherCount = otherCount - 1;

		} else if (planDetails.getPlanSelected().equals("family")) {
			selfCover = true;
			planDetails.setTravellerCount(0);
			childCount = planDetails.getTotalChildTraveller();
			adultCount = planDetails.getTotalAdultTraveller();
			if (adultCount > 1)
				spouseCover = true;
			else
				spouseCover = false;
			otherCount = planDetails.getTotalOtherTraveller();
		}
		TravelQuoteBean travelQuoteCount = new TravelQuoteBean();
		travelQuoteCount.setSelfCover(selfCover);
		travelQuoteCount.setSpouseCover(spouseCover);
		travelQuoteCount.setTotalChildTraveller(childCount);
		travelQuoteCount.setTotalOtherTraveller(otherCount);
		session.setAttribute("travelQuoteCount", travelQuoteCount);
		String base = UserRestURIConstants.GETFLIGHTQUOTE
				+ "?planCode=FlightCare" + "&selfCover=" + selfCover
				+ "&spouseCover=" + spouseCover + "&childInput=" + childCount
				+ "&otherInput=" + otherCount + "&commencementDate="
				+ commencementDate + "&expiryDate=" + expiryDate
				+ "&referralCode="
				+ (String) session.getAttribute("referralCode");
		
		/* flight landing page save date */
		String token = null, username = null;

		if ((session.getAttribute("token") != null)
				&& (session.getAttribute("username") != null)) {
			token = session.getAttribute("token").toString();
			username = session.getAttribute("username").toString();
		} else {
			restService.consumeLoginApi(request);
			token = session.getAttribute("token").toString();
			username = session.getAttribute("username").toString();

		}

		HashMap<String, String> header = new HashMap<String, String>(
				COMMON_HEADERS);
		header.put("token", token);
		header.put("userName", username);
		header.put("language", WebServiceUtils
				.transformLanaguage(UserRestURIConstants.getLanaguage(request)));
		JSONObject jsonObject = restService.consumeApi(HttpMethod.GET, base,
				header, null);
		logger.info("updateFlightQuote:jsonObject ====>>>>>>" + JsonUtils.jsonPrint(jsonObject));

		if (jsonObject.get("errMsgs") == null & jsonObject != null) {
			
			jsonObject.put("totalDays", planDetails.getDays());

			JSONObject jsonPriceInfoA = new JSONObject();
			jsonPriceInfoA = (JSONObject) jsonObject.get("priceInfoA");

			flightQuoteDetails.setGrossPremium(StringHelper
					.formatPrice(checkJsonObjNull(jsonPriceInfoA,
							"grossPremium")));
			flightQuoteDetails.setDiscountPercentage(StringHelper
					.formatPrice(checkJsonObjNull(jsonPriceInfoA,
							"discountPercentage")));
			flightQuoteDetails.setDiscountAmount(StringHelper
					.formatPrice(checkJsonObjNull(jsonPriceInfoA,
							"discountAmount")));
			flightQuoteDetails.setTotalNetPremium(StringHelper
					.formatPrice(checkJsonObjNull(jsonPriceInfoA,
							"totalNetPremium")));
			flightQuoteDetails.setToalDue(StringHelper
					.formatPrice(checkJsonObjNull(jsonPriceInfoA, "totalDue")));
			planDetails.setFlightQuoteDetails(flightQuoteDetails);
			model.addAttribute(planDetails);
			model.addAttribute(flightQuoteDetails);
//			return new ModelAndView(
//			UserRestURIConstants.getSitePath(request) + "flight/flight-plan");
//			return "days: " + planDetails.getTotalTravellingDays();
			return jsonObject.toString();

		} else {
			// return flight(request, model, "tc");
			//return flight(request, model);
			return "flight(request, model)";
		}		
	}
	// BMG updateFlightQuote
	
	// @Link(label="Flight Plan Detail", family="FlightController", parent =
	@SuppressWarnings("rawtypes")
	// "Flight Plan" )
	@RequestMapping(value = { "/{lang}/flight-plan-details",
			"/{lang}/flight-insurance/user-details" })
	public ModelAndView flightPlanDetails(HttpServletRequest request,
			//@ModelAttribute("flightQuoteDetails") PlanDetails planDetails,
			@ModelAttribute("planBind") PlanDetails planDetails,
			BindingResult result, Model model) {
		UserRestURIConstants.setController("Flight");
		HttpSession session = request.getSession();
		
		String theClubMembershipNo = WebServiceUtils.getParameterValue("theClubMembershipNo", session, request);
		String placeholder = WebServiceUtils.getMessage("club.membership.number", UserRestURIConstants.getLanaguage(request));
		String MembershipNo = "";
		if(placeholder.equals(theClubMembershipNo)) {
			MembershipNo = "";
		}else {
			MembershipNo = theClubMembershipNo;
		}
		session.setAttribute("theClubMembershipNo", MembershipNo);
		
		//FOLOWING IS TO HANDLE CHANGE LANGUAGE AS THE planDetails WILL BE NULL
		if (planDetails.getReturnDate() == null) {
			planDetails = (PlanDetails) session.getAttribute("flightPlanDetails");
		} else {
			session.setAttribute("flightPlanDetails", planDetails);
		}
			
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);

		UserRestURIConstants.setController("Flight");
		request.setAttribute("controller", UserRestURIConstants.getController());
		

		if (session.getAttribute("token") == null) {
			return flight(request, model, "", "", "", "");
			// return flight(request, model, "tc");

		}
		// redirect to 1ST step when null
		//planDetails = (PlanDetails) session.getAttribute("flightPlanDetails"); // vincent this line overwritten the correct values
		if (planDetails == null) {
			// return flight(request, model, "tc");
			return flight(request, model, "", "", "", "");
		}

		planDetails.setTotalDue(request.getParameter("ToalDue"));
		String Url = UserRestURIConstants.GET_AGE_TYPE + "?itemTable=AgeType";

		HashMap<String, String> header = new HashMap<String, String>(
				COMMON_HEADERS);
		if (request.getSession().getAttribute("username") != null) {
			header.put("userName", request.getSession()
					.getAttribute("username").toString());
			header.put("token", request.getSession().getAttribute("token")
					.toString());
		}
		
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		
		header.put("language", WebServiceUtils
				.transformLanaguage(lang));
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,
				Url, header, null);

		if (responseJsonObj.get("errMsgs") == null) {
			JSONArray jsonAgeTypeArray = (JSONArray) responseJsonObj
					.get("optionItemDesc");
			/* JSONObject jsonObjectAgeType = null; */
			logger.info("jsonAgeTypeArray ====>>>>>>" + JsonUtils.jsonPrint(jsonAgeTypeArray));
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

				if (mapEntry.getKey().equals("2")
						|| mapEntry.getKey().equals("3"))
					mapSelfType.put((String) mapEntry.getKey(),
							(String) mapEntry.getValue());

			}
			iterator = mapAgeType.entrySet().iterator();
			while (iterator.hasNext()) {
				Map.Entry mapEntry = (Map.Entry) iterator.next();
				// mapEntry.getValue());
				if (mapEntry.getKey().equals("1"))
					mapChildType.put((String) mapEntry.getKey(),
							(String) mapEntry.getValue());

			}
			model.addAttribute("mapAgeType", mapAgeType);
			model.addAttribute("mapSelfType", mapSelfType);
			model.addAttribute("mapChildType", mapChildType);

		} else {
			logger.info("API failed - Could not retrieve Age Type List" + responseJsonObj.get("errMsgs"));
			String returnUrl = UserRestURIConstants.getSitePath(request)
					+ "flight/flight-plan";
			model.addAttribute("errMsgs",
					"API failed - Could not retrieve Age Type List");
			return new ModelAndView(returnUrl);
		}
		String relationshipCode = UserRestURIConstants.GET_BENE_RELATIONSHIP_CODE
				+ "?itemTable=BeneRelationshipCode";

		JSONObject jsonRelationShipCode = restService.consumeApi(
				HttpMethod.GET, relationshipCode, header, null);

		if (responseJsonObj.get("errMsgs") == null) {
			JSONArray jsonRelationshipCode = (JSONArray) jsonRelationShipCode
					.get("optionItemDesc");
			logger.info("jsonRelationShipArray ====>>>>>>" + JsonUtils.jsonPrint(jsonRelationshipCode));

			Map<String, String> mapRelationshipCode = new LinkedHashMap<String, String>();
			for (int i = 0; i < jsonRelationshipCode.size(); i++) {
				JSONObject obj = (JSONObject) jsonRelationshipCode.get(i);
				mapRelationshipCode.put(checkJsonObjNull(obj, "itemCode"),
						checkJsonObjNull(obj, "itemDesc"));
			}
			model.addAttribute("mapRelationshipCode", mapRelationshipCode);

		} else {
			String returnUrl = UserRestURIConstants.getSitePath(request) + "flight/flight-plan";
			model.addAttribute("errMsgs", "API failed - Could not retrieve Relationship code List");
			return new ModelAndView(returnUrl);
		}

		UserDetails userDetails = (UserDetails) request.getSession()
				.getAttribute("userDetails");
		if (userDetails != null) {
			model.addAttribute(userDetails);
		}
		String pageTitle = WebServiceUtils.getPageTitle(
				"page.flightUserDetails",
				UserRestURIConstants.getLanaguage(request));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle(
				"meta.flightUserDetails",
				UserRestURIConstants.getLanaguage(request));
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
		
		String twitterCard = WebServiceUtils.getPageTitle("twitter.flight.card",
				UserRestURIConstants.getLanaguage(request));
		String twitterImage = WebServiceUtils.getPageTitle("twitter.flight.image",
				UserRestURIConstants.getLanaguage(request));
		String twitterSite = WebServiceUtils.getPageTitle("twitter.flight.site",
				UserRestURIConstants.getLanaguage(request));
		String twitterUrl = WebServiceUtils.getPageTitle("twitter.flight.url",
				UserRestURIConstants.getLanaguage(request));
		String canonical = WebServiceUtils.getPageTitle("canonical.flight",
				UserRestURIConstants.getLanaguage(request));
		model.addAttribute("twitterCard", twitterCard);
		model.addAttribute("twitterImage", twitterImage);
		model.addAttribute("twitterSite", twitterSite);
		model.addAttribute("twitterUrl", twitterUrl);
		model.addAttribute("canonical", canonical);

		model.addAttribute("planDetailsForm", planDetails);
		String returnUrl = UserRestURIConstants.getSitePath(request)
				+ "flight/flight-plan-details";
		// return returnUrl;
		return new ModelAndView(returnUrl);
	}

	@RequestMapping(value = { "/flight-temp-save"})
	@ResponseBody
	public String flightTempSave(
		HttpServletRequest request,
		@ModelAttribute("confirmationData") PlanDetailsForm planDetailsForm,
		BindingResult result, Model model) {
		HttpSession session = request.getSession();
		session.setAttribute("flight-temp-save", planDetailsForm);
		return "success";
		
	}
	
	@RequestMapping(value = { "/{lang}/flight-confirmation",
			"/{lang}/flight-insurance/confirm-policy" })
	@ResponseBody
	public JSONObject flightConfirmation(
			HttpServletRequest request,
			@ModelAttribute("confirmationData") PlanDetailsForm planDetailsForm,
			BindingResult result, Model model) {
		UserRestURIConstants.setController("Flight");
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);

		HttpSession session = request.getSession();
		JSONObject jsonObject = new JSONObject();
		
		if (session.getAttribute("token") == null) {
			model.addAttribute("errMsgs", "Session Expired");
			model.addAttribute("action", "/flight-insurance");
			jsonObject.put("result", "fail");
			return jsonObject;
		}
		UserRestURIConstants.setController("Flight");
		request.setAttribute("controller", UserRestURIConstants.getController());

        final String BENE_RELATIONSHIP_SELF = "SE";

        // applicant information
        String name = StringHelper.emptyIfNull(request.getParameter("fullName")).toUpperCase();
        String hkid = StringHelper.emptyIfNull(request.getParameter("hkid")).toUpperCase();
        String emailAddress = StringHelper.emptyIfNull(request.getParameter("emailAddress")).toUpperCase();
        String mobileNo = request.getParameter("mobileNo");


		String emailId = request.getParameter("emailAddress");
		request.setAttribute("email", emailId);
		JSONObject parameters = new JSONObject();
		parameters.put("planCode", "FlightCare");
		parameters.put("commencementDate",
				DateApi.pickDate1(planDetailsForm.getDepartureDate()));
		parameters.put("expiryDate",
				DateApi.pickDate1(planDetailsForm.getReturnDate()));
		JSONArray insured = new JSONArray();

		String langSelected = UserRestURIConstants.getLanaguage(request);

		
		for (int inx = 0; inx < planDetailsForm.getTotalPersonalTraveller(); inx++) {

			JSONObject beneficiary = new JSONObject();
			JSONObject personal = new JSONObject();
			personal.put("name", StringHelper.emptyIfNull( planDetailsForm.getPersonalName()[inx] ).toUpperCase());
			personal.put("ageRange", StringHelper.emptyIfNull( planDetailsForm.getPersonalAgeRange()[inx] ).toUpperCase());
			personal.put("hkId",	StringHelper.emptyIfNull( planDetailsForm.getPersonalHKID()[inx] ));
			personal.put("passport", "");

			if (inx != 0) {// For other travelers skip first one
				personal.put("relationship", "RF"); // adult - should be friend
				if (planDetailsForm.getPersonalBenificiaryFullName().length > 0) {
					if (!planDetailsForm.getPersonalBenificiaryFullName()[inx].isEmpty()
							&& BENE_RELATIONSHIP_SELF
									.compareToIgnoreCase(planDetailsForm
											.getPersonalBeneficiary()[inx]) != 0) {// If
																				// have
																				// beneficiary
						beneficiary.put("name", StringHelper.emptyIfNull( planDetailsForm.getPersonalBenificiaryFullName()[inx] ).toUpperCase());
						beneficiary.put("hkId",	checkPasswortAndHkid("hkId",
								planDetailsForm.getSelectedPersonalBenefitiaryHkidPass()[inx],
								planDetailsForm.getPersonalBenificiaryHkid()[inx].toUpperCase())
						 );
						
						beneficiary.put("passport", checkPasswortAndHkid("passport",
								planDetailsForm.getSelectedPersonalBenefitiaryHkidPass()[inx],
								planDetailsForm.getPersonalBenificiaryHkid()[inx].toUpperCase())
						 );

						
						beneficiary.put("relationship",
								planDetailsForm.getPersonalBeneficiary()[inx]); // input
						personal.put("beneficiary", beneficiary);
					} else {// If don't have beneficiary then
						beneficiary.put("name",	StringHelper.emptyIfNull( planDetailsForm.getPersonalName()[inx] ).toUpperCase());
						
						beneficiary.put("hkId",	planDetailsForm.getPersonalHKID()[inx].toUpperCase());
						
						beneficiary.put("passport", "");
						
						
						beneficiary.put("relationship",	planDetailsForm.getPersonalBeneficiary()[inx]); // input
						personal.put("beneficiary", beneficiary);
					}
				} else {// If don't have beneficiary then

					beneficiary
							.put("name", StringHelper.emptyIfNull( planDetailsForm.getPersonalName()[inx] ).toUpperCase());
					beneficiary.put("hkId",	planDetailsForm.getPersonalHKID()[inx].toUpperCase());
					
					beneficiary.put("passport", "");
					beneficiary.put("relationship",
							planDetailsForm.getPersonalBeneficiary()[inx]); // input
					personal.put("beneficiary", beneficiary);

					// clear bene info if bene relationship is SE
					planDetailsForm.getPersonalBenificiaryFullName()[inx] = "";
					planDetailsForm.getPersonalBenificiaryHkid()[inx] = "";
				}
			} else {// This is for Myself - with & wothout the beneficiary
                personal.put("relationship", ValidationUtils.getRelationshipById(hkid, personal.get("hkId").toString()));

				if (planDetailsForm.getPersonalBenificiaryFullName().length > 0) {
					if (!planDetailsForm.getPersonalBenificiaryFullName()[inx]
							.isEmpty()
							&& BENE_RELATIONSHIP_SELF
									.compareToIgnoreCase(planDetailsForm
											.getPersonalBeneficiary()[inx]) != 0) {// If
																				// have
																				// beneficiary
						beneficiary
								.put("name", StringHelper.emptyIfNull( planDetailsForm
										.getPersonalBenificiaryFullName()[inx] ).toUpperCase());
						beneficiary.put("hkId",	checkPasswortAndHkid("hkId",
								planDetailsForm.getSelectedPersonalBenefitiaryHkidPass()[inx],
								planDetailsForm.getPersonalBenificiaryHkid()[inx].toUpperCase())
						 );
						
						beneficiary.put("passport", checkPasswortAndHkid("passport",
								planDetailsForm.getSelectedPersonalBenefitiaryHkidPass()[inx],
								planDetailsForm.getPersonalBenificiaryHkid()[inx].toUpperCase())
						 );
						beneficiary.put("relationship", StringHelper.emptyIfNull(
								planDetailsForm.getPersonalBeneficiary()[inx] ).toUpperCase()); // input
						personal.put("beneficiary", beneficiary);
					} else {// If don't have beneficiary then
						beneficiary.put("name", StringHelper.emptyIfNull(
								planDetailsForm.getPersonalName()[inx] ).toUpperCase());
						beneficiary.put("hkId",	planDetailsForm.getPersonalHKID()[inx].toUpperCase());
						
						beneficiary.put("passport", "");
						beneficiary.put("relationship",
								planDetailsForm.getPersonalBeneficiary()[inx]); // input
						personal.put("beneficiary", beneficiary);
						planDetailsForm.getPersonalBenificiaryFullName()[inx] = "";
						planDetailsForm.getPersonalBenificiaryHkid()[inx] = "";
					}
				} else {// If don't have beneficiary then
					beneficiary
							.put("name", StringHelper.emptyIfNull( planDetailsForm.getPersonalName()[inx] ).toUpperCase());
					beneficiary.put("hkId",	planDetailsForm.getPersonalHKID()[inx].toUpperCase());
					
					beneficiary.put("passport", "");
					beneficiary.put("relationship", StringHelper.emptyIfNull(
							planDetailsForm.getPersonalBeneficiary()[inx] ).toUpperCase()); // input
					personal.put("beneficiary", beneficiary);
				}
			}
			insured.add(personal);

			// update relationship desc
			String[] relationships = planDetailsForm.getPersonalRelationDesc();
			if (relationships == null) {
				// not found in ModelAttribute
				relationships = new String[planDetailsForm
						.getTotalPersonalTraveller()];
			}
			String[] beneRelationships = planDetailsForm
					.getPersonalBeneRelationDesc();
			if (beneRelationships == null) {
				// not found in ModelAttribute
				beneRelationships = new String[planDetailsForm
						.getTotalPersonalTraveller()];
			}
			planDetailsForm.setPersonalRelationDesc(WebServiceUtils
					.getInsuredRelationshipDesc(relationships, langSelected,
							personal.get("relationship").toString(), inx));
			planDetailsForm.setPersonalBeneRelationDesc(WebServiceUtils
					.getBeneRelationshipDesc(beneRelationships, langSelected,
							beneficiary.get("relationship").toString(), inx));
		}
		
		
		
		
		
		
		
		
		
		
		
		for (int inx = 0; inx < planDetailsForm.getTotalAdultTraveller(); inx++) {

			JSONObject beneficiary = new JSONObject();
			JSONObject adult = new JSONObject();
			adult.put("name", StringHelper.emptyIfNull( planDetailsForm.getAdultName()[inx] ).toUpperCase());
			adult.put("ageRange", StringHelper.emptyIfNull( planDetailsForm.getAdultAgeRange()[inx] ).toUpperCase());
			adult.put("hkId", StringHelper.emptyIfNull( planDetailsForm.getAdultHKID()[inx] ).toUpperCase());
			adult.put("passport", "");
			if (inx != 0) {// For other travelers skip first one

				if (planDetailsForm.getPlanSelected().equals("personal"))
					adult.put("relationship", "RF"); // adult - should be friend
														// for personal plan
				else
					adult.put("relationship", "SP"); // adult - should be spouse
														// for family plan

				if (planDetailsForm.getAdultBenificiaryFullName().length > 0) {
					if (!planDetailsForm.getAdultBenificiaryFullName()[inx]
							.isEmpty()
							&& BENE_RELATIONSHIP_SELF
									.compareToIgnoreCase(planDetailsForm
											.getAdultBeneficiary()[inx]) != 0) {// If
																				// have
																				// beneficiary
						beneficiary.put("name", StringHelper.emptyIfNull( planDetailsForm.getAdultBenificiaryFullName()[inx] ).toUpperCase());
						beneficiary.put("hkId",	checkPasswortAndHkid("hkId",
								planDetailsForm.getSelectedAdBenefitiaryHkidPass()[inx],
								planDetailsForm.getAdultBenificiaryHkid()[inx].toUpperCase())
						 );
						
						beneficiary.put("passport", checkPasswortAndHkid("passport",
								planDetailsForm.getSelectedAdBenefitiaryHkidPass()[inx],
								planDetailsForm.getAdultBenificiaryHkid()[inx].toUpperCase())
						 );
						beneficiary.put("relationship",
								planDetailsForm.getAdultBeneficiary()[inx]); // input
						adult.put("beneficiary", beneficiary);
					} else {// If don't have beneficiary then
						beneficiary.put("name",	StringHelper.emptyIfNull( planDetailsForm.getAdultName()[inx] ).toUpperCase());
						beneficiary.put("hkId",	planDetailsForm.getAdultHKID()[inx].toUpperCase());
						
						beneficiary.put("passport", "");
						beneficiary.put("relationship",	planDetailsForm.getAdultBeneficiary()[inx]); // input
						adult.put("beneficiary", beneficiary);
					}
				} else {// If don't have beneficiary then

					beneficiary
							.put("name", StringHelper.emptyIfNull( planDetailsForm.getAdultName()[inx] ).toUpperCase());
					beneficiary.put("hkId",	planDetailsForm.getAdultHKID()[inx].toUpperCase());
					beneficiary.put("passport", "");
					beneficiary.put("relationship",
							planDetailsForm.getAdultBeneficiary()[inx]); // input
					adult.put("beneficiary", beneficiary);

					// clear bene info if bene relationship is SE
					planDetailsForm.getAdultBenificiaryFullName()[inx] = "";
					planDetailsForm.getAdultBenificiaryHkid()[inx] = "";
				}
			} else {// This is for Myself - with & wothout the beneficiary
                adult.put("relationship", ValidationUtils.getRelationshipById(hkid, adult.get("hkId").toString()));

				if (planDetailsForm.getAdultBenificiaryFullName().length > 0) {
					if (!planDetailsForm.getAdultBenificiaryFullName()[inx]
							.isEmpty()
							&& BENE_RELATIONSHIP_SELF
									.compareToIgnoreCase(planDetailsForm
											.getAdultBeneficiary()[inx]) != 0) {// If
																				// have
																				// beneficiary
						beneficiary
								.put("name", StringHelper.emptyIfNull( planDetailsForm
										.getAdultBenificiaryFullName()[inx] ).toUpperCase());
						beneficiary.put("hkId",	checkPasswortAndHkid("hkId",
								planDetailsForm.getSelectedAdBenefitiaryHkidPass()[inx],
								planDetailsForm.getAdultBenificiaryHkid()[inx].toUpperCase())
						 );
						
						beneficiary.put("passport", checkPasswortAndHkid("passport",
								planDetailsForm.getSelectedAdBenefitiaryHkidPass()[inx],
								planDetailsForm.getAdultBenificiaryHkid()[inx].toUpperCase())
						 );
						beneficiary.put("relationship", StringHelper.emptyIfNull(
								planDetailsForm.getAdultBeneficiary()[inx] ).toUpperCase()); // input
						adult.put("beneficiary", beneficiary);
					} else {// If don't have beneficiary then
						beneficiary.put("name", StringHelper.emptyIfNull(
								planDetailsForm.getAdultName()[inx] ).toUpperCase());
						beneficiary.put("hkId",	planDetailsForm.getAdultHKID()[inx].toUpperCase());
						
						beneficiary.put("passport", "");
						beneficiary.put("relationship",
								planDetailsForm.getAdultBeneficiary()[inx]); // input
						adult.put("beneficiary", beneficiary);

						// clear bene info if bene relationship is SE
						planDetailsForm.getAdultBenificiaryFullName()[inx] = "";
						planDetailsForm.getAdultBenificiaryHkid()[inx] = "";
					}
				} else {// If don't have beneficiary then
					beneficiary
							.put("name", StringHelper.emptyIfNull( planDetailsForm.getAdultName()[inx] ).toUpperCase());
					beneficiary.put("hkId",	planDetailsForm.getAdultHKID()[inx].toUpperCase());
					
					beneficiary.put("passport", "");
					beneficiary.put("relationship", StringHelper.emptyIfNull(
							planDetailsForm.getAdultBeneficiary()[inx] ).toUpperCase()); // input
					adult.put("beneficiary", beneficiary);
				}
			}
			insured.add(adult);

			// update relationship desc
			String[] relationships = planDetailsForm.getAdultRelationDesc();
			if (relationships == null) {
				// not found in ModelAttribute
				relationships = new String[planDetailsForm
						.getTotalAdultTraveller()];
			}
			String[] beneRelationships = planDetailsForm
					.getAdultBeneRelationDesc();
			if (beneRelationships == null) {
				// not found in ModelAttribute
				beneRelationships = new String[planDetailsForm
						.getTotalAdultTraveller()];
			}
			planDetailsForm.setAdultRelationDesc(WebServiceUtils
					.getInsuredRelationshipDesc(relationships, langSelected,
							adult.get("relationship").toString(), inx));
			planDetailsForm.setAdultBeneRelationDesc(WebServiceUtils
					.getBeneRelationshipDesc(beneRelationships, langSelected,
							beneficiary.get("relationship").toString(), inx));
		}
		if (planDetailsForm.getTotalChildTraveller() > 0) {
			for (int inx = 0; inx < planDetailsForm.getTotalChildTraveller(); inx++) {
				JSONObject child = new JSONObject();
				JSONObject beneficiary = new JSONObject();
				child.put("name", StringHelper.emptyIfNull( planDetailsForm.getChildName()[inx] ).toUpperCase());
				child.put("ageRange", StringHelper.emptyIfNull( planDetailsForm.getChildAgeRange()[inx] ).toUpperCase());
				child.put("hkId", planDetailsForm.getChildHKID()[inx].toUpperCase());
				child.put("passport", "");
				child.put("relationship", "CH"); // child
				if (planDetailsForm.getChildBenificiaryFullName().length > 0) {
					if (!planDetailsForm.getChildBenificiaryFullName()[inx]
							.isEmpty()
							&& BENE_RELATIONSHIP_SELF
									.compareToIgnoreCase(planDetailsForm
											.getChildBeneficiary()[inx]) != 0) {// If
																				// have
																				// beneficiary
						beneficiary.put("name", StringHelper.emptyIfNull( planDetailsForm.getChildBenificiaryFullName()[inx] ).toUpperCase());
						
						
						beneficiary.put("hkId",	
								checkPasswortAndHkid("hkId",
										planDetailsForm.getSelectedChldBenefitiaryHkidPass()[inx],
										planDetailsForm.getChildBenificiaryHkid()[inx].toUpperCase()));
						
						beneficiary.put("passport",	
								checkPasswortAndHkid("passport",
										planDetailsForm.getSelectedChldBenefitiaryHkidPass()[inx],
										planDetailsForm.getChildBenificiaryHkid()[inx].toUpperCase()));
						beneficiary.put("relationship",	planDetailsForm.getChildBeneficiary()[inx]); // input
						child.put("beneficiary", beneficiary);
					} else {// If don't have beneficiary
						beneficiary.put("name", StringHelper.emptyIfNull(
								planDetailsForm.getChildName()[inx] ).toUpperCase());
						beneficiary.put("hkId",	planDetailsForm.getChildHKID()[inx].toUpperCase());
						
						beneficiary.put("passport", "");
						beneficiary.put("relationship",
								planDetailsForm.getChildBeneficiary()[inx]); // input
						child.put("beneficiary", beneficiary);

						// clear bene info if bene relationship is SE
						planDetailsForm.getChildBenificiaryFullName()[inx] = "";
						planDetailsForm.getChildBenificiaryHkid()[inx] = "";
					}
				} else {// If don't have beneficiary
					beneficiary
							.put("name", StringHelper.emptyIfNull( planDetailsForm.getChildName()[inx] ).toUpperCase());
					
					
					beneficiary.put("hkId",	planDetailsForm.getChildHKID()[inx].toUpperCase());
					beneficiary.put("passport", "");
					beneficiary.put("relationship",
							planDetailsForm.getChildBeneficiary()[inx]); // input
					child.put("beneficiary", beneficiary);
				}
				insured.add(child);

				// update relationship desc
				String[] relationships = planDetailsForm.getChildRelationDesc();
				if (relationships == null) {
					// not found in ModelAttribute
					relationships = new String[planDetailsForm
							.getTotalChildTraveller()];
				}
				String[] beneRelationships = planDetailsForm
						.getChildBeneRelationDesc();
				if (beneRelationships == null) {
					// not found in ModelAttribute
					beneRelationships = new String[planDetailsForm
							.getTotalChildTraveller()];
				}
				planDetailsForm.setChildRelationDesc(WebServiceUtils
						.getInsuredRelationshipDesc(relationships,
								langSelected, child.get("relationship")
										.toString(), inx));
				planDetailsForm.setChildBeneRelationDesc(WebServiceUtils
						.getBeneRelationshipDesc(beneRelationships,
								langSelected, beneficiary.get("relationship")
										.toString(), inx));
			}
		}
		if (planDetailsForm.getTotalOtherTraveller() > 0) {
			for (int inx = 0; inx < planDetailsForm.getTotalOtherTraveller(); inx++) {
				JSONObject other = new JSONObject();
				other.put("name", StringHelper.emptyIfNull( planDetailsForm.getOtherName()[inx] ).toUpperCase());
				other.put("ageRange", planDetailsForm.getOtherAgeRange()[inx]);
				other.put("hkId", planDetailsForm.getOtherHKID()[inx].toUpperCase());
				other.put("passport", "");
				other.put("relationship", "RF"); // other, should be friend

				JSONObject beneficiary = new JSONObject();

				if (planDetailsForm.getOtherBenificiaryFullName().length > 0) {
					if (!planDetailsForm.getOtherBenificiaryFullName()[inx]
							.isEmpty()
							&& BENE_RELATIONSHIP_SELF
									.compareToIgnoreCase(planDetailsForm
											.getOtherBeneficiary()[inx]) != 0) {
						beneficiary
								.put("name", StringHelper.emptyIfNull( planDetailsForm
										.getOtherBenificiaryFullName()[inx] ).toUpperCase());
						beneficiary.put("hkId",	checkPasswortAndHkid("hkId",
								planDetailsForm.getSelectedOtherBenefitiaryHkidPass()[inx],
								planDetailsForm.getOtherBenificiaryHkid()[inx].toUpperCase())
						 );
						
						beneficiary.put("passport", checkPasswortAndHkid("passport",
								planDetailsForm.getSelectedOtherBenefitiaryHkidPass()[inx],
								planDetailsForm.getOtherBenificiaryHkid()[inx].toUpperCase())
						 );
						
						beneficiary.put("relationship",
								planDetailsForm.getOtherBeneficiary()[inx]); // input
						other.put("beneficiary", beneficiary);
					} else {// If don't have beneficiary
						beneficiary.put("name",	StringHelper.emptyIfNull( planDetailsForm.getOtherName()[inx] ).toUpperCase());
						beneficiary.put("hkId",	 planDetailsForm.getOtherHKID()[inx].toUpperCase());
						
						beneficiary.put("passport", "");
						beneficiary.put("relationship",	planDetailsForm.getOtherBeneficiary()[inx]); // input
						other.put("beneficiary", beneficiary);

						// clear bene info if bene relationship is SE
						planDetailsForm.getOtherBenificiaryFullName()[inx] = "";
						planDetailsForm.getOtherBenificiaryHkid()[inx] = "";
					}
				} else {// If don't have beneficiary
					beneficiary
							.put("name", StringHelper.emptyIfNull( planDetailsForm.getOtherName()[inx] ).toUpperCase());
					beneficiary.put("hkId", planDetailsForm.getOtherHKID()[inx].toUpperCase());
					beneficiary.put("passport", "");
							
					beneficiary.put("relationship",
							planDetailsForm.getOtherBeneficiary()[inx]); // input
					other.put("beneficiary", beneficiary);
				}
				insured.add(other);

				// update relationship desc
				String[] relationships = planDetailsForm.getOtherRelationDesc();
				if (relationships == null) {
					// not found in ModelAttribute
					relationships = new String[planDetailsForm.getTotalOtherTraveller()];
				}
				String[] beneRelationships = planDetailsForm.getOtherBeneRelationDesc();
				if (beneRelationships == null) {
					// not found in ModelAttribute
					beneRelationships = new String[planDetailsForm.getTotalOtherTraveller()];
				}
				planDetailsForm.setOtherRelationDesc(WebServiceUtils
						.getInsuredRelationshipDesc(relationships,
								langSelected, other.get("relationship")
										.toString(), inx));
				planDetailsForm.setOtherBeneRelationDesc(WebServiceUtils
						.getBeneRelationshipDesc(beneRelationships,
								langSelected, beneficiary.get("relationship")
										.toString(), inx));
			}
		}
		parameters.put("insured", insured);
		parameters.put("referralCode", session.getAttribute("referralCode"));
		
		String optOut1 = planDetailsForm.getCheckbox3()==true?"1":"0";
		String optOut2 = planDetailsForm.getCheckbox4()==true?"1":"0";
				
		/*String dob = request.getParameter("applicantDob");
		Calendar dateDob = Calendar.getInstance();
		dateDob.setTime(new Date(dob));
		Format f = new SimpleDateFormat("yyyy-MM-dd");
		dob = f.format(dateDob.getTime());*/
		
		String dob = DateApi.formatString(request.getParameter("applicantDob"));
		
		JSONObject applicantJsonObj = new JSONObject();
		applicantJsonObj.put("name", name);
		applicantJsonObj.put("gender", "M"); // default value
		applicantJsonObj.put("hkId", hkid);
		applicantJsonObj.put("dob", dob);
		applicantJsonObj.put("mobileNo", mobileNo);
		
		applicantJsonObj.put("optIn1", optOut1);
		applicantJsonObj.put("optIn2", optOut2);
		applicantJsonObj.put("email", emailAddress);

		request.setAttribute("fullName", name);
		request.setAttribute("hkid", hkid);
		request.setAttribute("mobileNo", mobileNo);
		request.setAttribute("emailAddress", emailAddress);
		request.setAttribute("optOut1", optOut1);
		request.setAttribute("optOut2", optOut2);
		parameters.put("applicant", applicantJsonObj);
		
		String theClubMembershipNo = (String)session.getAttribute("theClubMembershipNo");
		parameters.put("externalParty", StringUtils.isEmpty(theClubMembershipNo) ? "" : "THE CLUB");
		parameters.put("externalPartyCode", theClubMembershipNo);

		JSONObject addressJsonObj = new JSONObject();

		String usernameInSession = null;
		String tokenInSession = null;
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
		logger.info("CreateFilghr Request " + JsonUtils.jsonPrint(parameters));

		JSONObject responsObject = restService.consumeApi(HttpMethod.PUT,
				UserRestURIConstants.CREATEFLIGHTPOLICY, header, parameters);
		logger.info("CreateFilghr Response " + JsonUtils.jsonPrint(responsObject));

		if (responsObject.get("errMsgs") == null && responsObject != null) {
			session.setAttribute("FlightResponseFrTrvl", parameters);
			session.setAttribute("FlightObjectFrTrvl", planDetailsForm);
			CreateFlightPolicy createFlightPolicy = new CreateFlightPolicy();
			createFlightPolicy.setCurrCode(checkJsonObjNull(responsObject,
					"currCode"));
			createFlightPolicy.setReferenceNo(checkJsonObjNull(responsObject,
					"referenceNo"));
			createFlightPolicy.setMerchantId(checkJsonObjNull(responsObject,
					"merchantId"));
			// createFlightPolicy.setReferralCode(responsObject.get("referralCode").toString());
			createFlightPolicy.setPolicyNo(checkJsonObjNull(responsObject,
					"policyNo"));
			createFlightPolicy.setLang(checkJsonObjNull(responsObject, "lang"));
			// createFlightPolicy.setPlanCode(responsObject.get("planCode").toString());
			createFlightPolicy.setPaymentGateway(checkJsonObjNull(
					responsObject, "paymentGateway"));
			createFlightPolicy.setPaymentType(checkJsonObjNull(responsObject,
					"paymentType"));

			request.getSession().setAttribute("setReferenceNoForConfirmation",
					checkJsonObjNull(responsObject, "referenceNo"));

			request.getSession().setAttribute("policyNo",
					checkJsonObjNull(responsObject, "policyNo"));

			request.getSession().setAttribute("setEmailForConfirmation",
					request.getParameter("emailAddress"));
			model.addAttribute(createFlightPolicy);
			model.addAttribute("planDetailsForm", planDetailsForm);
			String pageTitle = WebServiceUtils.getPageTitle(
					"page.flightPlanConfirmation",
					UserRestURIConstants.getLanaguage(request));
			String pageMetaDataDescription = WebServiceUtils.getPageTitle(
					"meta.flightPlanConfirmation",
					UserRestURIConstants.getLanaguage(request));
			model.addAttribute("pageTitle", pageTitle);
			model.addAttribute("pageMetaDataDescription",
					pageMetaDataDescription);
			
			String twitterCard = WebServiceUtils.getPageTitle("twitter.flight.card",
					UserRestURIConstants.getLanaguage(request));
			String twitterImage = WebServiceUtils.getPageTitle("twitter.flight.image",
					UserRestURIConstants.getLanaguage(request));
			String twitterSite = WebServiceUtils.getPageTitle("twitter.flight.site",
					UserRestURIConstants.getLanaguage(request));
			String twitterUrl = WebServiceUtils.getPageTitle("twitter.flight.url",
					UserRestURIConstants.getLanaguage(request));
			String canonical = WebServiceUtils.getPageTitle("canonical.flight",
					UserRestURIConstants.getLanaguage(request));
			model.addAttribute("twitterCard", twitterCard);
			model.addAttribute("twitterImage", twitterImage);
			model.addAttribute("twitterSite", twitterSite);
			model.addAttribute("twitterUrl", twitterUrl);
			model.addAttribute("canonical", canonical);
			
			session.removeAttribute("flight-temp-save");
			jsonObject.put("result", "success");
			return jsonObject;
		} else {
			model.addAttribute("errMsgs", responsObject.get("errMsgs")
					.toString());
			model.addAttribute("action", "/flight-insurance");
			//return responsObject.get("errMsgs").toString();
			return responsObject;
		}
	}

	@RequestMapping(value = { "/{lang}/flight-confrimation-page",
			"/{lang}/flight-insurance/confirmation" })
	public ModelAndView flightConfrimationPage(
			Model model,
			HttpServletRequest request,
			@ModelAttribute("createFlightPolicy") CreateFlightPolicy createFlightPolicy) {
		UserRestURIConstants.setController("Flight");
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);

		HttpSession session = request.getSession();

		if (session.getAttribute("token") == null) {
			model.addAttribute("errMsgs", "Session Expired");
			model.addAttribute("action", "/flight-insurance");
			return new ModelAndView("/flight-insurance/user-details");
		}
		UserRestURIConstants.setController("Flight");
		request.setAttribute("controller", UserRestURIConstants.getController());
		 String upgradeReferralCode = "FLTUGD";
//		String upgradeReferralCode = "nathaniel.kw.cheung@fwd.com";

		/* Get Travel Policies */
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
			if (createFlightPolicy.getDepartureDate() != null) {
				session.setAttribute("createFlightPolicy", createFlightPolicy);
			} else {
				createFlightPolicy = (CreateFlightPolicy) session
						.getAttribute("createFlightPolicy");

				// redirect to 1ST step when null
				if (createFlightPolicy == null) {
					// return flight(request, model, "tc");
					return flight(request, model, "", "", "", "");

				}
			}

			/* Calculate total Days */

			Date dateD1 = DateApi.formatDate(createFlightPolicy.getDepartureDate());
			Date dateD2 = DateApi.formatDate(createFlightPolicy.getReturnDate());
			
			
			session.setAttribute("departureDate", createFlightPolicy.getDepartureDate());
			session.setAttribute("returnDate", createFlightPolicy.getReturnDate());
			
			
			
			LocalDate commencementDate = new LocalDate(dateD1);
			LocalDate expiryDate = new LocalDate(dateD2);
			days = Days.daysBetween(commencementDate, expiryDate).getDays();
			createFlightPolicy.setDays(days + 1);

			int otherCount = 0, childCount = 0, adultCount = 0;
			boolean spouseCover = false, selfCover = false;

			// RETRIEVE FROM SESSION OF PREVIOUSLY QUOTATION
			TravelQuoteBean travelQuoteCount = (TravelQuoteBean) session
					.getAttribute("travelQuoteCount");
			selfCover = travelQuoteCount.isSelfCover();
			spouseCover = travelQuoteCount.isSpouseCover();
			childCount = travelQuoteCount.getTotalChildTraveller();
			otherCount = travelQuoteCount.getTotalOtherTraveller();

			String Url = UserRestURIConstants.TRAVEL_GET_QUOTE + "?planCode=A"
					+ "&selfCover=" + selfCover + "&spouseCover=" + spouseCover
					+ "&childInput=" + childCount + "&otherInput=" + otherCount
					+ "&commencementDate=" + commencementDate + "&expiryDate="
					+ expiryDate + "&referralCode=" + upgradeReferralCode;

			HashMap<String, String> header = new HashMap<String, String>(
					COMMON_HEADERS);
			if (request.getSession().getAttribute("username") != null) {
				header.put("userName", username);
				header.put("token", token);
			}
			header.put("language", WebServiceUtils
					.transformLanaguage(UserRestURIConstants
							.getLanaguage(request)));
			JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,
					Url, header, null);

			logger.info("Get Travel Quotes API " + JsonUtils.jsonPrint(responseJsonObj));
			if (responseJsonObj.get("errMsgs") == null) {
				QuoteDetails quoteDetails = new QuoteDetails();
				quoteDetails.setPlanSelected(createFlightPolicy
						.getPlanSelected());
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
				session.setAttribute("quoteDetails", quoteDetails);
				model.addAttribute("quoteDetails", quoteDetails);
				model.addAttribute("createFlightPolicy", createFlightPolicy);
				model.addAttribute("dueAmount", "0.00");
				
				request.setAttribute("fullName",
						request.getParameter("fullName"));
				request.setAttribute("hkid", request.getParameter("hkid"));
				request.setAttribute("mobileNo",
						request.getParameter("mobileNo"));
				request.setAttribute("emailAddress",
						request.getParameter("emailAddress"));
				if (request.getParameter("checkbox3")!=null && request.getParameter("checkbox3").length()>0) {
					request.setAttribute("optIn1", "true");
				} else {
					request.setAttribute("optIn1", "false");					
				}
				if (request.getParameter("checkbox4")!=null && request.getParameter("checkbox4").length()>0) {
					request.setAttribute("optIn2", "true");
				} else {
					request.setAttribute("optIn2", "false");					
				}

			} else {
				model.addAttribute("errMsgs", responseJsonObj.get("errMsgs"));
				return new ModelAndView("/flight-insurance/user-details");

			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errMsgs", "System Error");
			return new ModelAndView("/flight-insurance/user-details");
		}
		String pageTitle = WebServiceUtils.getPageTitle("page.flightQuotation",
				UserRestURIConstants.getLanaguage(request));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle(
				"meta.flightQuotation",
				UserRestURIConstants.getLanaguage(request));
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
		
		String twitterCard = WebServiceUtils.getPageTitle("twitter.flight.card",
				UserRestURIConstants.getLanaguage(request));
		String twitterImage = WebServiceUtils.getPageTitle("twitter.flight.image",
				UserRestURIConstants.getLanaguage(request));
		String twitterSite = WebServiceUtils.getPageTitle("twitter.flight.site",
				UserRestURIConstants.getLanaguage(request));
		String twitterUrl = WebServiceUtils.getPageTitle("twitter.flight.url",
				UserRestURIConstants.getLanaguage(request));
		String canonical = WebServiceUtils.getPageTitle("canonical.flight",
				UserRestURIConstants.getLanaguage(request));
		model.addAttribute("twitterCard", twitterCard);
		model.addAttribute("twitterImage", twitterImage);
		model.addAttribute("twitterSite", twitterSite);
		model.addAttribute("twitterUrl", twitterUrl);
		model.addAttribute("canonical", canonical);
		
		session.setAttribute("referralCode",
				StringHelper.emptyIfNull(upgradeReferralCode));
		return new ModelAndView(UserRestURIConstants.getSitePath(request)
				+ "flight/flight-confirmation");
	}

	private String[] getHkidOption(int count)
	{
		String[] selectedHkidOption = new String[count];
		for (int i=0; i<selectedHkidOption.length; i++) {
			selectedHkidOption[i] = "HKID";
		}
		return selectedHkidOption;
	}
	
	@RequestMapping(value = "/{lang}/flight-upgrade-travel-summary")
	public String flightToTravelUpgrade(Model model,
			HttpServletRequest request,
			@ModelAttribute("travelQuote") CreateFlightPolicy createFlightPolicy) {
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		HttpSession session = request.getSession();
		
		UserRestURIConstants.setController("Travel");
		request.setAttribute("controller", UserRestURIConstants.getController());
		String dueAmount = WebServiceUtils.getParameterValue(
				"selectedAmountDue", session, request);
		String selectPlanPremium = WebServiceUtils.getParameterValue(
				"selectPlanPremium", session, request);
		
		String selectPlanName = request.getParameter("planName");
		TravelQuoteBean travelQuote = (TravelQuoteBean)session.getAttribute("corrTravelQuote");
		PlanDetails planDetails = (PlanDetails)session.getAttribute("flightPlanDetails");
		session.setAttribute("selectPlanName", selectPlanName);
		session.setAttribute("planName", selectPlanName);
		session.setAttribute("planSelected", selectPlanName);
						
		if (createFlightPolicy.getDepartureDate() == null) {
			createFlightPolicy = (CreateFlightPolicy) session.getAttribute("upgradeCreateFlightPolicy");
			selectPlanName = (String) session.getAttribute("upgradeSelectPlanName");
			dueAmount = (String)session.getAttribute("upgradeDueAmount");
			selectPlanPremium = (String)session.getAttribute("originalAmount");
		} else {
			session.setAttribute("upgradeCreateFlightPolicy", createFlightPolicy);
			session.setAttribute("upgradeSelectPlanName", selectPlanName);
			session.setAttribute("upgradeDueAmount", dueAmount);
			session.setAttribute("dueAmount", dueAmount);
			session.setAttribute("originalAmount", selectPlanPremium);
		}
		
		JSONObject parameters = new JSONObject();
		if (session.getAttribute("FlightResponseFrTrvl") != null) {
			
			parameters = (JSONObject) session
					.getAttribute("FlightResponseFrTrvl");
			JSONObject applicant = (JSONObject) parameters.get("applicant");
			applicant.put("optIn1", createFlightPolicy.getCheckbox3()==true?"1":"0");
			applicant.put("optIn2", createFlightPolicy.getCheckbox4()==true?"1":"0");
			parameters.put("applicant", applicant);
			parameters.put("planCode", selectPlanName);
		}
		PlanDetailsForm plandetailsForm = new PlanDetailsForm();
		plandetailsForm.setTotalAdultTraveller(createFlightPolicy.getTotalAdultTraveller());
		plandetailsForm.setTotalChildTraveller(createFlightPolicy.getTotalChildTraveller());
		plandetailsForm.setTotalOtherTraveller(createFlightPolicy.getTotalOtherTraveller());
		plandetailsForm.setTotalPersonalTraveller(createFlightPolicy.getTotalPersonalTraveller());
		
		logger.info("add setSelectedAdHkidPass");
		if (session.getAttribute("FlightObjectFrTrvl") != null) {
			plandetailsForm = (PlanDetailsForm) session
					.getAttribute("FlightObjectFrTrvl");
			if (plandetailsForm.getTotalPersonalTraveller() > 0) {
				plandetailsForm.setPersonalAgeRangeName(WebServiceUtils
						.getAgeRangeNames(plandetailsForm.getPersonalAgeRange(),
								UserRestURIConstants.getLanaguage(request)));
			}

			if (plandetailsForm.getTotalAdultTraveller() > 0) {
				plandetailsForm.setSelectedAdHkidPass(getHkidOption(plandetailsForm.getTotalAdultTraveller()));
				plandetailsForm.setAdultAgeRangeName(WebServiceUtils
						.getAgeRangeNames(plandetailsForm.getAdultAgeRange(),
								UserRestURIConstants.getLanaguage(request)));
			}

			if (plandetailsForm.getTotalChildTraveller() > 0) {
				plandetailsForm.setSelectedChldHkidPass(getHkidOption(plandetailsForm.getTotalChildTraveller()));
				plandetailsForm.setChildAgeRangeName(WebServiceUtils
						.getAgeRangeNames(plandetailsForm.getChildAgeRange(),
								UserRestURIConstants.getLanaguage(request)));
			}

			if (plandetailsForm.getTotalOtherTraveller() > 0) {
				plandetailsForm.setSelectedOtHkidPass(getHkidOption(plandetailsForm.getTotalOtherTraveller()));
				plandetailsForm.setOtherAgeRangeName(WebServiceUtils
						.getAgeRangeNames(plandetailsForm.getOtherAgeRange(),
								UserRestURIConstants.getLanaguage(request)));
			}
		}
		plandetailsForm.setPlanSelected(travelQuote.getPlanSelected());
		HashMap<String, String> header = new HashMap<String, String>(
				COMMON_HEADERS);
		header.put("userName", (String) session.getAttribute("username"));
		header.put("token", (String) session.getAttribute("token"));
		header.put("language", WebServiceUtils
				.transformLanaguage(UserRestURIConstants.getLanaguage(request)));
		String referralCode = (String) session.getAttribute("referralCode");
		parameters.put("referralCode", referralCode);
		model.addAttribute("selectPlanName", createFlightPolicy.getPlanCode());
		logger.info("TRAVEL_CREATE_POLICY Requset" + JsonUtils.jsonPrint(parameters));

		JSONObject responsObject = restService.consumeApi(HttpMethod.PUT,
				UserRestURIConstants.TRAVEL_CREATE_POLICY, header, parameters);

		logger.info("TRAVEL_CREATE_POLICY Response" + JsonUtils.jsonPrint(responsObject));

		String finalizeReferenceNo = "";
		JSONObject resultObj = new JSONObject();
		if (resultObj.get("errMsgs") == null) {
			resultObj.get("referralCode");
			resultObj.get("referralName");
			resultObj.get("priceInfoA");
			@SuppressWarnings("unused")
			JSONObject jsonPriceInfoA = (JSONObject) resultObj
					.get("priceInfoA");
			CreatePolicy createPolicy = new CreatePolicy();
			finalizeReferenceNo = checkJsonObjNull(responsObject, "referenceNo");
			createPolicy.setReferenceNo(checkJsonObjNull(responsObject,
					"referenceNo"));
			createPolicy
					.setCurrCode(checkJsonObjNull(responsObject, "currCode"));
			createPolicy.setMerchantId(checkJsonObjNull(responsObject,
					"merchantId"));
			createPolicy
					.setPolicyNo(checkJsonObjNull(responsObject, "policyNo"));
			createPolicy.setLang(checkJsonObjNull(responsObject, "lang"));

			createPolicy.setPaymentGateway(checkJsonObjNull(responsObject,
					"paymentGateway"));
			createPolicy.setPaymentType(checkJsonObjNull(responsObject,
					"paymentType"));

			// Calling Api of Confirm Travel Care Policy
			JSONObject confirmPolicyParameter = new JSONObject();
			confirmPolicyParameter.put("referenceNo", finalizeReferenceNo);
			logger.info("Confirm Travel Policy Requst" + JsonUtils.jsonPrint(confirmPolicyParameter));
			JSONObject jsonResponse = restService.consumeApi(HttpMethod.POST,
					UserRestURIConstants.TRAVEL_CONFIRM_POLICY, header,
					confirmPolicyParameter);

			logger.info("Confirm Travel Policy Response " + JsonUtils.jsonPrint(jsonResponse));

			createPolicy.setSecureHash(checkJsonObjNull(jsonResponse,
					"secureHash"));
			createPolicy.setTransactionNo(checkJsonObjNull(jsonResponse,
					"transactionNumber"));
			createPolicy.setTransactionDate(checkJsonObjNull(jsonResponse,
					"transactionDate"));
			model.addAttribute(createPolicy);
			session.setAttribute("transactionDate",
					createPolicy.getTransactionDate());
			session.setAttribute("finalizeReferenceNo", finalizeReferenceNo);
			session.setAttribute("transNo", createPolicy.getTransactionNo());
			model.addAttribute("selectPlanName", selectPlanName);
		} else {
			return UserRestURIConstants.getSitePath(request) + "travel/travel";
		}	

		String applicantFullName = request.getParameter("fullName");
		String applicantHKID = request.getParameter("hkid");
		String applicantMobNo = request.getParameter("mobileNo");
		String emailAddress = request.getParameter("emailAddress");
		String optIn1 = request.getParameter("optIn1");
		String optIn2 = request.getParameter("optIn2");
		String totalTravallingDays = request.getParameter("days");

		TravelQuoteBean travelBean = new TravelQuoteBean();
		travelBean.setTrLeavingDate(parameters.get("commencementDate")
				.toString());
		travelBean.setTrBackDate(parameters.get("expiryDate").toString());
		travelBean.setTotalTraveller(createFlightPolicy.getTravellerCount());
		travelBean.setPlanSelected(createFlightPolicy.getPlanSelected());

		String path = request.getRequestURL().toString();
		UserDetails userDetails = new UserDetails();
		userDetails.setFullName(applicantFullName);
		userDetails.setHkid(applicantHKID);
		userDetails.setMobileNo(applicantMobNo);
		userDetails.setEmailAddress(emailAddress);
		userDetails.setOptIn1(optIn1);
		userDetails.setOptIn2(optIn2);
		travelBean.setTotalTraveller(plandetailsForm.getTotalAdultTraveller()
				+ plandetailsForm.getTotalChildTraveller()
				+ plandetailsForm.getTotalOtherTraveller()
				+ plandetailsForm.getTotalOtherTraveller());
		model.addAttribute("dueAmount", dueAmount);
		
		if (applicantFullName == null) {
			totalTravallingDays = (String) session.getAttribute("upgradeTotalTravallingDays");
			totalTravallingDays = (String) session.getAttribute("upgradeTotalTravallingDays");
			userDetails = (UserDetails) session.getAttribute("upgradeUserDetails");
			plandetailsForm = (PlanDetailsForm) session.getAttribute("upgradePlandetailsForm");
		} else {
			session.setAttribute("upgradeTotalTravallingDays", totalTravallingDays);
			session.setAttribute("upgradeTotalTravallingDays", totalTravallingDays);
			session.setAttribute("upgradeUserDetails", userDetails);
			session.setAttribute("upgradePlandetailsForm", plandetailsForm);
			
		}
			
		model.addAttribute("totalTravallingDays", totalTravallingDays);
		model.addAttribute("totalTravellingDays", totalTravallingDays);
		
		model.addAttribute("userDetails", userDetails);
		model.addAttribute("travelBean", travelBean);
		model.addAttribute("planDetailsForm", plandetailsForm);
		model.addAttribute("path", path.replace(
				"flight-upgrade-travel-summary", "travel-confirmation"));
		
		model.addAttribute("failurePath",
				path.replace("flight-upgrade-travel-summary", "travel-summary?paymentGatewayFlag=true"));

		model.addAttribute("failurePath",
				path.replace("flight-upgrade-travel-summary", "flight-upgrade-travel-summary?paymentGatewayFlag=true"));

        String paymentGatewayFlag =request.getParameter("paymentGatewayFlag");
        String errorMsg =request.getParameter("errorMsg");
        if(paymentGatewayFlag != null && paymentGatewayFlag.compareToIgnoreCase("true") == 0 && errorMsg == null){
            errorMsg = "Payment failure";
        }
        model.addAttribute("errormsg", errorMsg);
		
		String pageTitle = WebServiceUtils.getPageTitle(
				"page.travelPlanSummary",
				UserRestURIConstants.getLanaguage(request));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle(
				"meta.travelPlanSummary",
				UserRestURIConstants.getLanaguage(request));
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
		
		String twitterCard = WebServiceUtils.getPageTitle("twitter.flight.card",
				UserRestURIConstants.getLanaguage(request));
		String twitterImage = WebServiceUtils.getPageTitle("twitter.flight.image",
				UserRestURIConstants.getLanaguage(request));
		String twitterSite = WebServiceUtils.getPageTitle("twitter.flight.site",
				UserRestURIConstants.getLanaguage(request));
		String twitterUrl = WebServiceUtils.getPageTitle("twitter.flight.url",
				UserRestURIConstants.getLanaguage(request));
		String canonical = WebServiceUtils.getPageTitle("canonical.flight",
				UserRestURIConstants.getLanaguage(request));
		model.addAttribute("twitterCard", twitterCard);
		model.addAttribute("twitterImage", twitterImage);
		model.addAttribute("twitterSite", twitterSite);
		model.addAttribute("twitterUrl", twitterUrl);
		model.addAttribute("canonical", canonical);
		
		return UserRestURIConstants.getSitePath(request)
				+ "travel/travel-summary-payment";
	}

	public String checkJsonObjNull(JSONObject obj, String checkByStr) {
		if (obj.get(checkByStr) != null) {
			return obj.get(checkByStr).toString();
		} else {
			return "null";
		}
	}

	public String checkStringNull(String checkByStr) {
		if (checkByStr != null) {
			return checkByStr.toString();
		} else {
			return "null";
		}
	}

	private String checkPasswortAndHkid(String check, String selected,
			String selectedHkidOrPassport) {
		String response = "";
		if (selected == null)
			selected = "hkId";
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
