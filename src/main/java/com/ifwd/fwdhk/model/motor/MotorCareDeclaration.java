package com.ifwd.fwdhk.model.motor;

public class MotorCareDeclaration {
	
	private String declarationNo;
	private String declarationDesc;
	private boolean declarationAns;
	private String langCode;
	
	public String getDeclarationNo() {
		return declarationNo;
	}
	public void setDeclarationNo(String declarationNo) {
		this.declarationNo = declarationNo;
	}
	public String getDeclarationDesc() {
		return declarationDesc;
	}
	public void setDeclarationDesc(String declarationDesc) {
		this.declarationDesc = declarationDesc;
	}
	public boolean isDeclarationAns() {
		return declarationAns;
	}
	public void setDeclarationAns(boolean declarationAns) {
		this.declarationAns = declarationAns;
	}
	public String getLangCode() {
		return langCode;
	}
	public void setLangCode(String langCode) {
		this.langCode = langCode;
	}
		
}
