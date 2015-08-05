package com.ifwd.fwdhk.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.UNPROCESSABLE_ENTITY)
public class ValidationException extends GenericException {
	
	/* Constructors */
	
	public ValidationException(String messageCode) {
		super(messageCode);
	}
	
	public ValidationException(String messageCode, Throwable cause) {
		super(messageCode, cause);
	}
	
	public ValidationException(String messageCode, Object[] messageValues) {
		super(messageCode, messageValues);
	}
	
	public ValidationException(String messageCode, Object[] messageValues, Throwable cause) {
		super(messageCode, messageValues, cause);
	}

}
