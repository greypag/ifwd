package com.ifwd.fwdhk.model.motor;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
    "QuoteDriver",
    "PlanCode",
    "CompPlan",
    "GrossPremium",
    "DiscountAmount",
    "PersonalAccident",
    "ThirdPartyPropertyDemage",
    "AddOnPaAmt",
    "AddOnTppdAmt",
    "QuoteId",
    "RefNumber",
    "MotorFile"
})
public class QuoteMotorCare {

	@JsonProperty("QuoteDriver")
	private QuoteDriver quoteDriver;
	@JsonProperty("PlanCode")
	private String planCode;
	@JsonProperty("CompPlan")
	private String compPlan;
	@JsonProperty("GrossPremium")
	private String grossPremium;
	@JsonProperty("DiscountAmount")
	private String discountAmount;
	@JsonProperty("PersonalAccident")
	private boolean personalAccident;
	@JsonProperty("ThirdPartyPropertyDemage")
	private boolean thirdPartyPropertyDemage;
	@JsonProperty("AddOnPaAmt")
	private String addOnPaAmt;
	@JsonProperty("AddOnTppdAmt")
	private String addOnTppdAmt;
	@JsonProperty("QuoteId")	
	private String quoteId;
	@JsonProperty("RefNumber")
	private String refNumber;
	
	@JsonProperty("QuoteDriver")
	public QuoteDriver getQuoteDriver() {
		return quoteDriver;
	}
	@JsonProperty("QuoteDriver")
	public void setQuoteDriver(QuoteDriver quoteDriver) {
		this.quoteDriver = quoteDriver;
	}
	@JsonProperty("PlanCode")
	public String getPlanCode() {
		return planCode;
	}
	@JsonProperty("PlanCode")
	public void setPlanCode(String planCode) {
		this.planCode = planCode;
	}
	@JsonProperty("CompPlan")
	public String getCompPlan() {
		return compPlan;
	}
	@JsonProperty("CompPlan")
	public void setCompPlan(String compPlan) {
		this.compPlan = compPlan;
	}
	@JsonProperty("GrossPremium")
	public String getGrossPremium() {
		return grossPremium;
	}
	@JsonProperty("GrossPremium")
	public void setGrossPremium(String grossPremium) {
		this.grossPremium = grossPremium;
	}
	@JsonProperty("DiscountAmount")
	public String getDiscountAmount() {
		return discountAmount;
	}
	@JsonProperty("DiscountAmount")
	public void setDiscountAmount(String discountAmount) {
		this.discountAmount = discountAmount;
	}
	@JsonProperty("PersonalAccident")
	public boolean isPersonalAccident() {
		return personalAccident;
	}
	@JsonProperty("PersonalAccident")
	public void setPersonalAccident(boolean personalAccident) {
		this.personalAccident = personalAccident;
	}
	@JsonProperty("ThirdPartyPropertyDemage")
	public boolean isThirdPartyPropertyDemage() {
		return thirdPartyPropertyDemage;
	}
	@JsonProperty("ThirdPartyPropertyDemage")
	public void setThirdPartyPropertyDemage(boolean thirdPartyPropertyDemage) {
		this.thirdPartyPropertyDemage = thirdPartyPropertyDemage;
	}
	@JsonProperty("AddOnPaAmt")
	public String getAddOnPaAmt() {
		return addOnPaAmt;
	}
	@JsonProperty("AddOnPaAmt")
	public void setAddOnPaAmt(String addOnPaAmt) {
		this.addOnPaAmt = addOnPaAmt;
	}
	@JsonProperty("AddOnTppdAmt")
	public String getAddOnTppdAmt() {
		return addOnTppdAmt;
	}
	@JsonProperty("AddOnTppdAmt")
	public void setAddOnTppdAmt(String addOnTppdAmt) {
		this.addOnTppdAmt = addOnTppdAmt;
	}
	@JsonProperty("QuoteId")
	public String getQuoteId() {
		return quoteId;
	}
	@JsonProperty("QuoteId")
	public void setQuoteId(String quoteId) {
		this.quoteId = quoteId;
	}
	@JsonProperty("RefNumber")
	public String getRefNumber() {
		return refNumber;
	}
	@JsonProperty("RefNumber")
	public void setRefNumber(String refNumber) {
		this.refNumber = refNumber;
	}
	
}
