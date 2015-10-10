package com.ifwd.fwdhk.connector.response.eliteterm;

import com.ifwd.fwdhk.connector.response.BaseResponse;

public class GetEliteTermPremiumResponse extends BaseResponse {
	private static final long serialVersionUID = 1L;

	private String monthlyPremium;
	private String monthlyDiscountPremium;
	private String monthlyDuePremium;
	private String promoCode;
	private String value;
	private String promoCodeType;
	private String duration;
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
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getPromoCodeType() {
		return promoCodeType;
	}
	public void setPromoCodeType(String promoCodeType) {
		this.promoCodeType = promoCodeType;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
}
