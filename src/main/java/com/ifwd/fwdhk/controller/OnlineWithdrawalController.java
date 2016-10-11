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
import java.io.InputStreamReader;
import java.lang.management.ManagementFactory;
import java.lang.management.RuntimeMXBean;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import springfox.documentation.annotations.ApiIgnore;

import com.ifwd.fwdhk.controller.core.Responses;
import com.ifwd.fwdhk.model.tngsavie.TngAuthOtpRequest;
import com.ifwd.fwdhk.model.tngsavie.TngAuthOtpResponse;
import com.ifwd.fwdhk.model.tngsavie.TngPolicyHistoryRequest;
import com.ifwd.fwdhk.model.tngsavie.TngLinkupSaveRequest;
import com.ifwd.fwdhk.model.tngsavie.TngOtpSmsReqResponse;
import com.ifwd.fwdhk.model.tngsavie.TngPolicyHistory;
import com.ifwd.fwdhk.model.tngsavie.TngPolicyInfo;
import com.ifwd.fwdhk.model.tngsavie.TngPolicyListRequest;
import com.ifwd.fwdhk.model.tngsavie.TngPolicySimple;
import com.ifwd.fwdhk.model.tngsavie.TngPolicyWithdrawPerformResponse;
import com.ifwd.fwdhk.model.tngsavie.TngPolicyWithdrawRequest;


@Controller
@RequestMapping(value = "/api/withdrawal", produces = {APPLICATION_JSON_VALUE} )
@Api(value = "/withdrawal", description = "Operations about Tap n Go Savie Online Withdrawal")
public class OnlineWithdrawalController extends BaseController{
	private final static Logger logger = LoggerFactory.getLogger(OnlineWithdrawalController.class);
	
	@ApiOperation(
			value = "Get Policy info List",
			response = TngPolicyInfo.class,
			responseContainer = "List",
			notes ="Warning include following cases:"
					+ "<br/>GPW002 Warning Annual withdrawal limit"
					+ "<br/>GPW003 Warning Daily withdrawal limit "
					+ "<br/>GPW004 Warning Daily withdrawal count limit"
			)
	@ApiResponses(value = {
			@ApiResponse(code = 500, message = "System error"),
			@ApiResponse(code = 400, message = "Invalid Input")
			})
	@RequestMapping(value = "/getPolicyInfoList", method = POST)
	public ResponseEntity<List<TngPolicyInfo>> getPolicyInfoList(
			@ApiParam(value = "Customer Id", required = true) @RequestBody TngPolicyListRequest tplReq,
			HttpServletRequest request) {
		
		logger.debug("getCustomerId:"+tplReq.getCustomerId());
		
		TngPolicyInfo policyInfo = new TngPolicyInfo();
		List<TngPolicyInfo> resultList = new ArrayList<TngPolicyInfo>();
		resultList.add(policyInfo);
		return Responses.ok(resultList);
	}
	
	@ApiOperation(
			value = "Send SMS for One Time Password(OTP)",
			response = TngOtpSmsReqResponse.class
			)
	@ApiResponses(value = {
			@ApiResponse(code = 500, message = "System error"),
			@ApiResponse(code = 400, message = "Invalid Input"),
			@ApiResponse(code = 461, message = "Tap & Go Linkup function is locked"),
			@ApiResponse(code = 462, message = "Topup withdrawal function is locked"),
			@ApiResponse(code = 463, message = "Invalid policy ID"),
			@ApiResponse(code = 464, message = "Invalid customer mobile number for receive OTP via SMS"),
			@ApiResponse(code = 465, message = "Exceed the number of re-send OTP"),
			@ApiResponse(code = 491, message = "SMS gateway send message failed"),
			@ApiResponse(code = 499, message = "System error")
			})
	@RequestMapping(value = "/sendTngOtpSms", method = POST)
	public ResponseEntity<TngOtpSmsReqResponse> sendTngOtpSms(
			@ApiParam(value = "Policy Id", required = true) @RequestBody TngPolicySimple simple,
			HttpServletRequest request) {
		
		//get session from header, same session only 1 otp at same time, otp will expire
		
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
			@ApiResponse(code = 461, message = "Tap & Go Linkup function is locked"),
			@ApiResponse(code = 462, message = "Topup withdrawal function is locked"),
			@ApiResponse(code = 463, message = "Invalid policy ID"),
			@ApiResponse(code = 466, message = "The session and OTP are not match"),
			@ApiResponse(code = 467, message = "OTP expired"),
			@ApiResponse(code = 468, message = "The OTP is already authentic"),
			@ApiResponse(code = 499, message = "System error")
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
			@ApiResponse(code = 400, message = "Invalid Input"),
			@ApiResponse(code = 461, message = "Tap & Go Linkup function is locked"),
			@ApiResponse(code = 463, message = "Invalid policy ID"),
			@ApiResponse(code = 469, message = "Fail to save Tap & Go Linkup information"),
			@ApiResponse(code = 499, message = "System error")
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
			response = TngOtpSmsReqResponse.class,
			notes ="470 include following cases: "
					+ "<br/>Fail due to OTP not match "
					+ "<br/>Fail due to Min per transaction"
					+ "<br/>Fail due to Max per day"
					+ "<br/>Fail due to Max per year"
					+ "<br/>Fail due to User does not meet withdrawal criteria "
			)
	@ApiResponses(value = {
			@ApiResponse(code = 500, message = "System error"),
			@ApiResponse(code = 400, message = "Invalid Input"),
			@ApiResponse(code = 462, message = "Topup withdrawal function is locked"),
			@ApiResponse(code = 463, message = "Invalid policy ID"),
			@ApiResponse(code = 464, message = "Invalid customer mobile number for receive OTP via SMS"),
			@ApiResponse(code = 470, message = "Withdrawal validation fail with error message"),
			@ApiResponse(code = 491, message = "SMS gateway send message failed"),
			@ApiResponse(code = 499, message = "System error")
			})
	@RequestMapping(value = "/requestTngPolicyWithdraw", method = POST)
	public ResponseEntity<TngOtpSmsReqResponse> requestTngPolicyWithdraw(
			@ApiParam(value = "Policy Id, Withdraw Amount", required = true) @RequestBody TngPolicyWithdrawRequest withdrawReq,
			HttpServletRequest request) {

		TngOtpSmsReqResponse result = new TngOtpSmsReqResponse();
		return Responses.ok(result);
	}

	/**
	 * 490 include following cases:
	 * PWF001 Cannot connect to Tap n Go API
	 * PWF002 Unable to complete transaction, please contact CS
	 * PWF003 Duplicate Tap n Go transaction ID exists
	 */
	@ApiOperation(
			value = "Perform Tap n Go Policy withdrawal",
			response = TngPolicyWithdrawPerformResponse.class
			)
	@ApiResponses(value = {
			@ApiResponse(code = 500, message = "System error"),
			@ApiResponse(code = 400, message = "Invalid Input"),
			@ApiResponse(code = 462, message = "Topup withdrawal function is locked"),
			@ApiResponse(code = 463, message = "Invalid policy ID"),
			@ApiResponse(code = 466, message = "The session and OTP are not match"),
			@ApiResponse(code = 467, message = "OTP expired"),
			@ApiResponse(code = 468, message = "The OTP is already authentic"),
			@ApiResponse(code = 490, message = "Perform withdrawal failed (Ref: PWExxx)"),
			@ApiResponse(code = 499, message = "System error")
			})
	@RequestMapping(value = "/performTngPolicyWithdraw", method = POST)
	public ResponseEntity<TngPolicyWithdrawPerformResponse> performTngPolicyWithdraw(
			@ApiParam(value = "Policy Id, Withdraw Amount, OTP", required = true) @RequestBody TngPolicyWithdrawRequest withdrawReq,
			HttpServletRequest request) {

		TngPolicyWithdrawPerformResponse result = new TngPolicyWithdrawPerformResponse();
		return Responses.ok(result);
	}
	
	@ApiOperation(
			hidden=true, //not yet have detail
			value = "Unlink Tap n Go from Policy",
			response = TngPolicySimple.class
			)
	@ApiResponses(value = {
			@ApiResponse(code = 500, message = "System error"),
			@ApiResponse(code = 400, message = "Invalid Input")
			})
	@RequestMapping(value = "/unlinkTngPolicy", method = POST)
	public ResponseEntity<TngPolicySimple> unlinkTngPolicy(
			@ApiParam(value = "Policy Id", required = true) @RequestBody TngPolicySimple simple,
			HttpServletRequest request) {

		TngPolicySimple result = new TngPolicySimple();
		return Responses.ok(result);
	}
	
	@ApiOperation(
			value = "Get Tap n Go Policy History",
			response = TngPolicyHistory.class,
			responseContainer = "List"
			)
	@ApiResponses(value = {
			@ApiResponse(code = 500, message = "System error"),
			@ApiResponse(code = 400, message = "Invalid Input")
			})
	@RequestMapping(value = "/getTngPolicyHistory", method = POST)
	public ResponseEntity<List<TngPolicyHistory>> getTngPolicyHistory(
			@ApiParam(value = "Policy Id", required = true) @RequestBody TngPolicyHistoryRequest simple,
			HttpServletRequest request) {

		TngPolicyHistory result = new TngPolicyHistory();
		List<TngPolicyHistory> resultList = new ArrayList<TngPolicyHistory>();
		resultList.add(result);
		return Responses.ok(resultList);
	}
	
	@ApiIgnore
	@RequestMapping(value = "/getVersion", method = GET)
	public ResponseEntity<String> getCarSupplementDetailsByMakeAndModel(
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
