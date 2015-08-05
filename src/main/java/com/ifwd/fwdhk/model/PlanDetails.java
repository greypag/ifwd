package com.ifwd.fwdhk.model;

import java.util.HashSet;
import java.util.Set;

public class PlanDetails {
	private String planCode;
	private String returnDate;
	private int travellerCount;
	private int days;
	private Set childDetail = new HashSet();
	private Set otherDetail = new HashSet();
	private boolean familyPlan;
	private int totalPersonalTraveller;
	private int totalAdultTraveller;
	private int totalChildTraveller;
	private int totalOtherTraveller;
	private int totalTravellingDays;
	private String hkid;
	private String planSelected;  //THIS IS THE PERSONAL OR FAMILY PLAN
	private String fullName;
	private String beneficiaryFullName;
	private FlightQuoteDetails flightQuoteDetails;
	private String totalDue;
	String departureDate;

	private boolean personalPlan;
	private String referralCode;
	private Set adultDetail = new HashSet();

	
	
	
	
	public String getReferralCode() {
		return referralCode;
	}

	public void setReferralCode(String referralCode) {
		this.referralCode = referralCode;
	}

	public FlightQuoteDetails getFlightQuoteDetails() {
		return flightQuoteDetails;
	}

	public String getTotalDue() {
		return totalDue;
	}

	public void setTotalDue(String totalDue) {
		this.totalDue = totalDue;
	}

	public void setFlightQuoteDetails(FlightQuoteDetails flightQuoteDetails) {
		this.flightQuoteDetails = flightQuoteDetails;
	}

	public Set getAdultDetail() {
		return adultDetail;
	}

	public void setAdultDetail(Set adultDetail) {
		this.adultDetail = adultDetail;
	}

	public Set getChildDetail() {
		return childDetail;
	}

	public void setChildDetail(Set childDetail) {
		this.childDetail = childDetail;
	}

	public Set getOtherDetail() {
		return otherDetail;
	}

	public void setOtherDetail(Set otherDetail) {
		this.otherDetail = otherDetail;
	}

	

	public boolean isPersonalPlan() {
		return personalPlan;
	}

	public void setPersonalPlan(boolean personalPlan) {
		this.personalPlan = personalPlan;
	}

	public boolean isFamilyPlan() {
		return familyPlan;
	}

	public void setFamilyPlan(boolean familyPlan) {
		this.familyPlan = familyPlan;
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

	public int getTotalTravellingDays() {
		return totalTravellingDays;
	}

	public void setTotalTravellingDays(int totalTravellingDays) {
		this.totalTravellingDays = totalTravellingDays;
	}

	public int getDays() {
		return days;
	}

	public void setDays(int days) {
		this.days = days;
	}

	public int getTravellerCount() {
		return travellerCount;
	}

	public void setTravellerCount(int travellerCount) {
		this.travellerCount = travellerCount;
	}

	public int getTotalFamilyTravellers(){
		return totalAdultTraveller + totalChildTraveller + totalOtherTraveller;
	}
	
	
	public String getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
	}

	public String getDepartureDate() {
		return departureDate;
	}

	public void setDepartureDate(String departureDate) {
		this.departureDate = departureDate;
	}

	public String getPlanCode() {
		return planCode;
	}

	public void setPlanCode(String planCode) {
		this.planCode = planCode;
	}

	public String getHkid() {
		return hkid;
	}

	public void setHkid(String hkid) {
		this.hkid = hkid;
	}

	public String getPlanSelected() {
		return planSelected;
	}

	public void setPlanSelected(String planSelected) {
		this.planSelected = planSelected;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getBeneficiaryFullName() {
		return beneficiaryFullName;
	}

	public void setBeneficiaryFullName(String beneficiaryFullName) {
		this.beneficiaryFullName = beneficiaryFullName;
	}

}
