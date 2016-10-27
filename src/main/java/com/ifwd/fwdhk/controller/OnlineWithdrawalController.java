package com.ifwd.fwdhk.controller;

import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import springfox.documentation.annotations.ApiIgnore;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ifwd.fwdhk.controller.core.Responses;
import com.ifwd.fwdhk.model.motor.CarDetail;
import com.ifwd.fwdhk.model.motor.QuoteMotorCare;
import com.ifwd.fwdhk.model.tngsavie.TngAuthOtpRequest;
import com.ifwd.fwdhk.model.tngsavie.TngAuthOtpResponse;
import com.ifwd.fwdhk.model.tngsavie.TngLinkupSaveRequest;
import com.ifwd.fwdhk.model.tngsavie.TngOtpSmsReqResponse;
import com.ifwd.fwdhk.model.tngsavie.TngPolicyHistoryRequest;
import com.ifwd.fwdhk.model.tngsavie.TngPolicyHistoryResponse;
import com.ifwd.fwdhk.model.tngsavie.TngPolicyInfo;
import com.ifwd.fwdhk.model.tngsavie.TngPolicyInfoResponse;
import com.ifwd.fwdhk.model.tngsavie.TngPolicyListRequest;
import com.ifwd.fwdhk.model.tngsavie.TngPolicySimple;
import com.ifwd.fwdhk.model.tngsavie.TngPolicyWithdrawPerformResponse;
import com.ifwd.fwdhk.model.tngsavie.TngPolicyWithdrawRequest;
import com.ifwd.fwdhk.model.tngsavie.TngUnlinkRequest;
import com.ifwd.fwdhk.util.HeaderUtil;
import com.ifwd.fwdhk.util.MessageCodeUtil;


@Controller
@RequestMapping(value = "/api/withdrawal", produces = {APPLICATION_JSON_VALUE} )
@Api(value = "/withdrawal", description = "Operations about Tap n Go Savie Online Withdrawal")
public class OnlineWithdrawalController extends BaseController{
	private final static Logger logger = LoggerFactory.getLogger(OnlineWithdrawalController.class);
	
	@Autowired
	private HeaderUtil headerUtil;
	
	@ApiOperation(
			value = "Get Policy info List by Customer",
			response = TngPolicyInfoResponse.class,
			notes ="Warning Code:"
					+ "<br/>TPW001 Warning Tap n Go expired"
                    + "<br/>TPW002 Warning Annual withdrawal limit"
                    + "<br/>TPW003 Warning Daily withdrawal limit "
                    + "<br/>TPW004 Warning Daily withdrawal count limit"
			)
	@ApiResponses(value = {
			@ApiResponse(code = 500, message = "System error"),
			@ApiResponse(code = 400, message = "Invalid Input")
			})
	@RequestMapping(value = "/getPolicyInfoList", method = POST)
	public ResponseEntity<TngPolicyInfoResponse> getPolicyInfoList(
			@ApiParam(value = "Customer Id", required = true) @RequestBody TngPolicyListRequest tplReq,
			HttpServletRequest request) {
		String methodName="getPolicyInfoList";
		logger.debug(methodName+" getCustomerId:"+tplReq.getCustomerId());
		
		
		JSONObject responseJsonObj = new JSONObject();		
		TngPolicyInfoResponse policyInfoResp = new TngPolicyInfoResponse();
		ResponseEntity responseEntity =Responses.error(null);
		try {			
			// ******************* Form URL *******************
			String url = UserRestURIConstants.ONLINE_WITHDRAWAL_POLICY_BY_CUST;
			
			String jsonString = new ObjectMapper().writeValueAsString(tplReq);			
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
			logger.debug(methodName+" jsonInput:"+jsonInput.toString());
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.POST, url, headerUtil.getHeader(request), jsonInput);
			// ******************* Makeup result *******************			
			//testing code 
			/*responseJsonObj.put("errMsgs", null);
			responseJsonObj.put("mobile", "85455875");
			responseJsonObj.put("policy", null);*/
			//testing code
			
			responseEntity=getResponseEntityByJsonObj(methodName,policyInfoResp.getClass(),responseJsonObj);
			
			//policyInfoResp=mappingWithoutErrMsg(methodName, policyInfoResp.getClass(), responseJsonObj);
				
			
		} catch (Exception e) {
			logger.info(methodName+" System error:",e);
			return responseEntity;
		}
		
		return responseEntity;
	}

	@SuppressWarnings({ "rawtypes", "unchecked", "null" })
	private <T> ResponseEntity getResponseEntityByJsonObj(String methodName,
			Class<T> responseClass,
			JSONObject responseJsonObj) throws JsonParseException, JsonMappingException, IOException {
		//MessageCodeUtil messageUtil=new MessageCodeUtil();
		T responseObject=null;
		JSONObject errMsg=(JSONObject) responseJsonObj.get("msg");
		//if(responseJsonObj.get("msg") == null){
		if(errMsg.get("resultCode").equals("0")){
				responseJsonObj.remove("msg");
				if( responseJsonObj.toString().length() > 0) {
					ObjectMapper mapper = new ObjectMapper();
					responseObject= (T) mapper.readValue(responseJsonObj.toString(), responseClass);
					//logger.debug(methodName+" "+class1.getClass().getName()+" apiResponse:"+class1.toString());
					logger.debug(methodName+" "+responseClass.getName()+" apiResponse: "+responseClass.toString()+" "+responseObject.toString());
				} else {
					logger.info(methodName+" "+responseClass.getName()+" "+"not found");
					return Responses.error(null);
				}
				
		}else{
			logger.info(methodName+" System error:" + responseJsonObj.get("msg").toString());
			new ResponseEntity<T>((T)null, HttpStatus.valueOf(Integer.parseInt((String)errMsg.get("resultCode"))));
		}
		return Responses.ok(responseObject);
	}

/*	@SuppressWarnings("unchecked")
	private <T> T mappingWithoutErrMsg(String methodName,
			Class<T> responseType, JSONObject responseJsonObj)
			throws IOException, JsonParseException, JsonMappingException {
		if(responseJsonObj.get("errMsgs") == null) {
		if(responseJsonObj!= null && responseJsonObj.toString().length() > 0) {
			ObjectMapper mapper = new ObjectMapper();
			responseJsonObj.remove("errMsgs");
			return (T) mapper.readValue(responseJsonObj.toString(), TngPolicyInfoResponse.class);
			//logger.debug(methodName+" "+class1.getClass().getName()+" apiResponse:"+class1.toString());
		} else {
			logger.info(methodName+" "+responseType.getName()+" "+"not found");
			return null;
		}
		}else{
			return null;
		}
		
		
	}*/
	
	@ApiOperation(
			value = "Get Policy info By Policy",
			response = TngPolicyInfoResponse.class,
			notes ="Warning Code:"
					+ "<br/>TPW001 Warning Tap n Go expired"
                    + "<br/>TPW002 Warning Annual withdrawal limit"
                    + "<br/>TPW003 Warning Daily withdrawal limit "
                    + "<br/>TPW004 Warning Daily withdrawal count limit"
			)
	@ApiResponses(value = {
			@ApiResponse(code = 500, message = "System error"),
			@ApiResponse(code = 400, message = "Invalid Input")
			})
	@RequestMapping(value = "/getPolicyInfo", method = POST)
	public ResponseEntity<TngPolicyInfoResponse> getPolicyInfo(
			@ApiParam(value = "Policy Id", required = true) @RequestBody TngPolicySimple simple,
			HttpServletRequest request) {
		String methodName="getPolicyInfo";
		
		logger.debug(methodName+" getPolicyId:"+simple.getPolicyId());
		
		JSONObject responseJsonObj = new JSONObject();		
		TngPolicyInfoResponse policyInfoResp = new TngPolicyInfoResponse();
		try {			
			// ******************* Form URL *******************
			String url = UserRestURIConstants.ONLINE_WITHDRAWAL_POLICY_BY_POLICY;
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.POST, url, headerUtil.getHeader(request), null);
			// ******************* Makeup result *******************			
			if (responseJsonObj.get("errMsgs") == null) {
				//TODO convert responseJsonObj to policyInfoResp
				
			} else {
				logger.info(methodName+" System error:" + responseJsonObj.get("errMsgs").toString());
				return Responses.error(null);	
			}
		} catch (Exception e) {
			logger.info(methodName+" System error:",e);
			return Responses.error(null);
		}
		
		
		return Responses.ok(policyInfoResp);
	}
	
	@ApiOperation(
			value = "Send SMS for One Time Password(OTP)",
			response = TngOtpSmsReqResponse.class
			)
	@ApiResponses(value = {
			@ApiResponse(code = 500, message = "System error"),
			@ApiResponse(code = 400, message = "Invalid Input"),
			@ApiResponse(code = 455, message = "Invalid Policy"),
			@ApiResponse(code = 456, message = "Linkup function has been temporarily suspended"),
			@ApiResponse(code = 457, message = "Invalid customer mobile number for receive OTP via SMS"),
			@ApiResponse(code = 458, message = "Exceed the number of re-send OTP")
			})
	@RequestMapping(value = "/sendTngOtpSms", method = POST)
	public ResponseEntity<TngOtpSmsReqResponse> sendTngOtpSms(
			@ApiParam(value = "Policy Id", required = true) @RequestBody TngPolicySimple simple,
			HttpServletRequest request) {
		
		
		TngOtpSmsReqResponse result = new TngOtpSmsReqResponse();
		return Responses.ok(result);
	}

	@ApiOperation(
			value = "Authenticate One Time Password(OTP)",
			response = TngAuthOtpResponse.class
			)
	@ApiResponses(value = {
			@ApiResponse(code = 500, message = "System error"),
			@ApiResponse(code = 400, message = "Invalid Input"),
			@ApiResponse(code = 455, message = "Invalid Policy"),
			@ApiResponse(code = 456, message = "Linkup function has been temporarily suspended"),
			@ApiResponse(code = 457, message = "OTP not match"),
			@ApiResponse(code = 458, message = "OTP expired"),
			@ApiResponse(code = 459, message = "OTP is already authentic")
			})
	@RequestMapping(value = "/authTngOtp", method = POST)
	public ResponseEntity<TngAuthOtpResponse> authTngOtp(
			@ApiParam(value = "Policy Id, OTP", required = true) @RequestBody TngAuthOtpRequest authOtpReq,
			HttpServletRequest request) {
		
		//get session from header
		//after auth, BE will return the encrypted payload, extra, sign for tng form post  
		
		TngAuthOtpResponse result = new TngAuthOtpResponse();
		return Responses.ok(result);
	}

	@ApiOperation(
			value = "Save linkup info to backend",
			response = TngPolicySimple.class
			)
	@ApiResponses(value = {
			@ApiResponse(code = 500, message = "System error"),
			@ApiResponse(code = 400, message = "Invalid Input")
			})
	@RequestMapping(value = "/saveTngLinkupInfo", method = POST)
	public ResponseEntity<TngPolicySimple> saveTngLinkupInfo(
			@ApiParam(value = "Policy ID, TNG Account ID, Token", required = true) @RequestBody TngLinkupSaveRequest saveRequest,
			HttpServletRequest request) {
		
		TngPolicySimple result = new TngPolicySimple();
		return Responses.ok(result);
	}
	
	@ApiOperation(
			value = "Request Tap n Go Policy withdrawal",
			response = TngOtpSmsReqResponse.class
			)
	@ApiResponses(value = {
			@ApiResponse(code = 500, message = "System error"),
			@ApiResponse(code = 400, message = "Invalid Input"),
			@ApiResponse(code = 455, message = "Invalid Policy"),
			@ApiResponse(code = 456, message = "Linkup function has been temporarily suspended"),
			@ApiResponse(code = 457, message = "Invalid customer mobile number for receive OTP via SMS"),
			@ApiResponse(code = 458, message = "Exceed the number of re-send OTP"),
			@ApiResponse(code = 459, message = "Invalid Withdrawal")
			})
	@RequestMapping(value = "/requestTngPolicyWithdraw", method = POST)
	public ResponseEntity<TngOtpSmsReqResponse> requestTngPolicyWithdraw(
			@ApiParam(value = "Policy Id, Withdraw Amount", required = true) @RequestBody TngPolicyWithdrawRequest withdrawReq,
			HttpServletRequest request) {

		TngOtpSmsReqResponse result = new TngOtpSmsReqResponse();
		return Responses.ok(result);
	}

	@ApiOperation(
			value = "Perform Tap n Go Policy withdrawal",
			response = TngPolicyWithdrawPerformResponse.class
			)
	@ApiResponses(value = {
			@ApiResponse(code = 500, message = "System error"),
			@ApiResponse(code = 400, message = "Invalid Input"),
			@ApiResponse(code = 455, message = "Invalid Policy"),
			@ApiResponse(code = 456, message = "Linkup function has been temporarily suspended"),
			@ApiResponse(code = 457, message = "OTP not match"),
			@ApiResponse(code = 458, message = "OTP expired"),
			@ApiResponse(code = 459, message = "OTP is already authentic"),
			@ApiResponse(code = 460, message = "Tap n Go side cannot perform withdraw")
			})
	@RequestMapping(value = "/performTngPolicyWithdraw", method = POST)
	public ResponseEntity<TngPolicyWithdrawPerformResponse> performTngPolicyWithdraw(
			@ApiParam(value = "Policy Id, Withdraw Amount, OTP", required = true) @RequestBody TngPolicyWithdrawRequest withdrawReq,
			HttpServletRequest request) {

		TngPolicyWithdrawPerformResponse result = new TngPolicyWithdrawPerformResponse();
		return Responses.ok(result);
	}
	
	@ApiOperation(
			value = "Unlink Tap n Go from Policy",
			response = TngPolicySimple.class
			)
	@ApiResponses(value = {
			@ApiResponse(code = 500, message = "System error"),
			@ApiResponse(code = 400, message = "Invalid Input")
			})
	@RequestMapping(value = "/unlinkTngPolicy", method = POST)
	public ResponseEntity<TngPolicySimple> unlinkTngPolicy(
			@ApiParam(value = "Policy Id, Tap n Go Acount Id", required = true) @RequestBody TngUnlinkRequest unlinkReq,
			HttpServletRequest request) {

		TngPolicySimple result = new TngPolicySimple();
		return Responses.ok(result);
	}
	
	@ApiOperation(
			value = "Get Tap n Go Policy History",
			response = TngPolicyHistoryResponse.class
			)
	@ApiResponses(value = {
			@ApiResponse(code = 500, message = "System error"),
			@ApiResponse(code = 400, message = "Invalid Input")
			})
	@RequestMapping(value = "/getTngPolicyHistory", method = POST)
	public ResponseEntity<TngPolicyHistoryResponse> getTngPolicyHistory(
			@ApiParam(value = "Policy Id, Start Date, End Date", required = true) @RequestBody TngPolicyHistoryRequest historyReq,
			HttpServletRequest request) {

		TngPolicyHistoryResponse result = new TngPolicyHistoryResponse();
		return Responses.ok(result);
	}
	
	@ApiIgnore
	@RequestMapping(value = "/getVersion", method = GET)
	public ResponseEntity<String> getVersion(
			@RequestParam String more,
			HttpServletRequest request)throws Exception {
		super.IsAuthenticate(request);
		String filepath=
//				"/META-INF/MANIFEST.MF";
				"/META-INF/maven/com.ifwd.fwdhk/fwdhk/pom.properties";
		BufferedReader br = new BufferedReader(new InputStreamReader(request.getSession().getServletContext().getResourceAsStream(filepath)));
		String line = null;
		StringBuffer sb = new StringBuffer();
		while ((line = br.readLine()) != null) {
			sb.append(line).append("\n");
		}
		
		if("true".equals(more)){
			RuntimeMXBean runtimeBean = ManagementFactory.getRuntimeMXBean();
			long startTime = runtimeBean.getStartTime();
			Date startDate = new Date(startTime);
			sb.append("startDate="+(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(startDate));
			sb.append("\n");
			sb.append("inputArg="+runtimeBean.getInputArguments());
			sb.append("\n");
			sb.append("upTime="+runtimeBean.getUptime());
			sb.append("\n");
		}

		return Responses.ok(sb.toString());
	}
}
