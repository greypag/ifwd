package com.ifwd.fwdhk.connector.request.eliteterm;

public class CreateEliteTermPolicyRequest{

	private CreateEliteTermPolicyApplicant applicant = new CreateEliteTermPolicyApplicant();
	public CreateEliteTermPolicyApplicant getApplicant() {
		return applicant;
	}
	public void setApplicant(CreateEliteTermPolicyApplicant applicant) {
		this.applicant = applicant;
	}
}
