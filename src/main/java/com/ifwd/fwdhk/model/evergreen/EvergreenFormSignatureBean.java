package com.ifwd.fwdhk.model.evergreen;

public class EvergreenFormSignatureBean {
	
	//base64
	//private browser information
	private boolean signatureType;
	private String base64;
	private EvergreenBrowserBean browser;
	
	public boolean isSignatureType() {
		return signatureType;
	}
	public void setSignatureType(boolean signatureType) {
		this.signatureType = signatureType;
	}
	public String getBase64() {
		return base64;
	}
	public void setBase64(String base64) {
		this.base64 = base64;
	}
	public EvergreenBrowserBean getBrowser() {
		return browser;
	}
	public void setBrowser(EvergreenBrowserBean browser) {
		this.browser = browser;
	}
	
	
	
	

	
	
}
