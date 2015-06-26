package com.ifwd.fwdhk.controller;

import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SavieApplicationController {
	
	private final static Logger logger = LoggerFactory.getLogger(SavieApplicationController.class);

	@RequestMapping(value = {"/{lang}/getSaviePersonalinfo"})
	public String getSaviePersonalinfo(Model model, HttpServletRequest request) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		return UserRestURIConstants.getSitePath(request)+ "savie/savie-application-details-personalinfo";
	}
	
	@RequestMapping(value = {"/{lang}/getSavieEmploymentinfo"})
	public String getSavieEmploymentinfo(Model model, HttpServletRequest request) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		return UserRestURIConstants.getSitePath(request)+ "savie/savie-application-details-employmentinfo";
	}
	
	@RequestMapping(value = {"/{lang}/getSavieBeneficiaryinfo"})
	public String getSavieBeneficiaryinfo(Model model, HttpServletRequest request) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		return UserRestURIConstants.getSitePath(request)+ "savie/savie-application-details-beneficiaryinfo";
	}
}