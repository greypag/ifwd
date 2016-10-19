package com.ifwd.fwdhk.model.tngsavie;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonPropertyOrder({
"customerId",
"mobile",
"result",
"otpExpiryDate",
"msg"
})
public class TngOtpSmsReqResponse {

	@JsonProperty("customerId")
	private String customerId;
	@JsonProperty("mobile")
	private String mobile;
	@JsonProperty("result")
	private Boolean result;
	@JsonProperty("otpExpiryDate")
	private String otpExpiryDate;
	
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public Boolean getResult() {
		return result;
	}
	public void setResult(Boolean result) {
		this.result = result;
	}
	public String getOtpExpiryDate() {
		return otpExpiryDate;
	}
	public void setOtpExpiryDate(String otpExpiryDate) {
		this.otpExpiryDate = otpExpiryDate;
	}
	
}
