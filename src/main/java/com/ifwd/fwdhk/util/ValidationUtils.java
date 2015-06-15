package com.ifwd.fwdhk.util;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.http.HttpMethod;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.api.controller.RestServiceImpl;

/**
 * The Class ValidationErrorUtils which contains various methods pertaining to
 * processing validation errors
 */
public class ValidationUtils {

	private static final String GOOGLE_RECAPTCHA_URL = "https://www.google.com/recaptcha/api/siteverify";
	private static final String GOOGLE_RECAPTCHA_SECRET = "6LfP6QcTAAAAADVmbS_GmDIce0jSoBool0UhJBCI";

    // both are null return true
    public static boolean stringCompareToIgnoreCase(String str1, String str2){
        boolean rtn = false;
                
        if(str1 == null && str2 == null) {
            rtn = true;
        } else if (str1 == null && str2 != null) {
            rtn = false;
        } else if (str1 != null && str2 == null) {
            rtn = false;
        } else {
            if(str1.compareToIgnoreCase(str2) == 0) {
                rtn = true;
            } else {
                rtn = false;
            }
        }
                           
        return rtn;
    }

    public static String getRelationshipById(String idA1, String idA2){
        String relationship = "";
                
        if(stringCompareToIgnoreCase(idA1, idA2)){
            relationship = "SE";    // self
        }else{
            relationship = "RF";    // relation or friend 
        }
                
        return relationship;
    }	

    
    public static boolean verifyGoogleRecaptcha(String recaptchaValue) {
		JSONObject parameters = new JSONObject();
		parameters.put("secret", GOOGLE_RECAPTCHA_SECRET);
		parameters.put("response", recaptchaValue);
		
		String requestUrl = GOOGLE_RECAPTCHA_URL+"?secret="+GOOGLE_RECAPTCHA_SECRET+"&response="+recaptchaValue;
		RestServiceDao restService = new RestServiceImpl();
		JSONObject responseObj = restService.consumeApi(HttpMethod.GET,
				requestUrl, null, null);
		return "true".equals(responseObj.get("success").toString());
	}

}