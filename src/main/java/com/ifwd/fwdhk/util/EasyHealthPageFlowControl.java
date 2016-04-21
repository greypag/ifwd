package com.ifwd.fwdhk.util;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.controller.UserRestURIConstants;

public class EasyHealthPageFlowControl {
	private final static Logger logger = LoggerFactory.getLogger(EasyHealthPageFlowControl.class);

	public static ModelAndView pageFlow(Model model, HttpServletRequest request, String key) {

		logger.debug("-----------------------------------page flow start--------------------------------------------");
		
		UserRestURIConstants.setController("EasyHealth");
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
			if(referer.substring(referer.lastIndexOf("/") + 1).equalsIgnoreCase("easyhealth-insurance")){
				referer = UserRestURIConstants.URL_EASYHEALTH;
			} else {
				referer = getEasyHealthPage(referer);
			}
		}

		if (current != null) {
			if(current.substring(current.lastIndexOf("/") + 1).equalsIgnoreCase("easyhealth-insurance")){
				current = UserRestURIConstants.URL_EASYHEALTH;
			} else {
				current = getEasyHealthPage(current);
			}
		}
		
		String to = "";
		String to2 = "";
		String filePath = "easyhealth/";

		logger.debug("referer : " + referer);
		logger.debug("current : " + current);

		switch (current) {

		case UserRestURIConstants.URL_EASYHEALTH:
			to = UserRestURIConstants.URL_EASYHEALTH_PLAN_OPTION;
			break;
			
		case UserRestURIConstants.URL_EASYHEALTH_PLAN_OPTION: 
			to = UserRestURIConstants.URL_EASYHEALTH_UNDERWRITING_QUESTION;
			to2 = UserRestURIConstants.PAGE_SAVIEONLINE_SERVICE_CENTER;
			break;
			
		case UserRestURIConstants.URL_EASYHEALTH_UNDERWRITING_QUESTION: 
			to = UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_FATCA;
			to2 = UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_FATCA;
			break;
			
		case UserRestURIConstants.URL_EASYHEALTH_SIGNATURE: 
			to = UserRestURIConstants.URL_EASYHEALTH_PAYMENT;
			to2 = UserRestURIConstants.URL_EASYHEALTH_PAYMENT;
			break;
			
		case UserRestURIConstants.URL_EASYHEALTH_PAYMENT: 
			to = UserRestURIConstants.URL_EASYHEALTH_DOCUMENT_UPLOAD;
			to2 = UserRestURIConstants.URL_EASYHEALTH_DOCUMENT_UPLOAD;
			break;
			
		case UserRestURIConstants.URL_EASYHEALTH_DOCUMENT_UPLOAD: 
			to = UserRestURIConstants.URL_EASYHEALTH_CONFIRMATION;
			to2 = UserRestURIConstants.URL_EASYHEALTH_CONFIRMATION;
			break;

		default:
			to = UserRestURIConstants.URL_EASYHEALTH;

		}

		logger.debug("nextPageFlow : " + "easyhealth-insurance/"+to);
		logger.debug("nextPageFlow2 : " + "easyhealth-insurance/"+to2);

		model.addAttribute("nextPageFlow", "easyhealth-insurance/"+to);
		model.addAttribute("nextPageFlow2", "easyhealth-insurance/"+to2);

		logger.debug(UserRestURIConstants.getSitePath(request) + filePath + current);

		logger.debug("-----------------------------------page flow end--------------------------------------------");

		return new ModelAndView(UserRestURIConstants.getSitePath(request) + filePath + current);

	}
	
	public static String getEasyHealthPage(String url){
		if(url.endsWith(UserRestURIConstants.URL_EASYHEALTH)) {
			return UserRestURIConstants.URL_EASYHEALTH;
		}
		if(url.endsWith(UserRestURIConstants.URL_EASYHEALTH_PLAN_OPTION)) {
			return UserRestURIConstants.URL_EASYHEALTH_PLAN_OPTION;
		}
		if(url.endsWith(UserRestURIConstants.URL_EASYHEALTH_UNDERWRITING_QUESTION)) {
			return UserRestURIConstants.URL_EASYHEALTH_UNDERWRITING_QUESTION;
		}
		if(url.endsWith(UserRestURIConstants.URL_EASYHEALTH_SIGNATURE)) {
			return UserRestURIConstants.URL_EASYHEALTH_SIGNATURE;
		}
		if(url.endsWith(UserRestURIConstants.URL_EASYHEALTH_PAYMENT)) {
			return UserRestURIConstants.URL_EASYHEALTH_PAYMENT;
		}
		if(url.endsWith(UserRestURIConstants.URL_EASYHEALTH_DOCUMENT_UPLOAD)) {
			return UserRestURIConstants.URL_EASYHEALTH_DOCUMENT_UPLOAD;
		}
		if(url.endsWith(UserRestURIConstants.URL_EASYHEALTH_CONFIRMATION)) {
			return UserRestURIConstants.URL_EASYHEALTH_CONFIRMATION;
		}
		return "";
	}
}
