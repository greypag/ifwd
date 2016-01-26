package com.ifwd.fwdhk.model.savieOnline;

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

public class SaviePlanDetailsBean implements Serializable {
	private final static Logger logger = LoggerFactory.getLogger(SaviePlanDetailsBean.class);
	private static final long serialVersionUID = 1L;
	
	private String insuredAmount;
	private String dob;
	private String promoCode;
	
	public void validate(String language) throws ValidateExceptions {
        List<String> list = new ArrayList<String>();
        if(this.insuredAmount == null || "".equals(this.insuredAmount)){
        	list.add(ErrorMessageUtils.getMessage("insuredAmount", "validation.failure", language));
        }
        else if(Integer.valueOf(this.insuredAmount)<30000 || Integer.valueOf(this.insuredAmount)>400000){
        	list.add(ErrorMessageUtils.getMessage("insuredAmount", "validation.failure", language));
        }
        
        if(!ValidationUtils.isValidDate(this.dob)){
        	list.add(ErrorMessageUtils.getMessage("dob", "validation.failure", language));
        }
        else if(DateApi.getAge(DateApi.formatDate2(this.dob))<18 || DateApi.getAge(DateApi.formatDate2(this.dob))>100){
        	int age = DateApi.getAge(DateApi.formatDate2(this.dob));
            logger.info(age+"");
        	list.add(ErrorMessageUtils.getMessage("dob", "validation.failure", language));
        }
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
}
