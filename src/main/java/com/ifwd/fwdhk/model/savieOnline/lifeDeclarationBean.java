package com.ifwd.fwdhk.model.savieOnline;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.ifwd.fwdhk.exception.ValidateExceptions;
import com.ifwd.utils.ErrorMessageUtils;
import com.ifwd.utils.ValidationUtils;
public class lifeDeclarationBean implements Serializable {
	private final static Logger logger = LoggerFactory.getLogger(lifeDeclarationBean.class);
	private static final long serialVersionUID = 1L;

	private Boolean declaration1;
	private Boolean declaration2;
	private Boolean declaration3;
	private Boolean declaration4;
	private Boolean declaration5;
	
	public void validate(String language) throws ValidateExceptions {
		List<String> list = new ArrayList<String>();
        /*if(ValidationUtils.isNullOrEmpty(this.bankCode)){
        	list.add(ErrorMessageUtils.getMessage("bankCode", "validation.failure", language));
        }*/
		if (list.size() > 0) {
			throw new ValidateExceptions(list);
		}
	}

	public Boolean getDeclaration1() {
		return declaration1;
	}

	public void setDeclaration1(Boolean declaration1) {
		this.declaration1 = declaration1;
	}

	public Boolean getDeclaration2() {
		return declaration2;
	}

	public void setDeclaration2(Boolean declaration2) {
		this.declaration2 = declaration2;
	}

	public Boolean getDeclaration3() {
		return declaration3;
	}

	public void setDeclaration3(Boolean declaration3) {
		this.declaration3 = declaration3;
	}

	public Boolean getDeclaration4() {
		return declaration4;
	}

	public void setDeclaration4(Boolean declaration4) {
		this.declaration4 = declaration4;
	}

	public Boolean getDeclaration5() {
		return declaration5;
	}

	public void setDeclaration5(Boolean declaration5) {
		this.declaration5 = declaration5;
	}

	
}
