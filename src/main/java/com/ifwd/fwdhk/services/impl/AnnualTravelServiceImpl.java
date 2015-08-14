package com.ifwd.fwdhk.services.impl;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.joda.time.Days;
import org.joda.time.LocalDate;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.model.QuoteDetails;
import com.ifwd.fwdhk.model.TravelQuoteBean;
import com.ifwd.fwdhk.services.AnnualTravelService;
import com.ifwd.fwdhk.util.DateApi;
import com.ifwd.fwdhk.util.JsonUtils;
import com.ifwd.fwdhk.util.Methods;
import com.ifwd.fwdhk.util.StringHelper;
import com.ifwd.fwdhk.util.WebServiceUtils;
import com.ifwd.fwdhk.utils.services.SendEmailDao;

@Service
public class AnnualTravelServiceImpl implements AnnualTravelService {
	private final static Logger logger = LoggerFactory.getLogger(AnnualTravelServiceImpl.class);
	
	@Autowired
	private RestServiceDao restService;
	
	@Autowired
	private SendEmailDao sendEmail;
	
	public String updateTravelQuote(@ModelAttribute("travelQuote") TravelQuoteBean travelQuote,BindingResult result, Model model, HttpServletRequest request){
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
				if (lang.equals("tc"))
					lang = "CN";
				
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
	}
	
	public String applyPromotionCode(@ModelAttribute("travelQuote") TravelQuoteBean travelQuote,BindingResult result, Model model, HttpServletRequest request) throws ParseException{
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

			logger.info("Response Get Travel Quotes API " + JsonUtils.jsonPrint(responseJsonObj));
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
	
	public String processPayment(HttpServletRequest request,HttpServletResponse response){
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
	
	public String getPromoCode(HttpServletRequest request,HttpServletResponse response){
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
	
	public String sendEmail(HttpServletRequest request){
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
	
	public String checkJsonObjNull(JSONObject obj, String checkByStr) {
		if (obj.get(checkByStr) != null) {
			return obj.get(checkByStr).toString();
		} else {
			return "";
		}
	}
}
