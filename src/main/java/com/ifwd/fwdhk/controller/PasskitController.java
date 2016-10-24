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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import springfox.documentation.annotations.ApiIgnore;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.controller.core.Responses;
import com.ifwd.fwdhk.model.passkit.ValidateHolderResult;
import com.ifwd.fwdhk.model.passkit.ValidatePolicyResult;
import com.ifwd.fwdhk.model.passkit.PassPolicyNoBean;
import com.ifwd.fwdhk.services.LifeService;
import com.ifwd.fwdhk.util.PasskitPageFlowControl;

@Controller
//@RequestMapping(value = "/api/passkit", produces = {APPLICATION_JSON_VALUE, APPLICATION_XML_VALUE} )
@Api(value = "/api/passkit", description = "Operations about passkit")
public class PasskitController extends BaseController{
	
	private final static Logger logger = LoggerFactory.getLogger(PasskitController.class);

	//private static final RequestMethod[] POST = null;
	
	@Autowired
	private RestServiceDao restService;
	@Autowired
	private LifeService passkitOnlineService;
	
	
	@ApiIgnore
	@RequestMapping(value = {"/{lang}/passkit/travelCare"})
	public ModelAndView passkitLanding(Model model, HttpServletRequest request, HttpSession httpSession) {
		//passkitOnlineService.removeProvieOnlineSession(request);
		String policyNo = (String) request.getParameter("policyNo");		

		model.addAttribute("policyNo", policyNo);
		return PasskitPageFlowControl.pageFlow("",model,request, UserRestURIConstants.PAGE_PROPERTIES_PASSKIT_LANDING);
	}
	
		
	@RequestMapping(value = "/api/passkit/policies/validate", method = GET, produces = {APPLICATION_JSON_VALUE})
	@ApiOperation(
		value = "Check if policy is available",
		response = ValidatePolicyResult.class
		)
	@ApiResponses(value = {@ApiResponse(code = 400, message = "Invalid policy Number"),
						   @ApiResponse(code = 500, message = "System error")})
	public ResponseEntity<ValidatePolicyResult> validatePolicyByPolicyNo(
			@ApiParam(value = "PolicyNo", required = true) @RequestParam("policyNo") String policyNo
			, HttpServletRequest request) {
		
		
		JSONObject resultJsonObject = new JSONObject();
		ValidatePolicyResult validatePolicyResult = new ValidatePolicyResult();
    	try {
    		resultJsonObject = passkitOnlineService.validatePolicyByPolicyNo(policyNo,request);
    		validatePolicyResult.setValid((boolean) resultJsonObject.get("valid"));
    		//validatePolicyResult.setValid(true);
    		return Responses.ok(validatePolicyResult);
    	} catch (Exception e) {
    		e.printStackTrace();
    		return Responses.error(null);
    	}
	}
/*
	@RequestMapping(value = "/api/passkit/policies/policiesHolder/validate", method = POST, produces = {APPLICATION_JSON_VALUE})
	@ApiOperation(
		value = "Check if policy holders is available",
		response = ValidateHolderResult.class
		)
	@ApiResponses(value = {@ApiResponse(code = 400, message = "Invalid policy holder/applicant"),
						   @ApiResponse(code = 500, message = "System error")})
	public ResponseEntity<ValidateHolderResult> validatePolicyHoldersByPolicyNo(
			@ApiParam(value = "PolicyInfo", required = true) @RequestParam("policyInfo") PassPolicyNoBean passPolicy,
			HttpServletRequest request) {
		
		
		JSONObject resultJsonObject = new JSONObject();
		ValidateHolderResult validateHolderResult = new ValidateHolderResult();
    	try {
    		resultJsonObject = passkitOnlineService.validatePolicyHoldersByPolicyNo(passPolicy,request);
    		validateHolderResult.setValid((boolean) resultJsonObject.get("valid"));
    		validateHolderResult.setPassId((String) resultJsonObject.get("passId"));
    		validateHolderResult.setUrl((String) resultJsonObject.get("url"));
    		return Responses.ok(validateHolderResult);
    	} catch (Exception e) {
    		e.printStackTrace();
    		return Responses.error(null);
    	}
	}
	
*/
	@RequestMapping(value = "/api/passkit/policies/policiesHolder/validate", method = GET, produces = {APPLICATION_JSON_VALUE})
	@ApiOperation(
		value = "Check if policy holders is available",
		response = ValidateHolderResult.class
		)
	@ApiResponses(value = {@ApiResponse(code = 400, message = "Invalid policy holder/applicant"),
						   @ApiResponse(code = 500, message = "System error")})
	public ResponseEntity<ValidateHolderResult> validatePolicyHoldersByPolicyNo(
			@ApiParam(value = "PolicyNo", required = true) @RequestParam("policyNo") String policyNo,
			@ApiParam(value = "HkId", required = true) @RequestParam("hkId") String hkId,
			@ApiParam(value = "Role", required = true) @RequestParam("role") String role,
			HttpServletRequest request) {
		
		
		JSONObject resultJsonObject = new JSONObject();
		ValidateHolderResult validateHolderResult = new ValidateHolderResult();
    	try {
    		resultJsonObject = passkitOnlineService.validatePolicyHoldersByPolicyNoGet(policyNo,hkId,role,request);
    		validateHolderResult.setValid((boolean) resultJsonObject.get("valid"));
    		validateHolderResult.setPassId((String) resultJsonObject.get("passId"));
    		validateHolderResult.setUrl((String) resultJsonObject.get("url"));
    		return Responses.ok(validateHolderResult);
    	} catch (Exception e) {
    		e.printStackTrace();
    		return Responses.error(null);
    	}
	}

	
//end of class	
}
