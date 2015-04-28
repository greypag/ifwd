package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.PathVariable;
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
import com.ifwd.fwdhk.util.MessageUtil;
import com.ifwd.fwdhk.util.StringHelper;
import com.ifwd.fwdhk.util.WebServiceUtils;
import com.ifwd.fwdhk.utils.services.SendEmailDao;

@Controller
@SuppressWarnings("unchecked")
public class FlightController {

	@Autowired
	RestServiceDao restService;

	@Autowired
	SendEmailDao sendEmail;

	@Autowired
	LocaleMessagePropertiesServiceImpl localeMessagePropertiesService;

	// @Link(label="Flight", family="FlightController", parent = "" )
	@RequestMapping(value = { "/{lang}/flight", "/{lang}/flight-insurance", "/{lang}/flight-insurance/sharing/" })
	public ModelAndView flight(HttpServletRequest request, Model model) {
		UserRestURIConstants.setController("Flight");
		request.setAttribute("controller", UserRestURIConstants.getController());
		// return UserRestURIConstants.getSitePath(request) + "flight/flight";
		
		UserRestURIConstants urc = new UserRestURIConstants(); 
		urc.updateLanguage(request);	

		HttpSession session = request.getSession();
		PlanDetails planDetails = (PlanDetails) session
				.getAttribute("flightPlanDetails");

		if (planDetails == null) {
			planDetails = new PlanDetails();
		}

		planDetails.setTotalPersonalTraveller(1);
		planDetails.setTotalAdultTraveller(1);
		planDetails.setTotalChildTraveller(1);
		planDetails.setTotalOtherTraveller(0);
		planDetails.setPlanSelected("personal");
		planDetails.setTravellerCount(1);

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
		
		if (request.getRequestURI().toString().equals(request.getContextPath() + "/flight-insurance/sharing/")) { 
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
		}
		System.out.println("request URL " + request.getRequestURL().toString());
		
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);

		model.addAttribute("ogTitle", ogTitle);
		model.addAttribute("ogType", ogType);
		model.addAttribute("ogUrl", ogUrl);
		model.addAttribute("ogImage", ogImage);
		model.addAttribute("ogDescription", ogDescription);

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
	@RequestMapping(value = { "/{lang}/getFlightDate", "/{lang}/flight-insurance/quote" })
	public ModelAndView getFlightDate(HttpServletRequest request,
			@ModelAttribute("planBind") PlanDetails planDetails,
			BindingResult result, Model model) throws MalformedURLException,
			URISyntaxException {
		HttpSession session = request.getSession();

		// removeSessionAttribute(request); // vincent, fix flight-plan-details
		// back btn to flight plan
		UserRestURIConstants.setController("Flight");
		request.setAttribute("controller", UserRestURIConstants.getController());

		if (planDetails.getDepartureDate() != null) {
			session.setAttribute("flightPlanDetails", planDetails);
			System.out.println(this.getClass()
					+ " flightPlanDetails set session");
		} else {
			System.out
					.println(this.getClass()
							+ " planDetails.getDepartureDate() == null, flightPlanDetails get session");
			planDetails = (PlanDetails) session
					.getAttribute("flightPlanDetails");

			if (planDetails == null) {
				// return flight(request, model, "tc");
				return flight(request, model);
			}
		}
		FlightQuoteDetails flightQuoteDetails = new FlightQuoteDetails();
		System.out.println(planDetails.getDepartureDate() + " (Date1) "
				+ planDetails.getReturnDate());
		int days = 0;

		Date dateD1 = new Date(planDetails.getDepartureDate());
		Date dateD2 = new Date(planDetails.getReturnDate());
		LocalDate commencementDate = new LocalDate(dateD1);
		LocalDate expiryDate = new LocalDate(dateD2);
		days = Days.daysBetween(commencementDate, expiryDate).getDays();
		planDetails.setDays(days + 1);
		if (session != null) {
			System.out.println(planDetails.getDepartureDate() + " "
					+ planDetails.getReturnDate() + " "
					+ planDetails.getPlanSelected() + " "
					+ planDetails.getTravellerCount());
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
		;

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

		System.out.println("Fight Quote user " + base);

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
		System.out.println(jsonObject);

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
			return new ModelAndView(

			UserRestURIConstants.getSitePath(request) + "flight/flight-plan");

		} else {
			// return flight(request, model, "tc");
			return flight(request, model);
		}
	}

	// @Link(label="Flight Plan Detail", family="FlightController", parent =
	@SuppressWarnings("rawtypes")
	// "Flight Plan" )
	@RequestMapping(value = { "/{lang}/flight-plan-details",
			"/{lang}/flight-insurance/user-details" })
	public ModelAndView flightPlanDetails(HttpServletRequest request,
			@ModelAttribute("flightQuoteDetails") PlanDetails planDetails,
			BindingResult result, Model model) {
		UserRestURIConstants.setController("Flight");
		request.setAttribute("controller", UserRestURIConstants.getController());
		HttpSession session = request.getSession();

		if (session.getAttribute("token") == null) {
			return flight(request, model);
			// return flight(request, model, "tc");

		}
		// redirect to 1ST step when null
		planDetails = (PlanDetails) session.getAttribute("flightPlanDetails");
		if (planDetails == null) {
			// return flight(request, model, "tc");
			return flight(request, model);
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
		header.put("language", WebServiceUtils
				.transformLanaguage(UserRestURIConstants.getLanaguage(request)));
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,
				Url, header, null);

		if (responseJsonObj.get("errMsgs") == null) {
			JSONArray jsonAgeTypeArray = (JSONArray) responseJsonObj
					.get("optionItemDesc");
			/* JSONObject jsonObjectAgeType = null; */
			System.out.println(" jsonAgeTypeArray ====>>>>>>"
					+ jsonAgeTypeArray);
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
				System.out.println("key " + mapEntry.getKey() + " value "
						+ mapEntry.getValue());

				if (mapEntry.getKey().equals("2")
						|| mapEntry.getKey().equals("3"))
					mapSelfType.put((String) mapEntry.getKey(),
							(String) mapEntry.getValue());

			}
			iterator = mapAgeType.entrySet().iterator();
			while (iterator.hasNext()) {
				Map.Entry mapEntry = (Map.Entry) iterator.next();
				// System.out.println("key " + mapEntry.getKey() + " value " +
				// mapEntry.getValue());
				if (mapEntry.getKey().equals("1"))
					mapChildType.put((String) mapEntry.getKey(),
							(String) mapEntry.getValue());

			}
			model.addAttribute("mapAgeType", mapAgeType);
			model.addAttribute("mapSelfType", mapSelfType);
			model.addAttribute("mapChildType", mapChildType);

		} else {
			System.out.println("API failed - Could not retrieve Age Type List");
			String returnUrl = UserRestURIConstants.getSitePath(request)
					+ "flight/flight-plan";
			System.out.println("returnUrl " + returnUrl);
			model.addAttribute("errMsgs", "API failed - Could not retrieve Age Type List");
			return new ModelAndView(returnUrl);
		}
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
				JSONObject obj = (JSONObject) jsonRelationshipCode.get(i);
				mapRelationshipCode.put(checkJsonObjNull(obj, "itemCode"),
						checkJsonObjNull(obj, "itemDesc"));
			}
			model.addAttribute("mapRelationshipCode", mapRelationshipCode);

		} else {
			System.out.println("API failed - Could not retrieve Relationship code List");
			String returnUrl = UserRestURIConstants.getSitePath(request)
					+ "flight/flight-plan";
			System.out.println("returnUrl " + returnUrl);
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

		model.addAttribute("planDetailsForm", planDetails);
		String returnUrl = UserRestURIConstants.getSitePath(request)
				+ "flight/flight-plan-details";
		System.out.println("returnUrl " + returnUrl);
		// return returnUrl;
		return new ModelAndView(returnUrl);
	}

	@RequestMapping(value = { "/{lang}/flight-confirmation",
			"/{lang}/flight-insurance/confirm-policy" })
	@ResponseBody
	public String flightConfirmation(
			HttpServletRequest request,
			@ModelAttribute("confirmationData") PlanDetailsForm planDetailsForm,
			BindingResult result, Model model) {
		HttpSession session = request.getSession();

		if (session.getAttribute("token") == null) {
			model.addAttribute("errMsgs", "Session Expired");
			model.addAttribute("action", "/flight-insurance");
			return "fail";
		}
		UserRestURIConstants.setController("Flight");
		request.setAttribute("controller", UserRestURIConstants.getController());

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
			relationOfOtherTraveller = "FE";
		}

		String emailId = request.getParameter("emailAddress");
		request.setAttribute("email", emailId);
		DateApi dateApi = new DateApi();
		JSONObject parameters = new JSONObject();
		parameters.put("planCode", "FlightCare");
		parameters.put("commencementDate",
				dateApi.pickDate(planDetailsForm.getDepartureDate()));
		parameters.put("expiryDate",
				dateApi.pickDate(planDetailsForm.getReturnDate()));
		JSONArray insured = new JSONArray();

		String langSelected = UserRestURIConstants.getLanaguage(request);

		for (int inx = 0; inx < planDetailsForm.getTotalAdultTraveller(); inx++) {

			JSONObject beneficiary = new JSONObject();
			JSONObject adult = new JSONObject();
			adult.put("name", planDetailsForm.getAdultName()[inx]);
			adult.put("ageRange", planDetailsForm.getAdultAgeRange()[inx]);
			adult.put("hkId", planDetailsForm.getAdultHKID()[inx]);
			/* adult.put("passport", "1234" + inx); */
			adult.put("passport", "");
			if (inx != 0) {// For other travelers skip first one

				if (planDetailsForm.getPlanSelected().equals("personal"))
					adult.put("relationship", "FE"); // adult - should be friend
														// for personal plan
				else
					adult.put("relationship", "SP"); // adult - should be spouse
														// for family plan

				if (planDetailsForm.getAdultBenificiaryFullName().length > 0) {
					if (!planDetailsForm.getAdultBenificiaryFullName()[inx]
							.isEmpty()
							&& INSURED_RELATIONSHIP_SELF
									.compareToIgnoreCase(planDetailsForm
											.getAdultBeneficiary()[inx]) != 0) {// If
																				// have
																				// beneficiary
						beneficiary
								.put("name", planDetailsForm
										.getAdultBenificiaryFullName()[inx]);
						beneficiary.put("hkId",
								planDetailsForm.getAdultBenificiaryHkid()[inx]);
						beneficiary.put("passport", "");
						beneficiary.put("relationship",
								planDetailsForm.getAdultBeneficiary()[inx]); // input
						adult.put("beneficiary", beneficiary);
					} else {// If don't have beneficiary then
						beneficiary.put("name",
								planDetailsForm.getAdultName()[inx]);
						beneficiary.put("hkId",
								planDetailsForm.getAdultHKID()[inx]);
						/* beneficiary.put("passport", "3451" + inx); */
						beneficiary.put("passport", "");
						beneficiary.put("relationship",
								planDetailsForm.getAdultBeneficiary()[inx]); // input
						adult.put("beneficiary", beneficiary);
					}
				} else {// If don't have beneficiary then

					beneficiary
							.put("name", planDetailsForm.getAdultName()[inx]);
					beneficiary
							.put("hkId", planDetailsForm.getAdultHKID()[inx]);
					beneficiary.put("passport", "");
					beneficiary.put("relationship",
							planDetailsForm.getAdultBeneficiary()[inx]); // input
					adult.put("beneficiary", beneficiary);

					// clear bene info if bene relationship is SE
					planDetailsForm.getAdultBenificiaryFullName()[inx] = "";
					planDetailsForm.getAdultBenificiaryHkid()[inx] = "";
				}
			} else {// This is for Myself - with & wothout the beneficiary
				adult.put("relationship", "SE"); // adult, should be self for
													// 1st insured
				if (planDetailsForm.getAdultBenificiaryFullName().length > 0) {
					if (!planDetailsForm.getAdultBenificiaryFullName()[inx]
							.isEmpty()
							&& INSURED_RELATIONSHIP_SELF
									.compareToIgnoreCase(planDetailsForm
											.getAdultBeneficiary()[inx]) != 0) {// If
																				// have
																				// beneficiary
						beneficiary
								.put("name", planDetailsForm
										.getAdultBenificiaryFullName()[inx]);
						beneficiary.put("hkId",
								planDetailsForm.getAdultBenificiaryHkid()[inx]);
						beneficiary.put("passport", "");
						beneficiary.put("relationship",
								planDetailsForm.getAdultBeneficiary()[inx]); // input
						adult.put("beneficiary", beneficiary);
					} else {// If don't have beneficiary then
						beneficiary.put("name",
								planDetailsForm.getAdultName()[inx]);
						beneficiary.put("hkId",
								planDetailsForm.getAdultHKID()[inx]);
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
							.put("name", planDetailsForm.getAdultName()[inx]);
					beneficiary
							.put("hkId", planDetailsForm.getAdultHKID()[inx]);
					beneficiary.put("passport", "");
					beneficiary.put("relationship",
							planDetailsForm.getAdultBeneficiary()[inx]); // input
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
				child.put("name", planDetailsForm.getChildName()[inx]);
				child.put("ageRange", planDetailsForm.getChildAgeRange()[inx]);
				child.put("hkId", planDetailsForm.getChildHKID()[inx]);
				child.put("passport", "");
				child.put("relationship", "CH"); // child
				if (planDetailsForm.getChildBenificiaryFullName().length > 0) {
					if (!planDetailsForm.getChildBenificiaryFullName()[inx]
							.isEmpty()
							&& INSURED_RELATIONSHIP_SELF
									.compareToIgnoreCase(planDetailsForm
											.getChildBeneficiary()[inx]) != 0) {// If
																				// have
																				// beneficiary
						beneficiary
								.put("name", planDetailsForm
										.getChildBenificiaryFullName()[inx]);
						beneficiary.put("hkId",
								planDetailsForm.getChildBenificiaryHkid()[inx]);
						beneficiary.put("passport", "");
						beneficiary.put("relationship",
								planDetailsForm.getChildBeneficiary()[inx]); // input
						child.put("beneficiary", beneficiary);
					} else {// If don't have beneficiary
						beneficiary.put("name",
								planDetailsForm.getChildName()[inx]);
						beneficiary.put("hkId",
								planDetailsForm.getChildHKID()[inx]);
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
							.put("name", planDetailsForm.getChildName()[inx]);
					beneficiary
							.put("hkId", planDetailsForm.getChildHKID()[inx]);
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
				other.put("name", planDetailsForm.getOtherName()[inx]);
				other.put("ageRange", planDetailsForm.getOtherAgeRange()[inx]);
				other.put("hkId", planDetailsForm.getOtherHKID()[inx]);
				other.put("passport", "");
				other.put("relationship", "FE"); // other, should be friend

				JSONObject beneficiary = new JSONObject();

				if (planDetailsForm.getOtherBenificiaryFullName().length > 0) {
					if (!planDetailsForm.getOtherBenificiaryFullName()[inx]
							.isEmpty()
							&& INSURED_RELATIONSHIP_SELF
									.compareToIgnoreCase(planDetailsForm
											.getOtherBeneficiary()[inx]) != 0) {
						beneficiary
								.put("name", planDetailsForm
										.getOtherBenificiaryFullName()[inx]);
						beneficiary.put("hkId",
								planDetailsForm.getOtherBenificiaryHkid()[inx]);
						beneficiary.put("passport", "");
						beneficiary.put("relationship",
								planDetailsForm.getOtherBeneficiary()[inx]); // input
						other.put("beneficiary", beneficiary);
					} else {// If don't have beneficiary
						beneficiary.put("name",
								planDetailsForm.getOtherName()[inx]);
						beneficiary.put("hkId",
								planDetailsForm.getOtherHKID()[inx]);
						beneficiary.put("passport", "");
						beneficiary.put("relationship",
								planDetailsForm.getOtherBeneficiary()[inx]); // input
						other.put("beneficiary", beneficiary);

						// clear bene info if bene relationship is SE
						planDetailsForm.getOtherBenificiaryFullName()[inx] = "";
						planDetailsForm.getOtherBenificiaryHkid()[inx] = "";
					}
				} else {// If don't have beneficiary
					beneficiary
							.put("name", planDetailsForm.getOtherName()[inx]);
					beneficiary
							.put("hkId", planDetailsForm.getOtherHKID()[inx]);
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
					relationships = new String[planDetailsForm
							.getTotalOtherTraveller()];
				}
				String[] beneRelationships = planDetailsForm
						.getOtherBeneRelationDesc();
				if (beneRelationships == null) {
					// not found in ModelAttribute
					beneRelationships = new String[planDetailsForm
							.getTotalOtherTraveller()];
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

		JSONObject applicantJsonObj = new JSONObject();
		applicantJsonObj.put("name", request.getParameter("fullName"));
		applicantJsonObj.put("gender", "M");
		applicantJsonObj.put("hkId", request.getParameter("hkid"));
		applicantJsonObj.put("dob", "");
		applicantJsonObj.put("mobileNo", request.getParameter("mobileNo"));
		applicantJsonObj.put("optIn1", planDetailsForm.getCheckbox1());
		applicantJsonObj.put("optIn2", planDetailsForm.getCheckbox2());
		applicantJsonObj.put("email", request.getParameter("emailAddress"));

		request.setAttribute("fullName", request.getParameter("fullName"));
		request.setAttribute("hkid", request.getParameter("hkid"));
		request.setAttribute("mobileNo", request.getParameter("mobileNo"));
		request.setAttribute("emailAddress",
				request.getParameter("emailAddress"));

		parameters.put("applicant", applicantJsonObj);

		JSONObject addressJsonObj = new JSONObject();
		// addressJsonObj.put("room", "");
		// addressJsonObj.put("floor", "");

		// parameters.put("address", addressJsonObj);

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
		System.out.println("Create Flight  header" + header);
		System.out.println("Create Flight parameters" + parameters);

		JSONObject responsObject = restService.consumeApi(HttpMethod.PUT,
				UserRestURIConstants.CREATEFLIGHTPOLICY, header, parameters);
		System.out.println("createFilghr response" + responsObject);

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
			System.out.println("Email address"
					+ request.getParameter("emailAddress"));

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
			return "success";
		} else {
			model.addAttribute("errMsgs", responsObject.get("errMsgs")
					.toString());
			model.addAttribute("action", "/flight-insurance");
			return responsObject.get("errMsgs")
					.toString();
		}
	}

	@SuppressWarnings("deprecation")
	@RequestMapping(value = { "/{lang}/flight-confrimation-page", "/{lang}/flight-insurance/confirmation" })
	public ModelAndView flightConfrimationPage(
			Model model,
			HttpServletRequest request,
			@ModelAttribute("createFlightPolicy") CreateFlightPolicy createFlightPolicy) {
		HttpSession session = request.getSession();

		if (session.getAttribute("token") == null) {
			model.addAttribute("errMsgs", "Session Expired");
			model.addAttribute("action", "/flight-insurance");
			return new ModelAndView("/flight-insurance/user-details");
		}
		UserRestURIConstants.setController("Flight");
		request.setAttribute("controller", UserRestURIConstants.getController());
		String upgradeReferralCode = "FLTUGD";

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
					return flight(request, model);

				}
			}

			/* Calculate total Days */

			Date dateD1 = new Date(createFlightPolicy.getDepartureDate());
			Date dateD2 = new Date(createFlightPolicy.getReturnDate());
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
				model.addAttribute("quoteDetails", quoteDetails);
				model.addAttribute("createFlightPolicy", createFlightPolicy);

				request.setAttribute("fullName",
						request.getParameter("fullName"));
				request.setAttribute("hkid", request.getParameter("hkid"));
				request.setAttribute("mobileNo",
						request.getParameter("mobileNo"));
				request.setAttribute("emailAddress",
						request.getParameter("emailAddress"));

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
		session.setAttribute("referralCode",
				StringHelper.emptyIfNull(upgradeReferralCode));
		return new ModelAndView(UserRestURIConstants.getSitePath(request)
				+ "flight/flight-confirmation");
	}

	@RequestMapping(value = "/{lang}/flight-upgrade-travel-summary")
	public String flightToTravelUpgrade(Model model,
			HttpServletRequest request,
			@ModelAttribute("travelQuote") CreateFlightPolicy createFlightPolicy) {

		UserRestURIConstants.setController("Travel");
		request.setAttribute("controller", UserRestURIConstants.getController());
		String selectPlanName = request.getParameter("planName");
		HttpSession session = request.getSession();
		JSONObject parameters = new JSONObject();
		if (session.getAttribute("FlightResponseFrTrvl") != null) {
			parameters = (JSONObject) session
					.getAttribute("FlightResponseFrTrvl");
			parameters.put("planCode", "A");
		}
		PlanDetailsForm plandetailsForm = new PlanDetailsForm();
		if (session.getAttribute("FlightObjectFrTrvl") != null) {
			plandetailsForm = (PlanDetailsForm) session
					.getAttribute("FlightObjectFrTrvl");
			for (int inx = 0; inx < plandetailsForm.getTotalAdultTraveller(); inx++) {
				plandetailsForm.setAdultAgeRangeName(WebServiceUtils
						.getAgeRangeNames(plandetailsForm.getAdultAgeRange(),
								UserRestURIConstants.getLanaguage(request)));
			}
			for (int inx = 0; inx < plandetailsForm.getTotalChildTraveller(); inx++) {
				plandetailsForm.setChildAgeRangeName(WebServiceUtils
						.getAgeRangeNames(plandetailsForm.getChildAgeRange(),
								UserRestURIConstants.getLanaguage(request)));
			}
			for (int inx = 0; inx < plandetailsForm.getTotalOtherTraveller(); inx++) {

			}

		}

		HashMap<String, String> header = new HashMap<String, String>(
				COMMON_HEADERS);
		header.put("userName", (String) session.getAttribute("username"));
		header.put("token", (String) session.getAttribute("token"));
		header.put("language", WebServiceUtils
				.transformLanaguage(UserRestURIConstants.getLanaguage(request)));
		String referralCode = (String) session.getAttribute("referralCode");
		parameters.put("referralCode", referralCode);
		model.addAttribute("selectPlanName", createFlightPolicy.getPlanCode());
		System.out.println("TRAVEL_CREATE_POLICY Parameters" + parameters);

		JSONObject responsObject = restService.consumeApi(HttpMethod.PUT,
				UserRestURIConstants.TRAVEL_CREATE_POLICY, header, parameters);

		System.out.println("TRAVEL_CREATE_POLICY Response" + responsObject);

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
			System.out.println("Header Object for Confirm"
					+ confirmPolicyParameter);
			JSONObject jsonResponse = restService.consumeApi(HttpMethod.POST,
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
			session.setAttribute("transactionDate",
					createPolicy.getTransactionDate());
			session.setAttribute("finalizeReferenceNo", finalizeReferenceNo);
			session.setAttribute("transNo", createPolicy.getTransactionNo());
			model.addAttribute("selectPlanName", selectPlanName);
			/* System.out.println("Session Id" + request.getSession().getId()); */
		} else {
			return UserRestURIConstants.getSitePath(request) + "travel/travel";
		}

		String dueAmount = request.getParameter("selectedAmountDue");

		String applicantFullName = request.getParameter("fullName");
		String applicantHKID = request.getParameter("hkid");
		String applicantMobNo = request.getParameter("mobileNo");
		String emailAddress = request.getParameter("emailAddress");
		String totalTravallingDays = request.getParameter("days");
		System.out.println("inside Controller fro prepare Summa");

		TravelQuoteBean travelBean = new TravelQuoteBean();
		travelBean.setTrLeavingDate(parameters.get("commencementDate")
				.toString());
		travelBean.setTrBackDate(parameters.get("expiryDate").toString());
		travelBean.setTotalTraveller(createFlightPolicy.getTravellerCount());
		/*
		 * System.out .println(
		 * "===========>+>+>+>+>+>+.=...............>>>>>>+=====>>>>>>>>>>>>>>>>>>>>>+"
		 * + dueAmount);
		 */

		String path = request.getRequestURL().toString();
		UserDetails userDetails = new UserDetails();
		userDetails.setFullName(applicantFullName);
		userDetails.setHkid(applicantHKID);
		userDetails.setMobileNo(applicantMobNo);
		userDetails.setEmailAddress(emailAddress);
		travelBean.setTotalTraveller(plandetailsForm.getTotalAdultTraveller()
				+ plandetailsForm.getTotalChildTraveller()
				+ plandetailsForm.getTotalOtherTraveller()
				+ plandetailsForm.getTotalOtherTraveller());
		model.addAttribute("dueAmount", dueAmount);
		model.addAttribute("totalTravallingDays", totalTravallingDays);
		model.addAttribute("userDetails", userDetails);
		model.addAttribute("travelBean", travelBean);
		model.addAttribute("planDetailsForm", plandetailsForm);
		model.addAttribute("path", path.replace(
				"flight-upgrade-travel-summary", "travel-confirmation"));
		model.addAttribute("failurePath",
				path.replace("flight-upgrade-travel-summary", "failure"));
		String pageTitle = WebServiceUtils.getPageTitle(
				"page.travelPlanSummary",
				UserRestURIConstants.getLanaguage(request));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle(
				"meta.travelPlanSummary",
				UserRestURIConstants.getLanaguage(request));
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
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

}
