package com.ifwd.fwdhk.model.evergreen;

import java.util.Date;

import com.ifwd.fwdhk.util.CommonEnum.GenderEnum;
import com.ifwd.fwdhk.util.CommonEnum.MaritalStatusEnum;




public class EvergreenApplicantBean {
	
	private String firstName;
	private String lastName;
	private String chineseName;
	private String hkId;
	private String passport;
	private GenderEnum gender; 
	private String maritalStatus;
	private String maritalStatusDesc;
	private Date birthday;
	private String placeOfBirth;
	private String placeOfBirthDesc;
	private String nationality;
	private String nationalityDesc;
	private String email;
	private String residentialTelNoCountryCode;
	private String residentialTelNo;
	
	private String mobileNoCountryCode;
	private String mobileNo;
	
	private String residentialAdress1;	
	private String residentialAdress2;	
	private String residentialAdress3;	
	private String residentialDistrict;
	private String residentialDistrictDesc;
	
	private String correspondenceAdress1;   
    private String correspondenceAdress2;   
    private String correspondenceAdress3;   
    private String correspondenceDistrict;
    private String correspondenceDistrictDesc;
    
    private String addressIsSame;
    
    
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getChineseName() {
		return chineseName;
	}
	public void setChineseName(String chineseName) {
		this.chineseName = chineseName;
	}
	public String getHkId() {
		return hkId;
	}
	public void setHkId(String hkId) {
		this.hkId = hkId;
	}
	public String getPassport() {
		return passport;
	}
	public void setPassport(String passport) {
		this.passport = passport;
	}
	public GenderEnum getGender() {
		return gender;
	}
	public void setGender(GenderEnum gender) {
		this.gender = gender;
	}
	
	public String getMaritalStatus() {
		return maritalStatus;
	}
	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getPlaceOfBirth() {
		return placeOfBirth;
	}
	public void setPlaceOfBirth(String placeOfBirth) {
		this.placeOfBirth = placeOfBirth;
	}
	public String getNationality() {
		return nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	public String getResidentialAdress1() {
		return residentialAdress1;
	}
	public void setResidentialAdress1(String residentialAdress1) {
		this.residentialAdress1 = residentialAdress1;
	}
	public String getResidentialAdress2() {
		return residentialAdress2;
	}
	public void setResidentialAdress2(String residentialAdress2) {
		this.residentialAdress2 = residentialAdress2;
	}
	public String getResidentialAdress3() {
		return residentialAdress3;
	}
	public void setResidentialAdress3(String residentialAdress3) {
		this.residentialAdress3 = residentialAdress3;
	}
	public String getResidentialDistrict() {
		return residentialDistrict;
	}
	public void setResidentialDistrict(String residentialDistrict) {
		this.residentialDistrict = residentialDistrict;
	}
	public String getCorrespondenceAdress1() {
		return correspondenceAdress1;
	}
	public void setCorrespondenceAdress1(String correspondenceAdress1) {
		this.correspondenceAdress1 = correspondenceAdress1;
	}
	public String getCorrespondenceAdress2() {
		return correspondenceAdress2;
	}
	public void setCorrespondenceAdress2(String correspondenceAdress2) {
		this.correspondenceAdress2 = correspondenceAdress2;
	}
	public String getCorrespondenceAdress3() {
		return correspondenceAdress3;
	}
	public void setCorrespondenceAdress3(String correspondenceAdress3) {
		this.correspondenceAdress3 = correspondenceAdress3;
	}
	public String getCorrespondenceDistrict() {
		return correspondenceDistrict;
	}
	public void setCorrespondenceDistrict(String correspondenceDistrict) {
		this.correspondenceDistrict = correspondenceDistrict;
	}
	public String getAddressIsSame() {
		return addressIsSame;
	}
	public void setAddressIsSame(String addressIsSame) {
		this.addressIsSame = addressIsSame;
	}
	public String getMaritalStatusDesc() {
		return maritalStatusDesc;
	}
	public void setMaritalStatusDesc(String maritalStatusDesc) {
		this.maritalStatusDesc = maritalStatusDesc;
	}
	public String getPlaceOfBirthDesc() {
		return placeOfBirthDesc;
	}
	public void setPlaceOfBirthDesc(String placeOfBirthDesc) {
		this.placeOfBirthDesc = placeOfBirthDesc;
	}
	public String getNationalityDesc() {
		return nationalityDesc;
	}
	public void setNationalityDesc(String nationalityDesc) {
		this.nationalityDesc = nationalityDesc;
	}
	public String getResidentialDistrictDesc() {
		return residentialDistrictDesc;
	}
	public void setResidentialDistrictDesc(String residentialDistrictDesc) {
		this.residentialDistrictDesc = residentialDistrictDesc;
	}
	public String getCorrespondenceDistrictDesc() {
		return correspondenceDistrictDesc;
	}
	public void setCorrespondenceDistrictDesc(String correspondenceDistrictDesc) {
		this.correspondenceDistrictDesc = correspondenceDistrictDesc;
	}
	
	
	
}
