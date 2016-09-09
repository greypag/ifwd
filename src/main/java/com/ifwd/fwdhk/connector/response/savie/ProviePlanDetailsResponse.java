package com.ifwd.fwdhk.connector.response.savie;

import java.util.List;

import com.ifwd.fwdhk.connector.response.BaseResponse;

public class ProviePlanDetailsResponse extends BaseResponse {
	private static final long serialVersionUID = 1L;

	private String premium;
	private String paymentTerm;
	private String issueAge;
	private String referralCode;
	private String guaranteeRate;
	private List<SaviePlanDetailsRate> planDetails0Rate;
	private List<SaviePlanDetailsRate> planDetails1Rate;
	private List<SaviePlanDetailsRate> planDetails2Rate;
	private List<SaviePlanDetailsRate> planDetails3Rate;
	private List<SaviePlanDetailsRate> planDetails4Rate;
	
	public String getPremium() {
		return premium;
	}
	public void setPremium(String premium) {
		this.premium = premium;
	}
	public String getPaymentTerm() {
		return paymentTerm;
	}
	public void setPaymentTerm(String paymentTerm) {
		this.paymentTerm = paymentTerm;
	}
	public String getIssueAge() {
		return issueAge;
	}
	public void setIssueAge(String issueAge) {
		this.issueAge = issueAge;
	}
	public String getReferralCode() {
		return referralCode;
	}
	public void setReferralCode(String referralCode) {
		this.referralCode = referralCode;
	}
	public List<SaviePlanDetailsRate> getPlanDetails0Rate() {
		return planDetails0Rate;
	}
	public void setPlanDetails0Rate(List<SaviePlanDetailsRate> planDetails0Rate) {
		this.planDetails0Rate = planDetails0Rate;
	}
	public List<SaviePlanDetailsRate> getPlanDetails2Rate() {
		return planDetails2Rate;
	}
	public void setPlanDetails2Rate(List<SaviePlanDetailsRate> planDetails2Rate) {
		this.planDetails2Rate = planDetails2Rate;
	}
	
	public String getGuaranteeRate() {
		return guaranteeRate;
	}
	public void setGuaranteeRate(String guaranteeRate) {
		this.guaranteeRate = guaranteeRate;
	}
	public List<SaviePlanDetailsRate> getPlanDetails1Rate() {
		return planDetails1Rate;
	}
	public void setPlanDetails1Rate(List<SaviePlanDetailsRate> planDetails1Rate) {
		this.planDetails1Rate = planDetails1Rate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public List<SaviePlanDetailsRate> getPlanDetails3Rate() {
		return planDetails3Rate;
	}
	public void setPlanDetails3Rate(List<SaviePlanDetailsRate> planDetails3Rate) {
		this.planDetails3Rate = planDetails3Rate;
	}
	public List<SaviePlanDetailsRate> getPlanDetails4Rate() {
		return planDetails4Rate;
	}
	public void setPlanDetails4Rate(List<SaviePlanDetailsRate> planDetails4Rate) {
		this.planDetails4Rate = planDetails4Rate;
	}
	
}
