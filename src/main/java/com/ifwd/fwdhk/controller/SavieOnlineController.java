package com.ifwd.fwdhk.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.services.SavieOnlineService;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.SavieOnlinePageFlowControl;
import com.ifwd.utils.ValidationExceptions;
@Controller
public class SavieOnlineController extends BaseController{
	
	private final static Logger logger = LoggerFactory.getLogger(SavieOnlineController.class);
	
	@Autowired
	private RestServiceDao restService;
	@Autowired
	private SavieOnlineService savieOnlineService;
	@Autowired
	private CommonUtils commonUtils;

	@RequestMapping(value = {"/{lang}/savie-online/savie-landing"})
	public ModelAndView getSavieOnlineLanding(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_LANDING);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/savie-plan-details"})
	public ModelAndView getSavieOnlinePlandetails(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_PLANDETAILS);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/savie-fna"}) 
	public ModelAndView getSavieOnlineFna(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_FNA);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/savie-product"}) 
	public ModelAndView getSavieOnlinepProduct(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_PRODUCT);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/savie-review"}) 
	public ModelAndView getSavieOnlinepReview(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_PRODUCT);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/savie-sales-illustration"})
	public ModelAndView getSavieOnlineSalesIllustration(Model model, HttpServletRequest request) {
		try {
			savieOnlineService.createSalesIllustrationPdf(request);
		}
		catch (Exception e) {
			request.getSession().setAttribute("errorMsg", e.getMessage());
		}
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_SALES_ILLUSTRATION);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/life-fatca"})
	public ModelAndView getSavieOnlineLifeFatca(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_FATCA);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/life-personal-details"})
	public ModelAndView getSavieOnlineLifePersonalDetails(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_PERSONAL_DETAILS);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/life-employment-info"})
	public ModelAndView getSavieOnlineLifeEmploymentInfo(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_EMPLOYMENT_INFO);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/life-beneficary-info"})
	public ModelAndView getSavieOnlineLifeBeneficaryInfo(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_BENEFICARY_INFO);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/life-payment"})
	public ModelAndView getSavieOnlineLifePayment(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_PAYMENT);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/life-policy-summary"})
	public ModelAndView getSavieOnlineLifePolicySummary(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_POLICY_SUMMARY);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/life-declaration"})
	public ModelAndView getSavieOnlineLifeDeclaration(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_DECLARATION);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/life-review4"})
	public ModelAndView getSavieOnlineLifeReview4(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_REVIEW4);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/life-signature"})
	public ModelAndView getSavieOnlineLifeSignature(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_SIGNATURE);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/life-document-upload"})
	public ModelAndView getSavieOnlineLifeDocumentUpload(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_DOCUMENT_UPLOAD);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/life-confirmation"})
	public ModelAndView getSavieOnlineLifeConfirmation(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_CONFIRMATION);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/service-center"})
	public ModelAndView getSavieOnlineLifeServiceCenter(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_SERVICE_CENTER);
	}
}
