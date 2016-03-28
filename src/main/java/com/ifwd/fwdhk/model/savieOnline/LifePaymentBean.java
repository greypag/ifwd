package com.ifwd.fwdhk.model.savieOnline;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.ifwd.fwdhk.exception.ValidateExceptions;
import com.ifwd.fwdhk.model.OptionItemDesc;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.InitApplicationMessage;
import com.ifwd.utils.ErrorMessageUtils;
import com.ifwd.utils.ValidationUtils;
public class LifePaymentBean implements Serializable {
	private final static Logger logger = LoggerFactory.getLogger(LifePaymentBean.class);
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private CommonUtils commonUtils;

	private Boolean payment;
	private String paymentMethod;
	private String bankCode;
	private String bankEnName;
	private String bankCnName;
	private String branchCode;
	private String branchEnName;
	private String branchCnName;
	private String accountNumber;
	private String accountHolderName;
	private String paymentAmount;
	private String type;
	
	public void validate(String language) throws ValidateExceptions {
		if(!"".equals(this.bankCode)){
			for(OptionItemDesc item:InitApplicationMessage.bankCodeEN){
				if(this.bankCode.equals(item.getItemCode())){
					this.bankEnName = item.getItemDesc();
					break;
				}
			}
			for(OptionItemDesc item:InitApplicationMessage.bankCodeCN){
				if(this.bankCode.equals(item.getItemCode())){
					this.bankCnName = item.getItemDesc();
					break;
				}
			}
		}
		
		if(!"".equals(this.branchCode)){
			for(OptionItemDesc item:InitApplicationMessage.getOccupationByNob(commonUtils, this.bankCode, "EN", "1")){
				if(this.branchCode.equals(item.getItemCode())){
					this.branchEnName = item.getItemDesc();
					break;
				}
			}
			for(OptionItemDesc item:InitApplicationMessage.getOccupationByNob(commonUtils, this.bankCode, "CH", "1")){
				if(this.branchCode.equals(item.getItemCode())){
					this.branchCnName = item.getItemDesc();
					break;
				}
			}
		}
		
		List<String> list = new ArrayList<String>();
        /*if(ValidationUtils.isNullOrEmpty(this.bankCode)){
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
        }*/
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



	



	public String getBankEnName() {
		return bankEnName;
	}



	public void setBankEnName(String bankEnName) {
		this.bankEnName = bankEnName;
	}



	public String getBankCnName() {
		return bankCnName;
	}



	public void setBankCnName(String bankCnName) {
		this.bankCnName = bankCnName;
	}



	public String getBranchEnName() {
		return branchEnName;
	}



	public void setBranchEnName(String branchEnName) {
		this.branchEnName = branchEnName;
	}



	public String getBranchCnName() {
		return branchCnName;
	}



	public void setBranchCnName(String branchCnName) {
		this.branchCnName = branchCnName;
	}



	public String getType() {
		return type;
	}



	public void setType(String type) {
		this.type = type;
	}
	
}
