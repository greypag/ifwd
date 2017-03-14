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
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
import com.ifwd.fwdhk.model.tngsavie.WarnMsg;
import com.ifwd.fwdhk.util.HeaderUtil;


@Controller
@RequestMapping(value = "/api/withdrawal", produces = {APPLICATION_JSON_VALUE} )
@Api(value = "/withdrawal", description = "Operations about Tap & Go Savie Online Withdrawal")
public class OnlineWithdrawalController extends BaseController{
	private final static Logger logger = LoggerFactory.getLogger(OnlineWithdrawalController.class);
	
	//400 500 is blocked by company firewall, need replaced by other status code
	private final static int WITHDRAWAL_STATUS_CODE_SYSTEM_ERROR=510;
	private final static int WITHDRAWAL_STATUS_CODE_INVALID_INPUT=431;
	
	@Autowired
	private HeaderUtil headerUtil;
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private ResponseEntity getDefaultErrorResonseEntity(){
		return new ResponseEntity(null, HttpStatus.valueOf(WITHDRAWAL_STATUS_CODE_SYSTEM_ERROR));
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private ResponseEntity getDefaultInvalidResonseEntity(){
		return new ResponseEntity(null, HttpStatus.valueOf(WITHDRAWAL_STATUS_CODE_INVALID_INPUT));
	}
	
	
	
	@SuppressWarnings("unchecked")
	@ApiOperation(
			value = "Get Policy info List by Customer",
			response = TngPolicyInfoResponse.class,
			notes ="Warning Code:"
					+ "<br/>TPW001 Warning Tap & Go expired"
                    + "<br/>TPW002 Warning Annual withdrawal limit"
                    + "<br/>TPW003 Warning Daily withdrawal limit "
                    + "<br/>TPW004 Warning Daily withdrawal count limit"
			)
	@ApiResponses(value = {
			@ApiResponse(code = WITHDRAWAL_STATUS_CODE_SYSTEM_ERROR, message = "System error"),
			@ApiResponse(code = WITHDRAWAL_STATUS_CODE_INVALID_INPUT, message = "Invalid Input")
			})
	@RequestMapping(value = "/getPolicyInfoList", method = POST)
	public ResponseEntity<TngPolicyInfoResponse> getPolicyInfoList(
			@ApiParam(value = "Customer Id", required = true) @RequestBody TngPolicyListRequest tplReq,
			HttpServletRequest request) {
		super.IsAuthenticate(request);
		String methodName="getPolicyInfoList";
		logger.debug(methodName+" getCustomerId:"+tplReq.getCustomerId());
		
		if(tplReq.getCustomerId()==null){return this.getDefaultInvalidResonseEntity();}
		if(!this.isCustomerIdMatch(request, tplReq.getCustomerId())){return this.getDefaultInvalidResonseEntity();}
		
		JSONObject responseJsonObj = new JSONObject();		
		ResponseEntity<TngPolicyInfoResponse> responseEntity = this.getDefaultErrorResonseEntity();
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
			if(HttpStatus.OK.equals(responseEntity.getStatusCode())){
				List<String> pNumList = new ArrayList<String>();
				TngPolicyInfoResponse policyinfoList=  responseEntity.getBody();
				if(policyinfoList!=null){
					List<TngPolicyInfo> pis = policyinfoList.getPolicies();
					if(pis!=null){
						for(TngPolicyInfo pi:pis){
							if(pi==null)continue;
							String status = TngPolicyConstants.getTngPolicyStatusCode(pi.getTngStatus_en());
							pi.setTngPolicyStatus(status);
							
							pNumList.add(pi.getPolicyId());
						}}
				}
				
				if(!pNumList.isEmpty()){
					HttpSession session = request.getSession(true);
					session.setAttribute("tmpPNumList", pNumList);
				}
				
			}	
			
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

		logger.info(methodName+" response :" + ((responseJsonObj==null)?null:responseJsonObj.toString()));
		
		if (responseJsonObj==null||responseJsonObj.get("errMsgs")!=null){
			return this.getDefaultErrorResonseEntity();
		}
		T responseObject=null;
		JSONObject errMsg=null;
		if(responseJsonObj.get("msg") instanceof JSONArray){
			errMsg=(JSONObject) ((JSONArray) responseJsonObj.get("msg")).get(0);
		}else{
		errMsg=(JSONObject) responseJsonObj.get("msg");
		}
		//if(responseJsonObj.get("msg") == null){
		if(errMsg!=null&& (errMsg.get("resultCode").equals("0") || errMsg.get("resultCode").equals("10") || errMsg.get("resultCode").equals("11"))){
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
								if(item.get("warnMsg")!=null && ((JSONArray) item.get("warnMsg")).size()>0){
								msgObject=(JSONObject)((JSONArray) item.get("warnMsg")).get(0);
								  if(msgObject.get("refCode")!=null){
									String refCode = (String) msgObject.get("refCode");
									String mapCode = TngPolicyConstants.getTngPolicyWarnCode(refCode);
									if(mapCode!=null){
										msgObject.put("code",mapCode);
									}else{
										msgObject.put("code",refCode);
									}
								  }
								  
								  msgObject.remove("resultCode");
								  msgObject.remove("refCode");
								}
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
								String refCode = (String) msgObject.get("refCode");
								String mapCode = TngPolicyConstants.getTngPolicyWarnCode(refCode);
								if(mapCode!=null){
									msgObject.put("code",mapCode);
								}else{
									msgObject.put("code",refCode);
								}
							  }
							  msgObject.remove("resultCode");
							  msgObject.remove("refCode");
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
				String resultCodeTmp=new String((String) errMsg.get("resultCode"));
				String resultCode = ""+WITHDRAWAL_STATUS_CODE_SYSTEM_ERROR;
				switch (resultCodeTmp) {
				case "900":
					resultCode=""+WITHDRAWAL_STATUS_CODE_INVALID_INPUT;
					break;
				case "901":
					resultCode=""+WITHDRAWAL_STATUS_CODE_INVALID_INPUT;
					break;
				case "902":
					resultCode="411";
					break;
				case "903":
					resultCode="415";
					break;
				case "904":
					resultCode="413";
					break;
				case "905":
					resultCode="412";
					break;
				case "906":
					resultCode="416";
					break;
				case "907":
					resultCode=""+WITHDRAWAL_STATUS_CODE_SYSTEM_ERROR;
					break;
				case "908":
					resultCode="417";
					break;
				case "999":
					resultCode=""+WITHDRAWAL_STATUS_CODE_SYSTEM_ERROR;
					break;
				default:
					break;
				}
				String refCode = (String) errMsg.get("refCode");
				if(refCode!=null){
					String resultRefCode="";
					if(refCode.startsWith("RWE")){
						resultRefCode = TngPolicyConstants.getTngWithdrawalValidationErrorCode(refCode);
					}else if(refCode.startsWith("RWC")){
						resultRefCode = TngPolicyConstants.TNG_WITHDRWAL_VALIDATION_ERROR_CODE_000;
					}else{
						resultRefCode=refCode;
					}
					
					WarnMsg errmsg = new WarnMsg();
					errmsg.setCode(resultRefCode);
					if(!(""+WITHDRAWAL_STATUS_CODE_INVALID_INPUT).equals(resultCode) && !(""+WITHDRAWAL_STATUS_CODE_SYSTEM_ERROR).equals(resultCode)){
						errmsg.setMessage_en((String)errMsg.get("message_en"));
						errmsg.setMessage_zh((String)errMsg.get("message_zh"));
					}
					
					return new ResponseEntity<T>((T)errmsg, HttpStatus.valueOf(Integer.parseInt(resultCode)));
				}else{
					if(!(""+WITHDRAWAL_STATUS_CODE_INVALID_INPUT).equals(resultCode) && !(""+WITHDRAWAL_STATUS_CODE_SYSTEM_ERROR).equals(resultCode)){
						WarnMsg errmsg = new WarnMsg();
						errmsg.setMessage_en((String)errMsg.get("message_en"));
						errmsg.setMessage_zh((String)errMsg.get("message_zh"));
						return new ResponseEntity<T>((T)errmsg, HttpStatus.valueOf(Integer.parseInt(resultCode)));
					}
				}
				
				return new ResponseEntity<T>((T)null, HttpStatus.valueOf(Integer.parseInt(resultCode)));
			} catch (Exception e) {
				logger.error(methodName+" System error:",e);
				return this.getDefaultErrorResonseEntity();
			}
		}
		return Responses.ok(responseObject);
	}

	
	@SuppressWarnings("unchecked")
	@ApiOperation(
			value = "Get Policy info By Policy",
			response = TngPolicyInfoByPolicyResponse.class,
			notes ="Warning Code:"
					+ "<br/>TPW001 Warning Tap & Go expired"
					+ "<br/>TPW002 Warning Annual withdrawal limit"
					+ "<br/>TPW003 Warning Daily withdrawal limit "
					+ "<br/>TPW004 Warning Daily withdrawal count limit"
			)
	@ApiResponses(value = {
			@ApiResponse(code = WITHDRAWAL_STATUS_CODE_SYSTEM_ERROR, message = "System error"),
			@ApiResponse(code = WITHDRAWAL_STATUS_CODE_INVALID_INPUT, message = "Invalid Input")
			})
	@RequestMapping(value = "/getPolicyInfo", method = POST)
	public ResponseEntity<TngPolicyInfoByPolicyResponse> getPolicyInfo(
			@ApiParam(value = "Policy Id", required = true) @RequestBody TngPolicySimple simple,
			HttpServletRequest request) {
		super.IsAuthenticate(request);
		String methodName="getPolicyInfo";
		
		logger.debug(methodName+" getPolicyId:"+simple.getPolicyId());
		
		if(simple.getPolicyId()==null){return this.getDefaultInvalidResonseEntity();}
		if(!this.isPolicyNumberMatch(request, simple.getPolicyId())){return this.getDefaultInvalidResonseEntity();}
		
		JSONObject responseJsonObj = new JSONObject();		
		ResponseEntity<TngPolicyInfoByPolicyResponse> responseEntity = this.getDefaultErrorResonseEntity();
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
			if(policy!=null){
			JSONArray msgArr=(JSONArray) policy.get("msg");
			JSONArray warnMsg=new JSONArray();
			JSONObject msgEle= new JSONObject();
			for (int i = 0; i<msgArr.size(); i++){
				String refCode = (String) ((JSONObject) msgArr.get(i)).get("refCode");
				if (refCode!=null && !refCode.equals("")) {
					String mapCode = TngPolicyConstants.getTngPolicyWarnCode(refCode);
					if(mapCode!=null){
						msgEle.put("code", mapCode);
						warnMsg.add(msgEle);
					}else{
						msgEle.put("code", refCode);
						warnMsg.add(msgEle);
					}
				}
			}
			
			policy.remove("msg");
			policy.put("warnMsg", warnMsg);
			beanJsonObj.put("policy", policy);
			}
			
			// ******************* Makeup result *******************
			responseEntity=getResponseEntityByJsonObj(methodName,TngPolicyInfoByPolicyResponse.class,beanJsonObj);
						
			if(HttpStatus.OK.equals(responseEntity.getStatusCode())){
				TngPolicyInfoByPolicyResponse policyinfoList=  responseEntity.getBody();
				if(policyinfoList!=null){
					TngPolicyInfo pi = policyinfoList.getPolicy();
					if(pi!=null){
						String status = TngPolicyConstants.getTngPolicyStatusCode(pi.getTngStatus_en());
						pi.setTngPolicyStatus(status);
					}
				}
			}

		} catch (Exception e) {
			logger.info(methodName+" System error:",e);
			return responseEntity;
		}
		return responseEntity;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@ApiOperation(
			value = "Send SMS for One Time Password(OTP)",
			response = TngOtpSmsReqResponse.class
			)
	@ApiResponses(value = {
			@ApiResponse(code = WITHDRAWAL_STATUS_CODE_SYSTEM_ERROR, message = "System error"),
			@ApiResponse(code = WITHDRAWAL_STATUS_CODE_INVALID_INPUT, message = "Invalid Input"),
			@ApiResponse(code = 411, message = "Invalid Policy"),
			@ApiResponse(code = 412, message = "Function has been temporarily suspended"),
			@ApiResponse(code = 413, message = "OTP related error messages"),
			@ApiResponse(code = 416, message = "SMS gateway send message failed")
			})
	@RequestMapping(value = "/sendTngOtpSms", method = POST)
	public ResponseEntity<TngOtpSmsReqResponse> sendTngOtpSms(
			@ApiParam(value = "Policy Id", required = true) @RequestBody TngPolicySimple simple,
			HttpServletRequest request) {
		super.IsAuthenticate(request);
		
		String methodName="sendTngOtpSms";
		logger.debug(methodName+" getPolicyId:"+simple.getPolicyId());
		
		if(!this.isPolicyNumberMatch(request, simple.getPolicyId())){return this.getDefaultInvalidResonseEntity();}
		
		JSONObject responseJsonObj = new JSONObject();		
		ResponseEntity responseEntity = this.getDefaultErrorResonseEntity();
		try {			
			// ******************* Form URL *******************
			String url = UserRestURIConstants.ONLINE_WITHDRAWAL_SEND_TNG_OTP;
			
			String jsonString = new ObjectMapper().writeValueAsString(simple);			
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
			putLangToJson(request, jsonInput);
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

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@ApiOperation(
			value = "Authenticate One Time Password(OTP)",
			response = TngAuthOtpResponse.class
			)
	@ApiResponses(value = {
			@ApiResponse(code = WITHDRAWAL_STATUS_CODE_SYSTEM_ERROR, message = "System error"),
			@ApiResponse(code = WITHDRAWAL_STATUS_CODE_INVALID_INPUT, message = "Invalid Input"),
			@ApiResponse(code = 411, message = "Invalid Policy"),
			@ApiResponse(code = 412, message = "Function has been temporarily suspended"),
			@ApiResponse(code = 413, message = "OTP related error messages")
			})
	@RequestMapping(value = "/authTngOtp", method = POST)
	public ResponseEntity<TngAuthOtpResponse> authTngOtp(
			@ApiParam(value = "Policy Id, OTP", required = true) @RequestBody TngAuthOtpRequest authOtpReq,
			HttpServletRequest request) {
		super.IsAuthenticate(request);
		
		String methodName="authTngOtp";
		logger.debug(methodName+" getPolicyId:"+authOtpReq.getPolicyId());
		
		if(!this.isPolicyNumberMatch(request, authOtpReq.getPolicyId())){return this.getDefaultInvalidResonseEntity();}
		
		JSONObject responseJsonObj = new JSONObject();		
		ResponseEntity responseEntity = this.getDefaultErrorResonseEntity();
		try {			
			// ******************* Form URL *******************
			String url = UserRestURIConstants.ONLINE_WITHDRAWAL_AUTH_TNG_OTP;
			
			String jsonString = new ObjectMapper().writeValueAsString(authOtpReq);			
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
			putLangToJson(request, jsonInput);
			putiFwdPathToJson(request, jsonInput);
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

	@SuppressWarnings("unchecked")
	private void putLangToJson(HttpServletRequest request, JSONObject jsonInput) {
		HttpSession session = request.getSession(false);
		String language = (String)session.getAttribute("language");
		if(jsonInput.get("lang")==null){
			if("en".equalsIgnoreCase(language)){
				jsonInput.put("lang", "en");
			}else{
				jsonInput.put("lang", "zh");
			}
		}
	}
	
	@SuppressWarnings("unchecked")
	private void putiFwdPathToJson(HttpServletRequest request, JSONObject jsonInput) {
		String iFwdPath = UserRestURIConstants.IFWD_PATH;
		if(!StringUtils.isBlank(iFwdPath)){
			jsonInput.put("ifwdpath", iFwdPath);
		}
	}

	@SuppressWarnings("rawtypes")
	private String reqParamMapToString(Map map){
		if(map==null)return null;
		try {
			return new ObjectMapper().writeValueAsString(map);	
		} catch (Exception e) { }
		return null;
	}
	
	private boolean isCustomerIdMatch(HttpServletRequest request, String requestCustomerId){
		HttpSession session = request.getSession(false);
		String customerId = (String)session.getAttribute("customerId");
		if(customerId==null){return false;}
		
		boolean result = false;
		if(requestCustomerId!=null){
			result = customerId.equalsIgnoreCase(requestCustomerId);
		}
		if(!result){
			logger.debug("CustomerId Not Match");
		}
		return result;
	}
	@SuppressWarnings("unchecked")
	private boolean isPolicyNumberMatch(HttpServletRequest request, String requestPolicyNumber){
		HttpSession session = request.getSession(false);
		List<String> pNumList = (List<String>)session.getAttribute("tmpPNumList");
		if(pNumList==null || pNumList.isEmpty()){return false;}
		boolean result = pNumList.contains(requestPolicyNumber);
		if(!result){
			logger.debug("PolicyNumber Not Match");
		}
		return result;
	}
	
	
	@ApiIgnore
	@RequestMapping(value = { "/linkupReturn" } , method = POST)
	public ModelAndView linkupReturnPage(HttpServletRequest request, Model model) throws Exception {
		String methodName="linkupReturnPage";
		
		logger.info(methodName+" request params:" + reqParamMapToString(request.getParameterMap()));

		String lang = UserRestURIConstants.getLanaguage(request);
		
		boolean resultSuccess=false;
		String refCode=null;
		JSONObject responseJsonObj = new JSONObject();
		String policyId =null;
		try {
			TngLinkupSaveRequest saveRequest= new TngLinkupSaveRequest();
			saveRequest.setMerTradeNo(request.getParameter("merTradeNo"));
			saveRequest.setRecurrentToken(request.getParameter("recurrentToken"));
			saveRequest.setMsg(request.getParameter("msg"));
			saveRequest.setResultCode(request.getParameter("resultCode"));
			saveRequest.setExtras(request.getParameter("extras"));
			saveRequest.setSign(request.getParameter("sign"));
			
			// ******************* Form URL *******************
			String url = UserRestURIConstants.ONLINE_WITHDRAWAL_SAVE_LINKUP;

			String jsonString = new ObjectMapper().writeValueAsString(saveRequest);
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
			logger.debug(methodName+" jsonInput:"+jsonInput.toString());
			// ******************* Consume Service *******************
			responseJsonObj = restService.consumeApi(HttpMethod.POST, url, headerUtil.getHeader(request), jsonInput);
			// ******************* Makeup result *******************

			JSONObject msgObj = (JSONObject)responseJsonObj.get("msg");
			String resultCode= (String)msgObj.get("resultCode");
			refCode= (String)msgObj.get("refCode");
			if("0".equals(resultCode) || "11".equals(resultCode)){
				resultSuccess=true;
			}
			
			if(responseJsonObj!=null){
				policyId = (String)responseJsonObj.get("policyId");	
			}
		} catch (Exception e) {
			logger.info(methodName+" System error:",e);
			refCode="";
		}
		
		// ******************* Makeup result *******************
		String successUrl="/account?statusFlag=true";
		String failUrl="/account?statusFlag=false";
		
		String redirect ="";
		if("tc".equals(lang)){
			if(resultSuccess){
				redirect = "redirect:/tc"+successUrl + (StringUtils.isEmpty(policyId)?"":("&p="+policyId));
			}else{
				redirect = "redirect:/tc"+failUrl + (StringUtils.isEmpty(refCode)?"":("&refCode="+refCode));
			}
		}else{
			if(resultSuccess){
				redirect = "redirect:/en"+successUrl + (StringUtils.isEmpty(policyId)?"":("&p="+policyId));
			}else{
				redirect = "redirect:/en"+failUrl + (StringUtils.isEmpty(refCode)?"":("&refCode="+refCode));
			}
		}
		return new ModelAndView(redirect);
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes"})
	@ApiOperation(
			value = "Request Tap & Go Policy withdrawal",
			response = TngOtpSmsReqResponse.class
			)
	@ApiResponses(value = {
			@ApiResponse(code = WITHDRAWAL_STATUS_CODE_SYSTEM_ERROR, message = "System error"),
			@ApiResponse(code = WITHDRAWAL_STATUS_CODE_INVALID_INPUT, message = "Invalid Input"),
			@ApiResponse(code = 411, message = "Invalid Policy"),
			@ApiResponse(code = 412, message = "Function has been temporarily suspended"),
			@ApiResponse(code = 413, message = "OTP related error messages"),
			@ApiResponse(code = 415, message = "Invalid Withdrawal"
					+ "<br/>TWE000 Withdrawal validation fail"
                    + "<br/>TWE001 Withdrawal amount minimum"
                    + "<br/>TWE002 Annual withdrawal limit exceeded"
                    + "<br/>TWE003 Daily withdrawal limit exceeded"
                    + "<br/>TWE004 Daily withdrawal count limit exceeded"
                    + "<br/>TWE005 The principal of the policy will be less than the minimum requirement"),
            @ApiResponse(code = 416, message = "SMS gateway send message failed")
			})
	@RequestMapping(value = "/requestTngPolicyWithdraw", method = POST)
	public ResponseEntity<TngOtpSmsReqResponse> requestTngPolicyWithdraw(
			@ApiParam(value = "Policy Id, Withdraw Amount", required = true) @RequestBody TngPolicyWithdrawRequest withdrawReq,
			HttpServletRequest request) {
		super.IsAuthenticate(request);

		String methodName="requestTngPolicyWithdraw";
		logger.debug(methodName+" getPolicyId:"+withdrawReq.getPolicyId());
		
		if(!this.isPolicyNumberMatch(request, withdrawReq.getPolicyId())){return this.getDefaultInvalidResonseEntity();}
		
		JSONObject responseJsonObj = new JSONObject();
		ResponseEntity responseEntity = this.getDefaultErrorResonseEntity();
		try {			
			// ******************* Form URL *******************
			String url = UserRestURIConstants.ONLINE_WITHDRAWAL_REQUEST_WITHDRAWAL;
			
			String jsonString = new ObjectMapper().writeValueAsString(withdrawReq);			
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
			putLangToJson(request, jsonInput);
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

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@ApiOperation(
			value = "Perform Tap & Go Policy withdrawal",
			response = TngPolicyWithdrawPerformResponse.class
			)
	@ApiResponses(value = {
			@ApiResponse(code = WITHDRAWAL_STATUS_CODE_SYSTEM_ERROR, message = "System error"),
			@ApiResponse(code = WITHDRAWAL_STATUS_CODE_INVALID_INPUT, message = "Invalid Input"),
			@ApiResponse(code = 411, message = "Invalid Policy"),
			@ApiResponse(code = 412, message = "Function has been temporarily suspended"),
			@ApiResponse(code = 413, message = "OTP related error messages"),
			@ApiResponse(code = 417, message = "Tap & Go Related error messages")
			})
	@RequestMapping(value = "/performTngPolicyWithdraw", method = POST)
	public ResponseEntity<TngPolicyWithdrawPerformResponse> performTngPolicyWithdraw(
			@ApiParam(value = "Policy Id, Withdraw Amount, OTP", required = true) @RequestBody TngPolicyWithdrawRequest withdrawReq,
			HttpServletRequest request) {
		super.IsAuthenticate(request);

		String methodName="performTngPolicyWithdraw";
		logger.debug(methodName+" getPolicyId:"+withdrawReq.getPolicyId());
		
		if(!this.isPolicyNumberMatch(request, withdrawReq.getPolicyId())){return this.getDefaultInvalidResonseEntity();}
		
		JSONObject responseJsonObj = new JSONObject();
		ResponseEntity responseEntity = this.getDefaultErrorResonseEntity();
		try {			
			// ******************* Form URL *******************
			String url = UserRestURIConstants.ONLINE_WITHDRAWAL_PERFORM_WITHDRAWAL;
			
			String jsonString = new ObjectMapper().writeValueAsString(withdrawReq);			
			JSONObject jsonInput = (JSONObject) new JSONParser().parse(jsonString);
			putLangToJson(request, jsonInput);
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
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@ApiOperation(
			value = "Unlink Tap & Go from Policy",
			response = TngPolicySimple.class
			)
	@ApiResponses(value = {
			@ApiResponse(code = WITHDRAWAL_STATUS_CODE_SYSTEM_ERROR, message = "System error"),
			@ApiResponse(code = WITHDRAWAL_STATUS_CODE_INVALID_INPUT, message = "Invalid Input"),
			@ApiResponse(code = 417, message = "Tap & Go Related error messages")
			})
	@RequestMapping(value = "/unlinkTngPolicy", method = POST)
	public ResponseEntity<TngPolicySimple> unlinkTngPolicy(
			@ApiParam(value = "Policy Id, Tap & Go Acount Id", required = true) @RequestBody TngUnlinkRequest unlinkReq,
			HttpServletRequest request) {
		super.IsAuthenticate(request);

		String methodName="unlinkTngPolicy";
		logger.debug(methodName+" getPolicyId:"+unlinkReq.getPolicyId());
		
		if(!this.isPolicyNumberMatch(request, unlinkReq.getPolicyId())){return this.getDefaultInvalidResonseEntity();}
		
		JSONObject responseJsonObj = new JSONObject();		
		ResponseEntity responseEntity = this.getDefaultErrorResonseEntity();
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
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@ApiOperation(
			value = "Get Tap & Go Policy History",
			response = TngPolicyHistoryResponse.class
			)
	@ApiResponses(value = {
			@ApiResponse(code = WITHDRAWAL_STATUS_CODE_SYSTEM_ERROR, message = "System error"),
			@ApiResponse(code = WITHDRAWAL_STATUS_CODE_INVALID_INPUT, message = "Invalid Input")
			})
	@RequestMapping(value = "/getTngPolicyHistory", method = POST)
	public ResponseEntity<TngPolicyHistoryResponse> getTngPolicyHistory(
			@ApiParam(value = "Policy Id, Start Date, End Date", required = true) @RequestBody TngPolicyHistoryRequest historyReq,
			HttpServletRequest request) {
		super.IsAuthenticate(request);

		String methodName="getTngPolicyHistory";
		logger.debug(methodName+" getPolicyId:"+historyReq.getPolicyId());
		
		if(!this.isPolicyNumberMatch(request, historyReq.getPolicyId())){return this.getDefaultInvalidResonseEntity();}
		
		JSONObject responseJsonObj = new JSONObject();
		ResponseEntity responseEntity = this.getDefaultErrorResonseEntity();
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
	
	@ApiIgnore
	@RequestMapping(value = "/getStatusCode", method = GET)
	public ResponseEntity<String> getStatusCode(HttpServletRequest request){
		//test status code allow by firewall
		try {
			String statusCodeStr = request.getParameter("statusCode");
			if(statusCodeStr!=null){
				int statusCode = Integer.parseInt(statusCodeStr);
				return new ResponseEntity<String>(statusCodeStr, HttpStatus.valueOf(statusCode));
			}
		} catch (Exception e) {
			logger.warn("getStatusCode error", e);
			return Responses.error("ERROR");
		}
		return Responses.ok("OK");
	}
}
