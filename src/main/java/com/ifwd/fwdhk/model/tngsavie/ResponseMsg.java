
package com.ifwd.fwdhk.model.tngsavie;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonPropertyOrder({
    "resultCode",
    "refCode",
    "message_en",
    "message_zh"
})
public class ResponseMsg {

    @JsonProperty("resultCode")
    private String resultCode;
    @JsonProperty("refCode")
    private String refCode;
    @JsonProperty("message_en")
    private String messageEn;
    @JsonProperty("message_zh")
    private String messageZh;
    
	public String getResultCode() {
		return resultCode;
	}
	public void setResultCode(String resultCode) {
		this.resultCode = resultCode;
	}
	public String getRefCode() {
		return refCode;
	}
	public void setRefCode(String refCode) {
		this.refCode = refCode;
	}
	public String getMessageEn() {
		return messageEn;
	}
	public void setMessageEn(String messageEn) {
		this.messageEn = messageEn;
	}
	public String getMessageZh() {
		return messageZh;
	}
	public void setMessageZh(String messageZh) {
		this.messageZh = messageZh;
	}

}
