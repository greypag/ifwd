package com.ifwd.fwdhk.model.tngsavie;

public class TngAuthOtpResponse {

	private String policyId;
	private String appId;
	private String merTradeNo;
	private String paymentType;
	private String payload;
	private String extras;
	private String sign;
	
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
	
}
