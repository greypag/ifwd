package com.ifwd.fwdhk.model.savie;

import java.util.Date;

import org.joda.time.DateTime;

public class SavieAppointmentScheduleBean {
	
	private Date dateTime;
	private String branchName;
	private String phoneNo;
	
	
	public Date getDateTime() {
		return dateTime;
	}
	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}
	public String getBranchName() {
		return branchName;
	}
	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	

	
	

}
