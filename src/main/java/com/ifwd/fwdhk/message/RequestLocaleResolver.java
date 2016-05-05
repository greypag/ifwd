package com.ifwd.fwdhk.message;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.i18n.AbstractLocaleResolver;

public class RequestLocaleResolver extends AbstractLocaleResolver {

	public static final String LOCALE_REQ_ATTR_NAME = RequestLocaleResolver.class.getName() + ".LOCALE";

	@Override
	public Locale resolveLocale(HttpServletRequest request) {
		Locale locale = (Locale) request.getAttribute(LOCALE_REQ_ATTR_NAME);
		if (locale == null) {
			return this.getDefaultLocale();
		}
		return locale;
	}

	@Override
	public void setLocale(HttpServletRequest request, HttpServletResponse response, Locale locale) {
		setRequestLocale(request, locale);
	}

	public static void setRequestLocale(HttpServletRequest request, Locale locale) {
		request.setAttribute(LOCALE_REQ_ATTR_NAME, locale);
	}

}
