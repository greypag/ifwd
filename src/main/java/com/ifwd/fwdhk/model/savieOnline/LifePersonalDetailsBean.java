package com.ifwd.fwdhk.model.savieOnline;

import java.io.Serializable;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.ifwd.utils.ValidationExceptions;
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
	private String martialStatus;
	private String mobileNumber;
	private String emailAddress;
	private String placeOfBirth;
	private String nationalty;
	private String permanetAddress1;
	private String permanetAddress2;
	private String permanetAddress3;
	private String permanetAddressDistrict;
	private String residentialAddress1;
	private String residentialAddress2;
	private String residentialAddress3;
	private String residentialAddressDistrict;
	private String correspondenceAddress1;
	private String correspondenceAddress2;
	private String correspondenceAddress3;
	private String correspondenceAddressDistrict;
	
	public void validate(HttpServletRequest request) throws ValidationExceptions {
		ValidationUtils.validation("firstname","firstname", firstname, request);
		ValidationUtils.validation("lastname","lastname", lastname, request);
		ValidationUtils.validation("chineseName","chineseName", chineseName, request);
		ValidationUtils.validation("dob","dob", dob, request);
		ValidationUtils.validation("gender","gender", gender, request);
		ValidationUtils.validation("hkid","hkid", hkid, request);
		ValidationUtils.validation("martialStatus","martialStatus", martialStatus, request);
		ValidationUtils.validation("mobile","mobile", mobileNumber, request);
		ValidationUtils.validation("email","email", emailAddress, request);
		ValidationUtils.validation("placeOfBirth","placeOfBirth", placeOfBirth, request);
		ValidationUtils.validation("nationalty","nationalty", nationalty, request);
		ValidationUtils.sendMsg();
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
}
