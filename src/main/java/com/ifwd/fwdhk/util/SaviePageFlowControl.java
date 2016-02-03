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
		
		UserRestURIConstants.setController("Savie");
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

		String referer = request.getHeader("referer");
		String current = request.getServletPath();
		if (referer != null) {
			//referer = referer.substring(referer.lastIndexOf("/") + 1);
			if(referer.substring(referer.lastIndexOf("/") + 1).equalsIgnoreCase("savings-insurance")){
				referer = UserRestURIConstants.PAGE_SAVIE_O2O_LANDING;
			} else {
				referer = getSaviePage(referer);
			}
		}

		if (current != null) {
			//current = current.substring(current.lastIndexOf("/") + 1);
			if(current.substring(current.lastIndexOf("/") + 1).equalsIgnoreCase("savings-insurance")){
				current = UserRestURIConstants.PAGE_SAVIE_O2O_LANDING;
			} else {
				current = getSaviePage(current);
			}
		}

		// Landing Page
		String to = "";
		String to2 = "";


		/*if (current.equalsIgnoreCase("saving-insurance")) {
			current = UserRestURIConstants.PAGE_SAVIE_LANDING;
		}*/

		logger.debug("referer : " + referer);
		logger.debug("current : " + current);

		switch (current) {

		case UserRestURIConstants.PAGE_SAVIE_O2O_LANDING:
			to = UserRestURIConstants.PAGE_SAVIE_PLAN_DETAILS_SP;
			break;

		case UserRestURIConstants.PAGE_SAVIE_PLAN_DETAILS: 
			// Plan Details
			to = UserRestURIConstants.PAGE_SAVIE_SERVICE_CENTER;
			/*to = UserRestURIConstants.PAGE_SAVIE_FNA;
			to2 = UserRestURIConstants.PAGE_SAVIE_ACCOUNT_ACTIVATION;*/
			to2 = UserRestURIConstants.PAGE_SAVIE_SERVICE_CENTER;
			break;

		case UserRestURIConstants.PAGE_SAVIE_ACCOUNT_ACTIVATION: 
			// Create Account
			to = UserRestURIConstants.PAGE_SAVIE_FNA;
			break;

		case UserRestURIConstants.PAGE_SAVIE_FNA: 
			// FNA
			to = UserRestURIConstants.PAGE_SAVIE_SALES_ILLUSTRATION;
			to2 = UserRestURIConstants.PAGE_SAVIE_SERVICE_CENTER; // FNA=yes
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
			to2 = UserRestURIConstants.PAGE_SAVIE_SERVICE_CENTER;//payment offline=Yes
			break;

		case UserRestURIConstants.PAGE_SAVIE_DECLARATIONS: 
			// DeclarationAuthorization
			to = UserRestURIConstants.PAGE_SAVIE_SIGNATURE;//payment offline=No
			to2 = UserRestURIConstants.PAGE_SAVIE_CONFIRMATION;//payment offline=Yes
			break;

		case UserRestURIConstants.PAGE_SAVIE_SIGNATURE: 
			// Signature
			to = UserRestURIConstants.PAGE_SAVIE_DOCUMENT_UPLOAD;//sign offline=No
			to2 = UserRestURIConstants.PAGE_SAVIE_SERVICE_CENTER;//sign offline=Yes
			break;

		case UserRestURIConstants.PAGE_SAVIE_DOCUMENT_UPLOAD: 
			// Document Upload
			to = UserRestURIConstants.PAGE_SAVIE_CONFIRMATION;//submit offline=No
			to2 = UserRestURIConstants.PAGE_SAVIE_SERVICE_CENTER;//submit offline=Yes
			break;		

		case UserRestURIConstants.PAGE_SAVIE_CONFIRMATION: 
			// Thank you
			if (referer == null) {
				to = UserRestURIConstants.PAGE_SAVIE_O2O_LANDING;
			}
			break;

		case UserRestURIConstants.PAGE_SAVIE_SERVICE_CENTER: 
			// Appointment
			to = UserRestURIConstants.PAGE_SAVIE_CONFIRMATION;//payment offline=No
			to2 = UserRestURIConstants.PAGE_SAVIE_APPLICATION_SUMMARY;//payment offline=Yes
			break;
		
		case UserRestURIConstants.PAGE_SAVIE_INTEREST_GATHERING:
			to = UserRestURIConstants.PAGE_SAVIE_PLAN_DETAILS;
			break;
		
		case UserRestURIConstants.PAGE_SAVIE_EMAIL_SUBMITTED:
			/*if(UserRestURIConstants.PAGE_PROPERTIES_SAVIE_INTEREST_GATHERING.equals(key)) {
				to = UserRestURIConstants.PAGE_SAVIE_INTEREST_GATHERING;
				current = UserRestURIConstants.PAGE_SAVIE_INTEREST_GATHERING;
			}else {*/
				to = UserRestURIConstants.PAGE_SAVIE_EMAIL_SUBMITTED;
			//}
			break;
			
		case UserRestURIConstants.PAGE_PROPERTIES_SAVIE_PDF:
			to = UserRestURIConstants.PAGE_PROPERTIES_SAVIE_PDF;
			break;
		/*case UserRestURIConstants.PAGE_SAINTS_LANDING_RP:
			to = UserRestURIConstants.PAGE_SAVIE_PLAN_DETAILS_RP;
			break;*/
			
		default:
			to = UserRestURIConstants.PAGE_SAVIE_O2O_LANDING;

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
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIE_O2O_LANDING)) {
			return UserRestURIConstants.PAGE_SAVIE_O2O_LANDING;
		}
		/*if (url.endsWith(UserRestURIConstants.PAGE_SAINTS_LANDING_RP)) {
			return UserRestURIConstants.PAGE_SAINTS_LANDING_RP;
		}*/
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIE_PLAN_DETAILS_SP)) {
			return UserRestURIConstants.PAGE_SAVIE_PLAN_DETAILS;
		}
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIE_PLAN_DETAILS_RP)) {
			return UserRestURIConstants.PAGE_SAVIE_PLAN_DETAILS;
		}
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIE_ACCOUNT_ACTIVATION)) {
			return UserRestURIConstants.PAGE_SAVIE_ACCOUNT_ACTIVATION;
		}		
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIE_FNA)) {
			return UserRestURIConstants.PAGE_SAVIE_FNA;
		}		
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIE_SALES_ILLUSTRATION)) {
			return UserRestURIConstants.PAGE_SAVIE_SALES_ILLUSTRATION;
		}		
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIE_APPLICATION)) {
			return UserRestURIConstants.PAGE_SAVIE_APPLICATION;
		}
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIE_APPLICATION_SUMMARY)) {
			return UserRestURIConstants.PAGE_SAVIE_APPLICATION_SUMMARY;
		}
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIE_DECLARATIONS)) {
			return UserRestURIConstants.PAGE_SAVIE_DECLARATIONS;
		}
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIE_SIGNATURE)) {
			return UserRestURIConstants.PAGE_SAVIE_SIGNATURE;
		}
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIE_DOCUMENT_UPLOAD)) {
			return UserRestURIConstants.PAGE_SAVIE_DOCUMENT_UPLOAD;
		}

		if(url.endsWith(UserRestURIConstants.PAGE_SAVIE_EMAIL_SUBMITTED)) {
			return UserRestURIConstants.PAGE_SAVIE_EMAIL_SUBMITTED;
		}
		
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIE_INTEREST_GATHERING)) {
			return UserRestURIConstants.PAGE_SAVIE_INTEREST_GATHERING;
		}
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIE_CONFIRMATION)) {
			return UserRestURIConstants.PAGE_SAVIE_CONFIRMATION_OFFLINE;
		}
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIE_CONFIRMATION_RP)) {
			return UserRestURIConstants.PAGE_SAVIE_CONFIRMATION_RP;
		}
		if(url.endsWith(UserRestURIConstants.PAGE_PROPERTIES_SAVIE_PDF)) {
			return UserRestURIConstants.PAGE_PROPERTIES_SAVIE_PDF;
		}
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIE_SERVICE_CENTER)) {
			return UserRestURIConstants.PAGE_SAVIE_SERVICE_CENTER;
		}
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIE_APPOINTMENT_SUCCESS)) {
			return UserRestURIConstants.PAGE_SAVIE_APPOINTMENT_SUCCESS;
		}
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIE_CONFIRMATION_OFFLINE)) {
			return UserRestURIConstants.PAGE_SAVIE_CONFIRMATION_OFFLINE;
		}
		return "";
		
	}

}
