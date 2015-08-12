package com.ifwd.fwdhk.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LanguageInterceptor extends HandlerInterceptorAdapter{
	
	
	@Override
	  public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
	                             Object handler) throws Exception {
		HttpSession session = request.getSession();   
		String url = request.getServletPath();   
        
		if(url.indexOf("/en/")>=0) {
        	session.setAttribute("language", "en");
        	session.setAttribute("uiLocale", "en-US");
        }else if(url.indexOf("/tc/")>=0){
        	session.setAttribute("language", "tc");
        	session.setAttribute("uiLocale", "zh-HK");        	
        }
		
		
		return true;
	} 
}
