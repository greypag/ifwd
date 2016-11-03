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
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
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

import springfox.documentation.annotations.ApiIgnore;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ifwd.fwdhk.controller.core.Responses;
import com.ifwd.fwdhk.model.tngsavie.TngAuthOtpRequest;
import com.ifwd.fwdhk.model.tngsavie.TngAuthOtpResponse;
import com.ifwd.fwdhk.model.tngsavie.TngLinkupSaveRequest;
import com.ifwd.fwdhk.model.tngsavie.TngOtpSmsReqResponse;
import com.ifwd.fwdhk.model.tngsavie.TngPolicyConstants;
import com.ifwd.fwdhk.model.tngsavie.TngPolicyHistoryRequest;
import com.ifwd.fwdhk.model.tngsavie.TngPolicyHistoryResponse;
import com.ifwd.fwdhk.model.tngsavie.TngPolicyInfo;
import com.ifwd.fwdhk.model.tngsavie.TngPolicyInfoByPolicyResponse;
import com.ifwd.fwdhk.model.tngsavie.TngPolicyInfoResponse;
import com.ifwd.fwdhk.model.tngsavie.TngPolicyListRequest;
import com.ifwd.fwdhk.model.tngsavie.TngPolicySimple;
import com.ifwd.fwdhk.model.tngsavie.TngPolicyWithdrawPerformResponse;
import com.ifwd.fwdhk.model.tngsavie.TngPolicyWithdrawRequest;
import com.ifwd.fwdhk.model.tngsavie.TngUnlinkRequest;
import com.ifwd.fwdhk.util.HeaderUtil;


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
		super.IsAuthenticate(request);
		String methodName="getPolicyInfoList";
		logger.debug(methodName+" getCustomerId:"+tplReq.getCustomerId());
		
		
		JSONObject responseJsonObj = new JSONObject();		
		ResponseEntity<TngPolicyInfoResponse> responseEntity =Responses.error(null);
		try {			
			// ******************* Form URL *******************
			String url = UserRestURIConstants.ONLINE_WITHDRAWAL_POLICY_BY_CUST;
			
			String jsonString = new ObjectMapper().writeValueAsString(tplReq);			
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
			logger.debug(methodName+" jsonInput:"+jsonInput.toString());
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.POST, url, headerUtil.getHeader(request), jsonInput);
			// ******************* Makeup result *******************			
	
			responseEntity=getResponseEntityByJsonObj(methodName,TngPolicyInfoResponse.class,responseJsonObj);
			TngPolicyInfoResponse policyinfoList=  responseEntity.getBody();
			List<TngPolicyInfo> pis = policyinfoList.getPolicies();
			if(pis!=null){
			for(TngPolicyInfo pi:pis){
				if(pi==null)continue;
				String status = TngPolicyConstants.getTngPolicyStatusCode(pi.getTngStatus_en());
				pi.setTngPolicyStatus(status);
			}}
			//policyInfoResp=mappingWithoutErrMsg(methodName, policyInfoResp.class, responseJsonObj);
				
			
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
		if (responseJsonObj==null||responseJsonObj.get("errMsgs")!=null&&!((String)((JSONArray)responseJsonObj.get("errMsgs")).get(0)).contains("TWE")){
			return Responses.error(null);
		}
		logger.info(methodName+" response :" + responseJsonObj.toString());
		T responseObject=null;
		JSONObject errMsg=null;
		if(responseJsonObj.get("msg") instanceof JSONArray){
			errMsg=(JSONObject) ((JSONArray) responseJsonObj.get("msg")).get(0);
		}else{
		errMsg=(JSONObject) responseJsonObj.get("msg");
		}
		//if(responseJsonObj.get("msg") == null){
		if(errMsg!=null&&errMsg.get("resultCode").equals("0")){
			//remove msg of response and replace msg of responseobj as warnMsg 
				responseJsonObj.remove("msg");
				Set keySet=responseJsonObj.entrySet();
				JSONObject item=new JSONObject();
				Iterator<HashMap> it = keySet.iterator();  
				while (it.hasNext()) {  
					Map.Entry<String,JSONObject> entry = (Map.Entry<String,JSONObject>)it.next();
					String key = entry.getKey();
					if(responseJsonObj.get(key) instanceof JSONArray ){
						JSONArray array=(JSONArray)responseJsonObj.get(key);
						JSONObject msgObject=null;
						for (int i = 0;i<array.size();i++){  
			                item=(JSONObject)array.get(i);
			                if(item.containsKey("msg")){
			                	  item.put("warnMsg",item.get("msg"));
								  item.remove("msg");
								msgObject=(JSONObject)((JSONArray) item.get("warnMsg")).get(0);
								  if(msgObject.get("refCode")!=null){
									if(msgObject.get("refCode").equals("GPW001")){
										msgObject.put("code","TPW001");
									}else if(msgObject.get("refCode").equals("GPW002")){
										msgObject.put("code","TPW002");
									}else if(msgObject.get("refCode").equals("GPW003")){
										msgObject.put("code","TPW003");
									}else{
									  msgObject.put("code",new String((String) msgObject.get("refCode")));
									}
								  }else{
									  msgObject.put("code",new String((String) msgObject.get("resultCode")));
								  }
								  msgObject.remove("resultCode");
								  msgObject.remove("message_en");
								  msgObject.remove("refCode");
								  msgObject.remove("message_zh");
								}
			            }  
					}
					if(responseJsonObj.get(key) instanceof JSONObject ){
						JSONObject obj=(JSONObject) responseJsonObj.get(key);
						JSONObject msgObject=null;
						if(obj.containsKey("msg")){
							obj.put("warnMsg", obj.get("msg"));
							obj.remove("msg");
							msgObject=(JSONObject)obj.get("warnMsg");
							if(msgObject.get("refCode")!=null){
								if(msgObject.get("refCode").equals("GPW001")){
									msgObject.put("code","TPW001");
								}else if(msgObject.get("refCode").equals("GPW002")){
									msgObject.put("code","TPW002");
								}else if(msgObject.get("refCode").equals("GPW003")){
									msgObject.put("code","TPW003");
								}else{
								  msgObject.put("code",new String((String) msgObject.get("refCode")));
								}
							  }else{
								  msgObject.put("code",new String((String) msgObject.get("resultCode")));
							  }
							  msgObject.remove("resultCode");
							  msgObject.remove("message_en");
							  msgObject.remove("refCode");
							  msgObject.remove("message_zh");
						}
					}
				}
			//mapping
				if( responseJsonObj.toString().length() > 0) {
					ObjectMapper mapper = new ObjectMapper();
					responseObject= (T) mapper.readValue(responseJsonObj.toString(), responseClass);
					//logger.debug(methodName+" "+class1.class.getName()+" apiResponse:"+class1.toString());
					logger.debug(methodName+" "+responseClass.getName()+" apiResponse: "+responseClass.toString()+" "+responseObject.toString());
				} else {
					logger.info(methodName+" "+responseClass.getName()+" "+"not found");
					return Responses.notFound(null);
				}
				
		}else{
			
			try {
				logger.info(methodName+" System error:" + responseJsonObj.get("msg").toString());
				String resultCode=new String((String) errMsg.get("resultCode"));
				switch (resultCode) {
				case "461":
					resultCode="412";
					break;
				case "462":
					resultCode="400";
					break;
				case "463":
					resultCode="411";
					break;
				case "464":
					resultCode="400";
					break;
				case "465":
					resultCode="413";
					break;
				case "466":
					resultCode="414";
					break;
				case "467":
					resultCode="413";
					break;
				case "468":
					resultCode="414";
					break;
				case "469":
					resultCode="415";
					break;
				case "470":
					resultCode="500";
					break;
				case "471":
					resultCode="415";
					break;
				case "472":
					resultCode="500";
					break;
				case "476":
					resultCode="400";
					break;
				case "478":  //for /withdrawal/unlinkTngPolicy API
					resultCode="500";
					break;
				case "2":
					resultCode="200";
					break;
					
				default:
					break;
				}
				return new ResponseEntity<T>((T)null, HttpStatus.valueOf(Integer.parseInt(resultCode)));
			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return Responses.error(null);
			}
		}
		return Responses.ok(responseObject);
	}

	
	@SuppressWarnings("unchecked")
	@ApiOperation(
			value = "Get Policy info By Policy",
			response = TngPolicyInfoByPolicyResponse.class,
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
	public ResponseEntity<TngPolicyInfoByPolicyResponse> getPolicyInfo(
			@ApiParam(value = "Policy Id", required = true) @RequestBody TngPolicySimple simple,
			HttpServletRequest request) {
		super.IsAuthenticate(request);
		String methodName="getPolicyInfo";
		
		logger.debug(methodName+" getPolicyId:"+simple.getPolicyId());
		
		JSONObject responseJsonObj = new JSONObject();		
		ResponseEntity<TngPolicyInfoByPolicyResponse> responseEntity =Responses.error(null);
		try {			
			// ******************* Form URL *******************
			String url = UserRestURIConstants.ONLINE_WITHDRAWAL_POLICY_BY_POLICY;
			// ******************* Consume Service *******************
			String jsonString = new ObjectMapper().writeValueAsString(simple);			
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
			logger.debug(methodName+" jsonInput:"+jsonInput.toString());
			
			responseJsonObj = restService.consumeApi(HttpMethod.POST, url, headerUtil.getHeader(request), jsonInput);
		
			
			JSONObject beanJsonObj = new JSONObject();
			beanJsonObj.put("msg", (JSONObject) responseJsonObj.get("msg"));
			beanJsonObj.put("mobile", (String) responseJsonObj.get("mobile"));
			beanJsonObj.put("customerId", (String) responseJsonObj.get("customerId"));
			
			JSONObject policy=(JSONObject) responseJsonObj.get("policy");
			JSONArray msgArr=(JSONArray) policy.get("msg");
			JSONArray warnMsg=new JSONArray();
			JSONObject msgEle= new JSONObject();
			for (int i = 0; i<msgArr.size(); i++){
				String refCode = (String) ((JSONObject) msgArr.get(i)).get("refCode");
				String mapCode = null;
				if (refCode!=null && !refCode.equals("")) {
					switch(refCode){
					case "GPW001":
						mapCode="TPW001";
						break;
					case "GPW002":
						mapCode="TPW002";
						break;
					case "GPW003":
						mapCode="TPW003";
						break;
					case "GPW004":
						mapCode="TPW004";
						break;
					default:
						mapCode=refCode;
						break; 
					}
					msgEle.put("code", mapCode);
					warnMsg.add(msgEle);	
				} else{
					msgEle.put("code", (String) ((JSONObject) msgArr.get(i)).get("resultCode"));
					warnMsg.add(msgEle);
				}
			}
			
			policy.remove("msg");
			policy.put("warnMsg", warnMsg);
			beanJsonObj.put("policy", policy);
			
			// ******************* Makeup result *******************
			responseEntity=getResponseEntityByJsonObj(methodName,TngPolicyInfoByPolicyResponse.class,beanJsonObj);
						
			TngPolicyInfoByPolicyResponse policyinfoList=  responseEntity.getBody();
			TngPolicyInfo pi = policyinfoList.getPolicy();
			if(pi!=null){
				String status = TngPolicyConstants.getTngPolicyStatusCode(pi.getTngStatus_en());
				pi.setTngPolicyStatus(status);
			}

		} catch (Exception e) {
			logger.info(methodName+" System error:",e);
			return responseEntity;
		}
		return responseEntity;
	}
	
	@ApiOperation(
			value = "Send SMS for One Time Password(OTP)",
			response = TngOtpSmsReqResponse.class
			)
	@ApiResponses(value = {
			@ApiResponse(code = 500, message = "System error"),
			@ApiResponse(code = 400, message = "Invalid Input"),
			@ApiResponse(code = 411, message = "Invalid Policy"),
			@ApiResponse(code = 412, message = "Function has been temporarily suspended"),
			@ApiResponse(code = 413, message = "Invalid customer mobile number for receive OTP via SMS"),
			@ApiResponse(code = 414, message = "Exceed the number of re-send OTP")
			})
	@RequestMapping(value = "/sendTngOtpSms", method = POST)
	public ResponseEntity<TngOtpSmsReqResponse> sendTngOtpSms(
			@ApiParam(value = "Policy Id", required = true) @RequestBody TngPolicySimple simple,
			HttpServletRequest request) {
		super.IsAuthenticate(request);
		
		String methodName="sendTngOtpSms";
		logger.debug(methodName+" getPolicyId:"+simple.getPolicyId());
		
		
		JSONObject responseJsonObj = new JSONObject();		
		ResponseEntity responseEntity =Responses.error(null);
		try {			
			// ******************* Form URL *******************
			String url = UserRestURIConstants.ONLINE_WITHDRAWAL_SEND_TNG_OTP;
			
			String jsonString = new ObjectMapper().writeValueAsString(simple);			
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
			logger.debug(methodName+" jsonInput:"+jsonInput.toString());
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.POST, url, headerUtil.getHeader(request), jsonInput);
			// ******************* Makeup result *******************			
			
			responseEntity=getResponseEntityByJsonObj(methodName,TngOtpSmsReqResponse.class,responseJsonObj);
				
			
		} catch (Exception e) {
			logger.info(methodName+" System error:",e);
			return responseEntity;
		}
		
		return responseEntity;
		
	}

	@SuppressWarnings("unchecked")
	@ApiOperation(
			value = "Authenticate One Time Password(OTP)",
			response = TngAuthOtpResponse.class
			)
	@ApiResponses(value = {
			@ApiResponse(code = 500, message = "System error"),
			@ApiResponse(code = 400, message = "Invalid Input"),
			@ApiResponse(code = 411, message = "Invalid Policy"),
			@ApiResponse(code = 412, message = "Function has been temporarily suspended"),
			@ApiResponse(code = 413, message = "OTP not match"),
			@ApiResponse(code = 414, message = "OTP expired"),
			@ApiResponse(code = 415, message = "OTP is already authentic")
			})
	@RequestMapping(value = "/authTngOtp", method = POST)
	public ResponseEntity<TngAuthOtpResponse> authTngOtp(
			@ApiParam(value = "Policy Id, OTP", required = true) @RequestBody TngAuthOtpRequest authOtpReq,
			HttpServletRequest request) {
		super.IsAuthenticate(request);
		
		String methodName="authTngOtp";
		logger.debug(methodName+" getPolicyId:"+authOtpReq.getPolicyId());
		
		
		JSONObject responseJsonObj = new JSONObject();		
		ResponseEntity responseEntity =Responses.error(null);
		try {			
			// ******************* Form URL *******************
			String url = UserRestURIConstants.ONLINE_WITHDRAWAL_AUTH_TNG_OTP;
			
			String jsonString = new ObjectMapper().writeValueAsString(authOtpReq);			
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
			logger.debug(methodName+" jsonInput:"+jsonInput.toString());
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.POST, url, headerUtil.getHeader(request), jsonInput);
			// ******************* Makeup result *******************			
			
			responseEntity=getResponseEntityByJsonObj(methodName,TngAuthOtpResponse.class,responseJsonObj);
				
			
		} catch (Exception e) {
			logger.info(methodName+" System error:",e);
			return responseEntity;
		}
		return responseEntity;
	}

	@ApiIgnore
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
		super.IsAuthenticate(request);
		
		String methodName="saveTngLinkupInfo";
		logger.debug(methodName+" getPolicyId:"+saveRequest.getPolicyId());
		
		
		JSONObject responseJsonObj = new JSONObject();		
		
		ResponseEntity responseEntity =Responses.error(null);
		try {			
			// ******************* Form URL *******************
			String url = UserRestURIConstants.ONLINE_WITHDRAWAL_SAVE_LINKUP;
			
			String jsonString = new ObjectMapper().writeValueAsString(saveRequest);			
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
			logger.debug(methodName+" jsonInput:"+jsonInput.toString());
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.POST, url, headerUtil.getHeader(request), jsonInput);
			// ******************* Makeup result *******************			
			responseJsonObj.remove("result");
			responseJsonObj.remove("tngExpiryDate");
			responseJsonObj.remove("sendEmailResult");
			responseEntity=getResponseEntityByJsonObj(methodName,TngPolicySimple.class,responseJsonObj);
				
			
		} catch (Exception e) {
			logger.info(methodName+" System error:",e);
			return responseEntity;
		}
		
		return responseEntity;
	}
	
	@SuppressWarnings("unchecked")
	@ApiOperation(
			value = "Request Tap n Go Policy withdrawal",
			response = TngOtpSmsReqResponse.class
			)
	@ApiResponses(value = {
			@ApiResponse(code = 500, message = "System error"),
			@ApiResponse(code = 400, message = "Invalid Input"),
			@ApiResponse(code = 411, message = "Invalid Policy"),
			@ApiResponse(code = 412, message = "Function has been temporarily suspended"),
			@ApiResponse(code = 413, message = "Invalid customer mobile number for receive OTP via SMS"),
			@ApiResponse(code = 414, message = "Exceed the number of re-send OTP"),
			@ApiResponse(code = 415, message = "Invalid Withdrawal"
					+ "<br/>TWE000 Withdrawal validation fail"
                    + "<br/>TWE001 Withdrawal amount minimum"
                    + "<br/>TWE002 Annual withdrawal limit exceeded"
                    + "<br/>TWE003 Daily withdrawal limit exceeded"
                    + "<br/>TWE004 Daily withdrawal count limit exceeded")
			})
	@RequestMapping(value = "/requestTngPolicyWithdraw", method = POST)
	public ResponseEntity<TngOtpSmsReqResponse> requestTngPolicyWithdraw(
			@ApiParam(value = "Policy Id, Withdraw Amount", required = true) @RequestBody TngPolicyWithdrawRequest withdrawReq,
			HttpServletRequest request) {
		super.IsAuthenticate(request);

		String methodName="requestTngPolicyWithdraw";
		logger.debug(methodName+" getPolicyId:"+withdrawReq.getPolicyId());
		
		
		JSONObject responseJsonObj = new JSONObject();		
		//TngOtpSmsReqResponse tngOtpSmsReqResp = new TngOtpSmsReqResponse();
		ResponseEntity responseEntity =Responses.error(null);
		try {			
			// ******************* Form URL *******************
			String url = UserRestURIConstants.ONLINE_WITHDRAWAL_REQUEST_WITHDRAWAL;
			
			String jsonString = new ObjectMapper().writeValueAsString(withdrawReq);			
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
			logger.debug(methodName+" jsonInput:"+jsonInput.toString());
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.POST, url, headerUtil.getHeader(request), jsonInput);
			// ******************* Makeup result *******************			

			JSONObject msgObj=(JSONObject) ((JSONArray)responseJsonObj.get("msg")).get(0);

			if (msgObj.get("resultCode").equals("471")){
				String refCode=(String) msgObj.get("refCode");
				JSONArray errMsgs=new JSONArray();
				switch (refCode) {
				case "RWE007":
					errMsgs.add("TWE001");
					break;
				case "RWE008":
					errMsgs.add("TWE002");
					break;
				case "RWE009":
					errMsgs.add("TWE003");
					break;
				case "RWE010":
					errMsgs.add("TWE004");
					break;
				default:
					errMsgs.add("TWE000");
					break;
				}
				responseJsonObj.put("errMsgs", errMsgs);
			}
			
			
			
			responseEntity=getResponseEntityByJsonObj(methodName,TngOtpSmsReqResponse.class,responseJsonObj);
				
			
		} catch (Exception e) {
			logger.info(methodName+" System error:",e);
			return responseEntity;
		}
		
		return responseEntity;
	}

	@ApiOperation(
			value = "Perform Tap n Go Policy withdrawal",
			response = TngPolicyWithdrawPerformResponse.class
			)
	@ApiResponses(value = {
			@ApiResponse(code = 500, message = "System error"),
			@ApiResponse(code = 400, message = "Invalid Input"),
			@ApiResponse(code = 411, message = "Invalid Policy"),
			@ApiResponse(code = 412, message = "Function has been temporarily suspended"),
			@ApiResponse(code = 413, message = "OTP not match"),
			@ApiResponse(code = 414, message = "OTP expired"),
			@ApiResponse(code = 415, message = "OTP is already authentic"),
			@ApiResponse(code = 416, message = "Tap n Go side cannot perform withdraw")
			})
	@RequestMapping(value = "/performTngPolicyWithdraw", method = POST)
	public ResponseEntity<TngPolicyWithdrawPerformResponse> performTngPolicyWithdraw(
			@ApiParam(value = "Policy Id, Withdraw Amount, OTP", required = true) @RequestBody TngPolicyWithdrawRequest withdrawReq,
			HttpServletRequest request) {
		super.IsAuthenticate(request);

		String methodName="performTngPolicyWithdraw";
		logger.debug(methodName+" getPolicyId:"+withdrawReq.getPolicyId());
		
		
		JSONObject responseJsonObj = new JSONObject();		
		TngPolicyWithdrawPerformResponse tngPolicyWithdrawPerformResp = new TngPolicyWithdrawPerformResponse();

		ResponseEntity responseEntity =Responses.error(null);
		try {			
			// ******************* Form URL *******************
			String url = UserRestURIConstants.ONLINE_WITHDRAWAL_PERFORM_WITHDRAWAL;
			
			String jsonString = new ObjectMapper().writeValueAsString(withdrawReq);			
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
			logger.debug(methodName+" jsonInput:"+jsonInput.toString());

			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.POST, url, headerUtil.getHeader(request), jsonInput);
			// ******************* Makeup result *******************			
			
			responseEntity=getResponseEntityByJsonObj(methodName,TngPolicyWithdrawPerformResponse.class,responseJsonObj);
				
			
		} catch (Exception e) {
			logger.info(methodName+" System error:",e);
			return responseEntity;
		}
		
		return responseEntity;
	}
	
	@SuppressWarnings("unchecked")
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
		super.IsAuthenticate(request);

		String methodName="unlinkTngPolicy";
		logger.debug(methodName+" getPolicyId:"+unlinkReq.getPolicyId());
		
		
		JSONObject responseJsonObj = new JSONObject();		
		ResponseEntity responseEntity =Responses.error(null);
		try {			
			// ******************* Form URL *******************
			String url = UserRestURIConstants.ONLINE_WITHDRAWAL_TNG_UNLINK_POLICY;
			
			String jsonString = new ObjectMapper().writeValueAsString(unlinkReq);			
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
			logger.debug(methodName+" jsonInput:"+jsonInput.toString());
			
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.POST, url, headerUtil.getHeader(request), jsonInput);
			// ******************* Makeup result *******************			
			
			responseEntity=getResponseEntityByJsonObj(methodName,TngPolicySimple.class,responseJsonObj);
			
		} catch (Exception e) {
			logger.info(methodName+" System error:",e);
			return responseEntity;
		}
		return responseEntity;
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
		super.IsAuthenticate(request);

		String methodName="getTngPolicyHistory";
		logger.debug(methodName+" getPolicyId:"+historyReq.getPolicyId());
		
		
		JSONObject responseJsonObj = new JSONObject();		
		//TngPolicyWithdrawPerformResponse tngPolicyWithdrawPerformResp = new TngPolicyWithdrawPerformResponse();
		ResponseEntity responseEntity =Responses.error(null);
		try {			
			// ******************* Form URL *******************
			String url = UserRestURIConstants.ONLINE_WITHDRAWAL_TNG_TRANS_HISTORY;
			
			String jsonString = new ObjectMapper().writeValueAsString(historyReq);			
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
			logger.debug(methodName+" jsonInput:"+jsonInput.toString());
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.POST, url, headerUtil.getHeader(request), jsonInput);
			// ******************* Makeup result *******************			
			
			responseEntity=getResponseEntityByJsonObj(methodName,TngPolicyHistoryResponse.class,responseJsonObj);
				
			
		} catch (Exception e) {
			logger.info(methodName+" System error:",e);
			return responseEntity;
		}

		
		return responseEntity;
	}
	
	@ApiIgnore
	@RequestMapping(value = "/getVersion", method = GET)
	public ResponseEntity<String> getVersion(
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
		String more = request.getParameter("more");
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
