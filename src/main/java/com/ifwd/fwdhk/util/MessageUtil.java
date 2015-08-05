package com.ifwd.fwdhk.util;



import java.util.Locale;

import org.springframework.context.MessageSource;

/**
 * A Utility to read the messages from the Locale Specific Resource Bundle. 
 * As of now this utility has two resource bundles registered with it.
 * 
 * <ul>
 * <li>messages</li>
 * <li>messages_ui</li>
 * </ul>
 */
public class MessageUtil {

	/* --- Message Sources --- */

	private static MessageSource messageSource;
	private static MessageSource userMessageSource;

	
	public static String getMessage(String key) {
		return messageSource.getMessage(key, null, key, Locale.getDefault());
	}

	
	public static String getMessage(String key, Object[] placeholders) {
		return messageSource.getMessage(key, placeholders, key, Locale.getDefault());
	}


	public static String getMessage(String key, Object[] placeholders, Locale locale) {
		return messageSource.getMessage(key, placeholders, key, locale);
	}

	
	public static String getUserMessage(String key) {
		return userMessageSource.getMessage(key, null, key, Locale.getDefault());
	}

	
	public static String getUserMessage(String key, Object[] placeholders) {
		return userMessageSource.getMessage(key, placeholders, key, Locale.getDefault());
	}

	
	public static String getUserMessage(String key, Object[] placeholders, Locale locale) {
		return userMessageSource.getMessage(key, placeholders, key, locale);
	}

	/* Getters and Setters */

	public void setMessageSource(MessageSource messageSource) {
		MessageUtil.messageSource = messageSource;
	}

	public void setUserMessageSource(MessageSource userMessageSource) {
		MessageUtil.userMessageSource = userMessageSource;
	}

}
