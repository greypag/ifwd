package com.ifwd.fwdhk.util;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.controller.UserRestURIConstants;

public class MotorPageFlowControl {

	private final static Logger logger = LoggerFactory
			.getLogger(MotorPageFlowControl.class);

	
	public static ModelAndView pageFlow(String plan, Model model, HttpServletRequest request, String key) {

		logger.debug("--------	---------------------------page flow start--------------------------------------------");
		
		UserRestURIConstants.setController("Motor");
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
		String filePath = "motor/";
		
		if (referer != null) {
			if(referer.substring(referer.lastIndexOf("/") + 1).equalsIgnoreCase("tc") || referer.substring(referer.lastIndexOf("/") + 1).equalsIgnoreCase("en")){
				referer = UserRestURIConstants.URL_MOTOR_LANDING;
			} else {
				referer = getPage(referer);
			}
		}

		if (current != null) {
			if(current.substring(current.lastIndexOf("/") + 1).equalsIgnoreCase("tc") || current.substring(current.lastIndexOf("/") + 1).equalsIgnoreCase("en")){
				current = UserRestURIConstants.URL_MOTOR_LANDING;
			} else {
				current = getPage(current);
			}
		}

		String to = "";
		String to2 = "";
		String fileName = "";
		logger.debug("referer : " + referer);
		logger.debug("current : " + current);

		switch (current) {
			case UserRestURIConstants.URL_MOTOR_LANDING:
				to = UserRestURIConstants.URL_MOTOR_GET_QUOTE;
				fileName = UserRestURIConstants.FILE_MOTOR_LANDING;
				break;
			case UserRestURIConstants.URL_MOTOR_GET_QUOTE:
				to = UserRestURIConstants.URL_MOTOR_PLAN_THIRD;
				to2 = UserRestURIConstants.URL_MOTOR_PLAN_COMP;
				fileName = UserRestURIConstants.FILE_MOTOR_GET_QUOTE;
				break;
			case UserRestURIConstants.URL_MOTOR_PLAN_THIRD: 
				to = UserRestURIConstants.URL_MOTOR_PLAN_COMP;
				fileName = UserRestURIConstants.FILE_MOTOR_PLAN_THIRD;
				break;
			case UserRestURIConstants.URL_MOTOR_PLAN_COMP: 
				to = UserRestURIConstants.URL_MOTOR_QUICK_QUOTE;
				fileName = UserRestURIConstants.FILE_MOTOR_PLAN_COMP;
				break;
			
			case UserRestURIConstants.URL_MOTOR_QUICK_QUOTE: 
				to = UserRestURIConstants.URL_MOTOR_CAR_DETAILS;
				fileName = UserRestURIConstants.FILE_MOTOR_QUICK_QUOTE;
				break;		
			/*case UserRestURIConstants.URL_MOTOR_RIDER_OPTIONS: 
				to = UserRestURIConstants.URL_MOTOR_CAR_DETAILS;
				fileName = UserRestURIConstants.FILE_MOTOR_RIDER_OPTIONS;
				break;	*/			
			case UserRestURIConstants.URL_MOTOR_CAR_DETAILS: 
				to = UserRestURIConstants.URL_MOTOR_DRIVERS_DETAILS;
				fileName = UserRestURIConstants.FILE_MOTOR_CAR_DETAILS;
				break;
			case UserRestURIConstants.URL_MOTOR_DRIVERS_DETAILS: 
				to = UserRestURIConstants.URL_MOTOR_POLICY_DETAILS;
				fileName = UserRestURIConstants.FILE_MOTOR_DRIVERS_DETAILS;
				break;
			case UserRestURIConstants.URL_MOTOR_POLICY_DETAILS: 
				to = UserRestURIConstants.URL_MOTOR_DECLARATIONS;
				fileName = UserRestURIConstants.FILE_MOTOR_POLICY_DETAILS;
				break;
			case UserRestURIConstants.URL_MOTOR_DECLARATIONS: 
				to = UserRestURIConstants.URL_MOTOR_APPLICATION_SUMMARY;
				fileName = UserRestURIConstants.FILE_MOTOR_DECLARATIONS;
				break;
			case UserRestURIConstants.URL_MOTOR_APPLICATION_SUMMARY: 
				to = UserRestURIConstants.URL_MOTOR_CONFIRMATION;
				fileName = UserRestURIConstants.FILE_MOTOR_APPLICATION_SUMMARY;
				break;
			case UserRestURIConstants.URL_MOTOR_CONFIRMATION: 
				to = UserRestURIConstants.URL_MOTOR_DOCUMENT_UPLOAD;
				fileName = UserRestURIConstants.FILE_MOTOR_CONFIRMATION;
				break;
			case UserRestURIConstants.URL_MOTOR_DOCUMENT_UPLOAD: 
				to = UserRestURIConstants.URL_MOTOR_DOCUMENT_UPLOAD_CONFIRMATION;
				fileName = UserRestURIConstants.FILE_MOTOR_DOCUMENT_UPLOAD;
				break;
			case UserRestURIConstants.URL_MOTOR_DOCUMENT_UPLOAD_CONFIRMATION: 
				to = UserRestURIConstants.URL_MOTOR_DOCUMENT_UPLOAD_LATER;
				fileName = UserRestURIConstants.FILE_MOTOR_DOCUMENT_UPLOAD_CONFIRMATION;
				break;
			case UserRestURIConstants.URL_MOTOR_DOCUMENT_UPLOAD_LATER: 
				to = UserRestURIConstants.URL_MOTOR_DOCUMENT_UPLOAD_LATER_CONFIRMATION;
				fileName = UserRestURIConstants.FILE_MOTOR_DOCUMENT_UPLOAD_LATER;
				break;
			case UserRestURIConstants.URL_MOTOR_DOCUMENT_UPLOAD_LATER_CONFIRMATION: 
				to = "";
				fileName = UserRestURIConstants.FILE_MOTOR_DOCUMENT_UPLOAD_LATER_CONFIRMATION;
				break;
			case UserRestURIConstants.URL_MOTOR_PAYMENT_RESULT: 
				to = UserRestURIConstants.URL_MOTOR_DOCUMENT_UPLOAD;
				fileName = UserRestURIConstants.FILE_MOTOR_CONFIRMATION;
				break;
			default:
				to = UserRestURIConstants.URL_MOTOR_LANDING;
				fileName = UserRestURIConstants.FILE_MOTOR_LANDING;
		}

		logger.debug("nextPageFlow : " + to);
		logger.debug("nextPageFlow2 : " + to2);

		model.addAttribute("nextPageFlow", to);
		model.addAttribute("nextPageFlow2", to2);

		logger.debug(UserRestURIConstants.getSitePath(request) + filePath + fileName);

		logger.debug("-----------------------------------page flow end--------------------------------------------");

		return new ModelAndView(UserRestURIConstants.getSitePath(request) + filePath + fileName);
	}
	
	public static String getPage(String url){
		url=url+"/";
		if(url.endsWith("/"+UserRestURIConstants.URL_MOTOR_LANDING+"/")) {
			return UserRestURIConstants.URL_MOTOR_LANDING;
		}
		if(url.endsWith("/"+UserRestURIConstants.URL_MOTOR_GET_QUOTE+"/")) {
			return UserRestURIConstants.URL_MOTOR_GET_QUOTE;
		}
		if(url.endsWith("/"+UserRestURIConstants.URL_MOTOR_QUICK_QUOTE+"/")) {
			return UserRestURIConstants.URL_MOTOR_QUICK_QUOTE;
		}		
		if(url.endsWith("/"+UserRestURIConstants.URL_MOTOR_PLAN_THIRD+"/")) {
			return UserRestURIConstants.URL_MOTOR_PLAN_THIRD;
		}		
		if(url.endsWith("/"+UserRestURIConstants.URL_MOTOR_PLAN_COMP+"/")) {
			return UserRestURIConstants.URL_MOTOR_PLAN_COMP;
		}
		if(url.endsWith("/"+UserRestURIConstants.URL_MOTOR_QUICK_QUOTE+"/")) {
			return UserRestURIConstants.URL_MOTOR_QUICK_QUOTE;
		}
		if(url.endsWith("/"+UserRestURIConstants.URL_MOTOR_CAR_DETAILS+"/")) {
			return UserRestURIConstants.URL_MOTOR_CAR_DETAILS;
		}
		if(url.endsWith("/"+UserRestURIConstants.URL_MOTOR_DRIVERS_DETAILS+"/")) {
			return UserRestURIConstants.URL_MOTOR_DRIVERS_DETAILS;
		}
		if(url.endsWith("/"+UserRestURIConstants.URL_MOTOR_POLICY_DETAILS+"/")) {
			return UserRestURIConstants.URL_MOTOR_POLICY_DETAILS;
		}
		if(url.endsWith("/"+UserRestURIConstants.URL_MOTOR_DECLARATIONS+"/")) {
			return UserRestURIConstants.URL_MOTOR_DECLARATIONS;
		}
		if(url.endsWith("/"+UserRestURIConstants.URL_MOTOR_APPLICATION_SUMMARY+"/")) {
			return UserRestURIConstants.URL_MOTOR_APPLICATION_SUMMARY;
		}
		if(url.endsWith("/"+UserRestURIConstants.URL_MOTOR_DOCUMENT_UPLOAD+"/")) {
			return UserRestURIConstants.URL_MOTOR_DOCUMENT_UPLOAD;
		}
		if(url.endsWith("/"+UserRestURIConstants.URL_MOTOR_CONFIRMATION+"/")) {
			return UserRestURIConstants.URL_MOTOR_CONFIRMATION;
		}
		if(url.endsWith("/"+UserRestURIConstants.URL_MOTOR_DOCUMENT_UPLOAD_CONFIRMATION+"/")) {
			return UserRestURIConstants.URL_MOTOR_DOCUMENT_UPLOAD_CONFIRMATION;
		}
		if(url.endsWith("/"+UserRestURIConstants.URL_MOTOR_DOCUMENT_UPLOAD_LATER_CONFIRMATION+"/")) {
			return UserRestURIConstants.URL_MOTOR_DOCUMENT_UPLOAD_LATER_CONFIRMATION;
		}
		if(url.endsWith("/"+UserRestURIConstants.URL_MOTOR_DOCUMENT_UPLOAD_LATER+"/")) {
			return UserRestURIConstants.URL_MOTOR_DOCUMENT_UPLOAD_LATER;
		}
		if(url.endsWith("/"+UserRestURIConstants.URL_MOTOR_PAYMENT_RESULT+"/")) {
			return UserRestURIConstants.URL_MOTOR_PAYMENT_RESULT;
		}
		
		return "";
	}
}
