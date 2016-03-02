package com.ifwd.fwdhk.model.savieOnline;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.ifwd.fwdhk.exception.ValidateExceptions;
import com.ifwd.utils.ErrorMessageUtils;
import com.ifwd.utils.ValidationUtils;
public class LifeDeclarationBean implements Serializable {
	private final static Logger logger = LoggerFactory.getLogger(LifeDeclarationBean.class);
	private static final long serialVersionUID = 1L;

	private Boolean hasReadAndAcceptFATC;
	private Boolean hasReadAndAcceptFATC2;
	private Boolean hasReadAndAcceptPICS;
	private Boolean hasReadAndAcceptCancellation;
	private Boolean hasReadAndAgreeApplication;
	private Boolean chkboxDoNotSendMarketingInfo;
	private Boolean chkboxDoNotProvidePersonalData;
	
	public void validate(String language) throws ValidateExceptions {
		List<String> list = new ArrayList<String>();
        /*if(ValidationUtils.isNullOrEmpty(this.bankCode)){
        	list.add(ErrorMessageUtils.getMessage("bankCode", "validation.failure", language));
        }*/
		if (list.size() > 0) {
			throw new ValidateExceptions(list);
		}
	}

	public Boolean getHasReadAndAcceptFATC() {
		return hasReadAndAcceptFATC;
	}

	public void setHasReadAndAcceptFATC(Boolean hasReadAndAcceptFATC) {
		this.hasReadAndAcceptFATC = hasReadAndAcceptFATC;
	}

	public Boolean getHasReadAndAcceptFATC2() {
		return hasReadAndAcceptFATC2;
	}

	public void setHasReadAndAcceptFATC2(Boolean hasReadAndAcceptFATC2) {
		this.hasReadAndAcceptFATC2 = hasReadAndAcceptFATC2;
	}

	public Boolean getHasReadAndAcceptPICS() {
		return hasReadAndAcceptPICS;
	}

	public void setHasReadAndAcceptPICS(Boolean hasReadAndAcceptPICS) {
		this.hasReadAndAcceptPICS = hasReadAndAcceptPICS;
	}

	public Boolean getHasReadAndAcceptCancellation() {
		return hasReadAndAcceptCancellation;
	}

	public void setHasReadAndAcceptCancellation(Boolean hasReadAndAcceptCancellation) {
		this.hasReadAndAcceptCancellation = hasReadAndAcceptCancellation;
	}

	public Boolean getHasReadAndAgreeApplication() {
		return hasReadAndAgreeApplication;
	}

	public void setHasReadAndAgreeApplication(Boolean hasReadAndAgreeApplication) {
		this.hasReadAndAgreeApplication = hasReadAndAgreeApplication;
	}

	public Boolean getChkboxDoNotSendMarketingInfo() {
		return chkboxDoNotSendMarketingInfo;
	}

	public void setChkboxDoNotSendMarketingInfo(Boolean chkboxDoNotSendMarketingInfo) {
		this.chkboxDoNotSendMarketingInfo = chkboxDoNotSendMarketingInfo;
	}

	public Boolean getChkboxDoNotProvidePersonalData() {
		return chkboxDoNotProvidePersonalData;
	}

	public void setChkboxDoNotProvidePersonalData(
			Boolean chkboxDoNotProvidePersonalData) {
		this.chkboxDoNotProvidePersonalData = chkboxDoNotProvidePersonalData;
	}

	
}
