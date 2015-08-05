package com.ifwd.fwdhk.model;

import java.io.Serializable;

public class SendEmailInfo implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	String dreamName;
	
	String dreamLevelDescription;
	
	int dreamBudget;
	
	int currentSavings;
	
	int savingPeriod;
	
	int annualReturnRate;
	
	float monthSavingsNoInterest;
	
	float monthSavingsWithInterest;
	
	String playerEmail;

	public String getDreamName() {
		return dreamName;
	}

	public void setDreamName(String dreamName) {
		this.dreamName = dreamName;
	}

	public String getDreamLevelDescription() {
		return dreamLevelDescription;
	}

	public void setDreamLevelDescription(String dreamLevelDescription) {
		this.dreamLevelDescription = dreamLevelDescription;
	}

	public int getDreamBudget() {
		return dreamBudget;
	}

	public void setDreamBudget(int dreamBudget) {
		this.dreamBudget = dreamBudget;
	}

	public int getCurrentSavings() {
		return currentSavings;
	}

	public void setCurrentSavings(int currentSavings) {
		this.currentSavings = currentSavings;
	}

	public int getSavingPeriod() {
		return savingPeriod;
	}

	public void setSavingPeriod(int savingPeriod) {
		this.savingPeriod = savingPeriod;
	}

	public int getAnnualReturnRate() {
		return annualReturnRate;
	}

	public void setAnnualReturnRate(int annualReturnRate) {
		this.annualReturnRate = annualReturnRate;
	}

	public float getMonthSavingsNoInterest() {
		return monthSavingsNoInterest;
	}

	public void setMonthSavingsNoInterest(float monthSavingsNoInterest) {
		this.monthSavingsNoInterest = monthSavingsNoInterest;
	}

	public float getMonthSavingsWithInterest() {
		return monthSavingsWithInterest;
	}

	public void setMonthSavingsWithInterest(float monthSavingsWithInterest) {
		this.monthSavingsWithInterest = monthSavingsWithInterest;
	}

	public String getPlayerEmail() {
		return playerEmail;
	}

	public void setPlayerEmail(String playerEmail) {
		this.playerEmail = playerEmail;
	}

	
}
