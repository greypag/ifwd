package com.ifwd.fwdhk.model.savieOnline;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ifwd.fwdhk.exception.ValidateExceptions;
import com.ifwd.fwdhk.exception.ValidationExceptions;
import com.ifwd.fwdhk.model.OptionItemDesc;
import com.ifwd.fwdhk.util.InitApplicationMessage;
import com.ifwd.utils.ErrorMessageUtils;
import com.ifwd.utils.ValidationUtils;

public class LifeBeneficaryInfoBean implements Serializable {
	private final static Logger logger = LoggerFactory.getLogger(LifeBeneficaryInfoBean.class);
	private static final long serialVersionUID = 1L;

	private Boolean isOwnEstate;
	private String beneficaryFirstName1;
	private String beneficaryLastName1;
	private String beneficaryChineseName1;
	private String beneficiaryHkidPassport1;
	private String beneficaryID1;
	private String beneficiaryPassport1;
	private String beneficaryGender1;
	private String beneficaryRelation1;
	private String beneficaryRelationEnName1;
	private String beneficaryRelationCnName1;
	private String beneficaryWeight1;
	private String beneficaryFirstName2;
	private String beneficaryLastName2;
	private String beneficaryChineseName2;
	private String beneficiaryHkidPassport2;
	private String beneficaryID2;
	private String beneficiaryPassport2;
	private String beneficaryGender2;
	private String beneficaryRelation2;
	private String beneficaryRelationEnName2;
	private String beneficaryRelationCnName2;
	private String beneficaryWeight2;
	private String beneficaryFirstName3;
	private String beneficaryLastName3;
	private String beneficaryChineseName3;
	private String beneficiaryHkidPassport3;
	private String beneficaryID3;
	private String beneficiaryPassport3;
	private String beneficaryGender3;
	private String beneficaryRelation3;
	private String beneficaryRelationEnName3;
	private String beneficaryRelationCnName3;
	private String beneficaryWeight3;
	private String type;
	
	public void validate(String language) throws ValidateExceptions {
		if(!this.isOwnEstate){
			if(!"".equals(this.beneficaryFirstName1)){
				if(!"".equals(this.beneficaryRelation1)){
					for(OptionItemDesc item:InitApplicationMessage.lifeBeneficiaryRelationshipEN){
						if(this.beneficaryRelation1.equals(item.getItemCode())){
							this.beneficaryRelationEnName1 = item.getItemDesc();
							break;
						}
					}
					for(OptionItemDesc item:InitApplicationMessage.lifeBeneficiaryRelationshipCN){
						if(this.beneficaryRelation1.equals(item.getItemCode())){
							this.beneficaryRelationCnName1 = item.getItemDesc();
							break;
						}
					}
				}
			}
			if(!"".equals(this.beneficaryFirstName2)){
				if(!"".equals(this.beneficaryRelation2)){
					for(OptionItemDesc item:InitApplicationMessage.lifeBeneficiaryRelationshipEN){
						if(this.beneficaryRelation2.equals(item.getItemCode())){
							this.beneficaryRelationEnName2 = item.getItemDesc();
							break;
						}
					}
					for(OptionItemDesc item:InitApplicationMessage.lifeBeneficiaryRelationshipCN){
						if(this.beneficaryRelation2.equals(item.getItemCode())){
							this.beneficaryRelationCnName2 = item.getItemDesc();
							break;
						}
					}
				}
			}
			if(!"".equals(this.beneficaryFirstName3)){
				if(!"".equals(this.beneficaryRelation3)){
					for(OptionItemDesc item:InitApplicationMessage.lifeBeneficiaryRelationshipEN){
						if(this.beneficaryRelation3.equals(item.getItemCode())){
							this.beneficaryRelationEnName3 = item.getItemDesc();
							break;
						}
					}
					for(OptionItemDesc item:InitApplicationMessage.lifeBeneficiaryRelationshipCN){
						if(this.beneficaryRelation3.equals(item.getItemCode())){
							this.beneficaryRelationCnName3 = item.getItemDesc();
							break;
						}
					}
				}
			}
		}
		
		List<String> list = new ArrayList<String>();
		/*if(!this.isOwnEstate){
			if(ValidationUtils.isNullOrEmpty(this.beneficaryFirstName1)){
	        	list.add(ErrorMessageUtils.getMessage("beneficaryFirstName1", "validation.failure", language));
	        }
	        if(ValidationUtils.isNullOrEmpty(this.beneficaryLastName1)){
	        	list.add(ErrorMessageUtils.getMessage("beneficaryLastName1", "validation.failure", language));
	        }
	        if(ValidationUtils.isNullOrEmpty(this.beneficaryChineseName1)){
	        	list.add(ErrorMessageUtils.getMessage("beneficaryChineseName1", "validation.failure", language));
	        }
	        if(ValidationUtils.isNullOrEmpty(this.beneficaryID1)){
	        	list.add(ErrorMessageUtils.getMessage("beneficaryID1", "validation.failure", language));
	        }
	        if(ValidationUtils.isNullOrEmpty(this.beneficaryGender1)){
	        	list.add(ErrorMessageUtils.getMessage("beneficaryGender1", "validation.failure", language));
	        }
	        if(ValidationUtils.isNullOrEmpty(this.beneficaryRelation1)){
	        	list.add(ErrorMessageUtils.getMessage("beneficaryRelation1", "validation.failure", language));
	        }
	        if(ValidationUtils.isNullOrEmpty(this.beneficaryWeight1)){
	        	list.add(ErrorMessageUtils.getMessage("beneficaryWeight1", "validation.failure", language));
	        }
		}*/
		if (list.size() > 0) {
			throw new ValidateExceptions(list);
		}
	}

	public Boolean getIsOwnEstate() {
		return isOwnEstate;
	}

	public void setIsOwnEstate(Boolean isOwnEstate) {
		this.isOwnEstate = isOwnEstate;
	}

	public String getBeneficaryFirstName1() {
		return beneficaryFirstName1;
	}

	public void setBeneficaryFirstName1(String beneficaryFirstName1) {
		this.beneficaryFirstName1 = beneficaryFirstName1;
	}

	public String getBeneficaryLastName1() {
		return beneficaryLastName1;
	}

	public void setBeneficaryLastName1(String beneficaryLastName1) {
		this.beneficaryLastName1 = beneficaryLastName1;
	}

	public String getBeneficaryChineseName1() {
		return beneficaryChineseName1;
	}

	public void setBeneficaryChineseName1(String beneficaryChineseName1) {
		this.beneficaryChineseName1 = beneficaryChineseName1;
	}

	public String getBeneficaryID1() {
		return beneficaryID1;
	}

	public void setBeneficaryID1(String beneficaryID1) {
		this.beneficaryID1 = beneficaryID1;
	}

	public String getBeneficaryGender1() {
		return beneficaryGender1;
	}

	public void setBeneficaryGender1(String beneficaryGender1) {
		this.beneficaryGender1 = beneficaryGender1;
	}

	public String getBeneficaryRelation1() {
		return beneficaryRelation1;
	}

	public void setBeneficaryRelation1(String beneficaryRelation1) {
		this.beneficaryRelation1 = beneficaryRelation1;
	}

	public String getBeneficaryWeight1() {
		return beneficaryWeight1;
	}

	public void setBeneficaryWeight1(String beneficaryWeight1) {
		this.beneficaryWeight1 = beneficaryWeight1;
	}

	public String getBeneficaryFirstName2() {
		return beneficaryFirstName2;
	}

	public void setBeneficaryFirstName2(String beneficaryFirstName2) {
		this.beneficaryFirstName2 = beneficaryFirstName2;
	}

	public String getBeneficaryLastName2() {
		return beneficaryLastName2;
	}

	public void setBeneficaryLastName2(String beneficaryLastName2) {
		this.beneficaryLastName2 = beneficaryLastName2;
	}

	public String getBeneficaryChineseName2() {
		return beneficaryChineseName2;
	}

	public void setBeneficaryChineseName2(String beneficaryChineseName2) {
		this.beneficaryChineseName2 = beneficaryChineseName2;
	}

	public String getBeneficaryID2() {
		return beneficaryID2;
	}

	public void setBeneficaryID2(String beneficaryID2) {
		this.beneficaryID2 = beneficaryID2;
	}

	public String getBeneficaryGender2() {
		return beneficaryGender2;
	}

	public void setBeneficaryGender2(String beneficaryGender2) {
		this.beneficaryGender2 = beneficaryGender2;
	}

	public String getBeneficaryRelation2() {
		return beneficaryRelation2;
	}

	public void setBeneficaryRelation2(String beneficaryRelation2) {
		this.beneficaryRelation2 = beneficaryRelation2;
	}

	public String getBeneficaryWeight2() {
		return beneficaryWeight2;
	}

	public void setBeneficaryWeight2(String beneficaryWeight2) {
		this.beneficaryWeight2 = beneficaryWeight2;
	}

	public String getBeneficaryFirstName3() {
		return beneficaryFirstName3;
	}

	public void setBeneficaryFirstName3(String beneficaryFirstName3) {
		this.beneficaryFirstName3 = beneficaryFirstName3;
	}

	public String getBeneficaryLastName3() {
		return beneficaryLastName3;
	}

	public void setBeneficaryLastName3(String beneficaryLastName3) {
		this.beneficaryLastName3 = beneficaryLastName3;
	}

	public String getBeneficaryChineseName3() {
		return beneficaryChineseName3;
	}

	public void setBeneficaryChineseName3(String beneficaryChineseName3) {
		this.beneficaryChineseName3 = beneficaryChineseName3;
	}

	public String getBeneficaryID3() {
		return beneficaryID3;
	}

	public void setBeneficaryID3(String beneficaryID3) {
		this.beneficaryID3 = beneficaryID3;
	}

	public String getBeneficaryGender3() {
		return beneficaryGender3;
	}

	public void setBeneficaryGender3(String beneficaryGender3) {
		this.beneficaryGender3 = beneficaryGender3;
	}

	public String getBeneficaryRelation3() {
		return beneficaryRelation3;
	}

	public void setBeneficaryRelation3(String beneficaryRelation3) {
		this.beneficaryRelation3 = beneficaryRelation3;
	}

	public String getBeneficaryWeight3() {
		return beneficaryWeight3;
	}

	public void setBeneficaryWeight3(String beneficaryWeight3) {
		this.beneficaryWeight3 = beneficaryWeight3;
	}

	public String getBeneficiaryPassport1() {
		return beneficiaryPassport1;
	}

	public void setBeneficiaryPassport1(String beneficiaryPassport1) {
		this.beneficiaryPassport1 = beneficiaryPassport1;
	}

	public String getBeneficiaryPassport2() {
		return beneficiaryPassport2;
	}

	public void setBeneficiaryPassport2(String beneficiaryPassport2) {
		this.beneficiaryPassport2 = beneficiaryPassport2;
	}

	public String getBeneficiaryPassport3() {
		return beneficiaryPassport3;
	}

	public void setBeneficiaryPassport3(String beneficiaryPassport3) {
		this.beneficiaryPassport3 = beneficiaryPassport3;
	}

	

	public String getBeneficaryRelationEnName1() {
		return beneficaryRelationEnName1;
	}

	public void setBeneficaryRelationEnName1(String beneficaryRelationEnName1) {
		this.beneficaryRelationEnName1 = beneficaryRelationEnName1;
	}

	public String getBeneficaryRelationCnName1() {
		return beneficaryRelationCnName1;
	}

	public void setBeneficaryRelationCnName1(String beneficaryRelationCnName1) {
		this.beneficaryRelationCnName1 = beneficaryRelationCnName1;
	}

	public String getBeneficaryRelationEnName2() {
		return beneficaryRelationEnName2;
	}

	public void setBeneficaryRelationEnName2(String beneficaryRelationEnName2) {
		this.beneficaryRelationEnName2 = beneficaryRelationEnName2;
	}

	public String getBeneficaryRelationCnName2() {
		return beneficaryRelationCnName2;
	}

	public void setBeneficaryRelationCnName2(String beneficaryRelationCnName2) {
		this.beneficaryRelationCnName2 = beneficaryRelationCnName2;
	}

	public String getBeneficaryRelationEnName3() {
		return beneficaryRelationEnName3;
	}

	public void setBeneficaryRelationEnName3(String beneficaryRelationEnName3) {
		this.beneficaryRelationEnName3 = beneficaryRelationEnName3;
	}

	public String getBeneficaryRelationCnName3() {
		return beneficaryRelationCnName3;
	}

	public void setBeneficaryRelationCnName3(String beneficaryRelationCnName3) {
		this.beneficaryRelationCnName3 = beneficaryRelationCnName3;
	}

	public String getBeneficiaryHkidPassport1() {
		return beneficiaryHkidPassport1;
	}

	public void setBeneficiaryHkidPassport1(String beneficiaryHkidPassport1) {
		this.beneficiaryHkidPassport1 = beneficiaryHkidPassport1;
	}

	public String getBeneficiaryHkidPassport2() {
		return beneficiaryHkidPassport2;
	}

	public void setBeneficiaryHkidPassport2(String beneficiaryHkidPassport2) {
		this.beneficiaryHkidPassport2 = beneficiaryHkidPassport2;
	}

	public String getBeneficiaryHkidPassport3() {
		return beneficiaryHkidPassport3;
	}

	public void setBeneficiaryHkidPassport3(String beneficiaryHkidPassport3) {
		this.beneficiaryHkidPassport3 = beneficiaryHkidPassport3;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	
}
