package com.ifwd.fwdhk.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ifwd.fwdhk.model.AnnualDetailsForm;
import com.ifwd.fwdhk.model.AnnualTravelQuoteBean;
import com.ifwd.fwdhk.model.TravelQuoteBean;
import com.ifwd.fwdhk.services.AnnualTravelService;
import com.ifwd.fwdhk.util.EncryptionUtils;
import com.ifwd.fwdhk.util.WebServiceUtils;
@Controller
public class AjaxAnnualTravelController {
	
	private final static Logger logger = LoggerFactory.getLogger(AjaxAnnualTravelController.class);

	@Autowired
	private AnnualTravelService annualTravelService;
	
	// BMG updateTravelQuote
	// return JSON
	@RequestMapping(value = "/ajax/annualTravel/updateTravelQuote/update", method = RequestMethod.POST)
	@ResponseBody
	public String updateTravelQuote(@ModelAttribute("annualTravelQuote") AnnualTravelQuoteBean travelQuote,BindingResult result, Model model, HttpServletRequest request) {
		String str = null;
		try {
			str = annualTravelService.updateTravelQuote(travelQuote, result, model, request);
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		return str;
	}
	
	@RequestMapping(value = "/ajax/annualTravel/applyTravelPromoCode/apply", method = RequestMethod.POST)
	@ResponseBody
	public String applyPromotionCode(@ModelAttribute("annualTravelQuote") AnnualTravelQuoteBean travelQuote,BindingResult result, Model model, HttpServletRequest request) throws ParseException {
		String str = null;
		try {
			str = annualTravelService.applyPromotionCode(travelQuote, result, model, request);
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		return str;
	}
	
	@RequestMapping(value = "/ajax/annualTravel/processTravePayment/post")
	@ResponseBody
	public String processPayment(HttpServletRequest request,HttpServletResponse response){
		String str = null;
		try {
			str = annualTravelService.processPayment(request, response);
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		return str;
	}
	
	@RequestMapping(value = "/ajax/annualTravel/getPromoCode/get")
	@ResponseBody
	public String getPromoCode(HttpServletRequest request,HttpServletResponse response) throws IOException {
		String str = null;
		try {
			str = annualTravelService.getPromoCode(request, response);
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		return str;
	}
	
	@RequestMapping(value = "/ajax/annualTravel/sendEmail/send")
	@ResponseBody
	public String sendEmail(HttpServletRequest request) {
		String str = null;
		try {
			str = annualTravelService.sendEmail(request);
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		return str;
	}
	
	@RequestMapping(value = "/ajax/annualTravel/prepareTravelInsuranceQuote")
	@ResponseBody
	public String prepareTravelInsuranceQuote(@ModelAttribute("annualTravelQuote") AnnualTravelQuoteBean travelQuote,
			BindingResult result, Model model, HttpServletRequest request) throws Exception {
		try {
			return annualTravelService.getAnnualTravelPlan(travelQuote, model, request);
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
			return "fail";
		}
	}
	
	@RequestMapping(value = "/ajax/annualTravel/prepareTravelInsuranceUserDetails")
	@ResponseBody
	public String prepareTravelInsuranceUserDetails(
			@ModelAttribute("annualTravelQuote") TravelQuoteBean travelQuote,
			BindingResult result, Model model, HttpServletRequest request) throws Exception {
		try {
			return annualTravelService.prepareTravelInsuranceUserDetails(travelQuote, result, model, request);
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
			return "fail";
		}
	}
	
	@RequestMapping(value = "/ajax/annualTravel/prepareTravelInsuranceTravelSummary")
	@ResponseBody
	public String prepareTravelInsuranceTravelSummary(
			@ModelAttribute("frmYourDetails") AnnualDetailsForm planDetailsForm,
			BindingResult result, Model model, HttpServletRequest request) throws Exception {
		try {
			return annualTravelService.prepareTravelInsuranceTravelSummary(planDetailsForm, result, model, request);
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
			return "fail";
		}
	}
	
	@SuppressWarnings({ "unchecked"})
	@RequestMapping(value = "/ajax/caculateTgPaymentInfo")
	@ResponseBody
	public JSONObject caculateTgPaymentInfo(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		session.setAttribute("paymentMethod", "TapNGo");
		
		JSONObject returnJson = new JSONObject();
		
		String appId = (String)session.getAttribute("tapNGoAppId");
		String merTradeNo = (String)session.getAttribute("transNo");
		String paymentType = "S";
		String payload = "";
		String sign = "";		
		String payment="";
		
		
		payload=(String)session.getAttribute("tapNGoPayload");
		sign=(String)session.getAttribute("tapNGoSign");
		payment=(String)session.getAttribute("tapNGoTransactionUrl");
		returnJson.put("appId", appId);
		returnJson.put("merTradeNo", merTradeNo);
		returnJson.put("payload", payload);
		returnJson.put("paymentType", paymentType);
		returnJson.put("sign", sign);
		returnJson.put("payment", payment);
		
		logger.info("appId:"+appId);
		logger.info("merTradeNo:"+merTradeNo);
		logger.info("payload:"+payload);
		logger.info("paymentType:"+paymentType);
		logger.info("sign:"+sign);
		logger.info("payment:"+payment);
		
		
		return returnJson;
	}
	
	
	
}