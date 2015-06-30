package com.ifwd.fwdhk.model.savie;

import java.util.List;

public class SavieFormApplicationBean {
	
	private SavieApplicantBean savieApplicantBean;
	
	private SavieEmploymentBean savieEmploymentBean;
	
	private List<SavieBeneficiaryBean> savieBeneficiaryBeans;
	
	private SaviePaymentBean saviePaymentBean;

	public SavieApplicantBean getSavieApplicantBean() {
		return savieApplicantBean;
	}

	public void setSavieApplicantBean(SavieApplicantBean savieApplicantBean) {
		this.savieApplicantBean = savieApplicantBean;
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
