package com.ifwd.fwdhk.controller;

import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.controller.core.Responses;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.easyhealth.CansurancePremium;
import com.ifwd.fwdhk.model.easyhealth.EasyHealthPlanDetailBean;
import com.ifwd.fwdhk.services.MedicalGuardianService;
import com.ifwd.fwdhk.util.Methods;

@Controller
@RequestMapping(value = "/api/medicalguardian", produces = {APPLICATION_JSON_VALUE} )
@Api(value = "/medicalguardian", description = "Operations about medical guardian")
public class AjaxMedicalGuardianController extends BaseController{
	private final static Logger logger = LoggerFactory.getLogger(AjaxMedicalGuardianController.class);
	
	
	
	@Autowired
	private RestServiceDao restService;
	@Autowired
	private MedicalGuardianService medicalGuardianService;
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@ApiOperation(
			value = "Get Premium for Medical Guardian",
			response = CansurancePremium.class
			)
	@ApiResponses(value = {
			@ApiResponse(code = 412, message = "Missing dob"),
			@ApiResponse(code = 413, message = "Invalid dob"),
			@ApiResponse(code = 414, message = "Missing smoker"),
			@ApiResponse(code = 415, message = "Invalid smoker"),
			@ApiResponse(code = 416, message = "Missing gender"),
			@ApiResponse(code = 417, message = "Invalid gender"),
			@ApiResponse(code = 504, message = "System error"),
			@ApiResponse(code = 418, message = "Invalid referral code")
			})
	@RequestMapping(value = "/getPremium", method = POST)
	public ResponseEntity<CansurancePremium> getMedicalGuardianPremium(@ApiParam(value = "Plan Detail Request", required = true) @RequestBody EasyHealthPlanDetailBean planDetail,HttpServletRequest request,HttpServletResponse response) {

		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return Responses.badRequest(null);
		}
		try {
			jsonObject = medicalGuardianService.getPremium(planDetail, request);
			logger.info(jsonObject.toString());
		}catch (ECOMMAPIException e) {
			logger.error(e.getMessage());
			logger.error(ExceptionUtils.getStackTrace(e));
			jsonObject.put("errorMsg", e.getMessage());
		}
				
		CansurancePremium responseObject = new CansurancePremium();
		ObjectMapper mapper = new ObjectMapper();
		try {
			responseObject= (CansurancePremium) mapper.readValue(jsonObject.toString(), CansurancePremium.class);
		} catch (IOException e) {
			logger.error(e.getMessage());
			responseObject.setErrMsgs(e.getMessage());
			return Responses.error(responseObject);
		}

		return Responses.ok(responseObject);
	}
}
