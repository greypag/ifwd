package com.ifwd.fwdhk.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.opensymphony.sitemesh.webapp.SiteMeshFilter;


public class SessionFilter implements Filter {
	

	
	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
			FilterChain filterChain) throws IOException, ServletException {
		
        
        HttpServletRequest request = (HttpServletRequest) servletRequest;   
        HttpServletResponse response = (HttpServletResponse) servletResponse;   
        HttpSession session = request.getSession();   
        String url = request.getServletPath();   
        
        if(url.indexOf("/resources/")<0)
        {
	        if (session.getAttribute("language") == null)
	        {
	        	session.setAttribute("language", "tc");
	        	session.setAttribute("uiLocale", "zh-HK");
	        }
        }
        
        filterChain.doFilter(servletRequest, servletResponse);
	
	}

	@Override
	public void destroy() {
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}

}
