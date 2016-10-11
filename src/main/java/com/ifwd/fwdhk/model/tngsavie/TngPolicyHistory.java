package com.ifwd.fwdhk.model.tngsavie;


public class TngPolicyHistory {

	private String policyId;
	private String tngAccountId;
	private String product_en;
	private String product_zh;

	private String txnDate;
	private String txnId;
	private String tngRefNo;
	private String txnCurrency;
	private Double txnAmount;
	private String policyCurrency;
	private Double policyAmount;
	private Double exchangeRate;
	
	private String remark;

	public String getPolicyId() {
		return policyId;
	}

	public void setPolicyId(String policyId) {
		this.policyId = policyId;
	}

	public String getTngAccountId() {
		return tngAccountId;
	}

	public void setTngAccountId(String tngAccountId) {
		this.tngAccountId = tngAccountId;
	}

	public String getProduct_en() {
		return product_en;
	}

	public void setProduct_en(String product_en) {
		this.product_en = product_en;
	}

	public String getProduct_zh() {
		return product_zh;
	}

	public void setProduct_zh(String product_zh) {
		this.product_zh = product_zh;
	}

	public String getTxnDate() {
		return txnDate;
	}

	public void setTxnDate(String txnDate) {
		this.txnDate = txnDate;
	}

	public String getTxnId() {
		return txnId;
	}

	public void setTxnId(String txnId) {
		this.txnId = txnId;
	}

	public String getTngRefNo() {
		return tngRefNo;
	}

	public void setTngRefNo(String tngRefNo) {
		this.tngRefNo = tngRefNo;
	}

	public String getTxnCurrency() {
		return txnCurrency;
	}

	public void setTxnCurrency(String txnCurrency) {
		this.txnCurrency = txnCurrency;
	}

	public Double getTxnAmount() {
		return txnAmount;
	}

	public void setTxnAmount(Double txnAmount) {
		this.txnAmount = txnAmount;
	}

	public String getPolicyCurrency() {
		return policyCurrency;
	}

	public void setPolicyCurrency(String policyCurrency) {
		this.policyCurrency = policyCurrency;
	}

	public Double getPolicyAmount() {
		return policyAmount;
	}

	public void setPolicyAmount(Double policyAmount) {
		this.policyAmount = policyAmount;
	}

	public Double getExchangeRate() {
		return exchangeRate;
	}

	public void setExchangeRate(Double exchangeRate) {
		this.exchangeRate = exchangeRate;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	
}
