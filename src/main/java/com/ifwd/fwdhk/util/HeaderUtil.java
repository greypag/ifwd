package com.ifwd.fwdhk.util;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.google.common.collect.Maps;
import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.controller.UserRestURIConstants;

@Component
public class HeaderUtil{
	@Autowired
	private RestServiceDao restService;
	/**
	 * init Header Map info
	 * @param request HttpServletRequest request
	 * @return Map<String,String>
	 */
	public Map<String,String> getHeader(HttpServletRequest request){
		String token = null, username = null;
		HttpSession session = request.getSession();
		if((session.getAttribute("token") != null) && (session.getAttribute("username") != null)){
			token = session.getAttribute("token").toString();
			username = session.getAttribute("username").toString();
		}else{
			restService.consumeLoginApi(request);
			if ((session.getAttribute("token") != null)) {
				token = session.getAttribute("token").toString();
				username = session.getAttribute("username").toString();
			}
		}
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc")){
			lang = "CN";
		}
		Map<String,String> header = Maps.newHashMap();
		//header.put("country", "HK");
		header.put("language", WebServiceUtils.transformLanaguage(lang));
		header.put("token", token);
		header.put("username", username);
		header.put("Content-Type", "application/json");
		return header;
	}
}
