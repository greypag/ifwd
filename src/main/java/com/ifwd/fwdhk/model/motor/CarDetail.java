package com.ifwd.fwdhk.model.motor;

import java.math.BigDecimal;

public class CarDetail {
	
	private String id;
	private String makeCode;
	private String model;
	private String engineCapacity;
	
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
	
	
	
}
