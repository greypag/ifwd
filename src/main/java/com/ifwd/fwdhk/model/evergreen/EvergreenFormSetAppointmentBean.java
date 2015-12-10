package com.ifwd.fwdhk.model.evergreen;

import java.util.Date;

public class EvergreenFormSetAppointmentBean {

	private EvergreenServiceCentreBean savieServiceCentreBean;
	
	private Date date;
	
	private String time;
	
	private String comment;
	
	public EvergreenServiceCentreBean getSavieServiceCentreBean() {
		return savieServiceCentreBean;
	}

	public void setSavieServiceCentreBean(
			EvergreenServiceCentreBean savieServiceCentreBean) {
		this.savieServiceCentreBean = savieServiceCentreBean;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
	
	
}
