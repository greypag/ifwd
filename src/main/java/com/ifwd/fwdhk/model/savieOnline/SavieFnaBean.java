package com.ifwd.fwdhk.model.savieOnline;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ifwd.fwdhk.exception.ValidateExceptions;
import com.ifwd.fwdhk.util.ValidationUtils;
import com.ifwd.utils.ErrorMessageUtils;

public class SavieFnaBean implements Serializable {
	private final static Logger logger = LoggerFactory.getLogger(SavieFnaBean.class);
	private static final long serialVersionUID = 1L;
	
	private String v;
	private String user_name;
	private String name;
	private String gender;
	private String dob;
	private String marital_status;
	private String dependents;
	private String education;
	private String employment_status;
	private String nature_of_business;
	private String occupation;
	private String occupation_others;
	private String q1;
	private String q1_others;
	private String q2;
	private String q2_others;
	private String q3;
	private String q4;
	private String q4_a;
	private String q4_a_others;
	private String q4_b;
	private String q4_b_amount;
	private String q4_b_others;
	private String q4_c;
	private String q4_d_1;
	private String q4_d_2;
	private String q4_e;
	private String q4_f;
	private String q4_g;
	private String q4_g_others;
	private String last_update;
	
	public void validate(String language) throws ValidateExceptions {
        List<String> list = new ArrayList<String>();
        /*if(this.insuredAmount == null || "".equals(this.insuredAmount)){
        	list.add(ErrorMessageUtils.getMessage("insuredAmount", "validation.failure", language));
        }
        if(!ValidationUtils.isValidDate(this.dob)){
        	list.add(ErrorMessageUtils.getMessage("dob", "validation.failure", language));
        }*/
        
		if(StringUtils.isNotEmpty(gender) && !ValidationUtils.isInteger(gender)){
			list.add(ErrorMessageUtils.getMessage("gender", "validation.failure", language));
		}
		
		if(StringUtils.isNotEmpty(marital_status) && !ValidationUtils.isInteger(marital_status)){
			list.add(ErrorMessageUtils.getMessage("marital_status", "validation.failure", language));
		}
		
		if(StringUtils.isNotEmpty(dependents) && !ValidationUtils.isInteger(dependents)){
			list.add(ErrorMessageUtils.getMessage("dependents", "validation.failure", language));
		}
		
		if(StringUtils.isNotEmpty(education) && !ValidationUtils.isInteger(education)){
			list.add(ErrorMessageUtils.getMessage("education", "validation.failure", language));
		}
		
		if(StringUtils.isNotEmpty(q3) && !ValidationUtils.isInteger(q3)){
			list.add(ErrorMessageUtils.getMessage("q3", "validation.failure", language));
		}
		
		if(StringUtils.isNotEmpty(q4) && !ValidationUtils.isInteger(q4)){
			list.add(ErrorMessageUtils.getMessage("q4", "validation.failure", language));
		}
		
		if(StringUtils.isNotEmpty(q4_a) && !ValidationUtils.isInteger(q4_a)){
			list.add(ErrorMessageUtils.getMessage("q4_a", "validation.failure", language));
		}
		
		if(StringUtils.isNotEmpty(q4_a_others) && !ValidationUtils.isBigInteger(q4_a_others)){
			list.add(ErrorMessageUtils.getMessage("q4_a_others", "validation.failure", language));
		}
		
		if(StringUtils.isNotEmpty(q4_b_amount) && !ValidationUtils.isBigInteger(q4_b_amount)){
			list.add(ErrorMessageUtils.getMessage("q4_b_amount", "validation.failure", language));
		}
		
		if(StringUtils.isNotEmpty(q4_c) && !ValidationUtils.isBigInteger(q4_c)){
			list.add(ErrorMessageUtils.getMessage("q4_c", "validation.failure", language));
		}
		
		if(StringUtils.isNotEmpty(q4_d_1) && !ValidationUtils.isBigInteger(q4_d_1)){
			list.add(ErrorMessageUtils.getMessage("q4_d_1", "validation.failure", language));
		}
		
		if(StringUtils.isNotEmpty(q4_d_2) && !ValidationUtils.isBigInteger(q4_d_2)){
			list.add(ErrorMessageUtils.getMessage("q4_d_2", "validation.failure", language));
		}
		
		if(StringUtils.isNotEmpty(q4_e) && !ValidationUtils.isInteger(q4_e)){
			list.add(ErrorMessageUtils.getMessage("q4_e", "validation.failure", language));
		}
		
		if(StringUtils.isNotEmpty(q4_f) && !ValidationUtils.isInteger(q4_f)){
			list.add(ErrorMessageUtils.getMessage("q4_f", "validation.failure", language));
		}
		
		if (list.size() > 0) {
			throw new ValidateExceptions(list);
		}
	}

	public String getV() {
		return v;
	}

	public void setV(String v) {
		this.v = v;
	}

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

	public String getMarital_status() {
		return marital_status;
	}

	public void setMarital_status(String marital_status) {
		this.marital_status = marital_status;
	}

	public String getDependents() {
		return dependents;
	}

	public void setDependents(String dependents) {
		this.dependents = dependents;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getEmployment_status() {
		return employment_status;
	}

	public void setEmployment_status(String employment_status) {
		this.employment_status = employment_status;
	}

	public String getNature_of_business() {
		return nature_of_business;
	}

	public void setNature_of_business(String nature_of_business) {
		this.nature_of_business = nature_of_business;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public String getOccupation_others() {
		return occupation_others;
	}

	public void setOccupation_others(String occupation_others) {
		this.occupation_others = occupation_others;
	}

	public String getQ1() {
		return q1;
	}

	public void setQ1(String q1) {
		this.q1 = q1;
	}

	public String getQ1_others() {
		return q1_others;
	}

	public void setQ1_others(String q1_others) {
		this.q1_others = q1_others;
	}

	public String getQ2() {
		return q2;
	}

	public void setQ2(String q2) {
		this.q2 = q2;
	}

	public String getQ2_others() {
		return q2_others;
	}

	public void setQ2_others(String q2_others) {
		this.q2_others = q2_others;
	}

	public String getQ3() {
		return q3;
	}

	public void setQ3(String q3) {
		this.q3 = q3;
	}

	public String getQ4() {
		return q4;
	}

	public void setQ4(String q4) {
		this.q4 = q4;
	}

	public String getQ4_a() {
		return q4_a;
	}

	public void setQ4_a(String q4_a) {
		this.q4_a = q4_a;
	}

	public String getQ4_a_others() {
		return q4_a_others;
	}

	public void setQ4_a_others(String q4_a_others) {
		this.q4_a_others = q4_a_others;
	}

	public String getQ4_b() {
		return q4_b;
	}

	public void setQ4_b(String q4_b) {
		this.q4_b = q4_b;
	}

	public String getQ4_b_amount() {
		return q4_b_amount.replace(",", "");
	}

	public void setQ4_b_amount(String q4_b_amount) {
		this.q4_b_amount = q4_b_amount;
	}

	public String getQ4_b_others() {
		return q4_b_others;
	}

	public void setQ4_b_others(String q4_b_others) {
		this.q4_b_others = q4_b_others;
	}

	public String getQ4_c() {
		return q4_c;
	}

	public void setQ4_c(String q4_c) {
		this.q4_c = q4_c;
	}

	public String getQ4_d_1() {
		return q4_d_1;
	}

	public void setQ4_d_1(String q4_d_1) {
		this.q4_d_1 = q4_d_1;
	}

	public String getQ4_d_2() {
		return q4_d_2;
	}

	public void setQ4_d_2(String q4_d_2) {
		this.q4_d_2 = q4_d_2;
	}

	public String getQ4_e() {
		return q4_e;
	}

	public void setQ4_e(String q4_e) {
		this.q4_e = q4_e;
	}

	public String getQ4_f() {
		return q4_f;
	}

	public void setQ4_f(String q4_f) {
		this.q4_f = q4_f;
	}

	public String getQ4_g() {
		return q4_g;
	}

	public void setQ4_g(String q4_g) {
		this.q4_g = q4_g;
	}

	public String getQ4_g_others() {
		return q4_g_others;
	}

	public void setQ4_g_others(String q4_g_others) {
		this.q4_g_others = q4_g_others;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLast_update() {
		return last_update;
	}

	public void setLast_update(String last_update) {
		this.last_update = last_update;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
}
