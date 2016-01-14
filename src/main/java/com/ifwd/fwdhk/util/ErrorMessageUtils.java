package com.ifwd.fwdhk.util;

import java.io.InputStream;
import java.util.Properties;
import javax.servlet.http.HttpServletRequest;

public class ErrorMessageUtils {
	public static String getMessage(String key,HttpServletRequest request) {
    	String language = (String) request.getSession().getAttribute("language");
        try {
            Properties propEn = new Properties();
            InputStream stream = null;
            ClassLoader loader = Thread.currentThread().getContextClassLoader();  
            if (language.toUpperCase().equals("EN"))
            	 stream = loader.getResourceAsStream("messages_en_US.properties");
            else
            	stream = loader.getResourceAsStream("messages_zh_HK.properties");
            propEn.load(stream);
            return  (String)propEn.get(key);
        } catch (Exception e) {
        	e.printStackTrace();
        	return "system error";
        }
	}
	
	public static String getMessage(String message,String key,HttpServletRequest request){
		String language = (String) request.getSession().getAttribute("language");
		String str = "";
        try {
            Properties propEn = new Properties();
            InputStream stream = null;
            ClassLoader loader = Thread.currentThread().getContextClassLoader();  
            if (language.toUpperCase().equals("EN"))
            	 stream = loader.getResourceAsStream("messages_en_US.properties");
            else
            	stream = loader.getResourceAsStream("messages_zh_HK.properties");
            propEn.load(stream);
            str = (String)propEn.get(key);
        } catch (Exception e) {
        	e.printStackTrace();
        	str = "system error";
        }
		return message+" "+str;
	}
}
