package com.ifwd.fwdhk.exception;

public class ErrorCodes {

	// Default messages
	public static final String ERROR_DEFAULT = "error.default";
	public static final String ERROR_DEFAULT_400 = "error.default.400.invalid.arguments";
	public static final String ERROR_DEFAULT_401 = "error.default.401.access.denied";
	public static final String ERROR_DEFAULT_404 = "error.default.404.mapping.notfound";
	public static final String ERROR_DEFAULT_500 = "error.default.500.internal.unexpected";

	public static final String ERROR_VALIDATIONUTIL_DEFAULT_MESSAGE = "error.validationutils.default";

	// User Account Related Exceptions
	public static final String ERROR_SAVING_USER = "error.user.error_saving_user";
	public static final String ERROR_USER_ALREADY_IN_DB = "error.user.error_user_already_in_db";
	
	public static final String ERROR_NULL_INPUT = "error.user.null_input";
	public static final String ERROR_OLD_PASSWORD_NULL = "error.user.old_password_null";
	public static final String ERROR_OLD_PASSWORD_EMPTY = "error.user.old_password_empty";
	public static final String ERROR_NEW_PASSWORD_NULL = "error.user.new_password_null";
	public static final String ERROR_NEW_PASSWORD_EMPTY = "error.user.new_password_empty";
	public static final String ERROR_PASSWORD_MISMATCH = "error.user.password_mismatch";
	public static final String ERROR_USER_NULL = "error.user.user_null";
	public static final String ERROR_USERNAME_NULL = "error.user.username_null";
	public static final String ERROR_EMAIL_ID_NULL = "error.user.email_id_null";
	public static final String ERROR_EMAIL_ID_EMPTY = "error.user.email_id_empty";
	public static final String ERROR_PASSWORD_NULL = "error.user.password_null";
	public static final String ERROR_EMAIL_ID_INVALID = "error.user.email_id_invalid";
	public static final String ERROR_USERNAME_EMPTY = "error.user.username_empty";
	public static final String ERROR_PASSWORD_EMPTY = "error.user.password_empty";
}
