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
	private String employmentStatusName;
	private String natureOfBusiness;
	private String natureOfBusinessName;
	private String occupation;
	private String occupationName;
	private String employerName;
	private String monthlyPersonalIncome;
	private String monthlyPersonalIncomeName;
	private String education;
	private String educationName;
	private String amountOfOtherSourceOfIncome;
	private String amountOfOtherSourceOfIncomeName;
	private String amountOfLiquidAssets;
	private String amountOfLiquidAssetsName;
	
	public void validate(String language) throws ValidateExceptions {
		this.employmentStatusName = !"".equals(this.employmentStatus)?this.employmentStatus.split("-")[1]:"";
		this.natureOfBusinessName = !"".equals(this.natureOfBusiness)?this.natureOfBusiness.split("-")[1]:"";
		this.occupationName = !"".equals(this.occupation)?this.occupation.split("-")[1]:"";
		this.monthlyPersonalIncomeName = !"".equals(this.monthlyPersonalIncome)?this.monthlyPersonalIncome.split("-")[1]:"";
		this.educationName = !"".equals(this.education)?this.education.split("-")[1]:"";
		this.amountOfOtherSourceOfIncomeName = !"".equals(this.amountOfOtherSourceOfIncome)?this.amountOfOtherSourceOfIncome.split("-")[1]:"";
		this.amountOfLiquidAssetsName = !"".equals(this.amountOfLiquidAssets)?this.amountOfLiquidAssets.split("-")[1]:"";
		
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

	public String getEmploymentStatusName() {
		return employmentStatusName;
	}

	public void setEmploymentStatusName(String employmentStatusName) {
		this.employmentStatusName = employmentStatusName;
	}

	public String getNatureOfBusinessName() {
		return natureOfBusinessName;
	}

	public void setNatureOfBusinessName(String natureOfBusinessName) {
		this.natureOfBusinessName = natureOfBusinessName;
	}

	public String getOccupationName() {
		return occupationName;
	}

	public void setOccupationName(String occupationName) {
		this.occupationName = occupationName;
	}

	public String getMonthlyPersonalIncomeName() {
		return monthlyPersonalIncomeName;
	}

	public void setMonthlyPersonalIncomeName(String monthlyPersonalIncomeName) {
		this.monthlyPersonalIncomeName = monthlyPersonalIncomeName;
	}

	public String getEducationName() {
		return educationName;
	}

	public void setEducationName(String educationName) {
		this.educationName = educationName;
	}

	public String getAmountOfOtherSourceOfIncomeName() {
		return amountOfOtherSourceOfIncomeName;
	}

	public void setAmountOfOtherSourceOfIncomeName(
			String amountOfOtherSourceOfIncomeName) {
		this.amountOfOtherSourceOfIncomeName = amountOfOtherSourceOfIncomeName;
	}

	public String getAmountOfLiquidAssetsName() {
		return amountOfLiquidAssetsName;
	}

	public void setAmountOfLiquidAssetsName(String amountOfLiquidAssetsName) {
		this.amountOfLiquidAssetsName = amountOfLiquidAssetsName;
	}
	
}
