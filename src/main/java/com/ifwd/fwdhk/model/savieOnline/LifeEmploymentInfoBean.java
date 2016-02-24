package com.ifwd.fwdhk.model.savieOnline;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ifwd.fwdhk.exception.ValidateExceptions;
import com.ifwd.utils.ErrorMessageUtils;
import com.ifwd.utils.ValidationUtils;

public class LifeEmploymentInfoBean implements Serializable {
	private final static Logger logger = LoggerFactory.getLogger(LifeEmploymentInfoBean.class);
	private static final long serialVersionUID = 1L;

	private String employmentStatus;
	private String natureOfBusiness;
	private String occupation;
	private String employerName;
	private String monthlyPersonalIncome;
	private String education;
	private String amountOfOtherSourceOfIncome;
	private String amountOfLiquidAssets;
	
	public void validate(String language) throws ValidateExceptions {
		List<String> list = new ArrayList<String>();
        if(ValidationUtils.isNullOrEmpty(this.employmentStatus)){
        	list.add(ErrorMessageUtils.getMessage("employmentStatus", "validation.failure", language));
        }
        if(ValidationUtils.isNullOrEmpty(this.natureOfBusiness)){
        	list.add(ErrorMessageUtils.getMessage("natureOfBusiness", "validation.failure", language));
        }
        if(ValidationUtils.isNullOrEmpty(this.occupation)){
        	list.add(ErrorMessageUtils.getMessage("occupation", "validation.failure", language));
        }
        if(ValidationUtils.isNullOrEmpty(this.employerName)){
        	list.add(ErrorMessageUtils.getMessage("employerName", "validation.failure", language));
        }
        if(ValidationUtils.isNullOrEmpty(this.monthlyPersonalIncome)){
        	list.add(ErrorMessageUtils.getMessage("monthlyPersonalIncome", "validation.failure", language));
        }
        if(ValidationUtils.isNullOrEmpty(this.education)){
        	list.add(ErrorMessageUtils.getMessage("education", "validation.failure", language));
        }
        /*if(ValidationUtils.isNullOrEmpty(this.amountOfOtherSourceOfIncome)){
        	list.add(ErrorMessageUtils.getMessage("amountOfOtherSourceOfIncome", "validation.failure", language));
        }
        if(ValidationUtils.isNullOrEmpty(this.amountOfLiquidAssets)){
        	list.add(ErrorMessageUtils.getMessage("amountOfLiquidAssets", "validation.failure", language));
        }*/
		if (list.size() > 0) {
			throw new ValidateExceptions(list);
		}
	}

	public String getEmploymentStatus() {
		return employmentStatus;
	}

	public void setEmploymentStatus(String employmentStatus) {
		this.employmentStatus = employmentStatus;
	}

	public String getNatureOfBusiness() {
		return natureOfBusiness;
	}

	public void setNatureOfBusiness(String natureOfBusiness) {
		this.natureOfBusiness = natureOfBusiness;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public String getEmployerName() {
		return employerName;
	}

	public void setEmployerName(String employerName) {
		this.employerName = employerName;
	}

	public String getMonthlyPersonalIncome() {
		return monthlyPersonalIncome;
	}

	public void setMonthlyPersonalIncome(String monthlyPersonalIncome) {
		this.monthlyPersonalIncome = monthlyPersonalIncome;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getAmountOfOtherSourceOfIncome() {
		return amountOfOtherSourceOfIncome;
	}

	public void setAmountOfOtherSourceOfIncome(String amountOfOtherSourceOfIncome) {
		this.amountOfOtherSourceOfIncome = amountOfOtherSourceOfIncome;
	}

	public String getAmountOfLiquidAssets() {
		return amountOfLiquidAssets;
	}

	public void setAmountOfLiquidAssets(String amountOfLiquidAssets) {
		this.amountOfLiquidAssets = amountOfLiquidAssets;
	}
}
