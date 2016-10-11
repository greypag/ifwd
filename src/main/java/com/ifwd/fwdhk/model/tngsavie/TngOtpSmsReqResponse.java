package com.ifwd.fwdhk.model.tngsavie;


public class TngOtpSmsReqResponse {

	private String policyId;
	private String mobileNumber;
	private String otpExpiryDate;
	
	public String getPolicyId() {
		return policyId;
	}
	public void setPolicyId(String policyId) {
		this.policyId = policyId;
	}
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public String getOtpExpiryDate() {
		return otpExpiryDate;
	}
	public void setOtpExpiryDate(String otpExpiryDate) {
		this.otpExpiryDate = otpExpiryDate;
	}
	
}
