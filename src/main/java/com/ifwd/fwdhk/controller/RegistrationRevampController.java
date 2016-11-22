package com.ifwd.fwdhk.controller;

import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;
import static org.springframework.web.bind.annotation.RequestMethod.PUT;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.management.ManagementFactory;
import java.lang.management.RuntimeMXBean;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import springfox.documentation.annotations.ApiIgnore;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.collect.Maps;
import com.ifwd.fwdhk.controller.core.Responses;
import com.ifwd.fwdhk.model.registrationrevamp.ForgetUsernameRequest;
import com.ifwd.fwdhk.model.registrationrevamp.ForgetUsernameResponse;
import com.ifwd.fwdhk.util.HeaderUtil;
import com.ifwd.fwdhk.util.WebServiceUtils;


@Controller
@RequestMapping(value = "/api/member/", produces = {APPLICATION_JSON_VALUE} )
@Api(value = "/member", description = "Member registration revamp")
public class RegistrationRevampController extends BaseController{
	private final static Logger logger = LoggerFactory.getLogger(RegistrationRevampController.class);
	
	@Autowired
	private HeaderUtil headerUtil;
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@ApiOperation(
			value = "Forgot Customer Username ",
			response = ForgetUsernameResponse.class
			)
	@ApiResponses(value = {
			@ApiResponse(code = 500, message = "System error"),
			@ApiResponse(code = 400, message = "Invalid Input")
			})
	@RequestMapping(value = "/forgotUserName/customer", method = POST)
	public ResponseEntity<ForgetUsernameResponse> getCustomerUserName(
			@ApiParam(value = "Policy Id, Doc No., Dob", required = true) @RequestBody ForgetUsernameRequest revampReq,
			HttpServletRequest request) {

		String methodName="getCustomerUserName";
		logger.debug(methodName+" getPolicyId:"+revampReq.getPolicyNo());
		
		
		JSONObject responseJsonObj = new JSONObject();		
		ResponseEntity responseEntity =Responses.error(null);
		try {			
			// ******************* Form URL *******************
			String url = UserRestURIConstants.REGISTRATION_REVAMP_FORGET_USERNAME;
			
			String jsonString = new ObjectMapper().writeValueAsString(revampReq);			
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
			logger.debug(methodName+" jsonInput:"+jsonInput.toString());
			
			// ******************* Consume Service *******************
			
			//Map<String,String> header = Maps.newHashMap();
			//header=headerUtil.getHeader(request);
			//header.remove("username");  //*DIRECTGI
			//responseJsonObj = restService.consumeApi(HttpMethod.POST, url, header, jsonInput);
			responseJsonObj = restService.consumeApi(HttpMethod.POST, url, headerUtil.getHeader(request), jsonInput);
			
			// ******************* Makeup result *******************			
			responseEntity=getResponseEntityByJsonObj(methodName,ForgetUsernameResponse.class,responseJsonObj);
			
		} catch (Exception e) {
			logger.error(methodName+" System error:",e);
			return responseEntity;
		}
		return responseEntity;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked", "null" })
	private <T> ResponseEntity getResponseEntityByJsonObj(String methodName,
			Class<T> responseClass,
			JSONObject responseJsonObj) throws JsonParseException, JsonMappingException, IOException {
		//MessageCodeUtil messageUtil=new MessageCodeUtil();
		if (responseJsonObj==null){
			return Responses.error(null);
		}
		logger.info(methodName+" response :" + responseJsonObj.toString());
		T responseObject=null;
		String errMsg=null;
		if(responseJsonObj.get("errMsgs") instanceof JSONArray){
			errMsg=(String) ((JSONArray) responseJsonObj.get("errMsgs")).get(0);
		}else{
		errMsg=(String) responseJsonObj.get("errMsgs");
		}
		if(errMsg==null || errMsg.length()==0){
			responseJsonObj.remove("errMsgs");
			//mapping
			if(responseJsonObj.toString().length() > 0) {
				ObjectMapper mapper = new ObjectMapper();
				responseObject= (T) mapper.readValue(responseJsonObj.toString(), responseClass);
				logger.debug(methodName+" "+responseClass.getName()+" apiResponse: "+responseClass.toString()+" "+responseObject.toString());
			} else {
				logger.info(methodName+" "+responseClass.getName()+" "+"not found");
				return Responses.notFound(null);
			}
				
		}else{
			try {
				logger.info(methodName+" System error:" + errMsg);
				String resultCode="";
				switch (errMsg) {
				case "Invalid Input":
					resultCode="400";
					break;
				case "System error":
					resultCode="500";
					break;
				default:
					resultCode="500";
					break;
				}
				responseJsonObj.put("message", errMsg);
				responseJsonObj.remove("errMsgs");
				ObjectMapper mapper = new ObjectMapper();
				responseObject= (T) mapper.readValue(responseJsonObj.toString(), responseClass);
				return new ResponseEntity<T>(responseObject, HttpStatus.valueOf(Integer.parseInt(resultCode)));
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
				logger.error(e.getMessage());
				return Responses.error(null);
			}
		}
		return Responses.ok(responseObject);
	}
	
}
