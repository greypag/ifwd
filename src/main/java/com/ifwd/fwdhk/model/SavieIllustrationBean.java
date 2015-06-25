package com.ifwd.fwdhk.model;

import java.util.List;

public class SavieIllustrationBean {
	private String planName;
	private String paymentPlan;
	private String singlePremiumAmount;
	
	private List<SaviePolicyBean> saviePolicyBean;

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

	public List<SaviePolicyBean> getSaviePolicyBean() {
		return saviePolicyBean;
	}

	public void setSaviePolicyBean(List<SaviePolicyBean> saviePolicyBean) {
		this.saviePolicyBean = saviePolicyBean;
	}
	
	

}
