package com.ifwd.fwdhk.model.savie;

import java.util.Date;

public class SaviePaymentBean {
	
	private boolean payOnline;
	private String paymentMethod;
	private String amount;
	private String accountNo;
	private String bankNameCode;
	private String branchName;
	private Date expiryDate;
	
	public boolean isPayOnline() {
		return payOnline;
	}
	public void setPayOnline(boolean payOnline) {
		this.payOnline = payOnline;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public String getBankNameCode() {
		return bankNameCode;
	}
	public void setBankNameCode(String bankNameCode) {
		this.bankNameCode = bankNameCode;
	}
	public String getBranchName() {
		return branchName;
	}
	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}
	public Date getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}
	
	
}
