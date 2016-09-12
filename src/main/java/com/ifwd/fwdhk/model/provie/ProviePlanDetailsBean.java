package com.ifwd.fwdhk.model.provie;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ifwd.fwdhk.exception.ValidateExceptions;
import com.ifwd.fwdhk.util.DateApi;
import com.ifwd.utils.ErrorMessageUtils;
import com.ifwd.utils.ValidationUtils;

public class ProviePlanDetailsBean implements Serializable {
	private final static Logger logger = LoggerFactory.getLogger(ProviePlanDetailsBean.class);
	private static final long serialVersionUID = 1L;
	
	private String insuredAmount;
	private String insuredAmount1;
	private String paymentType;
	private String dob;
	private String promoCode;
	private String dob1;
	private String dob2;
	private String insuredAmountDiscount;
	private String insuredAmountDue;
	private String currency;
	private String paymentYear;
	private String rider;
	
	public ProviePlanDetailsBean() {
		
	}
	
	public ProviePlanDetailsBean(String premium, String planCode,
			String dob, String promoCode, String currency, String rider) {
		this.setInsuredAmount(premium);
		this.setPaymentType(planCode);
		this.setDob(dob);
		this.setPromoCode(promoCode);
		
		this.setPaymentYear(null);
		this.setCurrency(currency);
		this.setRider(rider);
		
	}


	public ProviePlanDetailsBean(String premium, String planCode,
			String dob, String promoCode, String currency, String rider, String paymentYear) {
		this.setInsuredAmount(premium);
		this.setPaymentType(planCode);
		this.setDob(dob);
		this.setPromoCode(promoCode);
		
		this.setPaymentYear(paymentYear);
		this.setCurrency(currency);
		this.setRider(rider);
	}

	public void validate(String language) throws ValidateExceptions {
        List<String> list = new ArrayList<String>();
        /*if(this.insuredAmount == null || "".equals(this.insuredAmount)){
        	list.add(ErrorMessageUtils.getMessage("insuredAmount", "validation.failure", language));
        }
        else if(Integer.valueOf(this.insuredAmount)<30000 || Integer.valueOf(this.insuredAmount)>400000){
        	list.add(ErrorMessageUtils.getMessage("insuredAmount", "validation.failure", language));
        }
        if(ValidationUtils.isValidDate(this.dob)){
        	list.add(ErrorMessageUtils.getMessage("dob", "validation.failure", language));
        }
        else if(DateApi.getAge(DateApi.formatDate(this.dob))<18 || DateApi.getAge(DateApi.formatDate(this.dob))>100){
        	int age = DateApi.getAge(DateApi.formatDate(this.dob));
            logger.info(age+"");
        	list.add(ErrorMessageUtils.getMessage("dob", "validation.failure", language));
        }*/
		if (list.size() > 0) {
			throw new ValidateExceptions(list);
		}
	}
	
	
	public String getInsuredAmount() {
		return insuredAmount;
	}


	public void setInsuredAmount(String insuredAmount) {
		this.insuredAmount = insuredAmount;
	}


	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getPromoCode() {
		return promoCode;
	}
	public void setPromoCode(String promoCode) {
		this.promoCode = promoCode;
	}

	public String getDob1() {
		return dob1;
	}

	public void setDob1(String dob1) {
		this.dob1 = dob1;
	}

	public String getDob2() {
		return dob2;
	}

	public void setDob2(String dob2) {
		this.dob2 = dob2;
	}

	public String getInsuredAmount1() {
		return insuredAmount1;
	}

	public void setInsuredAmount1(String insuredAmount1) {
		this.insuredAmount1 = insuredAmount1;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public String getInsuredAmountDiscount() {
		return insuredAmountDiscount;
	}

	public void setInsuredAmountDiscount(String insuredAmountDiscount) {
		this.insuredAmountDiscount = insuredAmountDiscount;
	}

	public String getInsuredAmountDue() {
		return insuredAmountDue;
	}

	public void setInsuredAmountDue(String insuredAmountDue) {
		this.insuredAmountDue = insuredAmountDue;
	}
	
	public String getCurrency() {
		return currency;
	}


	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public String getRider() {
		return rider;
	}

	public void setRider(String rider) {
		this.rider = rider;
	}
	
	public String getPaymentYear() {
		return paymentYear;
	}


	public void setPaymentYear(String paymentYear) {
		this.paymentYear = paymentYear;
	}


}
