package com.ifwd.fwdhk.util;



import org.springframework.http.HttpStatus;

/**
 * A Utility to read the messages from the Locale Specific Resource Bundle. 
 * As of now this utility has two resource bundles registered with it.
 * 
 * <ul>
 * <li>messages</li>
 * <li>messages_ui</li>
 * </ul>
 */
public class MessageCodeUtil {

	/* --- Message Sources --- */

	public HttpStatus errorMsgMapping(String methodName,String errMsg){
		
		int statusCode=0;
		
		if(methodName.equals("sendTngOtpSms")){
			switch (errMsg) {

			case "Invalid Policy":
				statusCode=455;	
				break;
				
			case "Linkup function has been temporarily suspended":
				statusCode=456;	
				break;
				
			case "Invalid customer mobile number for receive OTP via SMS":
				statusCode=457;	
				break;
				
			case "Exceed the number of re-send OTP":
				statusCode=458;	
				break;
				
			default:
				statusCode=500;	
			}	
		}
		
		if(methodName.equals("authTngOtp")){
			switch (errMsg) {

			case "Invalid Policy":
				statusCode=455;	
				break;
				
			case "Linkup function has been temporarily suspended":
				statusCode=456;	
				break;
				
			case "OTP not match":
				statusCode=457;	
				break;
				
			case "OTP expired":
				statusCode=458;	
				break;
				
			case "OTP is already authentic":
				statusCode=459;	
				break;

			default:
				statusCode=500;	
			}	
		}
		
		if(methodName.equals("requestTngPolicyWithdraw")){
			switch (errMsg) {

			case "Invalid Policy":
				statusCode=455;	
				break;
				
			case "Linkup function has been temporarily suspended":
				statusCode=456;	
				break;
				
			case "Invalid customer mobile number for receive OTP via SMS":
				statusCode=457;	
				break;
				
			case "Exceed the number of re-send OTP":
				statusCode=458;	
				break;
				
			case "Invalid Withdrawal":
				statusCode=459;	
				break;

			default:
				statusCode=500;	
			}	
		}
		
		if(methodName.equals("performTngPolicyWithdraw")){
			switch (errMsg) {

			case "Invalid Policy":
				statusCode=455;	
				break;
				
			case "Linkup function has been temporarily suspended":
				statusCode=456;	
				break;
				
			case "OTP not match":
				statusCode=457;	
				break;
				
			case "OTP expired":
				statusCode=458;	
				break;
				
			case "OTP is already authentic":
				statusCode=459;	
				break;
				
			case "Tap n Go side cannot perform withdraw":
				statusCode=60;	
				break;
			default:
				statusCode=500;	
			}	
		}
		
		if(methodName.equals("performTngPolicyWithdraw")){
			switch (errMsg) {

			case "Invalid Policy":
				statusCode=455;	
				break;
				
			case "Linkup function has been temporarily suspended":
				statusCode=456;	
				break;
				
			case "OTP not match":
				statusCode=457;	
				break;
				
			case "OTP expired":
				statusCode=458;	
				break;
				
			case "OTP is already authentic":
				statusCode=459;	
				break;
				
			case "Tap n Go side cannot perform withdraw":
				statusCode=60;	
				break;
			default:
				statusCode=500;	
			}	
		}
		
		if(errMsg.equals("System error")){statusCode=500;}
		if(errMsg.equals("Invalid Input")){statusCode=400;}
		
		return HttpStatus.valueOf(statusCode);
	}
	
}
