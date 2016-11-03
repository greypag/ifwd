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
	
	@RequestMapping(value = {"/{lang}/motor-insurance/third-party-quote"})
	public ModelAndView getPlanThird(Model model, HttpServletRequest request) {
		return MotorPageFlowControl.pageFlow("", model, request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_PLAN_THIRD);
	}
	
	@RequestMapping(value = {"/{lang}/motor-insurance/comprehensive-quote"})
	public ModelAndView getPlanComp(Model model, HttpServletRequest request) {
		return MotorPageFlowControl.pageFlow("", model, request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_PLAN_COMP);
	}
	
	@RequestMapping(value = {"/{lang}/motor-insurance/rider-options"})
	public ModelAndView getQuickQuote(Model model, HttpServletRequest request) {
		return MotorPageFlowControl.pageFlow("", model, request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_QUICK_QUOTE);
	}
	
	@RequestMapping(value = {"/{lang}/motor-insurance/car-details"})
	public ModelAndView cardetails(Model model, HttpServletRequest request) {
		return MotorPageFlowControl.pageFlow("", model, request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_CAR_DETAILS);
	}
	
	@RequestMapping(value = {"/{lang}/motor-insurance/drivers-details"})
	public ModelAndView driversdetails(Model model, HttpServletRequest request) {
		return MotorPageFlowControl.pageFlow("", model, request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_DRIVERS_DETAILS);
	}

	@RequestMapping(value = {"/{lang}/motor-insurance/policy-details"})
	public ModelAndView policydetails(Model model, HttpServletRequest request) {
		return MotorPageFlowControl.pageFlow("", model, request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_POLICY_DETAILS);
	}
	
	@RequestMapping(value = {"/{lang}/motor-insurance/declarations"})
	public ModelAndView declarations(Model model, HttpServletRequest request) {
		return MotorPageFlowControl.pageFlow("", model, request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_DECLARATIONS);
	}
	
	@RequestMapping(value = {"/{lang}/motor-insurance/application-summary"})
	public ModelAndView applicationsummary(Model model, HttpServletRequest request) {
		return MotorPageFlowControl.pageFlow("", model, request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_APPLICATION_SUMMARY);
	}
	
	@RequestMapping(value = {"/{lang}/motor-insurance/confirmation"})
	public ModelAndView confirmation(Model model, HttpServletRequest request) {
		return MotorPageFlowControl.pageFlow("", model, request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_CONFIRMATION);
	}
	
	@RequestMapping(value = {"/{lang}/motor-insurance/document-upload"})
	public ModelAndView documentupload(Model model, HttpServletRequest request) {
		return MotorPageFlowControl.pageFlow("", model, request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_DOCUMENT_UPLOAD);
	}
	
	@RequestMapping(value = {"/{lang}/motor-insurance/document-upload-confirmation"})
	public ModelAndView documentuploadconfirmation(Model model, HttpServletRequest request) {
		return MotorPageFlowControl.pageFlow("", model, request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_DOCUMENT_UPLOAD_CONFIRMATION);
	}
	
	@RequestMapping(value = {"/{lang}/motor-insurance/document-upload-later"})
	public ModelAndView documentuploadlater(Model model, HttpServletRequest request) {
		return MotorPageFlowControl.pageFlow("", model, request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_DOCUMENT_UPLOAD_LATER);
	}
	
	@RequestMapping(value = {"/{lang}/motor-insurance/document-upload-later-confirmation"})
	public ModelAndView documentuploadlaterconfirmation(Model model, HttpServletRequest request) {
		return MotorPageFlowControl.pageFlow("", model, request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_DOCUMENT_UPLOAD_LATER_CONFIRMATION);
	}



	
	
	
	public static String getUrl(String page) {
		return UserRestURIConstants.SERVICE_URL + "/motor-insurance/" + page;
	}

}