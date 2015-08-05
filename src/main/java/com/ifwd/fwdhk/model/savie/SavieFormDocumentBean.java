package com.ifwd.fwdhk.model.savie;

import java.util.List;

import com.ifwd.fwdhk.util.CommonEnum.UploadDocumentEnum;



public class SavieFormDocumentBean {
	private UploadDocumentEnum uploadDocument; 
	private boolean isHongKongPermanentResident;
	private List<SavieFileBean> hkIdFiles;
	private List<SavieFileBean> passportFiles;
	private List<SavieFileBean> addressFiles;
	public UploadDocumentEnum getUploadDocument() {
		return uploadDocument;
	}
	public void setUploadDocument(UploadDocumentEnum uploadDocument) {
		this.uploadDocument = uploadDocument;
	}
	public boolean isHongKongPermanentResident() {
		return isHongKongPermanentResident;
	}
	public void setHongKongPermanentResident(boolean isHongKongPermanentResident) {
		this.isHongKongPermanentResident = isHongKongPermanentResident;
	}
	public List<SavieFileBean> getHkIdFiles() {
		return hkIdFiles;
	}
	public void setHkIdFiles(List<SavieFileBean> hkIdFiles) {
		this.hkIdFiles = hkIdFiles;
	}
	public List<SavieFileBean> getPassportFiles() {
		return passportFiles;
	}
	public void setPassportFiles(List<SavieFileBean> passportFiles) {
		this.passportFiles = passportFiles;
	}
	public List<SavieFileBean> getAddressFiles() {
		return addressFiles;
	}
	public void setAddressFiles(List<SavieFileBean> addressFiles) {
		this.addressFiles = addressFiles;
	}
	
	
	
	
	
	
	
	
}
