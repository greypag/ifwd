package com.ifwd.fwdhk.model.motor;

public class QuoteMotorCare {
	private long id;

	
	private QuoteDriver quoteDriver;
	private String planCode;
	private String compPlan;
	private String grossPremium;
	private String discountAmount;
	private boolean personalAccident;
	private boolean thirdPartyPropertyDamage;	
	private String addOnPaAmt;	
	private String addOnTppdAmt;		
	private String addOnPaBenefit;
	private String addOnTppdIncrease;
	private String policyId;
	private String refNumber;
	private String amtFromThirdPartyToCompSilver;
	private String amtFromThirdPartyToCompGold;
	private String compInsuranceAmount;
	private String personalAccidentAmount;
	private String subTotalAmount;
	private String amountDueAmount;
	private String ownDamageExcess;
	private String theftExcess;
	private String unnamedDriverExcess;
	private String youngDriverExcess;
	private String inexperiencedDriverExcess;
	private String tPPDExcess;
	private String parkingExcess;
	private String promoCode;
	
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public QuoteDriver getQuoteDriver() {
		return quoteDriver;
	}
	
	public void setQuoteDriver(QuoteDriver quoteDriver) {
		this.quoteDriver = quoteDriver;
	}
	
	public String getPlanCode() {
		return planCode;
	}
	
	public void setPlanCode(String planCode) {
		this.planCode = planCode;
	}
	
	public String getCompPlan() {
		return compPlan;
	}
	
	public void setCompPlan(String compPlan) {
		this.compPlan = compPlan;
	}
	
	public String getGrossPremium() {
		return grossPremium;
	}
	
	public void setGrossPremium(String grossPremium) {
		this.grossPremium = grossPremium;
	}
	
	public String getDiscountAmount() {
		return discountAmount;
	}
	
	public void setDiscountAmount(String discountAmount) {
		this.discountAmount = discountAmount;
	}
	
	public boolean isPersonalAccident() {
		return personalAccident;
	}
	
	public void setPersonalAccident(boolean personalAccident) {
		this.personalAccident = personalAccident;
	}
	
	public String getAddOnPaAmt() {
		return addOnPaAmt;
	}
	
	public void setAddOnPaAmt(String addOnPaAmt) {
		this.addOnPaAmt = addOnPaAmt;
	}
	
	public String getAddOnTppdAmt() {
		return addOnTppdAmt;
	}
	
	public void setAddOnTppdAmt(String addOnTppdAmt) {
		this.addOnTppdAmt = addOnTppdAmt;
	}

	public String getPolicyId() {
		return policyId;
	}

	public void setPolicyId(String policyId) {
		this.policyId = policyId;
	}

	public String getRefNumber() {
		return refNumber;
	}
	
	public void setRefNumber(String refNumber) {
		this.refNumber = refNumber;
	}

	public String getAmtFromThirdPartyToCompSilver() {
		return amtFromThirdPartyToCompSilver;
	}

	public void setAmtFromThirdPartyToCompSilver(
			String amtFromThirdPartyToCompSilver) {
		this.amtFromThirdPartyToCompSilver = amtFromThirdPartyToCompSilver;
	}

	public String getAmtFromThirdPartyToCompGold() {
		return amtFromThirdPartyToCompGold;
	}

	public void setAmtFromThirdPartyToCompGold(String amtFromThirdPartyToCompGold) {
		this.amtFromThirdPartyToCompGold = amtFromThirdPartyToCompGold;
	}

	public String getCompInsuranceAmount() {
		return compInsuranceAmount;
	}

	public void setCompInsuranceAmount(String compInsuranceAmount) {
		this.compInsuranceAmount = compInsuranceAmount;
	}

	public String getSubTotalAmount() {
		return subTotalAmount;
	}

	public void setSubTotalAmount(String subTotalAmount) {
		this.subTotalAmount = subTotalAmount;
	}

	public String getAmountDueAmount() {
		return amountDueAmount;
	}

	public void setAmountDueAmount(String amountDueAmount) {
		this.amountDueAmount = amountDueAmount;
	}
	
	public boolean isThirdPartyPropertyDamage() {
		return thirdPartyPropertyDamage;
	}

	public void setThirdPartyPropertyDamage(boolean thirdPartyPropertyDamage) {
		this.thirdPartyPropertyDamage = thirdPartyPropertyDamage;
	}
	
	public String getPersonalAccidentAmount() {
		return personalAccidentAmount;
	}

	public void setPersonalAccidentAmount(String personalAccidentAmount) {
		this.personalAccidentAmount = personalAccidentAmount;
	}

	public String getAddOnPaBenefit() {
		return addOnPaBenefit;
	}

	public void setAddOnPaBenefit(String addOnPaBenefit) {
		this.addOnPaBenefit = addOnPaBenefit;
	}

	public String getAddOnTppdIncrease() {
		return addOnTppdIncrease;
	}

	public void setAddOnTppdIncrease(String addOnTppdIncrease) {
		this.addOnTppdIncrease = addOnTppdIncrease;
	}

	public String getOwnDamageExcess() {
		return ownDamageExcess;
	}

	public void setOwnDamageExcess(String ownDamageExcess) {
		this.ownDamageExcess = ownDamageExcess;
	}

	public String getTheftExcess() {
		return theftExcess;
	}

	public void setTheftExcess(String theftExcess) {
		this.theftExcess = theftExcess;
	}

	public String getUnnamedDriverExcess() {
		return unnamedDriverExcess;
	}

	public void setUnnamedDriverExcess(String unnamedDriverExcess) {
		this.unnamedDriverExcess = unnamedDriverExcess;
	}

	public String getYoungDriverExcess() {
		return youngDriverExcess;
	}

	public void setYoungDriverExcess(String youngDriverExcess) {
		this.youngDriverExcess = youngDriverExcess;
	}

	public String getInexperiencedDriverExcess() {
		return inexperiencedDriverExcess;
	}

	public void setInexperiencedDriverExcess(String inexperiencedDriverExcess) {
		this.inexperiencedDriverExcess = inexperiencedDriverExcess;
	}	

	public String gettPPDExcess() {
		return tPPDExcess;
	}

	public void settPPDExcess(String tPPDExcess) {
		this.tPPDExcess = tPPDExcess;
	}

	public String getParkingExcess() {
		return parkingExcess;
	}

	public void setParkingExcess(String parkingExcess) {
		this.parkingExcess = parkingExcess;
	}

	public String getPromoCode() {
		return promoCode;
	}

	public void setPromoCode(String promoCode) {
		this.promoCode = promoCode;
	}
	
}
