package com.ifwd.fwdhk.util;

import org.springframework.beans.factory.InitializingBean;

import com.ifwd.fwdhk.model.Person;

public class InitApplicationMessage implements InitializingBean{
	
	public static Person PERSION ;

	@Override
	public void afterPropertiesSet() throws Exception {
		PERSION = new Person();
		PERSION.setAge(11);
		PERSION.setName("xiaoming");
		System.out.println("***********PRODUCT*********"+PERSION.getName());
		
	}

	/*public String getPRODUCT() {
		return PRODUCT;
	}

	public void setPRODUCT(String pRODUCT) {
		PRODUCT = pRODUCT;
	}*/
	
	
	
}
