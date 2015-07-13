package com.ifwd.fwdhk.model;

public class CreateFlightPolicy extends PlanDetailsForm{
	
	private String currCode;
	public String getCurrCode() {
		return currCode;
	}
	public void setCurrCode(String currCode) {
		this.currCode = currCode;
	}
	public String getReferenceNo() {
		return referenceNo;
	}
	public void setReferenceNo(String referenceNo) {
		this.referenceNo = referenceNo;
	}
	public String getMerchantId() {
		return merchantId;
	}
	public void setMerchantId(String merchantId) {
		this.merchantId = merchantId;
	}
	public String getReferralCode() {
		return referralCode;
	}
	public void setReferralCode(String referralCode) {
		this.referralCode = referralCode;
	}
	public String getPolicyNo() {
		return policyNo;
	}
	public void setPolicyNo(String policyNo) {
		this.policyNo = policyNo;
	}
	public String getLang() {
		return lang;
	}
	public void setLang(String lang) {
		this.lang = lang;
	}
	public String getErrMsgs() {
		return errMsgs;
	}
	public void setErrMsgs(String errMsgs) {
		this.errMsgs = errMsgs;
	}
	@Override
	public String getPlanCode() {
		return planCode;
	}
	@Override
	public void setPlanCode(String planCode) {
		this.planCode = planCode;
	}
	public String getPaymentGateway() {
		return paymentGateway;
	}
	public void setPaymentGateway(String paymentGateway) {
		this.paymentGateway = paymentGateway;
	}
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	private String referenceNo;
	private String merchantId;
	private String referralCode;
	private String policyNo;
	private String lang;
	private String errMsgs;	
	private String planCode;
	private String paymentGateway;
	private String paymentType;
	
	

}
