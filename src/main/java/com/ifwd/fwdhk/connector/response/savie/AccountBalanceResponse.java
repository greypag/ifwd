package com.ifwd.fwdhk.connector.response.savie;

import java.util.List;

import com.ifwd.fwdhk.connector.response.BaseResponse;

public class AccountBalanceResponse extends BaseResponse {
	private static final long serialVersionUID = 1L;

	private List<AccountBalance> accountBalances;

	public List<AccountBalance> getAccountBalances() {
		return accountBalances;
	}

	public void setAccountBalances(List<AccountBalance> accountBalances) {
		this.accountBalances = accountBalances;
	}

	
	
	
}
