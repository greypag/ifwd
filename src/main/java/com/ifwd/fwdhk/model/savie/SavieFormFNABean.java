package com.ifwd.fwdhk.model.savie;

public class SavieFormFNABean {
	
	private boolean HKCitizen;
	
	private boolean FNA;
	
	private boolean past12months;
	
	private boolean next12months;

	public boolean isHKCitizen() {
		return HKCitizen;
	}

	public void setHKCitizen(boolean hKCitizen) {
		HKCitizen = hKCitizen;
	}

	public boolean isFNA() {
		return FNA;
	}

	public void setFNA(boolean fNA) {
		FNA = fNA;
	}

	public boolean isPast12months() {
		return past12months;
	}

	public void setPast12months(boolean past12months) {
		this.past12months = past12months;
	}

	public boolean isNext12months() {
		return next12months;
	}

	public void setNext12months(boolean next12months) {
		this.next12months = next12months;
	}
	
	
	
}
