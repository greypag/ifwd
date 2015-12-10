package com.ifwd.fwdhk.model.evergreen;

import java.util.List;

public class EvergreenFormApplicationBean {
	
	private EvergreenApplicantBean savieApplicantBean;
	
	private EvergreenEmploymentBean savieEmploymentBean;
	
	private List<EvergreenBeneficiaryBean> savieBeneficiaryBeans;
	
	private EvergreenPaymentBean saviePaymentBean;

	public EvergreenApplicantBean getSavieApplicantBean() {
		return savieApplicantBean;
	}

	public void setSavieApplicantBean(EvergreenApplicantBean savieApplicantBean) {
		this.savieApplicantBean = savieApplicantBean;
	}

	public EvergreenEmploymentBean getSavieEmploymentBean() {
		return savieEmploymentBean;
	}

	public void setSavieEmploymentBean(EvergreenEmploymentBean savieEmploymentBean) {
		this.savieEmploymentBean = savieEmploymentBean;
	}

	public List<EvergreenBeneficiaryBean> getSavieBeneficiaryBeans() {
		return savieBeneficiaryBeans;
	}

	public void setSavieBeneficiaryBeans(
			List<EvergreenBeneficiaryBean> savieBeneficiaryBeans) {
		this.savieBeneficiaryBeans = savieBeneficiaryBeans;
	}

	public EvergreenPaymentBean getSaviePaymentBean() {
		return saviePaymentBean;
	}

	public void setSaviePaymentBean(EvergreenPaymentBean saviePaymentBean) {
		this.saviePaymentBean = saviePaymentBean;
	}

	
	
	
	
}
