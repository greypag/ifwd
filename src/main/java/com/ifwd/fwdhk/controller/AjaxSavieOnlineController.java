package com.ifwd.fwdhk.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.services.SavieOnlineService;
import com.ifwd.fwdhk.util.Methods;
import com.ifwd.utils.ValidationExceptions;
import com.ifwd.utils.ValidationUtils;
@Controller
public class AjaxSavieOnlineController extends BaseController{
	private final static Logger logger = LoggerFactory.getLogger(AjaxSavieOnlineController.class);
	
	@Autowired
	private RestServiceDao restService;
	@Autowired
	private SavieOnlineService savieOnlineService;
	
	@RequestMapping(value = {"/ajax/savie-online/getSavieOnlinePlandetails"})
	public void getSavieOnlinePlandetails(HttpServletRequest request,HttpServletResponse response) {
		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			String insuredAmount = request.getParameter("insuredAmount");
			String dob = request.getParameter("dob");
			String promoCode = request.getParameter("promoCode");
			
			ValidationUtils.validation("insuredAmount", insuredAmount, request);
			ValidationUtils.validation("dob", dob, request);
			//ValidationUtils.validation("promoCode", promoCode, request);
			
			jsonObject.put("apiData", savieOnlineService.getSavieOnlinePlandetails(request).toString());
		}
		catch (ValidationExceptions e) {
			jsonObject.put("errorMsg", e.getResolvableMessage().getCodes()[0]);
		}
		catch (ECOMMAPIException e) {
			jsonObject.put("errorMsg", e.getMessage());
		} 
		logger.info(jsonObject.toString());
		ajaxReturn(response, jsonObject);
	}
	
	@RequestMapping(value = {"/ajax/savie-online/lifePersonalDetails"})
	public void lifePersonalDetails(HttpServletRequest request,HttpServletResponse response) {
		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			ValidationUtils.validation("firstname", request.getParameter("firstname"), request);
			ValidationUtils.validation("lastname", request.getParameter("lastname"), request);
			ValidationUtils.validation("chineseName", request.getParameter("chineseName"), request);
			ValidationUtils.validation("dob", request.getParameter("dob"), request);
			ValidationUtils.validation("gender", request.getParameter("gender"), request);
			ValidationUtils.validation("hkid", request.getParameter("hkid"), request);
			ValidationUtils.validation("martialStatus", request.getParameter("martialStatus"), request);
			ValidationUtils.validation("mobile", request.getParameter("mobileNumber"), request);
			ValidationUtils.validation("email", request.getParameter("emailAddress"), request);
			ValidationUtils.validation("placeOfBirth", request.getParameter("placeOfBirth"), request);
			ValidationUtils.validation("nationalty", request.getParameter("nationalty"), request);
		}
		catch (ValidationExceptions e) {
			jsonObject.put("errorMsg", e.getResolvableMessage().getCodes()[0]);
		}
		logger.info(jsonObject.toString());
		ajaxReturn(response, jsonObject);
	}
}
