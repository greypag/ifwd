package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.util.Date;
import java.util.HashMap;
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
import com.ifwd.fwdhk.util.DateApi;
import com.ifwd.fwdhk.utils.services.SendEmailDao;

@Controller
@SuppressWarnings("unchecked")
public class FlightController {

	@Autowired
	RestServiceDao restService;

	@Autowired
	SendEmailDao sendEmail;
	
	

	// @Link(label="Flight", family="FlightController", parent = "" )
	@RequestMapping(value = "/flight")
	public String flight(HttpServletRequest request) {
		UserRestURIConstants.setController("Flight");
		request.setAttribute("controller", UserRestURIConstants.getController());
		return UserRestURIConstants.checkLangSetPage(request)+ "flight/flight";
	}
	
	@RequestMapping(value = "/changeLang")
	public ModelAndView changeLang(HttpServletRequest request, @RequestParam String selectLang, @RequestParam String action) {
		HttpSession session = request.getSession();
		String viewName = "";
		if(action.equals("/flight") || action.equals("/travel") || action.equals("/homecare") || action.equals("/indexPage")|| action.equals("/home")){
			if ("CN".equals(selectLang)){
				session.setAttribute("language", selectLang );
				viewName = action.replace("/", "");
				return new ModelAndView("redirect:" + viewName);
			} else{
				session.setAttribute("language", selectLang);
				viewName = action.replace("/", "");
				return new ModelAndView("redirect:" + viewName);
			}
		} else{
			return new ModelAndView("../index");
		}
	}
	
	// @Link(label="Flight Plan", family="FlightController", parent = "Flight" )
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/getFlightDate")
	public ModelAndView getDate(HttpServletRequest request,
			@ModelAttribute("planBind") PlanDetails planDetails,
			BindingResult result, Model model) throws MalformedURLException,
			URISyntaxException {

		UserRestURIConstants.setController("Flight");
		request.setAttribute("controller", UserRestURIConstants.getController());

		HttpSession session = request.getSession();
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

			System.out.println("Flight totalOtherTraveller "
					+ session.getAttribute("totalOtherTraveller"));
		}

		String userReferralCode = (String) request.getSession().getAttribute(
				"referralCode");

		int otherCount = 0, childCount = 0, adultCount = 0;
		boolean spouseCover = false, selfCover = false;;

		if(planDetails.getPlanSelected().equals("personal")){
			selfCover = true;
			otherCount = planDetails.getTravellerCount();
			planDetails.setTotalChildTraveller(0);
			planDetails.setTotalAdultTraveller(0);
			planDetails.setTotalOtherTraveller(0);
			
		}else if(planDetails.getPlanSelected().equals("family")){
			spouseCover = true;
			selfCover = true;
			planDetails.setTravellerCount(0);
			childCount = planDetails.getTotalChildTraveller();
			adultCount = planDetails.getTotalAdultTraveller();
			otherCount = planDetails.getTotalOtherTraveller() + adultCount;			
		} 

		String base = UserRestURIConstants.GETFLIGHTQUOTE
				+ "?planCode=FlightCare" + "&selfCover=" + selfCover
				+ "&spouseCover="+ spouseCover +"&childInput=" + childCount + "&otherInput="
				+ (otherCount-1) + "&commencementDate=" + commencementDate
				+ "&expiryDate=" + expiryDate + "&referralCode="
				+ userReferralCode;

		System.out.println("Fight Quote user " + base);

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

		HashMap<String, String> header = new HashMap<String, String>(
				COMMON_HEADERS);
		header.put("token", token);
		header.put("userName", username);
		JSONObject jsonObject = restService.consumeApi(HttpMethod.GET, base,
				header, null);
		System.out.println(jsonObject);

		if (jsonObject.get("errMsgs") == null & jsonObject != null) {
			jsonObject.get("referralCode");
			jsonObject.get("referralName");
			jsonObject.get("priceInfoA");
			JSONObject jsonPriceInfoA = new JSONObject();
			jsonPriceInfoA = (JSONObject) jsonObject.get("priceInfoA");

			flightQuoteDetails.setGrossPremium(checkJsonObjNull(jsonPriceInfoA,
					"grossPremium"));
			flightQuoteDetails.setDiscountPercentage(checkJsonObjNull(
					jsonPriceInfoA, "discountPercentage"));
			flightQuoteDetails.setDiscountAmount(checkJsonObjNull(
					jsonPriceInfoA, "discountAmount"));
			flightQuoteDetails.setTotalNetPremium(checkJsonObjNull(
					jsonPriceInfoA, "totalNetPremium"));
			flightQuoteDetails.setToalDue(checkJsonObjNull(jsonPriceInfoA,
					"totalDue"));
			planDetails.setFlightQuoteDetails(flightQuoteDetails);
			model.addAttribute(planDetails);
			model.addAttribute(flightQuoteDetails);
			return new ModelAndView(UserRestURIConstants.checkLangSetPage(request)+"flight/flight-plan");

		}

		flightQuoteDetails.setDiscountAmount("Blank");
		flightQuoteDetails.setDiscountPercentage("");
		flightQuoteDetails.setGrossPremium("");
		flightQuoteDetails.setToalDue("");
		flightQuoteDetails.setTotalNetPremium("");
		planDetails.setFlightQuoteDetails(flightQuoteDetails);
		model.addAttribute(planDetails);
		model.addAttribute(flightQuoteDetails);
		return new ModelAndView(UserRestURIConstants.checkLangSetPage(request)+"flight/flight-plan");
	}


	// @Link(label="Flight Plan Detail", family="FlightController", parent =
	// "Flight Plan" )
	@RequestMapping(value = "/flight-plan-details", method = RequestMethod.POST)
	public String flightPlanDetails(HttpServletRequest request,
			@ModelAttribute("flightQuoteDetails") PlanDetails planDetails,
			BindingResult result, Model model) {
		UserRestURIConstants.setController("Flight");
		request.setAttribute("controller", UserRestURIConstants.getController());

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
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,
				Url, header, null);

		if (responseJsonObj.get("errMsgs") == null) {
			JSONArray jsonAgeTypeArray = (JSONArray) responseJsonObj
					.get("optionItemDesc");
			/* JSONObject jsonObjectAgeType = null; */
			System.out.println(" jsonAgeTypeArray ====>>>>>>"
					+ jsonAgeTypeArray);
			Map<String, String> mapAgeType = new HashMap<String, String>();
			for (int i = 0; i < jsonAgeTypeArray.size(); i++) {
				JSONObject obj = (JSONObject) jsonAgeTypeArray.get(i);
				mapAgeType.put(checkJsonObjNull(obj, "itemCode"),
						checkJsonObjNull(obj, "itemDesc"));
			}
			model.addAttribute("mapAgeType", mapAgeType);

			/*
			 * API Call for get Bene Relationship
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
					JSONObject obj = (JSONObject) jsonRelationshipCode.get(i);
					mapRelationshipCode.put(checkJsonObjNull(obj, "itemCode"),
							checkJsonObjNull(obj, "itemDesc"));
				}
				model.addAttribute("mapRelationshipCode", mapRelationshipCode);

			}
		}

		UserDetails userDetails = (UserDetails) request.getSession()
				.getAttribute("userDetails");
		if (userDetails != null) {
			model.addAttribute(userDetails);
		}

		model.addAttribute("planDetailsForm", planDetails);
		String returnUrl = UserRestURIConstants.checkLangSetPage(request)+"flight/flight-plan-details";
		System.out.println("returnUrl " + returnUrl);
		return returnUrl;
	}

	@RequestMapping(value = "/flight-confirmation")
	@ResponseBody
	public String flightConfirmation(
			HttpServletRequest request,
			@ModelAttribute("confirmationData") PlanDetailsForm planDetailsForm,
			BindingResult result, Model model) {

		UserRestURIConstants.setController("Flight");
		request.setAttribute("controller", UserRestURIConstants.getController());

		HttpSession session = request.getSession();

		String relationOfSelfTraveller = "", relationOfAdultTraveller = "";
		String relationOfChildTraveller = "", relationOfOtherTraveller = "";

		if(planDetailsForm.getPlanSelected().equals("personal")){
			relationOfSelfTraveller = "SE";
			relationOfAdultTraveller = "FE";
		}else if(planDetailsForm.getPlanSelected().equals("family")){
			relationOfSelfTraveller = "SE";
			relationOfAdultTraveller = "SP";
			relationOfChildTraveller = "CH";
			relationOfOtherTraveller = "OT";
		}


		String emailId = request.getParameter("emailAddress");
		request.setAttribute("email", emailId);
		DateApi dateApi = new DateApi();
		JSONObject parameters = new JSONObject();
		parameters.put("planCode", "FlightCare");
		parameters.put("commencementDate", dateApi.pickDate(planDetailsForm.getDepartureDate()));
		parameters.put("expiryDate", dateApi.pickDate(planDetailsForm.getReturnDate()));
		JSONArray insured = new JSONArray();

		for (int inx = 0; inx < planDetailsForm.getTotalAdultTraveller(); inx++) {

			JSONObject beneficiary = new JSONObject();
			JSONObject adult = new JSONObject();
			adult.put("name", planDetailsForm.getAdultName()[inx]);
			adult.put("ageRange", planDetailsForm.getAdultAgeRange()[inx]);
			adult.put("hkId", planDetailsForm.getAdultHKID()[inx]);
			/*adult.put("passport", "1234" + inx);*/
			adult.put("passport", "");
			if(inx != 0 ){// For other travelers skip first one
				adult.put("relationship", relationOfAdultTraveller);
				if(planDetailsForm.getAdultBenificiaryFullName().length>0){
					if (!planDetailsForm.getAdultBenificiaryFullName()[inx].isEmpty()) {//If have beneficiary
						beneficiary.put("name",
								planDetailsForm.getAdultBenificiaryFullName()[inx]);
						beneficiary.put("hkId",
								planDetailsForm.getAdultBenificiaryHkid()[inx]);
						/*beneficiary.put("passport", "2345" + inx);*/
						beneficiary.put("passport", "");
						beneficiary.put("relationship", planDetailsForm.getAdultBeneficiary()[inx]);
						adult.put("beneficiary", beneficiary);
					}else{//If don't have beneficiary then
						beneficiary.put("name", planDetailsForm.getAdultName()[inx]);
						beneficiary.put("hkId", planDetailsForm.getAdultHKID()[inx]);
						/*beneficiary.put("passport", "3451" + inx);*/
						beneficiary.put("passport", "");
						beneficiary.put("relationship", planDetailsForm.getAdultBeneficiary()[inx]);
						adult.put("beneficiary", beneficiary);
					}
				} else{//If don't have beneficiary then
					beneficiary.put("name", planDetailsForm.getAdultName()[inx]);
					beneficiary.put("hkId", planDetailsForm.getAdultHKID()[inx]);
					/*beneficiary.put("passport", "3451" + inx);*/
					beneficiary.put("passport", "");
					beneficiary.put("relationship", planDetailsForm.getAdultBeneficiary()[inx]);
					adult.put("beneficiary", beneficiary);
				}
			} else {// This is for Myself - with & wothout the beneficiary  
				adult.put("relationship", relationOfSelfTraveller); 
				if(planDetailsForm.getAdultBenificiaryFullName().length > 0){
					if (!planDetailsForm.getAdultBenificiaryFullName()[inx].isEmpty()) {//If have beneficiary
						beneficiary.put("name", planDetailsForm.getAdultBenificiaryFullName()[inx]);
						beneficiary.put("hkId", planDetailsForm.getAdultBenificiaryHkid()[inx]);
						/*beneficiary.put("passport", "3451" + inx);*/
						beneficiary.put("passport", "");
						beneficiary.put("relationship", planDetailsForm.getAdultBeneficiary()[inx]);
						adult.put("beneficiary", beneficiary);
					}else{//If don't have beneficiary then
						beneficiary.put("name", planDetailsForm.getAdultName()[inx]);
						beneficiary.put("hkId", planDetailsForm.getAdultHKID()[inx]);
						/*beneficiary.put("passport", "3451" + inx);*/
						beneficiary.put("passport", "");
						beneficiary.put("relationship", relationOfAdultTraveller);
						adult.put("beneficiary", beneficiary);
					}
				} else {//If don't have beneficiary then
					beneficiary.put("name", planDetailsForm.getAdultName()[inx]);
					beneficiary.put("hkId", planDetailsForm.getAdultHKID()[inx]);
					/*beneficiary.put("passport", "3451" + inx);*/
					beneficiary.put("passport", "");
					beneficiary.put("relationship", relationOfAdultTraveller);
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
				child.put("hkId", planDetailsForm.getChildHKID()[inx]);
				/*child.put("passport", "5432" + inx);*/
				child.put("passport", "");			
				child.put("relationship", relationOfChildTraveller);

				/* String strings = planDetailsForm.getAdultBeneficiary()[inx]; */
				/* JSONObject beneficiary = new JSONObject(); */
				if(planDetailsForm.getChildBenificiaryFullName().length>0){
					if (!planDetailsForm.getChildBenificiaryFullName()[inx].isEmpty()) {//If have beneficiary
						beneficiary.put("name",
								planDetailsForm.getChildBenificiaryFullName()[inx]);
						beneficiary.put("hkId",
								planDetailsForm.getChildBenificiaryHkid()[inx]);
						/*beneficiary.put("passport", "2345" + inx);*/
						beneficiary.put("passport", "");
						beneficiary.put("relationship", 
								planDetailsForm.getChildBeneficiary()[inx]);
						child.put("beneficiary", beneficiary);
					} else {//If don't have beneficiary
						beneficiary.put("name", planDetailsForm.getChildName()[inx]);
						beneficiary.put("hkId", planDetailsForm.getChildHKID()[inx]);
						/*beneficiary.put("passport", "9876" + inx);*/
						beneficiary.put("passport", "");
						beneficiary.put("relationship", planDetailsForm.getChildBeneficiary()[inx]);
						child.put("beneficiary", beneficiary);
					}} else{//If don't have beneficiary
						beneficiary.put("name", planDetailsForm.getChildName()[inx]);
						beneficiary.put("hkId", planDetailsForm.getChildHKID()[inx]);
						/*beneficiary.put("passport", "9876" + inx);*/
						beneficiary.put("passport", "");
						beneficiary.put("relationship", planDetailsForm.getChildBeneficiary()[inx]);
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
				other.put("hkId", planDetailsForm.getOtherHKID()[inx]);
				/*other.put("passport", "9123" + inx);*/
				other.put("passport", "");
				other.put("relationship", relationOfOtherTraveller);

				JSONObject beneficiary = new JSONObject();

				/* String strings = planDetailsForm.getAdultBeneficiary()[inx]; */
				/* JSONObject beneficiary = new JSONObject(); */
				if(planDetailsForm.getOtherBenificiaryFullName().length > 0){
					if (!planDetailsForm.getOtherBenificiaryFullName()[inx].isEmpty()) {
						beneficiary.put("name",
								planDetailsForm.getOtherBenificiaryFullName()[inx]);
						beneficiary.put("hkId",
								planDetailsForm.getOtherBenificiaryHkid()[inx]);
						/*beneficiary.put("passport", "9234" + inx);*/
						beneficiary.put("passport", "");
						beneficiary.put("relationship", planDetailsForm.getOtherBeneficiary()[inx]);
						other.put("beneficiary", beneficiary);
					} else {//If don't have beneficiary
						beneficiary.put("name", planDetailsForm.getOtherName()[inx]);
						beneficiary.put("hkId", planDetailsForm.getOtherHKID()[inx]);
						/*beneficiary.put("passport", "8912" + inx);*/
						beneficiary.put("passport", "");
						beneficiary.put("relationship", planDetailsForm.getOtherBeneficiary()[inx]);
						other.put("beneficiary", beneficiary);
					}
				} else{//If don't have beneficiary
					beneficiary.put("name", planDetailsForm.getOtherName()[inx]);
					beneficiary.put("hkId", planDetailsForm.getOtherHKID()[inx]);
					/*beneficiary.put("passport", "8912" + inx);*/
					beneficiary.put("passport", "");
					beneficiary.put("relationship", planDetailsForm.getOtherBeneficiary()[inx]);
					other.put("beneficiary", beneficiary);
				}
				insured.add(other);
			}
		}

		parameters.put("insured", insured);

		parameters.put("referralCode", "");

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
		request.setAttribute("emailAddress", request.getParameter("emailAddress"));

		parameters.put("applicant", applicantJsonObj);

		JSONObject addressJsonObj = new JSONObject();
		addressJsonObj.put("room", "");
		addressJsonObj.put("floor", "");

		parameters.put("address", addressJsonObj);

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
		System.out.println("Create Flight  header" + header);
		System.out.println("Create Flight parameters" + parameters);

		JSONObject responsObject = restService.consumeApi(HttpMethod.PUT,
				UserRestURIConstants.CREATEFLIGHTPOLICY, header, parameters);
		System.out.println("createFilghr response" + responsObject);

		/*
		 * "currCode":"344","referenceNo":"74F000000000011","merchantId":"88116468"
		 * ,
		 * "referralCode":null,"policyNo":"74F000011","lang":"","errMsgs":null,
		 * "planCode":null, "paymentGateway":
		 * "https:\/\/test.paydollar.com\/b2cDemo\/eng\/dPayment\/payComp.jsp",
		 * "paymentType":"N"
		 */
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

			sendEmail.sendEmail(emailId, checkJsonObjNull(responsObject,
					"referenceNo"), header);

			request.getSession().setAttribute("setReferenceNoForConfirmation", checkJsonObjNull(responsObject,
					"referenceNo"));
			request.getSession().setAttribute("setEmailForConfirmation", request.getParameter("emailAddress"));
			model.addAttribute(createFlightPolicy);
			model.addAttribute("planDetailsForm", planDetailsForm);

			/*return "flight/flight-confirmation";*/
			return "success";
		}else{
			String errorMessage = "";
			errorMessage = responsObject.get("errMsgs").toString();
			/*model.addAttribute("errorMessage", errorMessage.replace("[", "").replace("]", ""));
			request.setAttribute("planDetails", planDetailsForm);
			model.addAttribute("planDetailsForm",planDetailsForm);
			return "flight/flight-plan-details";*/
			return errorMessage.replace("[", "").replace("]", "");
		}
	}

	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/flight-confrimation-page")
	public String flightConfrimationPage(Model model, HttpServletRequest request, 
			@ModelAttribute("createFlightPolicy") CreateFlightPolicy createFlightPolicy) {

		UserRestURIConstants.setController("Flight");
		request.setAttribute("controller", UserRestURIConstants.getController());

		HttpSession session = request.getSession();
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

			/* Calculate total Days */

			Date dateD1 = new Date(createFlightPolicy.getDepartureDate());
			Date dateD2 = new Date(createFlightPolicy.getReturnDate());
			LocalDate commencementDate = new LocalDate(dateD1);
			LocalDate expiryDate = new LocalDate(dateD2);
			days = Days.daysBetween(commencementDate, expiryDate).getDays();
			createFlightPolicy.setDays(days + 1);

			String userReferralCode = "";
			if(request.getSession().getAttribute(
					"referralCode")!=null){
				userReferralCode = (String) request.getSession().getAttribute(
						"referralCode");
			}

			int otherCount = 0, childCount = 0, adultCount = 0;
			boolean spouseCover = false, selfCover = false;

			if(createFlightPolicy.getPlanSelected().equals("personal")){
				selfCover = true;
				otherCount += (createFlightPolicy.getTravellerCount() + createFlightPolicy.getTotalAdultTraveller());
			}else{
				spouseCover = true;
				selfCover = true;
				childCount = createFlightPolicy.getTotalChildTraveller();
				adultCount = createFlightPolicy.getTotalAdultTraveller();
				otherCount = createFlightPolicy.getTotalOtherTraveller() + adultCount;			
			} 


			String Url = UserRestURIConstants.TRAVEL_GET_QUOTE
					+ "?planCode=A" + "&selfCover=" + selfCover
					+ "&spouseCover="+ spouseCover +"&childInput=" + childCount
					+ "&otherInput=" + otherCount
					+ "&commencementDate=" + commencementDate + "&expiryDate="
					+ expiryDate + "&referralCode=" + userReferralCode;

			System.out.println("Travel Quote user " + Url);

			HashMap<String, String> header = new HashMap<String, String>(
					COMMON_HEADERS);
			if (request.getSession().getAttribute("username") != null) {
				header.put("userName", username);
				header.put("token", token);
			}
			JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,
					Url, header, null);

			System.out.println("Get Travel Quotes API " + responseJsonObj);
			if (responseJsonObj.get("errMsgs") == null) {
				QuoteDetails quoteDetails = new QuoteDetails();
				quoteDetails.setPlanSelected(createFlightPolicy.getPlanSelected());
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
				model.addAttribute("createFlightPolicy", createFlightPolicy);
				
				request.setAttribute("fullName", request.getParameter("fullName"));
				request.setAttribute("hkid", request.getParameter("hkid"));
				request.setAttribute("mobileNo", request.getParameter("mobileNo"));
				request.setAttribute("emailAddress", request.getParameter("emailAddress"));
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}

		return UserRestURIConstants.checkLangSetPage(request)+"flight/flight-confirmation";
	}

	@RequestMapping(value = "/flight-upgrade-travel-summary")
	public String flightToTravelUpgrade(Model model, HttpServletRequest request, 
			@ModelAttribute("travelQuote") CreateFlightPolicy createFlightPolicy) {

		UserRestURIConstants.setController("Travel");
		request.setAttribute("controller", UserRestURIConstants.getController());
		
		HttpSession session = request.getSession();
		JSONObject parameters = new JSONObject();
		if(session.getAttribute("FlightResponseFrTrvl")!=null){
			parameters = (JSONObject) session.getAttribute("FlightResponseFrTrvl");
			parameters.put("planCode", "A");
		}
		PlanDetailsForm plandetailsForm = new PlanDetailsForm();
		if(session.getAttribute("FlightObjectFrTrvl")!=null){
			plandetailsForm =  (PlanDetailsForm) session.getAttribute("FlightObjectFrTrvl");
		}
		
		HashMap<String, String> header = new HashMap<String, String>(
				COMMON_HEADERS);
		header.put("userName",
				(String) session.getAttribute("username"));
		header.put("token", (String) session.getAttribute("token"));

		/*
		 * System.out.println("headers=====>>>>>" + header);

		 */
		// Comment for to avoid over load Data
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
			System.out.println("Header Object for Confirm" + confirmPolicyParameter);
			JSONObject jsonResponse = restService.consumeApi(HttpMethod.POST,
					UserRestURIConstants.TRAVEL_CINFIRM_POLICY, header,
					confirmPolicyParameter);
			
			  System.out.println("Response From Confirm Travel Policy " +
			  jsonResponse);
			 

			createPolicy.setSecureHash(checkJsonObjNull(jsonResponse,
					"secureHash"));
			createPolicy.setTransactionNo(checkJsonObjNull(jsonResponse,
					"transactionNumber"));
			createPolicy.setTransactionDate(checkJsonObjNull(jsonResponse,
					"transactionDate"));
			model.addAttribute(createPolicy);

			/*
			 * System.out.println("Traveling Date==================>>" +
			 * createPolicy.getTransactionDate());
			 * System.out.println("Reference Numnber" + referenceNo);
			 */

			session.setAttribute("transactionDate",
					createPolicy.getTransactionDate());
			session.setAttribute("finalizeReferenceNo",
					finalizeReferenceNo);
			session.setAttribute("transNo",
					createPolicy.getTransactionNo());
			/* System.out.println("Session Id" + request.getSession().getId()); */
		}
		
		String dueAmount = request.getParameter("selectedAmountDue");
		String userReferralCode = (String) session.getAttribute(
				"referralCode");
		
		String applicantFullName = request.getParameter("fullName");
		String applicantHKID = request.getParameter("hkid");
		String applicantMobNo = request.getParameter("mobileNo");
		String emailAddress = request.getParameter("emailAddress");
		String totalTravallingDays = request.getParameter("days");
		String totalTravallers = request.getParameter("totalTravallingDays");
		/* System.out.println("applicantHKID=="+applicantHKID); */
		String strChildCount = request.getParameter("totalChildTraveller");
		String strAdultCount = request.getParameter("totalAdultTraveller");
		String strOtherCount = request.getParameter("totalOtherTraveller");

		System.out.println("inside Controller fro prepare Summa");
		
		
		
		TravelQuoteBean travelBean = new TravelQuoteBean();
		travelBean.setTrLeavingDate(parameters.get("commencementDate").toString());
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
		travelBean.setTotalTraveller(plandetailsForm.getTotalAdultTraveller() + 
				plandetailsForm.getTotalChildTraveller() + 
				plandetailsForm.getTotalOtherTraveller() + 
				plandetailsForm.getTotalOtherTraveller());
		model.addAttribute("dueAmount", dueAmount);
		model.addAttribute("totalTravallingDays", totalTravallingDays);
		model.addAttribute("userDetails", userDetails);
		model.addAttribute("travelBean", travelBean);
		model.addAttribute("planDetailsForm", plandetailsForm);
		model.addAttribute("path",
				path.replace("flight-upgrade-travel-summary", "travel-confirmation"));
		model.addAttribute("failurePath",
				path.replace("flight-upgrade-travel-summary", "failure"));
		return UserRestURIConstants.checkLangSetPage(request)+"travel/travel-summary-payment";
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
