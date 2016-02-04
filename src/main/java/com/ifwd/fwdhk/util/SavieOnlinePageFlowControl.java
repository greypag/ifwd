package com.ifwd.fwdhk.util;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.controller.UserRestURIConstants;

public class SavieOnlinePageFlowControl {

	private final static Logger logger = LoggerFactory
			.getLogger(SavieOnlinePageFlowControl.class);

	public static ModelAndView pageFlow(Model model,
			HttpServletRequest request, String key) {

		logger.debug("-----------------------------------page flow start--------------------------------------------");

		UserRestURIConstants.setController("Savie");
		request.setAttribute("controller", UserRestURIConstants.getController());

		String pageTitle = WebServiceUtils.getPageTitle("page." + key,
				UserRestURIConstants.getLanaguage(request));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta."
				+ key, UserRestURIConstants.getLanaguage(request));
		String ogTitle = WebServiceUtils.getPageTitle(key + ".og.title",
				UserRestURIConstants.getLanaguage(request));
		String ogType = WebServiceUtils.getPageTitle(key + ".og.type",
				UserRestURIConstants.getLanaguage(request));
		String ogUrl = WebServiceUtils.getPageTitle(key + ".og.url",
				UserRestURIConstants.getLanaguage(request));
		String ogImage = WebServiceUtils.getPageTitle(key + ".og.image",
				UserRestURIConstants.getLanaguage(request));
		String ogDescription = WebServiceUtils
				.getPageTitle(key + ".og.description",
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
			// referer = referer.substring(referer.lastIndexOf("/") + 1);
			if (referer.substring(referer.lastIndexOf("/") + 1)
					.equalsIgnoreCase("savings-insurance")) {
				referer = UserRestURIConstants.PAGE_SAVIE_O2O_LANDING;
			} else {
				referer = getSaviePage(referer);
			}
		}

		if (current != null) {
			// current = current.substring(current.lastIndexOf("/") + 1);
			if (current.substring(current.lastIndexOf("/") + 1)
					.equalsIgnoreCase("savings-insurance")) {
				current = UserRestURIConstants.PAGE_SAVIE_O2O_LANDING;
			} else {
				current = getSaviePage(current);
			}
		}

		// Landing Page
		String to = "";
		String to2 = "";

		/*
		 * if (current.equalsIgnoreCase("saving-insurance")) { current =
		 * UserRestURIConstants.PAGE_SAVIE_LANDING; }
		 */

		logger.debug("referer : " + referer);
		logger.debug("current : " + current);

		switch (current) {

		case UserRestURIConstants.PAGE_SAVIE_LANDING_RP:
			//to = UserRestURIConstants.PAGE_SAVIE_PLAN_DETAILS;
			break;
		default:
			to = UserRestURIConstants.PAGE_SAVIE_LANDING_RP;

		}

		logger.debug("nextPageFlow : " + to);
		logger.debug("nextPageFlow2 : " + to2);

		model.addAttribute("nextPageFlow", to);
		model.addAttribute("nextPageFlow2", to2);

		logger.debug(UserRestURIConstants.getSitePath(request) + "savie/"
				+ current);

		logger.debug("-----------------------------------page flow end--------------------------------------------");

		return new ModelAndView(UserRestURIConstants.getSitePath(request)
				+ "savie/" + current);

	}

	public static String getSaviePage(String url) {
		if (url.endsWith(UserRestURIConstants.URL_SAVIE_LANDING_RP)) {
			return UserRestURIConstants.PAGE_SAVIE_LANDING_RP;
		}
		return "";

	}

}
