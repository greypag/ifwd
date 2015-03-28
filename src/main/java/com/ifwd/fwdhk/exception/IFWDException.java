package com.ifwd.fwdhk.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
public class IFWDException extends GenericException {

	private static final long serialVersionUID = 1L;
		
	public IFWDException(String messageCode) {
		super(messageCode);
	}
	
	public IFWDException(String messageCode, Throwable cause) {
		super(messageCode, cause);
	}
	
	public IFWDException(String messageCode, Object[] messageValues) {
		super(messageCode, messageValues);
	}
	
	public IFWDException(String messageCode, Object[] messageValues, Throwable cause) {
		super(messageCode, messageValues, cause);
	}
	
	
}
