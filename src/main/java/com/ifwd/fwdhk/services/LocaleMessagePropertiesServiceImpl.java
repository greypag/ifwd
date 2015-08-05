package com.ifwd.fwdhk.services;


import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.MessageSource;
import org.springframework.context.NoSuchMessageException;
import org.springframework.stereotype.Service;



@Service
public class LocaleMessagePropertiesServiceImpl implements
		LocaleMessagePropertiesService {

	private MessageSource messageSource;
	private final static Logger logger = LoggerFactory.getLogger(LocaleMessagePropertiesServiceImpl.class);

	@Override
	public String retreiveMessage(String key, Object[] args, Locale locale)
			throws NoSuchMessageException {
		return messageSource.getMessage(key, args, locale);
	}


	@Override
	public void setMessageSource(MessageSource messageSource) {
		this.messageSource = messageSource;
	}

}
