package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.io.FileInputStream;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.common.document.PDFGeneration;
import com.ifwd.fwdhk.common.document.PdfAttribute;
import com.ifwd.fwdhk.model.OptionItemDesc;
import com.ifwd.fwdhk.model.savie.SavieFormApplicationBean;
import com.ifwd.fwdhk.services.SavieOnlineService;
import com.ifwd.fwdhk.services.SavieService;
import com.ifwd.fwdhk.util.CommonEnum.GenderEnum;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.HeaderUtil;
import com.ifwd.fwdhk.util.InitApplicationMessage;
import com.ifwd.fwdhk.util.SavieOnlinePageFlowControl;
import com.ifwd.fwdhk.util.SaviePageFlowControl;
import com.ifwd.fwdhk.util.WebServiceUtils;

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
	
	@RequestMapping(value = {"/{lang}/savie-online/savie-sales-illustration"})
	public ModelAndView getSavieOnlineSalesIllustration(Model model, HttpServletRequest request) {
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
}
