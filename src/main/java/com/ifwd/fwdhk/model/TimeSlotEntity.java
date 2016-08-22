package com.ifwd.fwdhk.model;

public class TimeSlotEntity {
	
	private String date;
	
	private String serviceCentreCode;
	
	private String timeSlot;
	
	private int manPower;
	
	private int manRemainder;

	private int appointmentTypeId;
	
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}	
	
	public String getServiceCentreCode() {
		return serviceCentreCode;
	}

	public void setServiceCentreCode(String serviceCentreCode) {
		this.serviceCentreCode = serviceCentreCode;
	}

	public String getTimeSlot() {
		return timeSlot;
	}

	public void setTimeSlot(String timeSlot) {
		this.timeSlot = timeSlot;
	}
	
	public int getManPower() {
		return manPower;
	}
	
	public void setManPower(int manPower) {
		this.manPower = manPower;
	}

	public Integer getManRemainder() {
		return manRemainder;
	}

	public void setManRemainder(int manRemainder) {
		this.manRemainder = manRemainder;
	}
	
	public int getAppointmentTypeId() {
		return appointmentTypeId;
	}

	public void setAppointmentTypeId(Integer appointmentTypeId) {
		this.appointmentTypeId = appointmentTypeId;
	}

}
