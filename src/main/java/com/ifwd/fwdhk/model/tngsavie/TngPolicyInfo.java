
package com.ifwd.fwdhk.model.tngsavie;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;


@JsonPropertyOrder({
	"policyId",
	"product_code",
	"product_en",
	"product_zh",
	"validPolicy",
	"policyPrincipal",
	"principalAsOfDate",
	"policyValue",
	"valueAsOfDate",
	"tngAccountId",
	"tngExpiryDate",
    "tngPolicyStatus"
})
public class TngPolicyInfo {

	@JsonProperty("policyId")
    private String policyId;
    @JsonProperty("product_code")
    private String productCode;
    @JsonProperty("product_en")
    private String productEn;
    @JsonProperty("product_zh")
    private String productZh;
    @JsonProperty("validPolicy")
    private Boolean validPolicy;
    @JsonProperty("policyPrincipal")
    private Double policyPrincipal;
    @JsonProperty("principalAsOfDate")
    private String principalAsOfDate;
    @JsonProperty("policyValue")
    private Integer policyValue;
    @JsonProperty("valueAsOfDate")
    private String valueAsOfDate;
    @JsonProperty("tngAccountId")
    private String tngAccountId;
    @JsonProperty("tngExpiryDate")
    private String tngExpiryDate;
    @JsonProperty("tngPolicyStatus")
    private String tngPolicyStatus;
    
    @JsonProperty("warnMsg")
    private List<WarnMsg> warnMsg = new ArrayList<WarnMsg>();

	public String getPolicyId() {
		return policyId;
	}

	public void setPolicyId(String policyId) {
		this.policyId = policyId;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
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

	public Boolean getValidPolicy() {
		return validPolicy;
	}

	public void setValidPolicy(Boolean validPolicy) {
		this.validPolicy = validPolicy;
	}

	public Double getPolicyPrincipal() {
		return policyPrincipal;
	}

	public void setPolicyPrincipal(Double policyPrincipal) {
		this.policyPrincipal = policyPrincipal;
	}

	public String getPrincipalAsOfDate() {
		return principalAsOfDate;
	}

	public void setPrincipalAsOfDate(String principalAsOfDate) {
		this.principalAsOfDate = principalAsOfDate;
	}

	public Integer getPolicyValue() {
		return policyValue;
	}

	public void setPolicyValue(Integer policyValue) {
		this.policyValue = policyValue;
	}

	public String getValueAsOfDate() {
		return valueAsOfDate;
	}

	public void setValueAsOfDate(String valueAsOfDate) {
		this.valueAsOfDate = valueAsOfDate;
	}

	public String getTngAccountId() {
		return tngAccountId;
	}

	public void setTngAccountId(String tngAccountId) {
		this.tngAccountId = tngAccountId;
	}

	public String getTngExpiryDate() {
		return tngExpiryDate;
	}

	public void setTngExpiryDate(String tngExpiryDate) {
		this.tngExpiryDate = tngExpiryDate;
	}

	public String getTngPolicyStatus() {
		return tngPolicyStatus;
	}

	public void setTngPolicyStatus(String tngPolicyStatus) {
		this.tngPolicyStatus = tngPolicyStatus;
	}

	public List<WarnMsg> getWarnMsg() {
		return warnMsg;
	}

	public void setWarnMsg(List<WarnMsg> warnMsg) {
		this.warnMsg = warnMsg;
	}
   

}
