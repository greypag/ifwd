package com.ifwd.fwdhk.services;

import org.json.simple.JSONObject;

import com.ifwd.fwdhk.exception.PaymentQueryException;
import com.ifwd.fwdhk.model.TapAndGoPaymentStatusQueryResponse;

public interface PaymentService {

	public JSONObject getPaymentStatus(String merTradeNo);
	
	public TapAndGoPaymentStatusQueryResponse tapAndGoQueryByOrderReference(String merTradeNo) throws PaymentQueryException;
}
