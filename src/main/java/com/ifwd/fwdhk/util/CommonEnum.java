package com.ifwd.fwdhk.util;

public class CommonEnum {
	public enum GenderEnum
	{
		MALE("M"), 
		FEMALE("F");                
		private final String value;        
		GenderEnum(String value) 
		{
			this.value = value;        
		}                
		public String getValue() 
		{
			return value;
		}    
	}
	
	public enum MaritalStatusEnum
	{
		Single("S"), 
		Married("M");            
		private final String value;        
		MaritalStatusEnum(String value) 
		{
			this.value = value;        
		}                
		public String getValue() 
		{
			return value;
		}    
	}
	public enum UploadDocumentEnum
	{
		UploadNow("N"), 
		UploadLater("L"), 
		GiveAtStore("S");            
		private final String value;        
		UploadDocumentEnum(String value) 
		{
			this.value = value;        
		}                
		public String getValue() 
		{
			return value;
		}    
	}
}
