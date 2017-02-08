package com.ifwd.fwdhk.controller;

import static org.apache.commons.lang3.StringUtils.isBlank;
import static org.apache.commons.lang3.StringUtils.isNotBlank;
import static org.apache.commons.lang3.StringUtils.replace;
import static org.apache.commons.lang3.StringUtils.upperCase;
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
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.Hashtable;
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
import com.ifwd.fwdhk.connector.ECommWsConnector;
import com.ifwd.fwdhk.connector.response.BaseResponse;
import com.ifwd.fwdhk.controller.core.Responses;
import com.ifwd.fwdhk.model.OccupationBean;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.model.motor.ContactMe;
import com.ifwd.fwdhk.model.motor.MotorCareDetails;
import com.ifwd.fwdhk.model.motor.MotorSaveForLater;
import com.ifwd.fwdhk.services.MotorCareValidationService;
import com.ifwd.fwdhk.util.HeaderUtil;
import com.ifwd.fwdhk.utils.services.SendEmailDao;

@Controller
@RequestMapping(value = "/api/iMotor", produces = {APPLICATION_JSON_VALUE, APPLICATION_XML_VALUE} )
@Api(value = "/iMotor", description = "To serve all operations regarding MotorCare")
public class MotorCareController extends BaseController{
			
	private final static Logger logger = LoggerFactory.getLogger(MotorCareController.class);
	private static String BANK_OTHER_DEF = "OTHER";
	private static int MOTOR_ERR_STATUS_CDE = 504;
	private static int MOTOR_BAD_REQUEST_STATUS_CDE = 422;

	@Autowired
	private MotorCareValidationService motorCareValidationService;
	@Autowired
	private HeaderUtil headerUtil;
	@Autowired
	private SendEmailDao sendEmail;
	@Autowired 
	private ECommWsConnector eCommConnector;
	
	@ApiOperation(
			value = "This API is used to get district list",
			response = CodeTable.class,
			responseContainer = "List"
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 404, message = "System cannot find records"),
			@ApiResponse(code = 504, message = "System error")
			})
	@RequestMapping(value = "/list/districts", method = GET)
	public ResponseEntity<List<CodeTable>> getDistrict(HttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("getDistrict Autherticate error: " + e.toString() );
			return motor_error(null);	
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
					return motor_notFound(null);
				}				
			} else {
				logger.info("getDistrict System error:" + responseJsonObj.get("errMsgs").toString());
				return motor_error(null);	
			}			
			
		} catch (Exception e) {
			logger.info("getDistrict System error:" + e.toString());
			return motor_error(null);			
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
			@ApiResponse(code = 504, message = "System error")
			})
	@RequestMapping(value = "/list/areas", method = GET)
	public ResponseEntity<List<CodeTable>> getArea(HttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("getArea Autherticate error: " + e.toString() );
			return motor_error(null);	
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
					return motor_notFound(null);
				}				
			} else {
				logger.info("getArea System error:" + responseJsonObj.get("errMsgs").toString());
				return motor_error(null);	
			}			
			
		} catch (Exception e) {
			logger.info("getArea System error:" + e.toString());
			return motor_error(null);			
		}
		return Responses.ok(apiResponse);
	}
	
	@ApiOperation(
			value = "This API is used to get insurers list",
			response = CodeTable.class,
			responseContainer = "List"
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 404, message = "System cannot find records"),
			@ApiResponse(code = 504, message = "System error")
			})
	@RequestMapping(value = "/list/insurers", method = GET)
	public ResponseEntity<List<CodeTable>> getInsurer(HttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("getInsurer Autherticate error: " + e.toString() );
			return motor_error(null);	
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
					return motor_notFound(null);
				}				
			} else {
				logger.info("getInsurer System error:" + responseJsonObj.get("errMsgs").toString());
				return motor_error(null);	
			}			
			
		} catch (Exception e) {
			logger.info("getInsurer System error:" + e.toString());
			return motor_error(null);			
		}
		return Responses.ok(apiResponse);
	}
	
	@ApiOperation(
			value = "This API is used to get available list of Occupations (version 2)",
			response = CodeTable.class,
			responseContainer = "List"
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 404, message = "System cannot find records"),
			@ApiResponse(code = 504, message = "System error")
			})
	@RequestMapping(value = "/list/occupations/v2", method = GET)
	public ResponseEntity<List<CodeTable>> getOccupationsV2(HttpServletRequest request) {
		String methodName = "getOccupationsV2";
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info(methodName + " Autherticate error: " + e.toString() );
			return motor_error(null);	
		}
		
		List<CodeTable> apiResponse = new ArrayList<>();
		JSONObject responseJsonObj = new JSONObject();
		try {
			// ******************* Valid input *******************
								
			// ******************* Form URL *******************
			String url = replace(UserRestURIConstants.MOTOR_CARE_CODE_TABLE_GET,"{type}", "occupation");
			
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.GET, url, headerUtil.getHeader(request), null);
			// ******************* Makeup result *******************			
			if (responseJsonObj.get("errMsgs") == null) {
				if(responseJsonObj.get("codeTable") != null && responseJsonObj.get("codeTable").toString().length() > 0) {
					ObjectMapper mapper = new ObjectMapper();				
					apiResponse = mapper.readValue(responseJsonObj.get("codeTable").toString(), mapper.getTypeFactory().constructCollectionType(List.class, CodeTable.class));
				} else {
					logger.info(methodName + " record not found");
					return motor_notFound(null);
				}				
			} else {
				logger.info(methodName + " System error:" + responseJsonObj.get("errMsgs").toString());
				return motor_error(null);	
			}			
			
		} catch (Exception e) {
			logger.info(methodName + " System error:" + e.toString());
			return motor_error(null);			
		}
		return Responses.ok(apiResponse);
	}	
	
	@ApiOperation(
			value = "This API is used to get available list of bank for mortgage",
			response = CodeTable.class,
			responseContainer = "List"
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 404, message = "System cannot find bank details"),
			@ApiResponse(code = 504, message = "System error")
			})
	@RequestMapping(value = "/list/bankMortgages", method = GET)
	public ResponseEntity<List<CodeTable>> getBankMortgages(HttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("getBankMortgages Autherticate error: " + e.toString() );
			return motor_error(null);	
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
					
					// iFwd self: add record for other
					CodeTable itemOther = new CodeTable();
					itemOther.setCode(BANK_OTHER_DEF);
					itemOther.setDesc(BANK_OTHER_DEF);
					itemOther.setId(BANK_OTHER_DEF);
					apiResponse.add(itemOther);
				} else {
					logger.info("getBankMortgages record not found");
					return motor_notFound(null);
				}				
			} else {
				logger.info("getBankMortgages System error:" + responseJsonObj.get("errMsgs").toString());
				return motor_error(null);	
			}			
			
		} catch (Exception e) {
			logger.info("getBankMortgages System error:" + e.toString());
			return motor_error(null);			
		}
		return Responses.ok(apiResponse);
	}
	
	@ApiOperation(
			value = "This API is used to get available list of motor brands",
			response = CarDetail.class,
			responseContainer = "List"
			)
	@ApiResponses(value = {				
			@ApiResponse(code = 404, message = "System cannot find the list of car brands"),
			@ApiResponse(code = 504, message = "System error")
			})
	@RequestMapping(value = "/list/carMakes", method = GET)
	public ResponseEntity<List<CarDetail>> getCarMakes(HttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("getCarMakes Autherticate error: " + e.toString() );
			return motor_error(null);	
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
					return motor_notFound(null);
				}				
			} else {
				logger.info("getCarMakes System error:" + responseJsonObj.get("errMsgs").toString());
				return motor_error(null);	
			}			
		} catch (Exception e) {
			logger.info("getCarMakes System error:" + e.toString());
			return motor_error(null);	
		}
		return Responses.ok(apiResponse);
	}	
	
	@ApiOperation(
			value = "This API is used to get specific Car Details by make",
			response = CarDetail.class,
			responseContainer = "List"
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 422, message = "Invalid car make code"),
			@ApiResponse(code = 404, message = "System cannot find the car details by make code"),
			@ApiResponse(code = 504, message = "System error")
			})

    @RequestMapping(value = "/carDetails/{makeCode}", method = GET)
	public ResponseEntity<List<CarDetail>> getCarDetailsByMake(
            @ApiParam(value = "Car Make by", required = true) @PathVariable("makeCode") String makeCode,            
			HttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("getCarDetailsByMake Autherticate error: " + e.toString() );
			return motor_error(null);	
		}
		// ******************* Valid input *******************
		if (isBlank(makeCode)) {
			return motor_badRequest(null);
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
					return motor_notFound(null);
				}
				
			} else {
				logger.info("getCarDetailsByMake System error:" + responseJsonObj.get("errMsgs").toString());
				return motor_error(null);				
			}
		} catch (Exception e) {
			logger.info("getCarDetailsByMake System error:" + e.toString());
			return motor_error(null);		
		}
		return Responses.ok(apiResponse);
	}	
	
	@ApiOperation(
			value = "This API is used to supplement car details by make and model",
			response = CarDetail.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 422, message = "Invalid car info"),
			@ApiResponse(code = 404, message = "System cannot find the car supplement details"),
			@ApiResponse(code = 504, message = "System error")
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
			return motor_error(null);	
		}	
		// ******************* Valid input *******************
		if (isBlank(makeCode) || isBlank(carModel)) {
			return motor_badRequest(null);
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
					return motor_notFound(null);
				}
				
			} else {
				logger.info("getCarSupplementDetailsByMakeAndModel System error:" + responseJsonObj.get("errMsgs").toString());
				return motor_error(null);		
			}
		} catch (Exception e) {
			logger.info("getCarSupplementDetailsByMakeAndModel System error:" + e.toString());
			return motor_error(null);	
		}
		return Responses.ok(apiResponse);
	}
		
	@ApiOperation(
			value = "This API is used to register email to get promo code",
			response = String.class	
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 422, message = "Invalid Email address"),
			@ApiResponse(code = 504, message = "System error")
			})
	@RequestMapping(value = "/email/promoCodes", method = POST)
	public ResponseEntity<Map<String, String>> getPromoCodes(
			@ApiParam(value = "Email address to get the promo code", required = true) @RequestBody String emailToSendPromoCode,				
			HttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("getPromoCodes Autherticate error: " + e.toString() );
			return motor_error(null);	
		}
			
		// ******************* Valid input *******************
		if (isBlank(emailToSendPromoCode)) {
			return motor_badRequest(null);
		}
		
		try {			
			Map<String, String> apiResponse = new HashMap<>();
			boolean result = sendEmail.sendEmail(URLDecoder.decode(replace(emailToSendPromoCode, "emailToSendPromoCode=", ""), "UTF-8"), 
								"MOTORSMART", new HashMap<String, String>(headerUtil.getHeader(request)));
			
			if (result) {
				apiResponse.put("result", result ? "OK" : "FAIL");
			} else {
				return motor_badRequest(null);
			}
			
			return Responses.ok(apiResponse);
			
		} catch (Exception e) {			
			logger.info("getPromoCodes System error:" + e.toString());
			return motor_error(null);			
		}
	}

	@ApiOperation(
			value = "This API is used to get quotation details",
			response = MotorCareDetails.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 422, message = "Invalid info for quotation"),
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
			@ApiResponse(code = 418, message = "Promo code is invalid" ),
			@ApiResponse(code = 504, message = "System error")
			})
	@RequestMapping(value = {"/quote"}, method = POST)
	public ResponseEntity<MotorCareDetails> getQuote(
			@ApiParam(value = "Motor Care info (Type: e.g. Comp, Third)", required = true) @RequestBody MotorCareDetails quoteMotor,
			HttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("getQuote Autherticate error: " + e.toString() );
			return motor_error(null);	
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
					return motor_notFound(null);
				}				
			} else {
				if ( StringUtils.contains(responseJsonObj.get("errMsgs").toString(), "4")){
					return new ResponseEntity<MotorCareDetails>((MotorCareDetails)null, HttpStatus.valueOf(getErrorCode(responseJsonObj.get("errMsgs").toString())));
				} 
				
				logger.info("getQuote System error:" + responseJsonObj.get("errMsgs").toString());
				return motor_error(null);				
			}						
		} catch (Exception e) {
			logger.info("getQuote System error:" + e.toString());
			return motor_error(null);			
		}
		return Responses.ok(apiResponse);
	}	
	
	@ApiOperation(
			value = "This API is used to save the quote and return MotorCareDetails with policyID for further actions",
			response = MotorCareDetails.class				
			)
	@ApiResponses(value = {
			@ApiResponse(code = 422, message = "Invalid info for quotation"),
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
			@ApiResponse(code = 504, message = "System error")
			}) 
	@RequestMapping(value = "/quote/saving", method = POST) 
	public ResponseEntity<MotorCareDetails> saveQuote( 
			@ApiParam(value = "Motor Care info (Type: e.g. Comp, Third)", required = true) @RequestBody MotorCareDetails quoteMotor,
			@ApiParam(value = "Indicator for edit from Summary page / Resume Save4 Later") @RequestParam(value = "edit", required = false ) String edit,
			HttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("saveQuote Autherticate error: " + e.toString() );
			return motor_error(null);	
		}
		// ******************* Valid input *******************
		if(!motorCareValidationService.isValidPlanCode(quoteMotor.getPlanCode())){
			logger.info("saveQuote Invalid Plan Code:"+quoteMotor.getPlanCode());
			if(quoteMotor.getPlanCode()!=null && quoteMotor.getPlanCode().startsWith("4")){//testing
				try {
					int testHttpStatus = Integer.parseInt(quoteMotor.getPlanCode());
					if(testHttpStatus>400 && testHttpStatus<504){
						return new ResponseEntity<MotorCareDetails>((MotorCareDetails)null, HttpStatus.valueOf(testHttpStatus));
					}
				} catch (NumberFormatException e) {}
			}			
			return motor_badRequest(null);
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
			String url = UserRestURIConstants.MOTOR_CARE_SAVE_QUOTE_POST + (!isBlank(edit) ?  "?edit=" + edit : "");			
			
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
					return motor_notFound(null);
				}				
			} else {
				logger.info("saveQuote System error:"+responseJsonObj.get("errMsgs").toString());
				return motor_error(null);
			}
		} catch (Exception e) {
			logger.info("saveQuote System error:"+e.toString());
			return motor_error(null);
		}
		return Responses.ok(apiResponse);
	}	
		
	@ApiOperation(
			value = "This API is used to perform MotorCare application (Step 1 - Car Details) and return id for further actions",
			response = String.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 422, message = "Invalid Details"),
			@ApiResponse(code = 404, message = "System cannot find the policy"),
			@ApiResponse(code = 410, message = "Invalid Car Band"),
			@ApiResponse(code = 504, message = "System error")
			})
	@RequestMapping(value = {"/policy/saving/carDetails"}, method = POST)
	public ResponseEntity<Map<String, String>> savePolicyCarDetails(
			@ApiParam(value = "Motor Care Details", required = true) @RequestBody MotorCareDetails body,
			HttpServletRequest request) {
		String methodName = "savePolicyCarDetails";
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info(methodName + " Autherticate error: " + e.toString() );
			return motor_error(null);	
		}
		// ******************* Valid input *******************
		if (!motorCareValidationService.passFieldCheckCarDetails(body)) {
			logger.info(methodName + " passFieldCheckCarDetails fail");
			return motor_badRequest(null);
		}
		
		// ******************* Init *******************
		Map<String, String> apiResponse = new HashMap<>();	
		JSONObject responseJsonObj = new JSONObject();		
		
		try {
			// ******************* Form URL and Object *******************		
			String url = replace(UserRestURIConstants.MOTOR_CARE_SAVE_POLICY_POST,"{stepNo}", "1");
			String jsonString = new ObjectMapper().writeValueAsString(body);			
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
			logger.debug(methodName + " jsonInput:"+jsonInput.toString());
			
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.POST, url, headerUtil.getHeader(request), jsonInput);
			logger.debug(methodName + " responseJsonObj:"+responseJsonObj.toString());
				
			// ******************* Makeup result *******************
			if (responseJsonObj.get("errMsgs") == null) {
				if(responseJsonObj.get("motorCareDetails") != null && responseJsonObj.get("motorCareDetails").toString().length() > 0) {
					ObjectMapper mapper = new ObjectMapper();
					MotorCareDetails detail = mapper.readValue(responseJsonObj.get("motorCareDetails").toString(), MotorCareDetails.class); 
					apiResponse.put("policyID", detail.getPolicyId());
				} else {
					logger.info(methodName + " motorCareDetails not found");
					return motor_notFound(null);
				}				
			} else {
				if ( StringUtils.contains(responseJsonObj.get("errMsgs").toString(), "410")){
					return new ResponseEntity<Map<String, String>>((Map<String, String>)null, HttpStatus.valueOf(410));
				} 
				logger.info(methodName + " System error:"+responseJsonObj.get("errMsgs").toString());
				return motor_error(null);
			}
			
		} catch (Exception e) {
			logger.info(methodName + " System error:" + e.toString());
			return motor_error(null);			
		}
		return Responses.ok(apiResponse);
	}
		
	@ApiOperation(
			value = "This API is used to perform MotorCare application (Step 2 - Driver Details) and return id for further actions",
			response = String.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 422, message = "Invalid Details"),
			@ApiResponse(code = 404, message = "System cannot find the policy"),			
			@ApiResponse(code = 504, message = "System error")
			})
	@RequestMapping(value = {"/policy/saving/driverDetails"}, method = POST)
	public ResponseEntity<Map<String, String>> savePolicyDriverDetails(
			@ApiParam(value = "Motor Care Details", required = true) @RequestBody MotorCareDetails body,
			HttpServletRequest request) {
		
		String methodName = "savePolicyDriverDetails";
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info(methodName + " Autherticate error: " + e.toString() );
			return motor_error(null);	
		}
		// ******************* Valid input *******************
		if (!motorCareValidationService.passFieldCheckDriverDetails(body)) {
			logger.info(methodName + " passFieldCheckDriverDetails fail");
			return motor_badRequest(null);
		}
				
		// ******************* Init *******************
		Map<String, String> apiResponse = new HashMap<>();	
		JSONObject responseJsonObj = new JSONObject();		

		try {
			// ******************* Form URL and Object *******************		
			String url = replace(UserRestURIConstants.MOTOR_CARE_SAVE_POLICY_POST,"{stepNo}", "2");
			String jsonString = new ObjectMapper().writeValueAsString(body);			
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
			logger.debug(methodName + " jsonInput:"+jsonInput.toString());
			
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.POST, url, headerUtil.getHeader(request), jsonInput);
			logger.debug(methodName + " responseJsonObj:"+responseJsonObj.toString());
				
			// ******************* Makeup result *******************
			if (responseJsonObj.get("errMsgs") == null) {
				if(responseJsonObj.get("motorCareDetails") != null && responseJsonObj.get("motorCareDetails").toString().length() > 0) {
					ObjectMapper mapper = new ObjectMapper();
					MotorCareDetails detail = mapper.readValue(responseJsonObj.get("motorCareDetails").toString(), MotorCareDetails.class); 
					apiResponse.put("policyID", detail.getPolicyId());
				} else {
					logger.info(methodName + " motorCareDetails not found");
					return motor_notFound(null);
				}				
			} else {
				logger.info(methodName + " System error:"+responseJsonObj.get("errMsgs").toString());
				return motor_error(null);
			}
			
		} catch (Exception e) {
			logger.info(methodName + " System error:" + e.toString());
			return motor_error(null);			
		}
		
		return Responses.ok(apiResponse);
	}

	@ApiOperation(
			value = "This API is used to perform MotorCare application (Step 3 - Policy Details) and return id for further actions",
			response = String.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 422, message = "Invalid Details"),
			@ApiResponse(code = 404, message = "System cannot find the policy"),	
			@ApiResponse(code = 410, message = "System cannot process Referral Case"),
			@ApiResponse(code = 504, message = "System error")
			})
	@RequestMapping(value = {"/policy/saving/policyDetails"}, method = POST)
	public ResponseEntity<Map<String, String>> savePolicyDetails(
			@ApiParam(value = "Motor Care Details", required = true) @RequestBody MotorCareDetails body,
			HttpServletRequest request) {
		String methodName = "savePolicyDetails";
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info(methodName + " Autherticate error: " + e.toString() );
			return motor_error(null);	
		}
		// ******************* Valid input *******************
		if (!motorCareValidationService.passFieldCheckPolicyDetails(body)) {
			logger.info(methodName + " passFieldCheckPolicyDetails fail");
			return motor_badRequest(null);
		}
		
		// ******************* Init *******************
		Map<String, String> apiResponse = new HashMap<>();	
		JSONObject responseJsonObj = new JSONObject();		
				
		try {
			// ******************* Form URL and Object *******************		
			String url = replace(UserRestURIConstants.MOTOR_CARE_SAVE_POLICY_POST,"{stepNo}", "3");
			String jsonString = new ObjectMapper().writeValueAsString(body);			
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
			logger.debug(methodName + " jsonInput:"+jsonInput.toString());
			
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.POST, url, headerUtil.getHeader(request), jsonInput);
			logger.debug(methodName + " responseJsonObj:"+responseJsonObj.toString());
				
			// ******************* Makeup result *******************
			if (responseJsonObj.get("errMsgs") == null) {
				if(responseJsonObj.get("motorCareDetails") != null && responseJsonObj.get("motorCareDetails").toString().length() > 0) {
					ObjectMapper mapper = new ObjectMapper();
					MotorCareDetails detail = mapper.readValue(responseJsonObj.get("motorCareDetails").toString(), MotorCareDetails.class); 
					apiResponse.put("policyID", detail.getPolicyId());
				} else {
					logger.info(methodName + " motorCareDetails not found");
					return motor_notFound(null);
				}				
			} else {
				if ( StringUtils.contains(responseJsonObj.get("errMsgs").toString(), "410")){
					return new ResponseEntity<Map<String, String>>((Map<String, String>)null, HttpStatus.valueOf(getErrorCode(responseJsonObj.get("errMsgs").toString())));
				} 
				
				logger.info(methodName + " System error:"+responseJsonObj.get("errMsgs").toString());
				return motor_error(null);
			}
			
		} catch (Exception e) {
			logger.info(methodName + " System error:" + e.toString());
			return motor_error(null);			
		}
		return Responses.ok(apiResponse);
	}
		
	@ApiOperation(
			value = "This API is used to perform MotorCare application (Step 4 - Declarations) and return id for further actions",
			response = String.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 422, message = "Invalid Details"),
			@ApiResponse(code = 404, message = "System cannot find the policy"),	
			@ApiResponse(code = 410, message = "System cannot process Referral Case"),
			@ApiResponse(code = 504, message = "System error")
			})
	@RequestMapping(value = {"/policy/saving/declarations"}, method = POST)
	public ResponseEntity<Map<String, String>> savePolicyDeclarations(
			@ApiParam(value = "Motor Care Details", required = true) @RequestBody MotorCareDetails body,
			HttpServletRequest request) {
		String methodName = "savePolicyDeclarations";
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info(methodName + " Autherticate error: " + e.toString() );
			return motor_error(null);	
		}
		// ******************* Valid input *******************
		
		
		// ******************* Init *******************
		Map<String, String> apiResponse = new HashMap<>();	
		JSONObject responseJsonObj = new JSONObject();		
		
		try {
			// ******************* Form URL and Object *******************		
			String url = replace(UserRestURIConstants.MOTOR_CARE_SAVE_POLICY_POST,"{stepNo}", "4");
			String jsonString = new ObjectMapper().writeValueAsString(body);			
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
			logger.debug(methodName + " jsonInput:"+jsonInput.toString());
			
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.POST, url, headerUtil.getHeader(request), jsonInput);
			logger.debug(methodName + " responseJsonObj:"+responseJsonObj.toString());
				
			// ******************* Makeup result *******************
			if (responseJsonObj.get("errMsgs") == null) {
				if(responseJsonObj.get("motorCareDetails") != null && responseJsonObj.get("motorCareDetails").toString().length() > 0) {
					ObjectMapper mapper = new ObjectMapper();
					MotorCareDetails detail = mapper.readValue(responseJsonObj.get("motorCareDetails").toString(), MotorCareDetails.class); 
					apiResponse.put("policyID", detail.getPolicyId());
					apiResponse.put("token", detail.getToken());
					
					// Set token to session as security check 
					logger.info("Save declarations to Session: " + " token: " + detail.getToken() ) ;
					HttpSession session = request.getSession(true);
					session.setAttribute("MOTOR_SECURITY_CHECK_" + detail.getToken(), detail.getToken());
				} else {
					logger.info(methodName + " motorCareDetails not found");
					return motor_notFound(null);
				}				
			} else {
				if ( StringUtils.contains(responseJsonObj.get("errMsgs").toString(), "4")){
					return new ResponseEntity<Map<String, String>>((Map<String, String>)null, HttpStatus.valueOf(getErrorCode(responseJsonObj.get("errMsgs").toString())));
				} 
				
				logger.info(methodName + " System error:"+responseJsonObj.get("errMsgs").toString());
				return motor_error(null);
			}
			
		} catch (Exception e) {
			logger.info(methodName + " System error:" + e.toString());
			return motor_error(null);			
		}
		return Responses.ok(apiResponse);
	}
		
	@ApiOperation(
			value = "This API is used to handle payment",
			response = PayDollar.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 422, message = "Invalid Input"),
			@ApiResponse(code = 404, message = "System cannot find the record"),			
			@ApiResponse(code = 411, message = "There is a payment is working in process"),
			@ApiResponse(code = 412, message = "System asked for login"),
			@ApiResponse(code = 413, message = "The Premium is settled"),	
			@ApiResponse(code = 504, message = "System error")
			})
	@RequestMapping(value = {"/policy/payment"}, method = POST)
	public ResponseEntity<PayDollar> processPayment(
			@ApiParam(value = "Motor Care Details", required = true) @RequestBody MotorCareDetails body,
			//@ApiParam(value = "paymentGatewayFlag") @RequestParam(value = "paymentGatewayFlag", required = false ) String paymentGatewayFlag,	
			HttpServletRequest request) {
		String methodName = "processPayment";
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("processPayment Autherticate error: " + e.toString() );
			return motor_error(null);	
		}
		// ******************* Valid input *******************

		logger.info("--------------------- processPayment security check: " + body.getToken() );
		
		if (request.getSession(false) == null) {
			logger.info( methodName + " no session data found");
			return motor_notFound(null);
		} else {
			if (request.getSession(false).getAttribute("MOTOR_SECURITY_CHECK_" + body.getToken()) == null) {
				logger.info( methodName + " no valid session data found");
				return motor_notFound(null);
			}
		}

		// ******************* Init *******************
		PayDollar apiResponse = new PayDollar();
		JSONObject responseJsonObj = new JSONObject();		
			
		try {
			// ******************* Form URL and Object *******************
			// String url = UserRestURIConstants.MOTOR_CARE_PAYMENT_POST + (!isBlank(paymentGatewayFlag) ?  "?paymentGatewayFlag=" + paymentGatewayFlag : "");
			String url = UserRestURIConstants.MOTOR_CARE_PAYMENT_POST;
			String jsonString = new ObjectMapper().writeValueAsString(body);			
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
			
			// incoming Path		
			String toBasePath = getMotorBasePath(request) ;
			
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.POST, url, headerUtil.getHeader(request), jsonInput);
			
			// ******************* Makeup result *******************
			if (responseJsonObj.get("errMsgs") == null) {								
				if(responseJsonObj.get("payDollar") != null && responseJsonObj.get("payDollar").toString().length() > 0) {
					ObjectMapper mapper = new ObjectMapper();
					apiResponse = mapper.readValue(responseJsonObj.get("payDollar").toString(), PayDollar.class);
					
					// Other payment in progress 
					if ( StringUtils.equals(apiResponse.getErrorMsg(), "PIP") ) {
						return new ResponseEntity<PayDollar>((PayDollar)null, HttpStatus.valueOf(411));
					} else if ( StringUtils.equals(apiResponse.getErrorMsg(), "PAID") ) {
						return new ResponseEntity<PayDollar>((PayDollar)null, HttpStatus.valueOf(413));
					}
					String successUrl = toBasePath + "payment-result" + "?refNum=" + apiResponse.getReferenceNo();
					String failUrl = toBasePath + "application-summary" + "?paymentGatewayFlag=1&refNum=" + apiResponse.getReferenceNo();
					
					apiResponse.setSuccessUrl(successUrl);					
					apiResponse.setFailUrl(failUrl);
					apiResponse.setErrorUrl(failUrl);
					logger.info("------------------------------------------------------- : 1 : " + request.getServletPath() );
					logger.info("------------------------------------------------------- : 2 : " + request.getRequestURL() );
					logger.info("------------------------------------------------------- : 3 : " + request.getContextPath() );
					logger.info("------------------------------------------------------- : 4 : " + UserRestURIConstants.getLanaguage(request) );
					
					// Set the quote info to Session for fail case from payment gateway
					// No api call from failure case without login, so use session to handle that agreed with security representative
					logger.info("Save Quote to Session: (Key)" + apiResponse.getReferenceNo() + " QuoteNo: " + apiResponse.getOrderRef() + " Json: " + jsonString ) ;
					HttpSession session = request.getSession(true);
					session.setAttribute(apiResponse.getReferenceNo(), body);
					
				} else {
					logger.info("processPayment record not found");
					return motor_notFound(null);
				}				
			} else {				
				if ( StringUtils.contains(responseJsonObj.get("errMsgs").toString(), "4")){
					return new ResponseEntity<PayDollar>((PayDollar)null, HttpStatus.valueOf(getErrorCode(responseJsonObj.get("errMsgs").toString())));
				} 
				logger.info("processPayment System error:" + responseJsonObj.get("errMsgs").toString());
				return motor_error(null);				
			}	

		} catch (Exception e) {
			logger.info("processPayment System error:" + e.toString());
			return motor_error(null);			
		}
		return Responses.ok(apiResponse);
	}
	
	@ApiOperation(
			value = "This API is used to handle failed payment",
			response = MotorCareDetails.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 422, message = "Invalid Input"),
			@ApiResponse(code = 404, message = "System cannot find the record"),	
			@ApiResponse(code = 411, message = "System asked for login"),
			@ApiResponse(code = 504, message = "System error")
			})
	@RequestMapping(value = {"/policy/payment/summary"}, method = POST)
	public ResponseEntity<MotorCareDetails> processFailedPayment(
			@ApiParam(value = "Motor Care Details", required = true) @RequestBody MotorCareDetails body,
			@ApiParam(value = "paymentGatewayFlag") @RequestParam(value = "paymentGatewayFlag", required = true ) String paymentGatewayFlag,
			HttpServletRequest request) {
		String methodName = "processFailedPayment";
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info( methodName + " Autherticate error: " + e.toString() );
			return motor_error(null);	
		}
		// ******************* Valid input *******************
		
		HttpSession session = request.getSession(false);
		if (session == null) {
			logger.info( methodName + " no session data found");
			return motor_notFound(null);
		} else {
			if (session.getAttribute(body.getToken()) == null) {
				logger.info( methodName + " no valid session data found");
				return motor_notFound(null);
			}
		}
		
		// ******************* Init *******************
		MotorCareDetails apiResponse = new MotorCareDetails();
		JSONObject responseJsonObj = new JSONObject();		
			
		try {
			// ******************* Form URL and Object *******************
			String url = UserRestURIConstants.MOTOR_CARE_PAYMENT_FAILED_POST + "?paymentGatewayFlag=" + paymentGatewayFlag;
			String jsonString = new ObjectMapper().writeValueAsString(body);			
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);

			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.POST, url, headerUtil.getHeader(request), jsonInput);
			
			// ******************* Makeup result *******************
			if (responseJsonObj.get("errMsgs") == null) {				
				apiResponse = (MotorCareDetails) session.getAttribute(body.getToken());
				/*
				if(responseJsonObj.get("motorCareDetails") != null && responseJsonObj.get("motorCareDetails").toString().length() > 0) {
					ObjectMapper mapper = new ObjectMapper();
					apiResponse = mapper.readValue(responseJsonObj.get("motorCareDetails").toString(), MotorCareDetails.class);
					
				} else {
					logger.info( methodName + " record not found");
					return motor_notFound(null);
				}	
				*/			
			} else {
				if ( StringUtils.contains(responseJsonObj.get("errMsgs").toString(), "4")){
					return new ResponseEntity<MotorCareDetails>((MotorCareDetails)null, HttpStatus.valueOf(getErrorCode(responseJsonObj.get("errMsgs").toString())));
				} 
				logger.info( methodName + " System error:" + responseJsonObj.get("errMsgs").toString());
				return motor_error(null);				
			}	

		} catch (Exception e) {
			logger.info( methodName + " System error:" + e.toString());
			return motor_error(null);			
		}
		return Responses.ok(apiResponse);
	}
	
	@ApiOperation(
			value = "This API is used to resume previous session for Save for later of policy",
			response = MotorSaveForLater.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 422, message = "Invalid info"),
			@ApiResponse(code = 404, message = "System cannot find such info for your pervious session"),
			@ApiResponse(code = 411, message = "System asked for login"),
			@ApiResponse(code = 504, message = "System error")
			})
	@RequestMapping(value = {"/policy/save4Later/resume"}, method = POST)
	public ResponseEntity<MotorSaveForLater> resumeSaveForLater(
			@ApiParam(value = "Save for Later Info", required = true) @RequestBody MotorSaveForLater saveForLater,			
			HttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("resumeSaveForLater Autherticate error: " + e.toString() );
			return motor_error(null);	
		}
		
		// ******************* Valid input *******************		
		if (!isUserLogin(request)) {
			return new ResponseEntity<MotorSaveForLater>((MotorSaveForLater)null, HttpStatus.valueOf(411));
		}			
		
		// ******************* Init *******************
		MotorSaveForLater apiResponse = new MotorSaveForLater();	
		JSONObject responseJsonObj = new JSONObject();		
		
		try {
			// ******************* Form URL and Object *******************
			saveForLater.setUserName(getUserName(request));
			
			String url = UserRestURIConstants.MOTOR_CARE_SAVE_FOR_LATER_RESUME_POST;						
			String jsonString = new ObjectMapper().writeValueAsString(saveForLater);			
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
						
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.POST, url, headerUtil.getHeader(request), jsonInput);
			
			// ******************* Makeup result *******************
			if (responseJsonObj.get("errMsgs") == null) {
				if(responseJsonObj.get("motorSaveForLater") != null && responseJsonObj.get("motorSaveForLater").toString().length() > 0) {
					ObjectMapper mapper = new ObjectMapper();
					apiResponse = mapper.readValue(responseJsonObj.get("motorSaveForLater").toString(), MotorSaveForLater.class);
				} else {
					logger.info("resumeSaveForLater motorCareDetails not found");
					return motor_notFound(null);
				}				
			} else {
				logger.info("resumeSaveForLater System error:" + responseJsonObj.get("errMsgs").toString());
				return motor_error(null);				
			}		
			
		} catch (Exception e) {
			logger.info("resumeSaveForLater System error:" + e.toString());
			return motor_error(null);			
		}
		return Responses.ok(apiResponse);
	}
	
	@ApiOperation(
			value = "This API is used to perform Save for Later (Quote)",
			response = String.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 422, message = "Invalid Details"),
			@ApiResponse(code = 404, message = "System cannot find the record"),			
			@ApiResponse(code = 411, message = "System asked for login"),
			@ApiResponse(code = 504, message = "System error")
			})
	@RequestMapping(value = {"/quote/save4Later"}, method = POST)
	public ResponseEntity<Map<String, String>> save4LaterQuote(
			@ApiParam(value = "MotorCareDetails", required = true) @RequestBody MotorCareDetails body,
			HttpServletRequest request) {
		
		String methodName = "save4LaterQuote";
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info(methodName + " Autherticate error: " + e.toString() );
			return motor_error(null);	
		}
		// ******************* Valid input *******************
		if (!isUserLogin(request)) {
			return new ResponseEntity<Map<String, String>>((Map<String, String>)null, HttpStatus.valueOf(411));
		}			
				
		// ******************* Init *******************
		Map<String, String> apiResponse = new HashMap<>();	
		JSONObject responseJsonObj = new JSONObject();		
		
		try {
			// ******************* Form URL and Object *******************		
			String url = UserRestURIConstants.MOTOR_CARE_SAVE_FOR_LATER_QUOTE_POST;
			
			// Set UID and current URL
			MotorSaveForLater save4LaterRequest = new MotorSaveForLater();
			save4LaterRequest.setLang(UserRestURIConstants.getLanaguage(request));
			save4LaterRequest.setUri("rider-options");
			save4LaterRequest.setUserName(getUserName(request));
			save4LaterRequest.setMotorCareDetails(body);
			
			String jsonString = new ObjectMapper().writeValueAsString(save4LaterRequest);			
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
			logger.debug(methodName + " jsonInput:"+jsonInput.toString());
			
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.POST, url, headerUtil.getHeader(request), jsonInput);
			logger.debug(methodName + " responseJsonObj:"+responseJsonObj.toString());
				
			// ******************* Makeup result *******************
			if (responseJsonObj.get("errMsgs") == null) {
				if(responseJsonObj.get("motorSaveForLater") != null && responseJsonObj.get("motorSaveForLater").toString().length() > 0) {
					ObjectMapper mapper = new ObjectMapper();
					MotorSaveForLater detail = mapper.readValue(responseJsonObj.get("motorSaveForLater").toString(), MotorSaveForLater.class); 
					apiResponse.put("policyID", detail.getMotorCareDetails().getPolicyId());
					sendEmailByType(request, "SAVE4LATER", null);
				} else {
					logger.info(methodName + " motorSaveForLater not found");
					return motor_notFound(null);
				}				
			} else {
				logger.info(methodName + " System error:"+responseJsonObj.get("errMsgs").toString());
				return motor_error(null);
			}
		
		} catch (Exception e) {
			logger.info(methodName + " System error:" + e.toString());
			return motor_error(null);			
		}
		return Responses.ok(apiResponse);
	}
	
	@ApiOperation(
			value = "This API is used to perform Save for Later (Step 1 - Car Details)",
			response = String.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 422, message = "Invalid Details"),
			@ApiResponse(code = 404, message = "System cannot find the record"),
			@ApiResponse(code = 410, message = "Invalid Car Band"),
			@ApiResponse(code = 411, message = "System asked for login"),
			@ApiResponse(code = 504, message = "System error")
			})
	@RequestMapping(value = {"/policy/save4Later/carDetails"}, method = POST)
	public ResponseEntity<Map<String, String>> save4LaterPolicyCarDetails(
			@ApiParam(value = "MotorCareDetails", required = true) @RequestBody MotorCareDetails body,
			HttpServletRequest request) {
		String methodName = "save4LaterPolicyCarDetails";
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info(methodName + " Autherticate error: " + e.toString() );
			return motor_error(null);	
		}
		// ******************* Valid input *******************
		if (!isUserLogin(request)) {
			return new ResponseEntity<Map<String, String>>((Map<String, String>)null, HttpStatus.valueOf(411));
		}		
		
//		if (!motorCareValidationService.passFieldCheckCarDetails(body)) {
//			logger.info(methodName + " passFieldCheckCarDetails fail");
//			return motor_badRequest(null);
//		}
				
		// ******************* Init *******************
		Map<String, String> apiResponse = new HashMap<>();	
		JSONObject responseJsonObj = new JSONObject();		
		
		try {
			// ******************* Form URL and Object *******************		
			String url = replace(UserRestURIConstants.MOTOR_CARE_SAVE_FOR_LATER_POST,"{stepNo}", "1");

			// Set UID and current URL
			MotorSaveForLater save4LaterRequest = new MotorSaveForLater();
			save4LaterRequest.setLang(UserRestURIConstants.getLanaguage(request));
			save4LaterRequest.setUri("car-details");
			save4LaterRequest.setUserName(getUserName(request));
			save4LaterRequest.setMotorCareDetails(body);
			
			String jsonString = new ObjectMapper().writeValueAsString(save4LaterRequest);			
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
			logger.debug(methodName + " jsonInput:"+jsonInput.toString());
			
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.POST, url, headerUtil.getHeader(request), jsonInput);
			logger.debug(methodName + " responseJsonObj:"+responseJsonObj.toString());
				
			// ******************* Makeup result *******************
			if (responseJsonObj.get("errMsgs") == null) {
				if(responseJsonObj.get("motorSaveForLater") != null && responseJsonObj.get("motorSaveForLater").toString().length() > 0) {
					ObjectMapper mapper = new ObjectMapper();
					MotorSaveForLater detail = mapper.readValue(responseJsonObj.get("motorSaveForLater").toString(), MotorSaveForLater.class); 
					apiResponse.put("policyID", detail.getMotorCareDetails().getPolicyId());
					sendEmailByType(request, "SAVE4LATER", null);
				} else {
					logger.info(methodName + " motorSaveForLater not found");
					return motor_notFound(null);
				}				
			} else {
				logger.info(methodName + " System error:"+responseJsonObj.get("errMsgs").toString());
				return motor_error(null);
			}
			
		} catch (Exception e) {
			logger.info(methodName + " System error:" + e.toString());
			return motor_error(null);			
		}
		return Responses.ok(apiResponse);
	}
	
	@ApiOperation(
			value = "This API is used to perform Save for Later (Step 2 - Driver Details)",
			response = String.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 422, message = "Invalid Details"),
			@ApiResponse(code = 404, message = "System cannot find the record"),			
			@ApiResponse(code = 411, message = "System asked for login"),
			@ApiResponse(code = 504, message = "System error")
			})
	@RequestMapping(value = {"/policy/save4Later/driverDetails"}, method = POST)
	public ResponseEntity<Map<String, String>> save4LaterPolicyDriverDetails(
			@ApiParam(value = "MotorCareDetails", required = true) @RequestBody MotorCareDetails body,
			HttpServletRequest request) {
		String methodName = "save4LaterPolicyDriverDetails";
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info(methodName + " Autherticate error: " + e.toString() );
			return motor_error(null);	
		}
		// ******************* Valid input *******************
		if (!isUserLogin(request)) {
			return new ResponseEntity<Map<String, String>>((Map<String, String>)null, HttpStatus.valueOf(411));
		}	
		
//		if (!motorCareValidationService.passFieldCheckDriverDetails(body)) {
//			logger.info(methodName + " passFieldCheckDriverDetails fail");
//			return motor_badRequest(null);
//		}
				
		// ******************* Init *******************
		Map<String, String> apiResponse = new HashMap<>();	
		JSONObject responseJsonObj = new JSONObject();		
		
		try {
			// ******************* Form URL and Object *******************		
			String url = replace(UserRestURIConstants.MOTOR_CARE_SAVE_FOR_LATER_POST,"{stepNo}", "2");

			// Set UID and current URL
			MotorSaveForLater save4LaterRequest = new MotorSaveForLater();
			save4LaterRequest.setLang(UserRestURIConstants.getLanaguage(request));
			save4LaterRequest.setUri("drivers-details");
			save4LaterRequest.setUserName(getUserName(request));
			save4LaterRequest.setMotorCareDetails(body);
			
			String jsonString = new ObjectMapper().writeValueAsString(save4LaterRequest);			
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
			logger.debug(methodName + " jsonInput:"+jsonInput.toString());
			
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.POST, url, headerUtil.getHeader(request), jsonInput);
			logger.debug(methodName + " responseJsonObj:"+responseJsonObj.toString());
				
			// ******************* Makeup result *******************
			if (responseJsonObj.get("errMsgs") == null) {
				if(responseJsonObj.get("motorSaveForLater") != null && responseJsonObj.get("motorSaveForLater").toString().length() > 0) {
					ObjectMapper mapper = new ObjectMapper();
					MotorSaveForLater detail = mapper.readValue(responseJsonObj.get("motorSaveForLater").toString(), MotorSaveForLater.class); 
					apiResponse.put("policyID", detail.getMotorCareDetails().getPolicyId());
					sendEmailByType(request, "SAVE4LATER", null);
				} else {
					logger.info(methodName + " motorSaveForLater not found");
					return motor_notFound(null);
				}				
			} else {
				logger.info(methodName + " System error:"+responseJsonObj.get("errMsgs").toString());
				return motor_error(null);
			}
			
		} catch (Exception e) {
			logger.info(methodName + " System error:" + e.toString());
			return motor_error(null);			
		}
		return Responses.ok(apiResponse);
	}
	
	@ApiOperation(
			value = "This API is used to perform Save for Later (Step 3 - Policy Details)",
			response = String.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 422, message = "Invalid Details"),
			@ApiResponse(code = 404, message = "System cannot find the record"),			
			@ApiResponse(code = 411, message = "System asked for login"),
			@ApiResponse(code = 504, message = "System error")
			})
	@RequestMapping(value = {"/policy/save4Later/policyDetails"}, method = POST)
	public ResponseEntity<Map<String, String>> save4LaterPolicyDetails(
			@ApiParam(value = "MotorCareDetails", required = true) @RequestBody MotorCareDetails body,
			HttpServletRequest request) {
		String methodName = "save4LaterPolicyDetails";
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info(methodName + " Autherticate error: " + e.toString() );
			return motor_error(null);	
		}
		// ******************* Valid input *******************
		if (!isUserLogin(request)) {
			return new ResponseEntity<Map<String, String>>((Map<String, String>)null, HttpStatus.valueOf(411));
		}	
		
//		if (!motorCareValidationService.passFieldCheckPolicyDetails(body)) {
//			logger.info(methodName + " passFieldCheckPolicyDetails fail");
//			return motor_badRequest(null);
//		}
				
		// ******************* Init *******************
		Map<String, String> apiResponse = new HashMap<>();	
		JSONObject responseJsonObj = new JSONObject();		
		
		try {
			// ******************* Form URL and Object *******************		
			String url = replace(UserRestURIConstants.MOTOR_CARE_SAVE_FOR_LATER_POST,"{stepNo}", "3");

			// Set UID and current URL
			MotorSaveForLater save4LaterRequest = new MotorSaveForLater();
			save4LaterRequest.setLang(UserRestURIConstants.getLanaguage(request));
			save4LaterRequest.setUri("policy-details");
			save4LaterRequest.setUserName(getUserName(request));
			save4LaterRequest.setMotorCareDetails(body);
			
			String jsonString = new ObjectMapper().writeValueAsString(save4LaterRequest);			
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
			logger.debug(methodName + " jsonInput:"+jsonInput.toString());
			
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.POST, url, headerUtil.getHeader(request), jsonInput);
			logger.debug(methodName + " responseJsonObj:"+responseJsonObj.toString());
				
			// ******************* Makeup result *******************
			if (responseJsonObj.get("errMsgs") == null) {
				if(responseJsonObj.get("motorSaveForLater") != null && responseJsonObj.get("motorSaveForLater").toString().length() > 0) {
					ObjectMapper mapper = new ObjectMapper();
					MotorSaveForLater detail = mapper.readValue(responseJsonObj.get("motorSaveForLater").toString(), MotorSaveForLater.class); 
					apiResponse.put("policyID", detail.getMotorCareDetails().getPolicyId());
					sendEmailByType(request, "SAVE4LATER", null);
				} else {
					logger.info(methodName + " motorSaveForLater not found");
					return motor_notFound(null);
				}				
			} else {
				logger.info(methodName + " System error:"+responseJsonObj.get("errMsgs").toString());
				return motor_error(null);
			}
			
		} catch (Exception e) {
			logger.info(methodName + " System error:" + e.toString());
			return motor_error(null);			
		}
		return Responses.ok(apiResponse);
	}
	
	@ApiOperation(
			value = "This API is used to perform Save for Later (Step 4 - Declarations)",
			response = String.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 422, message = "Invalid Details"),
			@ApiResponse(code = 404, message = "System cannot find the record"),			
			@ApiResponse(code = 411, message = "System asked for login"),
			@ApiResponse(code = 504, message = "System error")
			})
	@RequestMapping(value = {"/policy/save4Later/declarations"}, method = POST)
	public ResponseEntity<Map<String, String>> save4LaterPolicyDeclarations(
			@ApiParam(value = "MotorCareDetails", required = true) @RequestBody MotorCareDetails body,
			HttpServletRequest request) {
		String methodName = "save4LaterPolicyDeclarations";
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info(methodName + " Autherticate error: " + e.toString() );
			return motor_error(null);	
		}
		// ******************* Valid input *******************
		if (!isUserLogin(request)) {
			return new ResponseEntity<Map<String, String>>((Map<String, String>)null, HttpStatus.valueOf(411));
		}	
				
		// ******************* Init *******************
		Map<String, String> apiResponse = new HashMap<>();	
		JSONObject responseJsonObj = new JSONObject();		
		
		try {
			// ******************* Form URL and Object *******************		
			String url = replace(UserRestURIConstants.MOTOR_CARE_SAVE_FOR_LATER_POST,"{stepNo}", "4");

			// Set UID and current URL
			MotorSaveForLater save4LaterRequest = new MotorSaveForLater();
			save4LaterRequest.setLang(UserRestURIConstants.getLanaguage(request));
			save4LaterRequest.setUri("declarations");
			save4LaterRequest.setUserName(getUserName(request));
			save4LaterRequest.setMotorCareDetails(body);
			
			String jsonString = new ObjectMapper().writeValueAsString(save4LaterRequest);			
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
			logger.debug(methodName + " jsonInput:"+jsonInput.toString());
			
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.POST, url, headerUtil.getHeader(request), jsonInput);
			logger.debug(methodName + " responseJsonObj:"+responseJsonObj.toString());
				
			// ******************* Makeup result *******************
			if (responseJsonObj.get("errMsgs") == null) {
				if(responseJsonObj.get("motorSaveForLater") != null && responseJsonObj.get("motorSaveForLater").toString().length() > 0) {
					ObjectMapper mapper = new ObjectMapper();
					MotorSaveForLater detail = mapper.readValue(responseJsonObj.get("motorSaveForLater").toString(), MotorSaveForLater.class); 
					apiResponse.put("policyID", detail.getMotorCareDetails().getPolicyId());
					sendEmailByType(request, "SAVE4LATER", null);
				} else {
					logger.info(methodName + " motorSaveForLater not found");
					return motor_notFound(null);
				}				
			} else {
				logger.info(methodName + " System error:"+responseJsonObj.get("errMsgs").toString());
				return motor_error(null);
			}
			
		} catch (Exception e) {
			logger.info(methodName + " System error:" + e.toString());
			return motor_error(null);			
		}
		return Responses.ok(apiResponse);
	}
	
	@ApiOperation(
			value = "This API is used to validate before upload later",
			response = String.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 422, message = "Invalid Details"),
			@ApiResponse(code = 404, message = "System cannot find the record"),			
			@ApiResponse(code = 504, message = "System error")
			})
	@RequestMapping(value = {"/policy/fileUpload/check"}, method = POST)
	public ResponseEntity<Map<String, String>> verify4ResumeUploadLater(
			@ApiParam(value = "Motor Care Details", required = true) @RequestBody MotorCareDetails body,
			HttpServletRequest request) {
		
		String methodName = "verify4ResumeUploadLater";
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info(methodName + " Autherticate error: " + e.toString() );
			return motor_error(null);	
		}
		// ******************* Valid input *******************
				
		// ******************* Init *******************
		Map<String, String> apiResponse = new HashMap<>();	
		JSONObject responseJsonObj = new JSONObject();		
		
		try {
			// ******************* Form URL and Object *******************		
			String url = replace(UserRestURIConstants.MOTOR_CARE_FILE_UPLOAD_CHECK_GET,"{type}", "2");
			url = url + "?refNum=" + MotorCareController.urlEncodeInputSpace(body.getRefNumber()) 
					+ "&hkid=" + body.getApplicant().getHkid() + "&coverNote=" + body.getCoverNoteNum();
			
			logger.debug(methodName + " url:" + url);
			
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.GET, url, headerUtil.getHeader(request), null);
			logger.debug(methodName + " responseJsonObj:"+responseJsonObj.toString());
				
			// ******************* Makeup result *******************
			if (responseJsonObj.get("errMsgs") == null) {
				if (responseJsonObj.get("result") != null && StringUtils.equals("OK", (String)responseJsonObj.get("result"))) {				
					apiResponse.put("result", (String)responseJsonObj.get("result"));
					// Email will be obsoleted @20170112
					// apiResponse.put("email", (String)responseJsonObj.get("toEmailAddress"));
					apiResponse.put("email", null);
					apiResponse.put("policyPremium", (String)responseJsonObj.get("policyPremium"));
				} else {
					apiResponse.put("result", "Fail");
				}
			} else {		
				if ( StringUtils.contains(responseJsonObj.get("errMsgs").toString(), "4")){
					return new ResponseEntity<Map<String, String>>((Map<String, String>)null, HttpStatus.valueOf(getErrorCode(responseJsonObj.get("errMsgs").toString())));
				} 
				
				logger.info(methodName + " System error:"+responseJsonObj.get("errMsgs").toString());
				return motor_error(null);
			}
		} catch (Exception e) {
			logger.info(methodName + " System error:" + e.toString());
			return motor_error(null);			
		}
		return Responses.ok(apiResponse);
	}
	
	@ApiOperation(
			value = "This API is used to upload files for the policy application of MotorCare",
			response = String.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 422, message = "Invalid file(s)"),
			@ApiResponse(code = 411, message = "Cannot pass upload check"),
			@ApiResponse(code = 504, message = "System error")
			})
	@RequestMapping(value = {"/policy/fileUpload"}, method = POST)
	public ResponseEntity<Map<String, String>> uploadFile4Policy(MultipartHttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("uploadFile4Policy Autherticate error: " + e.toString() );
			return motor_error(null);	
		}
		
		String securityCheckKey = request.getParameter("refNumber");
		logger.info("--------------------- processPayment security check: " + securityCheckKey);
		
		if (request.getSession(false) == null) {
			logger.info("uploadFile4Policy no session data found");
			return motor_badRequest(null);
		} else {
			if (request.getSession(false).getAttribute("MOTOR_SECURITY_CHECK_" + securityCheckKey) == null) {
				logger.info("uploadFile4Policy no valid session data found");
				return motor_badRequest(null);
			}
		}
		
		try {
			// ******************* Init *******************
			Map<String, String> apiResponse = new HashMap<>();
			List<MotorFile> fileDetailList = new ArrayList<> (); 
			MotorFileDetails motorFileDetails = new MotorFileDetails();
			JSONObject responseJsonObj = new JSONObject();
			
			Iterator<String> itr =  request.getFileNames();
			String policyId = request.getParameter("policyId");
			String docType = request.getParameter("docType");
			
			logger.info("policyId:" + policyId);
			logger.info("docType:" + docType);	
			
			// Valid upload count
			String url = replace(UserRestURIConstants.MOTOR_CARE_FILE_UPLOAD_CHECK_GET,"{type}", "4");
			url = url + "?refNum=" + MotorCareController.urlEncodeInputSpace(securityCheckKey) 
					+ "&hkid=" + null + "&coverNote=" + null;
			
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.GET, url, headerUtil.getHeader(request), null);
				
			// ******************* Makeup result *******************
			if (responseJsonObj.get("errMsgs") == null) {
				if (responseJsonObj.get("result") != null && StringUtils.equals("OK", (String)responseJsonObj.get("result"))) {				
					// Can upload 					
				} else {
					logger.info("uploadFile4Policy" + " - cannot pass the upload check");
					return new ResponseEntity<Map<String, String>>((Map<String, String>)null, HttpStatus.valueOf(411));					
				}
			} else {				
				logger.info("uploadFile4Policy" + " - cannot pass the upload check");
				return new ResponseEntity<Map<String, String>>((Map<String, String>)null, HttpStatus.valueOf(411));
			}
			
			MultipartFile mpf = null;
			while(itr.hasNext()){
				 mpf = request.getFile(itr.next()); 
				 MotorFile mf = new MotorFile();
				 
				 try {
					 if (!isValidUploadFormat(FilenameUtils.getExtension(mpf.getOriginalFilename()))) {
						 throw new Exception("Invalid File Ext");
					 }
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
					logger.info("uploadFile4Policy IOException:" + e.toString());
					return motor_error(null);			
				}
			}
			motorFileDetails.setMotorFileList(fileDetailList);
			
			// ******************* Consume Service *******************
			url = UserRestURIConstants.MOTOR_CARE_FILE_UPLOAD_POST;
			String jsonString = new ObjectMapper().writeValueAsString(motorFileDetails);			
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
			restService.consumeApi(HttpMethod.POST, url, headerUtil.getHeader(request), jsonInput);
			
			apiResponse.put("result", "OK");
			return Responses.ok(apiResponse);
			
		} catch (Exception e) {
			logger.info("uploadFile4Policy System error:" + e.toString());
			return motor_error(null);			
		}
	}	
	
	@ApiOperation(
			value = "This API is used to upload later",
			response = String.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 422, message = "Invalid file(s)"),
			@ApiResponse(code = 411, message = "Cannot pass upload check"),
			@ApiResponse(code = 504, message = "System error")
			})
	@RequestMapping(value = {"/policy/fileUploadLater"}, method = POST)
	public ResponseEntity<Map<String, String>> uploadFileLater4Policy(MultipartHttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("uploadFile4Policy Autherticate error: " + e.toString() );
			return motor_error(null);	
		}

		try {
			// ******************* Init *******************
			Map<String, String> apiResponse = new HashMap<>();
			List<MotorFile> fileDetailList = new ArrayList<> (); 
			MotorFileDetails motorFileDetails = new MotorFileDetails();
			JSONObject responseJsonObj = new JSONObject();
					
			Iterator<String> itr =  request.getFileNames();
			String refNum = request.getParameter("refNumber");
			String coverNote = request.getParameter("coverNote");
			String hkid = request.getParameter("hkid");
			String docType = request.getParameter("docType");
			String policyId = null;
			logger.info("refNum:" + refNum);
			logger.info("coverNote:" + coverNote);
			logger.info("hkid:" + hkid);
			logger.info("docType:" + docType);			
			
			// Valid First
			String url = replace(UserRestURIConstants.MOTOR_CARE_FILE_UPLOAD_CHECK_GET,"{type}", "3");
			url = url + "?refNum=" + MotorCareController.urlEncodeInputSpace(refNum) 
					+ "&hkid=" + hkid + "&coverNote=" + coverNote;
			
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.GET, url, headerUtil.getHeader(request), null);
				
			// ******************* Makeup result *******************
			if (responseJsonObj.get("errMsgs") == null) {
				if (responseJsonObj.get("result") != null && StringUtils.equals("OK", (String)responseJsonObj.get("result"))) {				
					// Can upload 
					policyId = (String)responseJsonObj.get("policyId");
				} else {
					logger.info("uploadFileLater4Policy" + " - cannot pass the upload check");
					return new ResponseEntity<Map<String, String>>((Map<String, String>)null, HttpStatus.valueOf(411));					
				}
			} else {				
				logger.info("uploadFileLater4Policy" + " - cannot pass the upload check");
				return new ResponseEntity<Map<String, String>>((Map<String, String>)null, HttpStatus.valueOf(411));
			}
			
			// do upload when passed the check
			MultipartFile mpf = null;
			while(itr.hasNext()){
				 mpf = request.getFile(itr.next()); 
				 MotorFile mf = new MotorFile();
				 
				 try {
					 if (!isValidUploadFormat(FilenameUtils.getExtension(mpf.getOriginalFilename()))) {
						 throw new Exception("Invalid File Ext");
					 }
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
					logger.info("uploadFileLater4Policy IOException:" + e.toString());
					return motor_error(null);			
				}
			}
			motorFileDetails.setMotorFileList(fileDetailList);
			
			// ******************* Consume Service *******************
			url = UserRestURIConstants.MOTOR_CARE_FILE_UPLOAD_LATER_POST;
			String jsonString = new ObjectMapper().writeValueAsString(motorFileDetails);			
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
			restService.consumeApi(HttpMethod.POST, url, headerUtil.getHeader(request), jsonInput);
			
			apiResponse.put("result", "OK");
			return Responses.ok(apiResponse);
			
		} catch (Exception e) {
			logger.info("uploadFileLater4Policy System error:" + e.toString());
			return motor_error(null);			
		}
	}	
		
	@ApiOperation(
			value = "This API is for contact me panel",
			response = String.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 422, message = "Invalid info"),
			@ApiResponse(code = 504, message = "System error")
			})
	@RequestMapping(value = "/contactMe", method = POST)
	public ResponseEntity<String> contactMe(
			@ApiParam(value = "Contact me Info", required = true) @RequestBody ContactMe contactMe,			
			HttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("contactMe Autherticate error: " + e.toString() );
			return motor_error(null);	
		}
		// ******************* Valid input *******************
		try {
			if (isBlank(contactMe.getFullName()) 
				|| isBlank(contactMe.getContactNum())
				|| isBlank(contactMe.getEmail()) 
				|| contactMe.getMotorCareDetails() == null) {
				return motor_badRequest(null);
			}
		} catch (NullPointerException e) {
			return motor_badRequest(null);
		}		
		
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
			return motor_error(null);			
		}		
	}
	
	@Deprecated
	@ApiOperation(
			value = "This API is used to get available list of Occupations",
			response = OccupationBean.class,
			hidden = true,
			responseContainer = "List"
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 404, message = "System cannot find the list of Occupations"),
			@ApiResponse(code = 504, message = "System error")
			})
	@RequestMapping(value = "/list/occupations", method = GET)
	public ResponseEntity<List<OccupationBean>> getOccupations(HttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("getOccupations Autherticate error: " + e.toString() );
			return motor_error(null);	
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
//					return motor_notFound(null);
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
	
	@Deprecated
	@ApiOperation(
			value = "UPload file testing",
			response = String.class,
			hidden = true
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 422, message = "Invalid info"),
			@ApiResponse(code = 504, message = "System error")
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
			return motor_error(null);			
		}
	}
	
	
	@Deprecated
	@ApiOperation(
			value = "This API is used to finalize(Confirm) MotorCare application after payment",
			response = String.class,
			hidden = true
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 422, message = "Invalid policy info"),
			@ApiResponse(code = 504, message = "System error")
			})
	@RequestMapping(value = {"/policy/saving/confirmation"}, method = POST)
	public ResponseEntity<String> confirmPolicy(
			@ApiParam(value = "Motor Care info (Type: e.g. Comp, Third)", required = true) @RequestBody MotorCareDetails body,
			HttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("confirmPolicy Autherticate error: " + e.toString() );
			return motor_error(null);	
		}
		
		try {
			String apiResponse = new String();
			return Responses.ok(apiResponse);
			
		} catch (Exception e) {
			logger.info("confirmPolicy System error:" + e.toString());
			return motor_error(null);			
		}
	}
	
	/******** Policy related ********/
	@Deprecated
	@ApiOperation(
			value = "This API is used to get policy details",
			response = MotorCareDetails.class,
			hidden = true
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 422, message = "Invalid Policy info"),
			@ApiResponse(code = 404, message = "System cannot find the record"),
			@ApiResponse(code = 504, message = "System error")
			})
	@RequestMapping(value = {"/policy/{policyId}"}, method = GET)
	public ResponseEntity<MotorCareDetails> getPolicy(
			@ApiParam(value = "Policy ID", required = true) @PathVariable ("policyId") String policyId,	
			HttpServletRequest request) {
		
		try {
			super.IsAuthenticate(request);
		} catch (RuntimeException e) {
			logger.info("getPolicy Autherticate error: " + e.toString() );
			return motor_error(null);	
		}
		
		// ******************* Valid input *******************
		if (isBlank(policyId)) {
			return motor_badRequest(null);
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
			return motor_notFound(null);
		} else if (StringUtils.equals(policyId, "-22222222")) {			
			// 422
			return motor_badRequest(null);
		} else {
			// 504
			return motor_error(null);
		}
		
		try {
			// To-be-updated for FULL and delete this comment when completed the coding
		} catch (Exception e) {
			logger.info("getPolicy System error:" + e.toString());
			return motor_error(null);		
		}
		return Responses.ok(apiResponse);
	}
	
	public static String urlEncodeInputSpace (String input) throws UnsupportedEncodingException {
		return replace(URLEncoder.encode(input, "UTF-8"), "+", "%20");
	}
	
	public static String getUserName(HttpServletRequest request) {
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
	
	public static boolean isUserLogin (HttpServletRequest request) {
		// not allow UserName = *DIRECTGI
		String userName = getUserName(request);
		return isNotBlank(userName) ? !StringUtils.equals("*DIRECTGI", userName) : false ;
	}
	
	private String getMotorBasePath(HttpServletRequest request) {
		return replace(request.getRequestURL().toString(), request.getServletPath(), "") 
		+ "/" + UserRestURIConstants.getLanaguage(request) + "/motor-insurance/" ;
	}	
	
	@SuppressWarnings("unchecked")
	private JSONObject getSave4LaterEmailSetting (HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		JSONObject parameters = null;
		JSONObject model = new JSONObject();
		
		if (session != null) {
			parameters = new JSONObject();
			// Get User Details
			UserDetails userDetails = (UserDetails) session.getAttribute("userDetails");
			// Form URL
			String serverUrl = replace(request.getRequestURL().toString(), request.getServletPath(), "");
			// Form JSON to send email 
			//parameters.put("to", userDetails.getEmailAddress());
			//parameters.put("to", "siuchung.kwok@fwd.com");
			if (userDetails != null) parameters.put("to", userDetails.getEmailAddress());
			parameters.put("subject", "Your Motor Smart application has not yet been completed!");
				if (userDetails != null) model.put("name", userDetails.getFullName());				
				model.put("resumeEnLink", serverUrl + "/en/motor-insurance/" + "get-quote?type=3");
				model.put("resumeTcLink", serverUrl + "/tc/motor-insurance/" + "get-quote?type=3");
			parameters.put("model", model);
			parameters.put("template", "motor\\motor-saveLater.html");
			logger.info(parameters.toString());			
		}
		return parameters;
	}
	
	@SuppressWarnings("unchecked")
	private JSONObject getUploadLaterEmailSetting (HttpServletRequest request, JSONObject data) throws UnsupportedEncodingException {
		HttpSession session = request.getSession(false);
		JSONObject parameters = null;
		JSONObject model = new JSONObject();
		JSONObject applicant = data != null ? (JSONObject)(data.get("applicant")) : null;
		
		if (session != null) {
			parameters = new JSONObject();			
			// Form URL
			String serverUrl = replace(request.getRequestURL().toString(), request.getServletPath(), "");
			// Form JSON to send email
			if (applicant != null) parameters.put("to", (String)(applicant.get("email")));
			parameters.put("subject", "FWD MotorSmart Insurance – Document submission");
				if (applicant != null) model.put("name", (String)(applicant.get("name")));				
				model.put("resumeEnLink", serverUrl + "/en/motor-insurance/" + "start-upload-later?refNum="+((String)(data.get("refNumber"))));
				model.put("resumeTcLink", serverUrl + "/tc/motor-insurance/" + "start-upload-later?refNum="+((String)data.get("refNumber")));
			parameters.put("model", model);
			parameters.put("template", "motor\\motor-uploadLater.html");
			logger.info(parameters.toString());			
		}
		return parameters;
	}
	
	// data is used for upload doc later
	protected void sendEmailByType (HttpServletRequest request, String type, JSONObject data) throws Exception{
		String methodName = "sendEmailByType";
		BaseResponse apiResult = null;

		// Upload Document Later / Save 4 Later
		JSONObject input = StringUtils.equals(type, "UPD_LATER") 
				? getUploadLaterEmailSetting(request, data) 
				: getSave4LaterEmailSetting(request);
				
		if (input != null) {			
			if (!input.containsKey("to") && isBlank((String)input.get("to"))) {
				logger.info(methodName + " - sendEmail Info: no receiver email address is found");
				throw new Exception (methodName +  " - sendEmail Info: no receiver email address is found");
			}
			
			apiResult = connector.sendTemplateEmail(input, headerUtil.getHeader(request));
			
			if (apiResult == null) {
				logger.info(methodName + " - Api Error");
				throw new Exception (methodName + " - Api Error");
			} else {
				if (apiResult.hasError()) {
					logger.info(methodName + " - Api Result Error: " + apiResult.getErrMsgs()[0]);
					throw new Exception (methodName + " - Api Result Error: " + apiResult.getErrMsgs()[0]);
				}
			}			
		} else {
			logger.info(methodName + " sendEmail Info not found");
			throw new Exception (methodName + " sendEmail Info not found");
		}
	}
	
	private static <T> ResponseEntity<T> motor_error(T model) {
		return new ResponseEntity<T>(model, HttpStatus.valueOf(MOTOR_ERR_STATUS_CDE));
	}
	
	private static <T> ResponseEntity<T> motor_notFound(T model) {
		return motor_badRequest(null);
	}
	
	private static <T> ResponseEntity<T> motor_badRequest(T model) {
		return new ResponseEntity<T>(model, HttpStatus.valueOf(MOTOR_BAD_REQUEST_STATUS_CDE));
	}
	
	private int getErrorCode(String input){
		try {
			return Integer.parseInt(replace(replace(input, "[\"", ""), "\"]", ""));
		} catch (Exception e) {
			// motor_error code
			return MOTOR_ERR_STATUS_CDE;
		}
	}
	
	private Hashtable<String,String> getUploadFileExtWhiteList () {
		Hashtable<String, String> hashtable = new Hashtable<String, String>();
		hashtable.put("PNG","PNG");
		hashtable.put("JPG","JPG");
		hashtable.put("JPEG","JPEG");
		hashtable.put("TIF","TIF");
		hashtable.put("TIFF","TIFF");
		hashtable.put("PDF","PDF");
	   return hashtable;
	}
	
	private boolean isValidUploadFormat(String ext) {
		if ( !isBlank(ext) && getUploadFileExtWhiteList().containsKey(upperCase(ext))) {
			return true;
		} 
		return false; 
	}
}
