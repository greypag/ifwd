package com.ifwd.fwdhk.util;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.controller.UserRestURIConstants;

public class PasskitPageFlowControl {
	private final static Logger logger = LoggerFactory.getLogger(PasskitPageFlowControl.class);

	public static ModelAndView pageFlow(String identity,Model model, HttpServletRequest request, String key) {

		logger.debug("-----------------------------------page flow start--------------------------------------------");
		
		UserRestURIConstants.setController("Passkit");
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

		model.addAttribute("planIndex", identity); //Plan Name
		model.addAttribute("pageIndex", key); // Page Index

		String referer = request.getHeader("referer");
		String current = request.getServletPath();
		if (referer != null) {
			if(referer.substring(referer.lastIndexOf("/") + 1).equalsIgnoreCase("travelcare")){
				referer = UserRestURIConstants.PAGE_PASSKIT_LANDING;
			} else {
				referer = getPasskitPage(referer);
			}
		}

		if (current != null) {
			if(current.substring(current.lastIndexOf("/") + 1).equalsIgnoreCase("travelcare")){
				current = UserRestURIConstants.PAGE_PASSKIT_LANDING;
			} else {
				current = getPasskitPage(current);
			}
		}

		// Landing Page
		String to = "";
		//String to2 = "";
		String filePath = "passkit/";

		logger.debug("referer : " + referer);
		logger.debug("current : " + current);

		switch (current) {
		
		case UserRestURIConstants.PAGE_PASSKIT_LANDING:
			to = UserRestURIConstants.PAGE_PASSKIT_DOWNLOAD;
			break;

		default:
			to = UserRestURIConstants.PAGE_PASSKIT_LANDING;
		}

		logger.debug("nextPageFlow : " + to);

		model.addAttribute("nextPageFlow", to);

		logger.debug(UserRestURIConstants.getSitePath(request) + filePath + current);

		logger.debug("-----------------------------------page flow end--------------------------------------------");

		return new ModelAndView(UserRestURIConstants.getSitePath(request) + filePath + current);

	}
	
	public static String getPasskitPage(String url){	

		if(url.endsWith(UserRestURIConstants.PAGE_PASSKIT_LANDING)) {
			return UserRestURIConstants.PAGE_PASSKIT_LANDING;
		}
		
		if(url.endsWith(UserRestURIConstants.PAGE_PASSKIT_DOWNLOAD)) {
			return UserRestURIConstants.PAGE_PASSKIT_DOWNLOAD;
		}

		return "";
	}
}
