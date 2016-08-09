package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.model.TapAndGoPaymentStatusQueryResponse;
import com.ifwd.fwdhk.services.PaymentService;
import com.ifwd.fwdhk.util.EncryptionUtils;
import com.ifwd.fwdhk.util.JsonUtils;
import com.ifwd.fwdhk.util.WebServiceUtils;

@Controller
public class PaymentController extends BaseController {	

	private final static Logger logger = LoggerFactory.getLogger(PaymentController.class);
	
	@Autowired
	private PaymentService paymentService;
	
	@Autowired
	private RestServiceDao restService;
	
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

		String appId = UserRestURIConstants.APP_ID;
		String merTradeNo = getTradeNo();
		String paymentType = "S";
		String payload = "";
		String extras = "";
		String sign = "";	

		String url = request.getRealPath("/");
		System.out.println(url);
		url = url.replace("ajax/annualTravel/caculateTgPaymentInfo", "");

		String path = request.getRequestURL().toString();
		path = path.replace("ajax/annualTravel/caculateTgPaymentInfo", "");
		net.sf.json.JSONObject payloadObject = new net.sf.json.JSONObject();
		payloadObject.put("totalPrice", "500.00");
		payloadObject.put("currency", "HKD");
		payloadObject.put("merTradeNo", merTradeNo);
		payloadObject.put("notifyUrl", path+"paymentNotify");
		payloadObject.put("returnUrl", path+"paymentReturn");
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
	
	@RequestMapping(value = { "/tapNGo/payment/status" })
	public ModelAndView tapNGoPaymentStatus(HttpServletRequest request, Model model) throws Exception {
		
		HttpSession session = request.getSession();
		String merTradeNo =(String) session.getAttribute("finalizeReferenceNo"); // request.getParameter("merTradeNo");
		String paymentMethod=(String) session.getAttribute("paymentMethod");
		
		
		String statusUrl=UserRestURIConstants.getConfigs("url")+"/gi/payment/status?requestNo="+merTradeNo+"&paymentMethod="+paymentMethod;		

		
		HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
		header.put("userName", (String) session.getAttribute("username"));
		header.put("token", (String) session.getAttribute("token"));
		header.put("language", WebServiceUtils
				.transformLanaguage(UserRestURIConstants.getLanaguage(request)));

		
		JSONObject responsObject = new JSONObject();
		responsObject = restService.consumeApi(HttpMethod.GET,statusUrl, header,null);
		logger.info("TRAVEL_FINALIZE_POLICY Response " + JsonUtils.jsonPrint(responsObject));
		
		String paymentStatus=responsObject.get("paymentStatus").toString();
		String resultCode = request.getParameter("resultCode");
		if(paymentStatus.equalsIgnoreCase("c"))
		{
			resultCode="0";
		}
			
		String lang = UserRestURIConstants.getLanaguage(request);
		
		//String merTradeNo = request.getParameter("merTradeNo");
		//String msg = request.getParameter("msg");
		
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
	
/*	
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
*/	
	
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = { "/getPaymentStatus" })
	@ResponseBody
	public JSONObject getPaymentInfo(HttpServletRequest request,HttpServletResponse response){
		//JSONObject jsonObject = new JSONObject();
		String merTradeNo = request.getParameter("merTradeNo");
		
		//JSONObject jsonObject = paymentService.getPaymentStatus(merTradeNo);
		JSONObject jsonObject = paymentService.tapAndGoPaymentStatusAPI(merTradeNo);
		
		TapAndGoPaymentStatusQueryResponse result=new TapAndGoPaymentStatusQueryResponse();
		if(jsonObject!=null)
		{
			JSONObject contentObject=(JSONObject) jsonObject.get("content");
			
			result.setChiMessage(contentObject.get("chiMessage").toString());
			result.setEngMessage(contentObject.get("engMessage").toString());
			result.setInternal(contentObject.get("internal").toString());
			result.setResultCode(contentObject.get("resultCode").toString());
			net.sf.json.JSONObject contentObject2=new net.sf.json.JSONObject();
			JSONObject payloadObject=(JSONObject) contentObject.get("payload");
			if(payloadObject!=null)
			{
				result.setMerTradeNo(payloadObject.get("merTradeNo").toString());
				result.setTradeNo(payloadObject.get("tradeNo").toString());
				result.setTradeStatus(payloadObject.get("tradeStatus").toString());
				
				contentObject2.put("merTradeNo",result.getMerTradeNo());
				contentObject2.put("tradeNo",result.getTradeNo());
				contentObject2.put("tradeStatus",result.getTradeStatus());
				
			}
			
			
			net.sf.json.JSONObject contentObject1=new net.sf.json.JSONObject();
			contentObject1.put("chiMessage", result.getChiMessage());
			contentObject1.put("engMessage", result.getEngMessage());
			contentObject1.put("internal", result.getInternal());
			contentObject1.put("payload", contentObject2);
			contentObject1.put("resultCode", result.getResultCode());
			
			
			String kk=contentObject1.toString();
			
					
			logger.debug("*******content********: " + kk);
			logger.debug("*******sign********: " + EncryptionUtils.encryptByHMACSHA512(kk));
			logger.debug("*******sign********: " + jsonObject.get("sign").toString());	
			
			result.setSign(jsonObject.get("sign").toString());
		}
		
		String url = UserRestURIConstants.getWebsite(request);
		
		
		System.out.println(url);
	
		
		//TapAndGoPaymentStatusQueryResponse paymentStatusQueryResponse = paymentService.tapAndGoQueryByOrderReference(merTradeNo);
		//paymentService.getPaymentStatus(APP_ID, merTradeNo, String.valueOf(timestamp), sign);
		logger.debug("*******payment status********: " + jsonObject.toString());
		
		return jsonObject;
	}
	

}
