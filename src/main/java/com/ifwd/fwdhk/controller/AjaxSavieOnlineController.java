package com.ifwd.fwdhk.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.connector.response.BaseResponse;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.exception.ValidationExceptions;
import com.ifwd.fwdhk.services.SavieOnlineService;
import com.ifwd.fwdhk.services.SavieService;
import com.ifwd.fwdhk.util.Methods;
import com.ifwd.fwdhk.util.ValidationUtils;
@Controller
public class AjaxSavieOnlineController extends BaseController{
	private final static Logger logger = LoggerFactory.getLogger(AjaxSavieOnlineController.class);
	
	@Autowired
	private RestServiceDao restService;
	@Autowired
	private SavieOnlineService savieOnlineService;
	
	@RequestMapping(value = {"/ajax/savie-online/plandetails/getData"})
	public void getSavieOnlinePlandetails(HttpServletRequest request,HttpServletResponse response) {
		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			jsonObject.put("apiData", savieOnlineService.getSavieOnlinePlandetails(request).toString());
		}
		catch (ECOMMAPIException e) {
			jsonObject.put("errorMsg", e.getMessage());
		}
		logger.info(jsonObject.toString());
		ajaxReturn(response, jsonObject);
	}

	@RequestMapping(value = {"/ajax/savie-online/plandetails/validateForm"})
	public void plandetailsValidateFormByAjax(HttpServletRequest request,HttpServletResponse response) {
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			savieOnlineService.plandetailsValidateFormByAjax(request);
		}
		catch (ValidationExceptions e) {
			ajaxReturn(response, e.getResolvableMessage().getCodes());
		}
	}
}
