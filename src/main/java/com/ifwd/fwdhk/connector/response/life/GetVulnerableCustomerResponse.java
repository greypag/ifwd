package com.ifwd.fwdhk.connector.response.life;

import com.ifwd.fwdhk.connector.response.BaseResponse;

public class GetVulnerableCustomerResponse extends BaseResponse {
	private static final long serialVersionUID = 1L;

	private boolean vulnerableCustomer;

	public boolean getVulnerableCustomer() {
		return vulnerableCustomer;
	}

	public void setVulnerableCustomer(boolean vulnerableCustomer) {
		this.vulnerableCustomer = vulnerableCustomer;
	}
	
	
}
