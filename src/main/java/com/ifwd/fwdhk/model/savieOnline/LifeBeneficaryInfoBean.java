package com.ifwd.fwdhk.model.savieOnline;

import java.io.Serializable;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.ifwd.utils.ValidationExceptions;
import com.ifwd.utils.ValidationUtils;

public class LifeBeneficaryInfoBean implements Serializable {
	private final static Logger logger = LoggerFactory.getLogger(LifeBeneficaryInfoBean.class);
	private static final long serialVersionUID = 1L;

	private Boolean isOwnEstate;
	private String beneficaryFirstName1;
	private String beneficaryLastName1;
	private String beneficaryChineseName1;
	private String beneficaryID1;
	private String beneficaryGender1;
	private String beneficaryRelation1;
	private String beneficaryWeight1;
	private String beneficaryFirstName2;
	private String beneficaryLastName2;
	private String beneficaryChineseName2;
	private String beneficaryID2;
	private String beneficaryGender2;
	private String beneficaryRelation2;
	private String beneficaryWeight2;
	private String beneficaryFirstName3;
	private String beneficaryLastName3;
	private String beneficaryChineseName3;
	private String beneficaryID3;
	private String beneficaryGender3;
	private String beneficaryRelation3;
	private String beneficaryWeight3;
	
	public void validate(HttpServletRequest request) throws ValidationExceptions {
		ValidationUtils.validation("NOTNULL", "beneficaryFirstName1", beneficaryFirstName1, request);
		ValidationUtils.validation("NOTNULL", "beneficaryLastName1", beneficaryLastName1, request);
		ValidationUtils.validation("NOTNULL", "beneficaryChineseName1", beneficaryChineseName1, request);
		ValidationUtils.validation("NOTNULL", "beneficaryID1", beneficaryID1, request);
		ValidationUtils.validation("NOTNULL", "beneficaryGender1", beneficaryGender1, request);
		ValidationUtils.validation("NOTNULL", "beneficaryRelation1", beneficaryRelation1, request);
		ValidationUtils.validation("NOTNULL", "beneficaryWeight1", beneficaryWeight1, request);
		ValidationUtils.sendMsg();
	}

	public Boolean getIsOwnEstate() {
		return isOwnEstate;
	}

	public void setIsOwnEstate(Boolean isOwnEstate) {
		this.isOwnEstate = isOwnEstate;
	}

	public String getBeneficaryFirstName1() {
		return beneficaryFirstName1;
	}

	public void setBeneficaryFirstName1(String beneficaryFirstName1) {
		this.beneficaryFirstName1 = beneficaryFirstName1;
	}

	public String getBeneficaryLastName1() {
		return beneficaryLastName1;
	}

	public void setBeneficaryLastName1(String beneficaryLastName1) {
		this.beneficaryLastName1 = beneficaryLastName1;
	}

	public String getBeneficaryChineseName1() {
		return beneficaryChineseName1;
	}

	public void setBeneficaryChineseName1(String beneficaryChineseName1) {
		this.beneficaryChineseName1 = beneficaryChineseName1;
	}

	public String getBeneficaryID1() {
		return beneficaryID1;
	}

	public void setBeneficaryID1(String beneficaryID1) {
		this.beneficaryID1 = beneficaryID1;
	}

	public String getBeneficaryGender1() {
		return beneficaryGender1;
	}

	public void setBeneficaryGender1(String beneficaryGender1) {
		this.beneficaryGender1 = beneficaryGender1;
	}

	public String getBeneficaryRelation1() {
		return beneficaryRelation1;
	}

	public void setBeneficaryRelation1(String beneficaryRelation1) {
		this.beneficaryRelation1 = beneficaryRelation1;
	}

	public String getBeneficaryWeight1() {
		return beneficaryWeight1;
	}

	public void setBeneficaryWeight1(String beneficaryWeight1) {
		this.beneficaryWeight1 = beneficaryWeight1;
	}

	public String getBeneficaryFirstName2() {
		return beneficaryFirstName2;
	}

	public void setBeneficaryFirstName2(String beneficaryFirstName2) {
		this.beneficaryFirstName2 = beneficaryFirstName2;
	}

	public String getBeneficaryLastName2() {
		return beneficaryLastName2;
	}

	public void setBeneficaryLastName2(String beneficaryLastName2) {
		this.beneficaryLastName2 = beneficaryLastName2;
	}

	public String getBeneficaryChineseName2() {
		return beneficaryChineseName2;
	}

	public void setBeneficaryChineseName2(String beneficaryChineseName2) {
		this.beneficaryChineseName2 = beneficaryChineseName2;
	}

	public String getBeneficaryID2() {
		return beneficaryID2;
	}

	public void setBeneficaryID2(String beneficaryID2) {
		this.beneficaryID2 = beneficaryID2;
	}

	public String getBeneficaryGender2() {
		return beneficaryGender2;
	}

	public void setBeneficaryGender2(String beneficaryGender2) {
		this.beneficaryGender2 = beneficaryGender2;
	}

	public String getBeneficaryRelation2() {
		return beneficaryRelation2;
	}

	public void setBeneficaryRelation2(String beneficaryRelation2) {
		this.beneficaryRelation2 = beneficaryRelation2;
	}

	public String getBeneficaryWeight2() {
		return beneficaryWeight2;
	}

	public void setBeneficaryWeight2(String beneficaryWeight2) {
		this.beneficaryWeight2 = beneficaryWeight2;
	}

	public String getBeneficaryFirstName3() {
		return beneficaryFirstName3;
	}

	public void setBeneficaryFirstName3(String beneficaryFirstName3) {
		this.beneficaryFirstName3 = beneficaryFirstName3;
	}

	public String getBeneficaryLastName3() {
		return beneficaryLastName3;
	}

	public void setBeneficaryLastName3(String beneficaryLastName3) {
		this.beneficaryLastName3 = beneficaryLastName3;
	}

	public String getBeneficaryChineseName3() {
		return beneficaryChineseName3;
	}

	public void setBeneficaryChineseName3(String beneficaryChineseName3) {
		this.beneficaryChineseName3 = beneficaryChineseName3;
	}

	public String getBeneficaryID3() {
		return beneficaryID3;
	}

	public void setBeneficaryID3(String beneficaryID3) {
		this.beneficaryID3 = beneficaryID3;
	}

	public String getBeneficaryGender3() {
		return beneficaryGender3;
	}

	public void setBeneficaryGender3(String beneficaryGender3) {
		this.beneficaryGender3 = beneficaryGender3;
	}

	public String getBeneficaryRelation3() {
		return beneficaryRelation3;
	}

	public void setBeneficaryRelation3(String beneficaryRelation3) {
		this.beneficaryRelation3 = beneficaryRelation3;
	}

	public String getBeneficaryWeight3() {
		return beneficaryWeight3;
	}

	public void setBeneficaryWeight3(String beneficaryWeight3) {
		this.beneficaryWeight3 = beneficaryWeight3;
	}

	
}
