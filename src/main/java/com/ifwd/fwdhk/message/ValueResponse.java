package com.ifwd.fwdhk.message;

import com.ifwd.fwdhk.message.BaseResponse;

public class ValueResponse extends BaseResponse {
	private String value;

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
}
