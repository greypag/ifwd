package com.ifwd.fwdhk.services.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.services.PaymentService;
import com.ifwd.fwdhk.utils.services.SendEmailDao;

@Service
public class PaymentServiceImpl implements PaymentService {
	private final static Logger logger = LoggerFactory.getLogger(PaymentServiceImpl.class);
	
	private static final String url = "https://gateway.sandbox.tapngo.com.hk/paymentApi/payment/status";
	
	@Autowired
	private RestServiceDao restService;
	
	@Autowired
	private SendEmailDao sendEmail;

	@Override
	public JSONObject getPaymentStatus(String appId, String merTradeNo,
			String timestamp, String sign) {
		HashMap<String, String> header = new HashMap<String, String>();
		header.put("Content-Type", "application/x-www-form-urlencoded");
		header.put("Accept", "application/json");
		
		List<NameValuePair> params = new ArrayList<NameValuePair>();   
	    params.add(new BasicNameValuePair("appId", appId));   
	    params.add(new BasicNameValuePair("merTradeNo", merTradeNo));
	    params.add(new BasicNameValuePair("timestamp", timestamp));   
	    params.add(new BasicNameValuePair("sign", sign));
		
	    logger.debug("appId: "+appId + " merTradeNo: "+merTradeNo+" timestamp: "+timestamp+" sign: "+sign);
	    logger.debug("url: "+url);
	    
		JSONObject loginJsonObj = restService.consumePaymentStatusAPI(url,header, params);
		
		return loginJsonObj;
	}
	
	
}
