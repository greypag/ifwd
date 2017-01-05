package com.ifwd.fwdhk.controller;

import io.swagger.annotations.Api;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import springfox.documentation.annotations.ApiIgnore;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.WealthreePageFlowControl;

@Controller
@Api(value = "/wealthree", description = "Operations about Wealthree")
public class WealthreeController extends BaseController{
	
	private final static Logger logger = LoggerFactory.getLogger(WealthreeController.class);
	
	@Autowired
	private RestServiceDao restService;
	@Autowired
	private CommonUtils commonUtils;
	
	@ApiIgnore
	@RequestMapping(value = {"/wealthree"})
	public ModelAndView redirectLanding(Model model, HttpServletRequest request, HttpSession httpSession) {
		String lang = UserRestURIConstants.getLanaguage(request);		
		if(lang.equalsIgnoreCase("cn")||lang.equalsIgnoreCase("tc"))
		{
			lang="tc";
		}
		else
		{
			lang="en";
		}
		return new ModelAndView("redirect:/"+lang+"/savings-insurance/wealthree");
	}
	
	@ApiIgnore
	@RequestMapping(value = {"/{lang}/savings-insurance/wealthree"})
	public ModelAndView getLanding(Model model, HttpServletRequest request, HttpSession httpSession) {
		return WealthreePageFlowControl.pageFlow(model, request, UserRestURIConstants.PAGE_PROPERTIES_WEALTHREE_LANDING);
	}
	
	@ApiIgnore
	@RequestMapping(value = {"/{lang}/savings-insurance/wealthree-customer-service-centre"})
	public ModelAndView getAppointment(Model model, HttpServletRequest request) {
		return WealthreePageFlowControl.pageFlow(model, request, UserRestURIConstants.PAGE_PROPERTIES_WEALTHREE_SERVICE_CENTER);
	}
	
	@ApiIgnore
	@RequestMapping(value = {"/{lang}/savings-insurance/wealthree-confirmation-appointment-sp"})
	public ModelAndView getConfirmation(Model model, HttpServletRequest request) {
		return WealthreePageFlowControl.pageFlow(model, request, UserRestURIConstants.PAGE_PROPERTIES_WEALTHREE_CONFIRMATION_APPOINTMENT_SP);
	}
}
