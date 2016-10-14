package com.ifwd.fwdhk.model.tngsavie;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;


@JsonPropertyOrder({
	"txnDate",
	"txnId",
	"tngRefNo",
	"txnCurrency",
	"txnAmount",
	"policyCurrency",
	"policyAmount",
	"exchangeRate"
})
public class TngPolicyHistory {

	@JsonProperty("txnDate")
	private String txnDate;
	@JsonProperty("txnId")
	private String txnId;
	@JsonProperty("tngRefNo")
	private String tngRefNo;
	@JsonProperty("txnCurrency")
	private String txnCurrency;
	@JsonProperty("txnAmount")
	private String txnAmount;
	@JsonProperty("policyCurrency")
	private String policyCurrency;
	@JsonProperty("policyAmount")
	private String policyAmount;
	@JsonProperty("exchangeRate")
	private String exchangeRate;
	
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
	public String getTxnAmount() {
		return txnAmount;
	}
	public void setTxnAmount(String txnAmount) {
		this.txnAmount = txnAmount;
	}
	public String getPolicyCurrency() {
		return policyCurrency;
	}
	public void setPolicyCurrency(String policyCurrency) {
		this.policyCurrency = policyCurrency;
	}
	public String getPolicyAmount() {
		return policyAmount;
	}
	public void setPolicyAmount(String policyAmount) {
		this.policyAmount = policyAmount;
	}
	public String getExchangeRate() {
		return exchangeRate;
	}
	public void setExchangeRate(String exchangeRate) {
		this.exchangeRate = exchangeRate;
	}
	
}
