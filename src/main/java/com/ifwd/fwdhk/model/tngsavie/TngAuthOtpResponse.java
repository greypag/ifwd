package com.ifwd.fwdhk.model.tngsavie;

import com.fasterxml.jackson.annotation.JsonProperty;

public class TngAuthOtpResponse {

	@JsonProperty("policyId")
	private String policyId;
	@JsonProperty("appId")
	private String appId;
	@JsonProperty("merTradeNo")
	private String merTradeNo;
	@JsonProperty("paymentType")
	private String paymentType;
	@JsonProperty("payload")
	private String payload;
	@JsonProperty("extras")
	private String extras;
	@JsonProperty("sign")
	private String sign;
	@JsonProperty("otp")
	private String otp;
	@JsonProperty("result")
	private Boolean result;
	
	public String getPolicyId() {
		return policyId;
	}
	public void setPolicyId(String policyId) {
		this.policyId = policyId;
	}
	public String getAppId() {
		return appId;
	}
	public void setAppId(String appId) {
		this.appId = appId;
	}
	public String getMerTradeNo() {
		return merTradeNo;
	}
	public void setMerTradeNo(String merTradeNo) {
		this.merTradeNo = merTradeNo;
	}
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	public String getPayload() {
		return payload;
	}
	public void setPayload(String payload) {
		this.payload = payload;
	}
	public String getExtras() {
		return extras;
	}
	public void setExtras(String extras) {
		this.extras = extras;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}
	public String getOtp() {
		return otp;
	}
	public void setOtp(String otp) {
		this.otp = otp;
	}
	public Boolean getResult() {
		return result;
	}
	public void setResult(Boolean result) {
		this.result = result;
	}
	
}
