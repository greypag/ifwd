package com.ifwd.fwdhk.model.tngsavie;

public class TngPolicyWithdrawPerformResponse {

	private String policyId;
	private String customerId;
	private boolean withdrawStatus;
	private String tngStatus;
	private String tngRefNo;
	
	public String getPolicyId() {
		return policyId;
	}
	public void setPolicyId(String policyId) {
		this.policyId = policyId;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public boolean isWithdrawStatus() {
		return withdrawStatus;
	}
	public void setWithdrawStatus(boolean withdrawStatus) {
		this.withdrawStatus = withdrawStatus;
	}
	public String getTngStatus() {
		return tngStatus;
	}
	public void setTngStatus(String tngStatus) {
		this.tngStatus = tngStatus;
	}
	public String getTngRefNo() {
		return tngRefNo;
	}
	public void setTngRefNo(String tngRefNo) {
		this.tngRefNo = tngRefNo;
	}
	
}
