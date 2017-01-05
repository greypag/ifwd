package com.ifwd.fwdhk.model;

public class AppointmentBooking {
	
	public enum AppointmentType {
		SAVIE_OFFLINE(1),
		PAY_LATER(2),
		EASY_HEALTH_OFFLINE(3),
		PROVIE_OFFLINE(4),
		WEATHREE_OFFLINE(5);
		
	    public final int value;
	    
	    private AppointmentType(int value) {
	        this.value = value;
	    }

	    public int getValue() {
	        return value;
	    }
	}
	
	private String userName;
	private String referenceNum;
	private String preferredDate;
	private String preferredTime;
	private String centreCode;
	private String planCode;
	private AppointmentType type;
	
	public String getUserName() {
		return this.userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getReferenceNum() {
		return this.referenceNum;
	}
	
	public void setReferenceNum(String referenceNum) {
		this.referenceNum = referenceNum;
	}
	
	public String getPreferredDate() {
		return this.preferredDate;
	}
	
	public void setPreferredDate(String preferredDate) {
		this.preferredDate = preferredDate;
	}
	
	public String getPreferredTime() {
		return this.preferredTime;
	}
	
	public void setPreferredTime(String preferredTime) {
		this.preferredTime = preferredTime;
	}
	
	public String getCentreCode() {
		return this.centreCode;
	}
	
	public void setCentreCode(String centreCode) {
		this.centreCode = centreCode;
	}
	
	public String getPlanCode() {
		return this.planCode;
	}
	
	public void setPlanCode(String planCode) {
		this.planCode = planCode;
	}
	
	public AppointmentType getAppointmentType() {
		return this.type;
	}
	
	public void setAppointmentType(AppointmentType type) {
		this.type = type;
	}
	
}