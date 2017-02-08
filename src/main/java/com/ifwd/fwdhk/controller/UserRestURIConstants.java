package com.ifwd.fwdhk.controller;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.util.StringUtils;

import com.ifwd.fwdhk.model.ConfigBean;
import com.ifwd.fwdhk.util.SpringUtil;


public class UserRestURIConstants {
	
	static Object obj = SpringUtil.getObject("configBean");

	/*
	 * http://10.10.18.11:8080/eCommerce-ws
	 */
	public final static String APP_ID = getConfigs("appId");
	
	public final static String PUBLIC_KEY = getConfigs("publicKey");
	
	public final static String API_KEI = getConfigs("apiKei");
	
	public final static String TAG_GO_URL = getConfigs("tagGoUrl");
	
	
	public final static String SERVICE_URL = getConfigs("url");
	
	public final static String IFWD_PATH = getConfigs("ifwdPath");

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
	public static final String HOMECARE_GET_QUOTE = SERVICE_URL + "/gi/home/easyHome/quote";
	public static final String HOMECARE_CREATE_POLICY = SERVICE_URL + "/gi/homeCare/policies";
	public static final String HOMECARE_CONFIRM_POLICY = SERVICE_URL + "/gi/homeCare/payments/make";
	public static final String HOMECARE_SUBMIT_POLICY = SERVICE_URL + "/gi/homeCare/payments/submit";
	
	
	public static final String HOMECARE_FINALIZE_POLICY = SERVICE_URL + "/gi/homeCare/policies";
	public static final String HOMECARE_GET_DISTRICT = SERVICE_URL + "/option/itemDesc?itemTable=HKDistrict";	//SERVICE_URL + "/option/districts";
	public static final String HOMECARE_GET_TERRITORY_DISTRICT = SERVICE_URL + "/option/itemDesc?itemTable=HKTerritoryDistrict";	//SERVICE_URL + "/option/districts";
	public static final String HOMECARE_GET_TERRITORY = SERVICE_URL + "/option/itemDesc?itemTable=HKTerritory";
	public static final String HOMECARE_GET_NET_FLOOR_AREA = SERVICE_URL + "/option/itemDesc";
	
	/*API For Easy home Modules*/
	public static final String EASYHOME_GET_QUOTE = SERVICE_URL + "/gi/home/easyHome/quote";
	public static final String EASYHOME_CREATE_POLICY = SERVICE_URL + "/gi/home/easyHome/policies";
	public static final String EASYHOME_CONFIRM_POLICY = SERVICE_URL + "/gi/home/easyHome/payments/make";
	public static final String EASYHOME_FINALIZE_POLICY = SERVICE_URL + "/gi/home/easyHome/policies";
	
	/*API For Home liability Modules*/
	public static final String HOMELIABILITY_GET_QUOTE = SERVICE_URL + "/gi/home/homeLiability/quote";
	public static final String HOMELIABILITY_CREATE_POLICY = SERVICE_URL + "/gi/home/homeLiability/policies";
	public static final String HOMELIABILITY_CONFIRM_POLICY = SERVICE_URL + "/gi/home/homeLiability/payments/make";
	public static final String HOMELIABILITY_FINALIZE_POLICY = SERVICE_URL + "/gi/home/homeLiability/policies";
	
	/*API For Registration Revamp*/
	public static final String REGISTRATION_REVAMP_FORGET_USERNAME = SERVICE_URL + "/member/forgotUserName/customer";
	public static final String REGISTRATION_REVAMP_FORGET_PASSWORD = SERVICE_URL + "/member/forgotPassword/customer";
	public static final String REGISTRATION_REVAMP_REGISTER_USER = SERVICE_URL + "/member/register/member/customer";
	
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
	public static final String CAMPAIGN_PROMO_CODE_GET_COUNTS = SERVICE_URL + "/leads/campaign/promoCodeCounts";
	public static final String CAMPAIGN_PROMO_CODE_ASSIGN = SERVICE_URL + "/leads/campaign/assignPromoCode";
	
	/*API For savie online*/
	public static final String GET_FNA = SERVICE_URL + "/fna/history";
	public static final String GET_PURCHASE_HISTORY_BY_PLANCODE = SERVICE_URL + "/policies/retrieve";
	public static final String SAVE_FNA = SERVICE_URL + "/fna/save";
	public static final String GET_PRODUCTRECOMMENDATION = SERVICE_URL + "/fna/getProductRecommendation";
	public static final String CREATE_LIFE_POLICY = "/life/policies";
	public static final String FINALIZE_LIFE_POLICY = "/life/policies";
	public static final String GET_BANK_INFO = SERVICE_URL + "/policies/ddaBank";
	
	public static final String CREATE_POLICY_APPLICATION_SAVE_FOR_LATER = "/policies/application/saveForLater";
	public static final String GET_POLICY_APPLICATION_SAVE_FOR_LATER = "/policies/application/saveForLater?planCode=SAVIE-SP";
	public static final String VALIDATE_SESSION = SERVICE_URL + "/member/token";
	public static final String CLEAR_FNA = "/fna/clear";
	public static final String START_POLICY_APPLICATION = "/policies/application/start";
	public static final String SEND_EMAILS = SERVICE_URL + "/messages/template/email";
	public static final String SEND_TEMPLATE_EMAIL = "/messages/template/email";
	public static final String SAVIE_CONTACT_CS = SERVICE_URL + "/member/cs/contact";
	public static final String BECOME_PARTNER = "/leads/partnership/register";
	
	/*API For GA*/
	public static final String GET_HOME_CARE_UW_QUESTIONS = "/gi/homeCare/uwQuestions";
	/* Page Flow Control For Savie */
	
	//public static final String PAGE_SAVIE_LANDING = "landing";
	public static final String PAGE_SAVIE_PLAN_DETAILS = "plan-details";
	public static final String PAGE_SAVIE_PLAN_DETAILS_SP = "plan-details-sp";
	public static final String PAGE_SAVIE_PLAN_DETAILS_RP = "plan-details-rp";
	public static final String PAGE_SAVIE_ACCOUNT_ACTIVATION = "account-activation";	
	public static final String PAGE_SAVIE_FNA = "financial-needs-analysis";
	public static final String PAGE_SAVIE_SALES_ILLUSTRATION = "sales-illustration";	
	public static final String PAGE_SAVIE_APPLICATION = "application";
	public static final String PAGE_SAVIE_APPLICATION_SUMMARY = "application-summary";	
	public static final String PAGE_SAVIE_DECLARATIONS = "declarations";
	public static final String PAGE_SAVIE_SIGNATURE = "signature";
	public static final String PAGE_SAVIE_DOCUMENT_UPLOAD = "document-upload";	
	public static final String PAGE_SAVIE_CONFIRMATION = "confirmation-sp";
	public static final String PAGE_SAVIE_CONFIRMATION_RP = "confirmation-rp";
	public static final String PAGE_SAVIE_O2O_LANDING = "savings-insurance-sp";
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
	public static final String PAGE_PROPERTIES_SAVIE_CONFIRMATION_RP = "savierp.confirmation.rp";
	public static final String PAGE_PROPERTIES_SAVIE_DECLARATION = "savie.declaration";
	public static final String PAGE_PROPERTIES_SAVIE_INTEREST_GATHERING = "savie.interestGathering";
	public static final String PAGE_PROPERTIES_SAVIE_EMAIL_SUBMITTED = "savie.emailSubmitted";
	public static final String PAGE_PROPERTIES_SAVIE_PDF = "pdf-show";
	public static final String PAGE_PROPERTIES_SAVIE_SIGNATURE = "savie.signature";
	public static final String PAGE_PROPERTIES_SAVIE_CENTRE = "savie.centre";
	
	public static final String URL_SAVIE_LANDING_RP = "regular-premium";
	public static final String PAGE_SAVIE_LANDING_RP = "savings-insurance-rp";
	public static final String PAGE_PROPERTIES_SAVIE_LANDING_RP = "savierp.landing.rp";
	
	
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
	public static final String PAGE_EVERGREEN_O2O_LANDING = "savings-insurance-sp";
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
	
	/* Page Flow Control For Home Liability */
	public static final String URL_HOME_LIABILITY_LANDING = "home-liability";
	public static final String URL_HOME_LIABILITY_SCREENING = "screening";
	public static final String URL_HOME_LIABILITY_SELECT_PLAN = "quote";
	public static final String URL_HOME_LIABILITY_USER_DETAILS = "application";
	public static final String URL_HOME_LIABILITY_SUMMARY = "summary";
	public static final String URL_HOME_LIABILITY_CONFIRMATION = "confirmation";
	
	public static final String PAGE_HOME_LIABILITY_LANDING = "home-liability-landing";
	public static final String PAGE_HOME_LIABILITY_SCREENING = "home-screening";
	public static final String PAGE_HOME_LIABILITY_SELECT_PLAN = "home-liability-select-plan";
	public static final String PAGE_HOME_LIABILITY_USER_DETAILS = "home-application";
	public static final String PAGE_HOME_LIABILITY_SUMMARY = "home-summary";
	public static final String PAGE_HOME_LIABILITY_CONFIRMATION = "home-confirmation";
	
	public static final String PAGE_PROPERTIES_HOME_LIABILITY_LANDING = "home.liability.landing";
	public static final String PAGE_PROPERTIES_HOME_LIABILITY_SCREENING = "home.liability.screening";
	public static final String PAGE_PROPERTIES_HOME_LIABILITY_SELECT_PLAN = "home.liability.select.plan";
	public static final String PAGE_PROPERTIES_HOME_LIABILITY_USER_DETAILS = "home.liability.application";
	public static final String PAGE_PROPERTIES_HOME_LIABILITY_SUMMARY = "home.liability.summary";
	public static final String PAGE_PROPERTIES_HOME_LIABILITY_CONFIRMATION = "home.liability.confirmation";
	
	/* Page Flow Control For Home Care */
	public static final String URL_EASY_HOME_LANDING = "easy-home-care";
	public static final String URL_EASY_HOME_SCREENING = "screening";
	public static final String URL_EASY_HOME_SELECT_PLAN = "quote";
	public static final String URL_EASY_HOME_USER_DETAILS = "application";
	public static final String URL_EASY_HOME_SUMMARY = "summary";
	public static final String URL_EASY_HOME_CONFIRMATION = "confirmation";
	
	public static final String PAGE_EASY_HOME_LANDING = "home-care-landing";
	public static final String PAGE_EASY_HOME_SCREENING = "home-screening";
	public static final String PAGE_EASY_HOME_SELECT_PLAN = "home-care-select-plan";
	public static final String PAGE_EASY_HOME_USER_DETAILS = "home-application";
	public static final String PAGE_EASY_HOME_SUMMARY = "home-summary";
	public static final String PAGE_EASY_HOME_CONFIRMATION = "home-confirmation";
	
	public static final String PAGE_PROPERTIES_EASY_HOME_LANDING = "easy.home.landing";
	public static final String PAGE_PROPERTIES_EASY_HOME_SCREENING = "easy.home.screening";
	public static final String PAGE_PROPERTIES_EASY_HOME_SELECT_PLAN = "easy.home.select.plan";
	public static final String PAGE_PROPERTIES_EASY_HOME_USER_DETAILS = "easy.home.application";
	public static final String PAGE_PROPERTIES_EASY_HOME_SUMMARY = "easy.home.summary";
	public static final String PAGE_PROPERTIES_EASY_HOME_CONFIRMATION = "easy.home.confirmation";

	/* API For Passkit      */		
	public static final String VALIDATE_POLICY_BY_POLICY_NO = SERVICE_URL + "/passkit/policies/validate";	
	public static final String VALIDATE_POLICY_HOLDERS_BY_POLICY_NO = SERVICE_URL + "/passkit/policies/policiesHolder/validate";
	
	public static final String PAGE_PROPERTIES_PASSKIT_LANDING = "passkit.landing";
	
	public static final String PAGE_PASSKIT_LANDING = "passkit-verification";	
	
	/* Wealthree Page Settings */
	public static final String PAGE_WEALTHREE_LANDING = "landing";		
	public static final String PAGE_WEALTHREE_SERVICE_CENTER = "customer-service-centre";		
	public static final String PAGE_WEALTHREE_CONFIRMATION_APPOINTMENT_SP="confirmation-appointment";		

	public static final String PAGE_PROPERTIES_WEALTHREE_LANDING = "wealthree.landing";		
	public static final String PAGE_PROPERTIES_WEALTHREE_SERVICE_CENTER = "wealthree.customer.service.centre";		
	public static final String PAGE_PROPERTIES_WEALTHREE_CONFIRMATION_APPOINTMENT_SP="wealthree.confirmation.appointment.sp";		
	
	/* API For provie online */		
	public static final String PROVIE_PLAN_DETAIL = "/premium/provie/planDetails";		
	public static final String GET_PROVIE_RIDER_ELIGIBILITY = SERVICE_URL + "/life/provie/rider/eligibility";		
	
	
	/* Page Flow Control For provie online */		
	public static final String URL_PROVIE_SINGLE_PREMIUM = "single-premium";		
	public static final String URL_PROVIE_REGULAR_PREMIUM = "regular-premium";		
			
	public static final String PAGE_PROVIE_LANDING = "landing";		
	public static final String PAGE_PROVIE_PLANDETAILS = "provie-plan-details";		
	public static final String PAGE_PROVIE_SERVICE_CENTER = "provie-customer-service-centre";		
//	public static final String PAGE_PROVIE_CONFIRMATION_APPOINTMENT = "confirmation-appointment-sp";		
	public static final String PAGE_PROVIE_CONFIRMATION_APPOINTMENT_SP="provie-confirmation-appointment-sp";		
	public static final String PAGE_PROVIE_CONFIRMATION_APPOINTMENT_RP="provie-confirmation-appointment-rp";		
	public static final String PAGE_PROVIE_SALES_ILLUSTRATION= "sales-illustration";		
	public static final String PAGE_PROVIE_FATCA = "fatca";		
	public static final String PAGE_PROVIE_MEDICAL_HISTORY_CANCER= "medical-history-cancer";		
	public static final String PAGE_PROVIE_MEDICAL_HISTORY_TERM_LIFE= "medical-history-term-life";		
	public static final String PAGE_PROVIE_PERSONAL_DETAILS= "personal-details";		
	public static final String PAGE_PROVIE_EMPLOYMENT_INFO= "employment-info";		
	public static final String PAGE_PROVIE_BENEFICARY_INFO = "beneficiary-info";		
	public static final String PAGE_PROVIE_PAYMENT = "payment";		
	public static final String PAGE_PROVIE_CONFIRMATION_PAYLATER = "confirmation-paylater";		
	public static final String PAGE_PROVIE_APPLICATION_SUMMARY = "application-summary";		
	public static final String PAGE_PROVIE_DECLARATION = "declaration";		
	public static final String PAGE_PROVIE_SIGNATURE = "signature";		
	public static final String PAGE_PROVIE_CONFIRMATION_OFFLINE_SIGNATURE = "confirmation-offline-signature";		
	public static final String PAGE_PROVIE_DOCUMENT_UPLOAD =  "document-upload";		
	public static final String PAGE_PROVIE_CONFIRMATION_UPLOAD_LATER = "confirmation-upload-later";		
	public static final String PAGE_PROVIE_CONFIRMATION = "confirmation";		
	//public static final String PAGE_PROVIE_PLANDETAILS_SP = "plan-details-sp";		
	//public static final String PAGE_PROVIE_PLANDETAILS_RP = "plan-details-rp";		
			
	public static final String PAGE_PROPERTIES_PROVIE = "provie";		
	public static final String PAGE_PROPERTIES_PROVIE_LANDING = "provie.landing";		
	public static final String PAGE_PROPERTIES_PROVIE_SINGLE_PREMIUM = "provie.landing.sp";		
	public static final String PAGE_PROPERTIES_PROVIE_REGULAR_PREMIUM = "provie.landing.rp";		
	public static final String PAGE_PROPERTIES_PROVIE_PLANDETAILS = "provie.plan.details";		
	public static final String PAGE_PROPERTIES_PROVIE_SERVICE_CENTER = "provie.customer.service.centre";		
	//public static final String PAGE_PROPERTIES_PROVIE_CONFIRMATION_APPOINTMENT = "provie.confirmation.appointment";		
			
	public static final String PAGE_PROPERTIES_PROVIE_CONFIRMATION_APPOINTMENT_SP="provie.confirmation.appointment.sp";		
	public static final String PAGE_PROPERTIES_PROVIE_CONFIRMATION_APPOINTMENT_RP="provie.confirmation.appointment.rp";		
	public static final String PAGE_PROPERTIES_PROVIE_SALES_ILLUSTRATION= "provie.sales.illustration";		
	public static final String PAGE_PROPERTIES_PROVIE_FATCA = "provie.fatca";		
	public static final String PAGE_PROPERTIES_PROVIE_MEDICAL_HISTORY_CANCER= "provie.medical.history.cancer";		
	public static final String PAGE_PROPERTIES_PROVIE_MEDICAL_HISTORY_TERM_LIFE= "provie.medical.history.term.life";		
	public static final String PAGE_PROPERTIES_PROVIE_PERSONAL_DETAILS= "provie.personal.details";		
	public static final String PAGE_PROPERTIES_PROVIE_EMPLOYMENT_INFO= "provie.employment.info";		
	public static final String PAGE_PROPERTIES_PROVIE_BENEFICARY_INFO = "provie.beneficiary.info";		
	public static final String PAGE_PROPERTIES_PROVIE_PAYMENT = "provie.payment";		
	public static final String PAGE_PROPERTIES_PROVIE_CONFIRMATION_PAYLATER = "provie.confirmation.paylater";		
	public static final String PAGE_PROPERTIES_PROVIE_APPLICATION_SUMMARY = "provie.application.summary";		
	public static final String PAGE_PROPERTIES_PROVIE_DECLARATION = "provie.declaration";		
	public static final String PAGE_PROPERTIES_PROVIE_SIGNATURE = "provie.signature";		
	public static final String PAGE_PROPERTIES_PROVIE_CONFIRMATION_OFFLINE_SIGNATURE = "provie.confirmation.offline.signature";		
	public static final String PAGE_PROPERTIES_PROVIE_DOCUMENT_UPLOAD =  "provie.document.upload";		
	public static final String PAGE_PROPERTIES_PROVIE_CONFIRMATION_UPLOAD_LATER = "provie.confirmation.upload.later";		
	public static final String PAGE_PROPERTIES_PROVIE_CONFIRMATION = "provie.confirmation";

	/* Page Flow Control For savie online */
	public static final String URL_SAVIEONLINE_SINGLE_PREMIUM = "single-premium";
	public static final String URL_SAVIEONLINE_REGULAR_PREMIUM = "regular-premium";
	
	public static final String PAGE_SAVIEONLINE_LANDING = "O2O-landing";
	public static final String PAGE_SAVIEONLINE_PLANDETAILS = "plan-details-sp";
	public static final String PAGE_SAVIEONLINE_FNA = "financial-needs-analysis";
	public static final String PAGE_SAVIEONLINE_PRODUCT = "product-recommendation";
	public static final String PAGE_SAVIEONLINE_REVIEW = "review";
	public static final String PAGE_SAVIEONLINE_SALES_ILLUSTRATION = "sales-illustration";
	public static final String PAGE_SAVIEONLINE_LIFE_FATCA = "fatca";
	public static final String PAGE_SAVIEONLINE_LIFE_PERSONAL_DETAILS = "personal-details";
	public static final String PAGE_SAVIEONLINE_LIFE_EMPLOYMENT_INFO = "employment-info";
	public static final String PAGE_SAVIEONLINE_LIFE_BENEFICARY_INFO = "beneficiary-info";
	public static final String PAGE_SAVIEONLINE_LIFE_PAYMENT = "payment";
	public static final String PAGE_SAVIEONLINE_LIFE_POLICY_SUMMARY = "application-summary";
	public static final String PAGE_SAVIEONLINE_LIFE_DECLARATION = "declaration";
	public static final String PAGE_SAVIEONLINE_LIFE_SIGNATURE = "signature";
	public static final String PAGE_SAVIEONLINE_LIFE_DOCUMENT_UPLOAD = "document-upload";
	public static final String PAGE_SAVIEONLINE_UPLOAD_CONFIRMATION = "confirmation";
	public static final String PAGE_SAVIEONLINE_UPLOAD_LATER_CONFIRMATION = "confirmation-upload-later";
	public static final String PAGE_SAVIEONLINE_SIGN_OFFLINE_CONFIRMATION = "confirmation-offline-signature";
	public static final String PAGE_SAVIEONLINE_PAY_LATER_CONFIRMATION = "confirmation-paylater";
	public static final String PAGE_SAVIEONLINE_CONFIRMATION_APPOINTMENT_SP = "confirmation-appointment-sp";
	public static final String PAGE_SAVIEONLINE_CONFIRMATION_APPOINTMENT_RP = "confirmation-appointment-rp";
	public static final String PAGE_SAVIEONLINE_SERVICE_CENTER = "customer-service-centre";
	public static final String PAGE_SAVIEONLINE_SINGLE_PREMIUM = "savings-insurance-sp";
	public static final String PAGE_SAVIEONLINE_REGULAR_PREMIUM = "savings-insurance-rp";
	public static final String PAGE_SAVIEONLINE_PLANDETAILS_SP = "plan-details-sp";
	public static final String PAGE_SAVIEONLINE_PLANDETAILS_RP = "plan-details-rp";
	
	public static final String PAGE_PROPERTIES_SAVIEONLINE_LANDING = "savings.landing";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_SINGLE_PREMIUM = "savie.landing.sp";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_REGULAR_PREMIUM = "savie.landing.rp";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_PLANDETAILS = "savings.plan.details";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_FNA = "fna.fna";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_PRODUCT = "fna.product.recommendation";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_REVIEW = "fna.review";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_SALES_ILLUSTRATION = "savings.sales.illustration";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_LIFE_FATCA = "savings.fatca";
	public static final String PAGE_PROPERTIES_EASYHEALTHONLINE_LIFE_FATCA = "easyhealth.fatca";
	
	public static final String PAGE_PROPERTIES_SAVIEONLINE_LIFE_PERSONAL_DETAILS = "savings.personal.details";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_LIFE_EMPLOYMENT_INFO = "savings.employment.info";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_LIFE_BENEFICARY_INFO = "savings.beneficary.info";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_LIFE_PAYMENT = "savings.payment";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_LIFE_POLICY_SUMMARY = "savings.application.summary";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_LIFE_DECLARATION = "savings.declaration";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_LIFE_SIGNATURE = "savings.signature";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_LIFE_DOCUMENT_UPLOAD = "savings.document.upload";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_UPLOAD_CONFIRMATION = "savings.confirmation";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_UPLOAD_LATER_CONFIRMATION = "savings.confirmation.upload.later";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_SIGN_OFFLINE_CONFIRMATION = "savings.confirmation.offline.signature";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_PAY_LATER_CONFIRMATION = "savings.confirmation.paylater";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_CONFIRMATION_APPOINTMENT_SP = "savings.confirmation.appointment.sp";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_CONFIRMATION_APPOINTMENT_RP = "savings.confirmation.appointment.rp";
	public static final String PAGE_PROPERTIES_SAVIEONLINE_SERVICE_CENTER = "savings.customer.service.centre";
	
	/* Page Flow Control For easy health */
	public static final String URL_EASYHEALTH = "landing";
	public static final String URL_EASYHEALTH_PLAN_OPTION = "plan-option";
	public static final String URL_EASYHEALTH_UNDERWRITING = "underwriting";
	public static final String URL_EASYHEALTH_SIGNATURE = "signature";
	public static final String URL_EASYHEALTH_PAYMENT = "payment";
	public static final String URL_EASYHEALTH_CONFIRMATION = "confirmation";
	
	public static final String PAGE_PROPERTIES_EASYHEALTH = "easyhealth.landing";
	public static final String PAGE_PROPERTIES_EASYHEALTH_PLAN_OPTION = "easyhealth.plan.option";
	public static final String PAGE_PROPERTIES_EASYHEALTH_UNDERWRITING = "easyhealth.underwriting";
	public static final String PAGE_PROPERTIES_EASYHEALTH_SIGNATURE = "easyhealth.signature";
	public static final String PAGE_PROPERTIES_EASYHEALTH_PAYMENT = "easyhealth.payment";
	public static final String PAGE_PROPERTIES_EASYHEALTH_CONFIRMATION = "easyhealth.confirmation";
	
	public static final String PAGE_PROPERTIES_EASYHEALTH_PERSONAL_DETAILS = "easyhealth.personal.details";
	public static final String PAGE_PROPERTIES_EASYHEALTH_EMPLOYMENT_INFO = "easyhealth.employment.info";
	public static final String PAGE_PROPERTIES_EASYHEALTH_BENEFICARY_INFO = "easyhealth.beneficary.info";
	public static final String PAGE_PROPERTIES_EASYHEALTH_POLICY_SUMMARY = "easyhealth.application.summary";
	public static final String PAGE_PROPERTIES_EASYHEALTH_DECLARATION = "easyhealth.declaration";
	
	public static final String PAGE_PROPERTIES_EASYHEALTH_DOCUMENT_UPLOAD = "easyhealth.document.upload";
	public static final String PAGE_PROPERTIES_EASYHEALTH_DOCUMENT_UPLOAD_LATER = "easyhealth.document.upload.later";
	public static final String PAGE_PROPERTIES_EASYHEALTH_UPLOAD_CONFIRMATION = "easyhealth.confirmation";
	public static final String PAGE_PROPERTIES_EASYHEALTH_UPLOAD_LATER_CONFIRMATION = "easyhealth.confirmation.upload.later";
	
	/* Page Flow Control For medical guardian */
	public static final String URL_MEDICAL_GUARDIAN = "landing";
	public static final String URL_MEDICAL_GUARDIAN_PLAN_OPTION = "plan-option";
	public static final String URL_MEDICAL_GUARDIAN_UNDERWRITING = "underwriting";
	public static final String URL_MEDICAL_GUARDIAN_EMPLOYMENT_INFO = "employment-info";
	public static final String URL_MEDICAL_GUARDIAN_BENEFICIARY = "beneficiary";
	public static final String URL_MEDICAL_GUARDIAN_SUMMARY = "summary";
	public static final String URL_MEDICAL_GUARDIAN_DECLARATION = "declaration";
	public static final String URL_MEDICAL_GUARDIAN_SIGNATURE = "signature";
	public static final String URL_MEDICAL_GUARDIAN_PAYMENT = "payment";
	public static final String URL_MEDICAL_GUARDIAN_DOCUMENT_UPLOAD = "document-upload";
	public static final String URL_MEDICAL_GUARDIAN_CONFIRMATION = "confirmation";
	
	public static final String PAGE_PROPERTIES_MEDICALGUARDIAN = "medicalguardian.landing";
	public static final String PAGE_PROPERTIES_MEDICALGUARDIAN_PLAN_OPTION = "medicalguardian.plan.option";
	public static final String PAGE_PROPERTIES_MEDICALGUARDIAN_UNDERWRITING = "medicalguardian.underwriting";
	public static final String PAGE_PROPERTIES_MEDICALGUARDIAN_LIFE_FATCA = "medicalguardian.fatca";
	public static final String PAGE_PROPERTIES_MEDICALGUARDIAN_SIGNATURE = "medicalguardian.signature";
	public static final String PAGE_PROPERTIES_MEDICALGUARDIAN_PAYMENT = "medicalguardian.payment";
	public static final String PAGE_PROPERTIES_MEDICALGUARDIAN_CONFIRMATION = "medicalguardian.confirmation";
	
	public static final String PAGE_PROPERTIES_MEDICALGUARDIAN_PERSONAL_DETAILS = "medicalguardian.personal.details";
	public static final String PAGE_PROPERTIES_MEDICALGUARDIAN_EMPLOYMENT_INFO = "medicalguardian.employment.info";
	public static final String PAGE_PROPERTIES_MEDICALGUARDIAN_BENEFICARY_INFO = "medicalguardian.beneficary.info";
	public static final String PAGE_PROPERTIES_MEDICALGUARDIAN_POLICY_SUMMARY = "medicalguardian.application.summary";
	public static final String PAGE_PROPERTIES_MEDICALGUARDIAN_DECLARATION = "medicalguardian.declaration";
	
	public static final String PAGE_PROPERTIES_MEDICALGUARDIAN_DOCUMENT_UPLOAD = "medicalguardian.document.upload";
	public static final String PAGE_PROPERTIES_MEDICALGUARDIAN_DOCUMENT_UPLOAD_LATER = "medicalguardian.document.upload.later";
	public static final String PAGE_PROPERTIES_MEDICALGUARDIAN_UPLOAD_CONFIRMATION = "medicalguardian.confirmation";
	public static final String PAGE_PROPERTIES_MEDICALGUARDIAN_UPLOAD_LATER_CONFIRMATION = "medicalguardian.confirmation.upload.later";
	
	/* Page Flow Control For motor */			
	

	public static final String URL_MOTOR_LANDING = "landing";
	public static final String URL_MOTOR_GET_QUOTE = "get-quote";
	public static final String URL_MOTOR_QUICK_QUOTE = "rider-options";
	public static final String URL_MOTOR_PLAN_THIRD = "third-party-quote";
	public static final String URL_MOTOR_PLAN_COMP = "comprehensive-quote";

	//public static final String URL_MOTOR_RIDER_OPTIONS = "rider-options";	
	public static final String URL_MOTOR_CAR_DETAILS = "car-details";
	public static final String URL_MOTOR_DRIVERS_DETAILS = "drivers-details";
	public static final String URL_MOTOR_POLICY_DETAILS = "policy-details";
	public static final String URL_MOTOR_DECLARATIONS = "declarations";
	public static final String URL_MOTOR_APPLICATION_SUMMARY = "application-summary";
	public static final String URL_MOTOR_CONFIRMATION = "confirmation";
	public static final String URL_MOTOR_DOCUMENT_UPLOAD = "document-upload";
	public static final String URL_MOTOR_DOCUMENT_UPLOAD_CONFIRMATION= "document-upload-confirmation";
	public static final String URL_MOTOR_DOCUMENT_UPLOAD_LATER = "document-upload-later";
	public static final String URL_MOTOR_DOCUMENT_UPLOAD_LATER_CONFIRMATION = "document-upload-later-confirmation";
	public static final String URL_MOTOR_DOCUMENT_UPLOAD_LATER_CHECK = "start-upload-later-check";

	public static final String FILE_MOTOR_LANDING = "landing";
	public static final String FILE_MOTOR_GET_QUOTE = "get-quote";
	public static final String FILE_MOTOR_QUICK_QUOTE = "quick-quote";
	public static final String FILE_MOTOR_PLAN_THIRD = "plan-third";
	public static final String FILE_MOTOR_PLAN_COMP = "plan-comp";
	
	public static final String FILE_MOTOR_RIDER_OPTIONS = "rider-options";	
	public static final String FILE_MOTOR_CAR_DETAILS = "car-details";
	public static final String FILE_MOTOR_DRIVERS_DETAILS = "drivers-details";
	public static final String FILE_MOTOR_POLICY_DETAILS = "policy-details";
	public static final String FILE_MOTOR_DECLARATIONS = "declarations";
	public static final String FILE_MOTOR_APPLICATION_SUMMARY = "application-summary";
	public static final String FILE_MOTOR_CONFIRMATION = "confirmation";
	public static final String FILE_MOTOR_DOCUMENT_UPLOAD = "document-upload";
	public static final String FILE_MOTOR_DOCUMENT_UPLOAD_CONFIRMATION= "document-upload-confirmation";
	public static final String FILE_MOTOR_DOCUMENT_UPLOAD_LATER = "document-upload-later";
	public static final String FILE_MOTOR_DOCUMENT_UPLOAD_LATER_CONFIRMATION = "document-upload-later-confirmation";
	public static final String FILE_MOTOR_DOCUMENT_UPLOAD_LATER_CHECK = "start-upload-later-check";

	public static final String PAGE_PROPERTIES_MOTOR_LANDING = "motor.landing";
	public static final String PAGE_PROPERTIES_MOTOR_GET_QUOTE = "motor.get-quote";
	public static final String PAGE_PROPERTIES_MOTOR_QUICK_QUOTE = "motor.quick-quote";
	public static final String PAGE_PROPERTIES_MOTOR_PLAN_THIRD = "motor.plan-third";
	public static final String PAGE_PROPERTIES_MOTOR_PLAN_COMP = "motor.plan-comp";
	
	public static final String PAGE_PROPERTIES_MOTOR_QUOTE = "motor.quote";	
	public static final String PAGE_PROPERTIES_MOTOR_RIDER_OPTIONS = "motor.rider-options";	
	public static final String PAGE_PROPERTIES_MOTOR_CAR_DETAILS = "motor.car-details";
	public static final String PAGE_PROPERTIES_MOTOR_DRIVERS_DETAILS = "motor.drivers-details";
	public static final String PAGE_PROPERTIES_MOTOR_POLICY_DETAILS = "motor.policy-details";
	public static final String PAGE_PROPERTIES_MOTOR_DECLARATIONS = "motor.declarations";
	public static final String PAGE_PROPERTIES_MOTOR_APPLICATION_SUMMARY = "motor.application-summary";
	public static final String PAGE_PROPERTIES_MOTOR_CONFIRMATION = "motor.confirmation";
	public static final String PAGE_PROPERTIES_MOTOR_DOCUMENT_UPLOAD = "motor.document-upload";
	public static final String PAGE_PROPERTIES_MOTOR_DOCUMENT_UPLOAD_CONFIRMATION= "motor.document-upload-confirmation";
	public static final String PAGE_PROPERTIES_MOTOR_DOCUMENT_UPLOAD_LATER = "motor.document-upload-later";
	public static final String PAGE_PROPERTIES_MOTOR_DOCUMENT_UPLOAD_LATER_CONFIRMATION = "motor.document-upload-later-confirmation";
	public static final String PAGE_PROPERTIES_MOTOR_DOCUMENT_UPLOAD_LATER_CHECK = "motor.start-upload-later-check";
	
	
	/*API For easy health*/
	public static final String GET_EASYHEALTH_PREMIUM = SERVICE_URL + "/premium/rophi";

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

	public static final String GET_VULNERABLE_BY_POLICYNO = "/policies/vc";

	public static final String SAVE_VULNERBALE_CUSTOMER_CONTACT_TIME = "/policies/vc/contactTime";
	
	/*API For Hkid Discount*/ 
	public static final String GET_SAVIE_HKID_DISCOUNT = SERVICE_URL + "/premium/savie/hkid/discount/all";
	public static final String GET_SAVIE_HKID_DISCOUNT_BY_HKID_PLAN = SERVICE_URL + "/premium/savie/hkid/discount";
	
	/*API For Referal Discount*/ 
	public static final String GET_SAVIE_REFERRAL_DISCOUNT = SERVICE_URL + "/premium/savie/referral/discount";
	
	/*API For (iMotor)*/
	public static final String MOTOR_CARE_CARMAKE_LIST_GET = SERVICE_URL + "/iMotor/list/carMakes";
	public static final String MOTOR_CARE_OCCUPATIONS_GET = SERVICE_URL + "/iMotor/list/occupations";
	public static final String MOTOR_CARE_CODE_TABLE_GET = SERVICE_URL + "/iMotor/list/codeTable/{type}";
	
	public static final String MOTOR_CARE_CARDETAILS_BY_MAKE_GET = SERVICE_URL + "/iMotor/carDetails/{makeCode}";
	public static final String MOTOR_CARE_CARDETAILS_SUPPLEMENT_GET = SERVICE_URL + "/iMotor/carDetails/{makeCode}/{carModel}/supplement";
	public static final String MOTOR_CARE_CARDETAILS_SUPPLEMENT_SECOND_GET = SERVICE_URL + "/iMotor/carDetails/supplement";
	
    public static final String MOTOR_CARE_CONTACT_ME_POST = SERVICE_URL + "/iMotor/contactMe";
    public static final String MOTOR_CARE_CONTACT_US_POST = SERVICE_URL + "/member/cs/contact/motor";
    
	public static final String MOTOR_CARE_GET_QUOTE_POST = SERVICE_URL + "/iMotor/quote";
	public static final String MOTOR_CARE_SAVE_QUOTE_POST = SERVICE_URL + "/iMotor/quote/saving";
	public static final String MOTOR_CARE_SAVE_FOR_LATER_QUOTE_POST = SERVICE_URL + "/iMotor/quote/save4Later";
	public static final String MOTOR_CARE_SAVE_POLICY_POST = SERVICE_URL + "/iMotor/policy/saving/{stepNo}";    	
	public static final String MOTOR_CARE_FILE_UPLOAD_POST = SERVICE_URL + "/iMotor/policy/fileUpload";
	public static final String MOTOR_CARE_FILE_UPLOAD_LATER_POST = SERVICE_URL + "/iMotor/policy/fileUploadLater";
	public static final String MOTOR_CARE_FILE_UPLOAD_CHECK_GET = SERVICE_URL + "/iMotor/policy/fileUpload/check/{type}";
	public static final String MOTOR_CARE_PAYMENT_FINALIZE_POST = SERVICE_URL + "/iMotor/policy/finalize";
	public static final String MOTOR_CARE_PAYMENT_POST = SERVICE_URL + "/iMotor/policy/payment";
	public static final String MOTOR_CARE_PAYMENT_FAILED_POST = SERVICE_URL + "/iMotor/policy/payment/summary";
	public static final String MOTOR_CARE_PAYMENT_RESULT_GET = SERVICE_URL + "/iMotor/policy/payment/result";
	public static final String MOTOR_CARE_SAVE_FOR_LATER_POST = SERVICE_URL + "/iMotor/policy/save4Later/{stepNo}";
	public static final String MOTOR_CARE_SAVE_FOR_LATER_RESUME_POST = SERVICE_URL + "/iMotor/policy/save4Later/resume";

	/*API For (Online Withdrawal)*/
	public static final String ONLINE_WITHDRAWAL_POLICY_BY_CUST = SERVICE_URL+"/withdrawal/getPolicyInfoByCustomer"; 
	public static final String ONLINE_WITHDRAWAL_POLICY_BY_POLICY =SERVICE_URL+"/withdrawal/getPolicyInfoByPolicy"; 
	public static final String ONLINE_WITHDRAWAL_SEND_TNG_OTP =SERVICE_URL+"/withdrawal/sendTngOTP";
	public static final String ONLINE_WITHDRAWAL_AUTH_TNG_OTP =SERVICE_URL+"/withdrawal/authTngOTP";
	public static final String ONLINE_WITHDRAWAL_SAVE_LINKUP =SERVICE_URL+"/withdrawal/saveTngLinkup";
	public static final String ONLINE_WITHDRAWAL_REQUEST_WITHDRAWAL =SERVICE_URL+ "/withdrawal/requestTngWithdrawal";
	public static final String ONLINE_WITHDRAWAL_PERFORM_WITHDRAWAL =SERVICE_URL+ "/withdrawal/performTngWithdrawal";
	public static final String ONLINE_WITHDRAWAL_TNG_TRANS_HISTORY =SERVICE_URL+ "/withdrawal/getTngTransactionHistory";
	public static final String ONLINE_WITHDRAWAL_TNG_UNLINK_POLICY =SERVICE_URL+ "/withdrawal/unlinkTngPolicy";
	public static final String ONLINE_WITHDRAWAL_SEARCH_PHW_POLICY =SERVICE_URL+ "/withdrawal/searchPhwPolicy";
	public static final String ONLINE_WITHDRAWAL_PHW_POLICY_UI_CATEGORY =SERVICE_URL+ "/option/itemDesc";
	public static final String ONLINE_WITHDRAWAL_PHW_POLICY_UI_NAME =SERVICE_URL+ "/option/itemDesc";
	public static final String ONLINE_WITHDRAWAL_PHW_POLICY_LIFE_ACTIVE =SERVICE_URL+ "/option/itemDesc";
	
	/*API For medical guardian*/
	public static final String GET_MEDICAL_GUARDIAN_PREMIUM = SERVICE_URL + "/premium/cansurance";
	
	public static final String CRS_STATUS = SERVICE_URL + "/crs/status";
	
	static String controller;

	public static boolean isContentEditable() {
		return ((ConfigBean)obj).getIsContentEditable();
	}

	public static boolean isSwaggerUiEnable() {
		return ((ConfigBean)obj).getIsSwaggerUiEnable();
	}
	
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
		//Object obj;
		String value = "";
		if(!StringUtils.isEmpty(key)) {
			try {
				if(obj == null){
					obj = SpringUtil.getObject("configBean");
				}
				
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
    
    public static String getWebsite(HttpServletRequest request)
    {
    	String url = request.getScheme() //当前链接使用的协议
			    +"://" + request.getServerName()//服务器地址 
			    + ":" + request.getServerPort() //端口号 
			    + request.getContextPath()+"/"; //应用名称，如果应用名称为
			    //+ request.getServletPath() //请求的相对url 
			    //+ "?" + request.getQueryString(); //请求参数
    	return url;
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
