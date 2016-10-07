package com.ifwd.fwdhk.controller;

import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;
import static org.springframework.http.MediaType.APPLICATION_XML_VALUE;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ifwd.fwdhk.controller.core.Responses;
import com.ifwd.fwdhk.model.BankBean;
import com.ifwd.fwdhk.model.OccupationBean;
import com.ifwd.fwdhk.model.motor.CarDetail;
import com.ifwd.fwdhk.model.motor.ContactMe;
import com.ifwd.fwdhk.model.motor.MotorFileDetails;
import com.ifwd.fwdhk.model.motor.PolicyCarDetails;
import com.ifwd.fwdhk.model.motor.PolicyDeclaration;
import com.ifwd.fwdhk.model.motor.PolicyDriverDetails;
import com.ifwd.fwdhk.model.motor.PolicyInfo;
import com.ifwd.fwdhk.model.motor.PolicyMotorCare;
import com.ifwd.fwdhk.model.motor.MotorCareDetails;
import com.ifwd.fwdhk.model.motor.SaveForLater;
import com.ifwd.fwdhk.model.motor.MotorCareDeclaration;
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
		
		// super.IsAuthenticate(request);		
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
			@ApiResponse(code = 500, message = "System error")
			})

    @RequestMapping(value = "/carDetails/{makeCode}", method = GET)
	public ResponseEntity<List<CarDetail>> getCarDetailsByMake(
            @ApiParam(value = "Car Make by", required = true) @PathVariable("makeCode") String makeCode,            
			HttpServletRequest request) {
		
		// super.IsAuthenticate(request);		
		// ******************* Valid input *******************
		
		// ******************* Init *******************
		List<CarDetail> apiResponse = new ArrayList<CarDetail>();		
		JSONObject responseJsonObj = new JSONObject();
		try {		
			// ******************* Form URL *******************
			String encodedMake = urlEncodeInputSpace(makeCode);
			String url = StringUtils.replace(UserRestURIConstants.MOTOR_CARE_CARDETAILS_BY_MAKE_GET,"{makeCode}", encodedMake);
			
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
		
		// super.IsAuthenticate(request);
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
	public ResponseEntity<String> getPromoCodes(
			@ApiParam(value = "Email address to get the promo code", required = true) @RequestBody String email,				
			HttpServletRequest request) {
		
		//super.IsAuthenticate(request);	
				
		try {			
			String apiResponse = new String();
			return Responses.ok(apiResponse);
			
		} catch (Exception e) {
			throw new RuntimeException("System error");
		}
	}
	
	@ApiOperation(
			value = "This API is used to get Underwriting List during MotorCare policy application ",
			response = MotorCareDeclaration.class,
			responseContainer = "List"
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 404, message = "System cannot get the list of Underwriting"),
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = "/list/underWriting", method = GET)
	public ResponseEntity<List<MotorCareDeclaration>> getUnderWriting(HttpServletRequest request) {
		
		// super.IsAuthenticate(request);
		
		try {
			List<MotorCareDeclaration> apiResponse = new ArrayList<MotorCareDeclaration>();
			return Responses.ok(apiResponse);
		} catch (Exception e) {
			throw new RuntimeException("System error");
		}
	}	
	
	/******** Quotation related ********/
	@ApiOperation(
			value = "This API is used to get quotation details",
			response = MotorCareDetails.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 400, message = "Invalid info for quotation"),
			@ApiResponse(code = 417, message ="Invalid Make/Model" ),
			@ApiResponse(code = 414, message ="Invalid Make/Model Electronic Car" ),
			@ApiResponse(code = 406, message ="Invalid Occupation" ),
			@ApiResponse(code = 415, message ="Invalid NCD" ),
			@ApiResponse(code = 408, message ="Invalid Age" ),
			@ApiResponse(code = 409, message ="Invalid Driving Years" ),
			@ApiResponse(code = 416, message ="Invalid Year of Manufacture 8-13" ),
			@ApiResponse(code = 410, message ="Invalid Year of Manufacture" ),
			@ApiResponse(code = 412, message ="Invalid Estimated Value Maximum" ),
			@ApiResponse(code = 413, message ="Invalid Estimated Value Minimum" ),
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = {"/quote"}, method = POST)
	public ResponseEntity<MotorCareDetails> getQuote(
			@ApiParam(value = "Motor Care info (Type: e.g. Comp, Third)", required = true) @RequestBody MotorCareDetails quoteMotor,
			HttpServletRequest request) {
		
		// super.IsAuthenticate(request);
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
			value = "This API is used to save the quote and return policyID for further actions",
			response = MotorCareDetails.class				
			)
	@ApiResponses(value = {
			@ApiResponse(code = 400, message = "Invalid info for quotation"),
			@ApiResponse(code = 417, message ="Invalid Make/Model" ),
			@ApiResponse(code = 414, message ="Invalid Make/Model Electronic Car" ),
			@ApiResponse(code = 406, message ="Invalid Occupation" ),
			@ApiResponse(code = 415, message ="Invalid NCD" ),
			@ApiResponse(code = 408, message ="Invalid Age" ),
			@ApiResponse(code = 409, message ="Invalid Driving Years" ),
			@ApiResponse(code = 416, message ="Invalid Year of Manufacture 8-13" ),
			@ApiResponse(code = 410, message ="Invalid Year of Manufacture" ),
			@ApiResponse(code = 412, message ="Invalid Estimated Value Maximum" ),
			@ApiResponse(code = 413, message ="Invalid Estimated Value Minimum" ),
			@ApiResponse(code = 500, message = "System error")
			}) 
	@RequestMapping(value = "/quote/saving", method = POST) 
	public ResponseEntity<MotorCareDetails> saveQuote( 
			@ApiParam(value = "Motor Care info (Type: e.g. Comp, Third)", required = true) @RequestBody MotorCareDetails quoteMotor,
			HttpServletRequest request) {
		
		// super.IsAuthenticate(request);
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
			response = PolicyMotorCare.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 400, message = "Invalid policy info"),
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = {"/policy"}, method = POST)
	public ResponseEntity<PolicyMotorCare> getPolicy(
			@ApiParam(value = "Policy ID", required = true) @RequestBody String id,	
			HttpServletRequest request) {
		
		// super.IsAuthenticate(request);
		
		try {
			PolicyMotorCare apiResponse = new PolicyMotorCare();
			return Responses.ok(apiResponse);
			
		} catch (Exception e) {
			throw new RuntimeException("System error");
		}
	}
		
	@ApiOperation(
			value = "This API is used to perform MotorCare application (Car Details) and return policyID for further actions ",
			response = String.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 400, message = "Invalid Car info"),
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = {"/policy/carDetails"}, method = POST)
	public ResponseEntity<String> savePolicyCarDetails(
			@ApiParam(value = "Car Details", required = true) @RequestBody PolicyCarDetails body,
			HttpServletRequest request) {
		
		super.IsAuthenticate(request);
		
		try {
			String apiResponse = new String();
			return Responses.ok(apiResponse);
			
		} catch (Exception e) {
			throw new RuntimeException("System error");
		}
	}
	
	@ApiOperation(
			value = "This API is used to perform MotorCare application (Driver Details) and return policyID for further actions ",
			response = String.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 400, message = "Invalid Driver info"),
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = {"/policy/driverDetails"}, method = POST)
	public ResponseEntity<String> savePolicyDriver(
			@ApiParam(value = "Driver Details", required = true) @RequestBody PolicyDriverDetails body,
			HttpServletRequest request) {
		
		// super.IsAuthenticate(request);
		
		try {
			String apiResponse = new String();
			return Responses.ok(apiResponse);
			
		} catch (Exception e) {
			throw new RuntimeException("System error");
		}
	}
	
	@ApiOperation(
			value = "This API is used to perform MotorCare application (Policy Details) and return policyID for further actions",
			response = String.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 400, message = "Invalid Policy info"),
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = {"/policy/details"}, method = POST)
	public ResponseEntity<String> savePolicyInfo(
			@ApiParam(value = "Policy Details", required = true) @RequestBody PolicyInfo body,
			HttpServletRequest request) {
		
		// super.IsAuthenticate(request);
		
		try {
			String apiResponse = new String();
			return Responses.ok(apiResponse);
			
		} catch (Exception e) {
			throw new RuntimeException("System error");
		}
	}
	
	@ApiOperation(
			value = "This API is used to perform MotorCare application (Declarations) and return policyID for further actions",
			response = String.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 400, message = "Invalid policy info"),
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = {"/policy/declarations"}, method = POST)
	public ResponseEntity<String> savePolicyDeclarations(
			@ApiParam(value = "Declarations", required = true) @RequestBody PolicyDeclaration body,
			HttpServletRequest request) {
		
		// super.IsAuthenticate(request);
		
		try {
			String apiResponse = new String();
			return Responses.ok(apiResponse);
			
		} catch (Exception e) {
			throw new RuntimeException("System error");
		}
	}
		
	@ApiOperation(
			value = "This API is used to finalize(Confirm) MotorCare application after payment",
			response = String.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 400, message = "Invalid policy info"),
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = {"/policy/confirmation"}, method = POST)
	public ResponseEntity<String> confirmPolicy(
			@ApiParam(value = "Motor Care info (Type: e.g. Comp, Third)", required = true) @RequestBody PolicyMotorCare policyMotorCare,
			
			HttpServletRequest request) {
		
		// super.IsAuthenticate(request);
		
		try {
			String apiResponse = new String();
			return Responses.ok(apiResponse);
			
		} catch (Exception e) {
			throw new RuntimeException("System error");
		}
	}
	
	@ApiOperation(
			value = "This API is used to do Save for later of policy",
			response = SaveForLater.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 400, message = "Invalid Id to perform Save for later"),
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = {"/saveForLater"}, method = POST)
	public ResponseEntity<SaveForLater> saveForLater(
			@ApiParam(value = "Save for Later Info", required = true) @RequestBody SaveForLater saveForLater,			
			HttpServletRequest request) {
		
		super.IsAuthenticate(request);
		
		try {
			SaveForLater apiResponse = new SaveForLater();
			return Responses.ok(apiResponse);
			
		} catch (Exception e) {
			throw new RuntimeException("System error");
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
		
		super.IsAuthenticate(request);
		
		try {
			String apiResponse = new String();
			return Responses.ok(apiResponse);
			
		} catch (Exception e) {
			throw new RuntimeException("System error");
		}
	}	
	
	
	@ApiOperation(
			value = "This API is used to get available list of bank for mortgage or specfic bank",
			response = BankBean.class,
			responseContainer = "List"
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 404, message = "System cannot find bank details"),
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = "/list/bankMortgages", method = GET)
	public ResponseEntity<List<BankBean>> getBankMortgages(
			@ApiParam(value = "Bank code", required = false) @RequestParam("bankCode") String bankCode,			
			HttpServletRequest request) {
		
		super.IsAuthenticate(request);
		
		try {
			List<BankBean> apiResponse = new ArrayList<BankBean>();
			return Responses.ok(apiResponse);
			
		} catch (Exception e) {
			throw new RuntimeException("System error");
		}
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
		
		
		// super.IsAuthenticate(request);
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
			@ApiResponse(code = 400, message = "System cannot car supplement details"),
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = "/carDetails/{makeCode}/supplement", method = GET)							  
	public ResponseEntity<CarDetail> getCarSupplementDetailsByMakeAndModel(
			@ApiParam(value = "Car Make by", required = true) @PathVariable ("makeCode") String makeCode,
			@ApiParam(value = "Car Model", required = true) @RequestParam ("carModel") String carModel,	
			HttpServletRequest request) {
		
		// super.IsAuthenticate(request);		
		// ******************* Valid input *******************
		
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
	
	private String urlEncodeInputSpace (String input) throws UnsupportedEncodingException {
		return StringUtils.replace(URLEncoder.encode(input, "UTF-8"), "+", "%20");
	}
	
	
}
