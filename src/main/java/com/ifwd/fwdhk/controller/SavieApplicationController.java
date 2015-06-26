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
		logger.debug(request.getParameter("beneGivenName"));
		logger.debug(request.getParameter("beneLastName"));
		logger.debug(request.getParameter("beneChineseName"));
		logger.debug(request.getParameter("hkidOrPassportNo"));
		logger.debug(request.getParameter("beneGender"));
		logger.debug(request.getParameter("beneEntitlement"));
		return UserRestURIConstants.getSitePath(request)+ "savie/savie-application-details-personalinfo";
	}
	
	@RequestMapping(value = {"/{lang}/getSavieEmploymentinfo"})
	public String getSavieEmploymentinfo(Model model, HttpServletRequest request) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		logger.debug(request.getParameter("givenName"));
		logger.debug(request.getParameter("emailAddress"));
		logger.debug(request.getParameter("lastName"));
		logger.debug(request.getParameter("telNo"));
		logger.debug(request.getParameter("chineseName"));
		logger.debug(request.getParameter("mobileNo"));
		logger.debug(request.getParameter("hkid"));
		logger.debug(request.getParameter("residentialAddress1"));
		logger.debug(request.getParameter("gender"));
		logger.debug(request.getParameter("residentialAddress2"));
		logger.debug(request.getParameter("maritalStatus"));
		logger.debug(request.getParameter("residentialAddress3"));
		logger.debug(request.getParameter("dateOfBirth"));
		logger.debug(request.getParameter("district"));
		logger.debug(request.getParameter("placeOfBirth"));
		logger.debug(request.getParameter("nationality"));
		logger.debug(request.getParameter("addressIsSame"));
		return UserRestURIConstants.getSitePath(request)+ "savie/savie-application-details-employmentinfo";
	}
	
	@RequestMapping(value = {"/{lang}/getSavieBeneficiaryinfo"})
	public String getSavieBeneficiaryinfo(Model model, HttpServletRequest request) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		logger.debug(request.getParameter("employmentStatus"));
		logger.debug(request.getParameter("natureOfBusiness"));
		logger.debug(request.getParameter("occupation"));
		logger.debug(request.getParameter("monthlyPersonalIncome"));
		return UserRestURIConstants.getSitePath(request)+ "savie/savie-application-details-beneficiaryinfo";
	}
}