package com.ifwd.fwdhk.model;

import java.util.List;

public class ProviePlanDetails {

	public class Plan {

		private int premiumYear;
		private double rate;
		private float accountValue;
		private float deathBenefit;
		private float riderValue;
		private float totalPaid;
		
		public int getPremiumYear() {
			return premiumYear;
		}
		public void setPremiumYear(int premiumYear) {
			this.premiumYear = premiumYear;
		}
		public double getRate() {
			return rate;
		}
		public void setRate(double rate) {
			this.rate = rate;
		}
		public float getAccountValue() {
			return accountValue;
		}
		public void setAccountValue(float accountValue) {
			this.accountValue = accountValue;
		}
		public float getDeathBenefit() {
			return deathBenefit;
		}
		public void setDeathBenefit(float deathBenefit) {
			this.deathBenefit = deathBenefit;
		}
		public float getRiderValue() {
			return riderValue;
		}
		public void setRiderValue(float riderValue) {
			this.riderValue = riderValue;
		}
		public float getTotalPaid() {
			return totalPaid;
		}
		public void setTotalPaid(float totalPaid) {
			this.totalPaid = totalPaid;
		}
		
	}

	public class CreditRates {

		private double rate;
		private List<Plan> plans;
		
		public double getRate() {
			return rate;
		}
		public void setRate(double rate) {
			this.rate = rate;
		}
		public List<Plan> getPlans() {
			return plans;
		}
		public void setPlans(List<Plan> plans) {
			this.plans = plans;
		}

	}	
	
	private String planCode;
	private String currency;
	private String rider;
	private List<Plan> plans;
	private List<CreditRates> creditRates;
	
	
	public String getPlanCode() {
		return planCode;
	}
	public void setPlanCode(String planCode) {
		this.planCode = planCode;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public String getRider() {
		return rider;
	}
	public void setRider(String rider) {
		this.rider = rider;
	}
	public List<Plan> getPlans() {
		return plans;
	}
	public void setPlans(List<Plan> plans) {
		this.plans = plans;
	}
	public List<CreditRates> getCreditRates() {
		return creditRates;
	}
	public void setCreditRates(List<CreditRates> creditRates) {
		this.creditRates = creditRates;
	}

}
