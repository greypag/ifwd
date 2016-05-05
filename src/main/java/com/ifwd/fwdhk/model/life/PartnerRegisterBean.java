package com.ifwd.fwdhk.model.life;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ifwd.fwdhk.exception.ValidateExceptions;
import com.ifwd.fwdhk.model.OptionItemDesc;
import com.ifwd.fwdhk.util.InitApplicationMessage;

public class PartnerRegisterBean implements Serializable {
	private final static Logger logger = LoggerFactory.getLogger(LifePersonalDetailsBean.class);
	private static final long serialVersionUID = 1L;
	
	private String contactName;
	private String contactEmail;
	private String industryName;
	private String companyLocation;
	private String contactNum;
	private String companyName;
	private String descriptionMsg;
	
	
	
	
	public String getContactName() {
		return contactName;
	}




	public void setContactName(String contactName) {
		this.contactName = contactName;
	}




	public String getContactEmail() {
		return contactEmail;
	}




	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}




	public String getIndustryName() {
		return industryName;
	}




	public void setIndustryName(String industryName) {
		this.industryName = industryName;
	}




	public String getCompanyLocation() {
		return companyLocation;
	}




	public void setCompanyLocation(String companyLocation) {
		this.companyLocation = companyLocation;
	}




	public String getContactNum() {
		return contactNum;
	}




	public void setContactNum(String contactNum) {
		this.contactNum = contactNum;
	}




	public String getCompanyName() {
		return companyName;
	}




	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}




	public String getDescriptionMsg() {
		return descriptionMsg;
	}




	public void setDescriptionMsg(String descriptionMsg) {
		this.descriptionMsg = descriptionMsg;
	}




	public void validate(String language) throws ValidateExceptions {
		
		List<String> list = new ArrayList<String>();
		if (list.size() > 0) {
			throw new ValidateExceptions(list);
		}
	}

}
