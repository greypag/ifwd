package com.ifwd.fwdhk.exception;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.FORBIDDEN)
public class SecurityException extends GenericException {

	private static final long serialVersionUID = 1L;
	

	public SecurityException(String messageCode) {
		super(messageCode);
	}
	
	public SecurityException(String messageCode, Throwable cause) {
		super(messageCode, cause);
	}
	
	public SecurityException(String messageCode, Object[] messageValues) {
		super(messageCode, messageValues);
	}
	
	public SecurityException(String messageCode, Object[] messageValues, Throwable cause) {
		super(messageCode, messageValues, cause);
	}

}
