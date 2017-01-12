
package com.ifwd.fwdhk.model.tngsavie;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonPropertyOrder({
	"customerId",
    "mobile",
    "policies"
})
public class TngPolicyInfoResponse {

	@JsonProperty("customerId")
	private String customerId;
	@JsonProperty("mobile")
    private String mobile;
    @JsonProperty("policies")
    private List<TngPolicyInfo> policies = new ArrayList<TngPolicyInfo>();
    public List<TngPolicyInfo> getPolicies() {
		return policies;
	}
	public void setPolicies(List<TngPolicyInfo> policies) {
		this.policies = policies;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	

}
