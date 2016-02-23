package com.ifwd.fwdhk.controller;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.util.StringUtils;

import com.ifwd.fwdhk.util.SpringUtil;


public class UserRestURIConstants {

	/*
	 * http://10.10.18.11:8080/eCommerce-ws
	 */
	public static final String SERVICE_URL = getConfigs("url");

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
	
	public static final String USER_PURCHASE_HISTORY = "/policies/retrieve";
	public static final String USER_ACCOUNT_BALANCE = "/member/account/balance";

	/* Flight Api */
	public static final String GETFLIGHTQUOTE = SERVICE_URL
			+ "/gi/flight/quote";
	public static final String CREATEFLIGHTPOLICY = SERVICE_URL
			+ "/gi/flight/policies";
	public static final String GET_AGE_TYPE = SERVICE_URL + "/option/itemDesc";
	public static final String GET_BENE_RELATIONSHIP_CODE = SERVICE_URL
			+ "/option/itemDesc";
	public static final String GET_POLICY= SERVICE_URL
			+ "/policies/life";
	public static final String GET_IS_UPLOAD= SERVICE_URL
			+ "/documents/uploaded";
	
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
	
	// Travel URL
	public static final String ANNUAL_TRAVEL_GET_QUOTE = SERVICE_URL
			+ "/gi/annualTravel/quote";
	public static final String ANNUAL_TRAVEL_CREATE_POLICY = SERVICE_URL
			+ "/gi/annualTravel/policies";
	public static final String ANNUAL_TRAVEL_CONFIRM_POLICY = SERVICE_URL
			+ "/gi/annualTravel/payments/make";
	public static final String ANNUAL_TRAVEL_FINALIZE_POLICY = SERVICE_URL
			+ "/gi/annualTravel/policies";
	public static final String ANNUAL_TRAVEL_GET_PROMOCODE = SERVICE_URL + "/leads/partnership/promoCode";
	
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
	
	//test
	public static final String TEST_PAYMENT_STATUS = SERVICE_URL + "/payment/status";
	
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
	public static final String SAVIE_PLAN_DETAIL = "/savie/planDetails";
	public static final String SAVIE_CREATE_POLICIES = SERVICE_URL + "/savie/policies";
	public static final String SAVIE_UPLOAD_DOCUMENTS = SERVICE_URL + "/documents/applications";
	public static final String SAVIE_UPSERT_APPOINTMENT = SERVICE_URL + "/customer/appointment";
	public static final String SEND_EMAIL = "/messages/email";
	public static final String SEND_LEAD = "/savie/lead";
	public static final String SEND_SIGN = "/documents/signature";
	public static final String SEND_DOCUMENTS = "/documents/applications";
	public static final String GENERATE_SALES_ILLUSTRATION = "/savie/salesIllustration";
	
	/*API For Oversea*/
	public static final String OVERSEA_GET_QUOTE = SERVICE_URL
			+ "/gi/overseasStudy/quote";
	public static final String OVERSEA_CREATE_POLICY = SERVICE_URL
			+ "/gi/overseasStudy/policies";
	public static final String OVERSEA_CONFIRM_POLICY = SERVICE_URL
			+ "/gi/overseasStudy/payments/make";
	public static final String OVERSEA_FINALIZE_POLICY = SERVICE_URL
			+ "/gi/overseasStudy/policies";
	public static final String OVERSEA_SUBMIT_POLICY = SERVICE_URL
			+ "/gi/homeCare/payments/submit";
	
	
	/*API For eliteTerm*/
	public static final String CREATE_ELITE_TERM_POLICY = "/eliteterm/policies";
	public static final String GET_ELITE_TERM_PREMIUM = "/eliteterm/premium";
	public static final String FINALIZE_ELITE_TERM_POLICY = "/eliteterm/policies";
	public static final String GET_UPLOADED_DOCUMENT = "/documents/uploaded";
	public static final String CONTACT_CS = "/member/cs/contact";
	public static final String SET_ELITE_TERM_POLICY_AGENT_EMAIL = "/eliteterm/policies/agentEmail";
	public static final String UPLOAD_SIGNATURE = "/documents/applications";
	public static final String UPLOAD_DOCUMENTS = "/documents/applications";
	
	/*API For Campaign Promo Code*/
	public static final String CAMPAIGN_PROMO_CODE_GET_COUNT = SERVICE_URL + "/leads/campaign/promoCodeCount";
	public static final String CAMPAIGN_PROMO_CODE_ASSIGN = SERVICE_URL + "/leads/campaign/assignPromoCode";
	
	/*API For savie online*/
	public static final String GET_FNA = SERVICE_URL + "/fna/history";
	public static final String GET_PURCHASE_HISTORY_BY_PLANCODE = SERVICE_URL + "/policies/retrieve";
	public static final String SAVE_FNA = SERVICE_URL + "/fna";
	public static final String GET_PRODUCTRECOMMENDATION = SERVICE_URL + "/fna/getProductRecommendation";
	public static final String CREATE_LIFE_POLICY = "/life/policies";
	public static final String FINALIZE_LIFE_POLICY = "/life/policies";
	
	public static final String CREATE_POLICY_APPLICATION_SAVE_FOR_LATER = SERVICE_URL + "/policies/application/saveForLater";
	public static final String GET_POLICY_APPLICATION_SAVE_FOR_LATER = "/policies/application/saveForLater?planCode=SAVIE-SP";
	/* Page Flow Control For Savie */
	
	//public static final String PAGE_SAVIE_LANDING = "landing";
	public static final String PAGE_SAVIE_PLAN_DETAILS = "plan-details";	
	public static final String PAGE_SAVIE_ACCOUNT_ACTIVATION = "account-activation";	
	public static final String PAGE_SAVIE_FNA = "financial-needs-analysis";
	public static final String PAGE_SAVIE_SALES_ILLUSTRATION = "sales-illustration";	
	public static final String PAGE_SAVIE_APPLICATION = "application";
	public static final String PAGE_SAVIE_APPLICATION_SUMMARY = "application-summary";	
	public static final String PAGE_SAVIE_DECLARATIONS = "declarations";
	public static final String PAGE_SAVIE_SIGNATURE = "signature";
	public static final String PAGE_SAVIE_DOCUMENT_UPLOAD = "document-upload";	
	public static final String PAGE_SAVIE_CONFIRMATION = "confirmation";
	public static final String PAGE_SAVIE_O2O_LANDING = "O2O-landing";
	public static final String PAGE_SAVIE_INTEREST_GATHERING = "interest-gathering";
	public static final String PAGE_SAVIE_EMAIL_SUBMITTED = "email-submitted";
	public static final String PAGE_SAVIE_SERVICE_CENTER = "customer-service-centre";
	public static final String PAGE_SAVIE_APPOINTMENT_SUCCESS = "appointment-success"; 
	public static final String PAGE_SAVIE_CONFIRMATION_OFFLINE = "confirmation-offline";
	
	public static final String PAGE_PROPERTIES_SAVIE_LANDING = "savie.landing";
	public static final String PAGE_PROPERTIES_SAVIE_PLAN_DETAILS = "savie.planDetails";
	public static final String PAGE_PROPERTIES_SAVIE_FNA = "savie.fna";
	public static final String PAGE_PROPERTIES_SAVIE_SALES_ILLUSTRATION = "savie.salesIllustration";
	public static final String PAGE_PROPERTIES_SAVIE_APPLICATION = "savie.application";
	public static final String PAGE_PROPERTIES_SAVIE_SUMMARY = "savie.summary";
	public static final String PAGE_PROPERTIES_SAVIE_CS = "savie.cs";
	public static final String PAGE_PROPERTIES_SAVIE_DOCUMENT_UPLOAD = "savie.documentUplaod";
	public static final String PAGE_PROPERTIES_SAVIE_CONFIRMATION = "savie.confirmation";
	public static final String PAGE_PROPERTIES_SAVIE_DECLARATION = "savie.declaration";
	public static final String PAGE_PROPERTIES_SAVIE_INTEREST_GATHERING = "savie.interestGathering";
	public static final String PAGE_PROPERTIES_SAVIE_EMAIL_SUBMITTED = "savie.emailSubmitted";
	public static final String PAGE_PROPERTIES_SAVIE_PDF = "pdf-show";
	public static final String PAGE_PROPERTIES_SAVIE_SIGNATURE = "savie.signature";
	public static final String PAGE_PROPERTIES_SAVIE_CENTRE = "savie.centre";
	
	/* Page Flow Control For OverSea */
	public static final String URL_OVERSEA_LANDING = "overseas-study-insurance";
	public static final String URL_OVERSEA_QUOTE = "plan-options";
	public static final String URL_OVERSEA_DETAILS = "application";
	public static final String URL_OVERSEA_SUMMARY = "payment";
	public static final String URL_OVERSEA_CONFIRMATION = "confirmation";
	
	public static final String PAGE_OVERSEA_LANDING = "oversea-landing";
	public static final String PAGE_OVERSEA_QUOTE = "oversea-plan-quote";
	public static final String PAGE_OVERSEA_DETAILS = "oversea-plan-details";
	public static final String PAGE_OVERSEA_SUMMARY = "oversea-plan-summary";
	public static final String PAGE_OVERSEA_CONFIRMATION = "oversea-plan-confirmation";
	
	public static final String PAGE_PROPERTIES_OVERSEA_LANDING = "oversea.landing";
	public static final String PAGE_PROPERTIES_OVERSEA_QUOTE = "oversea.quote";
	public static final String PAGE_PROPERTIES_OVERSEA_DETAILS = "oversea.details";
	public static final String PAGE_PROPERTIES_OVERSEA_SUMMARY = "oversea.summary";
	public static final String PAGE_PROPERTIES_OVERSEA_CONFIRMATION = "oversea.confirmation";
	
    /* Page Flow Control For Evergreen */
	
	public static final String PAGE_EVERGREEN_PLAN_DETAILS = "plan-details";	
	public static final String PAGE_EVERGREEN_ACCOUNT_ACTIVATION = "account-activation";	
	public static final String PAGE_EVERGREEN_FNA = "financial-needs-analysis";
	public static final String PAGE_EVERGREEN_SALES_ILLUSTRATION = "sales-illustration";	
	public static final String PAGE_EVERGREEN_APPLICATION = "application";
	public static final String PAGE_EVERGREEN_APPLICATION_SUMMARY = "application-summary";	
	public static final String PAGE_EVERGREEN_DECLARATIONS = "declarations";
	public static final String PAGE_EVERGREEN_SIGNATURE = "signature";
	public static final String PAGE_EVERGREEN_DOCUMENT_UPLOAD = "document-upload";	
	public static final String PAGE_EVERGREEN_CONFIRMATION = "confirmation";
	public static final String PAGE_EVERGREEN_O2O_LANDING = "O2O-landing";
	public static final String PAGE_EVERGREEN_INTEREST_GATHERING = "interest-gathering";
	public static final String PAGE_EVERGREEN_EMAIL_SUBMITTED = "email-submitted";
	public static final String PAGE_EVERGREEN_SERVICE_CENTER = "customer-service-centre";
	public static final String PAGE_EVERGREEN_APPOINTMENT_SUCCESS = "appointment-success"; 
	public static final String PAGE_EVERGREEN_CONFIRMATION_OFFLINE = "confirmation-offline";
	
	public static final String PAGE_PROPERTIES_EVERGREEN_LANDING = "savie.landing";
	public static final String PAGE_PROPERTIES_EVERGREEN_PLAN_DETAILS = "savie.planDetails";
	public static final String PAGE_PROPERTIES_EVERGREEN_FNA = "savie.fna";
	public static final String PAGE_PROPERTIES_EVERGREEN_SALES_ILLUSTRATION = "savie.salesIllustration";
	public static final String PAGE_PROPERTIES_EVERGREEN_APPLICATION = "savie.application";
	public static final String PAGE_PROPERTIES_EVERGREEN_SUMMARY = "savie.summary";
	public static final String PAGE_PROPERTIES_EVERGREEN_CS = "savie.cs";
	public static final String PAGE_PROPERTIES_EVERGREEN_DOCUMENT_UPLOAD = "savie.documentUplaod";
	public static final String PAGE_PROPERTIES_EVERGREEN_CONFIRMATION = "savie.confirmation";
	public static final String PAGE_PROPERTIES_EVERGREEN_DECLARATION = "savie.declaration";
	public static final String PAGE_PROPERTIES_EVERGREEN_INTEREST_GATHERING = "savie.interestGathering";
	public static final String PAGE_PROPERTIES_EVERGREEN_EMAIL_SUBMITTED = "savie.emailSubmitted";
	public static final String PAGE_PROPERTIES_EVERGREEN_PDF = "pdf-show";
	public static final String PAGE_PROPERTIES_EVERGREEN_SIGNATURE = "savie.signature";
	
	/* Page Flow Control For Elite */
	public static final String URL_ELITE_TERMS_LANDING = "term-life-insurance";
	public static final String URL_ELITE_TERMS_SELECT_PLAN = "select-plan";
	public static final String URL_ELITE_TERMS_APPLICATION = "application";
	public static final String URL_ELITE_TERMS_PAYMENT = "payment";
	public static final String URL_ELITE_TERMS_DOCUMENT_UPLOAD = "document-upload";
	public static final String URL_ELITE_TERMS_DOCUMENT_UPLOAD_LATER = "document-upload-later";
	public static final String URL_ELITE_TERMS_CONFIRMATION = "confirmation";
	public static final String URL_ELITE_TERMS_DOCUMENT_UPLOAD_HKID = "document-upload-hkid";
	public static final String URL_ELITE_TERMS_DOCUMENT_UPLOAD_PASSPORT = "document-upload-passport";
	public static final String URL_ELITE_TERMS_DOCUMENT_UPLOAD_ADDR_PROOF = "document-upload-addr-proof";
	
	
	public static final String PAGE_ELITE_TERMS_LANDING = "elite-terms-landing";
	public static final String PAGE_ELITE_TERMS_SELECT_PLAN = "elite-terms-select-plan";
	public static final String PAGE_ELITE_TERMS_PAYMENT = "elite-terms-payment";
	public static final String PAGE_ELITE_TERMS_DOCUMENT_UPLOAD = "elite-terms-document-upload";
	public static final String PAGE_ELITE_TERMS_CONFIRMATION = "elite-terms-confirmation";
	public static final String PAGE_ELITE_TERMS_DOCUMENT_UPLOAD_HKID = "document-upload-iframe-hkid";
	public static final String PAGE_ELITE_TERMS_DOCUMENT_UPLOAD_PASSPORT = "document-upload-iframe-passport";
	public static final String PAGE_ELITE_TERMS_DOCUMENT_UPLOAD_ADDR_PROOF = "document-upload-iframe-address";
	
	public static final String PAGE_PROPERTIES_ELITE_TERMS_LANDING = "elite.terms.landing";
	public static final String PAGE_PROPERTIES_ELITE_TERMS_SELECT_PLAN = "elite.terms.select-plan";
	public static final String PAGE_PROPERTIES_ELITE_TERMS_PAYMENT = "elite.terms.payment";
	public static final String PAGE_PROPERTIES_ELITE_TERMS_DOCUMENT_UPLOAD = "elite.terms.document-upload";
	public static final String PAGE_PROPERTIES_ELITE_TERMS_CONFIRMATION = "elite.terms.confirmation";
	
	/* Page Flow Control For savie online */
	public static final String PAGE_SAVIEONLINE_LANDING = "savie-landing";
	public static final String PAGE_SAVIEONLINE_PLANDETAILS = "savie-plan-details";
	public static final String PAGE_SAVIEONLINE_FNA = "savie-fna";
	public static final String PAGE_SAVIEONLINE_PRODUCT = "savie-product";
	public static final String PAGE_SAVIEONLINE_REVIEW = "savie-review";
	public static final String PAGE_SAVIEONLINE_SALES_ILLUSTRATION = "savie-sales-illustration";
	public static final String PAGE_SAVIEONLINE_LIFE_FATCA = "life-fatca";
	public static final String PAGE_SAVIEONLINE_LIFE_PERSONAL_DETAILS = "life-personal-details";
	public static final String PAGE_SAVIEONLINE_LIFE_EMPLOYMENT_INFO = "life-employment-info";
	public static final String PAGE_SAVIEONLINE_LIFE_BENEFICARY_INFO = "life-beneficary-info";
	public static final String PAGE_SAVIEONLINE_LIFE_PAYMENT = "life-payment";
	public static final String PAGE_SAVIEONLINE_LIFE_POLICY_SUMMARY = "life-policy-summary";
	public static final String PAGE_SAVIEONLINE_LIFE_DECLARATION = "life-declaration";
	public static final String PAGE_SAVIEONLINE_REVIEW4 = "life-review4";
	public static final String PAGE_SAVIEONLINE_LIFE_SIGNATURE = "life-signature";
	public static final String PAGE_SAVIEONLINE_LIFE_DOCUMENT_UPLOAD = "life-document-upload";
	public static final String PAGE_SAVIEONLINE_UPLOAD_CONFIRMATION = "upload-confirmation";
	public static final String PAGE_SAVIEONLINE_UPLOAD_LATER_CONFIRMATION = "upload-later-confirmation";
	public static final String PAGE_SAVIEONLINE_SIGN_OFFLINE_CONFIRMATION = "sign-offline-confirmation";
	public static final String PAGE_SAVIEONLINE_PAY_LATER_CONFIRMATION = "pay-later-confirmation";
	public static final String PAGE_SAVIEONLINE_APPOINTMENT_CONFIRMATION = "appointment-confirmation";
	public static final String PAGE_SAVIEONLINE_SERVICE_CENTER = "service-center";
	
	public static final String PAGE_PROPERTIES_SAVIEONLINE_LANDING = "savie.landing";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_PLANDETAILS = "savie.plan.details";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_FNA = "savie.fna";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_PRODUCT = "savie.product";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_REVIEW = "savie.review";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_SALES_ILLUSTRATION = "savie.sales.illustration";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_LIFE_FATCA = "life.fatca";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_LIFE_PERSONAL_DETAILS = "life.personal.details";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_LIFE_EMPLOYMENT_INFO = "life.employment.info";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_LIFE_BENEFICARY_INFO = "life.beneficary.info";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_LIFE_PAYMENT = "life.payment";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_LIFE_POLICY_SUMMARY = "life.policy.summary";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_LIFE_DECLARATION = "life.declaration";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_REVIEW4 = "life.review4";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_LIFE_SIGNATURE = "life.signature";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_LIFE_DOCUMENT_UPLOAD = "life.document.upload";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_UPLOAD_CONFIRMATION = "upload.confirmation";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_UPLOAD_LATER_CONFIRMATION = "upload.later.confirmation";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_SIGN_OFFLINE_CONFIRMATION = "sign.offline.confirmation";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_PAY_LATER_CONFIRMATION = "pay.later.confirmation";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_APPOINTMENT_CONFIRMATION = "appointment.confirmation";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_SERVICE_CENTER = "service.center";

	/* for image configuration */
	public static final String IMAGE_CONFIG = SERVICE_URL + "/ecommerce/configuration";
	
	public static final String SERVICE_CENTRE = "/appointment/serviceCentre";
	
	/* lang constants */
	public static final String LANG_TC_SLASH = "/tc/";
	public static final String LANG_EN_SLASH = "/en/";
	
	public static final String LANG_TC = "tc";
	public static final String LANG_EN = "en";
	
	public static final String UILOCALE_TC = "zh-HK";
	public static final String UILOCALE_EN = "en-US";

	/* Mail Api */
	public static final String SEND_MAIL = SERVICE_URL + "/messages/email";

	public static final String ERROR_HEADER1_1 = "You have successfully completed your purchase with FWD. An email will be sent to ";
	public static final String ERROR_HEADER1_2 = " with the details of your policy.";
	public static final String ERROR_DESCRIPTION1 = "Application number: ";
	public static final String ERROR_HEADER2_1 = "您已成功申請富衛保險。確認電郵將會發送至 ";
	public static final String ERROR_HEADER2_2 = "。";
	public static final String ERROR_DESCRIPTION2 = "申請編號： ";
	
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
	
	/**
	 * 传入key，可获取config文件中对应的值
	 * @param key
	 * @return
	 */
	public static String getConfigs(String key) {
		Method method;
		Object obj;
		String value = "";
		if(!StringUtils.isEmpty(key)) {
			try {
				obj = SpringUtil.getObject("configBean");
				key = key.substring(0, 1).toUpperCase() + key.substring(1, key.length());
				method = obj.getClass().getMethod("get" + key);
				value = (String)method.invoke(obj);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return value;
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
