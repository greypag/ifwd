package com.ifwd.fwdhk.message;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONObject;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;



import org.slf4j.Logger;

import com.ifwd.fwdhk.controller.AjaxEasyHealthController;
import com.ifwd.fwdhk.util.MessagePageEntity;
import com.ifwd.fwdhk.util.MessagePageUtils;
@Controller
public class AjaxMessagePageController{
	
	private final static Logger logger = LoggerFactory.getLogger(AjaxEasyHealthController.class);
	
	@Autowired protected ECommConnector connector;
	
	@Autowired  
	private javax.servlet.ServletContext application;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/ajax/getAllMessagePage", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getAllMessagePage(HttpServletRequest request,HttpServletResponse response) {
		String path = getClass().getResource("/").getFile().toString().replace("/classes" , "")+"jsp/merged";
		JSONObject json  = new JSONObject();
		List<MessagePageEntity> mpList=null;
		try {
			mpList = MessagePageUtils.getAllMessagePage(path);
			json.put("messagePage", mpList);
			json.put("errMsgs", null);
		} catch (Exception e) {
			logger.error(e.getMessage());
			json.put("messagePage", mpList);
			json.put("errMsgs", "system error");
		}
		//ajaxReturn(response,mpList);
		return json;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/ajax/getMessagePage", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getMessagePage(HttpServletRequest request,HttpServletResponse response) {
		JSONObject json  = new JSONObject();
		String path = getClass().getResource("/").getFile().toString().replace("/classes" , "")+"jsp/merged";
		String messageKey = request.getParameter("messageKey");
		if(StringUtils.isEmpty(messageKey)){
			json.put("page", null);
			json.put("errMsgs", "messageKey is null");
			return json;
		}
		String page="";
		try {
			page = MessagePageUtils.getMessagePage(messageKey, path);
			json.put("page", page);
			json.put("errMsgs", null);
		} catch (Exception e) {
			logger.error(e.getMessage());
			json.put("page", page);
			json.put("errMsgs", "system error");
		}
		return json;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/ajax/getMessageRefresh", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject getMessageRefresh(HttpServletRequest request,HttpServletResponse response) {
		JSONObject json  = new JSONObject();
		MessageResponse messageResponse=connector.getAllMessage();
		Map<String,Map<String,String>> allMessages=messageResponse.getAllMessages();
		try {
			application.setAttribute("allMessages", allMessages);
			json.put("errMsgs", "I18N Refresh Success.");
		} catch (Exception e) {
			logger.error(e.getMessage());
			json.put("errMsgs", "I18N Refresh Fail.");
		}
		return json;
	}
	
}
