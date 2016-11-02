package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.Methods;
@Controller
public class AjaxUserController extends BaseController{
	private final static Logger logger = LoggerFactory.getLogger(AjaxUserController.class);
	
	@Autowired
	private RestServiceDao restService;
	
	@Autowired
	private CommonUtils commonUtils;

	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = {"/ajax/checkSession"} )
	public void checkSessionAjax(HttpServletRequest request, HttpServletResponse response) {
		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		
		String username = null;
		String password = null;
		String token = null;
		
		HttpSession session = request.getSession();
		username=session.getAttribute("username")==null?"":session.getAttribute("username").toString();
		if (request != null) {			
			if(session != null && session.getAttribute("token") != null && session.getAttribute("username") != null) {
				username = session.getAttribute("username").toString();
				token = session.getAttribute("token").toString();

				HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
				header.put("userName", username);
				header.put("token", token);
				logger.info(header.toString());
				JSONObject responseObj = restService.consumeApi(HttpMethod.POST, UserRestURIConstants.VALIDATE_SESSION, header, null);
				if (responseObj.get("errMsgs") == null) {
					jsonObject.put("errorMsg", null);
				}
				else
				{
					jsonObject.put("errorMsg", responseObj.get("errMsgs"));
				}
			}							
		}
		if (StringUtils.isEmpty(username)){		
			username="*DIRECTGI";
			password="";
			JSONObject params = new JSONObject();
			params.put("userName", "*DIRECTGI");
			params.put("password", "");				
			jsonObject = restService.consumeApi(HttpMethod.POST, UserRestURIConstants.USER_LOGIN, COMMON_HEADERS, params);
			if(jsonObject.get("errMsgs")==null)
			{
				session.setAttribute("username", jsonObject.get("userName"));
				session.setAttribute("token", jsonObject.get("token"));
			}
		}
		//logger.info(jsonObject.toString());
		JSONObject resultObject = new JSONObject();
		resultObject.put("errorMsg", jsonObject.get("errMsgs"));
		ajaxReturn(response, resultObject);

	}
	
	
}
