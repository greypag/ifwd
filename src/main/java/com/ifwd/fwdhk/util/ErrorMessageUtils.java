package com.ifwd.fwdhk.util;

import java.util.Locale;
import java.util.ResourceBundle;



public class ErrorMessageUtils {

	
	public static String getMessage(String key){
		String str = "";
		try {
			Locale locale = getLanguage();
			ResourceBundle res = ResourceBundle.getBundle("messages", locale);
			str = res.getString(key);
		} catch (Exception e) {
			return "system error";
		}
		return str;
	}
	public static String getMessage(String message,String key){
		String str = "";
		try {
			Locale locale = getLanguage();
			ResourceBundle res = ResourceBundle.getBundle("messages", locale);
			str = res.getString(key);
		} catch (Exception e) {
			return "system error";
		}
		return message+" "+str;
	}
	
	static Locale getLanguage(){
		return Locale.getDefault();
	}
}
