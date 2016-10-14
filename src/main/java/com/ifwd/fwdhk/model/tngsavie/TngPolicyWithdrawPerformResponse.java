package com.ifwd.fwdhk.model.tngsavie;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonPropertyOrder({
	"policyId",
	"customerId",
	"otpResult",
	"wdStatus",
	"tngStatus",
	"tngRefNo",
	"sendEmailResult",
	"withdrawAmount",
	"msg"
})
public class TngPolicyWithdrawPerformResponse {

	@JsonProperty("policyId")
	private String policyId;
	@JsonProperty("customerId")
	private String customerId;
	@JsonProperty("otpResult")
	private Boolean otpResult;
	@JsonProperty("wdStatus")
	private Boolean wdStatus;
	@JsonProperty("tngStatus")
	private String tngStatus;
	@JsonProperty("tngRefNo")
	private String tngRefNo;
	@JsonProperty("sendEmailResult")
	private Boolean sendEmailResult;
	@JsonProperty("withdrawAmount")
	private Double withdrawAmount;
	@JsonProperty("msg")
	private ResponseMsg msg;
	
	public String getPolicyId() {
		return policyId;
	}
	public void setPolicyId(String policyId) {
		this.policyId = policyId;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public Boolean getOtpResult() {
		return otpResult;
	}
	public void setOtpResult(Boolean otpResult) {
		this.otpResult = otpResult;
	}
	public Boolean getWdStatus() {
		return wdStatus;
	}
	public void setWdStatus(Boolean wdStatus) {
		this.wdStatus = wdStatus;
	}
	public String getTngStatus() {
		return tngStatus;
	}
	public void setTngStatus(String tngStatus) {
		this.tngStatus = tngStatus;
	}
	public String getTngRefNo() {
		return tngRefNo;
	}
	public void setTngRefNo(String tngRefNo) {
		this.tngRefNo = tngRefNo;
	}
	public Boolean getSendEmailResult() {
		return sendEmailResult;
	}
	public void setSendEmailResult(Boolean sendEmailResult) {
		this.sendEmailResult = sendEmailResult;
	}
	public ResponseMsg getMsg() {
		return msg;
	}
	public void setMsg(ResponseMsg msg) {
		this.msg = msg;
	}
	public Double getWithdrawAmount() {
		return withdrawAmount;
	}
	public void setWithdrawAmount(Double withdrawAmount) {
		this.withdrawAmount = withdrawAmount;
	}

}
