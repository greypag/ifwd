package com.ifwd.fwdhk.model.tngsavie;


public class TngLinkupSaveRequest {
	
	private String merTradeNo;
	private String recurrentToken;
	private String msg;
	private String resultCode;
	private String extras;
	private String sign;
	
	public String getMerTradeNo() {
		return merTradeNo;
	}
	public void setMerTradeNo(String merTradeNo) {
		this.merTradeNo = merTradeNo;
	}
	public String getRecurrentToken() {
		return recurrentToken;
	}
	public void setRecurrentToken(String recurrentToken) {
		this.recurrentToken = recurrentToken;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getResultCode() {
		return resultCode;
	}
	public void setResultCode(String resultCode) {
		this.resultCode = resultCode;
	}
	public String getExtras() {
		return extras;
	}
	public void setExtras(String extras) {
		this.extras = extras;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}
	
}
