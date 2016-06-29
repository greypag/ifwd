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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
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
import com.ifwd.fwdhk.connector.response.eliteterm.CreateEliteTermPolicyResponse;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.OptionItemDesc;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.model.easyhealth.EasyHealthPremiumSelectPlan;
import com.ifwd.fwdhk.model.life.LifeDeclarationBean;
import com.ifwd.fwdhk.model.life.LifePaymentBean;
import com.ifwd.fwdhk.model.life.SavieFnaBean;
import com.ifwd.fwdhk.model.life.SaviePlanDetailsBean;
import com.ifwd.fwdhk.services.EasyHealthService;
import com.ifwd.fwdhk.services.LifeService;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.DateApi;
import com.ifwd.fwdhk.util.EasyHealthPageFlowControl;
import com.ifwd.fwdhk.util.HeaderUtil;
import com.ifwd.fwdhk.util.InitApplicationMessage;
@Controller
public class EasyHealthController extends BaseController{
	
	private final static Logger logger = LoggerFactory.getLogger(EasyHealthController.class);
	
	@Autowired
	private RestServiceDao restService;
	@Autowired
	private EasyHealthService easyHealthService;
	@Autowired
	private CommonUtils commonUtils;
	@Autowired
	protected HeaderUtil headerUtil;

	@RequestMapping(value = {"/{lang}/medical-insurance"})
	public ModelAndView getEasyHealth(Model model, HttpServletRequest request, HttpSession httpSession) {
		easyHealthService.removeSession(request);
		return EasyHealthPageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_EASYHEALTH);
	}
	
	@RequestMapping(value = {"/{lang}/medical-insurance/plan-option"})
	public ModelAndView getEasyHealthPlanOption(Model model, HttpServletRequest request, HttpSession httpSession) {
		String backSummary = request.getParameter("backSummary");
		if(backSummary!=null && "Y".equals(backSummary)){
			model.addAttribute("backSummary", backSummary);
			request.getSession().setAttribute("ehStep", "1");
		}
		return EasyHealthPageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_EASYHEALTH_PLAN_OPTION);
	}
	
	@RequestMapping(value = {"/{lang}/medical-insurance/underwriting"})
	public ModelAndView getEasyHealthUnderwriting(Model model, HttpServletRequest request, HttpSession httpSession) {
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		EasyHealthPremiumSelectPlan selectPlan = (EasyHealthPremiumSelectPlan) request.getSession().getAttribute("selectPlan");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/medical-insurance");
		}
		else if(selectPlan == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/medical-insurance");
		}
		else{
			model.addAttribute("etCsContactPreferredDayEN", InitApplicationMessage.etCsContactPreferredDayEN);
			model.addAttribute("etCsContactPreferredDayCN", InitApplicationMessage.etCsContactPreferredDayCN);
			model.addAttribute("etCsContactPreferredTimeSlotEN", InitApplicationMessage.etCsContactPreferredTimeSlotEN);
			model.addAttribute("etCsContactPreferredTimeSlotCN", InitApplicationMessage.etCsContactPreferredTimeSlotCN);
			model.addAttribute("etEnquiryTypeEN", InitApplicationMessage.etEnquiryTypeEN);
			model.addAttribute("etEnquiryTypeCN", InitApplicationMessage.etEnquiryTypeCN);
			request.getSession().setAttribute("underwritingYes", "underwritingYes");
			return EasyHealthPageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_EASYHEALTH_UNDERWRITING);
		}
	}
	
	@RequestMapping(value = {"/{lang}/medical-insurance/signature"})
	public ModelAndView getEasyHealthSignature(Model model, HttpServletRequest request,HttpSession session) {
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		LifeDeclarationBean lifeDeclaration = (LifeDeclarationBean) request.getSession().getAttribute("lifeDeclaration");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/medical-insurance");
		}
		else if(lifeDeclaration == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/medical-insurance");
		}
		else{
			model.addAttribute("signatureFileSize", InitApplicationMessage.signatureFileSize);
			try {
				easyHealthService.createLifePolicy(request, request.getSession());
			} catch (ECOMMAPIException e) {
				logger.info(e.getMessage());
				e.printStackTrace();
			}
			return EasyHealthPageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_EASYHEALTH_SIGNATURE);
		}
	}
	
	@RequestMapping(value = {"/{lang}/medical-insurance/payment"})
	public ModelAndView getEasyHealthPayment(Model model, HttpServletRequest request) {
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		CreateEliteTermPolicyResponse lifePolicy = (CreateEliteTermPolicyResponse) request.getSession().getAttribute("lifePolicy");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/medical-insurance");
		}
		else if(lifePolicy == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/medical-insurance");
		}
		else{
			String path = request.getRequestURL().toString();
			model.addAttribute("successUrl", path.replace("payment", "document-upload"));
			model.addAttribute("failurePath", path);
			return EasyHealthPageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_EASYHEALTH_PAYMENT);
		}
	}
	
}
