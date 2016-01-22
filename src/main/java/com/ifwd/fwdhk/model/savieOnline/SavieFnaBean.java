package com.ifwd.fwdhk.model.savieOnline;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.ifwd.fwdhk.exception.ValidateExceptions;
import com.ifwd.utils.ErrorMessageUtils;
import com.ifwd.utils.ValidationUtils;

public class SavieFnaBean implements Serializable {
	private final static Logger logger = LoggerFactory.getLogger(SavieFnaBean.class);
	private static final long serialVersionUID = 1L;
	
	private String name;
	private String gender;
	private String dob;
	private String martialStatus;
	private String dependents;
	private String education;
	private String employmentStatus;
	private String natureOfBusiness;
	private String occupation;
	private String q1;
	private String q1Others;
	private String q2;
	private String q2Others;
	private String q3;
	private String q4;
	private String q4a;
	private String q4aOthers;
	private String q4b;
	private String q4bAmount;
	private String q4bOthers;
	private String q4c;
	private String q4d1;
	private String q4d2;
	private String q4e;
	private String q4f;
	private String q4g;
	private String q4gOthers;
	private String lastUpdate;
	
	public void validate(String language) throws ValidateExceptions {
        List<String> list = new ArrayList<String>();
        /*if(this.insuredAmount == null || "".equals(this.insuredAmount)){
        	list.add(ErrorMessageUtils.getMessage("insuredAmount", "validation.failure", language));
        }
        if(!ValidationUtils.isValidDate(this.dob)){
        	list.add(ErrorMessageUtils.getMessage("dob", "validation.failure", language));
        }*/
		if (list.size() > 0) {
			throw new ValidateExceptions(list);
		}
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getMartialStatus() {
		return martialStatus;
	}

	public void setMartialStatus(String martialStatus) {
		this.martialStatus = martialStatus;
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

	public String getEmploymentStatus() {
		return employmentStatus;
	}

	public void setEmploymentStatus(String employmentStatus) {
		this.employmentStatus = employmentStatus;
	}

	public String getNatureOfBusiness() {
		return natureOfBusiness;
	}

	public void setNatureOfBusiness(String natureOfBusiness) {
		this.natureOfBusiness = natureOfBusiness;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public String getQ1() {
		return q1;
	}

	public void setQ1(String q1) {
		this.q1 = q1;
	}

	public String getQ1Others() {
		return q1Others;
	}

	public void setQ1Others(String q1Others) {
		this.q1Others = q1Others;
	}

	public String getQ2() {
		return q2;
	}

	public void setQ2(String q2) {
		this.q2 = q2;
	}

	public String getQ2Others() {
		return q2Others;
	}

	public void setQ2Others(String q2Others) {
		this.q2Others = q2Others;
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

	public String getQ4a() {
		return q4a;
	}

	public void setQ4a(String q4a) {
		this.q4a = q4a;
	}

	public String getQ4aOthers() {
		return q4aOthers;
	}

	public void setQ4aOthers(String q4aOthers) {
		this.q4aOthers = q4aOthers;
	}

	public String getQ4b() {
		return q4b;
	}

	public void setQ4b(String q4b) {
		this.q4b = q4b;
	}

	public String getQ4bAmount() {
		return q4bAmount;
	}

	public void setQ4bAmount(String q4bAmount) {
		this.q4bAmount = q4bAmount;
	}

	public String getQ4bOthers() {
		return q4bOthers;
	}

	public void setQ4bOthers(String q4bOthers) {
		this.q4bOthers = q4bOthers;
	}

	public String getQ4c() {
		return q4c;
	}

	public void setQ4c(String q4c) {
		this.q4c = q4c;
	}

	public String getQ4d1() {
		return q4d1;
	}

	public void setQ4d1(String q4d1) {
		this.q4d1 = q4d1;
	}

	public String getQ4d2() {
		return q4d2;
	}

	public void setQ4d2(String q4d2) {
		this.q4d2 = q4d2;
	}

	public String getQ4e() {
		return q4e;
	}

	public void setQ4e(String q4e) {
		this.q4e = q4e;
	}

	public String getQ4f() {
		return q4f;
	}

	public void setQ4f(String q4f) {
		this.q4f = q4f;
	}

	public String getQ4g() {
		return q4g;
	}

	public void setQ4g(String q4g) {
		this.q4g = q4g;
	}

	public String getQ4gOthers() {
		return q4gOthers;
	}

	public void setQ4gOthers(String q4gOthers) {
		this.q4gOthers = q4gOthers;
	}

	public String getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(String lastUpdate) {
		this.lastUpdate = lastUpdate;
	}
	
	
}
