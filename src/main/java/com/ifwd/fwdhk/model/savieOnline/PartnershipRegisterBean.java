package com.ifwd.fwdhk.model.savieOnline;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ifwd.fwdhk.exception.ValidateExceptions;
import com.ifwd.fwdhk.util.CommonUtils;

public class PartnershipRegisterBean implements Serializable {
	private final static Logger logger = LoggerFactory.getLogger(PartnershipRegisterBean.class);
	private static final long serialVersionUID = 1L;
	
	private String name;
	private String email;
	private String industry;
	private String location;
	private String number;
	private String companyName;
	private String message;
	
	
	public void validate(String language) throws ValidateExceptions {
		List<String> list = new ArrayList<String>();
		if (list.size() > 0) {
			throw new ValidateExceptions(list);
		}
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getIndustry() {
		return industry;
	}
	public void setIndustry(String industry) {
		this.industry = industry;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	

}
