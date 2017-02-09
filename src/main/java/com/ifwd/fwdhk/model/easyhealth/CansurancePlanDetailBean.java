package com.ifwd.fwdhk.model.easyhealth;

public class CansurancePlanDetailBean {

	private String gender;
	private String smoker;
	private String dob;
	private String dobdmy;
	private String planCode;

	public String getPlanCode() {
		return planCode;
	}
	public void setPlanCode(String planCode) {
		this.planCode = planCode;
	}
	public String getDobdmy() {
		return dobdmy;
	}
	public void setDobdmy(String dobdmy) {
		this.dobdmy = dobdmy;
	}
	private String referralCode;
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getSmoker() {
		return smoker;
	}
	public void setSmoker(String smoker) {
		this.smoker = smoker;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	
	public String getReferralCode() {
		return referralCode;
	}
	public void setReferralCode(String referralCode) {
		this.referralCode = referralCode;
	}
	
}
