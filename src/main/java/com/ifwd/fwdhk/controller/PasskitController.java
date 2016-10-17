package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;
import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;
import static org.springframework.http.MediaType.APPLICATION_XML_VALUE;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

import java.io.FileInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import springfox.documentation.annotations.ApiIgnore;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.common.document.PDFGeneration;
import com.ifwd.fwdhk.common.document.PdfAttribute;
import com.ifwd.fwdhk.connector.response.savie.ServiceCentreResponse;
import com.ifwd.fwdhk.connector.response.savie.ServiceCentreResult;
import com.ifwd.fwdhk.model.AppointmentBooking.AppointmentType;
import com.ifwd.fwdhk.controller.core.Responses;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.exception.ValidateExceptions;
import com.ifwd.fwdhk.model.OptionItemDesc;
import com.ifwd.fwdhk.model.passkit.TravelCarePass;
import com.ifwd.fwdhk.model.passkit.PassPolicyNoBean;
import com.ifwd.fwdhk.model.passkit.ValidationResult;
import com.ifwd.fwdhk.model.motor.PolicyDriverDetails;
import com.ifwd.fwdhk.services.LifeService;
//import com.ifwd.fwdhk.services.SavieService;
import com.ifwd.fwdhk.util.CommonEnum.GenderEnum;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.HeaderUtil;
import com.ifwd.fwdhk.util.InitApplicationMessage;
import com.ifwd.fwdhk.util.Methods;
import com.ifwd.fwdhk.util.NumberFormatUtils;
import com.ifwd.fwdhk.util.PasskitPageFlowControl;
import com.ifwd.fwdhk.util.ProviePageFlowControl;
import com.ifwd.fwdhk.util.SavieOnlinePageFlowControl;
import com.ifwd.fwdhk.util.WebServiceUtils;
import com.ifwd.fwdhk.util.HMAC;

@Controller
@RequestMapping(value = "/api/passkit", produces = {APPLICATION_JSON_VALUE, APPLICATION_XML_VALUE} )
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
	public ModelAndView passkitVerification(Model model, HttpServletRequest request, HttpSession httpSession) {
		//passkitOnlineService.removeProvieOnlineSession(request);
		String base64PolicyNo = (String) request.getParameter("policyNo");
		byte[] bytePolicyNo = null;
		try {
			bytePolicyNo = HMAC.decryptBase64(base64PolicyNo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String PolicyNo="";
		try {
			PolicyNo = new String(bytePolicyNo,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		model.addAttribute("PolicyNo", PolicyNo);
		return PasskitPageFlowControl.pageFlow("",model,request, UserRestURIConstants.PAGE_PROPERTIES_PASSKIT_LANDING);
	}
	
	@ApiIgnore
	@RequestMapping(value = {"/{lang}/passkit/travelCare/applicant"})
	public ModelAndView passkitApplicant(Model model, HttpServletRequest request, HttpSession httpSession) {
		//passkitOnlineService.removeProvieOnlineSession(request);
		//String base64PolicyNo = (String) request.getParameter("policyNo");
		//model.addAttribute("PolicyNo", PolicyNo);
		return PasskitPageFlowControl.pageFlow("",model,request, UserRestURIConstants.PAGE_PROPERTIES_PASSKIT_APPLICANT);
	}

	@ApiIgnore
	@RequestMapping(value = {"/{lang}/passkit/travelCare/insuredPerson"})
	public ModelAndView passkitInsuredPerson(Model model, HttpServletRequest request, HttpSession httpSession) {
		//passkitOnlineService.removeProvieOnlineSession(request);
		//String base64PolicyNo = (String) request.getParameter("policyNo");
		//model.addAttribute("PolicyNo", PolicyNo);
		return PasskitPageFlowControl.pageFlow("",model,request, UserRestURIConstants.PAGE_PROPERTIES_PASSKIT_INSURED_PERSON);
	}
		
	@ApiIgnore
	@RequestMapping(value = {"/{lang}/passkit/travelCare/insuredPerson"})
	public ModelAndView passkitDownload(Model model, HttpServletRequest request, HttpSession httpSession) {
		//passkitOnlineService.removeProvieOnlineSession(request);
		//String base64PolicyNo = (String) request.getParameter("policyNo");
		//model.addAttribute("PolicyNo", PolicyNo);
		return PasskitPageFlowControl.pageFlow("",model,request, UserRestURIConstants.PAGE_PROPERTIES_PASSKIT_DOWNLOAD);
	}
			
	@RequestMapping(value = "/policies/validate", method = GET, produces = {APPLICATION_JSON_VALUE})
	@ApiOperation(
		value = "Check if policy is available",
		response = ValidationResult.class
		)
	@ApiResponses(value = {@ApiResponse(code = 400, message = "Invalid policy Number"),
						   @ApiResponse(code = 500, message = "System error")})
	public ResponseEntity<ValidationResult> validatePolicyByPolicyNo(
			@ApiParam(value = "PolicyNo", required = true) @RequestParam("policyNo") String policyNo
			, HttpServletRequest request) {
		
		
		JSONObject resultJsonObject = new JSONObject();
		ValidationResult validationResult = new ValidationResult();
    	try {
    		resultJsonObject = passkitOnlineService.validatePolicyByPolicyNo(policyNo,request);
    		//String errMsgs= (String) resultJsonObject.get("errMsgs");
    		validationResult.setValid((boolean) resultJsonObject.get("valid"));
    		return Responses.ok(validationResult);
    	} catch (Exception e) {
    		e.printStackTrace();
    		return Responses.error(null);
    	}
	}

	@RequestMapping(value = "/policies/policiesHolder/validate", method = GET, produces = {APPLICATION_JSON_VALUE})
	@ApiOperation(
		value = "Check if policy holders is available",
		response = ValidationResult.class
		)
	@ApiResponses(value = {@ApiResponse(code = 400, message = "Invalid policy holder"),
						   @ApiResponse(code = 500, message = "System error")})
	public ResponseEntity<ValidationResult> validatePolicyHoldersByPolicyNo(
			@ApiParam(value = "PolicyNo", required = true) @RequestParam("policyNo") String policyNo,
			@ApiParam(value = "HkId", required = true) @RequestParam("hkId") String hkId
			, HttpServletRequest request) {
		
		
		JSONObject resultJsonObject = new JSONObject();
		ValidationResult validationResult = new ValidationResult();
    	try {
    		resultJsonObject = passkitOnlineService.validatePolicyHoldersByPolicyNo(policyNo,hkId,request);
    		//String errMsgs= (String) resultJsonObject.get("errMsgs");
    		validationResult.setValid((boolean) resultJsonObject.get("valid"));
    		return Responses.ok(validationResult);
    	} catch (Exception e) {
    		e.printStackTrace();
    		return Responses.error(null);
    	}
	}

	
	@ApiOperation(
			value = "Create travelCare pass ",
			response = TravelCarePass.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 400, message = "Invalid Policy Number"),
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = {"/travelCare"}, method = RequestMethod.POST)
	public ResponseEntity<TravelCarePass> createTravelCarePassKit(
			@ApiParam(value = "PolicyNo", required = true) @RequestBody PassPolicyNoBean passPolicy,
			HttpServletRequest request) {
		
		JSONObject resultJsonObject = new JSONObject();
		TravelCarePass travelCarePass = new TravelCarePass();
		try {
			resultJsonObject = passkitOnlineService.createTravelCarePassKit(passPolicy,request);
			//String errMsgs= (String) resultJsonObject.get("errMsgs");
			travelCarePass.setPassId((String) resultJsonObject.get("passId"));
			travelCarePass.setPassId((String) resultJsonObject.get("url"));
			return Responses.ok(travelCarePass);
		} catch (Exception e) {
			e.printStackTrace();
    		return Responses.error(null);
		}
	}
	
	
//end of class	
}
