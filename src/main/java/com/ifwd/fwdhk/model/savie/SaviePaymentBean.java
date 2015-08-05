package com.ifwd.fwdhk.model.savie;

import java.util.Date;

public class SaviePaymentBean {
	
	private boolean paymentType;
	private float amount;
	private String paymentMethod;	
	private String bankAccountHolderName;	
	private String bankName;	
	private String branchName;
	private String accountNo;
	private Date expiryDate;
	private boolean paymentConfirmAuthorize;
	
	public boolean isPaymentType() {
		return paymentType;
	}
	public void setPaymentType(boolean paymentType) {
		this.paymentType = paymentType;
	}
	public float getAmount() {
		return amount;
	}
	public void setAmount(float amount) {
		this.amount = amount;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	
	public String getBankAccountHolderName() {
		return bankAccountHolderName;
	}
	public void setBankAccountHolderName(String bankAccountHolderName) {
		this.bankAccountHolderName = bankAccountHolderName;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getBranchName() {
		return branchName;
	}
	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public Date getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}
	public boolean isPaymentConfirmAuthorize() {
		return paymentConfirmAuthorize;
	}
	public void setPaymentConfirmAuthorize(boolean paymentConfirmAuthorize) {
		this.paymentConfirmAuthorize = paymentConfirmAuthorize;
	}
	
	
	
	
	
	
}
