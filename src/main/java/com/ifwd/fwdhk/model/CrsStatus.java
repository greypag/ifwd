package com.ifwd.fwdhk.model;

public class CrsStatus {
	String hkId;
	
	String placeOfBirth;
	
	String nationality;
	
	LifeAddress permanentAddress;
	
	LifeAddress residentialAddress;
	
	LifeAddress correspondenceAddress;

	public String getHkId() {
		return hkId;
	}

	public void setHkId(String hkId) {
		this.hkId = hkId;
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

	public LifeAddress getPermanentAddress() {
		return permanentAddress;
	}

	public void setPermanentAddress(LifeAddress permanentAddress) {
		this.permanentAddress = permanentAddress;
	}

	public LifeAddress getResidentialAddress() {
		return residentialAddress;
	}

	public void setResidentialAddress(LifeAddress residentialAddress) {
		this.residentialAddress = residentialAddress;
	}

	public LifeAddress getCorrespondenceAddress() {
		return correspondenceAddress;
	}

	public void setCorrespondenceAddress(LifeAddress correspondenceAddress) {
		this.correspondenceAddress = correspondenceAddress;
	}
	

	
	
}
