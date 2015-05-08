package com.ifwd.fwdhk.model;

public class PlanDetailsForm {

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
	private String departureDate;
	private String planSelected;
	
	private String[] adultName;
	private String[] adultHKID;
	private String[] adultAgeRange;
	private String[] adultAgeRangeName;
	private String[] childName;

	private String[] childHKID;
	private String[] childAgeRange;
	private String[] childAgeRangeName;
	
	//	private AdultBeneficiary[] adultBeneficiary;
	private String[] childBeneficiary;
	private String[] adultBeneficiary;

	
	private String[] adultRelationDesc;	// adult - insured relationship desc
	private String[] adultBeneRelationDesc;	// adult - bene relationship desc of insured
	private String[] childRelationDesc;	// child - insured relationship desc
	private String[] childBeneRelationDesc;	// adult - bene relationship desc of insured
		

	private String[] adultBenificiaryHkid;
	private String[] otherBenificiaryHkid;
	private String[] childBenificiaryHkid;

	private String[] adultBenificiaryFullName;
	private String[] otherBenificiaryFullName;
	private String[] childBenificiaryFullName;
	//	private AdultBeneficiary[] adultBeneficiary;
	
	private String selectedHkidPassApplicant;
	private String[] selectedAdHkidPass;
	private String[] selectedAdBenefitiaryHkidPass;
	private String[] selectedChldHkidPass;
	private String[] selectedChldBenefitiaryHkidPass;
	private String[] selectedOtHkidPass;
	private String[] selectedOtherBenefitiaryHkidPass;


	private String[] otherName;
	
	
	public boolean getCheckbox1() {
		return checkbox1;
	}
	public String getSelectedHkidPassApplicant() {
		return selectedHkidPassApplicant;
	}
	public void setSelectedHkidPassApplicant(String selectedHkidPassApplicant) {
		this.selectedHkidPassApplicant = selectedHkidPassApplicant;
	}
	public String[] getSelectedAdHkidPass() {
		return selectedAdHkidPass;
	}
	public void setSelectedAdHkidPass(String[] selectedAdHkidPass) {
		this.selectedAdHkidPass = selectedAdHkidPass;
	}
	public String[] getSelectedAdBenefitiaryHkidPass() {
		return selectedAdBenefitiaryHkidPass;
	}
	public void setSelectedAdBenefitiaryHkidPass(
			String[] selectedAdBenefitiaryHkidPass) {
		this.selectedAdBenefitiaryHkidPass = selectedAdBenefitiaryHkidPass;
	}
	public String[] getSelectedChldHkidPass() {
		return selectedChldHkidPass;
	}
	public void setSelectedChldHkidPass(String[] selectedChldHkidPass) {
		this.selectedChldHkidPass = selectedChldHkidPass;
	}
	public String[] getSelectedChldBenefitiaryHkidPass() {
		return selectedChldBenefitiaryHkidPass;
	}
	public void setSelectedChldBenefitiaryHkidPass(
			String[] selectedChldBenefitiaryHkidPass) {
		this.selectedChldBenefitiaryHkidPass = selectedChldBenefitiaryHkidPass;
	}
	public String[] getSelectedOtHkidPass() {
		return selectedOtHkidPass;
	}
	public void setSelectedOtHkidPass(String[] selectedOtHkidPass) {
		this.selectedOtHkidPass = selectedOtHkidPass;
	}
	public String[] getSelectedOtherBenefitiaryHkidPass() {
		return selectedOtherBenefitiaryHkidPass;
	}
	public void setSelectedOtherBenefitiaryHkidPass(
			String[] selectedOtherBenefitiaryHkidPass) {
		this.selectedOtherBenefitiaryHkidPass = selectedOtherBenefitiaryHkidPass;
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


	public int getTotalOtherTraveller() {
		return totalOtherTraveller;
	}

	public void setTotalOtherTraveller(int totalOtherTraveller) {
		this.totalOtherTraveller = totalOtherTraveller;
	}

	public int getTotalChildTraveller() {
		return totalChildTraveller;
	}

	public void setTotalChildTraveller(int totalChildTraveller) {
		this.totalChildTraveller = totalChildTraveller;
	}

	private int days;


	public String[] getAdultBenificiaryHkid() {
		return adultBenificiaryHkid;
	}

	public void setAdultBenificiaryHkid(String[] adultBenificiaryHkid) {
		this.adultBenificiaryHkid = adultBenificiaryHkid;
	}

	public String[] getOtherBenificiaryHkid() {
		return otherBenificiaryHkid;
	}

	public void setOtherBenificiaryHkid(String[] otherBenificiaryHkid) {
		this.otherBenificiaryHkid = otherBenificiaryHkid;
	}

	public String[] getChildBenificiaryHkid() {
		return childBenificiaryHkid;
	}

	public void setChildBenificiaryHkid(String[] childBenificiaryHkid) {
		this.childBenificiaryHkid = childBenificiaryHkid;
	}

	public String[] getAdultBenificiaryFullName() {
		return adultBenificiaryFullName;
	}

	public void setAdultBenificiaryFullName(String[] adultBenificiaryFullName) {
		this.adultBenificiaryFullName = adultBenificiaryFullName;
	}

	public String[] getOtherBenificiaryFullName() {
		return otherBenificiaryFullName;
	}

	public void setOtherBenificiaryFullName(String[] otherBenificiaryFullName) {
		this.otherBenificiaryFullName = otherBenificiaryFullName;
	}

	public String[] getChildBenificiaryFullName() {
		return childBenificiaryFullName;
	}

	public void setChildBenificiaryFullName(String[] childBenificiaryFullName) {
		this.childBenificiaryFullName = childBenificiaryFullName;
	}

	public String[] getOtherName() {
		return otherName;
	}

	public void setOtherName(String[] otherName) {
		this.otherName = otherName;
	}

	public String[] getOtherHKID() {
		return otherHKID;
	}

	public void setOtherHKID(String[] otherHKID) {
		this.otherHKID = otherHKID;
	}

	public String[] getOtherAgeRange() {
		return otherAgeRange;
	}

	public void setOtherAgeRange(String[] otherAgeRange) {
		this.otherAgeRange = otherAgeRange;
	}

	public String[] getOtherBeneficiary() {
		return otherBeneficiary;
	}

	public void setOtherBeneficiary(String[] otherBeneficiary) {
		this.otherBeneficiary = otherBeneficiary;
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

	public String[] getChildAgeRange() {
		return childAgeRange;
	}

	public void setChildAgeRange(String[] childAgeRange) {
		this.childAgeRange = childAgeRange;
	}

	public String[] getChildBeneficiary() {
		return childBeneficiary;
	}

	public void setChildBeneficiary(String[] childBeneficiary) {
		this.childBeneficiary = childBeneficiary;
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

	public String[] getAdultAgeRange() {
		return adultAgeRange;
	}

	public void setAdultAgeRange(String[] adultAgeRange) {
		this.adultAgeRange = adultAgeRange;
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

	public int getTotalAdultTraveller() {
		return totalAdultTraveller;
	}

	public void setTotalAdultTraveller(int totalAdultTraveller) {
		this.totalAdultTraveller = totalAdultTraveller;
	}


	private String[] otherHKID;
	private String[] otherAgeRange;
	private String[] otherAgeRangeName;
	private String[] otherBeneficiary;
	private String[] otherRelationDesc;	// other - insured relationship desc
	private String[] otherBeneRelationDesc;	// other - bene relationship desc of insured

	public String[] getAdultAgeRangeName() {
		return adultAgeRangeName;
	}
	public void setAdultAgeRangeName(String[] adultAgeRangeName) {
		this.adultAgeRangeName = adultAgeRangeName;
	}
	public String[] getChildAgeRangeName() {
		return childAgeRangeName;
	}
	public void setChildAgeRangeName(String[] childAgeRangeName) {
		this.childAgeRangeName = childAgeRangeName;
	}
	public String[] getOtherAgeRangeName() {
		return otherAgeRangeName;
	}
	public void setOtherAgeRangeName(String[] otherAgeRangeName) {
		this.otherAgeRangeName = otherAgeRangeName;
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

}
