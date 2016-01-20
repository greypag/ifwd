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
import com.ifwd.fwdhk.model.savieOnline.LifeBeneficaryInfoBean;
import com.ifwd.fwdhk.model.savieOnline.LifeEmploymentInfoBean;
import com.ifwd.fwdhk.model.savieOnline.LifePaymentBean;
import com.ifwd.fwdhk.model.savieOnline.LifePersonalDetailsBean;
import com.ifwd.fwdhk.model.savieOnline.SaviePlanDetailsBean;
import com.ifwd.fwdhk.services.SavieOnlineService;
import com.ifwd.fwdhk.util.Methods;
import com.ifwd.utils.ValidationExceptions;
@Controller
public class AjaxSavieOnlineController extends BaseController{
	private final static Logger logger = LoggerFactory.getLogger(AjaxSavieOnlineController.class);
	
	@Autowired
	private RestServiceDao restService;
	@Autowired
	private SavieOnlineService savieOnlineService;
	
	@RequestMapping(value = {"/ajax/savie-online/getSavieOnlinePlandetails"})
	public void getSavieOnlinePlandetails(SaviePlanDetailsBean saviePlanDetails,HttpServletRequest request,HttpServletResponse response) {
		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			saviePlanDetails.validate(request);
			
			jsonObject.put("apiData", savieOnlineService.getSavieOnlinePlandetails(saviePlanDetails, request).toString());
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
	public void lifePersonalDetails(LifePersonalDetailsBean lifePersonalDetails ,HttpServletRequest request,HttpServletResponse response) {
		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			lifePersonalDetails.validate(request);
			request.getSession().setAttribute("lifePersonalDetails", lifePersonalDetails);
		}
		catch (ValidationExceptions e) {
			jsonObject.put("errorMsg", e.getResolvableMessage().getCodes()[0]);
		}
		logger.info(jsonObject.toString());
		ajaxReturn(response, jsonObject);
	}
	
	@RequestMapping(value = {"/ajax/savie-online/lifeEmploymentInfo"})
	public void lifeEmploymentInfo(LifeEmploymentInfoBean lifeEmploymentInfo,HttpServletRequest request,HttpServletResponse response) {
		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			lifeEmploymentInfo.validate(request);
			request.getSession().setAttribute("lifeEmploymentInfo", lifeEmploymentInfo);
		}
		catch (ValidationExceptions e) {
			jsonObject.put("errorMsg", e.getResolvableMessage().getCodes()[0]);
		}
		logger.info(jsonObject.toString());
		ajaxReturn(response, jsonObject);
	}
	
	@RequestMapping(value = {"/ajax/savie-online/lifeBeneficaryInfo"})
	public void lifeBeneficaryInfo(LifeBeneficaryInfoBean lifeBeneficaryInfo,HttpServletRequest request,HttpServletResponse response) {
		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			lifeBeneficaryInfo.validate(request);
			request.getSession().setAttribute("lifeBeneficaryInfo", lifeBeneficaryInfo);
		}
		catch (ValidationExceptions e) {
			jsonObject.put("errorMsg", e.getResolvableMessage().getCodes()[0]);
		}
		logger.info(jsonObject.toString());
		ajaxReturn(response, jsonObject);
	}
	
	@RequestMapping(value = {"/ajax/savie-online/lifePayment"})
	public void lifePayment(LifePaymentBean lifePayment,HttpServletRequest request,HttpServletResponse response) {
		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			lifePayment.validate(request);
			request.getSession().setAttribute("lifePayment", lifePayment);
		}
		catch (ValidationExceptions e) {
			jsonObject.put("errorMsg", e.getResolvableMessage().getCodes()[0]);
		}
		logger.info(jsonObject.toString());
		ajaxReturn(response, jsonObject);
	}
}
