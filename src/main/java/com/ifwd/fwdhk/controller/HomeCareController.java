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
import com.ifwd.fwdhk.util.WebServiceUtils;
import com.ifwd.fwdhk.utils.services.SendEmailDao;

@Controller
public class HomeCareController {

	@Autowired
	RestServiceDao restService;
	@Autowired
	SendEmailDao sendEmail;

	@RequestMapping(value = "/homecare")
	public String getHomeCarePage(@RequestParam(required = false) final String promo, HttpServletRequest request, Model model) {
		UserRestURIConstants.setController("Homecare");
		request.setAttribute("controller", UserRestURIConstants.getController());
		HomeCareService homecareService = new HomeCareServiceImpl();
		HttpSession session = request.getSession();
		String token = null, username = null;
		session.setAttribute("referralCode", promo);
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
		} else {
			restService.consumeLoginApi(request);
			if ((session.getAttribute("token") != null)) {
				token = session.getAttribute("token").toString();
				username = session.getAttribute("username").toString();
			}
		}
		List<HomeCareQuetionaries> homeCareQuetionariesList = homecareService
				.getHomeQuetionaries(token, username,
						UserRestURIConstants.getLanaguage(request));
		if (homeCareQuetionariesList.size() > 0) {
			request.setAttribute("homeCareQuetionariesList",
					homeCareQuetionariesList);
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
			String pageTitle = WebServiceUtils.getPageTitle("page.homeCare",
					UserRestURIConstants.getLanaguage(request));
			String pageMetaDataDescription = WebServiceUtils
					.getPageTitle("meta.homeCare",
							UserRestURIConstants.getLanaguage(request));
			model.addAttribute("pageTitle", pageTitle);
			model.addAttribute("pageMetaDataDescription",
					pageMetaDataDescription);

			return UserRestURIConstants.checkLangSetPage(request)
					+ "homecare/homecare";

		} else {
			model.addAttribute("errMsgs", "Question lists cannot be retrieved");

			model.addAttribute("action", "/");
			return "redirect:/redirect";
		}

	}

	@RequestMapping(value = "/getHomePlan")
	public String getHomeCarePlanage(Model model, HttpServletRequest request) {
		UserRestURIConstants.setController("Homecare");
		request.setAttribute("controller", UserRestURIConstants.getController());
		HomeCareService homecareService = new HomeCareServiceImpl();
		HttpSession session = request.getSession();

		// redirect to 1ST step when null
		if (session.getAttribute("token") == null) {
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
		/*
		 * String userReferralCode = (String) request.getSession().getAttribute(
		 * "referralCode");
		 */
		//
		String userReferralCode = "";

		HomeQuoteBean planQuote = homecareService.getHomePlan(token, username,
				userReferralCode, answer1, answer2,
				UserRestURIConstants.getLanaguage(request));
		model.addAttribute("planQuote", planQuote);
		model.addAttribute("answer1", answer1);
		model.addAttribute("answer2", answer2);
		String pageTitle = WebServiceUtils.getPageTitle(
				"page.homeCareQuotation",
				UserRestURIConstants.getLanaguage(request));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle(
				"meta.homeCareQuotation",
				UserRestURIConstants.getLanaguage(request));
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);

		return UserRestURIConstants.checkLangSetPage(request)
				+ "homecare/homecare-plan";

		// NAT REMOVE THE ERROR HANDLING
		// if (planQuote.getErrormsg() == null) {
		// model.addAttribute("planQuote", planQuote);
		// model.addAttribute("answer1", answer1);
		// model.addAttribute("answer2", answer2);
		//
		// return UserRestURIConstants.checkLangSetPage(request)+
		// "homecare/homecare-plan";
		// } else {
		// model.addAttribute("errMsgs", planQuote.getErrormsg());
		//
		//
		// model.addAttribute("action", "/homecare");
		// return "redirect:/redirect";
		// }

	}

	@RequestMapping(value = "/getYourHomeCareDetails")
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

		String answer1 = request.getParameter("answer1");
		String answer2 = request.getParameter("answer2");

		HomeCareService homecareService = new HomeCareServiceImpl();
		try {
			List<DistrictBean> districtList = homecareService
					.getDistrict(userName, token,
							UserRestURIConstants.getLanaguage(request));
			Map<String, String> mapNetFloorArea = homecareService
					.getNetFloorArea(userName, token,
							UserRestURIConstants.getLanaguage(request));
			request.setAttribute("districtList", districtList);
			if (homeQuoteDetails.getTotalDue() != null) {
				session.setAttribute("homeQuoteDetails", homeQuoteDetails);
			} else {
				homeQuoteDetails = (HomeQuoteBean) session
						.getAttribute("homeQuoteDetails");

				// redirect to 1ST step when null
				if (homeQuoteDetails == null) {
					return getHomeCarePage((String)session.getAttribute("referralCode"), request, model);
				}
			}

			model.addAttribute("homeQuoteDetails", homeQuoteDetails);
			model.addAttribute("districtList", districtList);
			model.addAttribute("mapNetFloorArea", mapNetFloorArea);

			model.addAttribute("answer1", answer1);
			model.addAttribute("answer2", answer2);

		}

		catch (Exception e) {

			e.printStackTrace();

		}
		String pageTitle = WebServiceUtils.getPageTitle(
				"page.homeCareUserDetails",
				UserRestURIConstants.getLanaguage(request));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle(
				"meta.homeCareUserDetails",
				UserRestURIConstants.getLanaguage(request));
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);

		return UserRestURIConstants.checkLangSetPage(request)
				+ "homecare/homecare-plan-details";
	}

	@ResponseBody
	@RequestMapping(value = "/applyHomePromoCode")
	public String applyPromoCode(Model model, HttpServletRequest request) {
		HomeCareService homecareService = new HomeCareServiceImpl();
		HttpSession session = request.getSession();
		String token = session.getAttribute("token").toString();
		String username = session.getAttribute("username").toString();

		String referralCode = request.getParameter("referralCode");
		String planQuote = homecareService.getHomePlanToString(token, username,
				referralCode, "NO", "NO",
				UserRestURIConstants.getLanaguage(request));

		if (!planQuote.contains("Promotion Code is not valid")) {
			session.setAttribute("referralCode", referralCode);
		} else {
			session.setAttribute("referralCode", "");
		}

		return planQuote;
	}

	@RequestMapping(value = "/prepareUserSummaryForHome")
	public String prepareSummary(
			@ModelAttribute("frmYourDetails") HomeCareDetailsBean homeCareDetails,
			BindingResult result, Model model, HttpServletRequest request) {
		UserRestURIConstants.setController("Homecare");
		request.setAttribute("controller", UserRestURIConstants.getController());
		UserDetails userDetails = new UserDetails();
		HttpSession session = request.getSession();

		// redirect to 1ST step when null
		if (session.getAttribute("token") == null) {
			return getHomeCarePage((String)session.getAttribute("referralCode"), request, model);
		}

		String passportORhkid = WebServiceUtils.getParameterValue(
				"apphkidandpassport", session, request);
		String hkId = WebServiceUtils.getParameterValue("hkId", session,
				request);
		String applicantName = WebServiceUtils.getParameterValue(
				"applicantName", session, request);
		String emailAddress = WebServiceUtils.getParameterValue("emailAddress",
				session, request);
		String mobileNo = WebServiceUtils.getParameterValue("mobileNo",
				session, request);
		String totalDue = WebServiceUtils.getParameterValue("totalDue",
				session, request);
		String planCode = WebServiceUtils.getParameterValue("planCode",
				session, request);
		if (homeCareDetails.getTotalDue() != null) {
			session.setAttribute("homeCareDetails", homeCareDetails);
		} else {
			homeCareDetails = (HomeCareDetailsBean) session
					.getAttribute("homeCareDetails");

			// redirect to 1ST step when null
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
		HomeCareService homecareService = new HomeCareServiceImpl();
		/* API not Working thats why code commented */

		CreatePolicy createdPolicy = (CreatePolicy) session
				.getAttribute("createdPolicy");
		if (createdPolicy == null) {
			createdPolicy = homecareService.createHomeCarePolicy(userName,
					token, homeCareDetails, userDetails,
					UserRestURIConstants.getLanaguage(request));
		}

		model.addAttribute("createdPolicy", createdPolicy);

		if (createdPolicy.getReferenceNo() != null) {
			CreatePolicy confirm = homecareService.confirmHomeCarePolicy(
					userName, token, createdPolicy.getReferenceNo(),
					UserRestURIConstants.getLanaguage(request));

			session.setAttribute("HomeCareReferenceNo",
					createdPolicy.getReferenceNo());
			session.setAttribute("HomeCareTransactionDate",
					confirm.getTransactionDate());
			model.addAttribute("confirm", confirm);
		}

		System.out.println("pAYtyPE===>" + createdPolicy.getPaymentType());

		System.out.println("Curr Code ID==>"
				+ createdPolicy.getPaymentGateway());
		System.out.println("M ID==>" + createdPolicy.getMerchantId());

		model.addAttribute("totalDue", totalDue);
		model.addAttribute("planCode", planCode);
		model.addAttribute("createdPolicy", createdPolicy);
		model.addAttribute("userDetails", userDetails);

		/*
		 * Format Next Year Date for Home Care Yearly Plan Effective End Date
		 */
		Calendar date = Calendar.getInstance();
		date.setTime(new Date(homeCareDetails.getEffectiveDate()));
		Format f = new SimpleDateFormat("dd MMMM yyyy");
		date.add(Calendar.YEAR, 1);
		String endDate = f.format(date.getTime());

		String path = request.getRequestURL().toString();
		String failurePath = request.getRequestURL().toString();
		model.addAttribute("effectiveDate", homeCareDetails.getEffectiveDate());
		model.addAttribute("effectiveEndDate", endDate);
		model.addAttribute("homeCareDetails", homeCareDetails);
		model.addAttribute("path", path.replace("prepareUserSummaryForHome",
				"homecare-confirmation"));

		// model.addAttribute("failurePath",
		// failurePath.replace("prepareUserSummaryForHome",
		// "failure"));
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
				UserRestURIConstants.getLanaguage(request));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle(
				"meta.homeCarePlanSummary",
				UserRestURIConstants.getLanaguage(request));
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);

		return UserRestURIConstants.checkLangSetPage(request)
				+ "homecare/homecare-summary-payment";
	}

	@RequestMapping(value = "/processHomeCarePayment", method = RequestMethod.POST)
	@ResponseBody
	public String processHomeCarePayment(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		request.getSession().setAttribute("HomeCareTransactionNo",
				request.getParameter("orderRef"));

		// request.getSession().setAttribute("HomeCareReferenceNo",
		// request.getParameter("referenceNo"));

		request.getSession().setAttribute("HomeCareCreditCardNo",
				request.getParameter("cardNo"));

		request.getSession().setAttribute(
				"HomeCareCardexpiryDate",
				String.format("%02d",
						Integer.parseInt(request.getParameter("epMonth")))
						+ request.getParameter("epYear"));

		request.getSession().setAttribute("emailAddress",
				request.getParameter("emailAddress"));
		System.out.println("cardNo : ");
		System.out.println(request.getParameter("cardNo"));
		System.out.println("emailAddress : ");
		System.out.println(request.getParameter("emailAddress"));
		System.out
				.println("*********************************inside Process Payment*****************************************");

		return "success";
	}

	@RequestMapping(value = "/homecare-confirmation")
	public String processHomePayment(Model model, HttpServletRequest request) {
		UserRestURIConstants.setController("Homecare");
		request.setAttribute("controller", UserRestURIConstants.getController());
		HttpSession session = request.getSession();

		String referenceNo = (String) session
				.getAttribute("HomeCareReferenceNo");
		String transactionNumber = (String) session
				.getAttribute("HomeCareTransactionNo");
		String transactionDate = (String) session
				.getAttribute("HomeCareTransactionDate");
		String creditCardNo = (String) session
				.getAttribute("HomeCareCreditCardNo");
		String expiryDate = (String) session
				.getAttribute("HomeCareCardexpiryDate");
		String userName = (String) session.getAttribute("username");
		String token = (String) session.getAttribute("token");
		String emailId = (String) session.getAttribute("emailAddress");
		System.out
				.println("********************Inside Confirmation*****************");
		System.out.println("referenceNo=" + referenceNo);
		System.out.println("Transaction Number==>" + transactionNumber);
		System.out.println("Transaction Date==>" + transactionDate);
		System.out.println("creditCardNo==>>" + creditCardNo);
		System.out.println("expiryDate==>>" + expiryDate);
		System.out.println("userName==>>" + userName);
		System.out.println("token==>>" + token);

		HomeCareService homecareService = new HomeCareServiceImpl();
		/*
		 * FinalizePolicy finalize =new FinalizePolicy(); finalize =
		 * homecareService.finalizeHomeCarePolicy( userName, token, referenceNo,
		 * transactionNumber, transactionDate, creditCardNo, expiryDate,
		 * emailId);
		 */

		CreatePolicy finalize = homecareService.finalizeHomeCarePolicy(
				userName, token, referenceNo, transactionNumber,
				transactionDate, creditCardNo, expiryDate, emailId,
				UserRestURIConstants.getLanaguage(request));
		if (finalize.getPolicyNo() != null) {
			HashMap<String, String> header = new HashMap<String, String>(
					COMMON_HEADERS);
			header.put("userName", userName);
			header.put("token", token);

			// sendEmail.sendEmail(emailId, referenceNo, header);
			model.addAttribute("policy", finalize.getPolicyNo());
		}
		model.addAttribute("emailID", emailId);

		// model.addAttribute("finalize", finalize);
		model.addAttribute("referenceNo", referenceNo);
		String pageTitle = WebServiceUtils.getPageTitle(
				"page.homeCarePlanConfirmation",
				UserRestURIConstants.getLanaguage(request));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle(
				"meta.homeCarePlanConfirmation",
				UserRestURIConstants.getLanaguage(request));
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
		return UserRestURIConstants.checkLangSetPage(request)
				+ "homecare/homecare-confirmation";
	}

	@RequestMapping(value = "/failure")
	public String processPaymentFailure(Model model, HttpServletRequest request) {

		String errormsg = request.getParameter("errorMsg");
		System.out.println("Error Message" + errormsg);
		model.addAttribute("errormsg", errormsg);

		return UserRestURIConstants.checkLangSetPage(request) + "failure";
	}
}