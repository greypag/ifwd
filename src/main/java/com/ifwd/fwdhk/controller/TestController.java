package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.util.WebServiceUtils;

@Controller
public class TestController {
	
	@Autowired
	private RestServiceDao restService;
	
	@RequestMapping(value = {"/{lang}/testPaymentStatus" })
	public ModelAndView testPaymentStatus(Model model,HttpServletRequest request) {

		HttpSession session = request.getSession();
		String token = null, username = null;
		if ((session.getAttribute("token") != null)
				&& (session.getAttribute("username") != null)) {
			token = session.getAttribute("token").toString();
			username = session.getAttribute("username").toString();
		} else {
			restService.consumeLoginApi(request);
			if ((session.getAttribute("token") != null)) {
				token = session.getAttribute("token").toString();
				username = session.getAttribute("username").toString();
			}
		}
		String Url = UserRestURIConstants.TEST_PAYMENT_STATUS + "?orderRef=744RQWH00021";
		
		HashMap<String, String> header = new HashMap<String, String>(
				COMMON_HEADERS);
		if (request.getSession().getAttribute("username") != null) {
			header.put("userName", username);
			header.put("token", token);
		}
		
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		
		header.put("language", WebServiceUtils.transformLanaguage(lang));
		
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET, Url, header, null);
		String result = null;
		if(responseJsonObj.isEmpty()){
			result = "ISEMPTY";
		}else if(responseJsonObj.get("errMsgs") == null){
			result = "OK";
		}else {
			result = "ERROR";
		}
		model.addAttribute("result", result);
		return new ModelAndView(UserRestURIConstants.getSitePath(request) + "testPaymentResult");
	}
	
	@RequestMapping(value = {"/{lang}/testPaymentStatusView" })
	public ModelAndView prepareYourDetails(HttpServletRequest request) {
		return new ModelAndView(UserRestURIConstants.getSitePath(request) + "testPaymentStatus");
	}
	
}
