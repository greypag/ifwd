package com.ifwd.fwdhk.model;

public class TravelQuoteBean {
	
	private String trLeavingDate;
	private String trBackDate;
	private int totalTraveller;
	private boolean personalPlan ;
	private boolean familyPlan ;
	private int totalPersonalTraveller;
	private int totalAdultTraveller;
	private int totalChildTraveller;
	private int totalOtherTraveller;
	private int totalTravellingDays;
	private String planSelected;
	private boolean selfCover;
	private boolean spouseCover;
	
	
	
	public boolean isSelfCover() {
		return selfCover;
	}
	public void setSelfCover(boolean selfCover) {
		this.selfCover = selfCover;
	}
	public boolean isSpouseCover() {
		return spouseCover;
	}
	public void setSpouseCover(boolean spouseCover) {
		this.spouseCover = spouseCover;
	}
	public String getTrLeavingDate() {
		return trLeavingDate;
	}
	public String getPlanSelected() {
		return planSelected;
	}
	public void setPlanSelected(String planSelected) {
		this.planSelected = planSelected;
	}
	public void setTrLeavingDate(String trLeavingDate) {
		this.trLeavingDate = trLeavingDate;
	}
	public String getTrBackDate() {
		return trBackDate;
	}
	public void setTrBackDate(String trBackDate) {
		this.trBackDate = trBackDate;
	}
	public int getTotalTraveller() {
		return totalTraveller;
	}
	public void setTotalTraveller(int totalTraveller) {
		this.totalTraveller = totalTraveller;
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
	
	public int getTotalFamilyTravellers(){
		return totalAdultTraveller + totalChildTraveller + totalOtherTraveller;
	}
	
	public int getTotalTravellingDays() {
		return totalTravellingDays;
	}
	public void setTotalTravellingDays(int totalTravellingDays) {
		this.totalTravellingDays = totalTravellingDays;
	}
	
	
	
}
