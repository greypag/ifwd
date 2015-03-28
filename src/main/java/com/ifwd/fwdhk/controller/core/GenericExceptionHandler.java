/*package com.ifwd.fwdhk.controller.core;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
//import org.springframework.security.access.AccessDeniedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.NoSuchRequestHandlingMethodException;

import com.ifwd.fwdhk.exception.ErrorCodes;
import com.ifwd.fwdhk.exception.GenericException;
import com.ifwd.fwdhk.exception.ObjectNotFoundException;
import com.ifwd.fwdhk.exception.ValidationException;
import com.ifwd.fwdhk.util.MessageUtil;

*//**
 * GLobal handler for all Exceptions. Does the following:
 * 
 * <ul>
 * <li>Logs the error / exception</li>
 * <li>For a particular exception type, sets the appropriate HTTPStatus</li>
 * <li>Looks up the error message and sets in the Model</li>
 * <li>Sets a proper view and returns the same</li>
 * </ul>
 * 
 * <p>
 * Some of the Exceptions handled & the HTTP Status codes set:
 * </p>
 * <ul>
 * <li>{@link GenericException} : 500 {@link HttpStatus#INTERNAL_SERVER_ERROR}</li>
 * <li>{@link Exception} : 500 {@link HttpStatus#INTERNAL_SERVER_ERROR}</li>
 * <li>{@link AuthorizationException} : 401 {@link HttpStatus#UNAUTHORIZED}</li>
 * <li>{@link AccessDeniedException} : 401 {@link HttpStatus#UNAUTHORIZED}</li>
 * <li>{@link SecurityException} : 403 {@link HttpStatus#FORBIDDEN}</li>
 * <li>{@link ObjectNotFoundException} : 404 {@link HttpStatus#NOT_FOUND}</li>
 * <li>{@link ValidationException} : 422 {@link HttpStatus#UNPROCESSABLE_ENTITY}
 * </li>
 * </ul>
  *//*

@ControllerAdvice
public class GenericExceptionHandler {

	private static final Logger logger = LoggerFactory
			.getLogger(GenericExceptionHandler.class);

	 --- Exception Handlers --- 

	*//**
	 * Handles 404/PageNotFound. TODO : Not working as of now. Handled in
	 * web.xml
	 *//*

	@ExceptionHandler(NoSuchRequestHandlingMethodException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public ModelAndView handleNoSuchRequestHandlingMethodException(
			NoSuchRequestHandlingMethodException ex, Locale locale) {
		final String messageCode = ErrorCodes.ERROR_DEFAULT_404;

		// Handle exception
		String userMsg = this.handleExceptionAndGetUserMessage(ex, messageCode,
				locale);
		return new StatusMessage(HttpStatus.BAD_REQUEST, messageCode, userMsg)
				.asModelAndView();
	}

	@ExceptionHandler
	@ResponseBody
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	public Object resolveBindingException(MethodArgumentNotValidException ex,
			Locale locale) {
		final String messageCode = ErrorCodes.ERROR_DEFAULT_400;

		// Handle exception
		String userMsg = this.handleExceptionAndGetUserMessage(ex, messageCode,
				locale);
		return new StatusMessage(HttpStatus.BAD_REQUEST, messageCode, userMsg)
				.asModelAndView();
	}

	@ExceptionHandler(Exception.class)
	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	public ModelAndView handleAllExceptions(Exception ex, Locale locale) {
		final String messageCode = ErrorCodes.ERROR_DEFAULT_500;

		String userMsg = this.handleExceptionAndGetUserMessage(ex, messageCode,
				locale);
		return new StatusMessage(HttpStatus.INTERNAL_SERVER_ERROR, messageCode,
				userMsg).asModelAndView();
	}

	@ExceptionHandler(GenericException.class)
	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	public ModelAndView handleSandManException(GenericException ex,
			Locale locale) {
		String userMsg = this.handleExceptionAndGetUserMessage(ex, locale);
		return new StatusMessage(HttpStatus.INTERNAL_SERVER_ERROR, userMsg, ex)
				.asModelAndView();
	}

	@ExceptionHandler(ValidationException.class)
	@ResponseStatus(HttpStatus.UNPROCESSABLE_ENTITY)
	public ModelAndView handleValidationException(ValidationException ex,
			Locale locale) {
		String userMsg = this.handleExceptionAndGetUserMessage(ex, locale);
		return new StatusMessage(HttpStatus.UNPROCESSABLE_ENTITY, userMsg, ex)
				.asModelAndView();
	}

	@ExceptionHandler(ObjectNotFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public ModelAndView handleObjectNotFoundException(
			ObjectNotFoundException ex, Locale locale) {
		String userMsg = this.handleExceptionAndGetUserMessage(ex, locale);
		return new StatusMessage(HttpStatus.NOT_FOUND, userMsg, ex)
				.asModelAndView();
	}

	private String handleExceptionAndGetUserMessage(GenericException ex,
			Locale locale) {
		String devMsg = MessageUtil.getMessage(ex.getMessage(),
				ex.getMessageValues(), locale);

		logger.error("Exception occured: " + devMsg, ex);
		if (null != ex && null != ex.getCause()) {
			logger.debug("Originally Caused by: " + devMsg, ex.getCause());
			if (logger.isDebugEnabled()) {
				ex.printStackTrace();
			}
		}

		String userMsg = MessageUtil.getUserMessage(ex.getMessage(),
				ex.getMessageValues(), locale);

		if (userMsg == null || userMsg.equals(ex.getMessage())) {
			userMsg = MessageUtil.getUserMessage(ErrorCodes.ERROR_DEFAULT,
					new String[] { ex.getMessage() }, locale);
		}
		return userMsg;
	}

	private String handleExceptionAndGetUserMessage(Exception ex,
			String messageCode, Locale locale) {
		String devMsg = MessageUtil.getMessage(messageCode,
				new String[] { ex.getMessage() }, locale);

		logger.error("Exception occured: " + devMsg, ex);
		if (null != ex && null != ex.getCause()) {
			logger.debug("Originally Caused by: " + devMsg, ex.getCause());
			if (logger.isDebugEnabled()) {
				ex.printStackTrace();
			}
		}

		String userMsg = MessageUtil.getUserMessage(messageCode,
				new String[] { ex.getMessage() }, locale);

		if (userMsg == null || userMsg.equals(ex.getMessage())) {
			userMsg = MessageUtil.getUserMessage(ErrorCodes.ERROR_DEFAULT,
					new String[] { ex.getMessage() }, locale);
		}
		return userMsg;
	}
}
*/