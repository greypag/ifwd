package com.ifwd.fwdhk.util;

import java.math.BigDecimal;
import java.text.DecimalFormat;

public class NumberFormatUtils {
	public static final String formatNumberTwo(String str){
		DecimalFormat format = new DecimalFormat("0.00");
	    String s = format.format(new BigDecimal(str));
	    return s;
	}
}
