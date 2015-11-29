package com.ifwd.fwdhk.util;

import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;



public class ErrorMessageUtils {

	
	public static String getMessage(String key,HttpServletRequest request){
		String str = "";
		try {
			String language = (String) request.getSession().getAttribute("language");
			if(StringUtils.isEmpty(language)){
				language = "en";
			}
			str = WebServiceUtils.getMessage(key, language);
//			Locale locale = getLanguage(request);
//			ResourceBundle res = ResourceBundle.getBundle("messages", locale);
//			str = res.getString(key);
		} catch (Exception e) {
			return "system error";
		}
		return str;
	}
	public static String getMessage(String message,String key,HttpServletRequest request){
		String str = "";
		try {
			Locale locale = getLanguage(request);
			ResourceBundle res = ResourceBundle.getBundle("messages", locale);
			str = res.getString(key);
		} catch (Exception e) {
			return "system error";
		}
		return message+" "+str;
	}
	
	static Locale getLanguage(HttpServletRequest request){
		String language = (String) request.getSession().getAttribute("language");
		if(StringUtils.isEmpty(language)){
			return Locale.US;
		}else if("en".equals(language.toLowerCase())){
			return Locale.US;
		}else if("tc".equals(language.toLowerCase())){
			return Locale.TAIWAN;
		}
		return Locale.US;
	}
}
