package com.ifwd.fwdhk.model.savie;

import java.util.List;

public class SavieIllustrationBean {
	private String planName;
	private String paymentPlan;
	private String singlePremiumAmount;
	
	3, 3, 4%
	float guarantee1stYearRate
	float guarantee2ndYearRate
	float guarantee3rdYearRate
	
	<List>policyAccountBalance
	
	PolicyAccountBalance
	- policyYear
	- Premium paid
	- account value
	- surrend
	
	
	private List<SavieRateBean> savieRateBean;

	public String getPlanName() {
		return planName;
	}

	public void setPlanName(String planName) {
		this.planName = planName;
	}

	public String getPaymentPlan() {
		return paymentPlan;
	}

	public void setPaymentPlan(String paymentPlan) {
		this.paymentPlan = paymentPlan;
	}

	public String getSinglePremiumAmount() {
		return singlePremiumAmount;
	}

	public void setSinglePremiumAmount(String singlePremiumAmount) {
		this.singlePremiumAmount = singlePremiumAmount;
	}

	public List<SavieRateBean> getSavieRateBean() {
		return savieRateBean;
	}

	public void setSavieRateBean(List<SavieRateBean> savieRateBean) {
		this.savieRateBean = savieRateBean;
	}

	
	

}
