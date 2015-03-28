package com.ifwd.fwdhk.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
public class CustomerException extends GenericException {

	/* Constructors */
	
	public CustomerException(String messageCode) {
		super(messageCode);
	}
	
	public CustomerException(String messageCode, Throwable cause) {
		super(messageCode, cause);
	}
	
	public CustomerException(String messageCode, Object[] messageValues) {
		super(messageCode, messageValues);
	}
	
	public CustomerException(String messageCode, Object[] messageValues, Throwable cause) {
		super(messageCode, messageValues, cause);
	}
}
