package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.model.CreatePolicy;
import com.ifwd.fwdhk.model.DistrictBean;
import com.ifwd.fwdhk.model.HomeCareDetailsBean;
import com.ifwd.fwdhk.model.HomeQuoteBean;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.services.GAService;
import com.ifwd.fwdhk.util.DateApi;
import com.ifwd.fwdhk.util.HomeLiabilityPageFlowControl;
import com.ifwd.fwdhk.util.InitApplicationMessage;
import com.ifwd.fwdhk.util.Methods;
import com.ifwd.fwdhk.util.StringHelper;
import com.ifwd.fwdhk.util.WebServiceUtils;
@Controller
public class GAController extends BaseController{
	
	@Autowired
	private GAService gaService;
	
	private final static Logger logger = LoggerFactory.getLogger(GAController.class);
	
	@RequestMapping(value = {"/{lang}/{plan}"})
	public ModelAndView getInsurance(@PathVariable("plan") String plan,Model model, HttpServletRequest request) {
		if(UserRestURIConstants.URL_HOME_LIABILITY_LANDING.equals(plan)) {
			return HomeLiabilityPageFlowControl.pageFlow(plan, model, request, UserRestURIConstants.PAGE_PROPERTIES_HOME_LIABILITY_LANDING);
		}
		return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
	}
	
	@RequestMapping(value = {"/{lang}/{plan}/screening"})
	public ModelAndView getScreening(@PathVariable("plan") String plan,Model model, HttpServletRequest request) {
		if(UserRestURIConstants.URL_HOME_LIABILITY_LANDING.equals(plan)) {
			return HomeLiabilityPageFlowControl.pageFlow(plan, model, request, UserRestURIConstants.PAGE_PROPERTIES_HOME_LIABILITY_SCREENING);
		}
		return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
	}
	
	@RequestMapping(value = {"/{lang}/{plan}/select-plan"})
	public ModelAndView getQuote(@PathVariable("plan") String plan,Model model, HttpServletRequest request) {
		if(UserRestURIConstants.URL_HOME_LIABILITY_LANDING.equals(plan)) {
			return HomeLiabilityPageFlowControl.pageFlow(plan, model, request, UserRestURIConstants.PAGE_PROPERTIES_HOME_LIABILITY_SELECT_PLAN);
		}
		return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
	}
	
	@RequestMapping(value = {"/{lang}/{plan}/user-details"})
	public ModelAndView getUserDetails(@PathVariable("plan") String plan, 
			@ModelAttribute("planQuoteDetails") HomeQuoteBean homeQuoteDetails, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String theClubMembershipNo = WebServiceUtils.getParameterValue("theClubMembershipNo", session, request);
		session.setAttribute("theClubMembershipNo", theClubMembershipNo);
		
		if(UserRestURIConstants.URL_HOME_LIABILITY_LANDING.equals(plan)) {
			if(homeQuoteDetails == null || homeQuoteDetails.getTotalDue() == null) {
				return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
			}
			session.setAttribute("homeQuoteDetails", homeQuoteDetails);
			String lang = UserRestURIConstants.getLanaguage(request);
			List<DistrictBean> districtList;
			Map<String, String> mapNetFloorArea;
			if(lang.equals("tc")) {
				districtList = InitApplicationMessage.districtCN;
				mapNetFloorArea = InitApplicationMessage.netFloorAreaCN;
			}else {
				districtList = InitApplicationMessage.districtEN;
				mapNetFloorArea = InitApplicationMessage.netFloorAreaEN;
			}
			
			model.addAttribute("homeQuoteDetails", homeQuoteDetails);
			model.addAttribute("districtList", districtList);
			model.addAttribute("mapNetFloorArea", mapNetFloorArea);
			
			return HomeLiabilityPageFlowControl.pageFlow(plan, model, request, UserRestURIConstants.PAGE_PROPERTIES_HOME_LIABILITY_USER_DETAILS);
		}
		return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
	}
	
	@RequestMapping(value = {"/{lang}/{plan}/summary"})
	public ModelAndView getSummary(@PathVariable("plan") String plan,Model model, HttpServletRequest request) {
		if(UserRestURIConstants.URL_HOME_LIABILITY_LANDING.equals(plan)) {
			HttpSession session = request.getSession();
			UserDetails userDetails = (UserDetails)session.getAttribute("applicantDetails");
			HomeCareDetailsBean homeCareDetails = (HomeCareDetailsBean)session.getAttribute("homeCareDetails");
			CreatePolicy confirm = (CreatePolicy)session.getAttribute("confirm");
			CreatePolicy createdPolicy = (CreatePolicy)session.getAttribute("createdPolicy");
			HomeQuoteBean homeQuoteDetails = (HomeQuoteBean)session.getAttribute("homeQuoteDetails");
			
			String totalDue = homeQuoteDetails.getTotalDue();
			if(StringUtils.hasText(totalDue)) {
				float itotalDue = Float.parseFloat(totalDue);
				NumberFormat formatter = new DecimalFormat("#0.00");
				totalDue = formatter.format(itotalDue);
				session.setAttribute("dueAmount", totalDue);
			}
			String planCode = homeQuoteDetails.getPlanCode();
			model.addAttribute("totalDue", totalDue);
			model.addAttribute("planCode", planCode);
			model.addAttribute("confirm", confirm);
			model.addAttribute("createdPolicy", createdPolicy);
			model.addAttribute("userDetails", userDetails);
			model.addAttribute("referralCode", session.getAttribute("referralCode"));
			
			Calendar date = Calendar.getInstance();
			date.setTime(DateApi.formatDate(homeCareDetails.getEffectiveDate()));
			SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
			date.add(Calendar.YEAR, 1);
			date.add(Calendar.DATE, -1);
			String endDate = f.format(date.getTime());
			String path = request.getRequestURL().toString();
			
			model.addAttribute("effectiveDate", DateApi.pickDate1(homeCareDetails.getEffectiveDate()));
			model.addAttribute("effectiveEndDate", endDate);
			model.addAttribute("homeCareDetails", homeCareDetails);
			model.addAttribute("path", path.replace("summary", "confirmation-ga?utm_nooverride=1"));
			model.addAttribute("failurePath", path + "?paymentGatewayFlag=true");
			
			return HomeLiabilityPageFlowControl.pageFlow(plan, model, request, UserRestURIConstants.PAGE_PROPERTIES_HOME_LIABILITY_SUMMARY);
		}
		return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
	}
	
	@RequestMapping(value = {"/{lang}/{plan}/confirmation-ga"})
	public ModelAndView getConfirmation(@PathVariable("plan") String plan,Model model, HttpServletRequest request) {
		if(UserRestURIConstants.URL_HOME_LIABILITY_LANDING.equals(plan)) {
			HttpSession session = request.getSession();
			String referenceNo = (String) session.getAttribute("HomeCareReferenceNo");
			String transactionNumber = (String) session.getAttribute("HomeCareTransactionNo");
			String requestNo = (String) session.getAttribute("HomeCareTransactionNo");
			String transactionDate = (String) session.getAttribute("HomeCareTransactionDate");
			String creditCardNo = (String)session.getAttribute("HomeCareCreditCardNo");
			String paymentFail = "0";
			String lang = UserRestURIConstants.getLanaguage(request);
			if (lang.equals("tc"))
				lang = "CN";
			
			if (creditCardNo !=null) {
				try {
					creditCardNo = Methods.decryptStr((String) session.getAttribute("HomeCareCreditCardNo"));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else {
				model.addAttribute("policyNo", StringHelper.emptyIfNull((String)session.getAttribute("policyNo")));
				model.addAttribute("referenceNo", StringHelper.emptyIfNull((String)session.getAttribute("referenceNo")));
				return HomeLiabilityPageFlowControl.pageFlow(plan, model, request, UserRestURIConstants.PAGE_PROPERTIES_HOME_LIABILITY_CONFIRMATION);
			}
			String expiryDate = (String) session.getAttribute("HomeCareCardexpiryDate");
			String userName = (String) session.getAttribute("username");
			String token = (String) session.getAttribute("token");
			String emailId = (String) session.getAttribute("emailAddress");
			String email = (String) session.getAttribute("emailAddress");
			
			if(org.apache.commons.lang.StringUtils.isAllLowerCase(referenceNo) ||
					org.apache.commons.lang.StringUtils.isAllLowerCase(transactionNumber) ||
					org.apache.commons.lang.StringUtils.isAllLowerCase(transactionDate) || 
					org.apache.commons.lang.StringUtils.isAllLowerCase(creditCardNo) || 
					org.apache.commons.lang.StringUtils.isAllLowerCase(expiryDate)) {
				new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
			}
			try {
				CreatePolicy finalizePolicy = gaService.finalizeHomeCarePolicy(userName, token, referenceNo,
						transactionNumber, transactionDate, creditCardNo, expiryDate, emailId, lang, paymentFail);
				if (finalizePolicy.getErrMsgs() == null) {
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
				} else {
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
					return new ModelAndView(UserRestURIConstants.getSitePath(request) + "error");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			session.setAttribute("referenceNo", referenceNo);
			model.addAttribute("utm_nooverride", 1);
			model.addAttribute("emailID", emailId);
			model.addAttribute("referenceNo", referenceNo);
			model.addAttribute("dueAmount", session.getAttribute("dueAmount"));
			
			return HomeLiabilityPageFlowControl.pageFlow(plan, model, request, UserRestURIConstants.PAGE_PROPERTIES_HOME_LIABILITY_CONFIRMATION);
		}
		return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
	}
	
}
