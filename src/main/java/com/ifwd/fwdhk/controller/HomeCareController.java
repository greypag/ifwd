package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.io.IOException;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ser.impl.UnknownSerializer;
import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.model.CreatePolicy;
import com.ifwd.fwdhk.model.DistrictBean;
import com.ifwd.fwdhk.model.FinalizePolicy;
import com.ifwd.fwdhk.model.HomeCareDetailsBean;
import com.ifwd.fwdhk.model.HomeCareQuetionaries;
import com.ifwd.fwdhk.model.HomeQuoteBean;
import com.ifwd.fwdhk.model.PlanDetailsForm;
import com.ifwd.fwdhk.model.QuoteDetails;
import com.ifwd.fwdhk.model.TravelQuoteBean;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.services.HomeCareService;
import com.ifwd.fwdhk.services.HomeCareServiceImpl;
import com.ifwd.fwdhk.util.Methods;
import com.ifwd.fwdhk.util.StringHelper;
import com.ifwd.fwdhk.util.WebServiceUtils;
import com.ifwd.fwdhk.utils.services.SendEmailDao;

@Controller
public class HomeCareController {

	@Autowired
	RestServiceDao restService;
	@Autowired
	SendEmailDao sendEmail;

	@RequestMapping(value = {"/{lang}/homecare", "/{lang}/home-insurance", "/{lang}/home-insurance/sharing/"})
	public String getHomeCarePage(@RequestParam(required = false) final String promo, HttpServletRequest request, Model model) {
		
		UserRestURIConstants urc = new UserRestURIConstants(); 
		urc.updateLanguage(request);
		
		UserRestURIConstants.setController("Homecare");
		request.setAttribute("controller", UserRestURIConstants.getController());
		HomeCareService homecareService = new HomeCareServiceImpl();
		HttpSession session = request.getSession();
		String token = null, username = null;
		session.setAttribute("referralCode", StringHelper.emptyIfNull(promo));
		Calendar date = Calendar.getInstance();
		date.setTime(new Date());
		Format f = new SimpleDateFormat("dd-MMMM-yyyy");
		System.out.println(f.format(date.getTime()));
		date.add(Calendar.YEAR, 1);
		System.out.println(f.format(date.getTime()));

		if ((session.getAttribute("token") != null)
				&& (session.getAttribute("username") != null)) {
			token = session.getAttribute("token").toString();
			username = session.getAttribute("username").toString();
		} 
		else {
			restService.consumeLoginApi(request);
			if ((session.getAttribute("token") != null)) {
				token = session.getAttribute("token").toString();
				username = session.getAttribute("username").toString();
			}
		}
		
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		
		List<HomeCareQuetionaries> homeCareQuetionariesList = homecareService.getHomeQuetionaries(token, username, lang);
		if (homeCareQuetionariesList.size() > 0) {
			request.setAttribute("homeCareQuetionariesList", homeCareQuetionariesList);
			model.addAttribute(homeCareQuetionariesList);

			String answer1, answer2;
			answer1 = (String) session.getAttribute("answer1");
			answer2 = (String) session.getAttribute("answer2");

			if (answer1 == null || answer2 == null) {
				// default
				answer1 = "";
				answer2 = "";
			}
			int ctn = 0;
			for (HomeCareQuetionaries homecare : homeCareQuetionariesList) {

				// init
				homecare.setAnswer1Checked("");
				homecare.setAnswer2Checked("");

				if (ctn == 0) {
					if (homecare.getAnswer1().equals(answer1))
						homecare.setAnswer1Checked("checked");
					else
						homecare.setAnswer2Checked("checked");
				} else if (ctn == 1) {
					if (homecare.getAnswer1().equals(answer2))
						homecare.setAnswer1Checked("checked");
					else
						homecare.setAnswer2Checked("checked");
				} else {
					// default
					homecare.setAnswer2Checked("checked");
				}

				ctn = ctn + 1;
			}
			String pageTitle = WebServiceUtils.getPageTitle("page.homeCare", lang);
			String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.homeCare", lang);
			String ogTitle = "";
			String ogType = "";
			String ogUrl = "";
			String ogImage = "";
			String ogDescription = "";
			
			
			if (request.getRequestURI().toString().equals(request.getContextPath() + "/tc/home-insurance/sharing/") ||request.getRequestURI().toString().equals(request.getContextPath() + "/en/home-insurance/sharing/")) 
			{
				ogTitle = WebServiceUtils.getPageTitle("homeCare.sharing.og.title", lang);
				ogType = WebServiceUtils.getPageTitle("homeCare.sharing.og.type", lang);
				ogUrl = WebServiceUtils.getPageTitle("homeCare.sharing.og.url", lang);
				ogImage = WebServiceUtils.getPageTitle("homeCare.sharing.og.image", lang);
				ogDescription = WebServiceUtils.getPageTitle("homeCare.sharing.og.description", lang);
			} 
			else {
				ogTitle = WebServiceUtils.getPageTitle("homeCare.og.title", lang);
				ogType = WebServiceUtils.getPageTitle("homeCare.og.type", lang);
				ogUrl = WebServiceUtils.getPageTitle("homeCare.og.url", lang);
				ogImage = WebServiceUtils.getPageTitle("homeCare.og.image", lang);
				ogDescription = WebServiceUtils.getPageTitle("homeCare.og.description", lang);
			}
			
			
			model.addAttribute("pageTitle", pageTitle);
			model.addAttribute("pageMetaDataDescription",
					pageMetaDataDescription);

			model.addAttribute("ogTitle", ogTitle);
			model.addAttribute("ogType", ogType);
			model.addAttribute("ogUrl", ogUrl);
			model.addAttribute("ogImage", ogImage);
			model.addAttribute("ogDescription", ogDescription);
			
			return UserRestURIConstants.getSitePath(request)
					+ "homecare/homecare";

		} else {
			model.addAttribute("errMsgs", "Question lists cannot be retrieved");
			model.addAttribute("action", "/");
			String dir = UserRestURIConstants.getSitePath(request);
			return "../jsp/" + dir + "/index";

		}

	}

	@RequestMapping(value = {"/{lang}/getHomePlan", "/{lang}/home-insurance/quote"})
	public String getHomeCarePlanage(Model model, HttpServletRequest request) {
		System.out.println("/home-insurance/quote");
		UserRestURIConstants.setController("Homecare");
		request.setAttribute("controller", UserRestURIConstants.getController());
		HomeCareService homecareService = new HomeCareServiceImpl();
		HttpSession session = request.getSession();
		session.removeAttribute("homeCareDetails");
		session.removeAttribute("policyNo");
		// redirect to 1ST step when null
		if (session.getAttribute("token") == null) {
			System.out.println("session null");
			return getHomeCarePage((String)session.getAttribute("referralCode"), request, model);
		}

		String token = session.getAttribute("token").toString();
		String username = session.getAttribute("username").toString();
		String answer1 = request.getParameter("home_situated1");
		String answer2 = request.getParameter("home_situated2");

		if (answer1 == null) {
			answer1 = (String) session.getAttribute("answer1");
			answer2 = (String) session.getAttribute("answer2");
		} else {
			session.setAttribute("answer1", answer1);
			session.setAttribute("answer2", answer2);
		}
		// redirect to 1ST step when null
		if (answer1 == null || answer2 == null) {
			return getHomeCarePage((String)session.getAttribute("referralCode"), request, model);
		}
		
		String userReferralCode = "";

		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		
		HomeQuoteBean planQuote = homecareService.getHomePlan(token, username,
				userReferralCode, answer1, answer2,	lang);
		if (planQuote.getErrormsg().equals("null")) {
		
			model.addAttribute("planQuote", planQuote);
			request.setAttribute("planQuote", planQuote);
			model.addAttribute("answer1", answer1);
			model.addAttribute("answer2", answer2);
			String pageTitle = WebServiceUtils.getPageTitle("page.homeCareQuotation", lang);
			String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.homeCareQuotation",	lang);
			model.addAttribute("pageTitle", pageTitle);
			model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
	
			return UserRestURIConstants.getSitePath(request)
					+ "homecare/homecare-plan";
		} else {
			System.out.println("errMsgs " + planQuote.getErrormsg());
			model.addAttribute("errMsgs", planQuote.getErrormsg());
			
			return getHomeCarePage((String)session.getAttribute("referralCode"), request, model);
		}
	}

	@RequestMapping(value = {"/{lang}/getYourHomeCareDetails", "/{lang}/home-insurance/user-details"})
	public String prepareYoursDetails(
			@ModelAttribute("planQuoteDetails") HomeQuoteBean homeQuoteDetails,
			Model model, HttpServletRequest request) {
		UserRestURIConstants.setController("Homecare");
		request.setAttribute("controller", UserRestURIConstants.getController());
		HttpSession session = request.getSession();

		// redirect to 1ST step when null
		if (session.getAttribute("token") == null) {
			return getHomeCarePage((String)session.getAttribute("referralCode"), request, model);
		}

		String token = session.getAttribute("token").toString();
		String userName = session.getAttribute("username").toString();

		HomeCareService homecareService = new HomeCareServiceImpl();
		try {
			String lang = UserRestURIConstants.getLanaguage(request);
			if (lang.equals("tc"))
				lang = "CN";
			
			List<DistrictBean> districtList = homecareService.getDistrict(userName, token, lang);
			Map<String, String> mapNetFloorArea = homecareService.getNetFloorArea(userName, token, lang);
			request.setAttribute("districtList", districtList);
			
			if (homeQuoteDetails.getTotalDue() != null) 
			{
				session.setAttribute("homeQuoteDetails", homeQuoteDetails);
			} 
			else {
				homeQuoteDetails = (HomeQuoteBean) session.getAttribute("homeQuoteDetails");

				// redirect to 1ST step when null
				if (homeQuoteDetails == null) {
					return getHomeCarePage((String)session.getAttribute("referralCode"), request, model);
				}
			}

			model.addAttribute("homeQuoteDetails", homeQuoteDetails);
			model.addAttribute("districtList", districtList);
			model.addAttribute("mapNetFloorArea", mapNetFloorArea);



		}

		catch (Exception e) {

			e.printStackTrace();

		}
		
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		
		String pageTitle = WebServiceUtils.getPageTitle("page.homeCareUserDetails",	lang);
		String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.homeCareUserDetails", lang);
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);

		return UserRestURIConstants.getSitePath(request)
				+ "homecare/homecare-plan-details";
	}

	@ResponseBody
	@RequestMapping(value = "/applyHomePromoCode")
	public String applyHomePromoCode(Model model, HttpServletRequest request) {
		HomeCareService homecareService = new HomeCareServiceImpl();
		HttpSession session = request.getSession();
		String token = session.getAttribute("token").toString();
		String username = session.getAttribute("username").toString();
		if (session.getAttribute("token") == null) {
			return "fail";
		}
		
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";

		String referralCode = request.getParameter("referralCode");
		String planQuote = homecareService.getHomePlanToString(token, username,
				referralCode, "NO", "NO", lang);
		if (!planQuote.contains("Promotion Code is not valid")) {
			session.setAttribute("referralCode", StringHelper.emptyIfNull(referralCode));
		} else {
			session.setAttribute("referralCode", "");
		}
		return planQuote;
	}

	@RequestMapping(value = {"/{lang}/prepareUserSummaryForHome", "/{lang}/home-insurance/home-summary"})
	public String prepareSummary(
			@ModelAttribute("frmYourDetails") HomeCareDetailsBean homeCareDetails,
			BindingResult result, Model model, HttpServletRequest request) {
		System.out.println("home-insurance/home-summary called ");
		HttpSession session = request.getSession();
		
		
		if (session.getAttribute("token") == null) {
			return getHomeCarePage((String)session.getAttribute("referralCode"), request, model);
		}
		
		UserRestURIConstants.setController("Homecare");
		request.setAttribute("controller", UserRestURIConstants.getController());
		UserDetails userDetails = new UserDetails();

		String passportORhkid = WebServiceUtils.getParameterValue("apphkidandpassport", session, request);
		String hkId = WebServiceUtils.getParameterValue("hkId", session, request);
		String applicantName = WebServiceUtils.getParameterValue("applicantName", session, request);
		String emailAddress = WebServiceUtils.getParameterValue("emailAddress", session, request);
		String mobileNo = WebServiceUtils.getParameterValue("mobileNo", session, request);
		String totalDue = WebServiceUtils.getParameterValue("totalDue", session, request);
		String planCode = WebServiceUtils.getParameterValue("planCode", session, request);
		if (homeCareDetails.getTotalDue() != null) {
			session.setAttribute("homeCareDetails", homeCareDetails);
		} else {
			homeCareDetails = (HomeCareDetailsBean) session.getAttribute("homeCareDetails");
			if (homeCareDetails == null) {
				return getHomeCarePage((String)session.getAttribute("referralCode"), request, model);
			}
		}
		System.out.println("***************passportORhkid********************");
		if (passportORhkid.equalsIgnoreCase("appHkid")) {
			userDetails.setHkid(hkId);
		} else {
			userDetails.setPassport(hkId);
		}
		userDetails.setFullName(applicantName);
		userDetails.setEmailAddress(emailAddress);
		userDetails.setMobileNo(mobileNo);
		String token = session.getAttribute("token").toString();
		String userName = session.getAttribute("username").toString();
		
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		
		HomeCareService homecareService = new HomeCareServiceImpl();
		CreatePolicy createdPolicy = (CreatePolicy) session
				.getAttribute("createdPolicy");
		if (createdPolicy == null) {
			createdPolicy = homecareService.createHomeCarePolicy(userName,
					token, homeCareDetails, userDetails,
					lang, (String)session.getAttribute("referralCode"));
		}
		
		model.addAttribute("createdPolicy", createdPolicy);

		if (createdPolicy.getErrMsgs() == null) {
			CreatePolicy confirm = homecareService.confirmHomeCarePolicy(
					userName, token, createdPolicy.getReferenceNo(),
					lang);

			session.setAttribute("HomeCareReferenceNo",
					createdPolicy.getReferenceNo());
			session.setAttribute("HomeCareTransactionDate",
					confirm.getTransactionDate());
			model.addAttribute("confirm", confirm);
		} else {
			model.addAttribute("errMsgs", createdPolicy.getErrMsgs());
			return "/home-insurance/user-details";
//			return UserRestURIConstants.getSitePath(request)
//					+ "home-insurance/user-details";
		}

		System.out.println("PayType===>" + createdPolicy.getPaymentType());

		System.out.println("Curr Code ID==>" + createdPolicy.getPaymentGateway());
		System.out.println("M ID==>" + createdPolicy.getMerchantId());

		model.addAttribute("totalDue", totalDue);
		model.addAttribute("planCode", planCode);
		model.addAttribute("createdPolicy", createdPolicy);
		model.addAttribute("userDetails", userDetails);
		Calendar date = Calendar.getInstance();
		date.setTime(new Date(homeCareDetails.getEffectiveDate()));
		Format f = new SimpleDateFormat("dd MMMM yyyy");
		date.add(Calendar.YEAR, 1);
		String endDate = f.format(date.getTime());
			
		// get netFloorArea desc
		Map<String, String> netFloorAreas = homecareService.getNetFloorArea(userName, token, lang);
		homeCareDetails.setNetFloorAreaDesc(WebServiceUtils.getNetFloorAreaDesc(netFloorAreas, homeCareDetails.getNetFloorArea()));
		// get district / area desc
		List<DistrictBean> districts = homecareService.getDistrict(userName, token, "EN");
		Map<String, String> areas = homecareService.getArea(userName, token, lang);
		homeCareDetails.setApplicantDistrictDesc(WebServiceUtils.getDistrictDesc(districts, homeCareDetails.getApplicantDistrict()));
		homeCareDetails.setApplicantAreaDesc(WebServiceUtils.getAreaDesc(areas, homeCareDetails.getApplicantArea()));
		
		homeCareDetails.setaDistrictDesc(WebServiceUtils.getDistrictDesc(districts, homeCareDetails.getaDistrict()));
		homeCareDetails.setaAreaDesc(WebServiceUtils.getAreaDesc(areas, homeCareDetails.getaArea()));
		
		
		String path = request.getRequestURL().toString();
		model.addAttribute("effectiveDate", homeCareDetails.getEffectiveDate());
		model.addAttribute("effectiveEndDate", endDate);
		model.addAttribute("homeCareDetails", homeCareDetails);
//		model.addAttribute("path", path.replace("prepareUserSummaryForHome",
//				"homecare-confirmation"));
		model.addAttribute("path",
				path.replace("home-summary", "confirmation"));
		
		model.addAttribute("failurePath", path + "?paymentGatewayFlag=true");

		String paymentGatewayFlag = request.getParameter("paymentGatewayFlag");
		String errorMsg = request.getParameter("errorMsg");
		if (paymentGatewayFlag != null
				&& paymentGatewayFlag.compareToIgnoreCase("true") == 0
				&& errorMsg == null) {
			errorMsg = "Payment failure";
		}
		model.addAttribute("errormsg", errorMsg);
		String pageTitle = WebServiceUtils.getPageTitle(
				"page.homeCarePlanSummary",
				lang);
		String pageMetaDataDescription = WebServiceUtils.getPageTitle(
				"meta.homeCarePlanSummary",
				lang);
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);

		return UserRestURIConstants.getSitePath(request)
				+ "homecare/homecare-summary-payment";
	}

	@RequestMapping(value = "/processHomeCarePayment", method = RequestMethod.POST)
	@ResponseBody
	public String processHomeCarePayment(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		session.setAttribute("HomeCareTransactionNo", request.getParameter("orderRef"));
		
		
		
		try {
			session.setAttribute("HomeCareCreditCardNo", Methods.encryptStr((String)request.getParameter("cardNo")));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		session.setAttribute("HomeCareCardexpiryDate", String.format("%02d", Integer.parseInt(request.getParameter("epMonth"))) + request.getParameter("epYear"));

		session.setAttribute("emailAddress", request.getParameter("emailAddress"));
		System.out.println("cardNo : ");
		System.out.println(request.getParameter("cardNo"));
		System.out.println("emailAddress : ");
		System.out.println(request.getParameter("emailAddress"));
		System.out.println("********************************* Inside Process Payment **********************************************");
		return "success";
	}
	
	

	@RequestMapping(value = {"/{lang}/homecare-confirmation", "/{lang}/home-insurance/confirmation"})
	public String processHomePayment(Model model, HttpServletRequest request) {
		
		UserRestURIConstants.setController("Homecare");
		request.setAttribute("controller", UserRestURIConstants.getController());
		HttpSession session = request.getSession();	
		
		String referenceNo = (String) session.getAttribute("HomeCareReferenceNo");
		String transactionNumber = (String) session.getAttribute("HomeCareTransactionNo");
		String transactionDate = (String) session.getAttribute("HomeCareTransactionDate");
		
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		
		String creditCardNo;
		try {
			creditCardNo = (String)session.getAttribute("HomeCareCreditCardNo");
			
			if (creditCardNo !=null) {
				creditCardNo = Methods.decryptStr((String) session.getAttribute("HomeCareCreditCardNo"));
			} else {
				model.addAttribute("policyNo", StringHelper.emptyIfNull((String)session.getAttribute("policyNo")));
				model.addAttribute("referenceNo", StringHelper.emptyIfNull((String)session.getAttribute("referenceNo")));
				String pageTitle = WebServiceUtils.getPageTitle(
						"page.homeCarePlanConfirmation",
						lang);
				String pageMetaDataDescription = WebServiceUtils.getPageTitle(
						"meta.homeCarePlanConfirmation",
						lang);
				model.addAttribute("pageTitle", pageTitle);
				model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
				return UserRestURIConstants.getSitePath(request)
						+ "homecare/homecare-confirmation";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			creditCardNo = "";
			e.printStackTrace();
		}
		String expiryDate = (String) session.getAttribute("HomeCareCardexpiryDate");
		String userName = (String) session.getAttribute("username");
		String token = (String) session.getAttribute("token");
		String emailId = (String) session.getAttribute("emailAddress");
		System.out.println("********************Inside Confirmation*****************");
		System.out.println("referenceNo=" + referenceNo);
		System.out.println("Transaction Number==>" + transactionNumber);
		System.out.println("Transaction Date==>" + transactionDate);
		System.out.println("creditCardNo==>>" + creditCardNo);
		System.out.println("expiryDate==>>" + expiryDate);
		System.out.println("userName==>>" + userName);
		System.out.println("token==>>" + token);
		
		HomeCareService homecareService = new HomeCareServiceImpl();
		CreatePolicy finalizePolicy = homecareService.finalizeHomeCarePolicy(
				userName, token, referenceNo, transactionNumber,
				transactionDate, creditCardNo, expiryDate, emailId,
				lang);
		if (finalizePolicy.getErrMsgs() == null) 
		{
			HashMap<String, String> header = new HashMap<String, String>(
					COMMON_HEADERS);
			session.removeAttribute("HomeCareCreditCardNo");
			session.removeAttribute("HomeCareCardexpiryDate");
			header.put("userName", userName);
			header.put("token", token);
			model.addAttribute("policyNo", finalizePolicy.getPolicyNo());
			session.setAttribute("policyNo", finalizePolicy.getPolicyNo());
			
			session.removeAttribute("referralCode"); // vincent - remove session attribute "referral code" if success
		} 
		else 
		{
			model.addAttribute("errMsgs", finalizePolicy.getErrMsgs());
			
			if (finalizePolicy.getErrMsgs().toString().contains("invalid payment amount")) {
				model.addAttribute("errorHeader1", "Invalid Payment Amount");
				model.addAttribute("errorDescription1", "There is a mismatch of the payment amount with the policy");
				model.addAttribute("errorHeader2", "Please DO NOT retry the payment");
				model.addAttribute("errorDescription2", "Contact our CS at 3123 3123");
			} else {
				model.addAttribute("errorHeader1", "Policy is not generated");
				model.addAttribute("errorDescription1", "There is a problem in the system " + finalizePolicy.getErrMsgs().toString());
				model.addAttribute("errorHeader2", "Please DO NOT retry the payment");
				model.addAttribute("errorDescription2", "Contact our CS at 3123 3123");
			}
			
			return UserRestURIConstants.getSitePath(request)
					+ "error";
			
		}

		model.addAttribute("emailID", emailId);

		// model.addAttribute("finalize", finalize);
		model.addAttribute("referenceNo", referenceNo);
		session.setAttribute("referenceNo", referenceNo);
		
		String pageTitle = WebServiceUtils.getPageTitle("page.homeCarePlanConfirmation", lang);
		String pageMetaDataDescription = WebServiceUtils.getPageTitle(
				"meta.homeCarePlanConfirmation",
				lang);
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
		
		return UserRestURIConstants.getSitePath(request)
				+ "homecare/homecare-confirmation";
				
		
	}

	@RequestMapping(value = "/{lang}/failure")
	public String processPaymentFailure(Model model, HttpServletRequest request) {

		String errormsg = request.getParameter("errorMsg");
		System.out.println("Error Message" + errormsg);
		model.addAttribute("errormsg", errormsg);

		return UserRestURIConstants.getSitePath(request) + "failure";
		
		
	}
}