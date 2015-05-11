package com.ifwd.fwdhk.model;

import java.util.ArrayList;
import java.util.List;

/**
 * iReport bean: Person
 * @author 
 * @Create 2015-2-2 17:03:44
 */
public class Person {
	private String name;	
	private String sex;		
	private int age;		
	private String hometown;
	private String phone;	
	
	public Person() {}
	
	public Person(String name, String sex, int age, String hometown, String phone) {
		this.name = name;
		this.sex = sex;
		this.age = age;
		this.hometown = hometown;
		this.phone = phone;
	}
	
	/**
	 * 
	 * @return
	 */
	public String getName() {
		return name;
	}

	/**
	 * 
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 
	 * @return
	 */
	public String getSex() {
		return sex;
	}

	/**
	 * 
	 * @param sex
	 */
	public void setSex(String sex) {
		this.sex = sex;
	}

	/**
	 * 
	 * @return
	 */
	public int getAge() {
		return age;
	}

	/**
	 * 
	 * @param age
	 */
	public void setAge(int age) {
		this.age = age;
	}

	/**
	 * 
	 * @return
	 */
	public String getHometown() {
		return hometown;
	}

	/**
	 * 
	 * @param hometown
	 */
	public void setHometown(String hometown) {
		this.hometown = hometown;
	}

	/**
	 * 
	 * @return
	 */
	public String getPhone() {
		return phone;
	}

	/**
	 * 
	 * @param phone
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public static List<Person> getList() {
		List<Person> list = new ArrayList<Person>();
		list.add(new Person("Lily", "female", 22, "Hubei", "10086"));
		list.add(new Person("Macro", "male", 33, "Beijing", "13800000000"));
		list.add(new Person("Andy", "male", 44, "HongKong", "13812345678"));
		list.add(new Person("Linder", "female", 28, "Guangxi", "18677778888"));
		list.add(new Person("Jessie", "female", 26, "Gansu", "18219177720"));
		return list;
	}
}
