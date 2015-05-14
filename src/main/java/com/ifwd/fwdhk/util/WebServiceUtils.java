package com.ifwd.fwdhk.util;

import java.io.InputStream;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;






import com.ifwd.fwdhk.model.DistrictBean;
import com.ifwd.fwdhk.model.LocaleKeyEnum;

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
	

	public static String[] getInsuredRelationshipDesc(String[] relationships, String language, String relationshipCode, int idx) {
		
		relationships[idx] = getInsuredRelationshipDesc(relationshipCode, language);//getAgeRangeName(relationships[i], language);
		return relationships;
	}
	public static String getInsuredRelationshipDesc(String relationship, String language) {
		// TODO, check against DB
	
		String desc = "";
		if (language.toUpperCase().equals("EN")) {
			if (relationship.equals("BR"))
				desc = "Brother";
			else if (relationship.equals("CH"))
				desc = "Child";
			else if (relationship.equals("PA"))
				desc = "Parent";
			else if (relationship.equals("SI"))
				desc = "Sister";
			else if (relationship.equals("SP"))
				desc = "Spouse";
			else if (relationship.equals("EE"))
				desc = "Employee";			
			else if (relationship.equals("FE"))
				desc = "Friend";
			else if (relationship.equals("OT"))
				desc = "Others";	
			else if (relationship.equals("RE"))
				desc = "Relative";	
			
			else if (relationship.equals("ST"))
				desc = "Student";				
			else
				desc = relationship;
		} else {
			if (relationship.equals("BR"))
				desc = "兄弟";
			else if (relationship.equals("CH"))
				desc = "子女";
			else if (relationship.equals("PA"))
				desc = "父母";
			else if (relationship.equals("SI"))
				desc = "姊妹";
			else if (relationship.equals("SP"))
				desc = "配偶";
			else if (relationship.equals("EE"))
				desc = "員工";
			else if (relationship.equals("FE"))
				desc = "朋友";
			else if (relationship.equals("OT"))
				desc = "其他";
			else if (relationship.equals("RE"))
				desc = "親友";	
			else if (relationship.equals("SE"))
				desc = "我自己";	
			else if (relationship.equals("ST"))
				desc = "學生";		
			else
				desc = relationship;
		}
			
		return desc;
	}	
	public static String[] getBeneRelationshipDesc(String[] relationships, String language, String relationshipCode, int idx) {
		
		relationships[idx] = getBeneRelationshipDesc(relationshipCode, language);//getAgeRangeName(relationships[i], language);
		return relationships;
	}	
	public static String getBeneRelationshipDesc(String relationship, String language) {
		// TODO, check against DB

		String desc = "";
		if (language.toUpperCase().equals("EN")) {
			if (relationship.equals("BR"))
				desc = "Brother";
			else if (relationship.equals("CH"))
				desc = "Child";
			else if (relationship.equals("PA"))
				desc = "Parent";
			else if (relationship.equals("SI"))
				desc = "Sister";
			else if (relationship.equals("SP"))
				desc = "Spouse";
			else if (relationship.equals("FM"))
				desc = "Fiance";
			else if (relationship.equals("FF"))
				desc = "Fiancee";
			else if (relationship.equals("GP"))
				desc = "Grand Parent";
			else if (relationship.equals("GR"))
				desc = "Grand Child";
			else if (relationship.equals("SE"))
				desc = "Own Estate";				
			else
				desc = relationship;
		} else {
			if (relationship.equals("BR"))
				desc = "兄弟";
			else if (relationship.equals("CH"))
				desc = "子女";
			else if (relationship.equals("PA"))
				desc = "父母";
			else if (relationship.equals("SI"))
				desc = "姊妹";
			else if (relationship.equals("SP"))
				desc = "配偶";
			else if (relationship.equals("FM"))
				desc = "未婚夫";			
			else if (relationship.equals("GP"))
				desc = "祖父母";
			else if (relationship.equals("GR"))
				desc = "孫兒";
			else if (relationship.equals("SE"))
				desc = "個人遺產";			
			else if (relationship.equals("FM"))
				desc = "未婚妻";
			else if (relationship.equals("FF"))
				desc = "未婚夫";
			else
				desc = relationship;
		}
			
		return desc;
	}	
	
	public static String getNetFloorAreaDesc(Map<String, String> netFloorAreas, String netFloorArea) {
		String desc = "";
		
		if(netFloorArea == null || netFloorArea.isEmpty()){
			desc= "";
		}else{
			if(netFloorAreas != null){
				for (Map.Entry<String, String> entry : netFloorAreas.entrySet()){
					if(entry.getKey().equalsIgnoreCase(netFloorArea)){
						desc = entry.getValue();
						break;
					}
				}
			}
		}
		
		return desc;
	}
	public static String getDistrictDesc(List<DistrictBean> districts, String district){
		String desc = "";
		
		if(district == null || district.isEmpty()){
			desc= "";
		}else{
			if(districts != null){
				for (DistrictBean entry : districts){
					if(entry.getCode().equalsIgnoreCase(district)){
						desc = entry.getDescription();
						break;
					}
				}
			}
		}
		
		return desc;
	}
	public static String getAreaDesc(Map<String, String>areas, String area){
		String desc = "";
		
		if(area == null || area.isEmpty()){
			desc= "";
		}else{
			if(areas != null){
				for (Map.Entry<String, String> entry : areas.entrySet()){
					if(entry.getKey().equalsIgnoreCase(area)){
						desc = entry.getValue();
						break;
					}
				}
			}
		}
		
		return desc;
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
		if (language.toUpperCase().equals("EN")) {
			if (ageRange.equals("1"))
				ageRangeName = "6 weeks to 17 years old";
			else if (ageRange.equals("2"))
				ageRangeName = "18 - 70 years old";
			else
				ageRangeName = "71 - 85 years old";
		} else {
			if (ageRange.equals("1"))
				ageRangeName = "6週至17歲";
			else if (ageRange.equals("2"))
				ageRangeName = "18至70歲";
			else
				ageRangeName = "71至85歲";
		}
			
		return ageRangeName;
	}
	
	public static Locale getRequestLocale(String language) {
		Locale locale = new Locale(LocaleKeyEnum.EN_US.getValue());
		if (language.equalsIgnoreCase("ZH"))
			return Locale.TAIWAN;
		else
			return Locale.US;
	}
	
	public static String getPageTitle(String key, String language) {
		
		
        try {
            Properties propEn = new Properties();
        
            InputStream stream = null;
            ClassLoader loader = Thread.currentThread().getContextClassLoader();  
            if (language.toUpperCase().equals("EN"))
            	 stream = loader.getResourceAsStream("page_en_US.properties");
            else
            	stream = loader.getResourceAsStream("page_zh_TW.properties");
            propEn.load(stream);
            return  (String)propEn.get(key);
            
            
        } catch (Exception e) {
        	e.printStackTrace();
        	return "";
        }
	}

}
