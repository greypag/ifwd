package com.ifwd.fwdhk.util;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.controller.UserRestURIConstants;

public class MedicalGuardianPageFlowControl {
	private final static Logger logger = LoggerFactory.getLogger(MedicalGuardianPageFlowControl.class);

	/**
	 * @param model
	 * @param request
	 * @param key
	 * @return
	 */
	public static ModelAndView pageFlow(Model model, HttpServletRequest request, String key) {

		logger.debug("-----------------------------------page flow start--------------------------------------------");
		
		UserRestURIConstants.setController("MedicalGuardian");
		request.setAttribute("controller", UserRestURIConstants.getController());

		String pageTitle = WebServiceUtils.getPageTitle("page." + key,
				UserRestURIConstants.getLanaguage(request));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle(
				"meta." + key, UserRestURIConstants.getLanaguage(request));
		String ogTitle = WebServiceUtils.getPageTitle(key + ".og.title",
				UserRestURIConstants.getLanaguage(request));
		String ogType = WebServiceUtils.getPageTitle(key + ".og.type",
				UserRestURIConstants.getLanaguage(request));
		String ogUrl = WebServiceUtils.getPageTitle(key + ".og.url",
				UserRestURIConstants.getLanaguage(request));
		String ogImage = WebServiceUtils.getPageTitle(key + ".og.image",
				UserRestURIConstants.getLanaguage(request));
		String ogDescription = WebServiceUtils.getPageTitle(
				key + ".og.description",
				UserRestURIConstants.getLanaguage(request));

		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
		model.addAttribute("ogTitle", ogTitle);
		model.addAttribute("ogType", ogType);
		model.addAttribute("ogUrl", ogUrl);
		model.addAttribute("ogImage", ogImage);
		model.addAttribute("ogDescription", ogDescription);

		String scriptName = WebServiceUtils.getPageTitle(key +".script.name",
		UserRestURIConstants.getLanaguage(request));
		String scriptDescription = WebServiceUtils.getPageTitle(key +".script.description",
		UserRestURIConstants.getLanaguage(request));
		String scriptChildName = WebServiceUtils.getPageTitle(key +".script.child.name",
		UserRestURIConstants.getLanaguage(request));
		String scriptImg = WebServiceUtils.getPageTitle(key +".script.image",
		UserRestURIConstants.getLanaguage(request));
		model.addAttribute("scriptName", scriptName);
		model.addAttribute("scriptDescription", scriptDescription);
		model.addAttribute("scriptChildName", scriptChildName);
		model.addAttribute("scriptImg", scriptImg);
				
		model.addAttribute("planIndex", "medical-insurance/cansurance"); //Plan Name
		model.addAttribute("pageIndex", key); // Page Index

		String referer = request.getHeader("referer");
		String current = request.getServletPath();
		/*if (referer.endsWith(UserRestURIConstants.URL_MEDICAL_GUARDIAN_EMPLOYMENT_INFO)){
			referer="personal-details";
			current="employment-info";
			
		}*/
		if (referer != null) {
			if(referer.substring(referer.lastIndexOf("/") + 1).equalsIgnoreCase("cansurance")){
				referer = UserRestURIConstants.URL_MEDICAL_GUARDIAN;
			} else {
				referer = getMedicalGuardianPage(referer);
			}
		}

		if (current != null) {
			if(current.substring(current.lastIndexOf("/") + 1).equalsIgnoreCase("cansurance")){
				current = UserRestURIConstants.URL_MEDICAL_GUARDIAN;
			} else {
				current = getMedicalGuardianPage(current);
			}
		}
		
		String to = "";
		String to2 = "";
		String filePath = "medicalguardian/";
		
		logger.debug("referer : " + referer);
		logger.debug("current : " + current);

		switch (current) {
		
		case UserRestURIConstants.URL_MEDICAL_GUARDIAN:
			//to = UserRestURIConstants.URL_MEDICAL_GUARDIAN_PLAN_OPTION;
			to = UserRestURIConstants.URL_MEDICAL_GUARDIAN_UNDERWRITING;
			
			break;
			
		case UserRestURIConstants.URL_MEDICAL_GUARDIAN_UNDERWRITING: 
			to = UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_FATCA;
			to2 = UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_FATCA;
			break;
		
		
		case UserRestURIConstants.URL_MEDICAL_GUARDIAN_EMPLOYMENT_INFO: 
			to = UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_BENEFICARY_INFO;
			to2 = UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_POLICY_SUMMARY;
			break;	
			
		case UserRestURIConstants.URL_MEDICAL_GUARDIAN_SIGNATURE: 
			to = UserRestURIConstants.URL_MEDICAL_GUARDIAN_PAYMENT;
			to2 = UserRestURIConstants.URL_MEDICAL_GUARDIAN_PAYMENT;
			break;
			
		case UserRestURIConstants.URL_MEDICAL_GUARDIAN_PAYMENT: 
			to = UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_DOCUMENT_UPLOAD;
			to2 = UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_DOCUMENT_UPLOAD;
			break;
			
		case UserRestURIConstants.URL_MEDICAL_GUARDIAN_DOCUMENT_UPLOAD: 
			to = UserRestURIConstants.URL_MEDICAL_GUARDIAN_CONFIRMATION;
			to2 = UserRestURIConstants.URL_MEDICAL_GUARDIAN_CONFIRMATION;
			break;

		default:
			to = UserRestURIConstants.URL_MEDICAL_GUARDIAN;


		
		}

		logger.debug("nextPageFlow : " + "medical-insurance/cansurance-"+to);
		logger.debug("nextPageFlow2 : " + "medical-insurance/cansurance-"+to2);

		model.addAttribute("nextPageFlow", "medical-insurance/cansurance-"+to);
		model.addAttribute("nextPageFlow2", "medical-insurance/cansurance-"+to2);

		logger.debug(UserRestURIConstants.getSitePath(request) + filePath + current);

		logger.debug("-----------------------------------page flow end--------------------------------------------");

		return new ModelAndView(UserRestURIConstants.getSitePath(request) + filePath + current);

	}
	
	public static String getMedicalGuardianPage(String url){
		if(url.endsWith(UserRestURIConstants.URL_MEDICAL_GUARDIAN)) {
			return UserRestURIConstants.URL_MEDICAL_GUARDIAN;
		}
		if(url.endsWith(UserRestURIConstants.URL_MEDICAL_GUARDIAN_PLAN_OPTION)) {
			return UserRestURIConstants.URL_MEDICAL_GUARDIAN_PLAN_OPTION;
		}
		if(url.endsWith(UserRestURIConstants.URL_MEDICAL_GUARDIAN_UNDERWRITING)) {
			return UserRestURIConstants.URL_MEDICAL_GUARDIAN_UNDERWRITING;
		}
		if(url.endsWith(UserRestURIConstants.URL_MEDICAL_GUARDIAN_EMPLOYMENT_INFO)) {
			return UserRestURIConstants.URL_MEDICAL_GUARDIAN_EMPLOYMENT_INFO;
		}
		if(url.endsWith(UserRestURIConstants.URL_MEDICAL_GUARDIAN_BENEFICIARY)) {
			return UserRestURIConstants.URL_MEDICAL_GUARDIAN_BENEFICIARY;
		}
		if(url.endsWith(UserRestURIConstants.URL_MEDICAL_GUARDIAN_SUMMARY)) {
			return UserRestURIConstants.URL_MEDICAL_GUARDIAN_SUMMARY;
		}
		if(url.endsWith(UserRestURIConstants.URL_MEDICAL_GUARDIAN_DECLARATION)) {
			return UserRestURIConstants.URL_MEDICAL_GUARDIAN_DECLARATION;
		}
		if(url.endsWith(UserRestURIConstants.URL_MEDICAL_GUARDIAN_SIGNATURE)) {
			return UserRestURIConstants.URL_MEDICAL_GUARDIAN_SIGNATURE;
		}
		if(url.endsWith(UserRestURIConstants.URL_MEDICAL_GUARDIAN_PAYMENT)) {
			return UserRestURIConstants.URL_MEDICAL_GUARDIAN_PAYMENT;
		}
		if(url.endsWith(UserRestURIConstants.URL_MEDICAL_GUARDIAN_CONFIRMATION)) {
			return UserRestURIConstants.URL_MEDICAL_GUARDIAN_CONFIRMATION;
		}
		if(url.endsWith(UserRestURIConstants.URL_MEDICAL_GUARDIAN_DOCUMENT_UPLOAD)) {
			return UserRestURIConstants.URL_MEDICAL_GUARDIAN_DOCUMENT_UPLOAD;
		}
		return "";
		
	}
}
