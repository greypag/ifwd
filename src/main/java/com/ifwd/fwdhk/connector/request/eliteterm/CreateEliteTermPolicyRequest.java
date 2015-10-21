package com.ifwd.fwdhk.connector.request.eliteterm;

public class CreateEliteTermPolicyRequest{

	private CreateEliteTermPolicyApplicant applicant = new CreateEliteTermPolicyApplicant();
	private String amount;
	private String promocode;
	public CreateEliteTermPolicyApplicant getApplicant() {
		return applicant;
	}
	public void setApplicant(CreateEliteTermPolicyApplicant applicant) {
		this.applicant = applicant;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getPromocode() {
		return promocode;
	}
	public void setPromocode(String promocode) {
		this.promocode = promocode;
	}
	
}
