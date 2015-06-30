package com.ifwd.fwdhk.model.savie;

import java.awt.Image;

public class SavieFormSignatureBean {
	
	//base64
	//private browser information
	private boolean signatureType;
	private String base64;
	private SavieBrowserBean browser;
	
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
	public SavieBrowserBean getBrowser() {
		return browser;
	}
	public void setBrowser(SavieBrowserBean browser) {
		this.browser = browser;
	}
	
	
	
	

	
	
}
