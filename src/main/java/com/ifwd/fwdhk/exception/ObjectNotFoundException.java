package com.ifwd.fwdhk.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.NOT_FOUND)
public class ObjectNotFoundException extends GenericException {

	/* Constructors */
	
	public ObjectNotFoundException(String messageCode) {
		super(messageCode);
	}
	
	public ObjectNotFoundException(String messageCode, Throwable cause) {
		super(messageCode, cause);
	}
	
	public ObjectNotFoundException(String messageCode, Object[] messageValues) {
		super(messageCode, messageValues);
	}
	
	public ObjectNotFoundException(String messageCode, Object[] messageValues, Throwable cause) {
		super(messageCode, messageValues, cause);
	}
	
}
