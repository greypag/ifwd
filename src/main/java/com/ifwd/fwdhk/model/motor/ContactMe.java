package com.ifwd.fwdhk.model.motor;

public class ContactMe {
	private String refNum;
	private String fullName;
	private String contactNum;
	private String preferredContactTime;
	private String email;
	private QuoteMotorCare quoteMotorCare;
	private String from;
	private String reason;
	
	public String getRefNum() {
		return refNum;
	}
	public void setRefNum(String refNum) {
		this.refNum = refNum;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getContactNum() {
		return contactNum;
	}
	public void setContactNum(String contactNum) {
		this.contactNum = contactNum;
	}
	public String getPreferredContactTime() {
		return preferredContactTime;
	}
	public void setPreferredContactTime(String preferredContactTime) {
		this.preferredContactTime = preferredContactTime;
	}
	public QuoteMotorCare getQuoteMotorCare() {
		return quoteMotorCare;
	}
	public void setQuoteMotorCare(QuoteMotorCare quoteMotorCare) {
		this.quoteMotorCare = quoteMotorCare;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}	
}
