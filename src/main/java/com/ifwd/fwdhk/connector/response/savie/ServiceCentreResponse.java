package com.ifwd.fwdhk.connector.response.savie;

import java.util.List;

import com.ifwd.fwdhk.connector.response.BaseResponse;

public class ServiceCentreResponse extends BaseResponse {
	private static final long serialVersionUID = 1L;

	private String status;
	private String dateTime;
	private List<ServiceCentreResult> result;
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDateTime() {
		return dateTime;
	}
	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
	public List<ServiceCentreResult> getResult() {
		return result;
	}
	public void setResult(List<ServiceCentreResult> result) {
		this.result = result;
	}
	
	
}
