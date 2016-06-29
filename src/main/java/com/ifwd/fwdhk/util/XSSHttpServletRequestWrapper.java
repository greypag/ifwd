package com.ifwd.fwdhk.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.lang3.StringEscapeUtils;

public class XSSHttpServletRequestWrapper extends HttpServletRequestWrapper {
	
	HttpServletRequest orgRequest = null;  

	public XSSHttpServletRequestWrapper(HttpServletRequest request) {
        super(request);
        orgRequest = request;
    }
	
    @Override  
    public String getParameter(String name) {
        return StringEscapeUtils.escapeHtml4(super.getParameter(name));
    }
  
    @Override
    public String getHeader(String name) {
        return StringEscapeUtils.escapeHtml4(super.getHeader(name));
    }
    
    @Override  
    public String getQueryString() {
        return StringEscapeUtils.escapeHtml4(super.getQueryString());
    }
    
    @Override
    public String[] getParameterValues(String name) {
        String[] values = super.getParameterValues(name);
        if(values != null) {
            int length = values.length;
            String[] escapseValues = new String[length];
            for(int i = 0; i < length; i++){
                escapseValues[i] = StringEscapeUtils.escapeHtml4(values[i]);
            }
            return escapseValues;
        }
        return super.getParameterValues(name);  
    }
  
    /** 
     * 获取最原始的request 
     *  
     * @return 
     */  
    public HttpServletRequest getOrgRequest() {  
        return orgRequest;  
    }  
  
    /** 
     * 获取最原始的request的静态方法 
     *  
     * @return 
     */  
    public static HttpServletRequest getOrgRequest(HttpServletRequest req) {  
        if (req instanceof XSSHttpServletRequestWrapper) {  
            return ((XSSHttpServletRequestWrapper) req).getOrgRequest();  
        }  
  
        return req;  
    }  
}
