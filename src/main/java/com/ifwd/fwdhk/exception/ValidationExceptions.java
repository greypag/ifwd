package com.ifwd.fwdhk.exception;

import org.springframework.context.MessageSourceResolvable;

import com.ifwd.fwdhk.util.ResolvableMessageSource;


public class ValidationExceptions extends Exception {

	private static final long serialVersionUID = 1L;

	private final MessageSourceResolvable resolvableMessage;
	
	public ValidationExceptions(String code) {
		this(code, null);
	}

	public ValidationExceptions(String code, Object argument) {
		this.resolvableMessage = new ResolvableMessageSource(code, new Object[]{argument});
	}

	public MessageSourceResolvable getResolvableMessage() {
		return resolvableMessage;
	}
	
}
