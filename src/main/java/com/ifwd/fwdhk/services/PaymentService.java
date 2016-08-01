package com.ifwd.fwdhk.services;

import org.json.simple.JSONObject;

import com.ifwd.fwdhk.exception.PaymentQueryException;
import com.ifwd.fwdhk.model.PaymentStatusQueryResponse;

public interface PaymentService {

	public JSONObject getPaymentStatus(String appId,String merTradeNo,String timestamp,String sign);
	
	public PaymentStatusQueryResponse queryByOrderReference(String appId, String merTradeNo,String timestamp, String sign) throws PaymentQueryException;
}
