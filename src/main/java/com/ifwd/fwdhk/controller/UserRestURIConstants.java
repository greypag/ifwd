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
			+ "/policies/retrieve";

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
	public static final String TRAVEL_CONFIRM_POLICY = SERVICE_URL
			+ "/gi/travel/payments/make";
	public static final String TRAVEL_SUBMIT_POLICY = SERVICE_URL + "/gi/homeCare/payments/submit";
	
	public static final String TRAVEL_FINALIZE_POLICY = SERVICE_URL
			+ "/gi/travel/policies";
	public static final String TRAVEL_GET_PROMOCODE = SERVICE_URL + "/leads/partnership/promoCode";
	
	/* WorkingHoliday URL */
	public static final String WORKINGHOLIDAY_GET_QUOTE = SERVICE_URL
			+ "/gi/workingHoliday/quote";
	public static final String WORKINGHOLIDAY_CONFIRM_POLICY = SERVICE_URL
			+ "/gi/workingHoliday/payments/make";
	public static final String GET_COUNTRY = SERVICE_URL + "/option/itemDesc";
	public static final String WORKINGHOLIDAY_CREATE_POLICY = SERVICE_URL
			+ "/gi/workingHoliday/policies";
	public static final String WORKINGHOLIDAY_FINALIZE_POLICY = SERVICE_URL
			+ "/gi/workingHoliday/policies";
	
	/*API For Home Care Modules
	*/
	public static final String GET_HOMECARE_UW_QUESTIONS = SERVICE_URL + "/gi/homeCare/uwQuestions";
	public static final String HOMECARE_GET_QUOTE = SERVICE_URL + "/gi/homeCare/quote";
	public static final String HOMECARE_CREATE_POLICY = SERVICE_URL + "/gi/homeCare/policies";
	public static final String HOMECARE_CONFIRM_POLICY = SERVICE_URL + "/gi/homeCare/payments/make";
	public static final String HOMECARE_SUBMIT_POLICY = SERVICE_URL + "/gi/homeCare/payments/submit";
	
	
	public static final String HOMECARE_FINALIZE_POLICY = SERVICE_URL + "/gi/homeCare/policies";
	public static final String HOMECARE_GET_DISTRICT = SERVICE_URL + "/option/itemDesc?itemTable=HKDistrict";	//SERVICE_URL + "/option/districts";
	public static final String HOMECARE_GET_TERRITORY_DISTRICT = SERVICE_URL + "/option/itemDesc?itemTable=HKTerritoryDistrict";	//SERVICE_URL + "/option/districts";
	public static final String HOMECARE_GET_TERRITORY = SERVICE_URL + "/option/itemDesc?itemTable=HKTerritory";
	public static final String HOMECARE_GET_NET_FLOOR_AREA = SERVICE_URL + "/option/itemDesc";
	
	/*API For Savie*/
	public static final String GET_SAVIE_ILLUSTRATION = SERVICE_URL + "/savie/salesIllustration";
	
	/* lang constants */
	public static final String LANG_TC_SLASH = "/tc/";
	public static final String LANG_EN_SLASH = "/en/";
	
	public static final String LANG_TC = "tc";
	public static final String LANG_EN = "en";
	
	public static final String UILOCALE_TC = "zh-HK";
	public static final String UILOCALE_EN = "en-US";

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
	
	/* Set Url From config.properties file */
	public static String getProperties(String key) {

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
			result = prop.getProperty(key).toString();

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
	
	public static String getLanaguage(HttpServletRequest request) 
	{
		HttpSession session = request.getSession();	
		String lang = "tc";
		
		if(session.getAttribute("language")!=null)
		{
			lang = session.getAttribute("language").toString();
		}
		else
		{
			// defalut language
			session.setAttribute("language", lang);
			// default locale
			session.setAttribute("uiLocale", "zh-HK");
		}
			
		return lang;
	}
	
	public static String checkLangSetPage(HttpServletRequest request){
		
//		return "/merged/";
		HttpSession session = request.getSession();	
		String lang = "tc";
		
		if(session.getAttribute("language")!=null){
			lang = session.getAttribute("language").toString();
		}
		
		if("EN".equals(lang))
		{
			return "/en/";
		}
		else if("CN".equals(lang))
		{
			return "/tc/";
		} 
		else if (lang.equalsIgnoreCase("tc"))
		{
			return "/tc/";
		}
		else 
		{
			return "/en";
		}
	}
	
	public static String getSitePath(HttpServletRequest request){
		return "/merged/";
//		HttpSession session = request.getSession();	
//		String lang = "CN";
//		if(session.getAttribute("language")!=null){
//			lang = session.getAttribute("language").toString();
//		}
//		if("EN".equals(lang)){
//			return "/en/";
//		}else if("CN".equals(lang)){
//			return "/cn/";
//		} else{
//			return "/en/";
//		}
	}

    public static String checkLangSetPage(String lang){
        if("EN".equalsIgnoreCase(lang)){
            return "/en/";
        }
        else if("CN".equalsIgnoreCase(lang)){
            return "/tc/";
        } 
        else if ("TC".equalsIgnoreCase(lang)) 
        {
        	return "/tc/";
        }
        else{
            return "/en/";
        }
    }

    public static String getWSLang(String lang){
        if("EN".equals(lang)){
            return "EN";
        }
        else if("CN".equals(lang)){
            return "ZH";
        } 
        else if("TC".equals(lang)){
            return "ZH";
        } 
        else{
            return "EN";
        }
    }
    
    public void updateLanguage(HttpServletRequest request)
    {
		String servletPath = request.getServletPath();
		HttpSession session = request.getSession();
		
		if (servletPath.indexOf(UserRestURIConstants.LANG_TC) >= 0)
		{
			session.setAttribute("language", UserRestURIConstants.LANG_TC);
			session.setAttribute("uiLocale", UserRestURIConstants.UILOCALE_TC);
		}
		else if (servletPath.indexOf(UserRestURIConstants.LANG_EN) > 0)
		{
			session.setAttribute("language", UserRestURIConstants.LANG_EN);
			session.setAttribute("uiLocale", UserRestURIConstants.UILOCALE_EN);
		}
		else
		{
			session.setAttribute("language", UserRestURIConstants.LANG_TC);
			session.setAttribute("uiLocale", UserRestURIConstants.UILOCALE_TC);			
		}
    }
}
