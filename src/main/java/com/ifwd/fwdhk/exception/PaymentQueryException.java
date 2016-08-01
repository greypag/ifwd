package com.ifwd.fwdhk.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
public class PaymentQueryException extends GenericException {

	/* Constructors */
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public PaymentQueryException() {
		super("Exception");
	}

	public PaymentQueryException(String messageCode) {
		super(messageCode);
	}
	
	public PaymentQueryException(String messageCode, Throwable cause) {
		super(messageCode, cause);
	}
	
	public PaymentQueryException(String messageCode, Object[] messageValues) {
		super(messageCode, messageValues);
	}
	
	public PaymentQueryException(String messageCode, Object[] messageValues, Throwable cause) {
		super(messageCode, messageValues, cause);
	}
}
