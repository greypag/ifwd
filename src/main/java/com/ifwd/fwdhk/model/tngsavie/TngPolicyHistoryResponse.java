package com.ifwd.fwdhk.model.tngsavie;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonPropertyOrder({
	"policyId",
	"tngAccountId",
	"product_en",
	"product_zh",
	"transaction",
	"msg"
})
public class TngPolicyHistoryResponse {

	@JsonProperty("policyId")
	private String policyId;
	@JsonProperty("tngAccountId")
	private String tngAccountId;
	@JsonProperty("product_en")
	private String productEn;
	@JsonProperty("product_zh")
	private String productZh;
	@JsonProperty("transaction")
	private List<TngPolicyHistory> transaction = new ArrayList<TngPolicyHistory>();
	@JsonProperty("msg")
	private ResponseMsg msg;
	
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
	public String getProductEn() {
		return productEn;
	}
	public void setProductEn(String productEn) {
		this.productEn = productEn;
	}
	public String getProductZh() {
		return productZh;
	}
	public void setProductZh(String productZh) {
		this.productZh = productZh;
	}
	public List<TngPolicyHistory> getTransaction() {
		return transaction;
	}
	public void setTransaction(List<TngPolicyHistory> transaction) {
		this.transaction = transaction;
	}
	public ResponseMsg getMsg() {
		return msg;
	}
	public void setMsg(ResponseMsg msg) {
		this.msg = msg;
	}
	
}
