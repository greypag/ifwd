package com.ifwd.fwdhk.model;

public class HomeQuoteBean {
	private String grossPremium;
	private String discountPercentage;
	private String discountAmount;
	private String totalNetPremium;
	
	
	private String referralCode;
	private String referralName;
	private String planCode;
	private String planName;
	
	private String totalDue;
	private String errormsg;
	
	
	
	
	public String getErrormsg() {
		return errormsg;
	}
	public void setErrormsg(String errormsg) {
		this.errormsg = errormsg;
	}
	public String getTotalDue() {
		return totalDue;
	}
	public void setTotalDue(String totalDue) {
		this.totalDue = totalDue;
	}
	public String getPlanName() {
		return planName;
	}
	public void setPlanName(String planName) {
		this.planName = planName;
	}
	public String getGrossPremium() {
		return grossPremium;
	}
	public void setGrossPremium(String grossPremium) {
		this.grossPremium = grossPremium;
	}
	public String getDiscountPercentage() {
		return discountPercentage;
	}
	public void setDiscountPercentage(String discountPercentage) {
		this.discountPercentage = discountPercentage;
	}
	public String getDiscountAmount() {
		return discountAmount;
	}
	public void setDiscountAmount(String discountAmount) {
		this.discountAmount = discountAmount;
	}
	public String getTotalNetPremium() {
		return totalNetPremium;
	}
	public void setTotalNetPremium(String totalNetPremium) {
		this.totalNetPremium = totalNetPremium;
	}
	
	public String getReferralCode() {
		return referralCode;
	}
	public void setReferralCode(String referralCode) {
		this.referralCode = referralCode;
	}
	public String getReferralName() {
		return referralName;
	}
	public void setReferralName(String referralName) {
		this.referralName = referralName;
	}
	public String getPlanCode() {
		return planCode;
	}
	public void setPlanCode(String planCode) {
		this.planCode = planCode;
	}

	
	
}
