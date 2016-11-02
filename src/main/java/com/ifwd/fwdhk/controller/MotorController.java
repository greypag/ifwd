package com.ifwd.fwdhk.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.util.MotorPageFlowControl;
@Controller
public class MotorController extends BaseController{
	
	private final static Logger logger = LoggerFactory.getLogger(MotorController.class);
	
	@RequestMapping(value = {"/{lang}/motor-insurance"})
	public ModelAndView GetLanding(Model model, HttpServletRequest request) {
		return MotorPageFlowControl.pageFlow("", model, request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_LANDING);
	}
	
	@RequestMapping(value = {"/{lang}/motor-insurance/get-quote"})
	public ModelAndView getLSDLogin(Model model, HttpServletRequest request) {
		return MotorPageFlowControl.pageFlow("",model,request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_GET_QUOTE);
	}
	
	@RequestMapping(value = {"/{lang}/motor-insurance/rider-options"}, method = RequestMethod.POST)
	public ModelAndView getQuickQuote(Model model, HttpServletRequest request) {
		return MotorPageFlowControl.pageFlow("", model, request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_QUICK_QUOTE);
	}
	
	@RequestMapping(value = {"/{lang}/motor-insurance/third-party-quote"}, method = RequestMethod.POST)
	public ModelAndView getPlanThird(Model model, HttpServletRequest request) {
		return MotorPageFlowControl.pageFlow("", model, request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_PLAN_THIRD);
	}

	@RequestMapping(value = {"/{lang}/motor-insurance/comprehensive-quote"}, method = RequestMethod.POST)
	public ModelAndView getPlanComp(Model model, HttpServletRequest request) {
		return MotorPageFlowControl.pageFlow("", model, request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_PLAN_COMP);
	}

	@RequestMapping(value = {"/{lang}/motor-insurance/T6_Sign_Up_Page1"}, method = RequestMethod.GET)
	public String T6_Sign_Up_Page1(Model model, HttpServletRequest request) {
		return "/merged/motor/T6_Sign_Up_Page1";
	}
	
	
	@RequestMapping(value = {"/{lang}/motor-insurance/T7_Sign_Up_Page2"}, method = RequestMethod.GET)
	public String T7_Sign_Up_Page2(Model model, HttpServletRequest request) {
		return "/merged/motor/T7_Sign_Up_Page2";
	}
	@RequestMapping(value = {"/{lang}/motor-insurance/T8_Sign_Up_Page3"}, method = RequestMethod.GET)
	public String T8_Sign_Up_Page3(Model model, HttpServletRequest request) {
		return "/merged/motor/T8_Sign_Up_Page3";
	}
	@RequestMapping(value = {"/{lang}/motor-insurance/T9_Sign_Up_Page4"}, method = RequestMethod.GET)
	public String T9_Sign_Up_Page4(Model model, HttpServletRequest request) {
		return "/merged/motor/T9_Sign_Up_Page4";
	}
	@RequestMapping(value = {"/{lang}/motor-insurance/T10_Summary_Page"}, method = RequestMethod.GET)
	public String T10_Summary_Page(Model model, HttpServletRequest request) {
		return "/merged/motor/T10_Summary_Page";
	}
	@RequestMapping(value = {"/{lang}/motor-insurance/T11_Confirmation"}, method = RequestMethod.GET)
	public String T11_Confirmation(Model model, HttpServletRequest request) {
		return "/merged/motor/T11_Confirmation";
	}
	@RequestMapping(value = {"/{lang}/motor-insurance/T12_Upload_Document"}, method = RequestMethod.GET)
	public String T12_Upload_Document(Model model, HttpServletRequest request) {
		return "/merged/motor/T12_Upload_Document";
	}
	
	
	
	public static String getUrl(String page) {
		return UserRestURIConstants.SERVICE_URL + "/motor-insurance/" + page;
	}

}