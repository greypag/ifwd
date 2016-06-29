package com.ifwd.fwdhk.model.eliteterm;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.exception.ValidateExceptions;
import com.ifwd.fwdhk.util.DateApi;
import com.ifwd.utils.ErrorMessageUtils;
import com.ifwd.utils.ValidationUtils;

public class EliteTermPlanDetailBean implements Serializable {
	private final static Logger logger = LoggerFactory.getLogger(EliteTermPlanDetailBean.class);
	private static final long serialVersionUID = 1L;
	
	private String dob;
	private String gender;
	private Boolean smoke;
	private String insuredAmount;
	private String referralCode;
	
	public void validate(String language) throws ValidateExceptions {
        List<String> list = new ArrayList<String>();
        /*if(this.insuredAmount == null || "".equals(this.insuredAmount)){
        	list.add(ErrorMessageUtils.getMessage("insuredAmount", "validation.failure", language));
        }
        else if(Integer.valueOf(this.insuredAmount)<30000 || Integer.valueOf(this.insuredAmount)>400000){
        	list.add(ErrorMessageUtils.getMessage("insuredAmount", "validation.failure", language));
        }
        if(ValidationUtils.isValidDate(this.dob)){
        	list.add(ErrorMessageUtils.getMessage("dob", "validation.failure", language));
        }
        else if(DateApi.getAge(DateApi.formatDate(this.dob))<18 || DateApi.getAge(DateApi.formatDate(this.dob))>100){
        	int age = DateApi.getAge(DateApi.formatDate(this.dob));
            logger.info(age+"");
        	list.add(ErrorMessageUtils.getMessage("dob", "validation.failure", language));
        }*/
		if (list.size() > 0) {
			throw new ValidateExceptions(list);
		}
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Boolean getSmoke() {
		return smoke;
	}

	public void setSmoke(Boolean smoke) {
		this.smoke = smoke;
	}

	public String getInsuredAmount() {
		return insuredAmount;
	}

	public void setInsuredAmount(String insuredAmount) {
		this.insuredAmount = insuredAmount;
	}

	public String getReferralCode() {
		return referralCode;
	}

	public void setReferralCode(String referralCode) {
		this.referralCode = referralCode;
	}

	
	
}
