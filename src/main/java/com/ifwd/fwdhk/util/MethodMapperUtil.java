package com.ifwd.fwdhk.util;
public class MethodMapperUtil {

	public static String fetchGetterMethodName(String property) {
		String[] s = property.split(" ");
		String retVal = "";
		for (String str : s) {
			if (isLowerCase(str.charAt(0))) {
				if (isLowerCase(str.charAt(1))) {
					// case loI -> getLoI
					retVal += toUpper(str.charAt(0)) + str.substring(1);
				} else {
					// case lO -> getlO
					retVal += str;
				}
			} else {
				// case Lo -> getLo
				retVal += str;
			}
		}
		return "get" + retVal;
	}

	private static String toUpper(char charAt) {
		return "" + (char) (charAt + 'A' - 'a');
	}

	private static boolean isLowerCase(char ch) {
		return ch <= 'z' && 'a' <= ch;
	}
}
