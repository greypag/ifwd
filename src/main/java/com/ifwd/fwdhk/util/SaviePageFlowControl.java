package com.ifwd.fwdhk.util;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.controller.UserRestURIConstants;

public class SaviePageFlowControl {

	private final static Logger logger = LoggerFactory
			.getLogger(SaviePageFlowControl.class);

	public static ModelAndView pageFlow(Model model, HttpServletRequest request) {
		
		
		String pageTitle = WebServiceUtils.getPageTitle("page.savie", UserRestURIConstants.getLanaguage(request));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.savie", UserRestURIConstants.getLanaguage(request));
		String ogTitle = WebServiceUtils.getPageTitle("savie.og.title", UserRestURIConstants.getLanaguage(request));
		String ogType = WebServiceUtils.getPageTitle("savie.og.type", UserRestURIConstants.getLanaguage(request));
		String ogUrl = WebServiceUtils.getPageTitle("savie.og.url", UserRestURIConstants.getLanaguage(request));
		String ogImage = WebServiceUtils.getPageTitle("savie.og.image", UserRestURIConstants.getLanaguage(request));
		String ogDescription = WebServiceUtils.getPageTitle("savie.og.description", UserRestURIConstants.getLanaguage(request));
		
		
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
		model.addAttribute("ogTitle", ogTitle);
		model.addAttribute("ogType", ogType);
		model.addAttribute("ogUrl", ogUrl);
		model.addAttribute("ogImage", ogImage);
		model.addAttribute("ogDescription", ogDescription);
		
		
		logger.debug("-----------------------------------start--------------------------------------------");
		String referer = request.getHeader("referer");
		String current = request.getServletPath();
		if (referer != null) {
			referer = referer.substring(referer.lastIndexOf("/") + 1);
		}

		if (current != null) {
			current = current.substring(current.lastIndexOf("/") + 1);
		}

		logger.debug("referer : " + referer);
		logger.debug("current : " + current);

		String to = "";
		if (current.equals(UserRestURIConstants.PAGE_SAVIE_PLAN_DETAILS)) {
			if (referer == null) {
				to = UserRestURIConstants.PAGE_SAVIE_LANDING;
			} else if (referer
					.endsWith(UserRestURIConstants.PAGE_SAVIE_LANDING)) {
				to = UserRestURIConstants.PAGE_SAVIE_APPLICATION_DETAILS;
			} else if (referer
					.endsWith(UserRestURIConstants.PAGE_SAVIE_EDIT_VIEW)) {
				to = UserRestURIConstants.PAGE_SAVIE_EDIT_VIEW;
			}
		}

		if (current.equals(UserRestURIConstants.PAGE_SAVIE_FNA)) {
			if (referer == null) {
				to = UserRestURIConstants.PAGE_SAVIE_LANDING;
			} else if (referer
					.endsWith(UserRestURIConstants.PAGE_SAVIE_PLAN_DETAILS)) {
				to = UserRestURIConstants.PAGE_SAVIE_APPLICATION_DETAILS;
			} else if (referer
					.endsWith(UserRestURIConstants.PAGE_SAVIE_EDIT_VIEW)) {
				to = UserRestURIConstants.PAGE_SAVIE_EDIT_VIEW;
			}
		}

		if (current.equals(UserRestURIConstants.PAGE_SAVIE_APPLICATION_DETAILS)) {
			if (referer == null) {
				to = UserRestURIConstants.PAGE_SAVIE_LANDING;
			} else if (referer.endsWith(UserRestURIConstants.PAGE_SAVIE_FNA)) {
				to = UserRestURIConstants.PAGE_SAVIE_ORDER_SUMMARY;
			} else if (referer
					.endsWith(UserRestURIConstants.PAGE_SAVIE_EDIT_VIEW)) {
				to = UserRestURIConstants.PAGE_SAVIE_EDIT_VIEW;
			}
		}

		if (current.equals(UserRestURIConstants.PAGE_SAVIE_ORDER_SUMMARY)) {
			if (referer == null) {
				to = UserRestURIConstants.PAGE_SAVIE_LANDING;
			} else if (referer
					.endsWith(UserRestURIConstants.PAGE_SAVIE_APPLICATION_DETAILS)) {
				to = UserRestURIConstants.PAGE_SAVIE_APPOINTMENT;
			} else if (referer
					.endsWith(UserRestURIConstants.PAGE_SAVIE_EDIT_VIEW)) {
				to = UserRestURIConstants.PAGE_SAVIE_EDIT_VIEW;
			}
		}

		if (current.equals(UserRestURIConstants.PAGE_SAVIE_APPOINTMENT)) {
			if (referer == null) {
				to = UserRestURIConstants.PAGE_SAVIE_LANDING;
			} else if (referer
					.endsWith(UserRestURIConstants.PAGE_SAVIE_ORDER_SUMMARY)) {
				to = UserRestURIConstants.PAGE_SAVIE_DOCUMENT_UPLOAD;
			} else if (referer
					.endsWith(UserRestURIConstants.PAGE_SAVIE_EDIT_VIEW)) {
				to = UserRestURIConstants.PAGE_SAVIE_EDIT_VIEW;
			}
		}

		if (current.equals(UserRestURIConstants.PAGE_SAVIE_DOCUMENT_UPLOAD)) {
			if (referer == null) {
				to = UserRestURIConstants.PAGE_SAVIE_LANDING;
			} else if (referer
					.endsWith(UserRestURIConstants.PAGE_SAVIE_APPOINTMENT)) {
				to = UserRestURIConstants.PAGE_SAVIE_THANKYOU;
			} else if (referer
					.endsWith(UserRestURIConstants.PAGE_SAVIE_EDIT_VIEW)) {
				to = UserRestURIConstants.PAGE_SAVIE_EDIT_VIEW;
			}
		}

		if (current.equals(UserRestURIConstants.PAGE_SAVIE_THANKYOU)) {
			if (referer == null) {
				to = UserRestURIConstants.PAGE_SAVIE_LANDING;
			} else if (referer
					.endsWith(UserRestURIConstants.PAGE_SAVIE_DOCUMENT_UPLOAD)) {
				to = UserRestURIConstants.PAGE_SAVIE_DECLARATION_AUTHORIZATION;
			} else if (referer
					.endsWith(UserRestURIConstants.PAGE_SAVIE_EDIT_VIEW)) {
				to = UserRestURIConstants.PAGE_SAVIE_EDIT_VIEW;
			}
		}

		if (current
				.equals(UserRestURIConstants.PAGE_SAVIE_DECLARATION_AUTHORIZATION)) {
			if (referer == null) {
				to = UserRestURIConstants.PAGE_SAVIE_LANDING;
			} else if (referer
					.endsWith(UserRestURIConstants.PAGE_SAVIE_THANKYOU)) {
				to = UserRestURIConstants.PAGE_SAVIE_SIGNATURE;
			} else if (referer
					.endsWith(UserRestURIConstants.PAGE_SAVIE_EDIT_VIEW)) {
				to = UserRestURIConstants.PAGE_SAVIE_EDIT_VIEW;
			}
		}

		if (current.equals(UserRestURIConstants.PAGE_SAVIE_SIGNATURE)) {
			if (referer == null) {
				to = UserRestURIConstants.PAGE_SAVIE_LANDING;
			} else {
				to = UserRestURIConstants.PAGE_SAVIE_EDIT_VIEW;
			}
		}

		logger.debug("to : " + to);
		to=UserRestURIConstants.getSitePath(request)+ "savie/"+ to;
		logger.debug("return to : " + to);
		model.addAttribute("nextPageFlow", to);	
		
		logger.debug("-----------------------------------end--------------------------------------------");
		
		return new ModelAndView(UserRestURIConstants.getSitePath(request) + "savie/"+ current);

	}

}
