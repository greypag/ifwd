package com.ifwd.fwdhk.model.tngsavie;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;


@JsonIgnoreProperties(ignoreUnknown = true)
public class PhwSearchPolicyRequest {

	@JsonProperty("lastNameEn")
	public String lastNameEn;
	@JsonProperty("firstNameEn")
	public String firstNameEn;
	@JsonProperty("lastNameZh")
	public String lastNameZh;
	@JsonProperty("firstNameZh")
	public String firstNameZh;
	@JsonProperty("docId")
	public String docId;
	@JsonProperty("policyAccountId")
	public String policyAccountId;
	@JsonProperty("gender")
	public String gender;
	@JsonProperty("phoneNumber")
	public String phoneNumber;
	@JsonProperty("policyRelateCode")
	public String policyRelateCode;
	@JsonProperty("callerRequest")
	public PhwCallerRequest callerRequest;
	@JsonProperty("agentCode")
	public String agentCode;
	@JsonProperty("agentLicense")
	public String agentLicense;
	
	public String getLastNameEn() {
		return lastNameEn;
	}
	public void setLastNameEn(String lastNameEn) {
		this.lastNameEn = lastNameEn;
	}
	public String getFirstNameEn() {
		return firstNameEn;
	}
	public void setFirstNameEn(String firstNameEn) {
		this.firstNameEn = firstNameEn;
	}
	public String getLastNameZh() {
		return lastNameZh;
	}
	public void setLastNameZh(String lastNameZh) {
		this.lastNameZh = lastNameZh;
	}
	public String getFirstNameZh() {
		return firstNameZh;
	}
	public void setFirstNameZh(String firstNameZh) {
		this.firstNameZh = firstNameZh;
	}
	public String getDocId() {
		return docId;
	}
	public void setDocId(String docId) {
		this.docId = docId;
	}
	public String getPolicyAccountId() {
		return policyAccountId;
	}
	public void setPolicyAccountId(String policyAccountId) {
		this.policyAccountId = policyAccountId;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getPolicyRelateCode() {
		return policyRelateCode;
	}
	public void setPolicyRelateCode(String policyRelateCode) {
		this.policyRelateCode = policyRelateCode;
	}
	public PhwCallerRequest getCallerRequest() {
		return callerRequest;
	}
	public void setCallerRequest(PhwCallerRequest callerRequest) {
		this.callerRequest = callerRequest;
	}
	public String getAgentCode() {
		return agentCode;
	}
	public void setAgentCode(String agentCode) {
		this.agentCode = agentCode;
	}
	public String getAgentLicense() {
		return agentLicense;
	}
	public void setAgentLicense(String agentLicense) {
		this.agentLicense = agentLicense;
	}
	
}
