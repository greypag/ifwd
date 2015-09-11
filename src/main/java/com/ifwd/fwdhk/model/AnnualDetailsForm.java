package com.ifwd.fwdhk.model;

public class AnnualDetailsForm {

	private String planCode;
	private String returnDate;
	private int travellerCount;

	private int totalPersonalTraveller;

	private String hkid;
	private String totalDue;
	private boolean checkbox1;
	private boolean checkbox2;
	private boolean checkbox3;
	private boolean checkbox4;

	private String departureDate;
	private String planSelected;

	private String[] personalName;
	private String[] personalHKID;
	private String[] personalAgeRange;
	private String[] personalAgeRangeName;
	private String[] personalDob;

	// private AdultBeneficiary[] adultBeneficiary;
	private String[] childBeneficiary;
	private String[] adultBeneficiary;
	private String[] personalBeneficiary;

	private String[] personalRelationDesc; // adult - insured relationship desc
	private String[] personalBeneRelationDesc; // adult - bene relationship desc
												// of insured

	private String[] adultRelationDesc; // adult - insured relationship desc
	private String[] adultBeneRelationDesc; // adult - bene relationship desc of
											// insured
	private String[] childRelationDesc; // child - insured relationship desc
	private String[] childBeneRelationDesc; // adult - bene relationship desc of
											// insured

	private String[] personalBenificiaryHkid;

	private String[] personalBenificiaryFullName;
	// private AdultBeneficiary[] adultBeneficiary;

	private String selectedHkidPassApplicant;
	private String[] selectedPersonalHkidPass;

	private String[] otherName;
	private int days;
	
	private String applicantRoom;
	private String applicantFloor;
	private String applicantBlock;
	private String applicantBuilding;
	private String applicantEstate;
	private String applicantStreetNo;
	private String applicantStreetName;
	private String applicantDistrict;
	private String applicantArea;

	public String[] getPersonalDob() {
		return personalDob;
	}

	public void setPersonalDob(String[] personalDob) {
		this.personalDob = personalDob;
	}

	public String getApplicantArea() {
		return applicantArea;
	}

	public void setApplicantArea(String applicantArea) {
		this.applicantArea = applicantArea;
	}

	public String getApplicantRoom() {
		return applicantRoom;
	}

	public void setApplicantRoom(String applicantRoom) {
		this.applicantRoom = applicantRoom;
	}

	public String getApplicantFloor() {
		return applicantFloor;
	}

	public void setApplicantFloor(String applicantFloor) {
		this.applicantFloor = applicantFloor;
	}

	public String getApplicantBlock() {
		return applicantBlock;
	}

	public void setApplicantBlock(String applicantBlock) {
		this.applicantBlock = applicantBlock;
	}

	public String getApplicantBuilding() {
		return applicantBuilding;
	}

	public void setApplicantBuilding(String applicantBuilding) {
		this.applicantBuilding = applicantBuilding;
	}

	public String getApplicantEstate() {
		return applicantEstate;
	}

	public void setApplicantEstate(String applicantEstate) {
		this.applicantEstate = applicantEstate;
	}

	public String getApplicantStreetNo() {
		return applicantStreetNo;
	}

	public void setApplicantStreetNo(String applicantStreetNo) {
		this.applicantStreetNo = applicantStreetNo;
	}

	public String getApplicantStreetName() {
		return applicantStreetName;
	}

	public void setApplicantStreetName(String applicantStreetName) {
		this.applicantStreetName = applicantStreetName;
	}

	public String getApplicantDistrict() {
		return applicantDistrict;
	}

	public void setApplicantDistrict(String applicantDistrict) {
		this.applicantDistrict = applicantDistrict;
	}

	public boolean getCheckbox3() {
		return checkbox3;
	}

	public void setCheckbox3(boolean checkbox3) {
		this.checkbox3 = checkbox3;
	}

	public boolean getCheckbox4() {
		return checkbox4;
	}

	public void setCheckbox4(boolean checkbox4) {
		this.checkbox4 = checkbox4;
	}

	public boolean getCheckbox1() {
		return checkbox1;
	}

	public String getSelectedHkidPassApplicant() {
		return selectedHkidPassApplicant;
	}

	public void setSelectedHkidPassApplicant(String selectedHkidPassApplicant) {
		this.selectedHkidPassApplicant = selectedHkidPassApplicant;
	}

	public String[] getSelectedPersonalHkidPass() {
		return selectedPersonalHkidPass;
	}

	public void setSelectedPersonalHkidPass(String[] selectedPersonalHkidPass) {
		this.selectedPersonalHkidPass = selectedPersonalHkidPass;
	}

	public String getDepartureDate() {
		return departureDate;
	}

	public void setDepartureDate(String departureDate) {
		this.departureDate = departureDate;
	}

	public String getTotalDue() {
		return totalDue;
	}

	public String getPlanSelected() {
		return planSelected;
	}

	public void setPlanSelected(String planSelected) {
		this.planSelected = planSelected;
	}

	public void setTotalDue(String totalDue) {
		this.totalDue = totalDue;
	}

	public void setCheckbox1(boolean checkbox1) {
		this.checkbox1 = checkbox1;
	}

	public boolean getCheckbox2() {
		return checkbox2;
	}

	public void setCheckbox2(boolean checkbox2) {
		this.checkbox2 = checkbox2;
	}

	public String getHkid() {
		return hkid;
	}

	public void setHkid(String hkid) {
		this.hkid = hkid;
	}

	public String[] getPersonalBenificiaryHkid() {
		return personalBenificiaryHkid;
	}

	public void setPersonalBenificiaryHkid(String[] personalBenificiaryHkid) {
		this.personalBenificiaryHkid = personalBenificiaryHkid;
	}

	public String[] getPersonalBenificiaryFullName() {
		return personalBenificiaryFullName;
	}

	public void setPersonalBenificiaryFullName(
			String[] personalBenificiaryFullName) {
		this.personalBenificiaryFullName = personalBenificiaryFullName;
	}

	public String[] getOtherName() {
		return otherName;
	}

	public void setOtherName(String[] otherName) {
		this.otherName = otherName;
	}

	public String[] getChildBeneficiary() {
		return childBeneficiary;
	}

	public void setChildBeneficiary(String[] childBeneficiary) {
		this.childBeneficiary = childBeneficiary;
	}

	public String[] getPersonalName() {
		return personalName;
	}

	public void setPersonalName(String[] personalName) {
		this.personalName = personalName;
	}

	public String[] getPersonalHKID() {
		return personalHKID;
	}

	public void setPersonalHKID(String[] personalHKID) {
		this.personalHKID = personalHKID;
	}

	public String[] getPersonalAgeRange() {
		return personalAgeRange;
	}

	public void setPersonalAgeRange(String[] personalAgeRange) {
		this.personalAgeRange = personalAgeRange;
	}

	public String[] getPersonalBeneficiary() {
		return personalBeneficiary;
	}

	public void setPersonalBeneficiary(String[] personalBeneficiary) {
		this.personalBeneficiary = personalBeneficiary;
	}

	public String[] getAdultBeneficiary() {
		return adultBeneficiary;
	}

	public void setAdultBeneficiary(String[] adultBeneficiary) {
		this.adultBeneficiary = adultBeneficiary;
	}

	public String getPlanCode() {
		return planCode;
	}

	public void setPlanCode(String planCode) {
		this.planCode = planCode;
	}

	public String getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
	}

	public int getTravellerCount() {
		return travellerCount;
	}

	public void setTravellerCount(int travellerCount) {
		this.travellerCount = travellerCount;
	}

	public int getDays() {
		return days;
	}

	public void setDays(int days) {
		this.days = days;
	}

	public int getTotalPersonalTraveller() {
		return totalPersonalTraveller;
	}

	public void setTotalPersonalTraveller(int totalPersonalTraveller) {
		this.totalPersonalTraveller = totalPersonalTraveller;
	}

	public String[] getPersonalAgeRangeName() {
		return personalAgeRangeName;
	}

	public void setPersonalAgeRangeName(String[] personalAgeRangeName) {
		this.personalAgeRangeName = personalAgeRangeName;
	}

	public String[] getPersonalRelationDesc() {
		return personalRelationDesc;
	}

	public void setPersonalRelationDesc(String[] personalRelationDesc) {
		this.personalRelationDesc = personalRelationDesc;
	}

	public String[] getPersonalBeneRelationDesc() {
		return personalBeneRelationDesc;
	}

	public void setPersonalBeneRelationDesc(String[] personalBeneRelationDesc) {
		this.personalBeneRelationDesc = personalBeneRelationDesc;
	}

	public String[] getAdultRelationDesc() {
		return adultRelationDesc;
	}

	public void setAdultRelationDesc(String[] adultRelationDesc) {
		this.adultRelationDesc = adultRelationDesc;
	}

	public String[] getAdultBeneRelationDesc() {
		return adultBeneRelationDesc;
	}

	public void setAdultBeneRelationDesc(String[] adultBeneRelationDesc) {
		this.adultBeneRelationDesc = adultBeneRelationDesc;
	}

	public String[] getChildRelationDesc() {
		return childRelationDesc;
	}

	public void setChildRelationDesc(String[] childRelationDesc) {
		this.childRelationDesc = childRelationDesc;
	}

	public String[] getChildBeneRelationDesc() {
		return childBeneRelationDesc;
	}

	public void setChildBeneRelationDesc(String[] childBeneRelationDesc) {
		this.childBeneRelationDesc = childBeneRelationDesc;
	}
}
