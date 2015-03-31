package com.ifwd.fwdhk.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class UserRestURIConstants {

	/*
	 * http://10.10.18.11:8080/eCommerce-ws
	 */

	private static final String SERVICE_URL = getUrl();

	/* validate token */
	public static final String VALIDATE_TOKEN = "/member/token";

	/* Users Api */
	public static final String USER_LOGIN = SERVICE_URL + "/member/login";
	public static final String USER_JOIN_US = SERVICE_URL + "/member";
	public static final String USER_FORGOT_PASSWORD = SERVICE_URL
			+ "/member/forgotPassword";
	public static final String USER_FORGOT_USERNAME = SERVICE_URL
			+ "/member/forgotUserName";
	public static final String USER_DETAILS = SERVICE_URL + "/member/details";
	public static final String USER_PURCHASE_POLICY_HISTORY = SERVICE_URL
			+ "/policies";

	/* Flight Api */
	public static final String GETFLIGHTQUOTE = SERVICE_URL
			+ "/gi/flight/quote";
	public static final String CREATEFLIGHTPOLICY = SERVICE_URL
			+ "/gi/flight/policies";
	public static final String GET_AGE_TYPE = SERVICE_URL + "/option/itemDesc";
	public static final String GET_BENE_RELATIONSHIP_CODE = SERVICE_URL
			+ "/option/itemDesc";

	// Travel URL
	public static final String TRAVEL_GET_QUOTE = SERVICE_URL
			+ "/gi/travel/quote";
	public static final String TRAVEL_CREATE_POLICY = SERVICE_URL
			+ "/gi/travel/policies";
	public static final String TRAVEL_CINFIRM_POLICY = SERVICE_URL
			+ "/gi/travel/payments/make";
	public static final String TRAVEL_FINALIZE_POLICY = SERVICE_URL
			+ "/gi/travel/policies";
	
	
	/*API For Home Care Modules
	*/
	public static final String GET_HOMECARE_UW_QUESTIONS = SERVICE_URL + "/gi/homeCare/uwQuestions";
	public static final String HOMECARE_GET_QUOTE = SERVICE_URL + "/gi/homeCare/quote";
	public static final String HOMECARE_CREATE_POLICY = SERVICE_URL + "/gi/homeCare/policies";
	public static final String HOMECARE_CONFIRM_POLICY = SERVICE_URL + "/gi/homeCare/payments/make";
	public static final String HOMECARE_FINALIZE_POLICY = SERVICE_URL + "/gi/homeCare/policies";
	public static final String HOMECARE_GET_DISTRICT = SERVICE_URL + "/option/districts";
	public static final String HOMECARE_GET_NET_FLOOR_AREA = SERVICE_URL + "/option/itemDesc";
	

	/* Mail Api */
	public static final String SEND_MAIL = SERVICE_URL + "/messages/email";

	static String controller;

	public static String getController() {
		return controller;
	}

	public static void setController(String controller) {
		UserRestURIConstants.controller = controller;
	}

	/* Set Url From config.properties file */
	public static String getUrl() {

		String result = "";

		Properties prop = new Properties();
		String propFileName = "config.properties";
		InputStream input = null;

		try {
			input = UserRestURIConstants.class.getClassLoader()
					.getResourceAsStream(propFileName);

			// load a properties file
			prop.load(input);

			// get the property value and print it out
			result = prop.getProperty("url").toString();

		} catch (IOException ex) {
			ex.printStackTrace();
		} finally {
			if (input != null) {
				try {
					input.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}
	
	public static String getLanaguage(HttpServletRequest request) {
		HttpSession session = request.getSession();	
		String lang = "EN";
		if(session.getAttribute("language")!=null){
			lang = session.getAttribute("language").toString();
		}
		return lang;
	}
	
	public static String checkLangSetPage(HttpServletRequest request){
		HttpSession session = request.getSession();	
		String lang = "EN";
		if(session.getAttribute("language")!=null){
			lang = session.getAttribute("language").toString();
		}
		if("EN".equals(lang)){
			return "/en/";
		}else if("CN".equals(lang)){
			return "/cn/";
		} else{
			return "/en/";
		}
	}

}
