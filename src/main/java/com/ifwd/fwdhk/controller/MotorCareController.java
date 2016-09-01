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

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
import com.ifwd.fwdhk.model.motor.QuoteMotorCare;
import com.ifwd.fwdhk.model.motor.SaveForLater;
import com.ifwd.fwdhk.model.motor.UnderWriting;

@Controller
@RequestMapping(value = "/api/iMotor", produces = {APPLICATION_JSON_VALUE, APPLICATION_XML_VALUE} )
@Api(value = "/iMotor", description = "To serve all operations regarding MotorCare")
public class MotorCareController extends BaseController{
			
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
		
		try {
			List<CarDetail> apiResponse = new ArrayList<CarDetail>();
			return Responses.ok(apiResponse);
			
		} catch (Exception e) {
			throw new RuntimeException("System error");
		}
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
	@RequestMapping(value = "/carDetails", method = GET)
	public ResponseEntity<List<CarDetail>> getCarDetailsByMake(
			@ApiParam(value = "Car Make by", required = true) @RequestParam("makeCode") String makeCode,			
			HttpServletRequest request) {
		
		// super.IsAuthenticate(request);
		
		List<CarDetail> apiResponse = new ArrayList<CarDetail>();
		
		try {			
			
		} catch (Exception e) {
			throw new RuntimeException("System error");
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
		
		try {
			List<OccupationBean> apiResponse = new ArrayList<OccupationBean>();
			return Responses.ok(apiResponse);
		} catch (Exception e) {
			throw new RuntimeException("System error");
		}
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
			response = UnderWriting.class,
			responseContainer = "List"
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 404, message = "System cannot get the list of Underwriting"),
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = "/list/underWriting", method = GET)
	public ResponseEntity<List<UnderWriting>> getUnderWriting(HttpServletRequest request) {
		
		// super.IsAuthenticate(request);
		
		try {
			List<UnderWriting> apiResponse = new ArrayList<UnderWriting>();
			return Responses.ok(apiResponse);
		} catch (Exception e) {
			throw new RuntimeException("System error");
		}
	}	
	
	/******** Quotation related ********/
	@ApiOperation(
			value = "This API is used to get quotation details",
			response = QuoteMotorCare.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 400, message = "Invalid info for quotation"),
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = {"/quote"}, method = POST)
	public ResponseEntity<QuoteMotorCare> getQuote(
			@ApiParam(value = "Motor Care info (Type: e.g. Comp, Third)", required = true) @RequestBody QuoteMotorCare quoteMotor,
			HttpServletRequest request) {
		
		// super.IsAuthenticate(request);
		
		try {
			QuoteMotorCare apiResponse = new QuoteMotorCare();
			return Responses.ok(apiResponse);
			
		} catch (Exception e) {
			throw new RuntimeException("System error");
		}
	}	
	
	@ApiOperation(
			value = "This API is used to save the quote and return policyID for further actions",
			response = String.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 400, message = "Invalid quote info"),
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = "/quote/saving", method = POST)
	public ResponseEntity<String> saveQuote(
			@ApiParam(value = "Motor Care info (Type: e.g. Comp, Third)", required = true) @RequestBody QuoteMotorCare quoteMotor,
			HttpServletRequest request) {
		
		// super.IsAuthenticate(request);
		
		try {
			String apiResponse = new String();
			return Responses.ok(apiResponse);
			
		} catch (Exception e) {
			throw new RuntimeException("System error");
		}
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
		
		super.IsAuthenticate(request);
		
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
		
		super.IsAuthenticate(request);
		
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
		
		super.IsAuthenticate(request);
		
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
		
		super.IsAuthenticate(request);
		
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
		
		super.IsAuthenticate(request);
		
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
			response = MotorFileDetails.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 400, message = "Invalid file(s)"),
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = {"/policy/fileUpload"}, method = POST)
	public ResponseEntity<MotorFileDetails> uploadFile4Policy(
			@ApiParam(value = "Files for upload", required = true) @RequestBody MotorFileDetails motorFileDetails,			
			HttpServletRequest request) {
		
		super.IsAuthenticate(request);
		
		try {
			MotorFileDetails apiResponse = new MotorFileDetails();
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
		
		super.IsAuthenticate(request);
		
		try {
			String apiResponse = new String();
			return Responses.ok(apiResponse);
			
		} catch (Exception e) {
			throw new RuntimeException("System error");
		}
	}
	
	
	
}
