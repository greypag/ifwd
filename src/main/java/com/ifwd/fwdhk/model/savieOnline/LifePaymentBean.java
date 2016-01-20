package com.ifwd.fwdhk.model.savieOnline;

import java.io.Serializable;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.ifwd.utils.ValidationExceptions;
import com.ifwd.utils.ValidationUtils;

public class LifePaymentBean implements Serializable {
	private final static Logger logger = LoggerFactory.getLogger(LifePaymentBean.class);
	private static final long serialVersionUID = 1L;

	private Boolean payOnline;
	private String bankCode;
	private String branchCode;
	private String accountNumber;
	private String accountHolderName;
	private String paymentAmount;
	
	public void validate(HttpServletRequest request) throws ValidationExceptions {
		ValidationUtils.validation("NOTNULL", "bankCode", bankCode, request);
		ValidationUtils.validation("NOTNULL", "branchCode", branchCode, request);
		ValidationUtils.validation("NOTNULL", "accountNumber", accountNumber, request);
		ValidationUtils.validation("NOTNULL", "accountHolderName", accountHolderName, request);
		ValidationUtils.validation("NOTNULL", "paymentAmount", paymentAmount, request);
		ValidationUtils.sendMsg();
	}

	public Boolean getPayOnline() {
		return payOnline;
	}

	public void setPayOnline(Boolean payOnline) {
		this.payOnline = payOnline;
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
}
