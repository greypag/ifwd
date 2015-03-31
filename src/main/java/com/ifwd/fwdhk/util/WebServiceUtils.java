package com.ifwd.fwdhk.util;

public class WebServiceUtils {
	public static String transformLanaguage(String language) {
		if (language.equals("CN"))
			return "ZH";
		else
			return "EN";
	}
}
