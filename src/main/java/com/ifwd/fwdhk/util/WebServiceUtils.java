package com.ifwd.fwdhk.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class WebServiceUtils {
	public static String transformLanaguage(String language) {
		if (language.equals("CN"))
			return "ZH";
		else
			return "EN";
	}
	
	public static String getParameterValue(String key, HttpSession session, HttpServletRequest request) {
		
		if (request.getParameter(key) == null) {
			return (String)session.getAttribute(key);
		}
		else {
			System.out.println("SET VALUE KEY " + key + " VALUE " + request.getParameter(key));
			session.setAttribute(key, request.getParameter(key));
			return request.getParameter(key);
		}
	}
}
