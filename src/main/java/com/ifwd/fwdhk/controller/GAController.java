package com.ifwd.fwdhk.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.util.HomeLiabilityPageFlowControl;
@Controller
public class GAController extends BaseController{
	
	private final static Logger logger = LoggerFactory.getLogger(GAController.class);
	

	
	@RequestMapping(value = {"/{lang}/{plan}"})
	public ModelAndView getInsurance(@PathVariable("plan") String plan,Model model, HttpServletRequest request) {
		if(UserRestURIConstants.URL_HOME_LIABILITY_LANDING.equals(plan)) {
			return HomeLiabilityPageFlowControl.pageFlow(plan, model, request, UserRestURIConstants.PAGE_PROPERTIES_HOME_LIABILITY_LANDING);
		}
		return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
	}
	
	@RequestMapping(value = {"/{lang}/{plan}/quote"})
	public ModelAndView getQuote(@PathVariable("plan") String plan,Model model, HttpServletRequest request) {
		if(UserRestURIConstants.URL_HOME_LIABILITY_LANDING.equals(plan)) {
			return HomeLiabilityPageFlowControl.pageFlow(plan, model, request, UserRestURIConstants.PAGE_PROPERTIES_HOME_LIABILITY_QUOTE);
		}
		return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
	}
	
	@RequestMapping(value = {"/{lang}/{plan}/user-details"})
	public ModelAndView getUserDetails(@PathVariable("plan") String plan,Model model, HttpServletRequest request) {
		if(UserRestURIConstants.URL_HOME_LIABILITY_LANDING.equals(plan)) {
			return HomeLiabilityPageFlowControl.pageFlow(plan, model, request, UserRestURIConstants.PAGE_PROPERTIES_HOME_LIABILITY_USER_DETAILS);
		}
		return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
	}
	
	@RequestMapping(value = {"/{lang}/{plan}/summary"})
	public ModelAndView getSummary(@PathVariable("plan") String plan,Model model, HttpServletRequest request) {
		if(UserRestURIConstants.URL_HOME_LIABILITY_LANDING.equals(plan)) {
			return HomeLiabilityPageFlowControl.pageFlow(plan, model, request, UserRestURIConstants.PAGE_PROPERTIES_HOME_LIABILITY_SUMMARY);
		}
		return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
	}
	
	@RequestMapping(value = {"/{lang}/{plan}/confirmation-ga"})
	public ModelAndView getConfirmation(@PathVariable("plan") String plan,Model model, HttpServletRequest request) {
		if(UserRestURIConstants.URL_HOME_LIABILITY_LANDING.equals(plan)) {
			return HomeLiabilityPageFlowControl.pageFlow(plan, model, request, UserRestURIConstants.PAGE_PROPERTIES_HOME_LIABILITY_CONFIRMATION);
		}
		return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
	}
	
}
