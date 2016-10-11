package com.ifwd.fwdhk.model.tngsavie;


public class TngLinkupSaveRequest {
	private String policyId;
	private String tngAccountId;
	private String token;
	
	public String getPolicyId() {
		return policyId;
	}
	public void setPolicyId(String policyId) {
		this.policyId = policyId;
	}
	public String getTngAccountId() {
		return tngAccountId;
	}
	public void setTngAccountId(String tngAccountId) {
		this.tngAccountId = tngAccountId;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	
}
