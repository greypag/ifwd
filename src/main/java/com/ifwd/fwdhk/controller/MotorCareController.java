package com.ifwd.fwdhk.controller;

import static org.apache.commons.lang3.StringUtils.isEmpty;
import static org.apache.commons.lang3.StringUtils.replace;
import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;
import static org.springframework.http.MediaType.APPLICATION_XML_VALUE;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fwd.model.common.CodeTable;
import com.fwd.model.motor.CarDetail;
import com.fwd.model.motor.MotorFile;
import com.fwd.model.motor.MotorFileDetails;
import com.fwd.model.payment.PayDollar;
import com.ifwd.fwdhk.controller.core.Responses;
import com.ifwd.fwdhk.model.OccupationBean;
import com.ifwd.fwdhk.model.motor.ContactMe;
import com.ifwd.fwdhk.model.motor.MotorCareDetails;
import com.ifwd.fwdhk.model.motor.MotorSaveForLater;
import com.ifwd.fwdhk.services.MotorCareValidationService;
import com.ifwd.fwdhk.util.HeaderUtil;

@Controller
@RequestMapping(value = "/api/iMotor", produces = {APPLICATION_JSON_VALUE, APPLICATION_XML_VALUE} )
@Api(value = "/iMotor", description = "To serve all operations regarding MotorCare")
public class MotorCareController extends BaseController{
			
	private final static Logger logger = LoggerFactory.getLogger(MotorCareController.class);

	@Autowired
	private MotorCareValidationService motorCareValidationService;
	@Autowired
	private HeaderUtil headerUtil;
	
	@ApiOperation(
			value = "This API is used to get available list of motor brands",
			response = CarDetail.class,
			responseContainer = "List"
			)
	@ApiResponses(value = {				
			@ApiResponse(code = 404, message = "System cannot find the list of car brands"),
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = "/list/carMakes", method = GET)
	public ResponseEntity<List<CarDetail>> getCarMakes(HttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("getCarMakes Autherticate error: " + e.toString() );
			return Responses.error(null);	
		}
			
		// ******************* Valid input *******************
		List<CarDetail> apiResponse = new ArrayList<CarDetail>();
		JSONObject responseJsonObj = new JSONObject();		
		
		try {			
			// ******************* Form URL *******************
			String url = UserRestURIConstants.MOTOR_CARE_CARMAKE_LIST_GET;
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.GET, url, headerUtil.getHeader(request), null);
			// ******************* Makeup result *******************			
			if (responseJsonObj.get("errMsgs") == null) {
				if(responseJsonObj.get("carDetail") != null && responseJsonObj.get("carDetail").toString().length() > 0) {
					ObjectMapper mapper = new ObjectMapper();				
					apiResponse = mapper.readValue(responseJsonObj.get("carDetail").toString(), mapper.getTypeFactory().constructCollectionType(List.class, CarDetail.class));
				} else {
					logger.info("getCarMakes carDetail not found");
					return Responses.notFound(null);
				}				
			} else {
				logger.info("getCarMakes System error:" + responseJsonObj.get("errMsgs").toString());
				return Responses.error(null);	
			}			
		} catch (Exception e) {
			logger.info("getCarMakes System error:" + e.toString());
			return Responses.error(null);	
		}
		return Responses.ok(apiResponse);
	}	
	
	@ApiOperation(
			value = "This API is used to get specific Car Details by make",
			response = CarDetail.class,
			responseContainer = "List"
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 400, message = "Invalid car make code"),
			@ApiResponse(code = 404, message = "System cannot find the car details by make code"),
			@ApiResponse(code = 500, message = "System error")
			})

    @RequestMapping(value = "/carDetails/{makeCode}", method = GET)
	public ResponseEntity<List<CarDetail>> getCarDetailsByMake(
            @ApiParam(value = "Car Make by", required = true) @PathVariable("makeCode") String makeCode,            
			HttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("getCarDetailsByMake Autherticate error: " + e.toString() );
			return Responses.error(null);	
		}
		// ******************* Valid input *******************
		if (isEmpty(makeCode)) {
			return Responses.badRequest(null);
		}
		
		// ******************* Init *******************
		List<CarDetail> apiResponse = new ArrayList<CarDetail>();		
		JSONObject responseJsonObj = new JSONObject();
		try {		
			// ******************* Form URL *******************
			String encodedMake = urlEncodeInputSpace(makeCode);
			String url = replace(UserRestURIConstants.MOTOR_CARE_CARDETAILS_BY_MAKE_GET,"{makeCode}", encodedMake);
			
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.GET, url, headerUtil.getHeader(request), null);
			
			// ******************* Makeup result *******************
			if (responseJsonObj.get("errMsgs") == null) {
				if(responseJsonObj.get("carDetail") != null && responseJsonObj.get("carDetail").toString().length() > 0) {
					ObjectMapper mapper = new ObjectMapper();				
					apiResponse = mapper.readValue(responseJsonObj.get("carDetail").toString(), mapper.getTypeFactory().constructCollectionType(List.class, CarDetail.class));
				} else {
					logger.info("getCarDetailsByMake carDetail not found");
					return Responses.notFound(null);
				}
				
			} else {
				logger.info("getCarDetailsByMake System error:" + responseJsonObj.get("errMsgs").toString());
				return Responses.error(null);				
			}
		} catch (Exception e) {
			logger.info("getCarDetailsByMake System error:" + e.toString());
			return Responses.error(null);		
		}
		return Responses.ok(apiResponse);
	}	
		
	@ApiOperation(
			value = "This API is used to get available list of Occupations",
			response = OccupationBean.class,
			responseContainer = "List"
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 404, message = "System cannot find the list of Occupations"),
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = "/list/occupations", method = GET)
	public ResponseEntity<List<OccupationBean>> getOccupations(HttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("getOccupations Autherticate error: " + e.toString() );
			return Responses.error(null);	
		}
		// ******************* Valid input *******************
		
		// ******************* Init *******************
		List<OccupationBean> apiResponse = new ArrayList<OccupationBean>();
//		JSONObject responseJsonObj = new JSONObject();		
//		try {
//			
//			// ******************* Form URL *******************
//			String url = UserRestURIConstants.MOTOR_CARE_OCCUPATIONS_GET;
//			
//			// ******************* Consume Service *******************
//			responseJsonObj = restService.consumeApi(HttpMethod.GET, url, headerUtil.getHeader(request), null);
//			
//			// ******************* Makeup result *******************
//			if (responseJsonObj.get("errMsgs") == null) {
//				if(responseJsonObj.get("occupationBean") != null && responseJsonObj.get("occupationBean").toString().length() > 0) {
//					ObjectMapper mapper = new ObjectMapper();				
//					apiResponse = mapper.readValue(responseJsonObj.get("occupationBean").toString(), mapper.getTypeFactory().constructCollectionType(List.class, OccupationBean.class));
//				} else {
//					return Responses.notFound(null);
//				}
//				
//			} else {
//				// add error handle
//			}
//			
//		} catch (Exception e) {
//			throw new RuntimeException("System error");
//		}
		
		apiResponse = motorCareValidationService.getMotorOccupationList();//TODO Quick solution, need to replace when eBao side ready
		return Responses.ok(apiResponse);
	}	
		
	@ApiOperation(
			value = "This API is used to register email to get promo code",
			response = String.class	
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 400, message = "Invalid Email address"),
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = "/email/promoCodes", method = POST)
	public ResponseEntity<Map<String, String>> getPromoCodes(
			@ApiParam(value = "Email address to get the promo code", required = true) @RequestBody String email,				
			HttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("getPromoCodes Autherticate error: " + e.toString() );
			return Responses.error(null);	
		}
							
		try {			
			Map<String, String> apiResponse = new HashMap<>();
			apiResponse.put("result", "OK");
			return Responses.ok(apiResponse);
			
		} catch (Exception e) {			
			logger.info("getPromoCodes System error:" + e.toString());
			return Responses.error(null);			
		}
	}

	@ApiOperation(
			value = "This API is used to get quotation details",
			response = MotorCareDetails.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 400, message = "Invalid info for quotation"),
			@ApiResponse(code = 417, message = "Invalid Make/Model" ),
			@ApiResponse(code = 414, message = "Invalid Make/Model Electronic Car" ),
			@ApiResponse(code = 406, message = "Invalid Occupation" ),
			@ApiResponse(code = 415, message = "Invalid NCD" ),
			@ApiResponse(code = 408, message = "Invalid Age" ),
			@ApiResponse(code = 409, message = "Invalid Driving Years" ),
			@ApiResponse(code = 416, message = "Invalid Year of Manufacture 8-13" ),
			@ApiResponse(code = 410, message = "Invalid Year of Manufacture" ),
			@ApiResponse(code = 412, message = "Invalid Estimated Value Maximum" ),
			@ApiResponse(code = 413, message = "Invalid Estimated Value Minimum" ),
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = {"/quote"}, method = POST)
	public ResponseEntity<MotorCareDetails> getQuote(
			@ApiParam(value = "Motor Care info (Type: e.g. Comp, Third)", required = true) @RequestBody MotorCareDetails quoteMotor,
			HttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("getQuote Autherticate error: " + e.toString() );
			return Responses.error(null);	
		}
		
		// ******************* Valid input *******************
		HttpStatus ifwdValidStatus = motorCareValidationService.validateMotorCareIfwd(quoteMotor);
		if(!HttpStatus.OK.equals(ifwdValidStatus)){
			logger.info("getQuote ifwdValidStatus:"+ifwdValidStatus);
			return new ResponseEntity<MotorCareDetails>((MotorCareDetails)null, ifwdValidStatus);
		}
		
		// ******************* Init *******************
		MotorCareDetails apiResponse = new MotorCareDetails();	
		JSONObject responseJsonObj = new JSONObject();		
		
		try {
			// ******************* Form URL and Object *******************
			String url = UserRestURIConstants.MOTOR_CARE_GET_QUOTE_POST;						
			String jsonString = new ObjectMapper().writeValueAsString(quoteMotor);			
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
			
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.POST, url, headerUtil.getHeader(request), jsonInput);
			
			// ******************* Makeup result *******************
			if (responseJsonObj.get("errMsgs") == null) {
				if(responseJsonObj.get("motorCareDetails") != null && responseJsonObj.get("motorCareDetails").toString().length() > 0) {
					ObjectMapper mapper = new ObjectMapper();
					apiResponse = mapper.readValue(responseJsonObj.get("motorCareDetails").toString(), MotorCareDetails.class);
				} else {
					logger.info("getQuote motorCareDetails not found");
					return Responses.notFound(null);
				}				
			} else {
				logger.info("getQuote System error:" + responseJsonObj.get("errMsgs").toString());
				return Responses.error(null);				
			}						
		} catch (Exception e) {
			logger.info("getQuote System error:" + e.toString());
			return Responses.error(null);			
		}
		return Responses.ok(apiResponse);
	}	
	
	@ApiOperation(
			value = "This API is used to save the quote and return MotorCareDetails with policyID for further actions",
			response = MotorCareDetails.class				
			)
	@ApiResponses(value = {
			@ApiResponse(code = 400, message = "Invalid info for quotation"),
			@ApiResponse(code = 417, message = "Invalid Make/Model" ),
			@ApiResponse(code = 414, message = "Invalid Make/Model Electronic Car" ),
			@ApiResponse(code = 406, message = "Invalid Occupation" ),
			@ApiResponse(code = 415, message = "Invalid NCD" ),
			@ApiResponse(code = 408, message = "Invalid Age" ),
			@ApiResponse(code = 409, message = "Invalid Driving Years" ),
			@ApiResponse(code = 416, message = "Invalid Year of Manufacture 8-13" ),
			@ApiResponse(code = 410, message = "Invalid Year of Manufacture" ),
			@ApiResponse(code = 412, message = "Invalid Estimated Value Maximum" ),
			@ApiResponse(code = 413, message = "Invalid Estimated Value Minimum" ),
			@ApiResponse(code = 500, message = "System error")
			}) 
	@RequestMapping(value = "/quote/saving", method = POST) 
	public ResponseEntity<MotorCareDetails> saveQuote( 
			@ApiParam(value = "Motor Care info (Type: e.g. Comp, Third)", required = true) @RequestBody MotorCareDetails quoteMotor,
			HttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("saveQuote Autherticate error: " + e.toString() );
			return Responses.error(null);	
		}
		// ******************* Valid input *******************
		if(!motorCareValidationService.isValidPlanCode(quoteMotor.getPlanCode())){
			logger.info("saveQuote Invalid Plan Code:"+quoteMotor.getPlanCode());
			if(quoteMotor.getPlanCode()!=null && quoteMotor.getPlanCode().startsWith("4")){//testing
				try {
					int testHttpStatus = Integer.parseInt(quoteMotor.getPlanCode());
					if(testHttpStatus>400 && testHttpStatus<500){
						return new ResponseEntity<MotorCareDetails>((MotorCareDetails)null, HttpStatus.valueOf(testHttpStatus));
					}
				} catch (NumberFormatException e) {}
			}			
			return Responses.badRequest(null);
		}
		
		HttpStatus ifwdValidStatus = motorCareValidationService.validateMotorCareIfwd(quoteMotor);
		if(!HttpStatus.OK.equals(ifwdValidStatus)){
			logger.info("saveQuote ifwdValidStatus:"+ifwdValidStatus);
			return new ResponseEntity<MotorCareDetails>((MotorCareDetails)null, ifwdValidStatus);
		}
		
		// ******************* Init *******************
		JSONObject responseJsonObj = new JSONObject();
		MotorCareDetails apiResponse = new MotorCareDetails();	
		
		try {
			// ******************* Form URL and Object *******************
			String url = UserRestURIConstants.MOTOR_CARE_SAVE_QUOTE_POST;						
			String jsonString = new ObjectMapper().writeValueAsString(quoteMotor);			
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
			logger.debug("saveQuote jsonInput:"+jsonInput.toString());
						
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.POST, url, headerUtil.getHeader(request), jsonInput);
			logger.debug("saveQuote responseJsonObj:"+responseJsonObj.toString());
			
			// ******************* Makeup result *******************
			if (responseJsonObj.get("errMsgs") == null) {
				if(responseJsonObj.get("motorCareDetails") != null && responseJsonObj.get("motorCareDetails").toString().length() > 0) {
					ObjectMapper mapper = new ObjectMapper();
					apiResponse = mapper.readValue(responseJsonObj.get("motorCareDetails").toString(), MotorCareDetails.class);
				} else {
					logger.info("saveQuote motorCareDetails not found");
					return Responses.notFound(null);
				}				
			} else {
				logger.info("saveQuote System error:"+responseJsonObj.get("errMsgs").toString());
				return Responses.error(null);
			}
		} catch (Exception e) {
			logger.info("saveQuote System error:"+e.toString());
			return Responses.error(null);
		}
		return Responses.ok(apiResponse);
	}	
	
	/******** Policy related ********/
	@ApiOperation(
			value = "This API is used to get policy details",
			response = MotorCareDetails.class,
			hidden = true
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 400, message = "Invalid Policy info"),
			@ApiResponse(code = 404, message = "System cannot find the record"),
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = {"/policy/{policyId}"}, method = GET)
	public ResponseEntity<MotorCareDetails> getPolicy(
			@ApiParam(value = "Policy ID", required = true) @PathVariable ("policyId") String policyId,	
			HttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("getPolicy Autherticate error: " + e.toString() );
			return Responses.error(null);	
		}
		
		// ******************* Valid input *******************
		if (isEmpty(policyId)) {
			return Responses.badRequest(null);
		}
		
		// to be added for full
		// Check user login or not, logged in user only for get policy
		
		
		// ******************* Init *******************
		MotorCareDetails apiResponse = new MotorCareDetails();
		
		// Dummy for vendor testing, remove it when function is ready 
		if (StringUtils.equals(policyId, "-99999999")) {
			// Normal
			apiResponse.setPolicyId("-99999999");
		} else if (StringUtils.equals(policyId, "-11111111")) {			
			// 404
			return Responses.notFound(null);
		} else if (StringUtils.equals(policyId, "-22222222")) {			
			// 400
			return Responses.badRequest(null);
		} else {
			// 500
			return Responses.error(null);
		}
		
		try {
			// To-be-updated for FULL and delete this comment when completed the coding
		} catch (Exception e) {
			logger.info("getPolicy System error:" + e.toString());
			return Responses.error(null);		
		}
		return Responses.ok(apiResponse);
	}
		
	@SuppressWarnings("unused")
	@ApiOperation(
			value = "This API is used to perform MotorCare application (Step 1 - Car Details) and return id for further actions",
			response = String.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 400, message = "Invalid Details"),
			@ApiResponse(code = 404, message = "System cannot find the policy"),
			@ApiResponse(code = 410, message = "Invalid Car Band"),
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = {"/policy/saving/carDetails"}, method = POST)
	public ResponseEntity<Map<String, String>> savePolicyCarDetails(
			@ApiParam(value = "Motor Care Details", required = true) @RequestBody MotorCareDetails body,
			HttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("savePolicyCarDetails Autherticate error: " + e.toString() );
			return Responses.error(null);	
		}
		// ******************* Valid input *******************
		
		
		// ******************* Init *******************
		Map<String, String> apiResponse = new HashMap<>();	
		JSONObject responseJsonObj = new JSONObject();		
		
		// Dummy for vendor testing, remove it when function is ready 
		if (StringUtils.equals(body.getPolicyId(), "-99999999")) {
			// Normal
			apiResponse.put("policyID", "-99999999");
		} else if (StringUtils.equals(body.getPolicyId(), "-11111111")) {			
			// 404
			return Responses.notFound(null);
		} else if (StringUtils.equals(body.getPolicyId(), "-22222222")) {			
			// 400
			return Responses.badRequest(null);
		} else if (StringUtils.equals(body.getPolicyId(), "-33333333")) {			
			// 410
			return new ResponseEntity<Map<String, String>>((Map<String, String>)null, HttpStatus.valueOf(410));
		} else {
			// 500
			return Responses.error(null);
		}
		
		try {
			// To-be-updated for FULL and delete this comment when completed the coding
				
		} catch (Exception e) {
			logger.info("savePolicyCarDetails System error:" + e.toString());
			return Responses.error(null);			
		}
		return Responses.ok(apiResponse);
	}
	
	@SuppressWarnings("unused")
	@ApiOperation(
			value = "This API is used to perform MotorCare application (Step 2 - Driver Details) and return id for further actions",
			response = String.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 400, message = "Invalid Details"),
			@ApiResponse(code = 404, message = "System cannot find the policy"),			
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = {"/policy/saving/driverDetails"}, method = POST)
	public ResponseEntity<Map<String, String>> savePolicyDriverDetails(
			@ApiParam(value = "Motor Care Details", required = true) @RequestBody MotorCareDetails body,
			HttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("savePolicyDriverDetails Autherticate error: " + e.toString() );
			return Responses.error(null);	
		}
		// ******************* Valid input *******************
		
		
		// ******************* Init *******************
		Map<String, String> apiResponse = new HashMap<>();	
		JSONObject responseJsonObj = new JSONObject();		
		
		// Dummy for vendor testing, remove it when function is ready 
		if (StringUtils.equals(body.getPolicyId(), "-99999999")) {
			// Normal
			apiResponse.put("policyID", "-99999999");
		} else if (StringUtils.equals(body.getPolicyId(), "-11111111")) {			
			// 404
			return Responses.notFound(null);
		} else if (StringUtils.equals(body.getPolicyId(), "-22222222")) {			
			// 400
			return Responses.badRequest(null);
		} else {
			// 500
			return Responses.error(null);
		}
		
		try {
			// To-be-updated for FULL and delete this comment when completed the coding
				
		} catch (Exception e) {
			logger.info("savePolicyDriverDetails System error:" + e.toString());
			return Responses.error(null);			
		}
		return Responses.ok(apiResponse);
	}
	
	@SuppressWarnings("unused")
	@ApiOperation(
			value = "This API is used to perform MotorCare application (Step 3 - Policy Details) and return id for further actions",
			response = String.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 400, message = "Invalid Details"),
			@ApiResponse(code = 404, message = "System cannot find the policy"),			
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = {"/policy/saving/policyDetails"}, method = POST)
	public ResponseEntity<Map<String, String>> savePolicyDetails(
			@ApiParam(value = "Motor Care Details", required = true) @RequestBody MotorCareDetails body,
			HttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("savePolicyDetails Autherticate error: " + e.toString() );
			return Responses.error(null);	
		}
		// ******************* Valid input *******************
		
		
		// ******************* Init *******************
		Map<String, String> apiResponse = new HashMap<>();	
		JSONObject responseJsonObj = new JSONObject();		
		
		// Dummy for vendor testing, remove it when function is ready 
		if (StringUtils.equals(body.getPolicyId(), "-99999999")) {
			// Normal
			apiResponse.put("policyID", "-99999999");
		} else if (StringUtils.equals(body.getPolicyId(), "-11111111")) {			
			// 404
			return Responses.notFound(null);
		} else if (StringUtils.equals(body.getPolicyId(), "-22222222")) {			
			// 400
			return Responses.badRequest(null);
		} else {
			// 500
			return Responses.error(null);
		}
		
		try {
			// To-be-updated for FULL and delete this comment when completed the coding
				
		} catch (Exception e) {
			logger.info("savePolicyDetails System error:" + e.toString());
			return Responses.error(null);			
		}
		return Responses.ok(apiResponse);
	}
	
	@SuppressWarnings("unused")
	@ApiOperation(
			value = "This API is used to perform MotorCare application (Step 4 - Declarations) and return id for further actions",
			response = String.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 400, message = "Invalid Details"),
			@ApiResponse(code = 404, message = "System cannot find the policy"),			
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = {"/policy/saving/declarations"}, method = POST)
	public ResponseEntity<Map<String, String>> savePolicyDeclarations(
			@ApiParam(value = "Motor Care Details", required = true) @RequestBody MotorCareDetails body,
			HttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("savePolicyDeclarations Autherticate error: " + e.toString() );
			return Responses.error(null);	
		}
		// ******************* Valid input *******************
		
		
		// ******************* Init *******************
		Map<String, String> apiResponse = new HashMap<>();	
		JSONObject responseJsonObj = new JSONObject();		
		
		// Dummy for vendor testing, remove it when function is ready 
		if (StringUtils.equals(body.getPolicyId(), "-99999999")) {
			// Normal
			apiResponse.put("policyID", "-99999999");
		} else if (StringUtils.equals(body.getPolicyId(), "-11111111")) {			
			// 404
			return Responses.notFound(null);
		} else if (StringUtils.equals(body.getPolicyId(), "-22222222")) {			
			// 400
			return Responses.badRequest(null);
		} else {
			// 500
			return Responses.error(null);
		}
		
		try {
			// To-be-updated for FULL and delete this comment when completed the coding
				
		} catch (Exception e) {
			logger.info("savePolicyDeclarations System error:" + e.toString());
			return Responses.error(null);			
		}
		return Responses.ok(apiResponse);
	}
	
	@SuppressWarnings("unused")
	@ApiOperation(
			value = "This API is used to handle payment",
			response = PayDollar.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 400, message = "Invalid Details"),
			@ApiResponse(code = 404, message = "System cannot find the policy"),			
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = {"/policy/payment"}, method = POST)
	public ResponseEntity<PayDollar> processPayment(
			@ApiParam(value = "Motor Care Details", required = true) @RequestBody MotorCareDetails body,
			HttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("processPayment Autherticate error: " + e.toString() );
			return Responses.error(null);	
		}
		// ******************* Valid input *******************
		
		
		// ******************* Init *******************
		PayDollar apiResponse = new PayDollar();
		JSONObject responseJsonObj = new JSONObject();		
		
		/*
		// Dummy for vendor testing, remove it when function is ready 
		if (StringUtils.equals(body.getPolicyId(), "-99999999")) {
			// Normal			
		} else if (StringUtils.equals(body.getPolicyId(), "-11111111")) {			
			// 404
			return Responses.notFound(null);
		} else if (StringUtils.equals(body.getPolicyId(), "-22222222")) {			
			// 400
			return Responses.badRequest(null);
		} else {
			// 500
			return Responses.error(null);
		}
		*/
		
		try {
			// ******************* Form URL and Object *******************
			String url = UserRestURIConstants.MOTOR_CARE_PAYMENT_POST;						
			String jsonString = new ObjectMapper().writeValueAsString(body);			
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
			
			String inPath = request.getRequestURL().toString();		// incoming Path
			String failUrl = inPath + "?paymentGatewayFlag=true";
//			model.addAttribute("path", path.replace("travel-summary", "confirmation?utm_nooverride=1"));
//			model.addAttribute("failurePath", path + "?paymentGatewayFlag=true");
			
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.POST, url, headerUtil.getHeader(request), jsonInput);
			
			// ******************* Makeup result *******************
			if (responseJsonObj.get("errMsgs") == null) {
				if(responseJsonObj.get("payDollar") != null && responseJsonObj.get("payDollar").toString().length() > 0) {
					ObjectMapper mapper = new ObjectMapper();
					apiResponse = mapper.readValue(responseJsonObj.get("payDollar").toString(), PayDollar.class);
					apiResponse.setSuccessUrl(StringUtils.replace(inPath, request.getServletPath(), "/payment-result?refNum=" + apiResponse.getReferenceNo()));
					apiResponse.setFailUrl(failUrl);
					apiResponse.setErrorUrl(failUrl);
					
				} else {
					logger.info("processPayment record not found");
					return Responses.notFound(null);
				}				
			} else {
				logger.info("processPayment System error:" + responseJsonObj.get("errMsgs").toString());
				return Responses.error(null);				
			}	

		} catch (Exception e) {
			logger.info("processPayment System error:" + e.toString());
			return Responses.error(null);			
		}
		return Responses.ok(apiResponse);
	}
		
	@Deprecated
	@ApiOperation(
			value = "This API is used to finalize(Confirm) MotorCare application after payment",
			response = String.class,
			hidden = true
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 400, message = "Invalid policy info"),
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = {"/policy/saving/confirmation"}, method = POST)
	public ResponseEntity<String> confirmPolicy(
			@ApiParam(value = "Motor Care info (Type: e.g. Comp, Third)", required = true) @RequestBody MotorCareDetails body,
			HttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("confirmPolicy Autherticate error: " + e.toString() );
			return Responses.error(null);	
		}
		
		try {
			String apiResponse = new String();
			return Responses.ok(apiResponse);
			
		} catch (Exception e) {
			logger.info("confirmPolicy System error:" + e.toString());
			return Responses.error(null);			
		}
	}
	
	@ApiOperation(
			value = "This API is used to do Save for later of policy",
			response = String.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 400, message = "Invalid info to perform Save for later"),
			@ApiResponse(code = 411, message = "System asked for login"),
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = {"/saveForLater"}, method = POST)
	public ResponseEntity<Map<String, String>> saveForLater(
			@ApiParam(value = "Save for Later Info", required = true) @RequestBody MotorSaveForLater saveForLater,			
			HttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("saveForLater Autherticate error: " + e.toString() );
			return Responses.error(null);	
		}
		
		// ******************* Valid input *******************
		// need to check login
		
		try {
			Map<String, String> apiResponse = new HashMap<>();
			return Responses.ok(apiResponse);
			
		} catch (Exception e) {
			logger.info("saveForLater System error:" + e.toString());
			return Responses.error(null);			
		}
	}
	
	@ApiOperation(
			value = "This API is used to resume previous session for Save for later of policy",
			response = MotorSaveForLater.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 400, message = "Invalid info"),
			@ApiResponse(code = 410, message = "System cannot find such info for your pervious session"),
			@ApiResponse(code = 411, message = "System asked for login"),
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = {"/saveForLater/resume"}, method = POST)
	public ResponseEntity<MotorSaveForLater> resumeSaveForLater(
			@ApiParam(value = "Save for Later Info", required = true) @RequestBody MotorSaveForLater saveForLater,			
			HttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("resumeSaveForLater Autherticate error: " + e.toString() );
			return Responses.error(null);	
		}
		
		try {
			MotorSaveForLater apiResponse = new MotorSaveForLater();
			return Responses.ok(apiResponse);
			
		} catch (Exception e) {
			logger.info("resumeSaveForLater System error:" + e.toString());
			return Responses.error(null);			
		}
	}
	
	@ApiOperation(
			value = "This API is used to upload files for the policy application of MotorCare",
			response = String.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 400, message = "Invalid file(s)"),
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = {"/policy/fileUpload"}, method = POST)
	public ResponseEntity<String> uploadFile4Policy(
			@ApiParam(value = "Files for upload", required = true) @RequestBody MotorFileDetails motorFileDetails,			
			HttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("uploadFile4Policy Autherticate error: " + e.toString() );
			return Responses.error(null);	
		}
		
		try {
			String apiResponse = new String();
			return Responses.ok(apiResponse);
			
		} catch (Exception e) {
			logger.info("uploadFile4Policy System error:" + e.toString());
			return Responses.error(null);			
		}
	}	
		
	@ApiOperation(
			value = "This API is used to get available list of bank for mortgage",
			response = CodeTable.class,
			responseContainer = "List"
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 404, message = "System cannot find bank details"),
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = "/list/bankMortgages", method = GET)
	public ResponseEntity<List<CodeTable>> getBankMortgages(HttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("getBankMortgages Autherticate error: " + e.toString() );
			return Responses.error(null);	
		}
		
		List<CodeTable> apiResponse = new ArrayList<>();
		JSONObject responseJsonObj = new JSONObject();
		try {
			// ******************* Valid input *******************
								
			// ******************* Form URL *******************
			String url = replace(UserRestURIConstants.MOTOR_CARE_CODE_TABLE_GET,"{type}", "bank");
			
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.GET, url, headerUtil.getHeader(request), null);
			// ******************* Makeup result *******************			
			if (responseJsonObj.get("errMsgs") == null) {
				if(responseJsonObj.get("codeTable") != null && responseJsonObj.get("codeTable").toString().length() > 0) {
					ObjectMapper mapper = new ObjectMapper();				
					apiResponse = mapper.readValue(responseJsonObj.get("codeTable").toString(), mapper.getTypeFactory().constructCollectionType(List.class, CodeTable.class));
				} else {
					logger.info("getBankMortgages record not found");
					return Responses.notFound(null);
				}				
			} else {
				logger.info("getBankMortgages System error:" + responseJsonObj.get("errMsgs").toString());
				return Responses.error(null);	
			}			
			
		} catch (Exception e) {
			logger.info("getBankMortgages System error:" + e.toString());
			return Responses.error(null);			
		}
		return Responses.ok(apiResponse);
	}
	
	@ApiOperation(
			value = "This API is for contact me panel",
			response = String.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 400, message = "Invalid info"),
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = "/contactMe", method = POST)
	public ResponseEntity<String> contactMe(
			@ApiParam(value = "Contact me Info", required = true) @RequestBody ContactMe contactMe,			
			HttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("contactMe Autherticate error: " + e.toString() );
			return Responses.error(null);	
		}
		// ******************* Valid input *******************
				
		
		// ******************* Init *******************
		JSONObject responseJsonObj = new JSONObject();
		
		try {			
			String url = UserRestURIConstants.MOTOR_CARE_CONTACT_US_POST;						
			String jsonString = new ObjectMapper().writeValueAsString(contactMe);
			System.out.println("jsonString " + jsonString);
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
			
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.POST, url, headerUtil.getHeader(request), jsonInput);
			return Responses.ok(responseJsonObj.toJSONString());
			
		} catch (Exception e) {
			logger.info("contactMe System error:" + e.toString());
			return Responses.error(null);			
		}		
	}
		
	@ApiOperation(
			value = "This API is used to supplement car details by make and model",
			response = CarDetail.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 400, message = "Invalid car info"),
			@ApiResponse(code = 404, message = "System cannot find the car supplement details"),
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = "/carDetails/{makeCode}/supplement", method = GET)							  
	public ResponseEntity<CarDetail> getCarSupplementDetailsByMakeAndModel(
			@ApiParam(value = "Car Make by", required = true) @PathVariable ("makeCode") String makeCode,
			@ApiParam(value = "Car Model", required = true) @RequestParam ("carModel") String carModel,	
			HttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("getCarSupplementDetailsByMakeAndModel Autherticate error: " + e.toString() );
			return Responses.error(null);	
		}	
		// ******************* Valid input *******************
		if (isEmpty(makeCode) || isEmpty(carModel)) {
			return Responses.badRequest(null);
		}
		
		// ******************* Init *******************
		CarDetail apiResponse = new CarDetail();
		JSONObject responseJsonObj = new JSONObject();
		try {		
			// ******************* Form URL *******************
			String encodedMake = urlEncodeInputSpace(makeCode);
			String encodedCarModel = urlEncodeInputSpace(carModel);			
			String url = UserRestURIConstants.MOTOR_CARE_CARDETAILS_SUPPLEMENT_SECOND_GET + "?makeCode=" + encodedMake + "&carModel=" + encodedCarModel;
			
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.GET, url, headerUtil.getHeader(request), null);
			
			// ******************* Makeup result *******************
			if (responseJsonObj.get("errMsgs") == null) {
				if(responseJsonObj.get("carDetail") != null && responseJsonObj.get("carDetail").toString().length() > 0) {
					ObjectMapper mapper = new ObjectMapper();					
					apiResponse = mapper.readValue(responseJsonObj.get("carDetail").toString(), CarDetail.class);
				} else {
					logger.info("getCarSupplementDetailsByMakeAndModel carDetail not found");
					return Responses.notFound(null);
				}
				
			} else {
				logger.info("getCarSupplementDetailsByMakeAndModel System error:" + responseJsonObj.get("errMsgs").toString());
				return Responses.error(null);		
			}
		} catch (Exception e) {
			logger.info("getCarSupplementDetailsByMakeAndModel System error:" + e.toString());
			return Responses.error(null);	
		}
		return Responses.ok(apiResponse);
	}
	
	@Deprecated
	@ApiOperation(
			value = "UPload file testing",
			response = String.class,
			hidden = true
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 400, message = "Invalid info"),
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = "/testUpload", method = POST)
	public ResponseEntity<String> testUpload(			
			MultipartHttpServletRequest request) throws JsonProcessingException, ParseException {
		
		logger.info("TestingUpload System error:");
		
		List<MotorFile> fileDetailList = new ArrayList<> (); 
		MotorFileDetails motorFileDetails = new MotorFileDetails();
		
		Iterator<String> itr =  request.getFileNames();
		String policyId = request.getParameter("policyId");
		String docType = request.getParameter("docType");
		
		logger.info("policyId:" + policyId);
		logger.info("docType:" + docType);
		
		
		MultipartFile mpf = null;
		while(itr.hasNext()){
			 mpf = request.getFile(itr.next()); 
			 MotorFile mf = new MotorFile();
			 
			 try {
				 System.out.println(mpf.getOriginalFilename() +" uploaded! "+ mpf.getContentType());
				 System.out.println(FilenameUtils.getExtension(mpf.getOriginalFilename()));
				 System.out.println(Base64.getEncoder().encodeToString(mpf.getBytes()));
				 mf.setFileBase64String(Base64.getEncoder().encodeToString(mpf.getBytes()));
				 mf.setFileName(mpf.getOriginalFilename());
				 mf.setFileDocExt(FilenameUtils.getExtension(mpf.getOriginalFilename()));
				 mf.setFileType(docType);
				 //mf.setPolicyID("26306531");
				 mf.setPolicyID(policyId);
				 fileDetailList.add(mf);
				 
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		motorFileDetails.setMotorFileList(fileDetailList);
		
		 String url = UserRestURIConstants.MOTOR_CARE_FILE_UPLOAD_POST;
		 String jsonString = new ObjectMapper().writeValueAsString(motorFileDetails);			
		JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
		 restService.consumeApi(HttpMethod.POST, url, headerUtil.getHeader(request), jsonInput);
		 
		// super.IsAuthenticate(request);
		// ******************* Valid input *******************
		
		
		// ******************* Init *******************
		JSONObject responseJsonObj = new JSONObject();
		
		try {			
			//String url = UserRestURIConstants.MOTOR_CARE_CONTACT_US_POST;						
			//String jsonString = new ObjectMapper().writeValueAsString(contactMe);
			//System.out.println("jsonString " + jsonString);
			//JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
			//JSONObject jsonInput = new JSONObject();
			
			// ******************* Consume Service *******************
			//responseJsonObj = restService.consumeApi(HttpMethod.POST, url, headerUtil.getHeader(request), jsonInput);
			//responseJsonObj = jsonInput;
			return Responses.ok(responseJsonObj.toJSONString());
			
		} catch (Exception e) {
			logger.info("contactMe System error:" + e.toString());
			return Responses.error(null);			
		}
		
	}
	
	@ApiOperation(
			value = "This API is used to get district list",
			response = CodeTable.class,
			responseContainer = "List"
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 404, message = "System cannot find records"),
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = "/list/districts", method = GET)
	public ResponseEntity<List<CodeTable>> getDistrict(HttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("getDistrict Autherticate error: " + e.toString() );
			return Responses.error(null);	
		}
		
		List<CodeTable> apiResponse = new ArrayList<>();
		JSONObject responseJsonObj = new JSONObject();
		try {
			// ******************* Valid input *******************
								
			// ******************* Form URL *******************
			String url = replace(UserRestURIConstants.MOTOR_CARE_CODE_TABLE_GET,"{type}", "district");
			
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.GET, url, headerUtil.getHeader(request), null);
			// ******************* Makeup result *******************			
			if (responseJsonObj.get("errMsgs") == null) {
				if(responseJsonObj.get("codeTable") != null && responseJsonObj.get("codeTable").toString().length() > 0) {
					ObjectMapper mapper = new ObjectMapper();				
					apiResponse = mapper.readValue(responseJsonObj.get("codeTable").toString(), mapper.getTypeFactory().constructCollectionType(List.class, CodeTable.class));
				} else {
					logger.info("getDistrict record not found");
					return Responses.notFound(null);
				}				
			} else {
				logger.info("getDistrict System error:" + responseJsonObj.get("errMsgs").toString());
				return Responses.error(null);	
			}			
			
		} catch (Exception e) {
			logger.info("getDistrict System error:" + e.toString());
			return Responses.error(null);			
		}
		return Responses.ok(apiResponse);
	}
	
	@ApiOperation(
			value = "This API is used to get area list",
			response = CodeTable.class,
			responseContainer = "List"
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 404, message = "System cannot find records"),
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = "/list/areas", method = GET)
	public ResponseEntity<List<CodeTable>> getArea(HttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("getArea Autherticate error: " + e.toString() );
			return Responses.error(null);	
		}
		
		List<CodeTable> apiResponse = new ArrayList<>();
		JSONObject responseJsonObj = new JSONObject();
		try {
			// ******************* Valid input *******************
								
			// ******************* Form URL *******************
			String url = replace(UserRestURIConstants.MOTOR_CARE_CODE_TABLE_GET,"{type}", "area");
			
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.GET, url, headerUtil.getHeader(request), null);
			// ******************* Makeup result *******************			
			if (responseJsonObj.get("errMsgs") == null) {
				if(responseJsonObj.get("codeTable") != null && responseJsonObj.get("codeTable").toString().length() > 0) {
					ObjectMapper mapper = new ObjectMapper();				
					apiResponse = mapper.readValue(responseJsonObj.get("codeTable").toString(), mapper.getTypeFactory().constructCollectionType(List.class, CodeTable.class));
				} else {
					logger.info("getArea record not found");
					return Responses.notFound(null);
				}				
			} else {
				logger.info("getArea System error:" + responseJsonObj.get("errMsgs").toString());
				return Responses.error(null);	
			}			
			
		} catch (Exception e) {
			logger.info("getArea System error:" + e.toString());
			return Responses.error(null);			
		}
		return Responses.ok(apiResponse);
	}
	
	@ApiOperation(
			value = "This API is used to get area list",
			response = CodeTable.class,
			responseContainer = "List"
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 404, message = "System cannot find records"),
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = "/list/insurers", method = GET)
	public ResponseEntity<List<CodeTable>> getInsurer(HttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("getInsurer Autherticate error: " + e.toString() );
			return Responses.error(null);	
		}
		
		List<CodeTable> apiResponse = new ArrayList<>();
		JSONObject responseJsonObj = new JSONObject();
		try {
			// ******************* Valid input *******************
								
			// ******************* Form URL *******************
			String url = replace(UserRestURIConstants.MOTOR_CARE_CODE_TABLE_GET,"{type}", "previousInsurance");
			
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.GET, url, headerUtil.getHeader(request), null);
			// ******************* Makeup result *******************			
			if (responseJsonObj.get("errMsgs") == null) {
				if(responseJsonObj.get("codeTable") != null && responseJsonObj.get("codeTable").toString().length() > 0) {
					ObjectMapper mapper = new ObjectMapper();				
					apiResponse = mapper.readValue(responseJsonObj.get("codeTable").toString(), mapper.getTypeFactory().constructCollectionType(List.class, CodeTable.class));
				} else {
					logger.info("getInsurer record not found");
					return Responses.notFound(null);
				}				
			} else {
				logger.info("getInsurer System error:" + responseJsonObj.get("errMsgs").toString());
				return Responses.error(null);	
			}			
			
		} catch (Exception e) {
			logger.info("getInsurer System error:" + e.toString());
			return Responses.error(null);			
		}
		return Responses.ok(apiResponse);
	}
	
	
	private String urlEncodeInputSpace (String input) throws UnsupportedEncodingException {
		return replace(URLEncoder.encode(input, "UTF-8"), "+", "%20");
	}
	
	private String GetUserName(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		// return null if the customer did not login yet
		if (session == null) {
			return null;
		} else {
			if (session.getAttribute("username") != null && session.getAttribute("username").toString().length() > 0) {
				return session.getAttribute("username").toString();
			} else {
				return null;
			}
		}			
	}
}
