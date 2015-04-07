package com.ifwd.fwdhk.util;

public class StringHelper {
	// convert from UTF-8 -> internal Java String format
    public static String convertFromUTF8(String s) {
        String out = null;
        try {
            out = new String(s.getBytes("ISO-8859-1"), "UTF-8");
        } catch (java.io.UnsupportedEncodingException e) {
            return null;
        }
        return out;
    }
 
    // convert from internal Java String format -> UTF-8
    public static String convertToUTF8(String s) {
        String out = null;
        try {
            out = new String(s.getBytes("UTF-8"));
        } catch (java.io.UnsupportedEncodingException e) {
            return null;
        }
        return out;
    }
    
    public static String formatPrice(String price) {
		String formattedPrice = price + "0";
		return formattedPrice;
	}
    
    public static boolean isStringNullOrEmpty(String str) {
    	if(str != null && !str.isEmpty())
    		return false;
    	else
    		return true;
	}
 
   
}
