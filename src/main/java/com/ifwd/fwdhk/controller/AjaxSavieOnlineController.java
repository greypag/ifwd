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
			
			ValidationUtils.validation("insuredAmount", "insuredAmount", insuredAmount, request);
			ValidationUtils.validation("dob","dob", dob, request);
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
			ValidationUtils.validation("firstname","firstname", request.getParameter("firstname"), request);
			ValidationUtils.validation("lastname","lastname", request.getParameter("lastname"), request);
			ValidationUtils.validation("chineseName","chineseName", request.getParameter("chineseName"), request);
			ValidationUtils.validation("dob","dob", request.getParameter("dob"), request);
			ValidationUtils.validation("gender","gender", request.getParameter("gender"), request);
			ValidationUtils.validation("hkid","hkid", request.getParameter("hkid"), request);
			ValidationUtils.validation("martialStatus","martialStatus", request.getParameter("martialStatus"), request);
			ValidationUtils.validation("mobile","mobile", request.getParameter("mobileNumber"), request);
			ValidationUtils.validation("email","email", request.getParameter("emailAddress"), request);
			ValidationUtils.validation("placeOfBirth","placeOfBirth", request.getParameter("placeOfBirth"), request);
			ValidationUtils.validation("nationalty","nationalty", request.getParameter("nationalty"), request);
		}
		catch (ValidationExceptions e) {
			jsonObject.put("errorMsg", e.getResolvableMessage().getCodes()[0]);
		}
		logger.info(jsonObject.toString());
		ajaxReturn(response, jsonObject);
	}
	
	@RequestMapping(value = {"/ajax/savie-online/lifeEmploymentInfo"})
	public void lifeEmploymentInfo(HttpServletRequest request,HttpServletResponse response) {
		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			ValidationUtils.validation("NOTNULL", "employmentStatus", request.getParameter("employmentStatus"), request);
			ValidationUtils.validation("NOTNULL", "natureOfBusiness", request.getParameter("natureOfBusiness"), request);
			ValidationUtils.validation("NOTNULL", "occupation", request.getParameter("occupation"), request);
			ValidationUtils.validation("NOTNULL", "employerName", request.getParameter("employerName"), request);
			ValidationUtils.validation("NOTNULL", "monthlyPersonalIncome", request.getParameter("monthlyPersonalIncome"), request);
			ValidationUtils.validation("NOTNULL", "education", request.getParameter("education"), request);
			ValidationUtils.validation("NOTNULL", "amountOfOtherSourceOfIncome", request.getParameter("amountOfOtherSourceOfIncome"), request);
			ValidationUtils.validation("NOTNULL", "amountOfLiquidAssets", request.getParameter("amountOfLiquidAssets"), request);
		}
		catch (ValidationExceptions e) {
			jsonObject.put("errorMsg", e.getResolvableMessage().getCodes()[0]);
		}
		logger.info(jsonObject.toString());
		ajaxReturn(response, jsonObject);
	}
}
