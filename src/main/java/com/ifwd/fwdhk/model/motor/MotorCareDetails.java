package com.ifwd.fwdhk.model.motor;

import java.util.ArrayList;
import java.util.List;

import com.fwd.model.motor.Applicant;
import com.fwd.model.motor.CarDetail;
import com.fwd.model.motor.Driver;
import com.fwd.model.motor.MotorCareDeclaration;

public class MotorCareDetails {
	private long id;	
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
	private CarDetail carDetail;
	private List<Driver> driver = new ArrayList<>();	
	private String policyStartDate;
	private String policyEndDate;
	private String nameOfPreviousInusrancer;
	private String regNoofPreviousPolicy;
	private String expDateOfPreviousInsurance;
	private String previousPolicyNo;
	private List<MotorCareDeclaration> motorCareDeclaration = new ArrayList<>();	
	private boolean psPICS;
	private boolean psNoDM;	
	private boolean psNoProvidePersonalData;	
	private String theClubMemberNum;
	private String coverNoteNum;
	private Applicant applicant;
	private String token;
	private String mib;	
	private String deductedCompInsuranceAmount;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
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
	
	public CarDetail getCarDetail() {
		return carDetail;
	}
	
	public void setCarDetail(CarDetail carDetail) {
		this.carDetail = carDetail;
	}
	
	public List<Driver> getDriver() {
		return driver;
	}
	
	public void setDriver(List<Driver> driver) {
		this.driver = driver;
	}
		
	public String getPolicyStartDate() {
		return policyStartDate;
	}
	
	public void setPolicyStartDate(String policyStartDate) {
		this.policyStartDate = policyStartDate;
	}
	
	public String getNameOfPreviousInusrancer() {
		return nameOfPreviousInusrancer;
	}
	
	public void setNameOfPreviousInusrancer(String nameOfPreviousInusrancer) {
		this.nameOfPreviousInusrancer = nameOfPreviousInusrancer;
	}
	
	public String getRegNoofPreviousPolicy() {
		return regNoofPreviousPolicy;
	}
	
	public void setRegNoofPreviousPolicy(String regNoofPreviousPolicy) {
		this.regNoofPreviousPolicy = regNoofPreviousPolicy;
	}
	
	public String getExpDateOfPreviousInsurance() {
		return expDateOfPreviousInsurance;
	}
	public void setExpDateOfPreviousInsurance(String expDateOfPreviousInsurance) {
		this.expDateOfPreviousInsurance = expDateOfPreviousInsurance;
	}
	
	public String getPreviousPolicyNo() {
		return previousPolicyNo;
	}
	
	public void setPreviousPolicyNo(String previousPolicyNo) {
		this.previousPolicyNo = previousPolicyNo;
	}
		
	public List<MotorCareDeclaration> getMotorCareDeclaration() {
		return motorCareDeclaration;
	}
	
	public void setMotorCareDeclaration(
			List<MotorCareDeclaration> motorCareDeclaration) {
		this.motorCareDeclaration = motorCareDeclaration;
	}
	
	public boolean isPsPICS() {
		return psPICS;
	}
	
	public void setPsPICS(boolean psPICS) {
		this.psPICS = psPICS;
	}
	
	public boolean isPsNoDM() {
		return psNoDM;
	}
	
	public void setPsNoDM(boolean psNoDM) {
		this.psNoDM = psNoDM;
	}
	
	public boolean isPsNoProvidePersonalData() {
		return psNoProvidePersonalData;
	}
	
	public void setPsNoProvidePersonalData(boolean psNoProvidePersonalData) {
		this.psNoProvidePersonalData = psNoProvidePersonalData;
	}
	
	public String getTheClubMemberNum() {
		return theClubMemberNum;
	}
	
	public void setTheClubMemberNum(String theClubMemberNum) {
		this.theClubMemberNum = theClubMemberNum;
	}
	
	public String getCoverNoteNum() {
		return coverNoteNum;
	}
	
	public void setCoverNoteNum(String coverNoteNum) {
		this.coverNoteNum = coverNoteNum;
	}
	
	public Applicant getApplicant() {
		return applicant;
	}
	
	public void setApplicant(Applicant applicant) {
		this.applicant = applicant;
	}
		
	public String getPolicyEndDate() {
		return policyEndDate;
	}
	public void setPolicyEndDate(String policyEndDate) {
		this.policyEndDate = policyEndDate;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getMib() {
		return mib;
	}
	public void setMib(String mib) {
		this.mib = mib;
	}
	public String getDeductedCompInsuranceAmount() {
		return deductedCompInsuranceAmount;
	}
	public void setDeductedCompInsuranceAmount(String deductedCompInsuranceAmount) {
		this.deductedCompInsuranceAmount = deductedCompInsuranceAmount;
	}
	
}
