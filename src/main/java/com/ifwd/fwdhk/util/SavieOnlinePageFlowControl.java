package com.ifwd.fwdhk.util;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.controller.UserRestURIConstants;

public class SavieOnlinePageFlowControl {
	private final static Logger logger = LoggerFactory.getLogger(SavieOnlinePageFlowControl.class);

	public static ModelAndView pageFlow(Model model, HttpServletRequest request, String key) {

		logger.debug("-----------------------------------page flow start--------------------------------------------");
		
		UserRestURIConstants.setController("SavieOnline");
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
			if(referer.substring(referer.lastIndexOf("/") + 1).equalsIgnoreCase("landing")){
				referer = UserRestURIConstants.PAGE_SAVIEONLINE_LANDING;
			} else {
				referer = getSavieOnlinePage(referer);
			}
		}

		if (current != null) {
			if(current.substring(current.lastIndexOf("/") + 1).equalsIgnoreCase("landing")){
				current = UserRestURIConstants.PAGE_SAVIEONLINE_LANDING;
			} else {
				current = getSavieOnlinePage(current);
			}
		}

		// Landing Page
		String to = "";
		String to2 = "";
		String filePath = "savieonline/";

		logger.debug("referer : " + referer);
		logger.debug("current : " + current);

		switch (current) {

		case UserRestURIConstants.PAGE_SAVIEONLINE_LANDING:
			to = UserRestURIConstants.PAGE_SAVIEONLINE_PLANDETAILS;
			break;

		case UserRestURIConstants.PAGE_SAVIEONLINE_PLANDETAILS: 
			to = UserRestURIConstants.PAGE_SAVIEONLINE_FNA;
			to2 = UserRestURIConstants.PAGE_SAVIEONLINE_FNA;
			filePath = "savie/";
			current = "plan-details-b-SP";
			break;
			
		case UserRestURIConstants.PAGE_SAVIEONLINE_FNA: 
			to = UserRestURIConstants.PAGE_SAVIEONLINE_PRODUCT;
			to2 = UserRestURIConstants.PAGE_SAVIEONLINE_PRODUCT;
			break;
			
		case UserRestURIConstants.PAGE_SAVIEONLINE_REVIEW: 
			to = UserRestURIConstants.PAGE_SAVIEONLINE_PRODUCT;
			to2 = UserRestURIConstants.PAGE_SAVIEONLINE_PRODUCT;
			break;
			
		case UserRestURIConstants.PAGE_SAVIEONLINE_PRODUCT: 
			to = UserRestURIConstants.PAGE_SAVIEONLINE_SALES_ILLUSTRATION;
			to2 = UserRestURIConstants.PAGE_SAVIEONLINE_SALES_ILLUSTRATION;
			break;
			
		case UserRestURIConstants.PAGE_SAVIEONLINE_SALES_ILLUSTRATION: 
			to = UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_FATCA;
			to2 = UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_FATCA;
			filePath = "savie/";
			current = "sales-illustration";
			break;
			
		case UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_FATCA: 
			to = UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_PERSONAL_DETAILS;
			to2 = UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_PERSONAL_DETAILS;
			filePath = "savie/";
			current = "fatca";
			break;
			
		case UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_PERSONAL_DETAILS: 
			to = UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_EMPLOYMENT_INFO;
			to2 = UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_POLICY_SUMMARY;
			filePath = "savie/";
			current = "personal-details";
			break;
			
		case UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_EMPLOYMENT_INFO: 
			to = UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_BENEFICARY_INFO;
			to2 = UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_POLICY_SUMMARY;
			filePath = "savie/";
			current = "employment-info";
			break;
			
		case UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_BENEFICARY_INFO: 
			to = UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_PAYMENT;
			to2 = UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_POLICY_SUMMARY;
			filePath = "savie/";
			current = "beneficiary-info";
			break;
			
		case UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_PAYMENT: 
			to = UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_POLICY_SUMMARY;
			to2 = UserRestURIConstants.PAGE_SAVIEONLINE_SERVICE_CENTER;
			filePath = "savie/";
			current = "payment";
			break;
			
		case UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_POLICY_SUMMARY: 
			to = UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_DECLARATION;
			to2 = UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_DECLARATION;
			filePath = "savie/";
			current = "application-summary";
			break;
			
		case UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_DECLARATION: 
			to = UserRestURIConstants.PAGE_SAVIEONLINE_REVIEW4;
			to2 = UserRestURIConstants.PAGE_SAVIEONLINE_REVIEW4;
			filePath = "savie/";
			current = "declaration";
			break;
			
		case UserRestURIConstants.PAGE_SAVIEONLINE_REVIEW4: 
			to = UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_SIGNATURE;
			to2 = UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_SIGNATURE;
			break;
			
		case UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_SIGNATURE: 
			to = UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_DOCUMENT_UPLOAD;
			to2 = UserRestURIConstants.PAGE_SAVIEONLINE_SERVICE_CENTER;
			break;
			
		case UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_DOCUMENT_UPLOAD: 
			to = UserRestURIConstants.PAGE_SAVIEONLINE_UPLOAD_CONFIRMATION;
			to2 = UserRestURIConstants.PAGE_SAVIEONLINE_UPLOAD_LATER_CONFIRMATION;
			break;
			
		case UserRestURIConstants.PAGE_SAVIEONLINE_UPLOAD_CONFIRMATION: 
			to = UserRestURIConstants.PAGE_SAVIEONLINE_LANDING;
			to2 = UserRestURIConstants.PAGE_SAVIEONLINE_LANDING;
			break;
			
		case UserRestURIConstants.PAGE_SAVIEONLINE_UPLOAD_LATER_CONFIRMATION: 
			to = UserRestURIConstants.PAGE_SAVIEONLINE_LANDING;
			to2 = UserRestURIConstants.PAGE_SAVIEONLINE_LANDING;
			break;
			
		case UserRestURIConstants.PAGE_SAVIEONLINE_SIGN_OFFLINE_CONFIRMATION: 
			to = UserRestURIConstants.PAGE_SAVIEONLINE_LANDING;
			to2 = UserRestURIConstants.PAGE_SAVIEONLINE_LANDING;
			break;
			
		case UserRestURIConstants.PAGE_SAVIEONLINE_PAY_LATER_CONFIRMATION: 
			to = UserRestURIConstants.PAGE_SAVIEONLINE_LANDING;
			to2 = UserRestURIConstants.PAGE_SAVIEONLINE_LANDING;
			break;
			
		case UserRestURIConstants.PAGE_SAVIEONLINE_APPOINTMENT_CONFIRMATION: 
			to = UserRestURIConstants.PAGE_SAVIEONLINE_LANDING;
			to2 = UserRestURIConstants.PAGE_SAVIEONLINE_LANDING;
			break;
			
		case UserRestURIConstants.PAGE_SAVIEONLINE_SERVICE_CENTER: 
			to = UserRestURIConstants.PAGE_SAVIEONLINE_SERVICE_CENTER;
			to2 = UserRestURIConstants.PAGE_SAVIEONLINE_SERVICE_CENTER;
			break;

		default:
			to = UserRestURIConstants.PAGE_SAVIEONLINE_LANDING;

		}

		logger.debug("nextPageFlow : " + to);
		logger.debug("nextPageFlow2 : " + to2);

		model.addAttribute("nextPageFlow", to);
		model.addAttribute("nextPageFlow2", to2);

		logger.debug(UserRestURIConstants.getSitePath(request) + filePath + current);

		logger.debug("-----------------------------------page flow end--------------------------------------------");

		return new ModelAndView(UserRestURIConstants.getSitePath(request) + filePath + current);

	}
	
	public static String getSavieOnlinePage(String url){	
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIEONLINE_LANDING)) {
			return UserRestURIConstants.PAGE_SAVIEONLINE_LANDING;
		}
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIEONLINE_PLANDETAILS)) {
			return UserRestURIConstants.PAGE_SAVIEONLINE_PLANDETAILS;
		}
		
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIEONLINE_FNA)) {
			return UserRestURIConstants.PAGE_SAVIEONLINE_FNA;
		}
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIEONLINE_REVIEW)) {
			return UserRestURIConstants.PAGE_SAVIEONLINE_REVIEW;
		}
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIEONLINE_PRODUCT)) {
			return UserRestURIConstants.PAGE_SAVIEONLINE_PRODUCT;
		}
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIEONLINE_SALES_ILLUSTRATION)) {
			return UserRestURIConstants.PAGE_SAVIEONLINE_SALES_ILLUSTRATION;
		}
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_FATCA)) {
			return UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_FATCA;
		}
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_PERSONAL_DETAILS)) {
			return UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_PERSONAL_DETAILS;
		}
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_EMPLOYMENT_INFO)) {
			return UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_EMPLOYMENT_INFO;
		}
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_BENEFICARY_INFO)) {
			return UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_BENEFICARY_INFO;
		}
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_PAYMENT)) {
			return UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_PAYMENT;
		}
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_POLICY_SUMMARY)) {
			return UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_POLICY_SUMMARY;
		}
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_DECLARATION)) {
			return UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_DECLARATION;
		}
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIEONLINE_REVIEW4)) {
			return UserRestURIConstants.PAGE_SAVIEONLINE_REVIEW4;
		}
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_SIGNATURE)) {
			return UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_SIGNATURE;
		}
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_DOCUMENT_UPLOAD)) {
			return UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_DOCUMENT_UPLOAD;
		}
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIEONLINE_UPLOAD_CONFIRMATION)) {
			return UserRestURIConstants.PAGE_SAVIEONLINE_UPLOAD_CONFIRMATION;
		}
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIEONLINE_UPLOAD_LATER_CONFIRMATION)) {
			return UserRestURIConstants.PAGE_SAVIEONLINE_UPLOAD_LATER_CONFIRMATION;
		}
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIEONLINE_SIGN_OFFLINE_CONFIRMATION)) {
			return UserRestURIConstants.PAGE_SAVIEONLINE_SIGN_OFFLINE_CONFIRMATION;
		}
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIEONLINE_PAY_LATER_CONFIRMATION)) {
			return UserRestURIConstants.PAGE_SAVIEONLINE_PAY_LATER_CONFIRMATION;
		}
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIEONLINE_APPOINTMENT_CONFIRMATION)) {
			return UserRestURIConstants.PAGE_SAVIEONLINE_APPOINTMENT_CONFIRMATION;
		}
		if(url.endsWith(UserRestURIConstants.PAGE_SAVIEONLINE_SERVICE_CENTER)) {
			return UserRestURIConstants.PAGE_SAVIEONLINE_SERVICE_CENTER;
		}
		return "";
	}
}
