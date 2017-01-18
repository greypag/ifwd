package com.ifwd.fwdhk.model.motor;

public class ContactMe {
	private String refNum;
	private String fullName;
	private String contactNum;
	private String preferredContactTime;
	private String email;
	private MotorCareDetails motorCareDetails;
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
	public MotorCareDetails getMotorCareDetails() {
		return motorCareDetails;
	}
	public void setMotorCareDetails(MotorCareDetails motorCareDetails) {
		this.motorCareDetails = motorCareDetails;
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
