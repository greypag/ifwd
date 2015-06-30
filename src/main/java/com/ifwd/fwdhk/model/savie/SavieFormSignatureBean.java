package com.ifwd.fwdhk.model.savie;

import java.awt.Image;

public class SavieFormSignatureBean {
	
	private boolean digitalSignature;
	
	private Image signature;

	public boolean isDigitalSignature() {
		return digitalSignature;
	}

	public void setDigitalSignature(boolean digitalSignature) {
		this.digitalSignature = digitalSignature;
	}

	public Image getSignature() {
		return signature;
	}

	public void setSignature(Image signature) {
		this.signature = signature;
	}
	
	
	
}
