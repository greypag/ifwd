package com.ifwd.fwdhk.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.util.StringUtils;

public class DateApi {
	
	public String pickDate(String pickDate){
		
		String getDate[] = pickDate.split(" ");
		String month = getDate[1];
		String m="00";
		
		switch (month)
		{
		
		
	    case "January" :
	    				m="01";
	                  break;

	    case "February" :
	    				m="02";
	                  break;

	    case "March" :
	    				m="03";
	                  break;

	    case "April" :
	    				m="04";
	                  break;

	    case "May" :
	    				m="05";
	                  break;

	    case "June" :
	    				m="06";
	                  break;

	    case "July" :
	    				m="07";
	                  break;

	    case "August" :
	    				m="08";
	                  break;
		

	    case "September" :
	    				m="09";
	                  break;
		

	    case "October" :
	    				m="10";
	                  break;
	    case "November" :
						m="11";
						break;
	    
	    case "December" :
						m="12";
						break;
	                
	       }
	
//		String formatedDate=getDate[0]+"/"+m+"/"+getDate[2];
		String formatedDate=getDate[2]+"-"+m+"-"+getDate[0];
		return formatedDate;
		
		}
	
	public static String pickDate1(String pickDate){
		String getDate[] = pickDate.split("-");
		String formatedDate=getDate[2]+"-"+getDate[1]+"-"+getDate[0];
		return formatedDate;
		
	}
	
	/**
	 * 将date日期格式为dd-MM-yyyy的字符串转化为Date
	 * @param date
	 * @return Date
	 */
	public static Date formatDate(String date){
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy", Locale.ENGLISH);
		try {
			return dateFormat.parse(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 将date日期格式为yyyy-MM-dd的字符串转化为Date
	 * @param date
	 * @return Date
	 */
	public static Date formatDate1(String date){
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
		try {
			return dateFormat.parse(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 将date转化为日期格式为dd-MM-yyyy的字符串
	 * @param date
	 * @return String
	 */
	public static String formatString(Date date) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy", Locale.ENGLISH);
		return dateFormat.format(date);
	}
	
	/**
	 * 将date转化为日期格式为yyyy-MM-dd的字符串
	 * @param date
	 * @return String
	 */
	public static String formatString1(Date date) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
		return dateFormat.format(date);
	}
	
	/**
	 * 判断date是否日期格式为dd-MM-yyyy的字符串
	 * @param date
	 * @return boolean
	 */
	public static boolean isValidDate(String date) {
		boolean convertSuccess=true;
		SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		try {
		   format.setLenient(false);
		   format.parse(date);
		} catch (ParseException e) {
		    convertSuccess=false;
		} 
		return convertSuccess;
	}
	
	/**
	 * 将date转化为日期格式为yyyy-MM-dd的字符串
	 * @param date
	 * @return String
	 */
	public static String formatString(String date){
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy", Locale.ENGLISH);
		SimpleDateFormat newDateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
		try {
			return newDateFormat.format(dateFormat.parse(date));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	/**
	 * 将time毫秒转换为日期格式为yyyy-MM-dd的字符串
	 * @param time
	 * @return String
	 */
	public static String formatTime(Long time) {
		if(!StringUtils.isEmpty(time)) {
			long t = Long.valueOf(time);
			DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
			Calendar calendar = Calendar.getInstance();
			calendar.setTimeInMillis(t);
			return formatter.format(calendar.getTime());
		}else {
			return "";
		}
	}
	
	/**
	 * 获取时间段list
	 * @param start 距离今天的天数
	 * @param days 总共多少天
	 * @return
	 */
	public static List<String> timeslot(int start, int days) {
		List<String> timeList = new ArrayList<String>();
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DAY_OF_MONTH, start);
		for(int i = 0; i < days - start; i++) {
			timeList.add(formatter.format(calendar.getTime()));
			calendar.add(Calendar.DAY_OF_MONTH, 1);
		}
		return timeList;
	}
}
