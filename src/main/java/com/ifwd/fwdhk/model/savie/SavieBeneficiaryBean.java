package com.ifwd.fwdhk.model.savie;

import com.ifwd.fwdhk.util.CommonEnum.GenderEnum;


public class SavieBeneficiaryBean {
	
	private String ownEstate;
	private String firstName;
	private String lastName;
	private String chineseName;
	private String hkId; 
	private String passport;
	private GenderEnum gender;  
	private String relationship; 
	private float entitlement;
	
	public String getOwnEstate() {
		return ownEstate;
	}
	public void setOwnEstate(String ownEstate) {
		this.ownEstate = ownEstate;
	}
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
	public String getRelationship() {
		return relationship;
	}
	public void setRelationship(String relationship) {
		this.relationship = relationship;
	}
	public float getEntitlement() {
		return entitlement;
	}
	public void setEntitlement(float entitlement) {
		this.entitlement = entitlement;
	} 
	
	
	
	
	
	

}
