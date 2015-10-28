package com.ifwd.fwdhk.util;

import java.util.Map;
import java.util.Random;

import org.apache.commons.lang.StringUtils;


/**
 * @author Andy
 * @ClassName PolicyNoUtil
 * @Date 2015年7月13日
 * 
 */
public class PolicyNoUtil {
	
	public static String getRandomString(){
		Random random=new Random();
		StringBuffer sb =new StringBuffer();
		for(int i = 0;i<6;i++){
			int rd = random.nextInt(36);
			if(rd<10){
				sb = sb.append(rd);
			}else{
				sb = sb.append((char)(rd+55));
			}
		}
		String str = sb.toString();
		return str;
	}

	private static final int[] BASE = { 2, 2, 3, 3, 5, 5, 7, 7, 11 };

	public static Integer outCheckDigit(String policyNo) {
		if (policyNo == null || policyNo.isEmpty() || !StringUtils.isNumeric(policyNo)) {
			return null;
		}
		int ocd = 0; // result
		int sum = 0;
		int parity = 0;
		int odd = 0;
		int even = 0;
		int base = 9;
		int no = 0;
		
		for (int i = 0; i < BASE.length; i++) {
			no = Integer.valueOf(policyNo.charAt(i) + "");
			sum += base-- * no;
			if (i % 2 == 0) {
				even += BASE[i] * no;
			} else {
				odd += BASE[i] * no;
			}
		}
		parity = Integer.valueOf(policyNo.substring(8));

		if (parity % 2 == 0) {
			ocd = (sum + even) % 10;
		} else {
			ocd = (sum + odd) % 10;
		}
		return ocd;
	}
}
