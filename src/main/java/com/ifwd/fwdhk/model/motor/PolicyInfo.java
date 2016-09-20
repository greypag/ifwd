package com.ifwd.fwdhk.model.motor;

import java.util.ArrayList;
import java.util.List;

public class PolicyInfo {
	
	private List<Driver> driver = new ArrayList<Driver>();
	private String nameOfPreviousInusrancer;
	private String regNoofPreviousPolicy;
	private String expDateOfPreviousInsurance;
	private String previousPolicyNo;
	
	public List<Driver> getDriver() {
		return driver;
	}
	public void setDriver(List<Driver> driver) {
		this.driver = driver;
	}
	public String getNameOfPreviousInusrancer() {
		return nameOfPreviousInusrancer;
	}
	public void setNameOfPreviousInusrancer(String nameOfPreviousInusrancer) {
		this.nameOfPreviousInusrancer = nameOfPreviousInusrancer;
	}
	public String getRegNoofPreviousPolicy() {
		return regNoofPreviousPolicy;
	}
	public void setRegNoofPreviousPolicy(String regNoofPreviousPolicy) {
		this.regNoofPreviousPolicy = regNoofPreviousPolicy;
	}
	public String getExpDateOfPreviousInsurance() {
		return expDateOfPreviousInsurance;
	}
	public void setExpDateOfPreviousInsurance(String expDateOfPreviousInsurance) {
		this.expDateOfPreviousInsurance = expDateOfPreviousInsurance;
	}
	public String getPreviousPolicyNo() {
		return previousPolicyNo;
	}
	public void setPreviousPolicyNo(String previousPolicyNo) {
		this.previousPolicyNo = previousPolicyNo;
	}
	
	
	
	
}
