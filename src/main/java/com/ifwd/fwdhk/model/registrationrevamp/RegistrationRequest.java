package com.ifwd.fwdhk.model.registrationrevamp;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.ifwd.fwdhk.exception.ValidateExceptions;
import com.ifwd.fwdhk.util.DateApi;
import com.ifwd.utils.ErrorMessageUtils;
import com.ifwd.utils.ValidationUtils;

public class RegistrationRequest implements Serializable {

	
	private String userName;
	private String mobile;
	private String password;
	private String email;
	private String docNo;
	private String policyNo;
	private String dob;
	private String optOut1;
	private String optOut2;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDocNo() {
		return docNo;
	}
	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}
	public String getPolicyNo() {
		return policyNo;
	}
	public void setPolicyNo(String policyNo) {
		this.policyNo = policyNo;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getOptOut1() {
		return optOut1;
	}
	public void setOptOut1(String optOut1) {
		this.optOut1 = optOut1;
	}
	public String getOptOut2() {
		return optOut2;
	}
	public void setOptOut2(String optOut2) {
		this.optOut2 = optOut2;
	}
	
	


}
