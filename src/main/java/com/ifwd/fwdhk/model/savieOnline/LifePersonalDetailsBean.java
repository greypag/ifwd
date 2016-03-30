package com.ifwd.fwdhk.model.savieOnline;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ifwd.fwdhk.exception.ValidateExceptions;
import com.ifwd.fwdhk.model.OptionItemDesc;
import com.ifwd.fwdhk.util.InitApplicationMessage;
import com.ifwd.utils.ErrorMessageUtils;
import com.ifwd.utils.ValidationUtils;

public class LifePersonalDetailsBean implements Serializable {
	private final static Logger logger = LoggerFactory.getLogger(LifePersonalDetailsBean.class);
	private static final long serialVersionUID = 1L;

	private String firstname;
	private String lastname;
	private String chineseName;
	private String dob;
	private String gender;
	private String hkid;
	private String passport;
	private String martialStatus;
	private String martialStatusEnName;
	private String martialStatusCnName;
	private String residentialTelNoCountryCode;
	private String residentialTelNo;
	private String mobileNoCountryCode;
	private String mobileNumber;
	private String emailAddress;
	private String placeOfBirth;
	private String placeOfBirthEnName;
	private String placeOfBirthCnName;
	private String nationalty;
	private String nationaltyEnName;
	private String nationaltyCnName;
	private String permanetAddress1;
	private String permanetAddress2;
	private String permanetAddress3;
	private String permanetAddress4;
	private String permanetAddressDistrict;
	private String permanetAddressDistrictEnName;
	private String permanetAddressDistrictCnName;
	private String diffToPermanent;
	private String residentialAddress1;
	private String residentialAddress2;
	private String residentialAddress3;
	private String residentialAddress4;
	private String residentialAddressDistrict;
	private String residentialAddressDistrictEnName;
	private String residentialAddressDistrictCnName;
	private String diffToResidential;
	private String correspondenceAddress1;
	private String correspondenceAddress2;
	private String correspondenceAddress3;
	private String correspondenceAddress4;
	private String correspondenceAddressDistrict;
	private String correspondenceAddressDistrictEnName;
	private String correspondenceAddressDistrictCnName;
	private String type;
	
	public void validate(String language) throws ValidateExceptions {
		if(this.martialStatus!=null && !"".equals(this.martialStatus)){
			for(OptionItemDesc item:InitApplicationMessage.maritalStatusesEN){
				if(this.martialStatus.equals(item.getItemCode())){
					this.martialStatusEnName = item.getItemDesc();
					break;
				}
			}
			for(OptionItemDesc item:InitApplicationMessage.maritalStatusesCN){
				if(this.martialStatus.equals(item.getItemCode())){
					this.martialStatusCnName = item.getItemDesc();
					break;
				}
			}
		}
		if(this.placeOfBirth!=null && !"".equals(this.placeOfBirth)){
			for(OptionItemDesc item:InitApplicationMessage.placeOfBirthEN){
				if(this.placeOfBirth.equals(item.getItemCode())){
					this.placeOfBirthEnName = item.getItemDesc();
					break;
				}
			}
			for(OptionItemDesc item:InitApplicationMessage.placeOfBirthCN){
				if(this.placeOfBirth.equals(item.getItemCode())){
					this.placeOfBirthCnName = item.getItemDesc();
					break;
				}
			}
		}
		if(this.nationalty!=null && !"".equals(this.nationalty)){
			for(OptionItemDesc item:InitApplicationMessage.nationalityEN){
				if(this.nationalty.equals(item.getItemCode())){
					this.nationaltyEnName = item.getItemDesc();
					break;
				}
			}
			for(OptionItemDesc item:InitApplicationMessage.nationalityCN){
				if(this.nationalty.equals(item.getItemCode())){
					this.nationaltyCnName = item.getItemDesc();
					break;
				}
			}
		}
		if(this.permanetAddressDistrict!=null && !"".equals(this.permanetAddressDistrict)){
			for(OptionItemDesc item:InitApplicationMessage.savieDistrictEN){
				if(this.permanetAddressDistrict.equals(item.getItemCode())){
					this.permanetAddressDistrictEnName = item.getItemDesc();
					break;
				}
			}
			for(OptionItemDesc item:InitApplicationMessage.savieDistrictCN){
				if(this.permanetAddressDistrict.equals(item.getItemCode())){
					this.permanetAddressDistrictCnName = item.getItemDesc();
					break;
				}
			}
		}
		if(!"None".equals(this.diffToPermanent)){
			this.residentialAddress1 = this.permanetAddress1;
			this.residentialAddress2 = this.permanetAddress2;
			this.residentialAddress3 = this.permanetAddress3;
			this.residentialAddress4 = this.permanetAddress4;
			this.residentialAddressDistrict = this.permanetAddressDistrict;
		}
		if(!"None".equals(this.diffToResidential)){
			this.correspondenceAddress1 = this.residentialAddress1;
			this.correspondenceAddress2 = this.residentialAddress2;
			this.correspondenceAddress3 = this.residentialAddress3;
			this.correspondenceAddress4 = this.residentialAddress4;
			this.correspondenceAddressDistrict = this.residentialAddressDistrict;
		}
		if(this.residentialAddressDistrict!=null && !"".equals(this.residentialAddressDistrict)){
			for(OptionItemDesc item:InitApplicationMessage.savieDistrictEN){
				if(this.residentialAddressDistrict.equals(item.getItemCode())){
					this.residentialAddressDistrictEnName = item.getItemDesc();
					break;
				}
			}
			for(OptionItemDesc item:InitApplicationMessage.savieDistrictCN){
				if(this.residentialAddressDistrict.equals(item.getItemCode())){
					this.residentialAddressDistrictCnName = item.getItemDesc();
					break;
				}
			}
		}
		if(this.correspondenceAddressDistrict!=null && !"".equals(this.correspondenceAddressDistrict)){
			for(OptionItemDesc item:InitApplicationMessage.savieDistrictEN){
				if(this.correspondenceAddressDistrict.equals(item.getItemCode())){
					this.correspondenceAddressDistrictEnName = item.getItemDesc();
					break;
				}
			}
			for(OptionItemDesc item:InitApplicationMessage.savieDistrictCN){
				if(this.correspondenceAddressDistrict.equals(item.getItemCode())){
					this.correspondenceAddressDistrictCnName = item.getItemDesc();
					break;
				}
			}
		}
		
		List<String> list = new ArrayList<String>();
        /*if(ValidationUtils.isNullOrEmpty(this.firstname)){
        	list.add(ErrorMessageUtils.getMessage("firstname", "validation.failure", language));
        }
        if(ValidationUtils.isNullOrEmpty(this.lastname)){
        	list.add(ErrorMessageUtils.getMessage("lastname", "validation.failure", language));
        }
        if(ValidationUtils.isNullOrEmpty(this.chineseName)){
        	list.add(ErrorMessageUtils.getMessage("chineseName", "validation.failure", language));
        }
        if(!ValidationUtils.isNullOrEmpty(this.dob)){
        	list.add(ErrorMessageUtils.getMessage("dob", "validation.failure", language));
        }
        if(ValidationUtils.isNullOrEmpty(this.gender)){
        	list.add(ErrorMessageUtils.getMessage("gender", "validation.failure", language));
        }
        if(!ValidationUtils.isHkid(this.hkid)){
        	list.add(ErrorMessageUtils.getMessage("hkid", "validation.failure", language));
        }
        if(ValidationUtils.isNullOrEmpty(this.martialStatus)){
        	list.add(ErrorMessageUtils.getMessage("martialStatus", "validation.failure", language));
        }
        if(!ValidationUtils.isMobile(this.mobileNumber)){
        	list.add(ErrorMessageUtils.getMessage("mobileNumber", "validation.failure", language));
        }
        if(!ValidationUtils.isEmail(this.emailAddress)){
        	list.add(ErrorMessageUtils.getMessage("emailAddress", "validation.failure", language));
        }
        if(ValidationUtils.isNullOrEmpty(this.placeOfBirth)){
        	list.add(ErrorMessageUtils.getMessage("placeOfBirth", "validation.failure", language));
        }
        if(ValidationUtils.isNullOrEmpty(this.nationalty)){
        	list.add(ErrorMessageUtils.getMessage("nationalty", "validation.failure", language));
        }*/
		if (list.size() > 0) {
			throw new ValidateExceptions(list);
		}
	}
	
	public String getFirstname() {
		return firstname;
	}



	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}



	public String getLastname() {
		return lastname;
	}



	public void setLastname(String lastname) {
		this.lastname = lastname;
	}



	public String getChineseName() {
		return chineseName;
	}



	public void setChineseName(String chineseName) {
		this.chineseName = chineseName;
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



	public String getHkid() {
		return hkid;
	}



	public void setHkid(String hkid) {
		this.hkid = hkid;
	}



	public String getMartialStatus() {
		return martialStatus;
	}



	public void setMartialStatus(String martialStatus) {
		this.martialStatus = martialStatus;
	}



	public String getMobileNumber() {
		return mobileNumber;
	}



	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}



	public String getEmailAddress() {
		return emailAddress;
	}



	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}



	public String getPlaceOfBirth() {
		return placeOfBirth;
	}



	public void setPlaceOfBirth(String placeOfBirth) {
		this.placeOfBirth = placeOfBirth;
	}



	public String getNationalty() {
		return nationalty;
	}



	public void setNationalty(String nationalty) {
		this.nationalty = nationalty;
	}



	public String getPermanetAddress1() {
		return permanetAddress1;
	}



	public void setPermanetAddress1(String permanetAddress1) {
		this.permanetAddress1 = permanetAddress1;
	}



	public String getPermanetAddress2() {
		return permanetAddress2;
	}



	public void setPermanetAddress2(String permanetAddress2) {
		this.permanetAddress2 = permanetAddress2;
	}



	public String getPermanetAddress3() {
		return permanetAddress3;
	}



	public void setPermanetAddress3(String permanetAddress3) {
		this.permanetAddress3 = permanetAddress3;
	}



	public String getPermanetAddressDistrict() {
		return permanetAddressDistrict;
	}



	public void setPermanetAddressDistrict(String permanetAddressDistrict) {
		this.permanetAddressDistrict = permanetAddressDistrict;
	}



	public String getResidentialAddress1() {
		return residentialAddress1;
	}



	public void setResidentialAddress1(String residentialAddress1) {
		this.residentialAddress1 = residentialAddress1;
	}



	public String getResidentialAddress2() {
		return residentialAddress2;
	}



	public void setResidentialAddress2(String residentialAddress2) {
		this.residentialAddress2 = residentialAddress2;
	}



	public String getResidentialAddress3() {
		return residentialAddress3;
	}



	public void setResidentialAddress3(String residentialAddress3) {
		this.residentialAddress3 = residentialAddress3;
	}



	public String getResidentialAddressDistrict() {
		return residentialAddressDistrict;
	}



	public void setResidentialAddressDistrict(String residentialAddressDistrict) {
		this.residentialAddressDistrict = residentialAddressDistrict;
	}



	public String getCorrespondenceAddress1() {
		return correspondenceAddress1;
	}



	public void setCorrespondenceAddress1(String correspondenceAddress1) {
		this.correspondenceAddress1 = correspondenceAddress1;
	}



	public String getCorrespondenceAddress2() {
		return correspondenceAddress2;
	}



	public void setCorrespondenceAddress2(String correspondenceAddress2) {
		this.correspondenceAddress2 = correspondenceAddress2;
	}



	public String getCorrespondenceAddress3() {
		return correspondenceAddress3;
	}



	public void setCorrespondenceAddress3(String correspondenceAddress3) {
		this.correspondenceAddress3 = correspondenceAddress3;
	}



	public String getCorrespondenceAddressDistrict() {
		return correspondenceAddressDistrict;
	}



	public void setCorrespondenceAddressDistrict(
			String correspondenceAddressDistrict) {
		this.correspondenceAddressDistrict = correspondenceAddressDistrict;
	}

	public String getPassport() {
		return passport;
	}

	public void setPassport(String passport) {
		this.passport = passport;
	}

	public String getResidentialTelNoCountryCode() {
		return residentialTelNoCountryCode;
	}

	public void setResidentialTelNoCountryCode(String residentialTelNoCountryCode) {
		this.residentialTelNoCountryCode = residentialTelNoCountryCode;
	}

	public String getResidentialTelNo() {
		return residentialTelNo;
	}

	public void setResidentialTelNo(String residentialTelNo) {
		this.residentialTelNo = residentialTelNo;
	}

	public String getMobileNoCountryCode() {
		return mobileNoCountryCode;
	}

	public void setMobileNoCountryCode(String mobileNoCountryCode) {
		this.mobileNoCountryCode = mobileNoCountryCode;
	}

	public String getPermanetAddress4() {
		return permanetAddress4;
	}

	public void setPermanetAddress4(String permanetAddress4) {
		this.permanetAddress4 = permanetAddress4;
	}

	public String getResidentialAddress4() {
		return residentialAddress4;
	}

	public void setResidentialAddress4(String residentialAddress4) {
		this.residentialAddress4 = residentialAddress4;
	}

	public String getCorrespondenceAddress4() {
		return correspondenceAddress4;
	}

	public void setCorrespondenceAddress4(String correspondenceAddress4) {
		this.correspondenceAddress4 = correspondenceAddress4;
	}

	public String getDiffToPermanent() {
		return diffToPermanent;
	}

	public void setDiffToPermanent(String diffToPermanent) {
		this.diffToPermanent = diffToPermanent;
	}

	public String getDiffToResidential() {
		return diffToResidential;
	}

	public void setDiffToResidential(String diffToResidential) {
		this.diffToResidential = diffToResidential;
	}

	

	public String getMartialStatusEnName() {
		return martialStatusEnName;
	}

	public void setMartialStatusEnName(String martialStatusEnName) {
		this.martialStatusEnName = martialStatusEnName;
	}

	public String getMartialStatusCnName() {
		return martialStatusCnName;
	}

	public void setMartialStatusCnName(String martialStatusCnName) {
		this.martialStatusCnName = martialStatusCnName;
	}

	

	public String getPlaceOfBirthEnName() {
		return placeOfBirthEnName;
	}

	public void setPlaceOfBirthEnName(String placeOfBirthEnName) {
		this.placeOfBirthEnName = placeOfBirthEnName;
	}

	public String getPlaceOfBirthCnName() {
		return placeOfBirthCnName;
	}

	public void setPlaceOfBirthCnName(String placeOfBirthCnName) {
		this.placeOfBirthCnName = placeOfBirthCnName;
	}

	public String getNationaltyEnName() {
		return nationaltyEnName;
	}

	public void setNationaltyEnName(String nationaltyEnName) {
		this.nationaltyEnName = nationaltyEnName;
	}

	public String getNationaltyCnName() {
		return nationaltyCnName;
	}

	public void setNationaltyCnName(String nationaltyCnName) {
		this.nationaltyCnName = nationaltyCnName;
	}

	public String getPermanetAddressDistrictEnName() {
		return permanetAddressDistrictEnName;
	}

	public void setPermanetAddressDistrictEnName(
			String permanetAddressDistrictEnName) {
		this.permanetAddressDistrictEnName = permanetAddressDistrictEnName;
	}

	public String getPermanetAddressDistrictCnName() {
		return permanetAddressDistrictCnName;
	}

	public void setPermanetAddressDistrictCnName(
			String permanetAddressDistrictCnName) {
		this.permanetAddressDistrictCnName = permanetAddressDistrictCnName;
	}

	public String getResidentialAddressDistrictEnName() {
		return residentialAddressDistrictEnName;
	}

	public void setResidentialAddressDistrictEnName(
			String residentialAddressDistrictEnName) {
		this.residentialAddressDistrictEnName = residentialAddressDistrictEnName;
	}

	public String getResidentialAddressDistrictCnName() {
		return residentialAddressDistrictCnName;
	}

	public void setResidentialAddressDistrictCnName(
			String residentialAddressDistrictCnName) {
		this.residentialAddressDistrictCnName = residentialAddressDistrictCnName;
	}

	public String getCorrespondenceAddressDistrictEnName() {
		return correspondenceAddressDistrictEnName;
	}

	public void setCorrespondenceAddressDistrictEnName(
			String correspondenceAddressDistrictEnName) {
		this.correspondenceAddressDistrictEnName = correspondenceAddressDistrictEnName;
	}

	public String getCorrespondenceAddressDistrictCnName() {
		return correspondenceAddressDistrictCnName;
	}

	public void setCorrespondenceAddressDistrictCnName(
			String correspondenceAddressDistrictCnName) {
		this.correspondenceAddressDistrictCnName = correspondenceAddressDistrictCnName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
}
