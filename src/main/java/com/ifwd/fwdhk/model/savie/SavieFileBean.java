package com.ifwd.fwdhk.model.savie;

public class SavieFileBean {
	
	private String fileName;
	
	private String documentType;  //hkId / passport / addressProof
	private String base64;
	private String version;
	
	/*	browser -> tomcat -> jboss
    baes64
		Image
    
plugin
binary / base64


base64*/
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getDocumentType() {
		return documentType;
	}
	public void setDocumentType(String documentType) {
		this.documentType = documentType;
	}
	public String getBase64() {
		return base64;
	}
	public void setBase64(String base64) {
		this.base64 = base64;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	

	
	
	
	
	
	
}
