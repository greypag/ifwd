package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;
import static org.apache.commons.lang3.StringUtils.startsWithIgnoreCase;
import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.exception.ExceptionUtils;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ifwd.fwdhk.controller.core.Responses;
import com.ifwd.fwdhk.model.Member;
import com.ifwd.fwdhk.model.MemberActionResult;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.model.UserLogin;
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
}
