package com.ifwd.fwdhk.util;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.ifwd.fwdhk.model.DistrictBean;

public class WebServiceUtils {
	public static String transformLanaguage(String language) {
		if (language.equals("CN"))
			return "ZH";
		else
			return "EN";
	}

	public static String getParameterValue(String key, HttpSession session,
			HttpServletRequest request) {

		if (request.getParameter(key) == null) {
			return (String) session.getAttribute(key);
		} else {
			session.setAttribute(key, request.getParameter(key));
			return request.getParameter(key);
		}
	}

	public static String getDistrictNameFromMap(
			List<DistrictBean> districtList, String districtCode) {
		Iterator<DistrictBean> iterator = districtList.iterator();
		String name = "";
		while (iterator.hasNext()) {
			DistrictBean districtBean = iterator.next();
			if (districtBean.getCode() == districtCode) {
				name = districtBean.getDescription();
				break;
			}
		}
		return name;
	}

	public static String getNameFromMap(Map<String, String> map,
			String key) {
		String name = "";
		for (Map.Entry<String, String> entry : map.entrySet()) {
			if (entry.getKey() == key) {
				name = entry.getValue();
				break;
			}			
		}
		return name;
	}
	
	

	public static String[] getAgeRangeNames(String[] ageRanges, String language) {
		
		int size = ageRanges.length;
		String[] name = new String[size];
		for (int i=0; i< size; i++)
			name[i] = getAgeRangeName(ageRanges[i], language);
		return name;
	}

	private static String getAgeRangeName(String ageRange, String language) {
		String ageRangeName = "";
		if (language.equals("EN")) {
			if (ageRange.equals("1"))
				ageRangeName = "6 weeks to 17 years old";
			else if (ageRange.equals("2"))
				ageRangeName = "18 - 70 years old";
			else
				ageRangeName = "71 - 85 years old";
		} else {
			if (ageRange.equals("1"))
				ageRangeName = "6 weeks to 17 years old";
			else if (ageRange.equals("2"))
				ageRangeName = "18 - 70 years old";
			else
				ageRangeName = "71 - 85 years old";
		}
			
		return ageRangeName;
	}

}
