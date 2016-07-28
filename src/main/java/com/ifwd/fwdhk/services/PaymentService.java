package com.ifwd.fwdhk.services;

import org.json.simple.JSONObject;

public interface PaymentService {

	public JSONObject getPaymentStatus(String appId,String merTradeNo,String timestamp,String sign);
}
