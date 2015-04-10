package com.ifwd.fwdhk.services;

import java.util.Locale;

import org.springframework.context.MessageSourceAware;
import org.springframework.context.NoSuchMessageException;

public interface LocaleMessagePropertiesService extends MessageSourceAware {

	/**
	 * Method will retrieve the corresponding message from properties file base
	 * on message key and locale.
	 * 
	 * @param String
	 *            key
	 * @param Locale
	 *            locale
	 * @return String message
	 */
	public String retreiveMessage(String key, Object[] args, Locale locale)
			throws NoSuchMessageException;

}
