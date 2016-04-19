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
import com.ifwd.fwdhk.model.savieOnline.LifePaymentBean;
import com.ifwd.fwdhk.model.savieOnline.SavieFnaBean;
import com.ifwd.fwdhk.model.savieOnline.SaviePlanDetailsBean;
import com.ifwd.fwdhk.services.EasyHealthService;
import com.ifwd.fwdhk.services.SavieOnlineService;
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

	@RequestMapping(value = {"/{lang}/easyhealth-insurance"})
	public ModelAndView getEasyHealth(Model model, HttpServletRequest request, HttpSession httpSession) {
		return EasyHealthPageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_EASYHEALTH);
	}
	
	
	@RequestMapping(value = {"/{lang}/easyhealth-insurance/signature"})
	public ModelAndView getEasyHealthSignature(Model model, HttpServletRequest request,HttpSession session) {
		return EasyHealthPageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_EASYHEALTH_SIGNATURE);
	}
	
	@RequestMapping(value = {"/{lang}/easyhealth-insurance/payment"})
	public ModelAndView getEasyHealthPayment(Model model, HttpServletRequest request) {
		return EasyHealthPageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_EASYHEALTH_PAYMENT);
	}
	
	@RequestMapping(value = {"/{lang}/easyhealth-insurance/document-upload"})
	public ModelAndView getEasyHealthDocumentUpload(Model model, HttpServletRequest request,HttpSession session) {
		return EasyHealthPageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_EASYHEALTH_DOCUMENT_UPLOAD);
	}
	
	@RequestMapping(value = {"/{lang}/easyhealth-insurance/confirmation"})
	public ModelAndView getEasyHealthConfirmation(Model model, HttpServletRequest request) {
		return EasyHealthPageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_EASYHEALTH_CONFIRMATION);
	}
}
