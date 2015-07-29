package com.ifwd.fwdhk.util;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.controller.UserRestURIConstants;

public class SaviePageFlowControl {

	private final static Logger logger = LoggerFactory
			.getLogger(SaviePageFlowControl.class);

	public static ModelAndView pageFlow(Model model, HttpServletRequest request, String key) {

		logger.debug("-----------------------------------page flow start--------------------------------------------");

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

		String referer = request.getHeader("referer");
		String current = request.getServletPath();
		if (referer != null) {
			//referer = referer.substring(referer.lastIndexOf("/") + 1);
			if(referer.substring(referer.lastIndexOf("/") + 1).equalsIgnoreCase("saving-insurance")){
				referer = UserRestURIConstants.PAGE_SAVIE_LANDING;
			} else {
				referer = getSaviePage(referer);
			}
		}

		if (current != null) {
			//current = current.substring(current.lastIndexOf("/") + 1);
			if(current.substring(current.lastIndexOf("/") + 1).equalsIgnoreCase("saving-insurance")){
				current = UserRestURIConstants.PAGE_SAVIE_LANDING;
			} else {
				current = getSaviePage(current);
			}
		}

		// Landing Page
		String to = "";
		String to2 = "";

<<<<<<< HEAD
		/*if (current.equalsIgnoreCase("saving-insurance")) {
=======
		if (current.equalsIgnoreCase("savings-insurance")) {
>>>>>>> c84a516eaf94ae87635cae09dbf00cba741ed2c9
			current = UserRestURIConstants.PAGE_SAVIE_LANDING;
		}*/

		logger.debug("referer : " + referer);
		logger.debug("current : " + current);

		switch (current) {

		case UserRestURIConstants.PAGE_SAVIE_LANDING:
			to = UserRestURIConstants.PAGE_SAVIE_PLAN_DETAILS;
			break;

		case UserRestURIConstants.PAGE_SAVIE_PLAN_DETAILS: 
			// Plan Details
			to = UserRestURIConstants.PAGE_SAVIE_FNA;
			to2 = UserRestURIConstants.PAGE_SAVIE_ACCOUNT_ACTIVATION;
			break;

		case UserRestURIConstants.PAGE_SAVIE_ACCOUNT_ACTIVATION: 
			// Create Account
			to = UserRestURIConstants.PAGE_SAVIE_FNA;
			break;

		case UserRestURIConstants.PAGE_SAVIE_FNA: 
			// FNA
			to = UserRestURIConstants.PAGE_SAVIE_SALES_ILLUSTRATION;
			to2 = UserRestURIConstants.PAGE_SAVIE_CUSTOMER_SERVICE_CENTRE; // FNA=yes
			break;

		case UserRestURIConstants.PAGE_SAVIE_SALES_ILLUSTRATION: 
			// Sales Illustration
			to = UserRestURIConstants.PAGE_SAVIE_APPLICATION;
			break;
			
		case UserRestURIConstants.PAGE_SAVIE_APPLICATION_SUMMARY: 
			// Summary
			to = UserRestURIConstants.PAGE_SAVIE_DECLARATIONS;
			to2 = UserRestURIConstants.PAGE_SAVIE_APPLICATION;
			break;

		case UserRestURIConstants.PAGE_SAVIE_APPLICATION: 
			// Application Form
			to = UserRestURIConstants.PAGE_SAVIE_APPLICATION_SUMMARY;//payment offline=No
			to2 = UserRestURIConstants.PAGE_SAVIE_CUSTOMER_SERVICE_CENTRE;//payment offline=Yes
			break;

		case UserRestURIConstants.PAGE_SAVIE_DECLARATIONS: 
			// DeclarationAuthorization
			to = UserRestURIConstants.PAGE_SAVIE_SIGNATURE;//payment offline=No
			to2 = UserRestURIConstants.PAGE_SAVIE_CONFIRMATION;//payment offline=Yes
			break;

		case UserRestURIConstants.PAGE_SAVIE_SIGNATURE: 
			// Signature
			to = UserRestURIConstants.PAGE_SAVIE_DOCUMENT_UPLOAD;//sign offline=No
			to2 = UserRestURIConstants.PAGE_SAVIE_CUSTOMER_SERVICE_CENTRE;//sign offline=Yes
			break;

		case UserRestURIConstants.PAGE_SAVIE_DOCUMENT_UPLOAD: 
			// Document Upload
			to = UserRestURIConstants.PAGE_SAVIE_CONFIRMATION;//submit offline=No
			to2 = UserRestURIConstants.PAGE_SAVIE_CUSTOMER_SERVICE_CENTRE;//submit offline=Yes
			break;		

		case UserRestURIConstants.PAGE_SAVIE_CONFIRMATION: 
			// Thank you
			if (referer == null) {
				to = UserRestURIConstants.PAGE_SAVIE_LANDING;
			}
			break;

		case UserRestURIConstants.PAGE_SAVIE_CUSTOMER_SERVICE_CENTRE: 
			// Appointment
			to = UserRestURIConstants.PAGE_SAVIE_CONFIRMATION;//payment offline=No
			to2 = UserRestURIConstants.PAGE_SAVIE_APPLICATION_SUMMARY;//payment offline=Yes
			break;
		
		case UserRestURIConstants.PAGE_SAVIE_INTEREST_GATHERING:
			to = UserRestURIConstants.PAGE_SAVIE_INTEREST_GATHERING;
			break;
		
		case UserRestURIConstants.PAGE_SAVIE_EMAIL_SUBMITTED:
			to = UserRestURIConstants.PAGE_SAVIE_EMAIL_SUBMITTED;
			break;

		default:
			to = UserRestURIConstants.PAGE_SAVIE_LANDING;

		}

		logger.debug("nextPageFlow : " + to);
		logger.debug("nextPageFlow2 : " + to2);
		// to=UserRestURIConstants.getSitePath(request)+ "savings-insurance/"+
		// to;
		// logger.debug("return to : " + to);

		model.addAttribute("nextPageFlow", to);
		model.addAttribute("nextPageFlow2", to2);

		logger.debug(UserRestURIConstants.getSitePath(request) + "savie/"
				+ current);

		logger.debug("-----------------------------------page flow end--------------------------------------------");

		return new ModelAndView(UserRestURIConstants.getSitePath(request)
				+ "savie/" + current);

	}
	
	public static String getSaviePage(String url)
	{		
		if(url.indexOf(UserRestURIConstants.PAGE_SAVIE_LANDING)>0) {
			return UserRestURIConstants.PAGE_SAVIE_LANDING;
		}
		if(url.indexOf(UserRestURIConstants.PAGE_SAVIE_PLAN_DETAILS)>0) {
			return UserRestURIConstants.PAGE_SAVIE_PLAN_DETAILS;
		}
		if(url.indexOf(UserRestURIConstants.PAGE_SAVIE_ACCOUNT_ACTIVATION)>0) {
			return UserRestURIConstants.PAGE_SAVIE_ACCOUNT_ACTIVATION;
		}		
		if(url.indexOf(UserRestURIConstants.PAGE_SAVIE_FNA)>0) {
			return UserRestURIConstants.PAGE_SAVIE_FNA;
		}		
		if(url.indexOf(UserRestURIConstants.PAGE_SAVIE_SALES_ILLUSTRATION)>0) {
			return UserRestURIConstants.PAGE_SAVIE_SALES_ILLUSTRATION;
		}		
		if(url.indexOf(UserRestURIConstants.PAGE_SAVIE_APPLICATION)>0) {
			return UserRestURIConstants.PAGE_SAVIE_APPLICATION;
		}
		if(url.indexOf(UserRestURIConstants.PAGE_SAVIE_APPLICATION_SUMMARY)>0) {
			return UserRestURIConstants.PAGE_SAVIE_APPLICATION_SUMMARY;
		}
		if(url.indexOf(UserRestURIConstants.PAGE_SAVIE_DECLARATIONS)>0) {
			return UserRestURIConstants.PAGE_SAVIE_DECLARATIONS;
		}
		if(url.indexOf(UserRestURIConstants.PAGE_SAVIE_SIGNATURE)>0) {
			return UserRestURIConstants.PAGE_SAVIE_SIGNATURE;
		}
		if(url.indexOf(UserRestURIConstants.PAGE_SAVIE_DOCUMENT_UPLOAD)>0) {
			return UserRestURIConstants.PAGE_SAVIE_DOCUMENT_UPLOAD;
		}
		if(url.indexOf(UserRestURIConstants.PAGE_SAVIE_INTEREST_GATHERING)>0) {
			return UserRestURIConstants.PAGE_SAVIE_INTEREST_GATHERING;
		}
		if(url.indexOf(UserRestURIConstants.PAGE_SAVIE_CONFIRMATION)>0) {
			return UserRestURIConstants.PAGE_SAVIE_CONFIRMATION;
		}
		if(url.indexOf(UserRestURIConstants.PAGE_SAVIE_CUSTOMER_SERVICE_CENTRE)>0) {
			return UserRestURIConstants.PAGE_SAVIE_CUSTOMER_SERVICE_CENTRE;
		}
		if(url.indexOf(UserRestURIConstants.PAGE_SAVIE_EMAIL_SUBMITTED)>0) {
			return UserRestURIConstants.PAGE_SAVIE_EMAIL_SUBMITTED;
		}
		return "";
		
	}

}
