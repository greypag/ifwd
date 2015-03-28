package com.ifwd.fwdhk.util;

import com.opensymphony.sitemesh.webapp.SiteMeshFilter;


public class CharsetEncodingFilter extends SiteMeshFilter{
	
	/*@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
			FilterChain filterChain) throws IOException, ServletException {
		if(servletRequest.getCharacterEncoding() == null){
    		servletRequest.setCharacterEncoding("UTF-8");
		}
        servletResponse.setContentType("text/html;charset=UTF-8");
        filterChain.doFilter(servletRequest, servletResponse);
		super.doFilter(servletRequest, servletResponse, filterChain);
	}*/

}
