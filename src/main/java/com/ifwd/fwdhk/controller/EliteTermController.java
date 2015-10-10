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
import com.ifwd.fwdhk.services.SavieService;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.EliteTermsFlowControl;

@Controller
public class EliteTermController extends BaseController{
	
	private final static Logger logger = LoggerFactory.getLogger(EliteTermController.class);
	
	@Autowired
	private RestServiceDao restService;
	@Autowired
	private SavieService savieService;
	@Autowired
	private CommonUtils commonUtils;

	@RequestMapping(value = {"/{lang}/elite-term/confirmation"})
	public ModelAndView getConfirmation(Model model, HttpServletRequest request) {
		return EliteTermsFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_ELITE_TERMS_CONFIRMATION);
	}
	
	@RequestMapping(value = {"/{lang}/elite-term/document-upload"})
	public ModelAndView getDocumentUpload(Model model, HttpServletRequest request) {
		return EliteTermsFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_ELITE_TERMS_DOCUMENT_UPLOAD);
	}
	
	@RequestMapping(value = {"/{lang}/elite-term/landing"})
	public ModelAndView getLanding(Model model, HttpServletRequest request) {
		return EliteTermsFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_ELITE_TERMS_LANDING);
	}
	
	@RequestMapping(value = {"/{lang}/elite-term/payment"})
	public ModelAndView getPayment(Model model, HttpServletRequest request) {
		return EliteTermsFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_ELITE_TERMS_PAYMENT);
	}
	
	@RequestMapping(value = {"/{lang}/elite-term/select-plan"})
	public ModelAndView getSelectPlan(Model model, HttpServletRequest request) {
		return EliteTermsFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_ELITE_TERMS_SELECT_PLAN);
	}
}
