package com.ifwd.fwdhk.model.savieOnline;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.ifwd.fwdhk.exception.ValidateExceptions;
import com.ifwd.fwdhk.model.OptionItemDesc;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.InitApplicationMessage;
import com.ifwd.utils.ErrorMessageUtils;
import com.ifwd.utils.ValidationUtils;

public class LifeEmploymentInfoBean implements Serializable {
	private final static Logger logger = LoggerFactory.getLogger(LifeEmploymentInfoBean.class);
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private CommonUtils commonUtils;

	private String employmentStatus;
	private String employmentStatusEnName;
	private String employmentStatusCnName;
	private String natureOfBusiness;
	private String natureOfBusinessEnName;
	private String natureOfBusinessCnName;
	private String occupation;
	private String occupationEnName;
	private String occupationCnName;
	private String otherOccupation;
	private String employerName;
	private String monthlyPersonalIncome;
	private String monthlyPersonalIncomeEnName;
	private String monthlyPersonalIncomeCnName;
	private String education;
	private String educationEnName;
	private String educationCnName;
	private String amountOfOtherSourceOfIncome;
	private String amountOfOtherSourceOfIncomeEnName;
	private String amountOfOtherSourceOfIncomeCnName;
	private String amountOfLiquidAssets;
	private String amountOfLiquidAssetsEnName;
	private String amountOfLiquidAssetsCnName;
	private String type;
	
	public void validate(String language) throws ValidateExceptions {
		if(!"".equals(this.employmentStatus)){
			for(OptionItemDesc item:InitApplicationMessage.employmentStatusEN){
				if(this.employmentStatus.equals(item.getItemCode())){
					this.employmentStatusEnName = item.getItemDesc();
					break;
				}
			}
			for(OptionItemDesc item:InitApplicationMessage.employmentStatusCN){
				if(this.employmentStatus.equals(item.getItemCode())){
					this.employmentStatusCnName = item.getItemDesc();
					break;
				}
			}
		}
		if(!"".equals(this.natureOfBusiness)){
			for(OptionItemDesc item:InitApplicationMessage.natureOfBusinessEN){
				if(this.natureOfBusiness.equals(item.getItemCode())){
					this.natureOfBusinessEnName = item.getItemDesc();
					break;
				}
			}
			for(OptionItemDesc item:InitApplicationMessage.natureOfBusinessCN){
				if(this.natureOfBusiness.equals(item.getItemCode())){
					this.natureOfBusinessCnName = item.getItemDesc();
					break;
				}
			}
		}
		if(!"".equals(this.occupation)){
			for(OptionItemDesc item:InitApplicationMessage.getOccupationByNob(commonUtils, this.natureOfBusiness, "EN", "1")){
				if(this.occupation.equals(item.getItemCode())){
					this.occupationEnName = item.getItemDesc();
					break;
				}
			}
			for(OptionItemDesc item:InitApplicationMessage.getOccupationByNob(commonUtils, this.natureOfBusiness, "CH", "1")){
				if(this.occupation.equals(item.getItemCode())){
					this.occupationCnName = item.getItemDesc();
					break;
				}
			}
		}
		if(!"".equals(this.monthlyPersonalIncome)){
			for(OptionItemDesc item:InitApplicationMessage.monthlyPersonalIncomeEN){
				if(this.monthlyPersonalIncome.equals(item.getItemCode())){
					this.monthlyPersonalIncomeEnName = item.getItemDesc();
					break;
				}
			}
			for(OptionItemDesc item:InitApplicationMessage.monthlyPersonalIncomeCN){
				if(this.monthlyPersonalIncome.equals(item.getItemCode())){
					this.monthlyPersonalIncomeCnName = item.getItemDesc();
					break;
				}
			}
		}
		if(!"".equals(this.education)){
			for(OptionItemDesc item:InitApplicationMessage.etEducationLevelEN){
				if(this.education.equals(item.getItemCode())){
					this.educationEnName = item.getItemDesc();
					break;
				}
			}
			for(OptionItemDesc item:InitApplicationMessage.etEducationLevelCN){
				if(this.education.equals(item.getItemCode())){
					this.educationCnName = item.getItemDesc();
					break;
				}
			}
		}
		if(!"".equals(this.amountOfOtherSourceOfIncome)){
			for(OptionItemDesc item:InitApplicationMessage.etAmountOtherSourceEN){
				if(this.amountOfOtherSourceOfIncome.equals(item.getItemCode())){
					this.amountOfOtherSourceOfIncomeEnName = item.getItemDesc();
					break;
				}
			}
			for(OptionItemDesc item:InitApplicationMessage.etAmountOtherSourceCN){
				if(this.amountOfOtherSourceOfIncome.equals(item.getItemCode())){
					this.amountOfOtherSourceOfIncomeCnName = item.getItemDesc();
					break;
				}
			}
		}
		if(!"".equals(this.amountOfLiquidAssets)){
			for(OptionItemDesc item:InitApplicationMessage.etLiquidAssetEN){
				if(this.amountOfLiquidAssets.equals(item.getItemCode())){
					this.amountOfLiquidAssetsEnName = item.getItemDesc();
					break;
				}
			}
			for(OptionItemDesc item:InitApplicationMessage.etLiquidAssetCN){
				if(this.amountOfLiquidAssets.equals(item.getItemCode())){
					this.amountOfLiquidAssetsCnName = item.getItemDesc();
					break;
				}
			}
		}
		
		List<String> list = new ArrayList<String>();
        /*if(ValidationUtils.isNullOrEmpty(this.employmentStatus)){
        	list.add(ErrorMessageUtils.getMessage("employmentStatus", "validation.failure", language));
        }
        else{
        	if(this.employmentStatus.split("-")[0].equals("ES4")||this.employmentStatus.split("-")[0].equals("ES5")||this.employmentStatus.split("-")[0].equals("ES7")||this.employmentStatus.split("-")[0].equals("ES6")){
        		if(ValidationUtils.isNullOrEmpty(this.amountOfOtherSourceOfIncome)){
	            	list.add(ErrorMessageUtils.getMessage("amountOfOtherSourceOfIncome", "validation.failure", language));
	            }
	            if(ValidationUtils.isNullOrEmpty(this.amountOfLiquidAssets)){
	            	list.add(ErrorMessageUtils.getMessage("amountOfLiquidAssets", "validation.failure", language));
	            }
        	}
        	else{
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
        	}
        }
        if(ValidationUtils.isNullOrEmpty(this.education)){
        	list.add(ErrorMessageUtils.getMessage("education", "validation.failure", language));
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

	public String getEmploymentStatusEnName() {
		return employmentStatusEnName;
	}

	public void setEmploymentStatusEnName(String employmentStatusEnName) {
		this.employmentStatusEnName = employmentStatusEnName;
	}

	public String getEmploymentStatusCnName() {
		return employmentStatusCnName;
	}

	public void setEmploymentStatusCnName(String employmentStatusCnName) {
		this.employmentStatusCnName = employmentStatusCnName;
	}

	public String getNatureOfBusinessEnName() {
		return natureOfBusinessEnName;
	}

	public void setNatureOfBusinessEnName(String natureOfBusinessEnName) {
		this.natureOfBusinessEnName = natureOfBusinessEnName;
	}

	public String getNatureOfBusinessCnName() {
		return natureOfBusinessCnName;
	}

	public void setNatureOfBusinessCnName(String natureOfBusinessCnName) {
		this.natureOfBusinessCnName = natureOfBusinessCnName;
	}

	public String getOccupationEnName() {
		return occupationEnName;
	}

	public void setOccupationEnName(String occupationEnName) {
		this.occupationEnName = occupationEnName;
	}

	public String getOccupationCnName() {
		return occupationCnName;
	}

	public void setOccupationCnName(String occupationCnName) {
		this.occupationCnName = occupationCnName;
	}

	public String getOtherOccupation() {
		return otherOccupation;
	}

	public void setOtherOccupation(String otherOccupation) {
		this.otherOccupation = otherOccupation;
	}

	public String getMonthlyPersonalIncomeEnName() {
		return monthlyPersonalIncomeEnName;
	}

	public void setMonthlyPersonalIncomeEnName(String monthlyPersonalIncomeEnName) {
		this.monthlyPersonalIncomeEnName = monthlyPersonalIncomeEnName;
	}

	public String getMonthlyPersonalIncomeCnName() {
		return monthlyPersonalIncomeCnName;
	}

	public void setMonthlyPersonalIncomeCnName(String monthlyPersonalIncomeCnName) {
		this.monthlyPersonalIncomeCnName = monthlyPersonalIncomeCnName;
	}

	public String getEducationEnName() {
		return educationEnName;
	}

	public void setEducationEnName(String educationEnName) {
		this.educationEnName = educationEnName;
	}

	public String getEducationCnName() {
		return educationCnName;
	}

	public void setEducationCnName(String educationCnName) {
		this.educationCnName = educationCnName;
	}

	public String getAmountOfOtherSourceOfIncomeEnName() {
		return amountOfOtherSourceOfIncomeEnName;
	}

	public void setAmountOfOtherSourceOfIncomeEnName(
			String amountOfOtherSourceOfIncomeEnName) {
		this.amountOfOtherSourceOfIncomeEnName = amountOfOtherSourceOfIncomeEnName;
	}

	public String getAmountOfOtherSourceOfIncomeCnName() {
		return amountOfOtherSourceOfIncomeCnName;
	}

	public void setAmountOfOtherSourceOfIncomeCnName(
			String amountOfOtherSourceOfIncomeCnName) {
		this.amountOfOtherSourceOfIncomeCnName = amountOfOtherSourceOfIncomeCnName;
	}

	public String getAmountOfLiquidAssetsEnName() {
		return amountOfLiquidAssetsEnName;
	}

	public void setAmountOfLiquidAssetsEnName(String amountOfLiquidAssetsEnName) {
		this.amountOfLiquidAssetsEnName = amountOfLiquidAssetsEnName;
	}

	public String getAmountOfLiquidAssetsCnName() {
		return amountOfLiquidAssetsCnName;
	}

	public void setAmountOfLiquidAssetsCnName(String amountOfLiquidAssetsCnName) {
		this.amountOfLiquidAssetsCnName = amountOfLiquidAssetsCnName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	
	
}
