package com.ifwd.fwdhk.controller;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.model.CreatePolicy;
import com.ifwd.fwdhk.model.DistrictBean;
import com.ifwd.fwdhk.model.HomeCareDetailsBean;
import com.ifwd.fwdhk.model.HomeQuoteBean;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.services.GAService;
import com.ifwd.fwdhk.util.DateApi;
import com.ifwd.fwdhk.util.HomePageFlowControl;
import com.ifwd.fwdhk.util.InitApplicationMessage;
import com.ifwd.fwdhk.util.StringHelper;
import com.ifwd.fwdhk.util.WebServiceUtils;
@Controller
public class GAController extends BaseController{
	
	@Autowired
	private GAService gaService;
	
	private final static Logger logger = LoggerFactory.getLogger(GAController.class);
	
	@RequestMapping(value = {"/{lang}/household-insurance/{plan}"})
	public ModelAndView getInsurance(@PathVariable("plan") String plan, @RequestParam(required = false) final String promo, Model model, HttpServletRequest request) {
		if (StringUtils.hasText(promo)) {
			request.getSession().setAttribute("referralCode", promo);
		}else {
			request.getSession().removeAttribute("referralCode");
		}
		if(UserRestURIConstants.URL_HOME_LIABILITY_LANDING.equals(plan)) {
			return HomePageFlowControl.pageFlow(plan, model, request, UserRestURIConstants.PAGE_PROPERTIES_HOME_LIABILITY_LANDING);
		}else if(UserRestURIConstants.URL_EASY_HOME_LANDING.equals(plan)) {
			return HomePageFlowControl.pageFlow(plan, model, request, UserRestURIConstants.PAGE_PROPERTIES_EASY_HOME_LANDING);
		}
		return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/household-insurance/"+plan);
	}
	
	@RequestMapping(value = {"/{lang}/household-insurance/{plan}/screening"})
	public ModelAndView getScreening(@PathVariable("plan") String plan,Model model, HttpServletRequest request) {
		if(UserRestURIConstants.URL_HOME_LIABILITY_LANDING.equals(plan)) {
			return HomePageFlowControl.pageFlow(plan, model, request, UserRestURIConstants.PAGE_PROPERTIES_HOME_LIABILITY_SCREENING);
		}
		else if(UserRestURIConstants.URL_EASY_HOME_LANDING.equals(plan)) {
			return HomePageFlowControl.pageFlow(plan, model, request, UserRestURIConstants.PAGE_PROPERTIES_EASY_HOME_SCREENING);
		}
		return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/household-insurance/"+plan);
	}
	
	@RequestMapping(value = {"/{lang}/household-insurance/{plan}/quote"})
	public ModelAndView getQuote(@PathVariable("plan") String plan,Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("editableUserDetails");
		session.removeAttribute("editableHomeCareDetails");
		session.removeAttribute("policyNo");
		session.removeAttribute("theClubMembershipNo");
		session.removeAttribute("homeQuoteDetails");
		session.removeAttribute("confirm");
		session.removeAttribute("HomeCareTransactionNo");
		session.removeAttribute("HomeCareReferenceNo");
		session.removeAttribute("HomeCareTransactionDate");
		session.removeAttribute("transNo");
		session.removeAttribute("applicantDetails");
		session.removeAttribute("HomeCareCreditCardNo");
		session.removeAttribute("HomeCareCardexpiryDate");
		
		if(UserRestURIConstants.URL_HOME_LIABILITY_LANDING.equals(plan)) {
			return HomePageFlowControl.pageFlow(plan, model, request, UserRestURIConstants.PAGE_PROPERTIES_HOME_LIABILITY_SELECT_PLAN);
		}else if(UserRestURIConstants.URL_EASY_HOME_LANDING.equals(plan)){
			return HomePageFlowControl.pageFlow(plan, model, request, UserRestURIConstants.PAGE_PROPERTIES_EASY_HOME_SELECT_PLAN);
		}
		return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/household-insurance/"+plan);
	}
	
	@RequestMapping(value = {"/{lang}/household-insurance/{plan}/application"})
	public ModelAndView getUserDetails(@PathVariable("plan") String plan, 
			@ModelAttribute("planQuoteDetails") HomeQuoteBean homeQuoteDetails, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserDetails editableUserDetails = (UserDetails)session.getAttribute("editableUserDetails");
		HomeCareDetailsBean editableHomeCareDetails = (HomeCareDetailsBean)session.getAttribute("editableHomeCareDetails");
		
		String theClubMembershipNo = WebServiceUtils.getParameterValue("theClubMembershipNo", session, request);
		session.setAttribute("theClubMembershipNo", theClubMembershipNo);
		model.addAttribute("theClubMembershipNo", theClubMembershipNo);
		
		if(UserRestURIConstants.URL_HOME_LIABILITY_LANDING.equals(plan) || UserRestURIConstants.URL_EASY_HOME_LANDING.equals(plan)) {
			if(homeQuoteDetails == null || homeQuoteDetails.getTotalDue() == null){
				homeQuoteDetails = (HomeQuoteBean)session.getAttribute("homeQuoteDetails");
			}
			if(homeQuoteDetails == null || homeQuoteDetails.getTotalDue() == null) {
				return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/household-insurance/"+plan);
			}
			homeQuoteDetails.setReferralCode((String)session.getAttribute("referralCode"));
			session.setAttribute("homeQuoteDetails", homeQuoteDetails);
			String lang = UserRestURIConstants.getLanaguage(request);
			List<DistrictBean> districtList;
			Map<String, String> mapNetFloorArea;
			Map<String, String> mapArea;
			if(lang.equals("tc")) {
				districtList = InitApplicationMessage.districtCN;
				mapNetFloorArea = InitApplicationMessage.netFloorAreaCN;
				mapArea = InitApplicationMessage.areaCN;
			}else {
				districtList = InitApplicationMessage.districtEN;
				mapNetFloorArea = InitApplicationMessage.netFloorAreaEN;
				mapArea = InitApplicationMessage.areaEN;
			}
			
			
			model.addAttribute("homeQuoteDetails", homeQuoteDetails);
			model.addAttribute("districtList", districtList);
			model.addAttribute("mapNetFloorArea", mapNetFloorArea);
			model.addAttribute("mapArea", mapArea);
			model.addAttribute("plan", plan);
			model.addAttribute("editableUserDetails", editableUserDetails);
			model.addAttribute("editableHomeCareDetails", editableHomeCareDetails);
			
			if(UserRestURIConstants.URL_HOME_LIABILITY_LANDING.equals(plan)) {
				return HomePageFlowControl.pageFlow(plan, model, request, UserRestURIConstants.PAGE_PROPERTIES_HOME_LIABILITY_USER_DETAILS);
			}else {
				return HomePageFlowControl.pageFlow(plan, model, request, UserRestURIConstants.PAGE_PROPERTIES_EASY_HOME_USER_DETAILS);
			}
		}
		return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/household-insurance/"+plan);
	}
	
	@RequestMapping(value = {"/{lang}/household-insurance/{plan}/summary"})
	public ModelAndView getSummary(@PathVariable("plan") String plan,Model model, HttpServletRequest request) {
		if(UserRestURIConstants.URL_HOME_LIABILITY_LANDING.equals(plan) || UserRestURIConstants.URL_EASY_HOME_LANDING.equals(plan)) {
			HttpSession session = request.getSession();
			UserDetails userDetails = (UserDetails)session.getAttribute("applicantDetails");
			HomeCareDetailsBean homeCareDetails = (HomeCareDetailsBean)session.getAttribute("homeCareDetails");
			CreatePolicy confirm = (CreatePolicy)session.getAttribute("confirm");
			CreatePolicy createdPolicy = (CreatePolicy)session.getAttribute("createdPolicy");
			HomeQuoteBean homeQuoteDetails = (HomeQuoteBean)session.getAttribute("homeQuoteDetails");
			
			if(homeQuoteDetails == null || homeQuoteDetails.getTotalDue() == null) {
				return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/household-insurance/"+plan);
			}else if(createdPolicy == null || homeCareDetails == null) {
				return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/household-insurance/"+plan);
			}
			
			session.setAttribute("editableUserDetails", userDetails);
			session.setAttribute("editableHomeCareDetails", homeCareDetails);
			
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
			
			Map<String, String> mapArea;
			List<DistrictBean> districtList;
			Map<String, String> mapNetFloorArea;
			String lang = UserRestURIConstants.getLanaguage(request);
			if(lang.equals("tc")) {
				mapArea = InitApplicationMessage.areaCN;
				districtList = InitApplicationMessage.districtCN;
				mapNetFloorArea = InitApplicationMessage.netFloorAreaCN;
			}else {
				mapArea = InitApplicationMessage.areaEN;
				districtList = InitApplicationMessage.districtEN;
				mapNetFloorArea = InitApplicationMessage.netFloorAreaEN;
			}
			homeCareDetails.setApplicantDistrictDesc(WebServiceUtils.getDistrictDesc(districtList, homeCareDetails.getApplicantDistrict()));
			homeCareDetails.setApplicantAreaDesc(WebServiceUtils.getAreaDesc(mapArea, homeCareDetails.getApplicantArea()));
			homeCareDetails.setaDistrictDesc(WebServiceUtils.getDistrictDesc(districtList, homeCareDetails.getaDistrict()));
			homeCareDetails.setaAreaDesc(WebServiceUtils.getAreaDesc(mapArea, homeCareDetails.getaArea()));
			
			homeCareDetails.setNetFloorAreaDesc(WebServiceUtils.getNetFloorAreaDesc(mapNetFloorArea, homeCareDetails.getNetFloorArea()));
			
			model.addAttribute("effectiveDate", DateApi.pickDate1(homeCareDetails.getEffectiveDate()));
			model.addAttribute("effectiveEndDate", endDate);
			model.addAttribute("homeCareDetails", homeCareDetails);
			model.addAttribute("path", path.replace("summary", "confirmation?utm_nooverride=1"));
			model.addAttribute("failurePath", path + "?paymentGatewayFlag=true");
			
			String theClubMembershipNo = WebServiceUtils.getParameterValue("theClubMembershipNo", session, request);
			model.addAttribute("theClubMembershipNo", theClubMembershipNo);
			model.addAttribute("homeQuoteDetails", homeQuoteDetails);
			model.addAttribute("plan", plan);
			
			if(UserRestURIConstants.URL_HOME_LIABILITY_LANDING.equals(plan)) {
				return HomePageFlowControl.pageFlow(plan, model, request, UserRestURIConstants.PAGE_PROPERTIES_HOME_LIABILITY_SUMMARY);
			}else {
				return HomePageFlowControl.pageFlow(plan, model, request, UserRestURIConstants.PAGE_PROPERTIES_EASY_HOME_SUMMARY);
			}
		}
		return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/household-insurance/"+plan);
	}
	
	@RequestMapping(value = {"/{lang}/household-insurance/{plan}/confirmation"})
	public ModelAndView getConfirmation(@PathVariable("plan") String plan,Model model, HttpServletRequest request) {
		if(UserRestURIConstants.URL_HOME_LIABILITY_LANDING.equals(plan) || UserRestURIConstants.URL_EASY_HOME_LANDING.equals(plan)) {
			HttpSession session = request.getSession();
			String referenceNo = (String) session.getAttribute("HomeCareReferenceNo");
			String transactionNumber = (String) session.getAttribute("HomeCareTransactionNo");
			String transactionDate = (String) session.getAttribute("HomeCareTransactionDate");
			String creditCardNo = (String)session.getAttribute("HomeCareCreditCardNo");
			
			String expiryDate = (String) session.getAttribute("HomeCareCardexpiryDate");
			String emailId = (String) session.getAttribute("emailAddress");
			
			if(session.getAttribute("createdPolicy") == null && creditCardNo == null) {
				model.addAttribute("policyNo", StringHelper.emptyIfNull((String)session.getAttribute("policyNo")));
				model.addAttribute("emailAddress", session.getAttribute("emailAddress"));
				model.addAttribute("dueAmount", session.getAttribute("dueAmount"));
				model.addAttribute("referralCode", session.getAttribute("referralCode"));
				model.addAttribute("referenceNo", session.getAttribute("HomeCareReferenceNo"));
				if(UserRestURIConstants.URL_HOME_LIABILITY_LANDING.equals(plan)) {
					return HomePageFlowControl.pageFlow(plan, model, request, UserRestURIConstants.PAGE_PROPERTIES_HOME_LIABILITY_CONFIRMATION);
				}else {
					return HomePageFlowControl.pageFlow(plan, model, request, UserRestURIConstants.PAGE_PROPERTIES_EASY_HOME_CONFIRMATION);
				}
			}
			
			if(org.apache.commons.lang.StringUtils.isAllLowerCase(referenceNo) ||
					org.apache.commons.lang.StringUtils.isAllLowerCase(transactionNumber) ||
					org.apache.commons.lang.StringUtils.isAllLowerCase(transactionDate) || 
					org.apache.commons.lang.StringUtils.isAllLowerCase(creditCardNo) || 
					org.apache.commons.lang.StringUtils.isAllLowerCase(expiryDate)) {
				new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/household-insurance/"+plan);
			}
			new Thread(){
				public void run(){
					JSONObject result = new JSONObject();
					String paymentFail = "0";
					try {
						result = gaService.finalizeHomeCarePolicy(plan, paymentFail, request, session);
						model.addAttribute("policyNo", result.get("policyNo"));
					} catch (Exception e) {
						logger.info(e.getMessage());
						e.printStackTrace();
					}
				}
			}.start();
			model.addAttribute("utm_nooverride", 1);
			model.addAttribute("emailID", emailId);
			model.addAttribute("referenceNo", referenceNo);
			model.addAttribute("dueAmount", session.getAttribute("dueAmount"));
			model.addAttribute("plan", plan);
			
			if(UserRestURIConstants.URL_HOME_LIABILITY_LANDING.equals(plan)) {
				return HomePageFlowControl.pageFlow(plan, model, request, UserRestURIConstants.PAGE_PROPERTIES_HOME_LIABILITY_CONFIRMATION);
			}else {
				return HomePageFlowControl.pageFlow(plan, model, request, UserRestURIConstants.PAGE_PROPERTIES_EASY_HOME_CONFIRMATION);
			}
		}
		return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/household-insurance/"+plan);
	}
	
}
