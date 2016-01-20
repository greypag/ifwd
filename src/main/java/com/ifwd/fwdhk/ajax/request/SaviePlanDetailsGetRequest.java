package com.ifwd.fwdhk.ajax.request;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ifwd.ecomm.exception.ValidationException;
import com.ifwd.utils.ValidationExceptions;
import com.ifwd.utils.ValidationUtils;
import com.ifwd.ws.request.AnnualTravelQuoteGetRequest;
import com.ifwd.ws.request.TravelQuoteGetRequest;

public class SaviePlanDetailsGetRequest implements Serializable {
	private final static Logger logger = LoggerFactory.getLogger(SaviePlanDetailsGetRequest.class);
	private static final long serialVersionUID = 1L;
	
	private String insuredAmount;
	private String dob;
	private String promoCode;
	
	
	
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
	public void validate(String language) throws ValidationException{
		List<String> list = new ArrayList<String>();
		
		
		
		// validate date
		if (ValidationUtils.isNullOrEmpty(this.insuredAmount)) {
			list.add("insuredAmount.notNull.message");		
		}
		if (ValidationUtils.isNullOrEmpty(this.dob)) {
			list.add("dob.notNull.message");		
		}
		
		
		
		if (list.size() > 0) {
			throw new ValidationException(list, language);
		}
			
		
	}
	
	
}
