package com.ifwd.fwdhk.model.savie;

import java.util.List;

public class SavieFormDocumentBean {
	private String uploadDocument; enum 
	private boolean isHongKongPermanentResident;
	private List<SavieFileBean> hkidFiles;
	private List<SavieFileBean> passportFiles;
	private List<SavieFileBean> addressFiles;
	public String getUploadType() {
		return uploadType;
	}
	public void setUploadType(String uploadType) {
		this.uploadType = uploadType;
	}
	public boolean isHongKongPermanentResident() {
		return isHongKongPermanentResident;
	}
	public void setHongKongPermanentResident(boolean isHongKongPermanentResident) {
		this.isHongKongPermanentResident = isHongKongPermanentResident;
	}
	public List<SavieFileBean> getHkidFiles() {
		return hkidFiles;
	}
	public void setHkidFiles(List<SavieFileBean> hkidFiles) {
		this.hkidFiles = hkidFiles;
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
