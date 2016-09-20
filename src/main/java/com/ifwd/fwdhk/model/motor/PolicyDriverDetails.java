package com.ifwd.fwdhk.model.motor;

import java.util.ArrayList;
import java.util.List;
public class PolicyDriverDetails {
	
	
	private List<Driver> driver = new ArrayList<Driver>();
	private List<AddressLine> addressLine= new ArrayList<AddressLine>();
	private String policyStartDate;
	
	public List<Driver> getDriver() {
		return driver;
	}
	public void setDriver(List<Driver> driver) {
		this.driver = driver;
	}
	public List<AddressLine> getAddressLine() {
		return addressLine;
	}
	public void setAddressLine(List<AddressLine> addressLine) {
		this.addressLine = addressLine;
	}
	public String getPolicyStartDate() {
		return policyStartDate;
	}
	public void setPolicyStartDate(String policyStartDate) {
		this.policyStartDate = policyStartDate;
	}
	
	
	
		

}
