package com.ifwd.fwdhk.connector.response.savieonline;

import com.ifwd.fwdhk.connector.response.BaseResponse;

public class GetPolicyApplicationResponse extends BaseResponse {
	private static final long serialVersionUID = 1L;

	private PolicyApplication policyApplication;

	public PolicyApplication getPolicyApplication() {
		return policyApplication;
	}

	public void setPolicyApplication(PolicyApplication policyApplication) {
		this.policyApplication = policyApplication;
	}
	
	
}
