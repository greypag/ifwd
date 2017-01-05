package com.ifwd.fwdhk.util;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.controller.UserRestURIConstants;

public class WealthreePageFlowControl {
	private final static Logger logger = LoggerFactory.getLogger(WealthreePageFlowControl.class);
	private final static String FILE_PATH = "wealthree/";


	public static ModelAndView pageFlow(Model model, HttpServletRequest request, String key) {
/*
		logger.debug("-----------------------------------page flow start--------------------------------------------");
		
		UserRestURIConstants.setController("Provie");
		request.setAttribute("controller", UserRestURIConstants.getController());
*/

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

		model.addAttribute("planIndex", "wealthree"); //Plan Name
		model.addAttribute("pageIndex", key); // Page Index

/*
		String referer = request.getHeader("referer");
		String current = request.getServletPath();
		if (referer != null) {
			if(referer.substring(referer.lastIndexOf("/") + 1).equalsIgnoreCase("provie")){
				referer = UserRestURIConstants.PAGE_WEALTHREE_LANDING;
			} else {
				referer = getProvieOnlinePage(referer);
			}
		}

		if (current != null) {
			if(current.substring(current.lastIndexOf("/") + 1).equalsIgnoreCase("provie")){
				current = UserRestURIConstants.PAGE_WEALTHREE_LANDING;
			} else {
				current = getProvieOnlinePage(current);
			}
		}

		// Landing Page
		String to = "";

		logger.debug("referer : " + referer);
		logger.debug("current : " + current);

		switch (current) {
		
			case UserRestURIConstants.PAGE_PROVIE_LANDING:
				to = UserRestURIConstants.PAGE_PROVIE_PLANDETAILS;
				break;
	
			case UserRestURIConstants.PAGE_PROVIE_PLANDETAILS: 
				to = UserRestURIConstants.PAGE_PROVIE_SERVICE_CENTER;
				current = "plan-details-sp";
				break;
				
				
			case UserRestURIConstants.PAGE_PROVIE_SERVICE_CENTER: 
				
				if("SP".equals(plan.split("-")[1])){
					to = UserRestURIConstants.PAGE_PROVIE_CONFIRMATION_APPOINTMENT_SP;
				} else {
					to = UserRestURIConstants.PAGE_PROVIE_CONFIRMATION_APPOINTMENT_RP;
				}
				break;
	
			default:
				//to = UserRestURIConstants.PAGE_PROVIE_PLANDETAILS;
				to = UserRestURIConstants.PAGE_PROVIE_LANDING;
		}

		logger.debug("nextPageFlow : " + to);

		model.addAttribute("nextPageFlow", to);

		logger.debug(UserRestURIConstants.getSitePath(request) + filePath + current);

		logger.debug("-----------------------------------page flow end--------------------------------------------");
*/
		String current = null;
		switch(key) {
			case UserRestURIConstants.PAGE_PROPERTIES_WEALTHREE_LANDING:
				current = UserRestURIConstants.PAGE_WEALTHREE_LANDING;
				break;
			case UserRestURIConstants.PAGE_PROPERTIES_WEALTHREE_SERVICE_CENTER:
				current = UserRestURIConstants.PAGE_WEALTHREE_SERVICE_CENTER;
				break;
			case UserRestURIConstants.PAGE_PROPERTIES_WEALTHREE_CONFIRMATION_APPOINTMENT_SP:
			default:
				current = UserRestURIConstants.PAGE_WEALTHREE_CONFIRMATION_APPOINTMENT_SP;
				break;
		}
		return new ModelAndView(UserRestURIConstants.getSitePath(request) + FILE_PATH + current);

	}
}
