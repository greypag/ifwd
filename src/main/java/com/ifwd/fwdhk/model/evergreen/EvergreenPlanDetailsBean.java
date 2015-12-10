package com.ifwd.fwdhk.model.evergreen;

import java.util.List;

public class EvergreenPlanDetailsBean {
	private String planName;
	private String paymentPlan;
	private String singlePremiumAmount;
	
	//3, 3, 4%
	private float guarantee1stYearRate;
	private float guarantee2ndYearRate;
	private float guarantee3rdYearRate;
	
	private List<EvergreenPolicyAccountBalanceBean> saviePolicyAccountBalanceList0;
	private List<EvergreenPolicyAccountBalanceBean> saviePolicyAccountBalanceList2;
	private List<EvergreenPolicyAccountBalanceBean> saviePolicyAccountBalanceList3;
	private List<EvergreenPolicyAccountBalanceBean> saviePolicyAccountBalanceList4;
	
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
	public List<EvergreenPolicyAccountBalanceBean> getSaviePolicyAccountBalanceList0() {
		return saviePolicyAccountBalanceList0;
	}
	public void setSaviePolicyAccountBalanceList0(
			List<EvergreenPolicyAccountBalanceBean> saviePolicyAccountBalanceList0) {
		this.saviePolicyAccountBalanceList0 = saviePolicyAccountBalanceList0;
	}
	public List<EvergreenPolicyAccountBalanceBean> getSaviePolicyAccountBalanceList2() {
		return saviePolicyAccountBalanceList2;
	}
	public void setSaviePolicyAccountBalanceList2(
			List<EvergreenPolicyAccountBalanceBean> saviePolicyAccountBalanceList2) {
		this.saviePolicyAccountBalanceList2 = saviePolicyAccountBalanceList2;
	}
	public List<EvergreenPolicyAccountBalanceBean> getSaviePolicyAccountBalanceList3() {
		return saviePolicyAccountBalanceList3;
	}
	public void setSaviePolicyAccountBalanceList3(
			List<EvergreenPolicyAccountBalanceBean> saviePolicyAccountBalanceList3) {
		this.saviePolicyAccountBalanceList3 = saviePolicyAccountBalanceList3;
	}
	public List<EvergreenPolicyAccountBalanceBean> getSaviePolicyAccountBalanceList4() {
		return saviePolicyAccountBalanceList4;
	}
	public void setSaviePolicyAccountBalanceList4(
			List<EvergreenPolicyAccountBalanceBean> saviePolicyAccountBalanceList4) {
		this.saviePolicyAccountBalanceList4 = saviePolicyAccountBalanceList4;
	}
}
