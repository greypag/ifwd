package com.ifwd.fwdhk.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.common.document.PdfAttribute;
import com.ifwd.fwdhk.connector.ECommWsConnector;
import com.ifwd.fwdhk.connector.response.eliteterm.CreateEliteTermPolicyResponse;
import com.ifwd.fwdhk.connector.response.life.GetPolicyApplicationResponse;
import com.ifwd.fwdhk.connector.response.life.GetVulnerableCustomerResponse;
import com.ifwd.fwdhk.connector.response.life.PolicyApplication;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.OptionItemDesc;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.model.easyhealth.EasyHealthPlanDetailBean;
import com.ifwd.fwdhk.model.life.LifeBeneficaryInfoBean;
import com.ifwd.fwdhk.model.life.LifeDeclarationBean;
import com.ifwd.fwdhk.model.life.LifeEmploymentInfoBean;
import com.ifwd.fwdhk.model.life.LifePaymentBean;
import com.ifwd.fwdhk.model.life.LifePersonalDetailsBean;
import com.ifwd.fwdhk.model.life.ProductRecommendation;
import com.ifwd.fwdhk.model.life.SavieFnaBean;
import com.ifwd.fwdhk.model.life.SaviePlanDetailsBean;
import com.ifwd.fwdhk.services.LifeService;





import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.DateApi;
import com.ifwd.fwdhk.util.HeaderUtil;
import com.ifwd.fwdhk.util.InitApplicationMessage;
import com.ifwd.fwdhk.util.SavieOnlinePageFlowControl;
@Controller
public class LifeController extends BaseController{
	
	private final static Logger logger = LoggerFactory.getLogger(LifeController.class);
	
	@Autowired
	private RestServiceDao restService;
	@Autowired
	private LifeService savieOnlineService;
	@Autowired
	private CommonUtils commonUtils;
	
	@Autowired 
	protected ECommWsConnector connector;
	
	@Autowired
	protected HeaderUtil headerUtil;

	/*@RequestMapping(value = {"/{lang}/savings-insurance","/{lang}/savings-insurance/"})
	public ModelAndView getSavieOnlineLanding(Model model, HttpServletRequest request) {
		savieOnlineService.removeSavieOnlineSession(request);
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LANDING);
	}*/

	@RequestMapping(value = {"/savie", "/Savie", "/SAVIE"}, method = RequestMethod.GET)
	public RedirectView getSavieShortcut(Model model, HttpServletRequest request)
	{
		RedirectView rv = new RedirectView(request.getContextPath() + "/tc/savings-insurance?utm_source=Offline&utm_medium=referral&utm_campaign=Offline|SA|P1|");
		rv.setStatusCode(HttpStatus.MOVED_PERMANENTLY);
		return rv;
	}	

	/*
    @RequestMapping(value = {"/{lang}/savings-insurance/fna-test"})
    public ModelAndView getFnaTestPage(Model model, HttpServletRequest request, HttpSession httpSession) {
           return new ModelAndView(UserRestURIConstants.getSitePath(request) + "fna-test");
    }
    */	

	@RequestMapping(value = {"/{lang}/savings-insurance/regular-premium"})
	public ModelAndView getLanding(Model model, HttpServletRequest request, HttpSession httpSession) {
		savieOnlineService.removeSavieOnlineSession(request);
		String affiliate = (String) request.getParameter("affiliate");
		if(affiliate == null){
			affiliate = "";
		}
		
		String lang = UserRestURIConstants.getLanaguage(request);
		List<OptionItemDesc> savieAns;
		if(lang.equals("tc")){
			lang = "CN";
			savieAns=InitApplicationMessage.savieAnsCN;
		}else{
			savieAns=InitApplicationMessage.savieAnsEN;
		}
		model.addAttribute("savieAns", savieAns);
		model.addAttribute("affiliate", affiliate);
		return SavieOnlinePageFlowControl.pageFlow("savings-insurance",model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_REGULAR_PREMIUM);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance" ,"/{lang}/savings-insurance/single-premium"})
	public ModelAndView o2OLanding(Model model, HttpServletRequest request, HttpSession httpSession) {
		savieOnlineService.removeSavieOnlineSession(request);
		String affiliate = (String) request.getParameter("affiliate");
		if(affiliate == null){
			affiliate = "";
		}
		
		String lang = UserRestURIConstants.getLanaguage(request);
		List<OptionItemDesc> savieAns;
		if(lang.equals("tc")){
			lang = "CN";
			savieAns=InitApplicationMessage.savieAnsCN;
		}else{
			savieAns=InitApplicationMessage.savieAnsEN;
		}
		model.addAttribute("savieAns", savieAns);
		model.addAttribute("affiliate", affiliate);
		return SavieOnlinePageFlowControl.pageFlow("savings-insurance",model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_SINGLE_PREMIUM);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/plan-details-rp", "/{lang}/savings-insurance/plan-details-sp"})
	public ModelAndView getSavieOnlinePlandetails(Model model, HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		String current = request.getServletPath();
		String OG_META_KEY = "";
		String plan = "";
		if(current.endsWith(UserRestURIConstants.PAGE_SAVIEONLINE_PLANDETAILS_RP)) {
			httpSession.setAttribute("savieType", "RP");
			OG_META_KEY = UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_REGULAR_PREMIUM;
			plan = "savings-insurance";
		}else {
			httpSession.setAttribute("savieType", "SP");
			OG_META_KEY = UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_SINGLE_PREMIUM;
			plan = "savings-insurance";
		}
		Date date = new Date();
		Calendar startDOB = new GregorianCalendar();
		startDOB.setTime(date); 
		startDOB.add(startDOB.YEAR, -70);
		startDOB.add(startDOB.DATE, 1);
		model.addAttribute("startDOB", DateApi.formatString(startDOB.getTime()));
		Calendar defaultDOB = new GregorianCalendar();
		Date date1 = new Date();
		String type = request.getParameter("type");
		String backSummary=request.getParameter("backSummary");
		model.addAttribute("type", type);
		model.addAttribute("backSummary", backSummary);
		if("2".equals(type)){
			request.getSession().setAttribute("type", type);
			SavieFnaBean savieFna = (SavieFnaBean) request.getSession().getAttribute("savieFna");
			date1 = DateApi.formatDate(savieFna.getDob());
			
			SaviePlanDetailsBean saviePlanDetails = (SaviePlanDetailsBean) request.getSession().getAttribute("saviePlanDetails");
			//logger.info(saviePlanDetails.getInsuredAmount());
			model.addAttribute("sliderMin", "30000");
			String sliderValue = "100000";
			if (Integer.parseInt(savieFna.getQ4_b_amount().replace(",", ""))>400000){
				model.addAttribute("sliderMax", "400000");
				if (request.getSession().getAttribute("saviePlanDetails")!=null){
					sliderValue = saviePlanDetails.getInsuredAmount();
				}
			} else {
				model.addAttribute("sliderMax", savieFna.getQ4_b_amount().replace(",", ""));
				if (request.getSession().getAttribute("saviePlanDetails")!=null) {
					if (Integer.parseInt(savieFna.getQ4_b_amount().replace(",", ""))<=Integer.parseInt(saviePlanDetails.getInsuredAmount())){
						sliderValue = savieFna.getQ4_b_amount().replace(",", "");
					} else {
						sliderValue = saviePlanDetails.getInsuredAmount();
					}
				} else {
					sliderValue = savieFna.getQ4_b_amount().replace(",", "");
				}
			}
			if (request.getSession().getAttribute("saviePlanDetails")!=null){
				
				model.addAttribute("promoCode", saviePlanDetails.getPromoCode());
			}else{
				model.addAttribute("promoCode", "");
			}
			logger.info(sliderValue.replace(",", ""));
			model.addAttribute("sliderValue", sliderValue.replace(",", ""));
			defaultDOB.setTime(date1);
		}else if("3".equals(type)){
			SaviePlanDetailsBean saviePlanDetails = (SaviePlanDetailsBean) request.getSession().getAttribute("saviePlanDetails");
			try {
				GetPolicyApplicationResponse apiResponse = savieOnlineService.getPolicyApplicationSaveforLater(request);
				
				PolicyApplication policyApplication = apiResponse.getPolicyApplication();
				
				if (saviePlanDetails != null) {
					if (policyApplication != null) {
						saviePlanDetails.setPromoCode(policyApplication.getReferralCode());
						model.addAttribute("promoCode", saviePlanDetails.getPromoCode());
						request.getSession().setAttribute("promoCode", saviePlanDetails.getPromoCode());
						
					}
					
				}
				
				
				
			} catch (ECOMMAPIException e) {
				e.printStackTrace();
				logger.error(e.getMessage());
			}
			/*if (request.getSession().getAttribute("saviePlanDetails")!=null){
				model.addAttribute("promoCode", saviePlanDetails.getPromoCode());
			}else{
				model.addAttribute("promoCode", "");
			}*/
			
			
			model.addAttribute("type", type);
			request.getSession().setAttribute("savieType", "SP");
			model.addAttribute("sliderMin", "30000");
			model.addAttribute("sliderMax", "400000");
			model.addAttribute("sliderValue", "100000");
		}else {
			model.addAttribute("sliderMin", "30000");
			model.addAttribute("sliderMax", "400000");
			model.addAttribute("sliderValue", "100000");
			defaultDOB.setTime(date1); 
			defaultDOB.add(defaultDOB.YEAR, -18);
		}
		model.addAttribute("defaultDOB", DateApi.formatString(defaultDOB.getTime()));
		return SavieOnlinePageFlowControl.pageFlow(plan,model,request, OG_META_KEY);
	}
	
	@RequestMapping(value = {"/{lang}/FNA/financial-needs-analysis"}) 
	public ModelAndView getSavieOnlineFna(Model model, HttpServletRequest request) {
		String userName = (String)request.getSession().getAttribute("username");
		if(userName == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		} else if (userName.equalsIgnoreCase("*DIRECTGI")) {
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
//		SaviePlanDetailsBean saviePlanDetails = (SaviePlanDetailsBean) request.getSession().getAttribute("saviePlanDetails");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
//		else if(saviePlanDetails == null || saviePlanDetails.getInsuredAmount() == null){
//			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
//		}
		else{
			SavieFnaBean savieFna = (SavieFnaBean) request.getSession().getAttribute("savieFna");
			
			model.addAttribute("employmentStatusEN", InitApplicationMessage.employmentStatusEN);
			model.addAttribute("employmentStatusCN", InitApplicationMessage.employmentStatusCN);
			
			model.addAttribute("natureOfBusinessEN", InitApplicationMessage.natureOfBusinessEN);
			model.addAttribute("natureOfBusinessCN", InitApplicationMessage.natureOfBusinessCN);

			model.addAttribute("nob_occListEN", InitApplicationMessage.nob_occListEN);
			model.addAttribute("nob_occListCN", InitApplicationMessage.nob_occListCN);

			model.addAttribute("etEducationLevelEN", InitApplicationMessage.etEducationLevelEN);
			model.addAttribute("etEducationLevelCN", InitApplicationMessage.etEducationLevelCN);
			
			try {
				savieOnlineService.getFna(request);
			}
			catch (ECOMMAPIException e) {}
			
			if(request.getSession().getAttribute("savieFna")!=null){
				return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/FNA/review");
			} else {
				return SavieOnlinePageFlowControl.pageFlow("savings-insurance",model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_FNA);
			}
		}
		
	}
	
	@RequestMapping(value = {"/{lang}/FNA/review"}) 
	public ModelAndView getSavieOnlinepReview(Model model, HttpServletRequest request) {
		String userName = (String)request.getSession().getAttribute("username");
		if(userName == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		} else if (userName.equalsIgnoreCase("*DIRECTGI")) {
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		//SaviePlanDetailsBean saviePlanDetails = (SaviePlanDetailsBean) request.getSession().getAttribute("saviePlanDetails");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
//		else if(saviePlanDetails == null || saviePlanDetails.getInsuredAmount() == null){
//			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
//		}
		else{
			SavieFnaBean savieFna = (SavieFnaBean) request.getSession().getAttribute("savieFna");
			
			model.addAttribute("employmentStatusEN", InitApplicationMessage.employmentStatusEN);
			model.addAttribute("employmentStatusCN", InitApplicationMessage.employmentStatusCN);
			
			model.addAttribute("natureOfBusinessEN", InitApplicationMessage.natureOfBusinessEN);
			model.addAttribute("natureOfBusinessCN", InitApplicationMessage.natureOfBusinessCN);

			model.addAttribute("nob_occListEN", InitApplicationMessage.nob_occListEN);
			model.addAttribute("nob_occListCN", InitApplicationMessage.nob_occListCN);

			model.addAttribute("etEducationLevelEN", InitApplicationMessage.etEducationLevelEN);
			model.addAttribute("etEducationLevelCN", InitApplicationMessage.etEducationLevelCN);

			return SavieOnlinePageFlowControl.pageFlow("savings-insurance",model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_PRODUCT);
		}
	}
	
	@RequestMapping(value = {"/{lang}/FNA/product-recommendation"}) 
	public ModelAndView getSavieOnlinepProduct(Model model, HttpServletRequest request) {
		String userName = (String)request.getSession().getAttribute("username");
		if(userName == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		} else if (userName.equalsIgnoreCase("*DIRECTGI")) {
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		SavieFnaBean savieFna = (SavieFnaBean) request.getSession().getAttribute("savieFna");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		else if(savieFna == null || savieFna.getGender() == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		else{
			model.addAttribute("etCsContactPreferredDayEN", InitApplicationMessage.etCsContactPreferredDayEN);
			model.addAttribute("etCsContactPreferredDayCN", InitApplicationMessage.etCsContactPreferredDayCN);
			model.addAttribute("etCsContactPreferredTimeSlotEN", InitApplicationMessage.etCsContactPreferredTimeSlotEN);
			model.addAttribute("etCsContactPreferredTimeSlotCN", InitApplicationMessage.etCsContactPreferredTimeSlotCN);
			model.addAttribute("etEnquiryTypeEN", InitApplicationMessage.etEnquiryTypeEN);
			model.addAttribute("etEnquiryTypeCN", InitApplicationMessage.etEnquiryTypeCN);
			return SavieOnlinePageFlowControl.pageFlow("savings-insurance",model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_PRODUCT);
		}
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/sales-illustration"})
	public ModelAndView getSavieOnlineSalesIllustration(Model model, HttpServletRequest request) {
		String userName = (String)request.getSession().getAttribute("username");
		if(userName == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		} else if (userName.equalsIgnoreCase("*DIRECTGI")) {
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		SaviePlanDetailsBean saviePlanDetails = (SaviePlanDetailsBean) request.getSession().getAttribute("saviePlanDetails");
		//test
		logger.debug("paymentType=" + saviePlanDetails.getPaymentType());
		logger.debug("promoCode=" + saviePlanDetails.getPromoCode());
		logger.debug("insuredAmount=" + saviePlanDetails.getInsuredAmount());
		//
		if ("SP".equals(saviePlanDetails.getPaymentType())) {
			JSONObject jsonObject = new JSONObject();
			//request.setAttribute("planCode", "SAVIE-SP");
			//request.setAttribute("referralCode", saviePlanDetails.getPromoCode());
			//request.setAttribute("sumInsured", saviePlanDetails.getInsuredAmount());
			try {
				jsonObject=savieOnlineService.getSavieReferralDiscountParams("SAVIE-SP",saviePlanDetails.getPromoCode(),saviePlanDetails.getInsuredAmount(),userDetails.getHkid(),request);
				logger.debug("lifecontroller referral discount=" + (String) jsonObject.get("value"));
				saviePlanDetails.setInsuredAmountDiscount((String) jsonObject.get("value")); 
				saviePlanDetails.setInsuredAmountDue(String.valueOf(Integer.valueOf(saviePlanDetails.getInsuredAmount()) - Integer.valueOf((String) jsonObject.get("value"))));
				request.getSession().setAttribute("saviePlanDetails", saviePlanDetails);
			}
			catch (Exception e) {
				logger.info(e.getMessage(),e);
				request.getSession().setAttribute("errorMsg", e.getMessage());
			}

		}
		
		
		//test
		SavieFnaBean savieFna = (SavieFnaBean) request.getSession().getAttribute("savieFna");
		ProductRecommendation productRecommendation = (ProductRecommendation) request.getSession().getAttribute("productRecommendation");
		
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		else if(saviePlanDetails == null || saviePlanDetails.getInsuredAmount() == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		else if(savieFna == null || savieFna.getGender() == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		else if(productRecommendation == null || productRecommendation.getProduct_list() == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		else{
			try {
				savieOnlineService.createSalesIllustrationPdf("1",request);
			}
			catch (Exception e) {
				logger.info(e.getMessage(),e);
				request.getSession().setAttribute("errorMsg", e.getMessage());
			}
			return SavieOnlinePageFlowControl.pageFlow("savings-insurance",model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_SALES_ILLUSTRATION);
		}
	}
	
	@RequestMapping(value = {"/{lang}/{plan}/fatca"})
	public ModelAndView getSavieOnlineLifeFatca(@PathVariable("plan") String plan,Model model, HttpServletRequest request) {
		String userName = (String)request.getSession().getAttribute("username");
		if(userName == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
		} else if (userName.equalsIgnoreCase("*DIRECTGI")) {
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
		}
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		String underwritingYes = (String) request.getSession().getAttribute("underwritingYes");
		String salesIllustrationJpgName = (String) request.getSession().getAttribute("salesIllustrationJpgName");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
		}
		else if("savings-insurance".equals(plan) && salesIllustrationJpgName == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		else if("medical-insurance".equals(plan) && underwritingYes == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
		}
		else{
			request.getSession().setAttribute("fatcaYes", "fatcaYes");
			if("savings-insurance".equals(plan)) {
				return SavieOnlinePageFlowControl.pageFlow(plan,model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LIFE_FATCA);
			} else {
				return SavieOnlinePageFlowControl.pageFlow(plan,model,request, UserRestURIConstants.PAGE_PROPERTIES_EASYHEALTHONLINE_LIFE_FATCA);
			}
				
			
		}
	}
	
	@RequestMapping(value = {"/{lang}/{plan}/personal-details"})
	public ModelAndView getSavieOnlineLifePersonalDetails(@PathVariable("plan") String plan,Model model, HttpServletRequest request) {
		String userName = (String)request.getSession().getAttribute("username");
		if(userName == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
		} else if (userName.equalsIgnoreCase("*DIRECTGI")) {
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
		}
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		String fatcaYes = (String) request.getSession().getAttribute("fatcaYes");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
		}
		else if(fatcaYes == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
		}
		else{
			model.addAttribute("maritalStatusesEN", InitApplicationMessage.maritalStatusesEN);
			model.addAttribute("maritalStatusesCN", InitApplicationMessage.maritalStatusesCN);
			model.addAttribute("placeOfBirthEN", InitApplicationMessage.placeOfBirthEN);
			model.addAttribute("placeOfBirthCN", InitApplicationMessage.placeOfBirthCN);
			model.addAttribute("nationalityEN", InitApplicationMessage.nationalityEN);
			model.addAttribute("nationalityCN", InitApplicationMessage.nationalityCN);
			model.addAttribute("savieDistrictEN", InitApplicationMessage.savieDistrictEN);
			model.addAttribute("savieDistrictCN", InitApplicationMessage.savieDistrictCN);

			
			String backSummary = request.getParameter("backSummary");
			if(backSummary!=null && "Y".equals(backSummary)){
				model.addAttribute("backSummary", backSummary);
			}
			if("medical-insurance".equals(plan)){
				SavieFnaBean savieFna = new SavieFnaBean();
				savieFna.setName(userDetails.getFullName());
				savieFna.setUser_name(userDetails.getFullName());
				EasyHealthPlanDetailBean ehPlanDetail = (EasyHealthPlanDetailBean) request.getSession().getAttribute("ehPlanDetail");
				savieFna.setGender(ehPlanDetail.getGender());
				request.getSession().setAttribute("savieFna", savieFna);
			}
			model.addAttribute("plan", plan);
			if("medical-insurance".equals(plan)){
				return SavieOnlinePageFlowControl.pageFlow(plan,model,request, UserRestURIConstants.PAGE_PROPERTIES_EASYHEALTH_PERSONAL_DETAILS);
			}
			else{
				return SavieOnlinePageFlowControl.pageFlow(plan,model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LIFE_PERSONAL_DETAILS);
			}
		}
	}
	
	@RequestMapping(value = {"/{lang}/{plan}/employment-info"})
	public ModelAndView getSavieOnlineLifeEmploymentInfo(@PathVariable("plan") String plan,Model model, HttpServletRequest request) {
		String userName = (String)request.getSession().getAttribute("username");
		if(userName == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
		} else if (userName.equalsIgnoreCase("*DIRECTGI")) {
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
		}
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		LifePersonalDetailsBean lifePersonalDetails = (LifePersonalDetailsBean) request.getSession().getAttribute("lifePersonalDetails");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
		}
		else if(lifePersonalDetails == null || lifePersonalDetails.getFirstname() == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
		}
		else{
			SavieFnaBean savieFna = (SavieFnaBean) request.getSession().getAttribute("savieFna");
			
			model.addAttribute("employmentStatusEN", InitApplicationMessage.employmentStatusEN);
			model.addAttribute("employmentStatusCN", InitApplicationMessage.employmentStatusCN);
			if(savieFna!=null && savieFna.getNature_of_business() !=null && savieFna.getNature_of_business()!=""){
				model.addAttribute("occupationEN", InitApplicationMessage.getOccupationByNob(commonUtils,savieFna.getNature_of_business(), "EN", "1", request));
				model.addAttribute("occupationCN", InitApplicationMessage.getOccupationByNob(commonUtils,savieFna.getNature_of_business(), "CH", "1", request));
			}
			model.addAttribute("natureOfBusinessEN", InitApplicationMessage.natureOfBusinessEN);
			model.addAttribute("natureOfBusinessCN", InitApplicationMessage.natureOfBusinessCN);
			
			model.addAttribute("etCsContactPreferredDayEN", InitApplicationMessage.etCsContactPreferredDayEN);
			model.addAttribute("etCsContactPreferredDayCN", InitApplicationMessage.etCsContactPreferredDayCN);
			model.addAttribute("etCsContactPreferredTimeSlotEN", InitApplicationMessage.etCsContactPreferredTimeSlotEN);
			model.addAttribute("etCsContactPreferredTimeSlotCN", InitApplicationMessage.etCsContactPreferredTimeSlotCN);
			model.addAttribute("etEnquiryTypeEN", InitApplicationMessage.etEnquiryTypeEN);
			model.addAttribute("etEnquiryTypeCN", InitApplicationMessage.etEnquiryTypeCN);
			model.addAttribute("etEducationLevelEN", InitApplicationMessage.etEducationLevelEN);
			model.addAttribute("etEducationLevelCN", InitApplicationMessage.etEducationLevelCN);
			
			String backSummary = request.getParameter("backSummary");
			if(backSummary!=null && "Y".equals(backSummary)){
				model.addAttribute("backSummary", backSummary);
			}
			LifeEmploymentInfoBean lifeEmploymentInfo = (LifeEmploymentInfoBean) request.getSession().getAttribute("lifeEmploymentInfo");
			if(lifeEmploymentInfo!=null && lifeEmploymentInfo.getNatureOfBusiness() !=null && lifeEmploymentInfo.getNatureOfBusiness()!=""){
				model.addAttribute("occupationEN", InitApplicationMessage.getOccupationByNob(commonUtils,lifeEmploymentInfo.getNatureOfBusiness(), "EN", "1", request));
				model.addAttribute("occupationCN", InitApplicationMessage.getOccupationByNob(commonUtils,lifeEmploymentInfo.getNatureOfBusiness(), "CH", "1", request));
			}
			
			String code = null;
			String codeO = null;
			String liquidAssets = null;
			if(savieFna!=null && savieFna.getQ4_b_amount() != null && !savieFna.getQ4_b_amount().equals("")){
				int liquidAssetsAmt = Integer.valueOf(savieFna.getQ4_b_amount().replace(",", ""));
				if(liquidAssetsAmt<=10000){
					liquidAssets = "LA1";
				}
				else if (liquidAssetsAmt>10000&&liquidAssetsAmt<=50000){
					liquidAssets = "LA2";
				}
				else if (liquidAssetsAmt>50000&&liquidAssetsAmt<=100000){
					liquidAssets = "LA3";
				}
				else{
					liquidAssets = "LA4";						
				}
				if(savieFna.getQ4_a_others()!=null && savieFna.getQ4_a_others()!=""){
					int money = Integer.valueOf(savieFna.getQ4_a_others().replace(",", ""));
					
					if(money<=10000){
						code = "mpi1";
						codeO = "AOS1";
					}
					else if(money>=10001&&money<=15000){
						code = "mpi2";
						codeO = "AOS2";
					}
					else if(money>=15001&&money<=20000){
						code = "mpi3";
						codeO = "AOS3";
					}
					else if(money>=20001&&money<=25000){
						code = "mpi4";
						codeO = "AOS4";
					}
					else if(money>=25001&&money<=30000){
						code = "mpi5";
						codeO = "AOS5";
					}
					else if(money>=30001&&money<=40000){
						code = "mpi6";
						codeO = "AOS6";
					}
					else if(money>=40001&&money<=55000){
						code = "mpi7";
						codeO = "AOS7";
					}
					else if(money>=55001){
						code = "mpi8";
						codeO = "AOS8";
					}
				}
				else if("0".equals(savieFna.getQ4_a())){
					code = "mpi1";
					codeO = "AOS1";
				}
				else if("1".equals(savieFna.getQ4_a())){
					code = "mpi1,mpi2,mpi3";
					codeO = "AOS1,AOS2,AOS3";
				}
				else if("2".equals(savieFna.getQ4_a())){
					code = "mpi3,mpi4,mpi5,mpi6,mpi7";
					codeO = "AOS3,AOS4,AOS5,AOS6,AOS7";
				}
				else if("3".equals(savieFna.getQ4_a())){
					code = "mpi7,mpi8";
					codeO = "AOS7,AOS8";
				}
				else if("4".equals(savieFna.getQ4_a())){
					code = "mpi8";
					codeO = "AOS8";
				}
			}
			List<OptionItemDesc> monthlyPersonalIncomeEN = new ArrayList<OptionItemDesc>();
			List<OptionItemDesc> monthlyPersonalIncomeCN = new ArrayList<OptionItemDesc>();
			if(code!=null && code!=""){
				String[] str = code.split(",");
				if(str!=null && str.length>0){
					for(int i=0;i<str.length;i++){
						for(int j=0;j<InitApplicationMessage.monthlyPersonalIncomeEN.size();j++){
							OptionItemDesc optionEn = InitApplicationMessage.monthlyPersonalIncomeEN.get(j);
							OptionItemDesc optionCn = InitApplicationMessage.monthlyPersonalIncomeCN.get(j);
							if(str[i].equals(optionEn.getItemCode())){
								monthlyPersonalIncomeEN.add(optionEn);
								monthlyPersonalIncomeCN.add(optionCn);
							}
						}
					}
				}
			}
			else{
				monthlyPersonalIncomeEN = InitApplicationMessage.monthlyPersonalIncomeEN;
				monthlyPersonalIncomeCN = InitApplicationMessage.monthlyPersonalIncomeCN;
			}
			model.addAttribute("monthlyPersonalIncomeEN", monthlyPersonalIncomeEN);
			model.addAttribute("monthlyPersonalIncomeCN", monthlyPersonalIncomeCN);
			
			List<OptionItemDesc> etAmountOtherSourceEN = new ArrayList<OptionItemDesc>();
			List<OptionItemDesc> etAmountOtherSourceCN = new ArrayList<OptionItemDesc>();
			if(codeO!=null && codeO!=""){
				String[] str = codeO.split(",");
				if(str!=null && str.length>0){
					for(int i=0;i<str.length;i++){
						for(int j=0;j<InitApplicationMessage.etAmountOtherSourceEN.size();j++){
							OptionItemDesc optionEn = InitApplicationMessage.etAmountOtherSourceEN.get(j);
							OptionItemDesc optionCn = InitApplicationMessage.etAmountOtherSourceCN.get(j);
							if(str[i].equals(optionEn.getItemCode())){
								etAmountOtherSourceEN.add(optionEn);
								etAmountOtherSourceCN.add(optionCn);
							}
						}
					}
				}
			}
			else{
				etAmountOtherSourceEN = InitApplicationMessage.etAmountOtherSourceEN;
				etAmountOtherSourceCN = InitApplicationMessage.etAmountOtherSourceCN;
			}
			model.addAttribute("etAmountOtherSourceEN", etAmountOtherSourceEN);
			model.addAttribute("etAmountOtherSourceCN", etAmountOtherSourceCN);

			List<OptionItemDesc> liquidAssetsEN = new ArrayList<OptionItemDesc>();
			List<OptionItemDesc> liquidAssetsCN = new ArrayList<OptionItemDesc>();
			if(liquidAssets!=null && liquidAssets!=""){
				for(int j=0;j<InitApplicationMessage.etLiquidAssetEN.size();j++){
					OptionItemDesc optionEn = InitApplicationMessage.etLiquidAssetEN.get(j);
					OptionItemDesc optionCn = InitApplicationMessage.etLiquidAssetCN.get(j);
					if(liquidAssets.equals(optionEn.getItemCode())){
						liquidAssetsEN.add(optionEn);
						liquidAssetsCN.add(optionCn);
					}
				}
			}
			else{
				liquidAssetsEN = InitApplicationMessage.etLiquidAssetEN;
				liquidAssetsCN = InitApplicationMessage.etLiquidAssetCN;
			}
			model.addAttribute("etLiquidAssetEN", liquidAssetsEN);
			model.addAttribute("etLiquidAssetCN", liquidAssetsCN);
			
			model.addAttribute("plan", plan);
			if("medical-insurance".equals(plan)){
				return SavieOnlinePageFlowControl.pageFlow(plan,model,request, UserRestURIConstants.PAGE_PROPERTIES_EASYHEALTH_EMPLOYMENT_INFO);
			}
			else{
				return SavieOnlinePageFlowControl.pageFlow(plan,model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LIFE_EMPLOYMENT_INFO);
			}
		}
	}
	
	@RequestMapping(value = {"/{lang}/{plan}/beneficiary-info"})
	public ModelAndView getSavieOnlineLifeBeneficaryInfo(@PathVariable("plan") String plan,Model model, HttpServletRequest request) {
		String userName = (String)request.getSession().getAttribute("username");
		if(userName == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
		} else if (userName.equalsIgnoreCase("*DIRECTGI")) {
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
		}
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		LifeEmploymentInfoBean lifeEmploymentInfo = (LifeEmploymentInfoBean) request.getSession().getAttribute("lifeEmploymentInfo");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
		}
		else if(lifeEmploymentInfo == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
		}
		else{
			model.addAttribute("savieBeneficiaryRelationshipEN", InitApplicationMessage.lifeBeneficiaryRelationshipEN);
			model.addAttribute("savieBeneficiaryRelationshipCN", InitApplicationMessage.lifeBeneficiaryRelationshipCN);
			
			String backSummary = request.getParameter("backSummary");
			if(backSummary!=null && "Y".equals(backSummary)){
				model.addAttribute("backSummary", backSummary);
			}
			model.addAttribute("plan", plan);
			if("medical-insurance".equals(plan)){
				return SavieOnlinePageFlowControl.pageFlow(plan,model,request, UserRestURIConstants.PAGE_PROPERTIES_EASYHEALTH_BENEFICARY_INFO);
			}
			else{
				return SavieOnlinePageFlowControl.pageFlow(plan,model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LIFE_BENEFICARY_INFO);
			}
		}
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/payment"})
	public ModelAndView getSavieOnlineLifePayment(Model model, HttpServletRequest request) {
		String userName = (String)request.getSession().getAttribute("username");
		if(userName == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		} else if (userName.equalsIgnoreCase("*DIRECTGI")) {
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		LifeBeneficaryInfoBean lifeBeneficaryInfo = (LifeBeneficaryInfoBean) request.getSession().getAttribute("lifeBeneficaryInfo");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		else if(lifeBeneficaryInfo == null || lifeBeneficaryInfo.getIsOwnEstate() == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		else{
			model.addAttribute("bankCodeEN", InitApplicationMessage.bankCodeEN);
			model.addAttribute("bankCodeCN", InitApplicationMessage.bankCodeCN);
			
			String backSummary = request.getParameter("backSummary");
			if(backSummary!=null && "Y".equals(backSummary)){
				model.addAttribute("backSummary", backSummary);
			}
			
			LifePaymentBean lifePayment = (LifePaymentBean) request.getSession().getAttribute("lifePayment");
			if(lifePayment!=null && lifePayment.getBankCode()!=null && !"".equals(lifePayment.getBankCode())){
				try {
					model.addAttribute("branchCodeEN", savieOnlineService.getBranchCode(lifePayment.getBankCode(), request));
					model.addAttribute("branchCodeCN", savieOnlineService.getBranchCode(lifePayment.getBankCode(), request));
				} 
				catch (ECOMMAPIException e) {
					logger.info(e.getMessage());
					model.addAttribute("branchCodeEN", InitApplicationMessage.branchCodeEN);
					model.addAttribute("branchCodeCN", InitApplicationMessage.branchCodeCN);
				}
			}
			else{
				model.addAttribute("branchCodeEN", InitApplicationMessage.branchCodeEN);
				model.addAttribute("branchCodeCN", InitApplicationMessage.branchCodeCN);
			}
			//
			SaviePlanDetailsBean saviePlanDetails = (SaviePlanDetailsBean) request.getSession().getAttribute("saviePlanDetails");
			LifePersonalDetailsBean lifePersonalDetails = (LifePersonalDetailsBean) request.getSession().getAttribute("lifePersonalDetails");
			//0 = NORMAL, 1 = CAMPAIGN 1111, 2 = CNY LUCKY DRAW, 3 = CNY PROMOTION
			
			model.addAttribute("campaignTypeId", 0);
			
			
			if ("SP".equals(saviePlanDetails.getPaymentType())) {
				JSONObject jsonObject = new JSONObject();
				try {
					//jsonObject=savieOnlineService.getSavieReferralDiscountParams("SAVIE-SP",saviePlanDetails.getPromoCode(),saviePlanDetails.getInsuredAmount(),userDetails.getHkid(),request);
			    	jsonObject=savieOnlineService.getSavieReferralDiscountParams("SAVIE-SP",saviePlanDetails.getPromoCode(),saviePlanDetails.getInsuredAmount(), lifePersonalDetails.getHkid(),request);
			    	JSONArray jsonArray=(JSONArray) jsonObject.get("referralPlan");
			    	if(jsonArray.get(0).equals("SAVIE PREMIUM DISCOUNT")){
			    		if(jsonArray.size()>1){
			    			if (((String) jsonArray.get(1)).equals("FWD 1111 CAMPAIGN")){
			    				model.addAttribute("campaignTypeId", 1);
			    			} else if (((String) jsonArray.get(1)).equals("2017 CNY Campaign Savie $2,888")){
			    				model.addAttribute("campaignTypeId", 2);
			    			} else if (((String) jsonArray.get(1)).equals("2017 CNY Campaign Savie $888")){
			    				model.addAttribute("campaignTypeId", 2);
			    			} else if (((String) jsonArray.get(1)).equals("2017 CNY Campaign Savie $300")){
			    				model.addAttribute("campaignTypeId", 3);
			    			} else if (((String) jsonArray.get(1)).equals("Savie FWDiscover Campaign $300")){
			    				model.addAttribute("campaignTypeId", 4);
			    			}
			    		}
			    	}
				}
				catch (Exception e) {
					logger.info(e.getMessage(),e);
					request.getSession().setAttribute("errorMsg", e.getMessage());
				}

			}
			
			//
			HttpSession session = request.getSession();
			if(StringUtils.isNotBlank((String)session.getAttribute("username"))){
				try {
					savieOnlineService.getCustomerServiceCentre(model, request, session, "2");
				} catch (Exception e) {
					logger.info(e.getMessage());
				}
				return SavieOnlinePageFlowControl.pageFlow("savings-insurance",model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LIFE_PAYMENT);
			}else {
				return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request)
						+ "/savings-insurance");
			}
		}
	}
	
	@RequestMapping(value = {"/{lang}/{plan}/application-summary"})
	public ModelAndView getSavieOnlineLifePolicySummary(@PathVariable("plan") String plan,Model model, HttpServletRequest request) {
		String userName = (String)request.getSession().getAttribute("username");
		if(userName == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
		} else if (userName.equalsIgnoreCase("*DIRECTGI")) {
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
		}
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		LifePaymentBean lifePayment = (LifePaymentBean) request.getSession().getAttribute("lifePayment");
		LifeBeneficaryInfoBean lifeBeneficaryInfo = (LifeBeneficaryInfoBean) request.getSession().getAttribute("lifeBeneficaryInfo");
		
		
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
		}
		else if("savings-insurance".equals(plan) && (lifePayment == null || lifePayment.getAccountNumber() == null)){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
		}
		else if("medical-insurance".equals(plan) && lifeBeneficaryInfo == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
		}
		else{
			model.addAttribute("plan", plan);
			request.getSession().setAttribute("applicationSummaryYes", "applicationSummaryYes");
			if("medical-insurance".equals(plan)){
				return SavieOnlinePageFlowControl.pageFlow(plan,model,request, UserRestURIConstants.PAGE_PROPERTIES_EASYHEALTH_POLICY_SUMMARY);
			}
			else{
				return SavieOnlinePageFlowControl.pageFlow(plan,model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LIFE_POLICY_SUMMARY);
			}
		}
	}
	
	@RequestMapping(value = {"/{lang}/{plan}/declaration"})
	public ModelAndView getSavieOnlineLifeDeclaration(@PathVariable("plan") String plan,Model model, HttpServletRequest request) {
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		String applicationSummaryYes = (String) request.getSession().getAttribute("applicationSummaryYes");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
		}
		else if(applicationSummaryYes == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
		}
		else{
			model.addAttribute("plan", plan);
			if("medical-insurance".equals(plan)){
				return SavieOnlinePageFlowControl.pageFlow(plan,model,request, UserRestURIConstants.PAGE_PROPERTIES_EASYHEALTH_DECLARATION);
			}
			else{
				return SavieOnlinePageFlowControl.pageFlow(plan,model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LIFE_DECLARATION);
			}
		}
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/signature"})
	public ModelAndView getSavieOnlineLifeSignature(Model model, HttpServletRequest request,HttpSession session) {
		String userName = (String)request.getSession().getAttribute("username");
		if(userName == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		} else if (userName.equalsIgnoreCase("*DIRECTGI")) {
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		
		
		LifeDeclarationBean lifeDeclaration = (LifeDeclarationBean) request.getSession().getAttribute("lifeDeclaration");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		else if(lifeDeclaration == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		else{
			try {
				model.addAttribute("signatureFileSize", InitApplicationMessage.signatureFileSize);
				
				if(StringUtils.isNotBlank((String)session.getAttribute("username"))){
					savieOnlineService.getCustomerServiceCentre(model, request, session, "2");
					savieOnlineService.createApplicationFormPdf("1", request, session);
					savieOnlineService.createFnaFormPdf("1", request, session);
					savieOnlineService.createSalesIllustrationPdf("1",request);
				}else {
					return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request)
							+ "/savings-insurance");
				}
			}
			catch (Exception e) {
				logger.info(e.getMessage());
				request.getSession().setAttribute("errorMsg", e.getMessage());
			}
			return SavieOnlinePageFlowControl.pageFlow("savings-insurance",model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LIFE_SIGNATURE);
		}
	}
	
	@RequestMapping(value = {"/{lang}/{plan}/document-upload"})
	public ModelAndView getSavieOnlineLifeDocumentUpload(@PathVariable("plan") String plan,Model model, HttpServletRequest request,HttpSession session) {
		
		String policyNumber = (String) request.getParameter("policyNumber");
		String userName = (String)request.getSession().getAttribute("username");
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		String creditCaredNo = (String) request.getSession().getAttribute("creditCaredNo");
		
		String applicationFormJpgName = (String) request.getSession().getAttribute("applicationFormJpgName");
		String fnaFormJpgName = (String) request.getSession().getAttribute("fnaFormJpgName");
		String salesIllustrationJpgName = (String) request.getSession().getAttribute("salesIllustrationJpgName");
		
		session.removeAttribute("hasPolicy");
		if(StringUtils.isNotEmpty(policyNumber)){
			try {
				policyNumber = new String(new sun.misc.BASE64Decoder().decodeBuffer(policyNumber));
				session.setAttribute("hasPolicy", "true");
			} catch (IOException e) {
				e.printStackTrace();
			}

			//For checking against username at frontend. Ideal case is backend handle the username checking and return an unmatched_username error to frontend.
			String policyUserName = savieOnlineService.getPolicyUserName(request,policyNumber);
				request.getSession().setAttribute("policyUserName", policyUserName);

			if(!savieOnlineService.checkIsDocumentUpload(request,policyNumber)){
				CreateEliteTermPolicyResponse lifePolicy = new CreateEliteTermPolicyResponse();
				lifePolicy.setPolicyNo(policyNumber);
				request.getSession().setAttribute("lifePolicy", lifePolicy);
			}
			request.getSession().setAttribute("documentUploadYes", "documentUploadYes");
			if("medical-insurance".equals(plan)){
				return SavieOnlinePageFlowControl.pageFlow(plan,model,request, UserRestURIConstants.PAGE_PROPERTIES_EASYHEALTH_DOCUMENT_UPLOAD_LATER);
			}
			else{
				return SavieOnlinePageFlowControl.pageFlow(plan,model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LIFE_DOCUMENT_UPLOAD);
			}
		}else{
			if(userName == null){
				return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
			} else if ("*DIRECTGI".equalsIgnoreCase(userName)) {
				return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
			}
			if(userDetails == null){
				return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
			}
			else if("savings-insurance".equals(plan) && applicationFormJpgName == null){
				return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
			}
			else if("savings-insurance".equals(plan) && fnaFormJpgName == null){
				return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
			}
			else if("savings-insurance".equals(plan) && salesIllustrationJpgName == null){
				return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
			}
			else if("medical-insurance".equals(plan) && creditCaredNo == null){
				return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
			}
			else{
				JSONObject jsonObject = new JSONObject();
				/*try {
					savieOnlineService.finalizeLifePolicy(plan, request, session);
				}
				catch (ECOMMAPIException e) {
				}
				catch (Exception e) {
				}*/
				if("savings-insurance".equals(plan)){
					try {
						savieOnlineService.uploadSavieOnlineDocument(request);
					}
					catch (ECOMMAPIException e) {
						jsonObject.put("errorMsg", e.getMessage());
					}
					catch (Exception e) {
						jsonObject.put("errorMsg", e.getMessage());
					}
				} else {
					try {
						savieOnlineService.finalizeLifePolicy(plan, request, session);
					}
					catch (ECOMMAPIException e) {
						e.printStackTrace();
					}	
					catch (Exception e) {
						e.printStackTrace();
					}
				}
				model.addAttribute("plan", plan);
				request.getSession().setAttribute("documentUploadYes", "documentUploadYes");
				if("medical-insurance".equals(plan)){
					return SavieOnlinePageFlowControl.pageFlow(plan,model,request, UserRestURIConstants.PAGE_PROPERTIES_EASYHEALTH_DOCUMENT_UPLOAD);
				}
				else{
					return SavieOnlinePageFlowControl.pageFlow(plan,model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LIFE_DOCUMENT_UPLOAD);
				}
			}
		}
	}
	
	@RequestMapping(value = {"/{lang}/{plan}/confirmation"})
	public ModelAndView getSavieOnlineUploadConfirmation(@PathVariable("plan") String plan,Model model, HttpServletRequest request
			,HttpSession session) {
		SaviePlanDetailsBean saviePlanDetails = (SaviePlanDetailsBean) request.getSession().getAttribute("saviePlanDetails");
		//logger.debug("confirmation discount =" + saviePlanDetails.getInsuredAmountDiscount());
		String userName = (String)request.getSession().getAttribute("username");
		if(userName == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
		} else if (userName.equalsIgnoreCase("*DIRECTGI")) {
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
		}
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		CreateEliteTermPolicyResponse lifePolicy = (CreateEliteTermPolicyResponse) request.getSession().getAttribute("lifePolicy");
		String documentUploadYes = (String) request.getSession().getAttribute("documentUploadYes");
		String sendEmailsYes = (String) request.getSession().getAttribute("sendEmailsYes");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
		}
		else if(documentUploadYes == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
		}
		else if(lifePolicy == null || lifePolicy.getPolicyNo() == null || "".equals(lifePolicy.getPolicyNo())){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
		}
		else{
			if(sendEmailsYes == null){
				try {
					JSONObject models = new JSONObject();
					models.put("name", request.getSession().getAttribute("username"));
					
					if("medical-insurance".equals(plan)) {
						savieOnlineService.sendEmails(request, "rophiComplete", models);
					}else {
						savieOnlineService.sendEmails(request, "savieComplete", models);
					}
					
					String hasPolicy = (String)session.getAttribute("hasPolicy");
					if(hasPolicy == null) {
						savieOnlineService.finalizeLifePolicy(plan, request, session);
					}
					
					request.getSession().setAttribute("sendEmailsYes", "sendEmailsYes");
				} catch (Exception e) {
					e.printStackTrace();
					logger.info(e.getMessage());
				}
			}
			model.addAttribute("contactTimeEN", InitApplicationMessage.contactTimeEN);
			model.addAttribute("contactTimeCN", InitApplicationMessage.contactTimeCN);
			GetVulnerableCustomerResponse vulnerableCustomerResponse=new GetVulnerableCustomerResponse();
			String policyNo=lifePolicy.getPolicyNo();
			final Map<String,String> header = headerUtil.getHeader1(request);
			try {
				vulnerableCustomerResponse=connector.isVulnerable(policyNo,header);
				request.getSession().setAttribute("isVulnerable", vulnerableCustomerResponse.getVulnerableCustomer());
			} catch (ECOMMAPIException e) {
				request.getSession().setAttribute("isVulnerable", false);
				e.printStackTrace();
			}

			
			if("medical-insurance".equals(plan)){
				return SavieOnlinePageFlowControl.pageFlow(plan,model,request, UserRestURIConstants.PAGE_PROPERTIES_EASYHEALTH_UPLOAD_CONFIRMATION);
			}
			else{
				return SavieOnlinePageFlowControl.pageFlow(plan,model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_UPLOAD_CONFIRMATION);
			}
		}
	}
	
	@RequestMapping(value = {"/{lang}/{plan}/confirmation-upload-later"})
	public ModelAndView getSavieOnlineUploadLaterConfirmation(@PathVariable("plan") String plan,Model model, HttpServletRequest request,
			HttpSession session) {
		String userName = (String)request.getSession().getAttribute("username");
		if(userName == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/" + plan);
		} else if (userName.equalsIgnoreCase("*DIRECTGI")) {
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/" + plan);
		}
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		CreateEliteTermPolicyResponse lifePolicy = (CreateEliteTermPolicyResponse) request.getSession().getAttribute("lifePolicy");
		String documentUploadYes = (String) request.getSession().getAttribute("documentUploadYes");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
		}
		else if(documentUploadYes == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
		}		
		else if(lifePolicy == null || lifePolicy.getPolicyNo() == null || "".equals(lifePolicy.getPolicyNo())){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
		}
		else{
			try {
				JSONObject models = new JSONObject();
				models.put("name", request.getSession().getAttribute("username"));
				String serverUrl = request.getScheme()+"://"+request.getServerName()+request.getContextPath();
				if (request.getServerPort() != 80 && request.getServerPort() != 443){
					serverUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
				}
				String language = (String) request.getSession().getAttribute("language");
				if(StringUtils.isEmpty(language)){
					language = "tc";
				}
				String encodePolicyNum = new sun.misc.BASE64Encoder().encode(lifePolicy.getPolicyNo().getBytes());
				String url = serverUrl + "/"+language+ "/"+plan + "/document-upload?policyNumber=" + encodePolicyNum;
				
				models.put("uploadLink", url);
				models.put("uploadEnLink", serverUrl + "/en/"+plan + "/document-upload?policyNumber=" + encodePolicyNum);
				models.put("uploadTcLink", serverUrl + "/tc/"+plan + "/document-upload?policyNumber=" + encodePolicyNum);
				
				if("medical-insurance".equals(plan)) {
					savieOnlineService.sendEmails(request, "rophiUploadDocument", models);
				}else {
					savieOnlineService.sendEmails(request, "uploadDocument", models);
				}
				
				savieOnlineService.finalizeLifePolicy(plan, request, session);
				
			} catch (Exception e) {
				e.printStackTrace();
				logger.info(e.getMessage());
			}
			model.addAttribute("contactTimeEN", InitApplicationMessage.contactTimeEN);
			model.addAttribute("contactTimeCN", InitApplicationMessage.contactTimeCN);
			if("medical-insurance".equals(plan)){
				return SavieOnlinePageFlowControl.pageFlow(plan,model,request, UserRestURIConstants.PAGE_PROPERTIES_EASYHEALTH_UPLOAD_LATER_CONFIRMATION);
			}
			else{
				return SavieOnlinePageFlowControl.pageFlow(plan,model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_UPLOAD_LATER_CONFIRMATION);
			}
		}
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/confirmation-offline-signature"})
	public ModelAndView getSavieOnlineSignOfflineConfirmation(Model model, HttpServletRequest request) {
		String userName = (String)request.getSession().getAttribute("username");
		if(userName == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		} else if (userName.equalsIgnoreCase("*DIRECTGI")) {
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		String applicationFormJpgName = (String) request.getSession().getAttribute("applicationFormJpgName");
		String fnaFormJpgName = (String) request.getSession().getAttribute("fnaFormJpgName");
		String salesIllustrationJpgName = (String) request.getSession().getAttribute("salesIllustrationJpgName");
		CreateEliteTermPolicyResponse lifePolicy = (CreateEliteTermPolicyResponse) request.getSession().getAttribute("lifePolicy");

		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		else if(applicationFormJpgName == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		else if(fnaFormJpgName == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		else if(salesIllustrationJpgName == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		else if(lifePolicy == null || lifePolicy.getPolicyNo() == null || "".equals(lifePolicy.getPolicyNo())){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		else{
			
			try {
				savieOnlineService.CustomerServiceCentreConfirmation("signLater", model, request);
			} catch (Exception e) {
				e.printStackTrace();
				logger.info(e.getMessage());
			}
			return SavieOnlinePageFlowControl.pageFlow("savings-insurance",model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_SIGN_OFFLINE_CONFIRMATION);
		}
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = {"/{lang}/savings-insurance/confirmation-paylater"})
	public ModelAndView getSavieOnlinePayLaterConfirmation(Model model, HttpServletRequest request) {
		String userName = (String)request.getSession().getAttribute("username");
		if(userName == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		} else if (userName.equalsIgnoreCase("*DIRECTGI")) {
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		LifeBeneficaryInfoBean lifeBeneficaryInfo = (LifeBeneficaryInfoBean) request.getSession().getAttribute("lifeBeneficaryInfo");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		else if(lifeBeneficaryInfo == null || lifeBeneficaryInfo.getIsOwnEstate() == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		else{
			try {
				savieOnlineService.CustomerServiceCentreConfirmation("paylater", model, request);
			} catch (Exception e) {
				e.printStackTrace();
				logger.info(e.getMessage());
			}
			return SavieOnlinePageFlowControl.pageFlow("savings-insurance",model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_PAY_LATER_CONFIRMATION);
		}
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/confirmation-appointment-sp"})
	public ModelAndView getSavieOnlineAppointmentConfirmationSp(Model model, HttpServletRequest request) {
		String userName = (String)request.getSession().getAttribute("username");
		if(userName == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		} else if (userName.equalsIgnoreCase("*DIRECTGI")) {
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}else{
			try {
				savieOnlineService.CustomerServiceCentreConfirmation("offlineApplication", model, request);
			} catch (Exception e) {
				e.printStackTrace();
				logger.info(e.getMessage());
			}
			return SavieOnlinePageFlowControl.pageFlow("savings-insurance",model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_CONFIRMATION_APPOINTMENT_SP);
		}
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/confirmation-appointment-rp"})
	public ModelAndView getSavieOnlineAppointmentConfirmationRp(Model model, HttpServletRequest request) {
		String userName = (String)request.getSession().getAttribute("username");
		if(userName == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		} else if (userName.equalsIgnoreCase("*DIRECTGI")) {
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}else{
			try {
				savieOnlineService.CustomerServiceCentreConfirmation("offlineApplication-rp", model, request);
			} catch (Exception e) {
				e.printStackTrace();
				logger.info(e.getMessage());
			}
			return SavieOnlinePageFlowControl.pageFlow("savings-insurance",model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_CONFIRMATION_APPOINTMENT_RP);
		}
	}
	
	@RequestMapping(value = {"/{lang}/{plan}/customer-service-centre","/{lang}/{plan}/make-appointment"})
	public ModelAndView getSavieOnlineLifeServiceCenter(@PathVariable("plan") String plan,Model model, HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		String userName = (String)request.getSession().getAttribute("username");
		if(userName == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
		} else if (userName.equalsIgnoreCase("*DIRECTGI")) {
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
		}
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
		}
		else{
			if(StringUtils.isNotBlank((String)session.getAttribute("username"))){
				try {
					savieOnlineService.getCustomerServiceCentre(model, request, session, "1");
				} catch (Exception e) {
					logger.info(e.getMessage());
				}
				return SavieOnlinePageFlowControl.pageFlow(plan,model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_SERVICE_CENTER);
			}else {
				return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan+"/plan-details");
			}
		}
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/imageView/{jpgName:.+}"})
	public void imageView(@PathVariable("jpgName") String jpgName,HttpServletRequest request,HttpServletResponse response) throws IOException {
		String userName = (String)request.getSession().getAttribute("username");
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		if(userName == null){
		} 
		else if (userName.equalsIgnoreCase("*DIRECTGI")) {
		}
		else if(userDetails == null){
		}
		else if(StringUtils.isEmpty(jpgName)){
		}
		else{
			if(jpgName.split("-").length!=2){
			}
			else if(!userName.equals(jpgName.split("-")[1])){
			}
			else{
				File file = new File(request.getRealPath("/").replace("\\", "/")+"/resources/pdf/"+jpgName.split("-")[0]+".jpg");
		        if(!(file.exists() && file.canRead())){
		            file = new File(request.getRealPath("/").replace("\\", "/")+"/resources/pdf/template/logo.jpg");
		        }
		        FileInputStream inputStream = new FileInputStream(file);
		        byte[] data = new byte[(int)file.length()];
		        int length = inputStream.read(data);
		        inputStream.close();
		        response.setContentType("image/jpg");
		        OutputStream stream = response.getOutputStream();
		        stream.write(data);
		        stream.flush();
		        stream.close();
			}
		}
	}
}
