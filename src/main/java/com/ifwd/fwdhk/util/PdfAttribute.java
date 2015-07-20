package com.ifwd.fwdhk.util;

public class PdfAttribute {
	private String  Key;
	private String  Value;
	
	public PdfAttribute(String key, String value) 
	{
		this.Key = key;
		this.Value = value;
	}
	public String getKey() {
		return Key;
	}
	public void setKey(String key) {
		Key = key;
	}
	public String getValue() {
		return Value;
	}
	public void setValue(String value) {
		Value = value;
	}
	
	

}
