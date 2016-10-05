package com.ifwd.fwdhk.model.motor;

import java.math.BigDecimal;

public class CarDetail {
	
	private String id;
	private String makeCode;
	private String model;
	private String engineCapacity;
	private String typeOfBody;
	private String carGroup;
	private boolean electricCar;
	private String alarm;
	private String modelDesc;
	
	private BigDecimal estimatedValue;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMakeCode() {
		return makeCode;
	}
	public void setMakeCode(String makeCode) {
		this.makeCode = makeCode;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getEngineCapacity() {
		return engineCapacity;
	}
	public void setEngineCapacity(String engineCapacity) {
		this.engineCapacity = engineCapacity;
	}
	public BigDecimal getEstimatedValue() {
		return estimatedValue;
	}
	public void setEstimatedValue(BigDecimal estimatedValue) {
		this.estimatedValue = estimatedValue;
	}
	public String getTypeOfBody() {
		return typeOfBody;
	}
	public void setTypeOfBody(String typeOfBody) {
		this.typeOfBody = typeOfBody;
	}
	public String getCarGroup() {
		return carGroup;
	}
	public void setCarGroup(String carGroup) {
		this.carGroup = carGroup;
	}
	public boolean isElectricCar() {
		return electricCar;
	}
	public void setElectricCar(boolean electricCar) {
		this.electricCar = electricCar;
	}
	public String getAlarm() {
		return alarm;
	}
	public void setAlarm(String alarm) {
		this.alarm = alarm;
	}
	public String getModelDesc() {
		return modelDesc;
	}
	public void setModelDesc(String modelDesc) {
		this.modelDesc = modelDesc;
	}
}
