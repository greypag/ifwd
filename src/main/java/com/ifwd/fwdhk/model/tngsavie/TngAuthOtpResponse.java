package com.ifwd.fwdhk.model.tngsavie;

import com.fasterxml.jackson.annotation.JsonProperty;

public class TngAuthOtpResponse {

	@JsonProperty("result")
	private Boolean result;
	@JsonProperty("payload")
	private TngLinkupPayload payload;
	@JsonProperty("otp")
	private String otp;
	
	public Boolean getResult() {
		return result;
	}
	public void setResult(Boolean result) {
		this.result = result;
	}
	public TngLinkupPayload getPayload() {
		return payload;
	}
	public void setPayload(TngLinkupPayload payload) {
		this.payload = payload;
	}
	public String getOtp() {
		return otp;
	}
	public void setOtp(String otp) {
		this.otp = otp;
	}
	
}
