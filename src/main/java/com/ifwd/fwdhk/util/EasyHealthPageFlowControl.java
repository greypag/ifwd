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
		String plan="medical-insurance";
		if(request.getAttribute("plan")!=null){
			if(request.getAttribute("plan").equals("medical-insurance/cansurance")){
				plan="medical-insurance/cansurance";
			}	
		}
		
		model.addAttribute("planIndex", plan); //Plan Name
		model.addAttribute("pageIndex", key); // Page Index

		String referer = request.getHeader("referer");
		String current = request.getServletPath();
		if (referer != null) {
			if(referer.substring(referer.lastIndexOf("/") + 1).equalsIgnoreCase("medical-insurance")){
				referer = UserRestURIConstants.URL_EASYHEALTH;
			} else {
				referer = getEasyHealthPage(referer);
			}
		}

		if (current != null) {
			if(current.substring(current.lastIndexOf("/") + 1).equalsIgnoreCase("medical-insurance")){
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
			to = UserRestURIConstants.URL_EASYHEALTH_UNDERWRITING;
			to2 = UserRestURIConstants.PAGE_SAVIEONLINE_SERVICE_CENTER;
			break;
			
		case UserRestURIConstants.URL_EASYHEALTH_UNDERWRITING: 
			to = UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_FATCA;
			to2 = UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_FATCA;
			break;
			
		case UserRestURIConstants.URL_EASYHEALTH_SIGNATURE: 
			to = UserRestURIConstants.URL_EASYHEALTH_PAYMENT;
			to2 = UserRestURIConstants.URL_EASYHEALTH_PAYMENT;
			break;
			
		case UserRestURIConstants.URL_EASYHEALTH_PAYMENT: 
			to = UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_DOCUMENT_UPLOAD;
			to2 = UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_DOCUMENT_UPLOAD;
			break;
			
		case UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_DOCUMENT_UPLOAD: 
			to = UserRestURIConstants.URL_EASYHEALTH_CONFIRMATION;
			to2 = UserRestURIConstants.URL_EASYHEALTH_CONFIRMATION;
			break;

		default:
			to = UserRestURIConstants.URL_EASYHEALTH;

		}

		if(plan.equals("medical-insurance/cansurance")){
			logger.debug("nextPageFlow : " + plan+"-"+to);
			logger.debug("nextPageFlow2 : " + plan+"-"+to2);

			model.addAttribute("nextPageFlow", plan+"-"+to);
			model.addAttribute("nextPageFlow2", plan+"-"+to2);
		}else{
			logger.debug("nextPageFlow : " + plan+"/"+to);
			logger.debug("nextPageFlow2 : " + plan+"/"+to2);

			model.addAttribute("nextPageFlow", plan+"/"+to);
			model.addAttribute("nextPageFlow2", plan+"/"+to2);
			
		}
	
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
		if(url.endsWith(UserRestURIConstants.URL_EASYHEALTH_UNDERWRITING)) {
			return UserRestURIConstants.URL_EASYHEALTH_UNDERWRITING;
		}
		if(url.endsWith(UserRestURIConstants.URL_EASYHEALTH_SIGNATURE)) {
			return UserRestURIConstants.URL_EASYHEALTH_SIGNATURE;
		}
		if(url.endsWith(UserRestURIConstants.URL_EASYHEALTH_PAYMENT)) {
			return UserRestURIConstants.URL_EASYHEALTH_PAYMENT;
		}
		if(url.endsWith(UserRestURIConstants.URL_EASYHEALTH_CONFIRMATION)) {
			return UserRestURIConstants.URL_EASYHEALTH_CONFIRMATION;
		}
		return "";
	}
}
