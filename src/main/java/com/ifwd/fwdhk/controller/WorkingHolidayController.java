package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.joda.time.Days;
import org.joda.time.LocalDate;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.model.QuoteDetails;
import com.ifwd.fwdhk.model.TravelQuoteBean;
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
	public ModelAndView getTravelHomePage(@RequestParam(required = false) final String promo, HttpServletRequest request, Model model) {

		UserRestURIConstants.setController("Working");
		request.setAttribute("controller", UserRestURIConstants.getController());
		//return UserRestURIConstants.checkLangSetPage(request) + "travel/travel";
		
		HttpSession session = request.getSession();
		session.setAttribute("referralCode", StringHelper.emptyIfNull(promo));
		TravelQuoteBean travelQuote;
		
		travelQuote = (TravelQuoteBean) session.getAttribute("travelQuote");
		
		if(travelQuote == null){
			travelQuote = new TravelQuoteBean();			
		}
		
		//default 
		travelQuote.setTotalPersonalTraveller(1);
		travelQuote.setTotalAdultTraveller(1);
		travelQuote.setTotalChildTraveller(1);
		travelQuote.setTotalOtherTraveller(0);
		travelQuote.setPlanSelected("personal");
		
		
		
		model.addAttribute("travelQuote", travelQuote);
		String pageTitle = WebServiceUtils.getPageTitle("page.travel", UserRestURIConstants.getLanaguage(request));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.travel", UserRestURIConstants.getLanaguage(request));
		String ogTitle = WebServiceUtils.getPageTitle("travel.og.title", UserRestURIConstants.getLanaguage(request));
		String ogType = WebServiceUtils.getPageTitle("travel.og.type", UserRestURIConstants.getLanaguage(request));
		String ogUrl = WebServiceUtils.getPageTitle("travel.og.url", UserRestURIConstants.getLanaguage(request));
		String ogImage = WebServiceUtils.getPageTitle("travel.og.image", UserRestURIConstants.getLanaguage(request));
		String ogDescription = WebServiceUtils.getPageTitle("travel.og.description", UserRestURIConstants.getLanaguage(request));
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
		model.addAttribute("ogTitle", ogTitle);
		model.addAttribute("ogType", ogType);
		model.addAttribute("ogUrl", ogUrl);
		model.addAttribute("ogImage", ogImage);
		model.addAttribute("ogDescription", ogDescription);
		
		return new ModelAndView(UserRestURIConstants.getSitePath(request) + "workingholiday/workingholiday");			
	}
	
	
	
	@RequestMapping(value = {"/{lang}/getTravelQuote", "/{lang}/workingholiday-insurance/quote"})
	public ModelAndView prepareTravelPlan(
			@ModelAttribute("travelQuote") TravelQuoteBean travelQuote,
			BindingResult result, Model model, HttpServletRequest request) {
		
		System.out.println("PERSONAL " + travelQuote.getTotalPersonalTraveller());
		System.out.println("ADULT " + travelQuote.getTotalAdultTraveller());
		System.out.println("CHILD " + travelQuote.getTotalChildTraveller());
		System.out.println("OTHER " + travelQuote.getTotalOtherTraveller());
		
		UserRestURIConstants.setController("Working");
		request.setAttribute("controller", UserRestURIConstants.getController());
		HttpSession session = request.getSession();
		if (travelQuote.getTrLeavingDate() != null) {
			session.setAttribute("travelQuote", travelQuote);
		} else {
			travelQuote = (TravelQuoteBean) session.getAttribute("travelQuote");
			if(travelQuote == null){
				return getTravelHomePage((String)session.getAttribute("referralCode"), request, model);		
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
			Date dateD1 = new Date(travelQuote.getTrLeavingDate());
			Date dateD2 = new Date(travelQuote.getTrBackDate());
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
				travelQuote.setTotalChildTraveller(0);
				travelQuote.setTotalAdultTraveller(0);
				travelQuote.setTotalOtherTraveller(otherCount - 1);
				otherCount = travelQuote.getTotalOtherTraveller();

			} else {
				travelQuote.setTotalPersonalTraveller(0);
				adultCount = travelQuote.getTotalAdultTraveller();
				childCount = travelQuote.getTotalChildTraveller();
				otherCount = travelQuote.getTotalOtherTraveller();
				selfCover = true;
				if (adultCount > 1) {
					spouseCover = true;
				} else {
					spouseCover = false;
				}
			}
			
			TravelQuoteBean travelQuoteCount = new TravelQuoteBean();
			travelQuoteCount.setSelfCover(selfCover);
			travelQuoteCount.setSpouseCover(spouseCover);
			travelQuoteCount.setTotalChildTraveller(childCount);
			travelQuoteCount.setTotalOtherTraveller(otherCount);
			session.setAttribute("travelQuoteCount", travelQuoteCount);
			
			System.out.println("------------------------------------------------------------");
			System.out.println("CALLING API");
			System.out.println("SELF COVER " + selfCover);
			System.out.println("SPOUSE COVER " + spouseCover);
			System.out.println("CHILD COUNT " + childCount);
			System.out.println("OTHER COUNT " + otherCount);		
			System.out.print("------------------------------------------------------------");
			
			session.setAttribute("planSelected", travelQuote.getPlanSelected());
			String Url = UserRestURIConstants.TRAVEL_GET_QUOTE + "?planCode=A"
					+ "&selfCover=" + selfCover + "&spouseCover=" + spouseCover
					+ "&childInput=" + childCount + "&otherInput="
					+ otherCount + "&commencementDate="
					+ commencementDate + "&expiryDate=" + expiryDate
					+ "&referralCode=" + (String) session.getAttribute("referralCode");

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
						+ "workingholiday/workingholiday");
			}
				
			
			

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errMsgs", "System Error");
			return new ModelAndView(UserRestURIConstants.getSitePath(request)
					+ "workingholiday/workingholiday");
		}
		String pageTitle = WebServiceUtils.getPageTitle("page.travelQuote", UserRestURIConstants.getLanaguage(request));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.travelQuote", UserRestURIConstants.getLanaguage(request));
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
		
		
		return new ModelAndView(UserRestURIConstants.getSitePath(request)
				+ "workingholiday/workingholiday-plan");
	}
	
	
}