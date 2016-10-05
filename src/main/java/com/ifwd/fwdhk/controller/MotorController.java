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
	
	public static String getUrl(String page) {
		return UserRestURIConstants.SERVICE_URL + "/motor-insurance/" + page;
	}

}