package com.ifwd.fwdhk.exception;
import org.springframework.http.HttpStatus;

/**
 * A Generic RuntimeException. Can be used to throw any sort of runtime exception.
 * <p> StatusCode : 500 - {@link HttpStatus#INTERNAL_SERVER_ERROR} </p>
 */
public class GenericException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	private String messageCode;
	private Object[] messageValues;

	
	public GenericException(String messageCode) {
		this.messageCode = messageCode;
	}
	
	public GenericException(String messageCode, Throwable cause) {
		super(cause);
		this.messageCode = messageCode;
	}

	
	public GenericException(String messageCode, Object[] messageValues) {
		this.messageCode = messageCode;
		this.setMessageValues(messageValues);
	}

	public GenericException(String messageCode, Object[] messageValues, Throwable cause) {
		super(cause);
		this.messageCode = messageCode;
		this.setMessageValues(messageValues);
	}


	@Override
	public String getMessage() {
		return messageCode;
	}
	public Object[] getMessageValues() {
		return messageValues;
	}

	public void setMessageValues(Object[] messageValues) {
		this.messageValues = messageValues;
	}
}
