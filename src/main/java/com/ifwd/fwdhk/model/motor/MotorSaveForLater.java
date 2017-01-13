package com.ifwd.fwdhk.model.motor;

public class MotorSaveForLater {
	
	private String type;
	private String uri;
	private String userName;
	private String lang;
	private MotorCareDetails motorCareDetails;
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getUri() {
		return uri;
	}
	public void setUri(String uri) {
		this.uri = uri;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getLang() {
		return lang;
	}
	public void setLang(String lang) {
		this.lang = lang;
	}
	public MotorCareDetails getMotorCareDetails() {
		return motorCareDetails;
	}
	public void setMotorCareDetails(MotorCareDetails motorCareDetails) {
		this.motorCareDetails = motorCareDetails;
	}
}
