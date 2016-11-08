package com.ifwd.fwdhk.model.tngsavie;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class PhwCallerRequest {

	@JsonProperty("sessionKey")
	public String sessionKey;
	@JsonProperty("company")
	public String company;
	@JsonProperty("Isvalid")
	public Boolean isvalid;
	@JsonProperty("msgCls")
	public String msgCls;
	@JsonProperty("customerId")
	public String customerId;
	@JsonProperty("userId")
	public String userId;
	@JsonProperty("application")
	public String application;
	
	public String getSessionKey() {
		return sessionKey;
	}
	public void setSessionKey(String sessionKey) {
		this.sessionKey = sessionKey;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public Boolean getIsvalid() {
		return isvalid;
	}
	public void setIsvalid(Boolean isvalid) {
		this.isvalid = isvalid;
	}
	public Object getMsgCls() {
		return msgCls;
	}
	public void setMsgCls(String msgCls) {
		this.msgCls = msgCls;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getApplication() {
		return application;
	}
	public void setApplication(String application) {
		this.application = application;
	}

}