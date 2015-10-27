package com.ifwd.fwdhk.connector.response.eliteterm;

import com.ifwd.fwdhk.connector.response.BaseResponse;

public class GetEliteTermPremiumResponse extends BaseResponse {
	private static final long serialVersionUID = 1L;

	private String monthlyPremium;
	private String monthlyDiscountPremium;
	private String monthlyDuePremium;
	private String dailyDuePremium;
	private String promoCode;
	private String promoValue;
	private String promoCodeType;
	private String promoName;
	private String effectivePeriod;
	public String getMonthlyPremium() {
		return monthlyPremium;
	}
	public void setMonthlyPremium(String monthlyPremium) {
		this.monthlyPremium = monthlyPremium;
	}
	public String getMonthlyDiscountPremium() {
		return monthlyDiscountPremium;
	}
	public void setMonthlyDiscountPremium(String monthlyDiscountPremium) {
		this.monthlyDiscountPremium = monthlyDiscountPremium;
	}
	public String getMonthlyDuePremium() {
		return monthlyDuePremium;
	}
	public void setMonthlyDuePremium(String monthlyDuePremium) {
		this.monthlyDuePremium = monthlyDuePremium;
	}
	public String getPromoCode() {
		return promoCode;
	}
	public void setPromoCode(String promoCode) {
		this.promoCode = promoCode;
	}
	
	public String getPromoValue() {
		return promoValue;
	}
	public void setPromoValue(String promoValue) {
		this.promoValue = promoValue;
	}
	public String getPromoName() {
		return promoName;
	}
	public void setPromoName(String promoName) {
		this.promoName = promoName;
	}
	public String getEffectivePeriod() {
		return effectivePeriod;
	}
	public void setEffectivePeriod(String effectivePeriod) {
		this.effectivePeriod = effectivePeriod;
	}
	public String getPromoCodeType() {
		return promoCodeType;
	}
	public void setPromoCodeType(String promoCodeType) {
		this.promoCodeType = promoCodeType;
	}
	public String getDailyDuePremium() {
		return dailyDuePremium;
	}
	public void setDailyDuePremium(String dailyDuePremium) {
		this.dailyDuePremium = dailyDuePremium;
	}
}
