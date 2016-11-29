package com.ifwd.fwdhk.model.tngsavie;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class WarnMsg {
	private String code;
	private String message_en;
	private String message_zh;
	
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMessage_en() {
		return message_en;
	}

	public void setMessage_en(String message_en) {
		this.message_en = message_en;
	}

	public String getMessage_zh() {
		return message_zh;
	}

	public void setMessage_zh(String message_zh) {
		this.message_zh = message_zh;
	}
	
}
