package com.ifwd.fwdhk.model.savie;

import java.util.List;

public class SavieIllustrationBean {
	private String planName;
	private String paymentPlan;
	private String singlePremiumAmount;
	
	//3, 3, 4%
	private float guarantee1stYearRate;
	private float guarantee2ndYearRate;
	private float guarantee3rdYearRate;
	
	private List<SaviePolicyAccountBalanceBean> saviePolicyAccountBalanceBean;

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

	public float getGuarantee1stYearRate() {
		return guarantee1stYearRate;
	}

	public void setGuarantee1stYearRate(float guarantee1stYearRate) {
		this.guarantee1stYearRate = guarantee1stYearRate;
	}

	public float getGuarantee2ndYearRate() {
		return guarantee2ndYearRate;
	}

	public void setGuarantee2ndYearRate(float guarantee2ndYearRate) {
		this.guarantee2ndYearRate = guarantee2ndYearRate;
	}

	public float getGuarantee3rdYearRate() {
		return guarantee3rdYearRate;
	}

	public void setGuarantee3rdYearRate(float guarantee3rdYearRate) {
		this.guarantee3rdYearRate = guarantee3rdYearRate;
	}

	public List<SaviePolicyAccountBalanceBean> getSaviePolicyAccountBalanceBean() {
		return saviePolicyAccountBalanceBean;
	}

	public void setSaviePolicyAccountBalanceBean(
			List<SaviePolicyAccountBalanceBean> saviePolicyAccountBalanceBean) {
		this.saviePolicyAccountBalanceBean = saviePolicyAccountBalanceBean;
	}


	
	
	
	



	
	

}
