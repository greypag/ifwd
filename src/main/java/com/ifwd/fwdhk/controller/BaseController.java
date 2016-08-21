package com.ifwd.fwdhk.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.connector.ECommWsConnector;
import com.ifwd.fwdhk.util.Methods;


public abstract class BaseController {
	
	@Autowired
	protected RestServiceDao restService;
	
	@Autowired 
	protected ECommWsConnector connector;
	
	protected boolean IsAuthenticate(HttpServletRequest request) {
		// TODO, check config and allow external request
		if (Methods.isXssAjax(request)) {
			throw new RuntimeException("Unauthentication");
		} else {
			return true;
		}
	}
		
	protected String checkJsonObjNull(JSONObject obj, String checkByStr) {
		if (obj.get(checkByStr) != null) {
			return obj.get(checkByStr).toString().trim();
		} else {
			return "";
		}
	}	
	
	protected String washGIMessage(String originalErrMsg) {
		return originalErrMsg.replaceAll("\"", "").replace("[", "").replace("]", "");
	}
	
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
	
	protected void ajaxReturn(HttpServletResponse response, JSONObject jsonObject){
		response.setContentType("text/json;charset=utf-8");
		try {
			response.getWriter().print(jsonObject.toString());
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
