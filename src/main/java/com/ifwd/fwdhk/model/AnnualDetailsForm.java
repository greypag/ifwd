package com.ifwd.fwdhk.model;

public class AnnualDetailsForm {

	private String planCode;
	private String returnDate;
	private int travellerCount;

	private int totalPersonalTraveller;
	private int totalAdultTraveller;
	private int totalChildTraveller;
	private int totalOtherTraveller;

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
	private String[] personalDob;
	private String[] personalBeneficiary;
	private String[] personalRelationDesc;
	private String[] personalBeneRelationDesc;
	private String[] personalBenificiaryHkid;
	private String[] personalBenificiaryFullName;
	private String[] selectedPersonalBenefitiaryHkidPass;

	private String[] adultName;
	private String[] selectedAdHkidPass;
	private String[] adultHKID;
	private String[] adultDob;
	private String[] adultBeneficiary;
	private String[] adultRelationDesc;
	private String[] adultBeneRelationDesc;
	private String[] adultBenificiaryHkid;
	private String[] adultBenificiaryFullName;
	private String[] selectedAdBenefitiaryHkidPass;
	
	private String[] childName;
	private String[] selectedChldHkidPass;
	private String[] childHKID;
	private String[] childDob;
	private String[] childBeneficiary;
	private String[] childRelationDesc;
	private String[] childBeneRelationDesc;
	private String[] otherBenificiaryHkid;
	private String[] otherBenificiaryFullName;
	private String[] selectedOtherBenefitiaryHkidPass;
	
	private String[] otherName;
	private String[] otherHKID;
	private String[] otherDob;
	private String[] otherBeneficiary;
	private String[] otherRelationDesc;
	private String[] otherBeneRelationDesc;
	private String[] childBenificiaryHkid;
	private String[] childBenificiaryFullName;
	private String[] selectedChldBenefitiaryHkidPass;
	
	private String selectedHkidPassApplicant;
	private String[] selectedPersonalHkidPass;

	private int days;
	
	private String applicantRoom;
	private String applicantFloor;
	private String applicantBlock;
	private String applicantBuilding;
	private String applicantEstate;
	private String applicantStreetNo;
	private String applicantStreetName;
	private String applicantDistrict;
	private String applicantDistrictDesc;
	private String applicantArea;
	private String applicantAreaDesc;

	public String[] getSelectedAdHkidPass() {
		return selectedAdHkidPass;
	}

	public void setSelectedAdHkidPass(String[] selectedAdHkidPass) {
		this.selectedAdHkidPass = selectedAdHkidPass;
	}

	public String[] getSelectedChldHkidPass() {
		return selectedChldHkidPass;
	}

	public void setSelectedChldHkidPass(String[] selectedChldHkidPass) {
		this.selectedChldHkidPass = selectedChldHkidPass;
	}

	public String[] getSelectedPersonalBenefitiaryHkidPass() {
		return selectedPersonalBenefitiaryHkidPass;
	}

	public void setSelectedPersonalBenefitiaryHkidPass(
			String[] selectedPersonalBenefitiaryHkidPass) {
		this.selectedPersonalBenefitiaryHkidPass = selectedPersonalBenefitiaryHkidPass;
	}

	public String[] getSelectedAdBenefitiaryHkidPass() {
		return selectedAdBenefitiaryHkidPass;
	}

	public void setSelectedAdBenefitiaryHkidPass(
			String[] selectedAdBenefitiaryHkidPass) {
		this.selectedAdBenefitiaryHkidPass = selectedAdBenefitiaryHkidPass;
	}

	public String[] getSelectedOtherBenefitiaryHkidPass() {
		return selectedOtherBenefitiaryHkidPass;
	}

	public void setSelectedOtherBenefitiaryHkidPass(
			String[] selectedOtherBenefitiaryHkidPass) {
		this.selectedOtherBenefitiaryHkidPass = selectedOtherBenefitiaryHkidPass;
	}

	public String[] getSelectedChldBenefitiaryHkidPass() {
		return selectedChldBenefitiaryHkidPass;
	}

	public void setSelectedChldBenefitiaryHkidPass(
			String[] selectedChldBenefitiaryHkidPass) {
		this.selectedChldBenefitiaryHkidPass = selectedChldBenefitiaryHkidPass;
	}

	public int getTotalAdultTraveller() {
		return totalAdultTraveller;
	}

	public void setTotalAdultTraveller(int totalAdultTraveller) {
		this.totalAdultTraveller = totalAdultTraveller;
	}

	public int getTotalChildTraveller() {
		return totalChildTraveller;
	}

	public void setTotalChildTraveller(int totalChildTraveller) {
		this.totalChildTraveller = totalChildTraveller;
	}

	public int getTotalOtherTraveller() {
		return totalOtherTraveller;
	}

	public void setTotalOtherTraveller(int totalOtherTraveller) {
		this.totalOtherTraveller = totalOtherTraveller;
	}

	public String[] getAdultName() {
		return adultName;
	}

	public void setAdultName(String[] adultName) {
		this.adultName = adultName;
	}

	public String[] getAdultHKID() {
		return adultHKID;
	}

	public void setAdultHKID(String[] adultHKID) {
		this.adultHKID = adultHKID;
	}

	public String[] getAdultDob() {
		return adultDob;
	}

	public void setAdultDob(String[] adultDob) {
		this.adultDob = adultDob;
	}

	public String[] getAdultBenificiaryHkid() {
		return adultBenificiaryHkid;
	}

	public void setAdultBenificiaryHkid(String[] adultBenificiaryHkid) {
		this.adultBenificiaryHkid = adultBenificiaryHkid;
	}

	public String[] getAdultBenificiaryFullName() {
		return adultBenificiaryFullName;
	}

	public void setAdultBenificiaryFullName(String[] adultBenificiaryFullName) {
		this.adultBenificiaryFullName = adultBenificiaryFullName;
	}

	public String[] getChildName() {
		return childName;
	}

	public void setChildName(String[] childName) {
		this.childName = childName;
	}

	public String[] getChildHKID() {
		return childHKID;
	}

	public void setChildHKID(String[] childHKID) {
		this.childHKID = childHKID;
	}

	public String[] getChildDob() {
		return childDob;
	}

	public void setChildDob(String[] childDob) {
		this.childDob = childDob;
	}

	public String[] getOtherBenificiaryHkid() {
		return otherBenificiaryHkid;
	}

	public void setOtherBenificiaryHkid(String[] otherBenificiaryHkid) {
		this.otherBenificiaryHkid = otherBenificiaryHkid;
	}

	public String[] getOtherBenificiaryFullName() {
		return otherBenificiaryFullName;
	}

	public void setOtherBenificiaryFullName(String[] otherBenificiaryFullName) {
		this.otherBenificiaryFullName = otherBenificiaryFullName;
	}

	public String[] getOtherHKID() {
		return otherHKID;
	}

	public void setOtherHKID(String[] otherHKID) {
		this.otherHKID = otherHKID;
	}

	public String[] getOtherDob() {
		return otherDob;
	}

	public void setOtherDob(String[] otherDob) {
		this.otherDob = otherDob;
	}

	public String[] getOtherBeneficiary() {
		return otherBeneficiary;
	}

	public void setOtherBeneficiary(String[] otherBeneficiary) {
		this.otherBeneficiary = otherBeneficiary;
	}

	public String[] getOtherRelationDesc() {
		return otherRelationDesc;
	}

	public void setOtherRelationDesc(String[] otherRelationDesc) {
		this.otherRelationDesc = otherRelationDesc;
	}

	public String[] getOtherBeneRelationDesc() {
		return otherBeneRelationDesc;
	}

	public void setOtherBeneRelationDesc(String[] otherBeneRelationDesc) {
		this.otherBeneRelationDesc = otherBeneRelationDesc;
	}

	public String[] getChildBenificiaryHkid() {
		return childBenificiaryHkid;
	}

	public void setChildBenificiaryHkid(String[] childBenificiaryHkid) {
		this.childBenificiaryHkid = childBenificiaryHkid;
	}

	public String[] getChildBenificiaryFullName() {
		return childBenificiaryFullName;
	}

	public void setChildBenificiaryFullName(String[] childBenificiaryFullName) {
		this.childBenificiaryFullName = childBenificiaryFullName;
	}

	public String getApplicantDistrictDesc() {
		return applicantDistrictDesc;
	}

	public void setApplicantDistrictDesc(String applicantDistrictDesc) {
		this.applicantDistrictDesc = applicantDistrictDesc;
	}

	public String getApplicantAreaDesc() {
		return applicantAreaDesc;
	}

	public void setApplicantAreaDesc(String applicantAreaDesc) {
		this.applicantAreaDesc = applicantAreaDesc;
	}

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
