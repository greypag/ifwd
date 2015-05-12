package com.ifwd.fwdhk.model;

import java.io.Serializable;

public class WorkingHolidayQuoteDetails implements Serializable {

	private static final long serialVersionUID = 1L;

	private String whTotalDue;
	private String whGrossPremium;
	private String whDiscountAmount;
	private String whReferralCode;
	private String whReferralName;
	private String whPlanName;
	private String whgrossPremiumAmt;
	private String whPromtCode;
	private String whPlanSelected;

	public String getWhTotalDue() {
		return whTotalDue;
	}

	public void setWhTotalDue(String whTotalDue) {
		this.whTotalDue = whTotalDue;
	}

	public String getWhGrossPremium() {
		return whGrossPremium;
	}

	public void setWhGrossPremium(String whGrossPremium) {
		this.whGrossPremium = whGrossPremium;
	}

	public String getWhDiscountAmount() {
		return whDiscountAmount;
	}

	public void setWhDiscountAmount(String whDiscountAmount) {
		this.whDiscountAmount = whDiscountAmount;
	}

	public String getWhReferralCode() {
		return whReferralCode;
	}

	public void setWhReferralCode(String whReferralCode) {
		this.whReferralCode = whReferralCode;
	}

	public String getWhReferralName() {
		return whReferralName;
	}

	public void setWhReferralName(String whReferralName) {
		this.whReferralName = whReferralName;
	}

	public String getWhPlanName() {
		return whPlanName;
	}

	public void setWhPlanName(String whPlanName) {
		this.whPlanName = whPlanName;
	}

	public String getWhgrossPremiumAmt() {
		return whgrossPremiumAmt;
	}

	public void setWhgrossPremiumAmt(String whgrossPremiumAmt) {
		this.whgrossPremiumAmt = whgrossPremiumAmt;
	}

	public String getWhPromtCode() {
		return whPromtCode;
	}

	public void setWhPromtCode(String whPromtCode) {
		this.whPromtCode = whPromtCode;
	}

	public String getWhPlanSelected() {
		return whPlanSelected;
	}

	public void setWhPlanSelected(String whPlanSelected) {
		this.whPlanSelected = whPlanSelected;
	}

}
