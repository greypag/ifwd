package com.ifwd.fwdhk.services.impl;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.joda.time.LocalDate;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.model.AnnualDetailsForm;
import com.ifwd.fwdhk.model.AnnualTravelQuoteBean;
import com.ifwd.fwdhk.model.CreatePolicy;
import com.ifwd.fwdhk.model.QuoteDetails;
import com.ifwd.fwdhk.model.TravelQuoteBean;
import com.ifwd.fwdhk.services.AnnualTravelService;
import com.ifwd.fwdhk.util.DateApi;
import com.ifwd.fwdhk.util.JsonUtils;
import com.ifwd.fwdhk.util.Methods;
import com.ifwd.fwdhk.util.StringHelper;
import com.ifwd.fwdhk.util.ValidationUtils;
import com.ifwd.fwdhk.util.WebServiceUtils;
import com.ifwd.fwdhk.utils.services.SendEmailDao;

@Service
public class AnnualTravelServiceImpl implements AnnualTravelService {
	private final static Logger logger = LoggerFactory.getLogger(AnnualTravelServiceImpl.class);
	
	@Autowired
	private RestServiceDao restService;
	
	@Autowired
	private SendEmailDao sendEmail;
	
	public String updateTravelQuote(@ModelAttribute("annualTravelQuote") AnnualTravelQuoteBean travelQuote,BindingResult result, Model model, HttpServletRequest request){
			UserRestURIConstants.setController("Travel");
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
			
			if (travelQuote.getTrLeavingDate() != null) {
				session.setAttribute("annualTravelQuote", travelQuote);
			}else {
				travelQuote = (AnnualTravelQuoteBean) session.getAttribute("corrAnnualTravelQuote");
				if(travelQuote == null) {
					return "travelQuote == null";
				}				
			}
			
			session.setAttribute("corrAnnualTravelQuote", travelQuote);
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
				/* Calculate total Days */
				Date dateD1 = DateApi.formatDate(travelQuote.getTrLeavingDate());
				LocalDate commencementDate = new LocalDate(dateD1);
				
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
				
				AnnualTravelQuoteBean travelQuoteCount = new AnnualTravelQuoteBean();
				travelQuoteCount.setSelfCover(selfCover);
				travelQuoteCount.setSpouseCover(spouseCover);
				travelQuoteCount.setTotalChildTraveller(childCount);
				travelQuoteCount.setTotalOtherTraveller(otherCount);
				session.setAttribute("annualTravelQuoteCount", travelQuoteCount);
				session.setAttribute("planSelected", travelQuote.getPlanSelected());
				
				String promoCode = (String) session.getAttribute("referralCode");
				promoCode = java.net.URLEncoder.encode(promoCode, "UTF-8").replace("+", "%20");
				String Url = UserRestURIConstants.ANNUAL_TRAVEL_GET_QUOTE
						+ "?planCode=A"
						+ "&selfCover=" + selfCover
						+ "&spouseCover=" + spouseCover
						+ "&childInput=" + childCount
						+ "&otherInput=" + otherCount
						+ "&commencementDate=" + commencementDate
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
					
					
					model.addAttribute("annualTravelQuoteBean", travelQuote);
					
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
	
	public String applyPromotionCode(@ModelAttribute("annualTravelQuote") AnnualTravelQuoteBean travelQuote,BindingResult result, Model model, HttpServletRequest request) throws ParseException{
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		JSONObject responseJsonObj = new JSONObject();
		HttpSession session = request.getSession();
		if (session.getAttribute("token") == null) {
			model.addAttribute("errMsgs", "Session Expired");
			return "fail";		
		}
		int otherCount = 0, childCount = 0, adultCount = 0;
		boolean spouseCover = false, selfCover = false;
		Date dateD1 = sdf.parse(travelQuote.getTrLeavingDate());
		LocalDate commencementDate = new LocalDate(dateD1);
		AnnualTravelQuoteBean travelQuoteCount = (AnnualTravelQuoteBean)session.getAttribute("annualTravelQuoteCount");
		selfCover = travelQuoteCount.isSelfCover();
		spouseCover = travelQuoteCount.isSpouseCover();
		childCount = travelQuoteCount.getTotalChildTraveller();
		otherCount = travelQuoteCount.getTotalOtherTraveller();
		
		try {
			String promoCode = request.getParameter("promoCode");
			promoCode = java.net.URLEncoder.encode(promoCode, "UTF-8").replace("+", "%20");

			String Url = UserRestURIConstants.ANNUAL_TRAVEL_GET_QUOTE
					+ "?planCode=A"
					+ "&selfCover=" + selfCover
					+ "&spouseCover=" + spouseCover
					+ "&childInput=" + childCount
					+ "&otherInput=" + otherCount
					+ "&commencementDate=" + commencementDate
					+ "&referralCode=" + promoCode;
			
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
				quoteDetails.setPlanSelected(session.getAttribute("planSelected").toString());
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
	
	@SuppressWarnings("unchecked")
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
			mailed = sendEmail.sendEmail(emailToSendPromoCode, "ANNTRA", header);
		if (mailed) {
			return "success";
		} else {
			return "fail";
		}
    }
	
	public String getAnnualTravelPlan(AnnualTravelQuoteBean travelQuote, Model model, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		
		if(travelQuote.getTrLeavingDate() != null) {
		}else {
			travelQuote = (AnnualTravelQuoteBean) session.getAttribute("corrAnnualTravelQuote");
			if(travelQuote == null) {
				return "fail";
			}				
		}
		session.setAttribute("corrAnnualTravelQuote", travelQuote);
		
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

			Date dateD1 = DateApi.formatDate(travelQuote.getTrLeavingDate());
			LocalDate commencementDate = new LocalDate(dateD1);
			
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
			
			AnnualTravelQuoteBean travelQuoteCount = new AnnualTravelQuoteBean();
			travelQuoteCount.setSelfCover(selfCover);
			travelQuoteCount.setSpouseCover(spouseCover);
			travelQuoteCount.setTotalChildTraveller(childCount);
			travelQuoteCount.setTotalOtherTraveller(otherCount);
			session.setAttribute("annualTravelQuoteCount", travelQuoteCount);
			session.setAttribute("planSelected", travelQuote.getPlanSelected());
			
			String promoCode = (String) session.getAttribute("referralCode");
			promoCode = java.net.URLEncoder.encode(StringUtils.isEmpty(promoCode) ? "" : promoCode, "UTF-8").replace("+", "%20");
			
			
			String Url = UserRestURIConstants.ANNUAL_TRAVEL_GET_QUOTE
					+ "?planCode=A"
					+ "&selfCover=" + selfCover
					+ "&spouseCover=" + spouseCover
					+ "&childInput=" + childCount
					+ "&otherInput=" + otherCount
					+ "&commencementDate=" + commencementDate
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

				session.setAttribute("quoteDetails", quoteDetails);
				return "success";
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

				session.setAttribute("quoteDetails", quoteDetails);
				
				session.setAttribute("referralCode", "");
				return "success";
			}else {
				session.setAttribute("errMsgs", responseJsonObj.get("errMsgs"));
				return "fail";
			}
	}
	
	public String prepareTravelInsuranceUserDetails(TravelQuoteBean travelQuote,
			BindingResult result, Model model, HttpServletRequest request) throws Exception{
        UserRestURIConstants.setController("Travel");
		HttpSession session = request.getSession();
		String Url = UserRestURIConstants.GET_AGE_TYPE + "?itemTable=AgeType";
		HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc")) {
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
			logger.info("GET_AGE_TYPE Response" + jsonAgeTypeArray);

			String relationshipCode = UserRestURIConstants.GET_BENE_RELATIONSHIP_CODE
					+ "?itemTable=BeneRelationshipCode";

			JSONObject jsonRelationShipCode = restService.consumeApi(
					HttpMethod.GET, relationshipCode, header, null);

			if (responseJsonObj.get("errMsgs") == null) {
				JSONArray jsonRelationshipCode = (JSONArray) jsonRelationShipCode.get("optionItemDesc");
				logger.info("jsonRelationShipArray ====>>>>>>" + jsonRelationshipCode);
				return "success";
			}else {
				model.addAttribute("errMsgs", responseJsonObj.get("errMsgs"));
				return "fail";
			}
		} else {
			model.addAttribute("errMsgs", responseJsonObj.get("errMsgs"));
			return "fail";
		}
	}
	
	/**
	 * @param planDetailsForm
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String prepareTravelInsuranceTravelSummary(AnnualDetailsForm planDetailsForm,
			BindingResult result, Model model, HttpServletRequest request) throws Exception{
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
		String applicantMobNo = Methods.formatMobile(WebServiceUtils.getParameterValue("mobileNo", session, request));
		String emailAddress = WebServiceUtils.getParameterValue("emailAddress",	session, request);
		String dob = WebServiceUtils.getParameterValue("applicantDob",	session, request);
		dob = DateApi.pickDate1(dob);
		
		if (planDetailsForm.getDepartureDate() != null) {
			session.setAttribute("travelPlanDetailsForm", planDetailsForm);
		} else {
			planDetailsForm = (AnnualDetailsForm) session.getAttribute("travelPlanDetailsForm");
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
 		for (int inx = 0; inx < planDetailsForm.getTotalPersonalTraveller(); inx++) {
			JSONObject beneficiary = new JSONObject();
			JSONObject personal = new JSONObject();
		
			personal.put("name", StringHelper.emptyIfNull( planDetailsForm.getPersonalName()[inx] ).toUpperCase() );
			personal.put("ageRange", "0");
			personal.put("dob", DateApi.pickDate1(planDetailsForm.getPersonalDob()[inx]));
			personal.put(hkId,	checkPasswortAndHkid(hkId, HKID, planDetailsForm.getPersonalHKID()[inx]));
			personal.put(passId, "");

			if (inx != 0) {
				personal.put("relationship", "RF");
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
				} else {
					beneficiary.put("name", StringHelper.emptyIfNull( planDetailsForm.getPersonalName()[inx] ).toUpperCase());
					beneficiary.put(hkId, checkPasswortAndHkid(hkId, HKID, planDetailsForm.getPersonalHKID()[inx]));
					beneficiary.put(passId, "");
					beneficiary.put("relationship", "SE");
					personal.put("beneficiary", beneficiary);
					
					planDetailsForm.getPersonalBenificiaryFullName()[inx] = "";
					planDetailsForm.getPersonalBenificiaryHkid()[inx] = "";
					
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
						beneficiary.put("relationship", planDetailsForm.getPersonalBeneficiary()[inx]);
						personal.put("beneficiary", beneficiary);
					} else {// If don't have beneficiary then
						beneficiary.put("name", StringHelper.emptyIfNull( planDetailsForm.getPersonalName()[inx] ).toUpperCase());
						beneficiary.put(hkId, checkPasswortAndHkid(hkId, HKID, planDetailsForm.getPersonalHKID()[inx]));
						beneficiary.put(passId, "");
						beneficiary.put("relationship", "SE");
						personal.put("beneficiary", beneficiary);
						planDetailsForm.getPersonalBenificiaryFullName()[inx] = "";
					}
				} else {
					beneficiary.put("name", StringHelper.emptyIfNull( planDetailsForm.getPersonalName()[inx] ).toUpperCase());
					beneficiary.put("hkId", checkPasswortAndHkid("hkId", HKID, planDetailsForm.getPersonalHKID()[inx]));
					beneficiary.put("passport", "");
					beneficiary.put("relationship", "SE");
					personal.put("beneficiary", beneficiary);
					
				}
			}
			if(inx == 0) {
				personal.put("dob", dob);
			}
			insured.add(personal);
		}
 		
 		for (int inx = 0; inx < planDetailsForm.getTotalAdultTraveller(); inx++) {
			JSONObject beneficiary = new JSONObject();
			JSONObject adult = new JSONObject();
			adult.put("name", StringHelper.emptyIfNull( planDetailsForm.getAdultName()[inx] ).toUpperCase() );
			adult.put("ageRange", "0");
			adult.put("dob", DateApi.pickDate1(planDetailsForm.getAdultDob()[inx]));
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
						beneficiary.put(hkId, checkPasswortAndHkid(hkId, HKID, planDetailsForm.getAdultHKID()[inx]));
						beneficiary.put(passId, "");
						beneficiary.put("relationship", "SE");
						adult.put("beneficiary", beneficiary);
						// clear bene info if bene relationship is SE
						planDetailsForm.getAdultBenificiaryFullName()[inx] = "";
						planDetailsForm.getAdultBenificiaryHkid()[inx] = "";
						
					}
				} else {// If don't have beneficiary then
					beneficiary.put("name", StringHelper.emptyIfNull( planDetailsForm.getAdultName()[inx] ).toUpperCase());
					beneficiary.put(hkId, checkPasswortAndHkid(hkId, HKID, planDetailsForm.getAdultHKID()[inx]));
					beneficiary.put(passId, "");
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
						beneficiary.put(hkId, checkPasswortAndHkid(hkId, HKID, planDetailsForm.getAdultHKID()[inx]));
						beneficiary.put(passId, "");
						beneficiary.put("relationship", "SE");
						adult.put("beneficiary", beneficiary);
						// clear bene info if bene relationship is SE
						planDetailsForm.getAdultBenificiaryFullName()[inx] = "";
						planDetailsForm.getAdultBenificiaryHkid()[inx] = "";
					}
				} else {// If don't have beneficiary then
					beneficiary.put("name", StringHelper.emptyIfNull( planDetailsForm.getAdultName()[inx] ).toUpperCase());
					beneficiary.put(hkId, checkPasswortAndHkid(hkId, HKID, planDetailsForm.getAdultHKID()[inx]));
					beneficiary.put(passId, "");
					beneficiary.put("relationship", "SE");
					adult.put("beneficiary", beneficiary);
				}
			}
			if(inx == 0) {
				adult.put("dob", dob);
			}
			insured.add(adult);
		}
 		for (int inx = 0; inx < planDetailsForm.getTotalChildTraveller(); inx++) {
			JSONObject child = new JSONObject();
			JSONObject beneficiary = new JSONObject();
			child.put("name", StringHelper.emptyIfNull( planDetailsForm.getChildName()[inx] ).toUpperCase());
			child.put("ageRange", "0");
			child.put("dob", DateApi.pickDate1(planDetailsForm.getChildDob()[inx]));
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
					beneficiary.put("name", StringHelper.emptyIfNull(planDetailsForm.getChildName()[inx] ).toUpperCase());
					beneficiary.put(hkId,
							checkPasswortAndHkid(hkId, HKID,
									planDetailsForm.getChildHKID()[inx]));
					beneficiary.put(passId,	"");
					beneficiary.put("relationship", "SE");
					child.put("beneficiary", beneficiary);
					
					// clear bene info if bene relationship is SE
					planDetailsForm.getChildBenificiaryFullName()[inx] = "";
					planDetailsForm.getChildBenificiaryHkid()[inx] = "";
				}
			} else {// If don't have beneficiary
				beneficiary.put("name", StringHelper.emptyIfNull(planDetailsForm.getChildName()[inx] ).toUpperCase());
				beneficiary
						.put(hkId,
								checkPasswortAndHkid(hkId, HKID,
										planDetailsForm.getChildHKID()[inx]));
				beneficiary.put(passId, "HKID");
				beneficiary.put("relationship","SE");
				child.put("beneficiary", beneficiary);
			}
			insured.add(child);
		}
 		/*for (int inx = 0; inx < planDetailsForm.getTotalOtherTraveller(); inx++) {
			JSONObject other = new JSONObject();
			other.put("name", StringHelper.emptyIfNull( planDetailsForm.getOtherName()[inx] ).toUpperCase());
			other.put("ageRange", "0");
			other.put(
					hkId,
					checkPasswortAndHkid(hkId,
							HKID,
							planDetailsForm.getOtherHKID()[inx]));
			other.put(
					passId,
					"");
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
					beneficiary.put("name", StringHelper.emptyIfNull(planDetailsForm.getOtherName()[inx] ).toUpperCase());
					beneficiary.put(hkId, checkPasswortAndHkid(hkId, HKID, planDetailsForm.getOtherHKID()[inx]));
					beneficiary
							.put(passId,
									"");
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
								checkPasswortAndHkid(hkId, HKID,
										planDetailsForm.getOtherHKID()[inx]));
				beneficiary
						.put(passId,
								"");
				beneficiary.put("relationship","SE");
				other.put("beneficiary", beneficiary);
			}
							
			insured.add(other);
		}*/
 		
		parameters.put("insured", insured);

		/* parameters.put("referralCode", userReferralCode); */
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
		
		String room = WebServiceUtils.getMessage("annual.details.address.room.placeholder", UserRestURIConstants.getLanaguage(request));
		String floor = WebServiceUtils.getMessage("annual.details.address.floor.placeholder", UserRestURIConstants.getLanaguage(request));
		String block = WebServiceUtils.getMessage("annual.details.address.block.placeholder", UserRestURIConstants.getLanaguage(request));
		String building = WebServiceUtils.getMessage("annual.details.address.building.placeholder", UserRestURIConstants.getLanaguage(request));
		String estate = WebServiceUtils.getMessage("annual.details.address.estate.placeholder", UserRestURIConstants.getLanaguage(request));
		String streetNo = WebServiceUtils.getMessage("annual.details.address.streetNo.placeholder", UserRestURIConstants.getLanaguage(request));
		String streetName = WebServiceUtils.getMessage("annual.details.address.streetName.placeholder", UserRestURIConstants.getLanaguage(request));
		if(room.equals(planDetailsForm.getApplicantRoom())) {
			room = "";
		}else {
			room = planDetailsForm.getApplicantRoom();
		}
		if(floor.equals(planDetailsForm.getApplicantFloor())) {
			floor = "";
		}else {
			floor = planDetailsForm.getApplicantFloor();
		}
		if(block.equals(planDetailsForm.getApplicantBlock())) {
			block = "";
		}else {
			block = planDetailsForm.getApplicantBlock();
		}
		if(building.equals(planDetailsForm.getApplicantBuilding())) {
			building = "";
		}else {
			building = planDetailsForm.getApplicantBuilding();
		}
		if(estate.equals(planDetailsForm.getApplicantEstate())) {
			estate = "";
		}else {
			estate = planDetailsForm.getApplicantEstate();
		}
		if(streetNo.equals(planDetailsForm.getApplicantStreetNo())) {
			streetNo = "";
		}else {
			streetNo = planDetailsForm.getApplicantStreetNo();
		}
		if(streetName.equals(planDetailsForm.getApplicantStreetName())) {
			streetName = "";
		}else {
			streetName = planDetailsForm.getApplicantStreetName();
		}
		addressJsonObj.put("room", room);
		addressJsonObj.put("floor", floor);
		addressJsonObj.put("block", block);
		addressJsonObj.put("building", building);
		addressJsonObj.put("estate", estate);
		addressJsonObj.put("streetNo", streetNo);
		addressJsonObj.put("streetName", streetName);
		addressJsonObj.put("district", planDetailsForm.getApplicantDistrict());
		addressJsonObj.put("area", planDetailsForm.getApplicantArea());
		
		parameters.put("address", addressJsonObj);
		String theClubMembershipNo = (String)session.getAttribute("theClubMembershipNo");
		parameters.put("externalParty", StringUtils.isEmpty(theClubMembershipNo) ? "" : "THE CLUB");
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
				//model.addAttribute(createPolicy);
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
	
	public String checkJsonObjNull(JSONObject obj, String checkByStr) {
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
