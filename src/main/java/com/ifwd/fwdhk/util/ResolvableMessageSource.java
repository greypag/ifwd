package com.ifwd.fwdhk.util;

public class ResolvableMessageSource extends org.springframework.context.support.DefaultMessageSourceResolvable {

	private static final long serialVersionUID = 1L;

	public ResolvableMessageSource(String code) {
		super(code);
	}

	public ResolvableMessageSource(String code, Object[] arguments) {
		super(new String[]{code}, arguments);
	}

}
