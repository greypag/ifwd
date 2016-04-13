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
			if(referer.substring(referer.lastIndexOf("/") + 1).equalsIgnoreCase("easy-health")){
				referer = UserRestURIConstants.URL_EASYHEALTH;
			} else {
				referer = getEasyHealthPage(referer);
			}
		}

		if (current != null) {
			if(current.substring(current.lastIndexOf("/") + 1).equalsIgnoreCase("easy-health")){
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
			to = UserRestURIConstants.URL_EASYHEALTH_FATCA;
			break;
			
		case UserRestURIConstants.URL_EASYHEALTH_FATCA: 
			to = UserRestURIConstants.URL_EASYHEALTH_PERSONAL_DETAILS;
			to2 = UserRestURIConstants.URL_EASYHEALTH_PERSONAL_DETAILS;
			filePath = "savie/";
			break;
			
		case UserRestURIConstants.URL_EASYHEALTH_PERSONAL_DETAILS: 
			to = UserRestURIConstants.URL_EASYHEALTH_EMPLOYMENT_INFO;
			to2 = UserRestURIConstants.URL_EASYHEALTH_APPLICATION_SUMMARY;
			filePath = "savie/";
			break;
			
		case UserRestURIConstants.URL_EASYHEALTH_EMPLOYMENT_INFO: 
			to = UserRestURIConstants.URL_EASYHEALTH_BENEFICARY_INFO;
			to2 = UserRestURIConstants.URL_EASYHEALTH_APPLICATION_SUMMARY;
			filePath = "savie/";
			break;
			
		case UserRestURIConstants.URL_EASYHEALTH_BENEFICARY_INFO: 
			to = UserRestURIConstants.URL_EASYHEALTH_APPLICATION_SUMMARY;
			to2 = UserRestURIConstants.URL_EASYHEALTH_APPLICATION_SUMMARY;
			filePath = "savie/";
			break;
			
		case UserRestURIConstants.URL_EASYHEALTH_APPLICATION_SUMMARY: 
			to = UserRestURIConstants.URL_EASYHEALTH_DECLARATION;
			to2 = UserRestURIConstants.URL_EASYHEALTH_DECLARATION;
			filePath = "savie/";
			break;
		
		case UserRestURIConstants.URL_EASYHEALTH_DECLARATION: 
			filePath = "savie/";
			break;

		default:
			to = UserRestURIConstants.URL_EASYHEALTH;

		}

		logger.debug("nextPageFlow : " + "easy-health/"+to);
		logger.debug("nextPageFlow2 : " + "easy-health/"+to2);

		model.addAttribute("nextPageFlow", "easy-health/"+to);
		model.addAttribute("nextPageFlow2", "easy-health/"+to2);

		logger.debug(UserRestURIConstants.getSitePath(request) + filePath + current);

		logger.debug("-----------------------------------page flow end--------------------------------------------");

		return new ModelAndView(UserRestURIConstants.getSitePath(request) + filePath + current);

	}
	
	public static String getEasyHealthPage(String url){
		if(url.endsWith(UserRestURIConstants.URL_EASYHEALTH)) {
			return UserRestURIConstants.URL_EASYHEALTH;
		}
		if(url.endsWith(UserRestURIConstants.URL_EASYHEALTH_FATCA)) {
			return UserRestURIConstants.URL_EASYHEALTH_FATCA;
		}
		if(url.endsWith(UserRestURIConstants.URL_EASYHEALTH_PERSONAL_DETAILS)) {
			return UserRestURIConstants.URL_EASYHEALTH_PERSONAL_DETAILS;
		}
		if(url.endsWith(UserRestURIConstants.URL_EASYHEALTH_EMPLOYMENT_INFO)) {
			return UserRestURIConstants.URL_EASYHEALTH_EMPLOYMENT_INFO;
		}
		if(url.endsWith(UserRestURIConstants.URL_EASYHEALTH_BENEFICARY_INFO)) {
			return UserRestURIConstants.URL_EASYHEALTH_BENEFICARY_INFO;
		}
		if(url.endsWith(UserRestURIConstants.URL_EASYHEALTH_APPLICATION_SUMMARY)) {
			return UserRestURIConstants.URL_EASYHEALTH_APPLICATION_SUMMARY;
		}
		if(url.endsWith(UserRestURIConstants.URL_EASYHEALTH_DECLARATION)) {
			return UserRestURIConstants.URL_EASYHEALTH_DECLARATION;
		}
		return "";
	}
}
