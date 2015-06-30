package com.ifwd.fwdhk.model.savie;

public class SaviePolicyAccountBalanceBean {
	
	/*	PolicyAccountBalance
	- policyYear
	- Premium paid
	- account value
	- surrend*/
	
	
	
	private String policyYear;
	private String premiumPaid;
	private String accountValue;
	private String surrenderBenefit;
	public String getPolicyYear() {
		return policyYear;
	}
	public void setPolicyYear(String policyYear) {
		this.policyYear = policyYear;
	}
	public String getPremiumPaid() {
		return premiumPaid;
	}
	public void setPremiumPaid(String premiumPaid) {
		this.premiumPaid = premiumPaid;
	}
	public String getAccountValue() {
		return accountValue;
	}
	public void setAccountValue(String accountValue) {
		this.accountValue = accountValue;
	}
	public String getSurrenderBenefit() {
		return surrenderBenefit;
	}
	public void setSurrenderBenefit(String surrenderBenefit) {
		this.surrenderBenefit = surrenderBenefit;
	}
	
	
	
	
	
	
}
