package com.ifwd.fwdhk.model.tngsavie;

import com.fasterxml.jackson.annotation.JsonProperty;

public class TngLinkupPayload {

	@JsonProperty("transactionType")
	private String transactionType;
	@JsonProperty("payload")
	private String payload;
	@JsonProperty("appId")
	private String appId;
	@JsonProperty("extra")
	private String extra;
	@JsonProperty("sign")
	private String sign;
	@JsonProperty("merTradeNo")
	private String merTradeNo;
	@JsonProperty("paymentType")
	private String paymentType;
	
	public String getTransactionType() {
		return transactionType;
	}
	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}
	public String getPayload() {
		return payload;
	}
	public void setPayload(String payload) {
		this.payload = payload;
	}
	public String getAppId() {
		return appId;
	}
	public void setAppId(String appId) {
		this.appId = appId;
	}
	public String getExtra() {
		return extra;
	}
	public void setExtra(String extra) {
		this.extra = extra;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
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
	
}
