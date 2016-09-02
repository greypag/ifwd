package com.ifwd.fwdhk.model.motor;

public class PolicyMotorCare {
	
	private String policyId;
	private PolicyCarDetails policyCarDetails;
	private PolicyDriverDetails policyDriverDetails;
	private PolicyInfo policyInfo;
	private PolicyDeclaration policyDeclaration;
	private String coverNote;
	private String refNumber;
	private String paymentTxnRef;
	
	public String getPolicyId() {
		return policyId;
	}
	public void setPolicyId(String policyId) {
		this.policyId = policyId;
	}
	public PolicyCarDetails getPolicyCarDetails() {
		return policyCarDetails;
	}
	public void setPolicyCarDetails(PolicyCarDetails policyCarDetails) {
		this.policyCarDetails = policyCarDetails;
	}
	public PolicyDriverDetails getPolicyDriverDetails() {
		return policyDriverDetails;
	}
	public void setPolicyDriverDetails(PolicyDriverDetails policyDriverDetails) {
		this.policyDriverDetails = policyDriverDetails;
	}
	public PolicyInfo getPolicyInfo() {
		return policyInfo;
	}
	public void setPolicyInfo(PolicyInfo policyInfo) {
		this.policyInfo = policyInfo;
	}
	public PolicyDeclaration getPolicyDeclaration() {
		return policyDeclaration;
	}
	public void setPolicyDeclaration(PolicyDeclaration policyDeclaration) {
		this.policyDeclaration = policyDeclaration;
	}
	public String getCoverNote() {
		return coverNote;
	}
	public void setCoverNote(String coverNote) {
		this.coverNote = coverNote;
	}
	public String getRefNumber() {
		return refNumber;
	}
	public void setRefNumber(String refNumber) {
		this.refNumber = refNumber;
	}
	public String getPaymentTxnRef() {
		return paymentTxnRef;
	}
	public void setPaymentTxnRef(String paymentTxnRef) {
		this.paymentTxnRef = paymentTxnRef;
	}
	

}
