
package com.ifwd.fwdhk.model.tngsavie;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonPropertyOrder({
    "mobile",
    "policy"
})
public class TngPolicyInfoResponse {

    @JsonProperty("mobile")
    private String mobile;
    @JsonProperty("policy")
    private List<TngPolicyInfo> policy = new ArrayList<TngPolicyInfo>();
    
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public List<TngPolicyInfo> getPolicy() {
		return policy;
	}
	public void setPolicy(List<TngPolicyInfo> policy) {
		this.policy = policy;
	}

}
