package com.ifwd.fwdhk.util;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.controller.UserRestURIConstants;

public class EliteTermsFlowControl {

	private final static Logger logger = LoggerFactory
			.getLogger(EliteTermsFlowControl.class);

	public static ModelAndView pageFlow(Model model, HttpServletRequest request, String key) {

		logger.debug("-----------------------------------page flow start--------------------------------------------");
		
		UserRestURIConstants.setController("Elite");
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
		
		String twitterCard = WebServiceUtils.getPageTitle("twitter.term.life.card",
				UserRestURIConstants.getLanaguage(request));
		String twitterImage = WebServiceUtils.getPageTitle("twitter.term.life.image",
				UserRestURIConstants.getLanaguage(request));
		String twitterSite = WebServiceUtils.getPageTitle("twitter.term.life.site",
				UserRestURIConstants.getLanaguage(request));
		String twitterUrl = WebServiceUtils.getPageTitle("twitter.term.life.url",
				UserRestURIConstants.getLanaguage(request));
		String canonical = WebServiceUtils.getPageTitle("canonical.term.life",
				UserRestURIConstants.getLanaguage(request));
		model.addAttribute("twitterCard", twitterCard);
		model.addAttribute("twitterImage", twitterImage);
		model.addAttribute("twitterSite", twitterSite);
		model.addAttribute("twitterUrl", twitterUrl);
		model.addAttribute("canonical", canonical);
		
		String scriptName = WebServiceUtils.getPageTitle(key + ".script.name",
				UserRestURIConstants.getLanaguage(request));
		String scriptDescription = WebServiceUtils.getPageTitle(key + ".script.description",
				UserRestURIConstants.getLanaguage(request));
		String scriptChildName = WebServiceUtils.getPageTitle(key + ".script.child.name",
				UserRestURIConstants.getLanaguage(request));
		model.addAttribute("scriptName", scriptName);
		model.addAttribute("scriptDescription", scriptDescription);
		model.addAttribute("scriptChildName", scriptChildName);
		
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
		case UserRestURIConstants.PAGE_ELITE_TERMS_LANDING:
			to = UserRestURIConstants.URL_ELITE_TERMS_SELECT_PLAN;
			break;
		case UserRestURIConstants.PAGE_ELITE_TERMS_SELECT_PLAN:
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
			break;
		default:
			to = UserRestURIConstants.URL_ELITE_TERMS_LANDING;
		}
		model.addAttribute("nextPageFlow", to);

		logger.debug("nextPageFlow : " + to);
		logger.debug("page:"+UserRestURIConstants.getSitePath(request) + "eliteterm/" + current);
		logger.debug("-----------------------------------page flow end--------------------------------------------");

		return new ModelAndView(UserRestURIConstants.getSitePath(request)
				+ "eliteterm/" + current);
	}
	
	public static String getSaviePage(String url) {	
		if(url.endsWith(UserRestURIConstants.URL_ELITE_TERMS_LANDING)) {
			return UserRestURIConstants.PAGE_ELITE_TERMS_LANDING;
		}
		if(url.endsWith(UserRestURIConstants.URL_ELITE_TERMS_SELECT_PLAN)) {
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
		}		
		if(url.endsWith(UserRestURIConstants.URL_ELITE_TERMS_DOCUMENT_UPLOAD_HKID)) {
			return UserRestURIConstants.PAGE_ELITE_TERMS_DOCUMENT_UPLOAD_HKID;
		}	
		if(url.endsWith(UserRestURIConstants.URL_ELITE_TERMS_DOCUMENT_UPLOAD_PASSPORT)) {
			return UserRestURIConstants.PAGE_ELITE_TERMS_DOCUMENT_UPLOAD_PASSPORT;
		}	
		if(url.endsWith(UserRestURIConstants.URL_ELITE_TERMS_DOCUMENT_UPLOAD_ADDR_PROOF)) {
			return UserRestURIConstants.PAGE_ELITE_TERMS_DOCUMENT_UPLOAD_ADDR_PROOF;
		}	
		return "";
	}
}
