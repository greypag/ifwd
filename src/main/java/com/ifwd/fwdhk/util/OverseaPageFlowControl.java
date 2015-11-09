package com.ifwd.fwdhk.util;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.controller.UserRestURIConstants;

public class OverseaPageFlowControl {

	private final static Logger logger = LoggerFactory
			.getLogger(EliteTermsFlowControl.class);

	public static ModelAndView pageFlow(Model model, HttpServletRequest request, String key) {

		logger.debug("-----------------------------------page flow start--------------------------------------------");
		
		UserRestURIConstants.setController("Oversea");
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
		String to = "";
		
		if (referer != null) {
			referer = getSaviePage(referer);
		}

		if (current != null) {
			current = getSaviePage(current);
		}

		logger.debug("referer : " + referer);
		logger.debug("current : " + current);

		switch (current) {
		case UserRestURIConstants.PAGE_OVERSEA_LANDING:
			to = UserRestURIConstants.PAGE_OVERSEA_LANDING;
			break;
		/*case UserRestURIConstants.PAGE_ELITE_TERMS_SELECT_PLAN:
			to = UserRestURIConstants.URL_ELITE_TERMS_PAYMENT;
			break;
		case UserRestURIConstants.PAGE_ELITE_TERMS_PAYMENT:
			to = UserRestURIConstants.URL_ELITE_TERMS_DOCUMENT_UPLOAD;
			break;
		case UserRestURIConstants.PAGE_ELITE_TERMS_DOCUMENT_UPLOAD:
			to = UserRestURIConstants.URL_ELITE_TERMS_CONFIRMATION;
			break;
		case UserRestURIConstants.PAGE_ELITE_TERMS_CONFIRMATION: 
			to = UserRestURIConstants.URL_ELITE_TERMS_LANDING;
			break;*/
		default:
			to = UserRestURIConstants.URL_ELITE_TERMS_LANDING;
		}
		model.addAttribute("nextPageFlow", to);

		logger.debug("nextPageFlow : " + to);
		logger.debug("page:"+UserRestURIConstants.getSitePath(request) + "oversea/" + current);
		logger.debug("-----------------------------------page flow end--------------------------------------------");

		return new ModelAndView(UserRestURIConstants.getSitePath(request)
				+ "oversea/" + current);
	}
	
	public static String getSaviePage(String url) {	
		if(url.endsWith(UserRestURIConstants.URL_OVERSEA_LANDING)) {
			return UserRestURIConstants.PAGE_OVERSEA_LANDING;
		}
		/*if(url.endsWith(UserRestURIConstants.URL_ELITE_TERMS_SELECT_PLAN)) {
			return UserRestURIConstants.PAGE_ELITE_TERMS_SELECT_PLAN;
		}
		if(url.endsWith(UserRestURIConstants.URL_ELITE_TERMS_APPLICATION)) {
			return UserRestURIConstants.PAGE_ELITE_TERMS_SELECT_PLAN;
		}
		if(url.endsWith(UserRestURIConstants.URL_ELITE_TERMS_PAYMENT)) {
			return UserRestURIConstants.PAGE_ELITE_TERMS_PAYMENT;
		}		
		if(url.endsWith(UserRestURIConstants.URL_ELITE_TERMS_DOCUMENT_UPLOAD)) {
			return UserRestURIConstants.PAGE_ELITE_TERMS_DOCUMENT_UPLOAD;
		}	
		if(url.endsWith(UserRestURIConstants.URL_ELITE_TERMS_DOCUMENT_UPLOAD_LATER)) {
			return UserRestURIConstants.PAGE_ELITE_TERMS_DOCUMENT_UPLOAD;
		}	
		if(url.endsWith(UserRestURIConstants.URL_ELITE_TERMS_CONFIRMATION)) {
			return UserRestURIConstants.PAGE_ELITE_TERMS_CONFIRMATION;
		}		*/
		return "";
	}
}
