package com.ifwd.fwdhk.connector.response.life;

import com.ifwd.fwdhk.connector.response.BaseResponse;

public class GetVulnerableCustomerResponse extends BaseResponse {
	private static final long serialVersionUID = 1L;

	private String vulnerableCustomer;

	public String getVulnerableCustomer() {
		return vulnerableCustomer;
	}

	public void setVulnerableCustomer(String vulnerableCustomer) {
		this.vulnerableCustomer = vulnerableCustomer;
	}
	
	
}
