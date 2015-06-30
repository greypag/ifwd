package com.ifwd.fwdhk.model.savie;

import java.util.List;

public class SavieFormApplicationBean {
	
	private SaviePersonalBean saviePersonalBean;
	
	private SavieEmploymentBean savieEmploymentBean;
	
	private List<SavieBeneficiaryBean> savieBeneficiaryBeans;
	
	private SaviePaymentBean saviePaymentBean;

	public SaviePersonalBean getSaviePersonalBean() {
		return saviePersonalBean;
	}

	public void setSaviePersonalBean(SaviePersonalBean saviePersonalBean) {
		this.saviePersonalBean = saviePersonalBean;
	}

	public SavieEmploymentBean getSavieEmploymentBean() {
		return savieEmploymentBean;
	}

	public void setSavieEmploymentBean(SavieEmploymentBean savieEmploymentBean) {
		this.savieEmploymentBean = savieEmploymentBean;
	}

	public List<SavieBeneficiaryBean> getSavieBeneficiaryBeans() {
		return savieBeneficiaryBeans;
	}

	public void setSavieBeneficiaryBeans(
			List<SavieBeneficiaryBean> savieBeneficiaryBeans) {
		this.savieBeneficiaryBeans = savieBeneficiaryBeans;
	}

	public SaviePaymentBean getSaviePaymentBean() {
		return saviePaymentBean;
	}

	public void setSaviePaymentBean(SaviePaymentBean saviePaymentBean) {
		this.saviePaymentBean = saviePaymentBean;
	}
	
	
	
}
