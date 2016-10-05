package com.ifwd.fwdhk.model;

public class OccupationBean {
	
	private String id;
	private String code;
	private String desc;
	private String descZh;
	private boolean standard;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public boolean isStandard() {
		return standard;
	}
	public void setStandard(boolean standard) {
		this.standard = standard;
	}
	public String getDescZh() {
		return descZh;
	}
	public void setDescZh(String descZh) {
		this.descZh = descZh;
	}	

}
