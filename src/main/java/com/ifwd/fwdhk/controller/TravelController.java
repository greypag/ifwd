package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.joda.time.Days;
import org.joda.time.LocalDate;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
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
import com.ifwd.fwdhk.util.WebServiceUtils;
import com.ifwd.fwdhk.utils.services.SendEmailDao;

@Controller
public class TravelController {

	@Autowired
	RestServiceDao restService;

	@Autowired
	SendEmailDao sendEmail;

	@RequestMapping(value = "/travel")
	public String getTravelHomePage(Model model, HttpServletRequest request) {
		UserRestURIConstants.setController("Travel");
		request.setAttribute("controller", UserRestURIConstants.getController());
		return UserRestURIConstants.checkLangSetPage(request) + "travel/travel";
	}

	@SuppressWarnings({ "unchecked", "finally" })
	@RequestMapping(value = "/travel-confirmation")
	public String processPayment(Model model, HttpServletRequest request,
			@RequestParam String Ref) {

		UserRestURIConstants.setController("Travel");
		request.setAttribute("controller", UserRestURIConstants.getController());

		HttpSession session = request.getSession();

		JSONObject responsObject = new JSONObject();

		try {
			JSONObject parameters = new JSONObject();
			parameters.put("referenceNo",
					session.getAttribute("finalizeReferenceNo"));
			parameters
					.put("transactionNumber", session.getAttribute("transNo"));
			parameters.put("transactionDate",
					session.getAttribute("transactionDate"));
			parameters
					.put("creditCardNo", session.getAttribute("creditCardNo"));
			parameters.put("expiryDate", session.getAttribute("expiryDate"));

			HashMap<String, String> header = new HashMap<String, String>(
					COMMON_HEADERS);
			header.put("userName", session.getAttribute("username").toString());
			header.put("token", session.getAttribute("token").toString());
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
				session.setAttribute("policyNo", responsObject.get("policyNo"));
				model.addAttribute("policyNo", responsObject.get("policyNo"));
				model.addAttribute("emailAddress",
						session.getAttribute("emailAddress"));
				model.addAttribute("referralCode",
						session.getAttribute("referralCode"));
				return "travel/"
						+ UserRestURIConstants.checkLangSetPage(request)
						+ "/travel-confirmation";
			} else {
				System.out.println(responsObject.get("errMsgs").toString());
				model.addAttribute("errormsg", responsObject.get("errMsgs")
						.toString());
				return UserRestURIConstants.checkLangSetPage(request)
						+ "travel/travel-confirmation";
			}
		} finally {
			return UserRestURIConstants.checkLangSetPage(request)
					+ "travel/travel-confirmation";
		}
	}

	@RequestMapping(value = "/processTravePayment")
	@ResponseBody
	public String processPayment(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		request.getSession().setAttribute("transactionNo",
				request.getParameter("transNo"));
		request.getSession().setAttribute("creditCardNo",
				request.getParameter("cardNo"));
		request.getSession().setAttribute(
				"expiryDate",
				request.getParameter("epMonth")
						+ request.getParameter("epYear"));
		request.getSession().setAttribute("emailAddress",
				request.getParameter("emailAddress"));

		return "success";
	}

	@RequestMapping(value = "/getTravelQuote")
	public ModelAndView prepareTravelPlan(
			@ModelAttribute("travelQuote") TravelQuoteBean travelQuote,
			BindingResult result, Model model, HttpServletRequest request) {

		UserRestURIConstants.setController("Travel");
		request.setAttribute("controller", UserRestURIConstants.getController());
		HttpSession session = request.getSession();
		if (travelQuote.getTrLeavingDate() != null) {
			session.setAttribute("travelQuote", travelQuote);
		} else {
			travelQuote = (TravelQuoteBean) session.getAttribute("travelQuote");
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

			String userReferralCode = "";
			if (request.getSession().getAttribute("referralCode") != null) {
				userReferralCode = (String) request.getSession().getAttribute(
						"referralCode");
			}

			int otherCount = 0, childCount = 0, adultCount = 0;
			boolean spouseCover = false, selfCover = false;

			if (travelQuote.getPlanSelected().equals("personal")) {
				selfCover = true;
				otherCount = travelQuote.getTotalPersonalTraveller();
				travelQuote.setTotalChildTraveller(0);
				travelQuote.setTotalAdultTraveller(0);
				travelQuote.setTotalOtherTraveller(0);

			} else {
				spouseCover = true;
				selfCover = true;
				travelQuote.setTotalPersonalTraveller(0);
				childCount = travelQuote.getTotalChildTraveller();
				adultCount = travelQuote.getTotalAdultTraveller();
				otherCount = travelQuote.getTotalOtherTraveller() + adultCount;
			}

			String Url = UserRestURIConstants.TRAVEL_GET_QUOTE + "?planCode=A"
					+ "&selfCover=" + selfCover + "&spouseCover=" + spouseCover
					+ "&childInput=" + childCount + "&otherInput="
					+ (otherCount - 1) + "&commencementDate="
					+ commencementDate + "&expiryDate=" + expiryDate
					+ "&planCode=" + userReferralCode;

			System.out.println("Travel Quote user " + Url);

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
				String planeName[] = { "Plan A", "Plan B" };
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
			}
			model.addAttribute("travelQuoteBean", travelQuote);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ModelAndView(UserRestURIConstants.checkLangSetPage(request)
				+ "travel/travel-plan");
	}

	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/applyPromoCode", method = RequestMethod.POST)
	@ResponseBody
	public String applyPromotionCode(
			@ModelAttribute("travelQuote") TravelQuoteBean travelQuote,
			BindingResult result, Model model, HttpServletRequest request) {

		JSONObject responseJsonObj = new JSONObject();

		int days = 0;

		Date dateD1 = new Date(travelQuote.getTrLeavingDate());
		Date dateD2 = new Date(travelQuote.getTrBackDate());
		LocalDate commencementDate = new LocalDate(dateD1);
		LocalDate expiryDate = new LocalDate(dateD2);
		days = Days.daysBetween(commencementDate, expiryDate).getDays();
		String planSelected = request.getParameter("planSelected");
		int adults = travelQuote.getTotalAdultTraveller();
		int child = travelQuote.getTotalChildTraveller();
		int others = travelQuote.getTotalPersonalTraveller();
		boolean isSpouseCover = false;
		String referralCode = "";
		if (planSelected.equals("personal")) {
			if (adults > 1) {
				others = travelQuote.getTotalPersonalTraveller() - 1;
				isSpouseCover = false;
				child = 0;
			}
		} else {
			if (adults > 1) {
				isSpouseCover = true;
			} else {
				isSpouseCover = false;
				others = travelQuote.getTotalPersonalTraveller();
				child = travelQuote.getTotalChildTraveller();
			}
		}
		referralCode = request.getParameter("referralCode");
		try {
			travelQuote.setTotalTravellingDays(days + 1);
			String Url = UserRestURIConstants.TRAVEL_GET_QUOTE + "?planCode=A"
					+ "&selfCover=true" + "&spouseCover=" + isSpouseCover
					+ "&childInput=" + child + "&otherInput=" + others
					+ "&commencementDate=" + commencementDate + "&expiryDate="
					+ expiryDate + "&referralCode=" + referralCode;

			HashMap<String, String> header = new HashMap<String, String>(
					COMMON_HEADERS);
			if (request.getSession().getAttribute("username") != null) {
				header.put("userName",
						request.getSession().getAttribute("username")
								.toString());
				header.put("token", request.getSession().getAttribute("token")
						.toString());
			}
			header.put("language", WebServiceUtils
					.transformLanaguage(UserRestURIConstants
							.getLanaguage(request)));
			responseJsonObj = restService.consumeApi(HttpMethod.GET, Url,
					header, null);

			System.out.println("Response Get Travel Quotes API "
					+ responseJsonObj);
			if (responseJsonObj.get("errMsgs") == null) {
				QuoteDetails quoteDetails = new QuoteDetails();
				responseJsonObj.get("referralCode");
				responseJsonObj.get("referralName");
				responseJsonObj.get("priceInfoA");
				responseJsonObj.get("priceInfoB");
				JSONObject jsonPriceInfoA = new JSONObject();
				jsonPriceInfoA = (JSONObject) responseJsonObj.get("priceInfoA");
				JSONObject jsonPriceInfoB = new JSONObject();
				jsonPriceInfoB = (JSONObject) responseJsonObj.get("priceInfoB");
				String planeName[] = { "Plan A", "Plan B" };
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
			}
			model.addAttribute("travelQuoteBean", travelQuote);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(responseJsonObj.toString());
		return responseJsonObj.toString();
	}

	@RequestMapping(value = "/getYourDetails")
	public String prepareYourDetails(
			@ModelAttribute("travelQuote") TravelQuoteBean travelQuote,
			BindingResult result, Model model, HttpServletRequest request) {

		UserRestURIConstants.setController("Travel");
		request.setAttribute("controller", UserRestURIConstants.getController());
		HttpSession session = request.getSession();
		String planName = WebServiceUtils.getParameterValue("planName",
				session, request);
		String planSummary = WebServiceUtils.getParameterValue(
				"selectedAmountDue", session, request);
		String selectPlanName = WebServiceUtils.getParameterValue(
				"selectPlanName", session, request);
		System.out.println("Seeeeeee" + selectPlanName);
		if (travelQuote.getTrLeavingDate() != null) {
			session.setAttribute("travelQuote", travelQuote);
		} else {
			travelQuote = (TravelQuoteBean) session.getAttribute("travelQuote");
		}
		try {

			request.setAttribute("travelQuote", travelQuote);

			model.addAttribute("planName", planName);
			model.addAttribute("planSummary", planSummary);
			model.addAttribute("selectPlanName", selectPlanName);

			travelQuote.setTotalAdultTraveller(travelQuote
					.getTotalAdultTraveller()
					+ travelQuote.getTotalPersonalTraveller());
			request.getSession().setAttribute("departureDate",
					travelQuote.getTrLeavingDate());
			request.getSession().setAttribute("returnDate",
					travelQuote.getTrBackDate());
			String Url = UserRestURIConstants.GET_AGE_TYPE
					+ "?itemTable=AgeType";

			HashMap<String, String> header = new HashMap<String, String>(
					COMMON_HEADERS);
			if (request.getSession().getAttribute("username") != null) {
				header.put("userName", session.getAttribute("username")
						.toString());
				header.put("token", session.getAttribute("token").toString());
			}

			header.put("language", WebServiceUtils
					.transformLanaguage(UserRestURIConstants
							.getLanaguage(request)));
			JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,
					Url, header, null);

			if (responseJsonObj.get("errMsgs") == null) {
				JSONArray jsonAgeTypeArray = (JSONArray) responseJsonObj
						.get("optionItemDesc");
				/*
				 * System.out.println(" jsonAgeTypeArray ====>>>>>>" +
				 * jsonAgeTypeArray);
				 */
				Map<String, String> mapAgeType = new HashMap<String, String>();
				for (int i = 0; i < jsonAgeTypeArray.size(); i++) {
					JSONObject obj = (JSONObject) jsonAgeTypeArray.get(i);
					mapAgeType.put(checkJsonObjNull(obj, "itemCode"),
							checkJsonObjNull(obj, "itemDesc"));
				}
				model.addAttribute("mapAgeType", mapAgeType);

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

					Map<String, String> mapRelationshipCode = new HashMap<String, String>();
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
			}

			model.addAttribute("planName", planName);
			model.addAttribute("planSummary", planSummary);

			model.addAttribute("travelQuote", travelQuote);
		} catch (Exception e) {
			e.printStackTrace();

		}
		return UserRestURIConstants.checkLangSetPage(request)
				+ "travel/travel-plan-details";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/prepareUserSummary")
	public String prepareSummary(
			@ModelAttribute("frmYourDetails") PlanDetailsForm planDetailsForm,
			BindingResult result, Model model, HttpServletRequest request) {

		String hkId = "hkId", passId = "passport";

		UserRestURIConstants.setController("Travel");
		request.setAttribute("controller", UserRestURIConstants.getController());

		HttpSession session = request.getSession();

		UserDetails userDetails = new UserDetails();
		DateApi dateApi = new DateApi();

		String dueAmount = WebServiceUtils.getParameterValue("finalDueAmount",
				session, request);
		String userReferralCode = WebServiceUtils.getParameterValue(
				"referralCode", session, request);
		String selectPlanName = WebServiceUtils.getParameterValue(
				"selectedPlanName", session, request);
		;

		System.out.println("inside Controller fro prepare Summa"
				+ selectPlanName);

		String deaprtureDate = dateApi.pickDate((String) session
				.getAttribute("departureDate"));
		String returnDate = dateApi.pickDate((String) session
				.getAttribute("returnDate"));

		String applicantFullName = WebServiceUtils.getParameterValue(
				"fullName", session, request);
		String applicantHKID = WebServiceUtils.getParameterValue("hkid",
				session, request);
		String applicantMobNo = WebServiceUtils.getParameterValue("mobileNo",
				session, request);
		String emailAddress = WebServiceUtils.getParameterValue("emailAddress",
				session, request);
		String totalTravallingDays = WebServiceUtils.getParameterValue(
				"totalTrDays", session, request);
		String totalTravallers = WebServiceUtils.getParameterValue(
				"totalTravallingDays", session, request);
		/* System.out.println("applicantHKID=="+applicantHKID); */
		String strChildCount = WebServiceUtils.getParameterValue(
				"totalChildTraveller", session, request);
		String strAdultCount = WebServiceUtils.getParameterValue(
				"totalAdultTraveller", session, request);
		String strOtherCount = WebServiceUtils.getParameterValue(
				"totalOtherTraveller", session, request);

		if (planDetailsForm.getDepartureDate() != null) {
			session.setAttribute("travelPlanDetailsForm", planDetailsForm);
		} else {
			planDetailsForm = (PlanDetailsForm) session
					.getAttribute("travelPlanDetailsForm");
		}
		int totalChild;
		int totalAdults;
		int totalOthers;
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

		int totalCount = totalAdults + totalChild + totalOthers;

		userDetails.setFullName(applicantFullName);
		userDetails.setHkid(applicantHKID);
		userDetails.setMobileNo(applicantMobNo);
		userDetails.setEmailAddress(emailAddress);

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
		parameters.put("planCode", "A");
		
		//parameters.put("planCode", planDetailsForm.getPlanCode());
		
		parameters.put("commencementDate", deaprtureDate);
		parameters.put("expiryDate", returnDate);
		JSONArray insured = new JSONArray();


		for (int inx = 0; inx < planDetailsForm.getTotalAdultTraveller(); inx++) {
			JSONObject beneficiary = new JSONObject();
			JSONObject adult = new JSONObject();
			adult.put("name", planDetailsForm.getAdultName()[inx]);
			adult.put("ageRange", planDetailsForm.getAdultAgeRange()[inx]);
			adult.put(
					hkId,
					checkPasswortAndHkid(hkId,
							planDetailsForm.getSelectedAdHkidPass()[inx],
							planDetailsForm.getAdultHKID()[inx]));
			adult.put(
					passId,
					checkPasswortAndHkid(passId,
							planDetailsForm.getSelectedAdHkidPass()[inx],
							planDetailsForm.getAdultHKID()[inx]));

			/* adult.put("hkId", planDetailsForm.getAdultHKID()[inx]); */
			/* adult.put("passport", "1234" + inx); */
			/* adult.put("passport", ""); */
			if (inx != 0) {// For other travelers skip first one
				if (planDetailsForm.getPlanSelected().equals("personal")) 
					adult.put("relationship", "FE");
				else
					adult.put("relationship", "SP");
				if (planDetailsForm.getAdultBenificiaryFullName().length > 0) {
					if (!planDetailsForm.getAdultBenificiaryFullName()[inx]
							.isEmpty()) {// If have beneficiary
						beneficiary
								.put("name", planDetailsForm
										.getAdultBenificiaryFullName()[inx]);
						beneficiary
								.put(hkId,
										checkPasswortAndHkid(
												hkId,
												planDetailsForm
														.getSelectedAdBenefitiaryHkidPass()[inx],
												planDetailsForm
														.getAdultBenificiaryHkid()[inx]));
						beneficiary
								.put(passId,
										checkPasswortAndHkid(
												passId,
												planDetailsForm
														.getSelectedAdBenefitiaryHkidPass()[inx],
												planDetailsForm
														.getAdultBenificiaryHkid()[inx]));
						beneficiary.put("relationship",
								planDetailsForm.getAdultBeneficiary()[inx]);
						adult.put("beneficiary", beneficiary);
					} else {// If don't have beneficiary then
						beneficiary.put("name",
								planDetailsForm.getAdultName()[inx]);
						beneficiary
								.put(hkId,
										checkPasswortAndHkid(
												hkId,
												planDetailsForm
														.getSelectedAdHkidPass()[inx],
												planDetailsForm.getAdultHKID()[inx]));
						beneficiary
								.put(passId,
										checkPasswortAndHkid(
												passId,
												planDetailsForm
														.getSelectedAdHkidPass()[inx],
												planDetailsForm.getAdultHKID()[inx]));
						beneficiary.put("relationship",
								"SE");
						adult.put("beneficiary", beneficiary);
					}
				} else {// If don't have beneficiary then
					beneficiary
							.put("name", planDetailsForm.getAdultName()[inx]);
					/*
					 * beneficiary.put(hkId,
					 * planDetailsForm.getAdultHKID()[inx]);
					 */
					/* beneficiary.put("passport", "3451" + inx); */
					/* beneficiary.put(passId, ""); */
					beneficiary
							.put(hkId,
									checkPasswortAndHkid(hkId, planDetailsForm
											.getSelectedAdHkidPass()[inx],
											planDetailsForm.getAdultHKID()[inx]));
					beneficiary
							.put(passId,
									checkPasswortAndHkid(
											passId,
											planDetailsForm
													.getSelectedAdHkidPass()[inx],
											planDetailsForm.getAdultHKID()[inx]));
					beneficiary.put("relationship",
							"SE");
					adult.put("beneficiary", beneficiary);
				}
			} else {// This is for Myself - with & wothout the beneficiary
				adult.put("relationship", relationOfSelfTraveller);
				if (planDetailsForm.getAdultBenificiaryFullName().length > 0) {
					if (!planDetailsForm.getAdultBenificiaryFullName()[inx]
							.isEmpty()) {// If have beneficiary
						beneficiary
								.put("name", planDetailsForm
										.getAdultBenificiaryFullName()[inx]);
						/*
						 * beneficiary.put(hkId,
						 * planDetailsForm.getAdultBenificiaryHkid()[inx]);
						 */
						/* beneficiary.put("passport", "3451" + inx); */
						/* beneficiary.put(passId, ""); */
						beneficiary
								.put(hkId,
										checkPasswortAndHkid(
												hkId,
												planDetailsForm
														.getSelectedAdBenefitiaryHkidPass()[inx],
												planDetailsForm
														.getAdultBenificiaryHkid()[inx]));
						beneficiary
								.put(passId,
										checkPasswortAndHkid(
												passId,
												planDetailsForm
														.getSelectedAdBenefitiaryHkidPass()[inx],
												planDetailsForm
														.getAdultBenificiaryHkid()[inx]));
						beneficiary.put("relationship",
								planDetailsForm.getAdultBeneficiary()[inx]);
						adult.put("beneficiary", beneficiary);
					} else {// If don't have beneficiary then
						beneficiary.put("name",
								planDetailsForm.getAdultName()[inx]);
						/*
						 * beneficiary.put(hkId,
						 * planDetailsForm.getAdultHKID()[inx]);
						 */
						/* beneficiary.put("passport", "3451" + inx); */
						/* beneficiary.put(passId, ""); */
						beneficiary
								.put(hkId,
										checkPasswortAndHkid(
												hkId,
												planDetailsForm
														.getSelectedAdHkidPass()[inx],
												planDetailsForm.getAdultHKID()[inx]));
						beneficiary
								.put(passId,
										checkPasswortAndHkid(
												passId,
												planDetailsForm
														.getSelectedAdHkidPass()[inx],
												planDetailsForm.getAdultHKID()[inx]));

						beneficiary.put("relationship",
								"SE");
						adult.put("beneficiary", beneficiary);
					}
				} else {// If don't have beneficiary then
					beneficiary
							.put("name", planDetailsForm.getAdultName()[inx]);
					/*
					 * beneficiary.put(hkId,
					 * planDetailsForm.getAdultHKID()[inx]);
					 */
					/* beneficiary.put("passport", "3451" + inx); */
					/* beneficiary.put(passId, ""); */
					beneficiary
							.put(hkId,
									checkPasswortAndHkid(hkId, planDetailsForm
											.getSelectedAdHkidPass()[inx],
											planDetailsForm.getAdultHKID()[inx]));
					beneficiary
							.put(passId,
									checkPasswortAndHkid(
											passId,
											planDetailsForm
													.getSelectedAdHkidPass()[inx],
											planDetailsForm.getAdultHKID()[inx]));
					beneficiary.put("relationship", "SE");
					adult.put("beneficiary", beneficiary);
				}
			}
			insured.add(adult);
		}

		if (planDetailsForm.getTotalChildTraveller() > 0) {
			for (int inx = 0; inx < planDetailsForm.getTotalChildTraveller(); inx++) {
				JSONObject child = new JSONObject();
				JSONObject beneficiary = new JSONObject();
				child.put("name", planDetailsForm.getChildName()[inx]);
				child.put("ageRange", planDetailsForm.getChildAgeRange()[inx]);
				/* child.put(hkId, planDetailsForm.getChildHKID()[inx]); */
				/* child.put("passport", "5432" + inx); */
				/* child.put(passId, ""); */
				beneficiary.put(
						hkId,
						checkPasswortAndHkid(hkId,
								planDetailsForm.getSelectedChldHkidPass()[inx],
								planDetailsForm.getChildHKID()[inx]));
				beneficiary.put(
						passId,
						checkPasswortAndHkid(passId,
								planDetailsForm.getSelectedChldHkidPass()[inx],
								planDetailsForm.getChildHKID()[inx]));
				child.put("relationship", relationOfChildTraveller);

				/* String strings = planDetailsForm.getAdultBeneficiary()[inx]; */
				/* JSONObject beneficiary = new JSONObject(); */
				if (planDetailsForm.getChildBenificiaryFullName().length > 0) {
					if (!planDetailsForm.getChildBenificiaryFullName()[inx]
							.isEmpty()) {// If have beneficiary
						beneficiary
								.put("name", planDetailsForm
										.getChildBenificiaryFullName()[inx]);
						/*
						 * beneficiary.put(hkId,
						 * planDetailsForm.getChildBenificiaryHkid()[inx]);
						 */
						/* beneficiary.put("passport", "2345" + inx); */
						/* beneficiary.put(passId, ""); */
						beneficiary
								.put(hkId,
										checkPasswortAndHkid(
												hkId,
												planDetailsForm
														.getSelectedChldBenefitiaryHkidPass()[inx],
												planDetailsForm
														.getChildBenificiaryHkid()[inx]));
						beneficiary
								.put(passId,
										checkPasswortAndHkid(
												passId,
												planDetailsForm
														.getSelectedChldBenefitiaryHkidPass()[inx],
												planDetailsForm
														.getChildBenificiaryHkid()[inx]));
						beneficiary.put("relationship",
								planDetailsForm.getChildBeneficiary()[inx]);
						child.put("beneficiary", beneficiary);
					} else {// If don't have beneficiary
						beneficiary.put("name",
								planDetailsForm.getChildName()[inx]);
						/*
						 * beneficiary.put(hkId,
						 * planDetailsForm.getChildHKID()[inx]);
						 */
						/* beneficiary.put("passport", "9876" + inx); */
						/* beneficiary.put(passId, ""); */
						beneficiary.put(
								hkId,
								checkPasswortAndHkid(hkId, planDetailsForm
										.getSelectedChldHkidPass()[inx],
										planDetailsForm.getChildHKID()[inx]));
						beneficiary.put(
								passId,
								checkPasswortAndHkid(passId, planDetailsForm
										.getSelectedChldHkidPass()[inx],
										planDetailsForm.getChildHKID()[inx]));
						beneficiary.put("relationship",
								"SE");
						child.put("beneficiary", beneficiary);
					}
				} else {// If don't have beneficiary
					beneficiary
							.put("name", planDetailsForm.getChildName()[inx]);
					/*
					 * beneficiary.put(hkId,
					 * planDetailsForm.getChildHKID()[inx]);
					 */
					/* beneficiary.put("passport", "9876" + inx); */
					/* beneficiary.put(passId, ""); */
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
					beneficiary.put("relationship",
							"SE");
					child.put("beneficiary", beneficiary);
				}
				insured.add(child);
			}
		}

		if (planDetailsForm.getTotalOtherTraveller() > 0) {
			for (int inx = 0; inx < planDetailsForm.getTotalOtherTraveller(); inx++) {
				JSONObject other = new JSONObject();
				other.put("name", planDetailsForm.getOtherName()[inx]);
				other.put("ageRange", planDetailsForm.getOtherAgeRange()[inx]);
				/* other.put(hkId, planDetailsForm.getOtherHKID()[inx]); */
				/* other.put("passport", "9123" + inx); */
				/* other.put(passId, ""); */
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

				/* String strings = planDetailsForm.getAdultBeneficiary()[inx]; */
				/* JSONObject beneficiary = new JSONObject(); */
				if (planDetailsForm.getOtherBenificiaryFullName().length > 0) {
					if (!planDetailsForm.getOtherBenificiaryFullName()[inx]
							.isEmpty()) {
						beneficiary
								.put("name", planDetailsForm
										.getOtherBenificiaryFullName()[inx]);
						/*
						 * beneficiary.put(hkId,
						 * planDetailsForm.getOtherBenificiaryHkid()[inx]);
						 */
						/* beneficiary.put("passport", "9234" + inx); */
						/* beneficiary.put(passId, ""); */
						beneficiary
								.put(hkId,
										checkPasswortAndHkid(
												hkId,
												planDetailsForm
														.getSelectedOtherBenefitiaryHkidPass()[inx],
												planDetailsForm.getOtherHKID()[inx]));
						beneficiary
								.put(passId,
										checkPasswortAndHkid(
												passId,
												planDetailsForm
														.getSelectedOtherBenefitiaryHkidPass()[inx],
												planDetailsForm.getOtherHKID()[inx]));
						beneficiary.put("relationship",
								planDetailsForm.getOtherBeneficiary()[inx]);
						other.put("beneficiary", beneficiary);
					} else {// If don't have beneficiary
						beneficiary.put("name",
								planDetailsForm.getOtherName()[inx]);
						/*
						 * beneficiary.put(hkId,
						 * planDetailsForm.getOtherHKID()[inx]);
						 */
						/* beneficiary.put("passport", "8912" + inx); */
						/* beneficiary.put(passId, ""); */
						beneficiary
								.put(hkId,
										checkPasswortAndHkid(
												hkId,
												planDetailsForm
														.getSelectedOtHkidPass()[inx],
												planDetailsForm.getOtherHKID()[inx]));
						beneficiary
								.put(passId,
										checkPasswortAndHkid(
												passId,
												planDetailsForm
														.getSelectedOtHkidPass()[inx],
												planDetailsForm.getOtherHKID()[inx]));
						beneficiary.put("relationship",
								"SE");
						other.put("beneficiary", beneficiary);
					}
				} else {// If don't have beneficiary
					beneficiary
							.put("name", planDetailsForm.getOtherName()[inx]);
					/*
					 * beneficiary.put(hkId,
					 * planDetailsForm.getOtherHKID()[inx]);
					 */
					/* beneficiary.put("passport", "8912" + inx); */
					/* beneficiary.put(passId, ""); */
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
					beneficiary.put("relationship",
							"SE");
					other.put("beneficiary", beneficiary);
				}
				insured.add(other);
			}
		}

		parameters.put("insured", insured);

		/* parameters.put("referralCode", userReferralCode); */
		parameters.put("referralCode", session.getAttribute("referralCode"));

		JSONObject applicantJsonObj = new JSONObject();
		applicantJsonObj.put("name", (String) session.getAttribute("username"));
		applicantJsonObj.put("gender", "M");
		applicantJsonObj.put(hkId, applicantHKID);
		applicantJsonObj.put("dob", "");
		applicantJsonObj.put("mobileNo", applicantMobNo);
		applicantJsonObj.put("optIn1", planDetailsForm.getCheckbox1());
		applicantJsonObj.put("optIn2", planDetailsForm.getCheckbox2());
		applicantJsonObj.put("email", request.getParameter("emailAddress"));

		parameters.put("applicant", applicantJsonObj);

		JSONObject addressJsonObj = new JSONObject();
		addressJsonObj.put("room", "");
		addressJsonObj.put("floor", "");

		parameters.put("address", addressJsonObj);

		/* System.out.println(parameters); */

		HashMap<String, String> header = new HashMap<String, String>(
				COMMON_HEADERS);
		header.put("userName", (String) session.getAttribute("username"));
		header.put("token", (String) session.getAttribute("token"));
		header.put("language", WebServiceUtils
				.transformLanaguage(UserRestURIConstants.getLanaguage(request)));
		/*
		 * System.out.println("headers=====>>>>>" + header);
		 */
		// Comment for to avoid over load Data
		System.out.println("TRAVEL_CREATE_POLICY Parameters" + parameters);
		CreatePolicy createPolicy = (CreatePolicy) session
				.getAttribute("createPolicy");
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

				finalizeReferenceNo = checkJsonObjNull(responsObject,
						"referenceNo");
				createPolicy.setReferenceNo(checkJsonObjNull(responsObject,
						"referenceNo"));
				createPolicy.setCurrCode(checkJsonObjNull(responsObject,
						"currCode"));
				createPolicy.setMerchantId(checkJsonObjNull(responsObject,
						"merchantId"));
				createPolicy.setPolicyNo(checkJsonObjNull(responsObject,
						"policyNo"));
				createPolicy.setLang(checkJsonObjNull(responsObject, "lang"));

				createPolicy.setPaymentGateway(checkJsonObjNull(responsObject,
						"paymentGateway"));
				createPolicy.setPaymentType(checkJsonObjNull(responsObject,
						"paymentType"));

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
				model.addAttribute(createPolicy);
				session.setAttribute("createPolicy", createPolicy);
				/*
				 * System.out.println("Traveling Date==================>>" +
				 * createPolicy.getTransactionDate());
				 * System.out.println("Reference Numnber" + referenceNo);
				 */

				/*
				 * System.out.println("Session Id" +
				 * request.getSession().getId());
				 */
			}

		} else {
			session.setAttribute("finalizeReferenceNo",
					createPolicy.getReferenceNo());
		}
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
		/*
		 * System.out .println(
		 * "===========>+>+>+>+>+>+.=...............>>>>>>+=====>>>>>>>>>>>>>>>>>>>>>+"
		 * + dueAmount);
		 */

		String path = request.getRequestURL().toString();
		System.out.println("*****************" + selectPlanName);
		model.addAttribute("selectPlanName", selectPlanName);
		model.addAttribute("dueAmount", dueAmount);
		model.addAttribute("totalTravallingDays", totalTravallingDays);
		model.addAttribute("userDetails", userDetails);
		model.addAttribute("travelBean", travelBean);
		model.addAttribute("planDetailsForm", planDetailsForm);
		model.addAttribute("path",
				path.replace("prepareUserSummary", "travel-confirmation"));

		System.out.println(path.replace("prepareUserSummary",
				UserRestURIConstants.checkLangSetPage(request)
						+ "travel-confirmation"));
		model.addAttribute("failurePath",
				path.replace("prepareUserSummary", "failure"));
//		System.out.println("************"
//				+ path.replace("prepareUserSummary", "failure"));

		return UserRestURIConstants.checkLangSetPage(request)
				+ "/travel/travel-summary-payment";
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
		// String referalCOde = session.getAttribute("referralCode").toString();
		mailed = sendEmail.sendEmail(emailToSendPromoCode, "", header);
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