package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.Format;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.model.CreatePolicy;
import com.ifwd.fwdhk.model.DistrictBean;
import com.ifwd.fwdhk.model.HomeCareDetailsBean;
import com.ifwd.fwdhk.model.HomeCareQuetionaries;
import com.ifwd.fwdhk.model.HomeQuoteBean;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.services.HomeCareService;
import com.ifwd.fwdhk.services.HomeCareServiceImpl;
import com.ifwd.fwdhk.util.DateApi;
import com.ifwd.fwdhk.util.JsonUtils;
import com.ifwd.fwdhk.util.Methods;
import com.ifwd.fwdhk.util.StringHelper;
import com.ifwd.fwdhk.util.WebServiceUtils;
import com.ifwd.fwdhk.utils.services.SendEmailDao;

@Controller
public class HomeCareController {
	
	private final static Logger logger = LoggerFactory.getLogger(HomeCareController.class);

	@Autowired
	RestServiceDao restService;
	@Autowired
	SendEmailDao sendEmail;

	@RequestMapping(value = {"/{lang}/homecare", "/{lang}/home-insurance", "/{lang}/home-insurance/sharing/"})
	public String getHomeCarePage(@RequestParam(required = false) final String promo, HttpServletRequest request, Model model,
			@RequestParam(required = false) final String utm_source,
			@RequestParam(required = false) final String utm_medium,
			@RequestParam(required = false) final String utm_campaign,
			@RequestParam(required = false) final String utm_content) 
	{
		
		UserRestURIConstants.setController("Homecare");
		
		
		UserRestURIConstants urc = new UserRestURIConstants(); 
		urc.updateLanguage(request);
		
		
		request.setAttribute("controller", UserRestURIConstants.getController());
		HomeCareService homecareService = new HomeCareServiceImpl();
		HttpSession session = request.getSession();
		String token = null, username = null;
		if (promo != null) {
			if (!promo.equals("")) {
				session.setAttribute("referralCode", StringHelper.emptyIfNull(promo));
			}
		}
		session.setAttribute("referralCode", StringHelper.emptyIfNull(promo));
		Calendar date = Calendar.getInstance();
		date.setTime(new Date());
		Format f = new SimpleDateFormat("dd-MMMM-yyyy");
		date.add(Calendar.YEAR, 1);

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
				if (promo != null) {
					ogUrl = ogUrl + "?promo=" + promo;	
				}
				ogImage = WebServiceUtils.getPageTitle("homeCare.og.image", lang);
				ogDescription = WebServiceUtils.getPageTitle("homeCare.og.description", lang);
				googleRickSnippetBrand =WebServiceUtils.getPageTitle(
						"homeCare.googleRickSnippetBrand",
						UserRestURIConstants.getLanaguage(request));
				googleRickSnippetName =WebServiceUtils.getPageTitle(
						"homeCare.googleRickSnippetName",
						UserRestURIConstants.getLanaguage(request));
				
				googleRickSnippetImageUrl =WebServiceUtils.getPageTitle(
						"homeCare.googleRickSnippetImageUrl",
						UserRestURIConstants.getLanaguage(request));
				googleRickSnippetImageAlt =WebServiceUtils.getPageTitle(
						"homeCare.googleRickSnippetImageAlt",
						UserRestURIConstants.getLanaguage(request));
				googleRickSnippetRating =WebServiceUtils.getPageTitle(
						"homeCare.googleRickSnippetRating",
						UserRestURIConstants.getLanaguage(request));
				googleRickSnippetPrice =WebServiceUtils.getPageTitle(
						"homeCare.googleRickSnippetPrice",
						UserRestURIConstants.getLanaguage(request));
				googleRickSnippetAvailability =WebServiceUtils.getPageTitle(
						"homeCare.googleRickSnippetAvailability",
						UserRestURIConstants.getLanaguage(request));
				googleRickSnippetAvailabilityText =WebServiceUtils.getPageTitle(
						"homeCare.googleRickSnippetAvailabilityText",
						UserRestURIConstants.getLanaguage(request));
				googleRickSnippetDescription1 =WebServiceUtils.getPageTitle(
						"homeCare.googleRickSnippetDescription1",
						UserRestURIConstants.getLanaguage(request));
				googleRickSnippetDescription2 =WebServiceUtils.getPageTitle(
						"homeCare.googleRickSnippetDescription2",
						UserRestURIConstants.getLanaguage(request));
				
				
			}
			
			
			model.addAttribute("pageTitle", pageTitle);
			model.addAttribute("pageMetaDataDescription",
					pageMetaDataDescription);

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
			
			String twitterCard = WebServiceUtils.getPageTitle("twitter.home.card",
					UserRestURIConstants.getLanaguage(request));
			String twitterImage = WebServiceUtils.getPageTitle("twitter.home.image",
					UserRestURIConstants.getLanaguage(request));
			String twitterSite = WebServiceUtils.getPageTitle("twitter.home.site",
					UserRestURIConstants.getLanaguage(request));
			String twitterUrl = WebServiceUtils.getPageTitle("twitter.home.url",
					UserRestURIConstants.getLanaguage(request));
			String canonical = WebServiceUtils.getPageTitle("canonical.home",
					UserRestURIConstants.getLanaguage(request));
			model.addAttribute("twitterCard", twitterCard);
			model.addAttribute("twitterImage", twitterImage);
			model.addAttribute("twitterSite", twitterSite);
			model.addAttribute("twitterUrl", twitterUrl);
			model.addAttribute("canonical", canonical);
			
			String scriptName = WebServiceUtils.getPageTitle("homeCare.script.name",
					UserRestURIConstants.getLanaguage(request));
			String scriptDescription = WebServiceUtils.getPageTitle("homeCare.script.description",
					UserRestURIConstants.getLanaguage(request));
			String scriptChildName = WebServiceUtils.getPageTitle("homeCare.script.child.name",
					UserRestURIConstants.getLanaguage(request));
			model.addAttribute("scriptName", scriptName);
			model.addAttribute("scriptDescription", scriptDescription);
			model.addAttribute("scriptChildName", scriptChildName);
			
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
		UserRestURIConstants.setController("Homecare");
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		UserRestURIConstants.setController("Homecare");
		request.setAttribute("controller", UserRestURIConstants.getController());
		HomeCareService homecareService = new HomeCareServiceImpl();
		HttpSession session = request.getSession();
		session.removeAttribute("homeCareDetails");
		session.removeAttribute("policyNo");
		// redirect to 1ST step when null
		if (session.getAttribute("token") == null) {
			return getHomeCarePage((String)session.getAttribute("referralCode"), request, model, "", "", "", "");
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
			return getHomeCarePage((String)session.getAttribute("referralCode"), request, model, "", "", "", "");
		}
		
		

		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		
		HomeQuoteBean planQuote = homecareService.getHomePlan(token, username,
				(String)session.getAttribute("referralCode"), answer1, answer2,	lang);
		session.setAttribute("referralCode", planQuote.getReferralCode());
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
		} else if (planQuote.getErrormsg().contains("Promotion code is not valid")) {
			model.addAttribute("planQuote", planQuote);
			request.setAttribute("planQuote", planQuote);
			model.addAttribute("answer1", answer1);
			model.addAttribute("answer2", answer2);
			String pageTitle = WebServiceUtils.getPageTitle("page.homeCareQuotation", lang);
			String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.homeCareQuotation",	lang);
			model.addAttribute("pageTitle", pageTitle);
			model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
			
			String twitterCard = WebServiceUtils.getPageTitle("twitter.home.card",
					UserRestURIConstants.getLanaguage(request));
			String twitterImage = WebServiceUtils.getPageTitle("twitter.home.image",
					UserRestURIConstants.getLanaguage(request));
			String twitterSite = WebServiceUtils.getPageTitle("twitter.home.site",
					UserRestURIConstants.getLanaguage(request));
			String twitterUrl = WebServiceUtils.getPageTitle("twitter.home.url",
					UserRestURIConstants.getLanaguage(request));
			String canonical = WebServiceUtils.getPageTitle("canonical.home",
					UserRestURIConstants.getLanaguage(request));
			model.addAttribute("twitterCard", twitterCard);
			model.addAttribute("twitterImage", twitterImage);
			model.addAttribute("twitterSite", twitterSite);
			model.addAttribute("twitterUrl", twitterUrl);
			model.addAttribute("canonical", canonical);
			
			session.setAttribute("referralCode", "");
			return UserRestURIConstants.getSitePath(request)
					+ "homecare/homecare-plan";
		} 
		
		
		else {
			model.addAttribute("errMsgs", planQuote.getErrormsg());
			return getHomeCarePage((String)session.getAttribute("referralCode"), request, model, "", "", "", "");
		}
	}

	@RequestMapping(value = {"/{lang}/getYourHomeCareDetails", "/{lang}/home-insurance/user-details"})
	public String prepareYoursDetails(
			@ModelAttribute("planQuoteDetails") HomeQuoteBean homeQuoteDetails,
			Model model, HttpServletRequest request) {
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		
		UserRestURIConstants.setController("Homecare");
		request.setAttribute("controller", UserRestURIConstants.getController());
		HttpSession session = request.getSession();

		// redirect to 1ST step when null
		if (session.getAttribute("token") == null) {
			return getHomeCarePage((String)session.getAttribute("referralCode"), request, model, "", "", "", "");
		}

		String token = session.getAttribute("token").toString();
		String userName = session.getAttribute("username").toString();
		String theClubMembershipNo = WebServiceUtils.getParameterValue("theClubMembershipNo", session, request);
		String placeholder = WebServiceUtils.getMessage("club.membership.number", UserRestURIConstants.getLanaguage(request));
		String MembershipNo = "";
		if(placeholder.equals(theClubMembershipNo)) {
			MembershipNo = "";
		}else {
			MembershipNo = theClubMembershipNo;
		}
		session.setAttribute("theClubMembershipNo", MembershipNo);

		HomeCareService homecareService = new HomeCareServiceImpl();
		try {
			String lang = UserRestURIConstants.getLanaguage(request);
			if (lang.equals("tc"))
				lang = "CN";
			
			List<DistrictBean> districtList = homecareService.getDistrict(userName, token, lang);
			Map<String, String> mapNetFloorArea = homecareService.getNetFloorArea(userName, token, lang);
			request.setAttribute("districtList", districtList);
			try {
				if (homeQuoteDetails == null) {
					homeQuoteDetails = new HomeQuoteBean();
					homeQuoteDetails = (HomeQuoteBean) session.getAttribute("homeQuoteDetails");
				}
			} catch (Exception e) {
				homeQuoteDetails = new HomeQuoteBean();
				homeQuoteDetails = (HomeQuoteBean) session.getAttribute("homeQuoteDetails");
			}
			if (homeQuoteDetails.getTotalDue() != null) 
			{
				session.setAttribute("homeQuoteDetails", homeQuoteDetails);
			} 
			else {
				homeQuoteDetails = (HomeQuoteBean) session.getAttribute("homeQuoteDetails");

				// redirect to 1ST step when null
				if (homeQuoteDetails == null) {
					return getHomeCarePage((String)session.getAttribute("referralCode"), request, model, "", "", "", "");
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
		
		String twitterCard = WebServiceUtils.getPageTitle("twitter.home.card",
				UserRestURIConstants.getLanaguage(request));
		String twitterImage = WebServiceUtils.getPageTitle("twitter.home.image",
				UserRestURIConstants.getLanaguage(request));
		String twitterSite = WebServiceUtils.getPageTitle("twitter.home.site",
				UserRestURIConstants.getLanaguage(request));
		String twitterUrl = WebServiceUtils.getPageTitle("twitter.home.url",
				UserRestURIConstants.getLanaguage(request));
		String canonical = WebServiceUtils.getPageTitle("canonical.home",
				UserRestURIConstants.getLanaguage(request));
		model.addAttribute("twitterCard", twitterCard);
		model.addAttribute("twitterImage", twitterImage);
		model.addAttribute("twitterSite", twitterSite);
		model.addAttribute("twitterUrl", twitterUrl);
		model.addAttribute("canonical", canonical);
		
		session.removeAttribute("homeCreatedPolicy");
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
		if (!planQuote.contains("Promotion code is not valid")) {
			session.setAttribute("referralCode", StringHelper.emptyIfNull(referralCode));
		} else {
			session.setAttribute("referralCode", "");
		}
		return planQuote;
	}
	
	@RequestMapping(value = {"/home-temp-save"})
	public String homeTempSave(
			@ModelAttribute("frmYourDetails") HomeCareDetailsBean homeCareDetails,
			BindingResult result, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("home-temp-save", homeCareDetails);
		return "success";
	}
	

	@RequestMapping(value = {"/{lang}/prepareUserSummaryForHome", "/{lang}/home-insurance/home-summary"})
	public String prepareSummary(
			@ModelAttribute("frmYourDetails") HomeCareDetailsBean homeCareDetails,
			BindingResult result, Model model, HttpServletRequest request) {
		UserRestURIConstants.setController("Homecare");
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		
		HttpSession session = request.getSession();
		
		if (session.getAttribute("token") == null) {
			return getHomeCarePage((String)session.getAttribute("referralCode"), request, model, "", "", "", "");
		}
		
		UserRestURIConstants.setController("Homecare");
		request.setAttribute("controller", UserRestURIConstants.getController());
		UserDetails userDetails = new UserDetails();

		String passportORhkid = WebServiceUtils.getParameterValue("apphkidandpassport", session, request);
		String hkId = StringHelper.emptyIfNull(WebServiceUtils.getParameterValue("hkId", session, request));
		String applicantName = WebServiceUtils.getParameterValue("applicantName", session, request);
		String emailAddress = WebServiceUtils.getParameterValue("emailAddress", session, request);
		String mobileNo = WebServiceUtils.getParameterValue("mobileNo", session, request);
		String dob = DateApi.formatString(WebServiceUtils.getParameterValue("applicantDob", session, request));
		NumberFormat formatter = new DecimalFormat("#0.00");  
		
		
		String totalDue = WebServiceUtils.getParameterValue("totalDue", session, request);
		float itotalDue = Float.parseFloat(totalDue);
		totalDue = formatter.format(itotalDue);
		session.setAttribute("dueAmount", totalDue);
		String planCode = WebServiceUtils.getParameterValue("planCode", session, request);
		String optIn1Value = WebServiceUtils.getParameterValue("donotWishDirectMarketing", session, request);
		String optIn2Value = WebServiceUtils.getParameterValue("donotDisclose", session, request);
		
		boolean optIn1;
		boolean optIn2;
		if (optIn1Value == null) {
			homeCareDetails.setCheckbox3(false);
			optIn1 = false;
		} else {
		
			if (optIn1Value.toUpperCase().toUpperCase().equals("ON")) {
				homeCareDetails.setCheckbox3(true);
				optIn1 = true;
			} else {
				homeCareDetails.setCheckbox3(false);
				optIn1 = false;
			}
				
		}
		
		if (optIn2Value == null) {
			homeCareDetails.setCheckbox4(false);
			optIn2 = false;
		} else {
		
			if (optIn2Value.toUpperCase().toUpperCase().equals("ON")) {
				homeCareDetails.setCheckbox4(true);
				optIn2 = true;
			} else {
				homeCareDetails.setCheckbox4(false);
				optIn2 = false;
			}
				
		}
		
		
		
		
		if (homeCareDetails.getTotalDue() != null) {
			session.setAttribute("homeCareDetails", homeCareDetails);
		} else {
			homeCareDetails = (HomeCareDetailsBean) session.getAttribute("homeCareDetails");
			if (homeCareDetails == null) {
				return getHomeCarePage((String)session.getAttribute("referralCode"), request, model, "", "", "", "");
			}
		}
		if (passportORhkid.equalsIgnoreCase("appHkid")) {
			userDetails.setHkid(hkId);
			userDetails.setPassport("");
		} else {
			userDetails.setHkid("");
			userDetails.setPassport(hkId);
		}
		userDetails.setFullName(applicantName);
		userDetails.setEmailAddress(emailAddress);
		userDetails.setMobileNo(mobileNo);
//		userDetails.setDob("");
		userDetails.setDob(dob);
		String token = session.getAttribute("token").toString();
		String userName = session.getAttribute("username").toString();
		
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		
		HomeCareService homecareService = new HomeCareServiceImpl();
		CreatePolicy createdPolicy = (CreatePolicy) session
				.getAttribute("homeCreatedPolicy");
		
		createdPolicy = null;
		
		if (createdPolicy == null) {
			createdPolicy = homecareService.createHomeCarePolicy(userName,
					token, homeCareDetails, userDetails,
					lang, (String)session.getAttribute("referralCode"),
					(String)session.getAttribute("theClubMembershipNo"));
			
			
			session.setAttribute("homeCreatedPolicy", createdPolicy);
			
			
		} else {
			String referenceNo = (String) session.getAttribute("HomeCareReferenceNo");
			String transactionNumber = (String) session.getAttribute("HomeCareTransactionNo");
			session.setAttribute("transNo", transactionNumber);
			String transactionDate = (String) session.getAttribute("HomeCareTransactionDate");
			String paymentFail = "1";
			
			String creditCardNo = (String)session.getAttribute("HomeCareCreditCardNo");
			
			if (creditCardNo !=null) {
				try {
					creditCardNo = Methods.decryptStr((String) session.getAttribute("HomeCareCreditCardNo"));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			String expiryDate = (String) session.getAttribute("HomeCareCardexpiryDate");
			String emailId = (String) session.getAttribute("emailAddress");
			CreatePolicy finalizePolicy = homecareService.finalizeHomeCarePolicy(
					userName, token, referenceNo, transactionNumber,
					transactionDate, creditCardNo, expiryDate, emailId,
					lang, paymentFail);
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
			session.setAttribute("transNo", confirm.getTransactionNo());
			model.addAttribute("confirm", confirm);
		} else {
			model.addAttribute("errMsgs", createdPolicy.getErrMsgs());
			//return getHomeCarePage((String)session.getAttribute("referralCode"), request, model);
			return prepareYoursDetails(null, model, request); 
			
//			return UserRestURIConstants.getSitePath(request)
//					+ "home-insurance/user-details";
		}

		model.addAttribute("totalDue", totalDue);
		model.addAttribute("planCode", planCode);
		model.addAttribute("createdPolicy", createdPolicy);
		model.addAttribute("userDetails", userDetails);
		model.addAttribute("referralCode", session.getAttribute("referralCode"));
		
		Calendar date = Calendar.getInstance();
		date.setTime(DateApi.formatDate(homeCareDetails.getEffectiveDate()));
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
		date.add(Calendar.YEAR, 1);
		date.add(Calendar.DATE, -1);
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
		model.addAttribute("effectiveDate", DateApi.pickDate1(homeCareDetails.getEffectiveDate()));
		model.addAttribute("effectiveEndDate", endDate);
		model.addAttribute("homeCareDetails", homeCareDetails);
//		model.addAttribute("path", path.replace("prepareUserSummaryForHome",
//				"homecare-confirmation"));
		model.addAttribute("path",
				path.replace("home-summary", "confirmation?utm_nooverride=1"));
		
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
		
		String twitterCard = WebServiceUtils.getPageTitle("twitter.home.card",
				UserRestURIConstants.getLanaguage(request));
		String twitterImage = WebServiceUtils.getPageTitle("twitter.home.image",
				UserRestURIConstants.getLanaguage(request));
		String twitterSite = WebServiceUtils.getPageTitle("twitter.home.site",
				UserRestURIConstants.getLanaguage(request));
		String twitterUrl = WebServiceUtils.getPageTitle("twitter.home.url",
				UserRestURIConstants.getLanaguage(request));
		String canonical = WebServiceUtils.getPageTitle("canonical.home",
				UserRestURIConstants.getLanaguage(request));
		model.addAttribute("twitterCard", twitterCard);
		model.addAttribute("twitterImage", twitterImage);
		model.addAttribute("twitterSite", twitterSite);
		model.addAttribute("twitterUrl", twitterUrl);
		model.addAttribute("canonical", canonical);

		return UserRestURIConstants.getSitePath(request)
				+ "homecare/homecare-summary-payment";
	}

	@RequestMapping(value = "/processHomeCarePayment", method = RequestMethod.POST)
	@ResponseBody
	public String processHomeCarePayment(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		UserRestURIConstants.setController("Homecare");
		HttpSession session = request.getSession();
		
		session.setAttribute("HomeCareTransactionNo", request.getParameter("orderRef"));
		
		String referenceNo = request.getParameter("referenceNo");
		
		JSONObject submitPolicy = new JSONObject();
		submitPolicy.put("referenceNo", referenceNo);
		HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
		header.put("userName", (String) session.getAttribute("username"));
		header.put("token", (String) session.getAttribute("token"));
		header.put("language", WebServiceUtils.transformLanaguage(UserRestURIConstants.getLanaguage(request)));
		
		logger.info("HOMECARE_SUBMIT_POLICY Request" + JsonUtils.jsonPrint(submitPolicy));
		JSONObject jsonResponse = restService.consumeApi(
				HttpMethod.POST,
				UserRestURIConstants.HOMECARE_SUBMIT_POLICY, header,
				submitPolicy);
		
		logger.info("HOMECARE_SUBMIT_POLICY Response" + JsonUtils.jsonPrint(jsonResponse));
		
		if (checkJsonObjNull(jsonResponse, "errMsgs").equals("")) {
			if (checkJsonObjNull(jsonResponse, "policyNo").equals("")) {
				try {
					session.setAttribute("HomeCareCreditCardNo", Methods.encryptStr(request.getParameter("cardNo")));
				} catch (Exception e) {
					e.printStackTrace();
				}

				session.setAttribute("HomeCareCardexpiryDate", String.format("%02d", Integer.parseInt(request.getParameter("epMonth"))) + request.getParameter("epYear"));
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
	public String checkJsonObjNull(JSONObject obj, String checkByStr) {
		if (obj.get(checkByStr) != null) {
			return obj.get(checkByStr).toString();
		} else {
			return "";
		}
	}
	

	@RequestMapping(value = {"/{lang}/homecare-confirmation", "/{lang}/home-insurance/confirmation"})
	public String processHomePayment(Model model, HttpServletRequest request) {
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		UserRestURIConstants.setController("Homecare");
		request.setAttribute("controller", UserRestURIConstants.getController());
		HttpSession session = request.getSession();	
		
		String referenceNo = (String) session.getAttribute("HomeCareReferenceNo");
		String transactionNumber = (String) session.getAttribute("HomeCareTransactionNo");
		String requestNo = (String) session.getAttribute("HomeCareTransactionNo");
		String transactionDate = (String) session.getAttribute("HomeCareTransactionDate");
		String paymentFail = "0";
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
			creditCardNo = "";
			e.printStackTrace();
		}
		String expiryDate = (String) session.getAttribute("HomeCareCardexpiryDate");
		String userName = (String) session.getAttribute("username");
		String token = (String) session.getAttribute("token");
		String emailId = (String) session.getAttribute("emailAddress");
		String email = (String) session.getAttribute("emailAddress");
		
		if(StringUtils.isAllLowerCase(referenceNo) || StringUtils.isAllLowerCase(transactionNumber) || StringUtils.isAllLowerCase(transactionDate)
				|| StringUtils.isAllLowerCase(creditCardNo) || StringUtils.isAllLowerCase(expiryDate)) {
			return UserRestURIConstants.getSitePath(request) + "homecare/homecare";
		}
		
		HomeCareService homecareService = new HomeCareServiceImpl();
		CreatePolicy finalizePolicy = homecareService.finalizeHomeCarePolicy(
				userName, token, referenceNo, transactionNumber,
				transactionDate, creditCardNo, expiryDate, emailId,
				lang, paymentFail);
		if (finalizePolicy.getErrMsgs() == null) 
		{
			HashMap<String, String> header = new HashMap<String, String>(
					COMMON_HEADERS);
			session.removeAttribute("HomeCareCreditCardNo");
			session.removeAttribute("HomeCareCardexpiryDate");
			session.removeAttribute("homeCreatedPolicy");
			session.removeAttribute("home-temp-save");
			header.put("userName", userName);
			header.put("token", token);
			model.addAttribute("policyNo", finalizePolicy.getPolicyNo());
			session.setAttribute("policyNo", finalizePolicy.getPolicyNo());
			model.addAttribute("trasnNo", session.getAttribute("transNo"));
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
				model.addAttribute("errorHeader1", UserRestURIConstants.ERROR_HEADER1_1 + email + UserRestURIConstants.ERROR_HEADER1_2);
				model.addAttribute("errorDescription1", UserRestURIConstants.ERROR_DESCRIPTION1 + " " + requestNo);
				model.addAttribute("errorHeader2", UserRestURIConstants.ERROR_HEADER2_1 + " " + email + UserRestURIConstants.ERROR_HEADER2_2);
				model.addAttribute("errorDescription2", UserRestURIConstants.ERROR_DESCRIPTION2 + " " + requestNo);
			}		
			
			
			
			return UserRestURIConstants.getSitePath(request)
					+ "error";
			
		}
		model.addAttribute("utm_nooverride", 1);
		model.addAttribute("emailID", emailId);

		// model.addAttribute("finalize", finalize);
		model.addAttribute("referenceNo", referenceNo);
		session.setAttribute("referenceNo", referenceNo);
		model.addAttribute("dueAmount", session.getAttribute("dueAmount"));
		String pageTitle = WebServiceUtils.getPageTitle("page.homeCarePlanConfirmation", lang);
		String pageMetaDataDescription = WebServiceUtils.getPageTitle(
				"meta.homeCarePlanConfirmation",
				lang);
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
		
		String twitterCard = WebServiceUtils.getPageTitle("twitter.home.card",
				UserRestURIConstants.getLanaguage(request));
		String twitterImage = WebServiceUtils.getPageTitle("twitter.home.image",
				UserRestURIConstants.getLanaguage(request));
		String twitterSite = WebServiceUtils.getPageTitle("twitter.home.site",
				UserRestURIConstants.getLanaguage(request));
		String twitterUrl = WebServiceUtils.getPageTitle("twitter.home.url",
				UserRestURIConstants.getLanaguage(request));
		String canonical = WebServiceUtils.getPageTitle("canonical.home",
				UserRestURIConstants.getLanaguage(request));
		model.addAttribute("twitterCard", twitterCard);
		model.addAttribute("twitterImage", twitterImage);
		model.addAttribute("twitterSite", twitterSite);
		model.addAttribute("twitterUrl", twitterUrl);
		model.addAttribute("canonical", canonical);
		
		return UserRestURIConstants.getSitePath(request)
				+ "homecare/homecare-confirmation";
				
		
	}

	@RequestMapping(value = "/{lang}/failure")
	public String processPaymentFailure(Model model, HttpServletRequest request) {

		String errormsg = request.getParameter("errorMsg");
		model.addAttribute("errormsg", errormsg);

		return UserRestURIConstants.getSitePath(request) + "failure";
		
		
	}
}