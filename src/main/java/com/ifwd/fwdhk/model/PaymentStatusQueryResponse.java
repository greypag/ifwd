package com.ifwd.fwdhk.model;

import org.apache.commons.lang3.StringUtils;

public class PaymentStatusQueryResponse {
	String resultCode;
	
	String message;
	
	String merTradeNo;
	
	String tradeNo;
	
	String tradeStatus;
	
	String sign;

	public String getResultCode() {
		return resultCode;
	}

	public void setResultCode(String resultCode) {
		this.resultCode = resultCode;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getMerTradeNo() {
		return merTradeNo;
	}

	public void setMerTradeNo(String merTradeNo) {
		this.merTradeNo = merTradeNo;
	}

	public String getTradeNo() {
		return tradeNo;
	}

	public void setTradeNo(String tradeNo) {
		this.tradeNo = tradeNo;
	}

	public String getTradeStatus() {
		return tradeStatus;
	}

	public void setTradeStatus(String tradeStatus) {
		this.tradeStatus = tradeStatus;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}
	
	public String toString(){
		String result = "";
		
		if(StringUtils.isNotBlank(this.resultCode)){
			result = this.resultCode;
		}
		
		return result;
	}
	

}
