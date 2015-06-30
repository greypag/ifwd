package com.ifwd.fwdhk.model.savie;

import java.util.Date;

import org.joda.time.DateTime;

public class SavieAppointmentScheduleBean {
	
	private Date dateTime;
	private String branch;
	private String phoneNo;
	
	public Date getDateTime() {
		return dateTime;
	}
	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	
	
	
	

}
