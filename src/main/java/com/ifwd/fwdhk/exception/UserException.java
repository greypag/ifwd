package com.ifwd.fwdhk.exception;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
public class UserException extends GenericException {

	/* Constructors */
	
	public UserException(String messageCode) {
		super(messageCode);
	}
	
	public UserException(String messageCode, Throwable cause) {
		super(messageCode, cause);
	}
	
	public UserException(String messageCode, Object[] messageValues) {
		super(messageCode, messageValues);
	}
	
	public UserException(String messageCode, Object[] messageValues, Throwable cause) {
		super(messageCode, messageValues, cause);
	}
	
	
}
