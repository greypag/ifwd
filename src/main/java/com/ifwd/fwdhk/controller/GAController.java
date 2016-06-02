package com.ifwd.fwdhk.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.model.DistrictBean;
import com.ifwd.fwdhk.model.HomeCareDetailsBean;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.services.GAService;
import com.ifwd.fwdhk.util.HomeLiabilityPageFlowControl;
import com.ifwd.fwdhk.util.InitApplicationMessage;
import com.sun.org.apache.bcel.internal.generic.LNEG;
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
	
	@RequestMapping(value = {"/{lang}/{plan}/screening"})
	public ModelAndView getScreening(@PathVariable("plan") String plan,Model model, HttpServletRequest request) {
		if(UserRestURIConstants.URL_HOME_LIABILITY_LANDING.equals(plan)) {
			return HomeLiabilityPageFlowControl.pageFlow(plan, model, request, UserRestURIConstants.PAGE_PROPERTIES_HOME_LIABILITY_SCREENING);
		}
		return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
	}
	
	@RequestMapping(value = {"/{lang}/{plan}/select-plan"})
	public ModelAndView getQuote(@PathVariable("plan") String plan,Model model, HttpServletRequest request) {
		if(UserRestURIConstants.URL_HOME_LIABILITY_LANDING.equals(plan)) {
			return HomeLiabilityPageFlowControl.pageFlow(plan, model, request, UserRestURIConstants.PAGE_PROPERTIES_HOME_LIABILITY_SELECT_PLAN);
		}
		return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
	}
	
	@RequestMapping(value = {"/{lang}/{plan}/user-details"})
	public ModelAndView getUserDetails(@PathVariable("plan") String plan,Model model, HttpServletRequest request) {
		if(UserRestURIConstants.URL_HOME_LIABILITY_LANDING.equals(plan)) {
			List<DistrictBean> districtList = InitApplicationMessage.districtCN;
			Map<String, String> mapNetFloorArea = InitApplicationMessage.netFloorAreaCN;
			return HomeLiabilityPageFlowControl.pageFlow(plan, model, request, UserRestURIConstants.PAGE_PROPERTIES_HOME_LIABILITY_USER_DETAILS);
		}
		return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/"+plan);
	}
	
	@RequestMapping(value = {"/{lang}/{plan}/summary"})
	public ModelAndView getSummary(@PathVariable("plan") String plan,Model model, HttpServletRequest request) {
		if(UserRestURIConstants.URL_HOME_LIABILITY_LANDING.equals(plan)) {
			HttpSession session = request.getSession();
			UserDetails userDetails = (UserDetails)session.getAttribute("userDetails");
			HomeCareDetailsBean homeDetails = (HomeCareDetailsBean)session.getAttribute("homeCareDetails");
			model.addAttribute("userDetails", userDetails);
			model.addAttribute("homeCareDetails", homeDetails);
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
