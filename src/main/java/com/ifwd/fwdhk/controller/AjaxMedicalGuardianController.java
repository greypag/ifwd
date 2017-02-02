package com.ifwd.fwdhk.controller;

import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.easyhealth.EasyHealthPlanDetailBean;
import com.ifwd.fwdhk.services.EasyHealthService;
import com.ifwd.fwdhk.util.Methods;

@Controller
@RequestMapping(value = "/api/medicalguardian", produces = {APPLICATION_JSON_VALUE} )
@Api(value = "/medicalguardian", description = "Operations about medical guardian")
public class AjaxMedicalGuardianController extends BaseController{
	private final static Logger logger = LoggerFactory.getLogger(AjaxMedicalGuardianController.class);
	
	@Autowired
	private RestServiceDao restService;
	@Autowired
	private EasyHealthService easyHealthService;
	
	@ApiOperation(
			value = "Get Premium for Medical Guardian"
			)
	@RequestMapping(value = "/getPremium", method = POST)
	public void getMedicalGuardianPremium(@ApiParam(value = "Plan Detail Request", required = true) @RequestBody EasyHealthPlanDetailBean planDetail,HttpServletRequest request,HttpServletResponse response) {
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
}
