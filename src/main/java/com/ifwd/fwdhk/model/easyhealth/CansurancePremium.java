package com.ifwd.fwdhk.model.easyhealth;

import java.util.List;

import net.sf.ezmorph.bean.MorphDynaBean;

public class CansurancePremium {
	private String gender;
	private String dob;
	private List<CansurancePremiumPlan> plans;
	private String referralCode;
	
	private String errMsgs;
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public List<CansurancePremiumPlan> getPlans() {
		return plans;
	}
	public void setPlans(List<CansurancePremiumPlan> plans) {
		this.plans = plans;
	}
	public String getErrMsgs() {
		return errMsgs;
	}
	public void setErrMsgs(String errMsgs) {
		this.errMsgs = errMsgs;
	}
	public String getReferralCode() {
		return referralCode;
	}
	public void setReferralCode(String referralCode) {
		this.referralCode = referralCode;
	}
	
	
	
	
}
