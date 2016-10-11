package com.ifwd.fwdhk.model.tngsavie;

public class TngPolicyInfo {
	
	private String customerId;
	private String mobileNumber;//for send SMS OTP display to user
	
	private String policyId;
	private String product_en;//plan name
	private String product_zh;
	private String policyStatus_en;
	private String policyStatus_zh;
	private boolean validPolicy;
	private Double principle;
	private String asOfDate;//principle asOfDate
	
	private String tngAccountId;
	private String tngExpiryDate;
	private boolean ableLinkup;
	private boolean ableWithdrawal;
	
	private String warningMsg;

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getPolicyId() {
		return policyId;
	}

	public void setPolicyId(String policyId) {
		this.policyId = policyId;
	}

	public String getProduct_en() {
		return product_en;
	}

	public void setProduct_en(String product_en) {
		this.product_en = product_en;
	}

	public String getProduct_zh() {
		return product_zh;
	}

	public void setProduct_zh(String product_zh) {
		this.product_zh = product_zh;
	}

	public String getPolicyStatus_en() {
		return policyStatus_en;
	}

	public void setPolicyStatus_en(String policyStatus_en) {
		this.policyStatus_en = policyStatus_en;
	}

	public String getPolicyStatus_zh() {
		return policyStatus_zh;
	}

	public void setPolicyStatus_zh(String policyStatus_zh) {
		this.policyStatus_zh = policyStatus_zh;
	}

	public boolean isValidPolicy() {
		return validPolicy;
	}

	public void setValidPolicy(boolean validPolicy) {
		this.validPolicy = validPolicy;
	}

	public Double getPrinciple() {
		return principle;
	}

	public void setPrinciple(Double principle) {
		this.principle = principle;
	}

	public String getAsOfDate() {
		return asOfDate;
	}

	public void setAsOfDate(String asOfDate) {
		this.asOfDate = asOfDate;
	}

	public String getTngAccountId() {
		return tngAccountId;
	}

	public void setTngAccountId(String tngAccountId) {
		this.tngAccountId = tngAccountId;
	}

	public String getTngExpiryDate() {
		return tngExpiryDate;
	}

	public void setTngExpiryDate(String tngExpiryDate) {
		this.tngExpiryDate = tngExpiryDate;
	}

	public boolean isAbleLinkup() {
		return ableLinkup;
	}

	public void setAbleLinkup(boolean ableLinkup) {
		this.ableLinkup = ableLinkup;
	}

	public boolean isAbleWithdrawal() {
		return ableWithdrawal;
	}

	public void setAbleWithdrawal(boolean ableWithdrawal) {
		this.ableWithdrawal = ableWithdrawal;
	}

	public String getWarningMsg() {
		return warningMsg;
	}

	public void setWarningMsg(String warningMsg) {
		this.warningMsg = warningMsg;
	}
	
	
}
