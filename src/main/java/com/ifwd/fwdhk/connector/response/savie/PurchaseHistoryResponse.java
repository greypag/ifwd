package com.ifwd.fwdhk.connector.response.savie;

import java.util.List;

import com.ifwd.fwdhk.connector.response.BaseResponse;

public class PurchaseHistoryResponse extends BaseResponse {
	private static final long serialVersionUID = 1L;

	private List<PurchaseHistoryPolicies> policies;

	public List<PurchaseHistoryPolicies> getPolicies() {
		return policies;
	}

	public void setPolicies(List<PurchaseHistoryPolicies> policies) {
		this.policies = policies;
	}
	
	
}
