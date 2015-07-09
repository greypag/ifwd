package com.ifwd.fwdhk.controller;


import javax.servlet.http.HttpServletResponse;
import org.codehaus.jackson.map.ObjectMapper;


public abstract class BaseController{

	protected void ajaxReturn(HttpServletResponse response, Object object){
		response.setContentType("text/json;charset=utf-8");
		//return data
		ObjectMapper mapper = new ObjectMapper();
		try {
			final String objStr = mapper.writeValueAsString(object);
			response.getWriter().print(objStr);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
    
}
