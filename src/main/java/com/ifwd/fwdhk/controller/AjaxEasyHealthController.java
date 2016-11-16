package com.ifwd.fwdhk.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.easyhealth.EasyHealthPlanDetailBean;
import com.ifwd.fwdhk.services.EasyHealthService;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.Methods;
@Controller
public class AjaxEasyHealthController extends BaseController{
	private final static Logger logger = LoggerFactory.getLogger(AjaxEasyHealthController.class);
	
	@Autowired
	private RestServiceDao restService;
	@Autowired
	private EasyHealthService easyHealthService;
	
	@Autowired
	private CommonUtils commonUtils;
	
	private static final String WATERMARK = "/resources/images/elite-terms/Watermark.png";
	
	@RequestMapping(value = {"/ajax/medical-insurance/getPremium"})
	public void getPremium(EasyHealthPlanDetailBean planDetail,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			jsonObject = easyHealthService.getPremium(planDetail, request);
		}
		catch (ECOMMAPIException e) {
			logger.error(e.getMessage());
			logger.error(ExceptionUtils.getStackTrace(e));
			jsonObject.put("errorMsg", e.getMessage());
		}
		logger.info(jsonObject.toString());
		ajaxReturn(response, jsonObject);
	}
	
	@RequestMapping(value = {"/ajax/medical-insurance/putPaymentSession"})
	public void putPaymentSession(HttpServletRequest request,HttpServletResponse response) {
		if (Methods.isXssAjax(request)) {
			return;
		}
		try {
			easyHealthService.putPaymentSession(request);
			ajaxReturn(response,"success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			logger.error(e.getMessage());
			logger.error(ExceptionUtils.getStackTrace(e));
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = {"/ajax/medical-insurance/putPremium"})
	public void putPremium(HttpServletRequest request,HttpServletResponse response) {
		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			easyHealthService.putPremium(request);
			logger.info("putPremium success");
		}
		catch (Exception e) {
			logger.error(e.getMessage());
			logger.error(ExceptionUtils.getStackTrace(e));
			jsonObject.put("errorMsg", e.getMessage());
		}
		logger.info(jsonObject.toString());
		ajaxReturn(response, jsonObject);
	}
}
