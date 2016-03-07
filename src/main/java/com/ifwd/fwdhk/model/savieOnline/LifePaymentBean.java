package com.ifwd.fwdhk.model.savieOnline;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.ifwd.fwdhk.exception.ValidateExceptions;
import com.ifwd.utils.ErrorMessageUtils;
import com.ifwd.utils.ValidationUtils;
public class LifePaymentBean implements Serializable {
	private final static Logger logger = LoggerFactory.getLogger(LifePaymentBean.class);
	private static final long serialVersionUID = 1L;

	private Boolean payment;
	private String paymentMethod;
	private String bankCode;
	private String bankName;
	private String branchCode;
	private String branchName;
	private String accountNumber;
	private String accountHolderName;
	private String paymentAmount;
	
	public void validate(String language) throws ValidateExceptions {
		this.bankName = this.bankCode !=null && !"".equals(this.bankCode)?this.bankCode.split("-")[1]:"";
		
		List<String> list = new ArrayList<String>();
        if(ValidationUtils.isNullOrEmpty(this.bankCode)){
        	list.add(ErrorMessageUtils.getMessage("bankCode", "validation.failure", language));
        }
        if(ValidationUtils.isNullOrEmpty(this.branchCode)){
        	list.add(ErrorMessageUtils.getMessage("branchCode", "validation.failure", language));
        }
        if(ValidationUtils.isNullOrEmpty(this.accountNumber)){
        	list.add(ErrorMessageUtils.getMessage("accountNumber", "validation.failure", language));
        }
        if(ValidationUtils.isNullOrEmpty(this.accountHolderName)){
        	list.add(ErrorMessageUtils.getMessage("accountHolderName", "validation.failure", language));
        }
        if(ValidationUtils.isNullOrEmpty(this.paymentAmount)){
        	list.add(ErrorMessageUtils.getMessage("paymentAmount", "validation.failure", language));
        }
		if (list.size() > 0) {
			throw new ValidateExceptions(list);
		}
	}

	

	public Boolean getPayment() {
		return payment;
	}



	public void setPayment(Boolean payment) {
		this.payment = payment;
	}



	public String getBankCode() {
		return bankCode;
	}

	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}

	public String getBranchCode() {
		return branchCode;
	}

	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}

	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

	public String getAccountHolderName() {
		return accountHolderName;
	}

	public void setAccountHolderName(String accountHolderName) {
		this.accountHolderName = accountHolderName;
	}

	public String getPaymentAmount() {
		return paymentAmount;
	}

	public void setPaymentAmount(String paymentAmount) {
		this.paymentAmount = paymentAmount;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}



	public String getBankName() {
		return bankName;
	}



	public void setBankName(String bankName) {
		this.bankName = bankName;
	}



	public String getBranchName() {
		return branchName;
	}



	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}
	
}
