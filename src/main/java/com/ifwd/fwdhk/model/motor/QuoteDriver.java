package com.ifwd.fwdhk.model.motor;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
    "CarMakeCode",
    "CarModel",
    "CarYearOfManufacture",
    "CarEstimatedValue",
    "Occupation",
    "Ncb",
    "ValidAgeGroup",
    "DriveMoreThanTwo",
    "PromoCode",
    "ClubMember",
    "ClubMemberNum"  
})
public class QuoteDriver {	
	@JsonProperty("CarMakeCode")
	private String carMakeCode;
	@JsonProperty("CarModel")
	private String carModel;
	@JsonProperty("CarYearOfManufacture")
	private String carYearOfManufacture;
	@JsonProperty("CarEstimatedValue")
	private Integer carEstimatedValue;
	@JsonProperty("Occupation")
	private String occupation;
	@JsonProperty("Ncb")
	private Integer ncb;
	@JsonProperty("ValidAgeGroup")
	private boolean validAgeGroup;
	@JsonProperty("DriveMoreThanTwo")
	private boolean driveMoreThanTwo;	
	@JsonProperty("PromoCode")
	private String promoCode;
	@JsonProperty("ClubMember")
	private boolean clubMember;
	@JsonProperty("ClubMemberNum")
	private String clubMemberNum;
	
	@JsonProperty("CarMakeCode")
	public String getCarMakeCode() {
		return carMakeCode;
	}
	@JsonProperty("CarMakeCode")
	public void setCarMakeCode(String carMakeCode) {
		this.carMakeCode = carMakeCode;
	}
	
	@JsonProperty("CarModel")
	public String getCarModel() {
		return carModel;
	}
	@JsonProperty("CarModel")
	public void setCarModel(String carModel) {
		this.carModel = carModel;
	}
	
	@JsonProperty("CarYearOfManufacture")
	public String getCarYearOfManufacture() {
		return carYearOfManufacture;
	}	
	@JsonProperty("CarYearOfManufacture")
	public void setCarYearOfManufacture(String carYearOfManufacture) {
		this.carYearOfManufacture = carYearOfManufacture;
	}
	
	@JsonProperty("CarEstimatedValue")
	public Integer getCarEstimatedValue() {
		return carEstimatedValue;
	}
	@JsonProperty("CarEstimatedValue")
	public void setCarEstimatedValue(Integer carEstimatedValue) {
		this.carEstimatedValue = carEstimatedValue;
	}
	
	@JsonProperty("Occupation")
	public String getOccupation() {
		return occupation;
	}
	@JsonProperty("Occupation")
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	
	@JsonProperty("Ncb")
	public Integer getNcb() {
		return ncb;
	}
	@JsonProperty("Ncb")
	public void setNcb(Integer ncb) {
		this.ncb = ncb;
	}
	
	@JsonProperty("ValidAgeGroup")
	public boolean isValidAgeGroup() {
		return validAgeGroup;
	}
	@JsonProperty("ValidAgeGroup")
	public void setValidAgeGroup(boolean validAgeGroup) {
		this.validAgeGroup = validAgeGroup;
	}
	
	@JsonProperty("DriveMoreThanTwo")
	public boolean isDriveMoreThanTwo() {
		return driveMoreThanTwo;
	}
	@JsonProperty("DriveMoreThanTwo")
	public void setDriveMoreThanTwo(boolean driveMoreThanTwo) {
		this.driveMoreThanTwo = driveMoreThanTwo;
	}
	
	@JsonProperty("PromoCode")
	public String getPromoCode() {
		return promoCode;
	}
	@JsonProperty("PromoCode")
	public void setPromoCode(String promoCode) {
		this.promoCode = promoCode;
	}	
	@JsonProperty("ClubMember")
	public boolean isClubMember() {
		return clubMember;
	}
	@JsonProperty("ClubMember")
	public void setClubMember(boolean clubMember) {
		this.clubMember = clubMember;
	}
	@JsonProperty("ClubMemberNum")
	public String getClubMemberNum() {
		return clubMemberNum;
	}
	@JsonProperty("ClubMemberNum")
	public void setClubMemberNum(String clubMemberNum) {
		this.clubMemberNum = clubMemberNum;
	}

	
}
	