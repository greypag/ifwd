package com.ifwd.fwdhk.model.savieOnline;

import java.io.Serializable;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.ifwd.utils.ValidationExceptions;
import com.ifwd.utils.ValidationUtils;

public class SaviePlanDetailsBean implements Serializable {
	private final static Logger logger = LoggerFactory.getLogger(SaviePlanDetailsBean.class);
	private static final long serialVersionUID = 1L;
	
	private String insuredAmount;
	private String dob;
	private String promoCode;
	
	public void validate(HttpServletRequest request) throws ValidationExceptions {
		ValidationUtils.validation("insuredAmount", "insuredAmount", insuredAmount, request);
		ValidationUtils.validation("dob","dob", dob, request);
		//ValidationUtils.validation("promoCode", promoCode, request);
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
}
