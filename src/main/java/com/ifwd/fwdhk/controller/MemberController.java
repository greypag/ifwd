package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;
import static org.apache.commons.lang3.StringUtils.startsWithIgnoreCase;
import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import static org.springframework.web.bind.annotation.RequestMethod.PUT;

import java.util.ArrayList;
import java.util.List;
import java.io.IOException;
import java.util.Map;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import org.springframework.http.HttpStatus;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.exception.ExceptionUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.collect.Maps;
import com.ifwd.fwdhk.controller.core.Responses;
import com.ifwd.fwdhk.model.CrsStatus;
import com.ifwd.fwdhk.model.CrsStatusResponse;
import com.ifwd.fwdhk.model.Member;
import com.ifwd.fwdhk.model.MemberActionResult;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.model.UserLogin;
import com.ifwd.fwdhk.model.registrationrevamp.ForgetUsernameRequest;
import com.ifwd.fwdhk.model.registrationrevamp.ForgetUsernameResponse;
import com.ifwd.fwdhk.model.registrationrevamp.ForgotPasswordRequest;
import com.ifwd.fwdhk.model.registrationrevamp.ForgotPasswordResponse;
import com.ifwd.fwdhk.model.registrationrevamp.RegistrationRequest;
import com.ifwd.fwdhk.model.registrationrevamp.RegistrationResponse;
import com.ifwd.fwdhk.util.DateApi;
import com.ifwd.fwdhk.util.HeaderUtil;
import com.ifwd.fwdhk.util.Methods;

@Controller
@RequestMapping(value = "/api/member", produces = {APPLICATION_JSON_VALUE})
@Api(value = "/member", description = "Operations about members")
public class MemberController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	protected HeaderUtil headerUtil;
	
	@RequestMapping(value = "/session", method = GET)
	@ApiOperation(
		value = "Get User Details from session",
		response = UserDetails.class
		)
	@ApiResponses(value = {@ApiResponse(code = 404, message = "Not login")
							, @ApiResponse(code = 500, message = "System error")})
	public ResponseEntity<UserDetails> getUserDetails(HttpServletRequest request) {
		super.IsAuthenticate(request);
		
		if (request.getSession(true).getAttribute("userDetails") != null) {
			return Responses.ok((UserDetails)request.getSession(true).getAttribute("userDetails"));
		} else {
			return Responses.notFound(null);
		}
	}
	
	@RequestMapping(method = POST)
	@ApiOperation(
		value = "Create member",
		response = MemberActionResult.class
		)
	@ApiResponses(value = {@ApiResponse(code = 400, message = "Invalid input")
							, @ApiResponse(code = 406, message = "Cannot create member - This username already in use")
							, @ApiResponse(code = 409, message = "Cannot create member - Email address and mobile no. already registered")
							, @ApiResponse(code = 500, message = "System error")})
	public ResponseEntity<MemberActionResult> register(
			@ApiParam(value = "Username and Password to login", required = true) @RequestBody Member member
			, HttpServletRequest request) {

		super.IsAuthenticate(request);
		
		// This part can be done inside method "loginMember"
		/* 
		HttpSession session = request.getSession(false);
		if(session != null) {
			session.invalidate();
		}		
		*/
		
		if (!member.getPassword().equals(member.getConfirmPassword())) {
			MemberActionResult result = new MemberActionResult();	
			result.setMessage("Password and confirm password do not match");
			return Responses.badRequest(result);
		}

		try {			
			JSONObject params = new JSONObject();
			params.put("userName", member.getUserName());
			params.put("mobile", Methods.formatMobile(member.getMobileNo()));
			params.put("password", member.getPassword());
			params.put("email", member.getEmail());
			params.put("name", member.getFullName());
			params.put("optIn1", member.getOptOut1());
			params.put("optIn2", member.getOptOut2());
			
			JSONObject jsonResponse = restService.consumeApi(HttpMethod.PUT,
					UserRestURIConstants.USER_JOIN_US,
					COMMON_HEADERS, params);
			if (jsonResponse.get("errMsgs") == null) {
				UserLogin userLogin = new UserLogin();
				userLogin.setUserName(member.getUserName());
				userLogin.setPassword(member.getPassword());
				return loginMember(userLogin, request);
			} else {
				logger.info(member.getUserName()+" "+washGIMessage(jsonResponse.get("errMsgs").toString()));
				MemberActionResult result = new MemberActionResult();
				
                if (washGIMessage(jsonResponse.get("errMsgs").toString()).equals("This username already in use, please try again")) {
    				return Responses.notAcceptable(result);
                } else if (washGIMessage(jsonResponse.get("errMsgs").toString()).equals("email address and mobile no. already registered")) {
    				return Responses.conflict(result);
                } else {
    				return Responses.error(result);
                }
                
			}
		} catch (Exception e) {
			logger.error(ExceptionUtils.getStackTrace(e));
			MemberActionResult result = new MemberActionResult();	
			result.setMessage("system error");
			return Responses.error(null);
		}
	}
		
	@RequestMapping(value = "/login", method = POST)
	@ApiOperation(
		value = "Member login",
		response = MemberActionResult.class
		)
	@ApiResponses(value = {@ApiResponse(code = 400, message = "Invalid Login or Password"),
			@ApiResponse(code = 401, message = "Login failed"),
			@ApiResponse(code = 500, message = "System error")})
	public ResponseEntity<MemberActionResult> loginMember(
			@ApiParam(value = "Username and Password to login", required = true) @RequestBody UserLogin userLogin
			, HttpServletRequest request) {
		
		super.IsAuthenticate(request);
		
		try {
			if (!userLogin.getPassword().isEmpty()
					&& !userLogin.getUserName().isEmpty()) {	
				MemberActionResult rs = loginMemberSession(userLogin, request);
				if (rs.getMessage() != null && rs.getMessage().length() > 0) {
					return Responses.unauthorized(rs);
				} else {
					return Responses.ok(rs);
				}
			} else {
				MemberActionResult result = new MemberActionResult();	
				result.setMessage("Invalid parameters");
				return Responses.ok(result);
			}
		} catch (Exception e) {
			MemberActionResult result = new MemberActionResult();	
			result.setMessage("System error");
			return Responses.error(result);
		}
	}
	
	@RequestMapping(value = "/retrieveUserName", method = GET)
	@ApiOperation(
		value = "Retrieve user name",
		response = MemberActionResult.class
		)
	@ApiResponses(value = {@ApiResponse(code = 400, message = "Invalid Email or Mobile Number"),
			@ApiResponse(code = 500, message = "System error")})
	public ResponseEntity<MemberActionResult> retrieveUserName(
			@ApiParam(value = "Registered email", required = true) @RequestParam("email") String email
			, @ApiParam(value = "Registered mobile number", required = true) @RequestParam("mobileNum") String mobileNum
			, HttpServletRequest request) {
		
		super.IsAuthenticate(request);
		
		try {
			JSONObject params = new JSONObject();
			params.put("email", email);
			params.put("mobile", Methods.formatMobile(mobileNum));
			
			JSONObject jsonResponse = restService.consumeApi(HttpMethod.POST,
					UserRestURIConstants.USER_FORGOT_USERNAME,
					COMMON_HEADERS, params);
			
			if (jsonResponse.get("errMsgs") == null) {
				MemberActionResult result = new MemberActionResult();
				result.setUserName(jsonResponse.get("userName").toString());
				result.setMessage("OK");
				return Responses.ok(result);
			} else {
				MemberActionResult result = new MemberActionResult();	
				result.setMessage(washGIMessage(jsonResponse.get("errMsgs").toString()));
				return Responses.ok(result);
			}
		} catch (Exception e) {
			MemberActionResult result = new MemberActionResult();	
			result.setMessage("System error");
			return Responses.error(result);
		}
	}
	
	@RequestMapping(value = "/forgotPassword", method = GET)
	@ApiOperation(
		value = "Reset password",
		response = MemberActionResult.class
		)
	@ApiResponses(value = {@ApiResponse(code = 400, message = "Invalid Email, Mobile Number or User Name"),
			@ApiResponse(code = 404, message = "Input data does not match any record"),
			@ApiResponse(code = 500, message = "System error")})
	public ResponseEntity<MemberActionResult> forgotPassword(
			@ApiParam(value = "Registered email", required = true) @RequestParam("email") String email
			, @ApiParam(value = "Registered mobile number", required = true) @RequestParam("mobileNum") String mobileNum
			, @ApiParam(value = "Registered user name", required = true) @RequestParam("userName") String userName
			, HttpServletRequest request) {
		
		super.IsAuthenticate(request);
		
		try {
			JSONObject params = new JSONObject();
			params.put("userName", userName);
			params.put("email", email);
			params.put("mobile", mobileNum);
			
			JSONObject jsonResponse = restService.consumeApi(HttpMethod.POST,
					UserRestURIConstants.USER_FORGOT_PASSWORD,
					COMMON_HEADERS, params);
			
            if (jsonResponse.get("errMsgs") == null) {
				MemberActionResult result = new MemberActionResult();
				result.setMessage("OK");
				return Responses.ok(result);
            } else {
				MemberActionResult result = new MemberActionResult();	
				result.setMessage(washGIMessage(jsonResponse.get("errMsgs").toString()));
				return Responses.notFound(result);            
            }
		} catch (Exception e) {
			MemberActionResult result = new MemberActionResult();	
			result.setMessage("System error");
			return Responses.error(result);
		}
	}	
		
	private MemberActionResult loginMemberSession(UserLogin userLogin, HttpServletRequest servletRequest) {
		HttpSession session = servletRequest.getSession(false);
		String sessionSecurityCheckName4Motor = "";
		Map<String, Object> securityCheckNameMap4Motor = new HashMap<>();
		
		if(session != null) {
			// Special for motor smart as use this value @session as security check
			@SuppressWarnings("rawtypes")
			Enumeration names = session.getAttributeNames();
			while (names.hasMoreElements()) {
				sessionSecurityCheckName4Motor = (String) names.nextElement();
				if (startsWithIgnoreCase(sessionSecurityCheckName4Motor,"MOTOR_SECURITY_CHECK_"))
					break;
			}
			securityCheckNameMap4Motor.put(sessionSecurityCheckName4Motor, session.getAttribute(sessionSecurityCheckName4Motor));
			
			// Clear the session and re-create one
			session.invalidate();
		}
		
		JSONObject params = new JSONObject();
		params.put("userName", userLogin.getUserName());
		params.put("password", userLogin.getPassword());

		JSONObject apiResponse = restService.consumeApi(HttpMethod.POST
				, UserRestURIConstants.USER_LOGIN, COMMON_HEADERS, params);
		if (apiResponse != null && !apiResponse.isEmpty() && apiResponse.get("errMsgs") == null) {
			JSONObject customer = (JSONObject) apiResponse.get("customer");
			
			session = servletRequest.getSession(true);
			session.setAttribute("authenticate", "true");
			session.setAttribute("token", apiResponse.get("token")
					.toString());
			session.setAttribute("username", userLogin.getUserName());
			session.setAttribute("emailAddress",
					checkJsonObjNull(customer, "email"));
			session.setAttribute("myReferralCode",
					checkJsonObjNull(customer, "referralCode"));
			session.setAttribute("myHomeReferralCode",
					checkJsonObjNull(customer, "referralCode"));
			session.setAttribute("myTravelReferralCode",
					checkJsonObjNull(customer, "referralCode"));
			session.setAttribute("myAnnualTravelReferralCode",
					checkJsonObjNull(customer, "referralCode"));
			
			// Special for Motor put back to session as security check 
			if (securityCheckNameMap4Motor.containsKey(sessionSecurityCheckName4Motor)) {
				session.setAttribute(sessionSecurityCheckName4Motor, securityCheckNameMap4Motor.get(sessionSecurityCheckName4Motor));
			}
							
			UserDetails userDetails = new UserDetails();
			userDetails.setToken(checkJsonObjNull(apiResponse, "token"));
			userDetails.setFullName(checkJsonObjNull(customer, "name"));
			if(userDetails.getFullName() != null && userDetails.getFullName().contains(" ")){
				String[] strArray = userDetails.getFullName().split(" ");
				String firstName = "";
				String lastName = "";
				for(int i=0;i<strArray.length;i++){
					if(i==0){
						lastName = strArray[0];
					}
					else{
						firstName += strArray[i]+" ";
					}
				}
				userDetails.setFirstName(firstName);
				userDetails.setLastName(lastName);
			}
			else{
				userDetails.setFirstName(userDetails.getFullName());
			}
			userDetails.setEmailAddress(checkJsonObjNull(customer,
					"email"));
			userDetails.setMobileNo(Methods.formatMobile(checkJsonObjNull(customer,
					"contactNo")));
			userDetails.setUserName(userLogin.getUserName());
			userDetails.setReferralCode(checkJsonObjNull(customer,
					"referralCode"));
			userDetails.setReferralCodeUsedCount(checkJsonObjNull(
					customer, "referralCodeUsedCount"));
			userDetails.setReferralLink(checkJsonObjNull(customer,
					"referralLink"));
			userDetails.setGender(checkJsonObjNull(customer, "gender"));
			userDetails.setDob(checkJsonObjNull(customer, "dob"));
			userDetails.setOptIn1(checkJsonObjNull(customer, "optIn1"));
			userDetails.setOptIn2(checkJsonObjNull(customer, "optIn2"));
			session.setAttribute("userDetails", userDetails);
							
			String Url = UserRestURIConstants.GET_FNA;
			final Map<String,String> header = headerUtil.getHeader(servletRequest);
			JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET, Url, header, null);
			if (responseJsonObj.get("result") != null){
				JSONObject jobject = (JSONObject)responseJsonObj.get("result");
				if(jobject.get("name")!=null&&jobject.get("gender")!=null){
					session.setAttribute("fnaLastUpdate", jobject.get("last_update")!=null?DateApi.formatTime1(Long.valueOf(jobject.get("last_update").toString())):"");
				}
			}			
			MemberActionResult result = new MemberActionResult();	
			result.setFullName(userDetails.getFullName());
			result.setUserName(userLogin.getUserName());
			return result;
		} else {
			MemberActionResult result = new MemberActionResult();	
			result.setMessage(washGIMessage(apiResponse.get("errMsgs").toString()));
			return result;
		}	
	}
	
	public static String GetUserName(HttpServletRequest request) {
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
	
	@ApiOperation(
			value = "This API is used to get CRS status by HKID",
			response = CrsStatus.class
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 200, message = "Able to proceed"),
			@ApiResponse(code = 400, message = "Unable to proceed due to CRS"),
			@ApiResponse(code = 500, message = "System error")
			})

    @RequestMapping(value = "/crs", method = POST)
	public ResponseEntity<CrsStatusResponse> getCrs(
			@ApiParam(value = "Parameter for client crs input", required = true) @RequestBody CrsStatus crsStatus,            
			HttpServletRequest request) {
		
		// super.IsAuthenticate(request);		
		// ******************* Valid input *******************
		
		// ******************* Init *******************
		JSONObject responseJsonObj = new JSONObject();
		try {		
			// ******************* Form URL *******************
			
			String url = UserRestURIConstants.CRS_STATUS;
			String jsonString = new ObjectMapper().writeValueAsString(crsStatus);			
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.POST, url, headerUtil.getHeader(request), jsonInput);
			
			// ******************* Makeup result *******************
			CrsStatusResponse c = new CrsStatusResponse();
			c.setProceed((boolean)responseJsonObj.get("proceed"));
			
			return Responses.ok(c);
			
		} catch (Exception e) {
			e.printStackTrace();
			return Responses.ok(null);		
		}
		
	}	
	
	//For registration revamp
	@SuppressWarnings("unchecked")
	@ApiOperation(
			value = "Register Customer User",
			response = RegistrationResponse.class
			)
	@ApiResponses(value = {
			@ApiResponse(code = 500, message = "System error"),
			@ApiResponse(code = 400, message = "Invalid Input")
			})
	@RequestMapping(value = "/register/member/customer",method=POST)
	public ResponseEntity<RegistrationResponse> registerCustomerUser(
			@ApiParam(value = "User Name,Mobile,Password,Email,Dec No,Policy No,Dob,Opt Out1,Opt Out2", required = true) @RequestBody RegistrationRequest req,
			HttpServletRequest request) {
		String methodName="registerCustomerUser";
		logger.debug(methodName+" getUserName:"+req.getUserName());
		
		
		JSONObject responseJsonObj = new JSONObject();		
		ResponseEntity<RegistrationResponse> responseEntity =Responses.error(null);
		try {			
			// ******************* Form URL *******************
			String url = UserRestURIConstants.REGISTRATION_REVAMP_REGISTER_USER;
			
			String jsonString = new ObjectMapper().writeValueAsString(req);			
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
			logger.debug(methodName+" jsonInput:"+jsonInput.toString());
			
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.PUT, url, headerUtil.getHeader(request), jsonInput);
			
			// ******************* Makeup result *******************			
			responseEntity=getResponseEntityByJsonObj(methodName,RegistrationResponse.class,responseJsonObj);
			
		} catch (Exception e) {
			logger.info(methodName+" System error:",e);
			return responseEntity;
		}
		
		return responseEntity;
	}
	
	
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
			Map<String,String> header = Maps.newHashMap();
			header=headerUtil.getHeader(request);
			header.remove("username");
			responseJsonObj = restService.consumeApi(HttpMethod.POST, url, header, jsonInput);
			
			// ******************* Makeup result *******************			
			responseEntity=getResponseEntityByJsonObj(methodName,ForgetUsernameResponse.class,responseJsonObj);
			
		} catch (Exception e) {
			logger.error(methodName+" System error:",e);
			return responseEntity;
		}
		return responseEntity;
	}

	@SuppressWarnings("unchecked")
	@ApiOperation(
			value = "Forgot Customer Password",
			response = ForgotPasswordResponse.class
			)
	@ApiResponses(value = {
			@ApiResponse(code = 500, message = "System error"),
			@ApiResponse(code = 400, message = "Invalid Input")
			})
	@RequestMapping(value = "/forgotPassword/customer", method =POST)
	public ResponseEntity<ForgotPasswordResponse> forgetCustomerPassword(
			@ApiParam(value = "User Name,Doc No,Dob", required = true) @RequestBody  ForgotPasswordRequest req,
			HttpServletRequest request) {

		String methodName="forgotCustomerPassword";
		logger.debug(methodName+" getUserName:"+req.getUserName());
		
		
		JSONObject responseJsonObj = new JSONObject();		
		ResponseEntity<ForgotPasswordResponse> responseEntity =Responses.error(null);
		try {			
			// ******************* Form URL *******************
			String url = UserRestURIConstants.REGISTRATION_REVAMP_FORGET_PASSWORD;
			
			String jsonString = new ObjectMapper().writeValueAsString(req);			
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
			logger.debug(methodName+" jsonInput:"+jsonInput.toString());
			
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.POST, url, headerUtil.getHeader(request), jsonInput);
			if(responseJsonObj.get("errMsgs")==null){
				responseJsonObj.put("resp", true);
				responseJsonObj.put("message", "");
			}else{
				responseJsonObj.put("resp", false);
				responseJsonObj.put("message", "");
			}
			// ******************* Makeup result *******************			
			responseEntity=getResponseEntityByJsonObj(methodName,ForgotPasswordResponse.class,responseJsonObj);
			
		} catch (Exception e) {
			logger.info(methodName+" System error:",e);
			return responseEntity;
		}
		
		return responseEntity;
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
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
					resultCode="504";
					break;
				case " The information you have entered is not valid, please try again":
					resultCode="504";
					break;
				case " 閣下所輸入的資料並不正確，請重新輸入 ":
					resultCode="504";
					break;
				default:
					resultCode="504";
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

