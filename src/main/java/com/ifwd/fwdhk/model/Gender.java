package com.ifwd.fwdhk.model;

public enum Gender {
	
	MALE(1),FEMALE(0);
	
	private int typeCode;
	
	private Gender(int typeCode){
		this.typeCode = typeCode;
	}
	
	@Override
    public String toString() {

        return String.valueOf(this.typeCode);

    }
	
}
