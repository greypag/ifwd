package com.ifwd.fwdhk.model.motor;

public class QuoteDriver {	
	private long id;
	
	private String carMakeCode;
	private String carModel;
	private Integer carCC;
	private String carYearOfManufacture;
	private Integer carEstimatedValue;
	private String occupation;
	private Double ncb;
	private boolean validAgeGroup;
	private boolean driveMoreThanTwo;	

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
	
	public String getCarMakeCode() {
		return carMakeCode;
	}
	
	public void setCarMakeCode(String carMakeCode) {
		this.carMakeCode = carMakeCode;
	}
	
	public String getCarModel() {
		return carModel;
	}
	
	public void setCarModel(String carModel) {
		this.carModel = carModel;
	}
	
	public String getCarYearOfManufacture() {
		return carYearOfManufacture;
	}	
	
	public void setCarYearOfManufacture(String carYearOfManufacture) {
		this.carYearOfManufacture = carYearOfManufacture;
	}
	
	public Integer getCarEstimatedValue() {
		return carEstimatedValue;
	}
	
	public void setCarEstimatedValue(Integer carEstimatedValue) {
		this.carEstimatedValue = carEstimatedValue;
	}
		
	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	
	public Double getNcb() {
		return ncb;
	}
	
	public void setNcb(Double ncb) {
		this.ncb = ncb;
	}
		
	public boolean isValidAgeGroup() {
		return validAgeGroup;
	}
	
	public void setValidAgeGroup(boolean validAgeGroup) {
		this.validAgeGroup = validAgeGroup;
	}
		
	public boolean isDriveMoreThanTwo() {
		return driveMoreThanTwo;
	}
	
	public void setDriveMoreThanTwo(boolean driveMoreThanTwo) {
		this.driveMoreThanTwo = driveMoreThanTwo;
	}
	
	public Integer getCarCC() {
		return carCC;
	}

	public void setCarCC(Integer carCC) {
		this.carCC = carCC;
	}
}
	