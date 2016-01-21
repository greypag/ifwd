package com.ifwd.fwdhk.exception;

import java.util.List;


public class ValidateExceptions extends Exception {
	private static final long serialVersionUID = 1L;
	List<String> list;
	public ValidateExceptions(){
		
	}
	public ValidateExceptions(List<String> list){
		this.list = list;
	}
	public ValidateExceptions(List<String> list, String language){
		this.list = list;
	}
	public ValidateExceptions(Throwable throwable){
		super(throwable);
	}

	public List<String> getList() {
		return list;
	}

	public void setList(List<String> list) {
		this.list = list;
	}
}
