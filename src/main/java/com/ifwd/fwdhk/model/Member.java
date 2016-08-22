package com.ifwd.fwdhk.model;


public class Member {

	private String userName;
	private String password;
	private String confirmPassword;
	private String email;
	private String mobileNo;
	private String optOut1;
	private String optOut2;
	private String fullName;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getOptOut2() {
		return optOut2;
	}

	public void setOptOut2(String optOut2) {
		this.optOut2 = optOut2;
	}

	public String getOptOut1() {
		return optOut1;
	}

	public void setOptOut1(String optOut1) {
		this.optOut1 = optOut1;
	}
}
