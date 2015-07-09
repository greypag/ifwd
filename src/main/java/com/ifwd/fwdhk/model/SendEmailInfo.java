package com.ifwd.fwdhk.model;

import java.io.Serializable;

public class SendEmailInfo implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	String dream_name;
	
	String dream_level_description;
	
	int dream_budget;
	
	int current_savings;
	
	int saving_period;
	
	int annual_return_rate;
	
	float month_savings_no_interest;
	
	float month_savings_with_interest;
	
	String player_email;
	
	String token;
	
	String username;

	public String getDream_name() {
		return dream_name;
	}

	public void setDream_name(String dream_name) {
		this.dream_name = dream_name;
	}

	public String getDream_level_description() {
		return dream_level_description;
	}

	public void setDream_level_description(String dream_level_description) {
		this.dream_level_description = dream_level_description;
	}

	public int getDream_budget() {
		return dream_budget;
	}

	public void setDream_budget(int dream_budget) {
		this.dream_budget = dream_budget;
	}

	public int getCurrent_savings() {
		return current_savings;
	}

	public void setCurrent_savings(int current_savings) {
		this.current_savings = current_savings;
	}

	public int getSaving_period() {
		return saving_period;
	}

	public void setSaving_period(int saving_period) {
		this.saving_period = saving_period;
	}

	public int getAnnual_return_rate() {
		return annual_return_rate;
	}

	public void setAnnual_return_rate(int annual_return_rate) {
		this.annual_return_rate = annual_return_rate;
	}

	public float getMonth_savings_no_interest() {
		return month_savings_no_interest;
	}

	public void setMonth_savings_no_interest(float month_savings_no_interest) {
		this.month_savings_no_interest = month_savings_no_interest;
	}

	public float getMonth_savings_with_interest() {
		return month_savings_with_interest;
	}

	public void setMonth_savings_with_interest(float month_savings_with_interest) {
		this.month_savings_with_interest = month_savings_with_interest;
	}

	public String getPlayer_email() {
		return player_email;
	}

	public void setPlayer_email(String player_email) {
		this.player_email = player_email;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	
	
}
