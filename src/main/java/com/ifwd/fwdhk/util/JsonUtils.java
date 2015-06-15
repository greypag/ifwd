package com.ifwd.fwdhk.util;

import java.io.InputStream;
import java.util.Properties;
import java.util.Set;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class JsonUtils {

	private static String REPLACE_KEY; //= "room,floor,block,applicant.name,applicant.dob,applicant.hkId,applicant.passport,applicant.email,applicant.mobile,creditCardNo,expiryDate,insured.name,insured.hkKid,insured.passport,beneficiary.name,beneficiary.hkId,beneficiary.passport,password,oldPassword,newPassword";
	private static final String RE_CHAR = "*";
	
	public static final JSONObject jsonPrint(JSONObject obj){
		return obj == null ? null : jsonPrint(obj, null);
	}
	
	@SuppressWarnings("unchecked")
	public static final JSONArray jsonPrint(JSONArray arr){
		
		if(arr != null){
			JSONArray newarr = new JSONArray();
			for(Object entity : arr) {
				if(entity instanceof JSONObject) {
					JSONObject newobj = jsonPrint((JSONObject)entity, null);
					newarr.add(newobj);
				}else {
					newarr.add(entity);
				}
			}
			return newarr;
		}else {
			return arr;
		}
		
	}
	
	@SuppressWarnings("unchecked")
	private static JSONObject jsonPrint(JSONObject obj, String name){
		if(REPLACE_KEY == null) {
			REPLACE_KEY = getKeys();
		}
		Set<Object> keys = obj.keySet();
		for(Object key : keys){
			if(obj.get(key) instanceof JSONObject) {
				JSONObject newobj = jsonPrint((JSONObject)obj.get(key), (String)key);
				obj.replace(key, newobj);
			}else if (obj.get(key) instanceof JSONArray){
				JSONArray arr = (JSONArray)obj.get(key);
				JSONArray newarr = new JSONArray();
				
				for(Object entity : arr) {
					if(entity instanceof JSONObject) {
						JSONObject newobj = jsonPrint((JSONObject)entity, (String)key);
						newarr.add(newobj);
					}else {
						newarr.add(entity);
					}
				}
				obj.replace(key, newarr);
			}else if (obj.get(key) instanceof String) {
				String newKey;
				if(name != null) {
					newKey = new StringBuffer(name).append(".").append(key).toString();
				}else {
					newKey = (String)key;
				}
				if(REPLACE_KEY.contains(newKey) && !"".equals(obj.get(key).toString())){
					obj.replace(key, replaceByStar(obj.get(key).toString()));
				}
			}
		}
		return obj;
	}
	
	private static String replaceByStar(String str) {
		int length = str.length();
		String oldChar = length <=3 ? str.substring(length / 3, length - length / 3) : str.substring(length / 4, length - length / 4);
		String newChar = "";
		for(int i = 0; oldChar.length() > i; i++) {
			newChar += RE_CHAR;
		}
		return str.replace(oldChar, newChar);
	}
	
	public static String getKeys() {

		try {
			Properties propEn = new Properties();
			InputStream stream = null;
			ClassLoader loader = Thread.currentThread().getContextClassLoader();
			stream = loader.getResourceAsStream("replace.properties");
			propEn.load(stream);
			return (String)propEn.get("keys");

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
