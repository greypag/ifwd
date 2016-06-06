package com.ifwd.fwdhk.util;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.controller.UserRestURIConstants;

public class HomeLiabilityPageFlowControl {
	private final static Logger logger = LoggerFactory.getLogger(HomeLiabilityPageFlowControl.class);

	public static ModelAndView pageFlow(String plan,Model model, HttpServletRequest request, String key) {

		logger.debug("-----------------------------------page flow start--------------------------------------------");
		
		UserRestURIConstants.setController("HomeLiability");
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
		String scriptImg = WebServiceUtils.getPageTitle(key +".og.image",
		UserRestURIConstants.getLanaguage(request));
		model.addAttribute("scriptName", scriptName);
		model.addAttribute("scriptDescription", scriptDescription);
		model.addAttribute("scriptChildName", scriptChildName);
		model.addAttribute("scriptImg", scriptImg);

		model.addAttribute("planIndex", plan); //Plan Name
		model.addAttribute("pageIndex", key); // Page Index

		String referer = request.getHeader("referer");
		String current = request.getServletPath();
		if (referer != null) {
			if(referer.substring(referer.lastIndexOf("/") + 1).equalsIgnoreCase(plan)){
				
			} else {
				referer = getHomeLiabilityPage(referer);
			}
		}

		if (current != null) {
			if(current.substring(current.lastIndexOf("/") + 1).equalsIgnoreCase(plan)){
				current = UserRestURIConstants.PAGE_HOME_LIABILITY_LANDING;
			} else {
				current = getHomeLiabilityPage(current);
			}
		}

		// Landing Page
		String to = "";
		String to2 = "";

		logger.debug("referer : " + referer);
		logger.debug("current : " + current);

		switch (current) {

		case UserRestURIConstants.PAGE_HOME_LIABILITY_LANDING:
			to = UserRestURIConstants.URL_HOME_LIABILITY_SCREENING;
			break;
			
		case UserRestURIConstants.PAGE_HOME_LIABILITY_SCREENING:
			to = UserRestURIConstants.URL_HOME_LIABILITY_SELECT_PLAN;
			break;

		case UserRestURIConstants.PAGE_HOME_LIABILITY_SELECT_PLAN: 
			to = UserRestURIConstants.URL_HOME_LIABILITY_USER_DETAILS;
			to2 = UserRestURIConstants.URL_HOME_CARE_SELECT_PLAN;
			break;
			
		case UserRestURIConstants.PAGE_HOME_LIABILITY_USER_DETAILS: 
			to = UserRestURIConstants.PAGE_HOME_LIABILITY_SUMMARY;
			break;
			
		case UserRestURIConstants.PAGE_HOME_LIABILITY_SUMMARY: 
			to = UserRestURIConstants.PAGE_HOME_LIABILITY_CONFIRMATION;
			break;
			
		case UserRestURIConstants.PAGE_HOME_LIABILITY_CONFIRMATION: 
			break;
			
		default:
			to = UserRestURIConstants.PAGE_HOME_LIABILITY_LANDING;

		}

		logger.debug("nextPageFlow : " + to);
		logger.debug("nextPageFlow2 : " + to2);

		model.addAttribute("nextPageFlow", to);
		model.addAttribute("nextPageFlow2", to2);

		String filePath = "";
		if("home-liability-insurance".equals(plan)) {
			filePath = "homeliability/";
		}
		
		logger.debug(UserRestURIConstants.getSitePath(request) + filePath + current);

		logger.debug("-----------------------------------page flow end--------------------------------------------");

		return new ModelAndView(UserRestURIConstants.getSitePath(request) + filePath + current);

	}
	
	public static String getHomeLiabilityPage(String url){	
		if(url.endsWith(UserRestURIConstants.URL_HOME_LIABILITY_LANDING)) {
			return UserRestURIConstants.PAGE_HOME_LIABILITY_LANDING;
		}
		if(url.endsWith(UserRestURIConstants.URL_HOME_LIABILITY_SCREENING)) {
			return UserRestURIConstants.PAGE_HOME_LIABILITY_SCREENING;
		}
		if(url.endsWith(UserRestURIConstants.URL_HOME_LIABILITY_SELECT_PLAN)) {
			return UserRestURIConstants.PAGE_HOME_LIABILITY_SELECT_PLAN;
		}
		if(url.endsWith(UserRestURIConstants.URL_HOME_LIABILITY_USER_DETAILS)) {
			return UserRestURIConstants.PAGE_HOME_LIABILITY_USER_DETAILS;
		}
		if(url.endsWith(UserRestURIConstants.URL_HOME_LIABILITY_SUMMARY)) {
			return UserRestURIConstants.PAGE_HOME_LIABILITY_SUMMARY;
		}
		if(url.endsWith(UserRestURIConstants.URL_HOME_LIABILITY_CONFIRMATION)) {
			return UserRestURIConstants.PAGE_HOME_LIABILITY_CONFIRMATION;
		}
		
		return "";
	}
}
