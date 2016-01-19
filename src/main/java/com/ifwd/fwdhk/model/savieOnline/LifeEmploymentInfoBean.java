package com.ifwd.fwdhk.model.savieOnline;

import java.io.Serializable;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.ifwd.utils.ValidationExceptions;
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
	
	public void validate(HttpServletRequest request) throws ValidationExceptions {
		ValidationUtils.validation("NOTNULL", "employmentStatus", employmentStatus, request);
		ValidationUtils.validation("NOTNULL", "natureOfBusiness", natureOfBusiness, request);
		ValidationUtils.validation("NOTNULL", "occupation", occupation, request);
		ValidationUtils.validation("NOTNULL", "employerName", employerName, request);
		ValidationUtils.validation("NOTNULL", "monthlyPersonalIncome", monthlyPersonalIncome, request);
		ValidationUtils.validation("NOTNULL", "education", education, request);
		ValidationUtils.validation("NOTNULL", "amountOfOtherSourceOfIncome", amountOfOtherSourceOfIncome, request);
		ValidationUtils.validation("NOTNULL", "amountOfLiquidAssets", amountOfLiquidAssets, request);
		ValidationUtils.sendMsg();
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
