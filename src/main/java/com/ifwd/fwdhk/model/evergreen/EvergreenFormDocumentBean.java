package com.ifwd.fwdhk.model.evergreen;

import java.util.List;

import com.ifwd.fwdhk.util.CommonEnum.UploadDocumentEnum;



public class EvergreenFormDocumentBean {
	private UploadDocumentEnum uploadDocument; 
	private boolean isHongKongPermanentResident;
	private List<EvergreenFileBean> hkIdFiles;
	private List<EvergreenFileBean> passportFiles;
	private List<EvergreenFileBean> addressFiles;
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
	public List<EvergreenFileBean> getHkIdFiles() {
		return hkIdFiles;
	}
	public void setHkIdFiles(List<EvergreenFileBean> hkIdFiles) {
		this.hkIdFiles = hkIdFiles;
	}
	public List<EvergreenFileBean> getPassportFiles() {
		return passportFiles;
	}
	public void setPassportFiles(List<EvergreenFileBean> passportFiles) {
		this.passportFiles = passportFiles;
	}
	public List<EvergreenFileBean> getAddressFiles() {
		return addressFiles;
	}
	public void setAddressFiles(List<EvergreenFileBean> addressFiles) {
		this.addressFiles = addressFiles;
	}
	
	
	
	
	
	
	
	
}
