package com.ifwd.fwdhk.model.easyhealth;

import java.util.List;

import net.sf.ezmorph.bean.MorphDynaBean;

public class EasyHealthPremium {
	private String gender;
	private String dob;
	private List<MorphDynaBean> plans;
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
	public List<MorphDynaBean> getPlans() {
		return plans;
	}
	public void setPlans(List<MorphDynaBean> plans) {
		this.plans = plans;
	}
	public String getErrMsgs() {
		return errMsgs;
	}
	public void setErrMsgs(String errMsgs) {
		this.errMsgs = errMsgs;
	}
	
	
}
