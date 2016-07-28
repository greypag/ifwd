package com.ifwd.fwdhk.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.util.EncryptionUtils;

@Controller
public class PaymentController extends BaseController {	

	private final static String APP_ID = EncryptionUtils.APP_ID;
	
	public static String getTradeNo() {
		SimpleDateFormat simpleDateFormat;
		simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		Date date = new Date();
		String str = simpleDateFormat.format(date);
		Random random = new Random();
		int rannum = (int) (random.nextDouble() * (99999 - 10000 + 1)) + 10000;
		return str+rannum;
	}

	@RequestMapping(value = { "/paymentPage" })
	public ModelAndView paymentPage(HttpServletRequest request, Model model) throws Exception {

		String appId = APP_ID;
		String merTradeNo = getTradeNo();
		String paymentType = "S";
		String payload = "";
		String extras = "";
		String sign = "";	

	  


		net.sf.json.JSONObject payloadObject = new net.sf.json.JSONObject();
		payloadObject.put("totalPrice", "500.00");
		payloadObject.put("currency", "HKD");
		payloadObject.put("merTradeNo", merTradeNo);
		payloadObject.put("notifyUrl", "http://127.0.0.1:8090/fwdhk/paymentNotify");
		payloadObject.put("returnUrl", "http://127.0.0.1:8090/fwdhk/paymentReturn");
		payloadObject.put("remark", "Single Merchant, web-based");
		payloadObject.put("lang", "en");
		payload = payloadObject.toString();
		//System.out.println("payload:\n"+payload);
		payload = EncryptionUtils.encryptByRSA(payload);		
	
		
		

		net.sf.json.JSONObject extrasObject = new net.sf.json.JSONObject();
		extrasObject.put("name", "Jerry");
		extras = extrasObject.toString();
		//System.out.println("extras:\n"+extras);
		extras = EncryptionUtils.encryptByRSA(extras);		
		
		

		model.addAttribute("appId",appId );
		model.addAttribute("merTradeNo", merTradeNo);
		model.addAttribute("paymentType", paymentType);
		model.addAttribute("payload", payload);
		model.addAttribute("extras", extras);
		
		sign="appId="+appId;
		if(StringUtils.isNotEmpty(extras)) sign=sign+"&extras="+extras;
		if(StringUtils.isNotEmpty(merTradeNo)) sign=sign+"&merTradeNo="+merTradeNo;
		if(StringUtils.isNotEmpty(payload)) sign=sign+"&payload="+payload;
		if(StringUtils.isNotEmpty(paymentType)) sign=sign+"&paymentType="+paymentType;
		
	
		//System.out.println("sign: "+sign);
		
		sign=EncryptionUtils.encryptByHMACSHA512(sign);
		model.addAttribute("sign", sign);
		//System.out.println("Signature generated: "+EncryptionUtils.encryptByHMACSHA512("appId=1234567890&merTradeNo=9876543210&timestamp=140235441215746"));

		return new ModelAndView(UserRestURIConstants.getSitePath(request) + "payment/payment");

	}
	

	@RequestMapping(value = { "/paymentReturn" })
	public ModelAndView paymentReturnPage(HttpServletRequest request, Model model) throws Exception {
		
		String lang = UserRestURIConstants.getLanaguage(request);
		
		//String merTradeNo = request.getParameter("merTradeNo");
		//String msg = request.getParameter("msg");
		String resultCode = request.getParameter("resultCode");
		//String sign = request.getParameter("sign");
		
		/*model.addAttribute("merTradeNo", merTradeNo);
		model.addAttribute("ReturnMsg", msg);
		model.addAttribute("resultCode", resultCode);
		model.addAttribute("sign", sign);*/
		String redirect;
		if("tc".equals(lang)){
			if(StringUtils.isNoneBlank(resultCode) && "0".equals(resultCode)){
				redirect = "redirect:/tc/travel-insurance/confirmation?utm_nooverride=1";
				//redirect = "redirect:/tc/travel-insurance/travel-summary?paymentGatewayFlag=true";
			}else{
				redirect = "redirect:/tc/travel-insurance/travel-summary?paymentGatewayFlag=true";
				//redirect = "redirect:/tc/travel-insurance/confirmation?utm_nooverride=1";
			}
		}else{
			if(StringUtils.isNoneBlank(resultCode) && "0".equals(resultCode)){
				redirect = "redirect:/en/travel-insurance/confirmation?utm_nooverride=1";
			}else{
				redirect = "redirect:/en/travel-insurance/travel-summary?paymentGatewayFlag=true";
			}
		}
		return new ModelAndView(redirect);
		//return new ModelAndView(UserRestURIConstants.getSitePath(request) + "payment/payment-return");
	}
	
	
	@RequestMapping(value = { "/paymentNotify" })
	public void paymentNotify(HttpServletRequest request) throws Exception {
		String merTradeNo = request.getParameter("merTradeNo");
		String tradeNo = request.getParameter("tradeNo");
		String tradeStatus = request.getParameter("tradeStatus");
		String msg = request.getParameter("msg");
		String resultCode = request.getParameter("resultCode");
		String sign = request.getParameter("sign");
		
		System.out.println("merTradeNo:"+merTradeNo+"&tradeNo: "+tradeNo+"&tradeStatus: "+tradeStatus+"&msg: "+msg+"&resultCode: "+
				resultCode+"&sign: "+sign);
		
	}
	
	
	@RequestMapping(value = { "/paymentStatus" })
	public ModelAndView status(HttpServletRequest request, Model model) throws Exception {
		
		return new ModelAndView(UserRestURIConstants.getSitePath(request) + "payment/payment-status");
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = { "/getPaymentStatus" })
	@ResponseBody
	public JSONObject getPaymentInfo(HttpServletRequest request,HttpServletResponse response){
		JSONObject jsonObject = new JSONObject();
		
		String merTradeNo = request.getParameter("merTradeNo");
		//long timestamp = System.nanoTime();
		long timestamp = System.currentTimeMillis()/1000L;
		String sign = "";	
		sign="appId="+APP_ID;
		if(StringUtils.isNotEmpty(merTradeNo)) sign=sign+"&merTradeNo="+merTradeNo;
		sign=sign+"&timestamp="+timestamp;
		
		sign=EncryptionUtils.encryptByHMACSHA512(sign);
		
		/*JSONObject jsonObject = paymentService.getPaymentStatus(APP_ID, merTradeNo, String.valueOf(timestamp), sign);
		paymentService.getPaymentStatus(APP_ID, merTradeNo, String.valueOf(timestamp), sign);
		logger.debug("*******payment status********: " + jsonObject);*/
		
		jsonObject.put("appId", APP_ID);
		jsonObject.put("timestamp", timestamp);
		jsonObject.put("sign", sign);
		
		
		return jsonObject;
	}
	

}
