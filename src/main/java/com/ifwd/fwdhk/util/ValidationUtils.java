package com.ifwd.fwdhk.util;

import java.math.BigInteger;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ifwd.fwdhk.exception.ValidationExceptions;

/**
 * The Class ValidationErrorUtils which contains various methods pertaining to
 * processing validation errors
 */
public class ValidationUtils {

	private static final String GOOGLE_RECAPTCHA_URL = "https://www.google.com/recaptcha/api/siteverify";
	private static final String GOOGLE_RECAPTCHA_SECRET = "6LfP6QcTAAAAADVmbS_GmDIce0jSoBool0UhJBCI";
	private static final Logger logger = LoggerFactory.getLogger(ValidationUtils.class);
	
	public static boolean validation(String name,String value,HttpServletRequest request) throws ValidationExceptions{
		if(StringUtils.isEmpty(name)){
			throw new ValidationExceptions(ErrorMessageUtils.getMessage("error.request", request));
		}
		if("HKID".equals(name.toUpperCase())){
			if (!isHkid(value))throw new ValidationExceptions(ErrorMessageUtils.getMessage("HKID","validation.failure", request));
		}else if("EMAIL".equals(name.toUpperCase())){
			if (!isEmail(value))throw new ValidationExceptions(ErrorMessageUtils.getMessage("EMAIL","validation.failure", request));
		}else if("USERNAME".equals(name.toUpperCase())){
			if (!isValidUserName(value))throw new ValidationExceptions(ErrorMessageUtils.getMessage("USERNAME","validation.failure", request));
		}else if("NAME".equals(name.toUpperCase())){
			if (!isValidName(value))throw new ValidationExceptions(ErrorMessageUtils.getMessage("NAME","validation.failure", request));
		}else if("MOBILE".equals(name.toUpperCase())){
			if (!isMobile(value))throw new ValidationExceptions(ErrorMessageUtils.getMessage("MOBILE","validation.failure", request));
		}else if("PASSPORT".equals(name.toUpperCase())){
			if (!isPassport(value))throw new ValidationExceptions(ErrorMessageUtils.getMessage("PASSPORT","validation.failure", request));
		}
		else if("INSUREDAMOUNT".equals(name.toUpperCase())){
			if(value == null || "".equals(value) || !isPureIntegrer(value)){
				throw new ValidationExceptions(ErrorMessageUtils.getMessage("INSUREDAMOUNT","validation.failure", request));
			}
		}
		else if("DOB".equals(name.toUpperCase())){
			if(value == null || "".equals(value) || !isValidDate(value)){
				throw new ValidationExceptions(ErrorMessageUtils.getMessage("DOB","validation.failure", request));
			}
		}
		else if("PROMOCODE".equals(name.toUpperCase())){
			if(value != null && !isPureIntegrer(value)){
				throw new ValidationExceptions(ErrorMessageUtils.getMessage("PROMOCODE","validation.failure", request));
			}
		}
		return true;
	}
	
	public static boolean isInteger(String str) {
		try{
			Integer.valueOf(str);
			return true;
		}catch(Exception e){
			return false;
		}
	}
	
	public static boolean isBigInteger(String str) {
		try{
			new BigInteger(str);
			return true;
		}catch(Exception e){
			return false;
		}
	}
	
	public static boolean isValidDate(String str) {
		DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
		try{
			Date date = (Date)formatter.parse(str);
			return str.equals(formatter.format(date));
		}catch(Exception e){
			return false;
		}
	}
	
	public static boolean isNullOrEmpty(String text){
		if(text != null && !text.isEmpty()) {
			return false;
		}
		else {
			return true;
		}
			
	}
	
	public static boolean isValidUserName(String text) {
		Pattern pattern;
		Matcher matcher;
		//final String USERNAME_PATTERN =  "^[a-zA-Z0-9]*$";
		final String USERNAME_PATTERN = "[a-zA-Z0-9@.-]+";
		pattern = Pattern.compile(USERNAME_PATTERN);
		matcher = pattern.matcher(text);
		return matcher.matches();
	}
	
	public static boolean isValidName(String text) {
		Pattern pattern;
		Matcher matcher;
		//final String USERNAME_PATTERN =  "^[a-zA-Z0-9]*$";
		final String NAME_PATTERN = "[a-zA-Z0-9@.-\\ ]+";
		pattern = Pattern.compile(NAME_PATTERN);
		matcher = pattern.matcher(text);
		return matcher.matches();
		
		
	}
	
	
	
	public static boolean isPureIntegrer(String text) {
		try {
			int foo = Integer.parseInt(text);
			return true;
		} catch (Exception e) {
			return false;
		}
		
	
		
		
	}
	
	
	public static boolean isAlphanumeric(String text){
		return StringUtils.isAlphanumeric(text);			
	}
	
	public static boolean isBetweenRange(int min, int max, String text){
		if (text.length() >= min && text.length() <= max){
			return true;
		}
		else {
			return false;
		}
	}
	
	public static boolean isValueBetweenRange(int min, int max, int value){
		if (value >= min && value <= max){
			return true;
		} else {
			return false;
		}
	}
	
	public static boolean isMin(int min, String text){
		if (text.length() >= min){
			return true;
		}
		else {
			return false;
		}
	}
	
	public static boolean isMax(int max, String text){
		if (text.length() <= max){
			return true;
		} else {
			return false;
		}
	}
	
	public static boolean isMatch(String text1, String text2){
		if (text1.equals(text2)) {
			return true;
		} else {
			return false;
		}
			
	}
	
	public static boolean isEitherExist(String text1, String text2){
		if (isNullOrEmpty(text1) && isNullOrEmpty(text2))
			return false;
		else
			return true;
		
	}
	
	public static boolean  isHkid(String hkid){
		
		String strValidChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		
		// basic check length
		if(hkid == null || hkid == "" || hkid.length() < 8 ){
			return false;
		}
		
		// handling bracket
		if (hkid.charAt(hkid.length()-3) == '(' && hkid.charAt(hkid.length()-1) == ')')
			hkid = hkid.substring(0, hkid.length() - 3) + hkid.charAt(hkid.length() -2);
		
		// convert to upper case
		hkid = hkid.toUpperCase();

		String hkidCharPart;
		String hkidNumPart;
		String hkidCheckDigit;
		String charPart = "";
		String numPart = "";
		String checkDigit = "";
		
		if(hkid.length() == 8){
			hkidCharPart = hkid.substring(0, 1);
			hkidNumPart = hkid.substring(1, 7);
			hkidCheckDigit = hkid.substring(7);
		
			// the character part, numeric part and check digit part
			charPart = Pattern.matches("[A-Z]", hkidCharPart) ? hkidCharPart : "" ;
			numPart = Pattern.matches("[0-9]{6}", hkidNumPart) ? hkidNumPart : "" ;
			checkDigit = Pattern.matches("[A0-9]", hkidCheckDigit) ? hkidCheckDigit : "" ;
		}
		else if(hkid.length() == 9){
			hkidCharPart = hkid.substring(0, 2);
			hkidNumPart = hkid.substring(2, 8);
			hkidCheckDigit = hkid.substring(8);
		
			// the character part, numeric part and check digit part
			charPart = Pattern.matches("[A-Z]{2}", hkidCharPart) ? hkidCharPart : "" ;
			numPart = Pattern.matches("[0-9]{6}", hkidNumPart) ? hkidNumPart : "" ;
			checkDigit = Pattern.matches("[A0-9]", hkidCheckDigit) ? hkidCheckDigit : "" ;			
		}		
//		logger.error("charPart = " + charPart);
//		logger.error("numPart = " + numPart);
//		logger.error("checkDigit = " + checkDigit);
		
		if(charPart == "" || numPart == "" || checkDigit == "")
			return false;
				
      	// calculate the checksum for character part
		int checkSum = 0;
      	if (charPart.length() == 2) {
      		checkSum += 9 * (10 + strValidChars.indexOf(charPart.charAt(0)));
      		checkSum += 8 * (10 + strValidChars.indexOf(charPart.charAt(1)));
      	} else {
      		checkSum += 9 * 36;
      		checkSum += 8 * (10 + strValidChars.indexOf(charPart));
      	}      	
      	
      	// calculate the checksum for numeric part
      	for (int i = 0, j = 7; i < numPart.length(); i++, j--)
      		checkSum += j * Integer.parseInt(String.valueOf(numPart.charAt(i)));
		
      	// verify the check digit
      	int remaining = checkSum % 11;
      	Integer verify = remaining == 0 ? 0 : 11 - remaining;
      	
      	//logger.error("verify = " + verify + ", checkDigit = " + checkDigit);
      	
      	return ((verify.toString().compareTo(checkDigit) == 0) || (verify == 10 && checkDigit.compareTo("A") == 0 ));
      				
	}	
	
	
	public static boolean isPassport(String passport){
		if (StringUtils.isAlphanumeric(passport) && (passport.length() >= 5 && passport.length() <=15))
			return true;
		else
			return false;
		
	}
	
	public static boolean isEmail(String text){
		Pattern pattern;
		Matcher matcher;
		final String EMAIL_PATTERN = 
			"^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
			+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
	 
		pattern = Pattern.compile(EMAIL_PATTERN);
		matcher = pattern.matcher(text);
		return matcher.matches();
		
	}
	
	public static boolean isMobile(String text){
		Pattern pattern;
		Matcher matcher;
		final String MOBILE_PATTERN = "[235689][0-9]{7}";
		pattern = Pattern.compile(MOBILE_PATTERN);
		matcher = pattern.matcher(text);
		return matcher.matches();
		
	}
	
	

	
	public static boolean isValidExpiryDate(String expiryDate){
		if (expiryDate.length() != 6) {
			return false;
		}
		Calendar now = Calendar.getInstance();
		int thisYear = now.get(Calendar.YEAR);
		int thisMonth = now.get(Calendar.MONTH);
		
		String month = expiryDate.substring(0, 1);
		String year = expiryDate.substring(2, 5);
		int expiryMonth = Integer.parseInt(month);
		int expiryYear = Integer.parseInt(year);
		
		if (expiryYear < thisYear) 
			return false;
		else {
			if (expiryMonth < thisMonth) {
				return false;
			} else {
				return true;
			}
			
		}
		
	}	

	
	


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
//		JSONObject parameters = new JSONObject();
//		parameters.put("secret", GOOGLE_RECAPTCHA_SECRET);
//		parameters.put("response", recaptchaValue);
//		String requestUrl = GOOGLE_RECAPTCHA_URL+"?secret="+GOOGLE_RECAPTCHA_SECRET+"&response="+recaptchaValue;
//		RestServiceDao restService = new RestServiceImpl();
//		JSONObject responseObj = restService.consumeApi(HttpMethod.GET,
//				requestUrl, null, null);
//		return "true".equals(responseObj.get("success").toString());
    	return recaptchaValue!=null && recaptchaValue.length()>0;
	}

}