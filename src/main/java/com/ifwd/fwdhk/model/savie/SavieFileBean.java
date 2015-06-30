package com.ifwd.fwdhk.model.savie;

import java.util.Date;

public class SavieFileBean {
	
	private String fileName;
	
	private String documentType; //hkId / passport / addressProof
	private String base64;
	private String version;
	
	browser -> tomcat -> jboss
	           baes64
				Image
	           
	plugin
	binary / base64
	
	
	base64
	
	
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public Date getFileDatetime() {
		return fileDatetime;
	}
	public void setFileDatetime(Date fileDatetime) {
		this.fileDatetime = fileDatetime;
	}
	
	
	
}
