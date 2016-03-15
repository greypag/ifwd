package com.ifwd.fwdhk.util;

import java.io.InputStream;
import java.util.Properties;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class JsonUtils {

	private static String REPLACE_KEY;
	private static final String RE_CHAR = "*";
	
	public static final String checkJsonObjNull(JSONObject obj, String checkByStr) {
		if (obj.get(checkByStr) != null) {
			return obj.get(checkByStr).toString();
		} else {
			return "";
		}
	}
	
	@SuppressWarnings("unchecked")
	public static final boolean hasEmpty(JSONObject obj) {
		Set<Object> keys = obj.keySet();
		for(Object key : keys){
			if(obj.get(key) == null) {
				return Boolean.TRUE;
			}else if(obj.get(key) instanceof JSONObject || obj.get(key) instanceof JSONArray) {
				if(obj.get(key) == null) {
					return Boolean.TRUE;
				}
			}else if (obj.get(key) instanceof String) {
				if(StringUtils.isEmpty(obj.get(key).toString())) {
					return Boolean.TRUE;
				}
			}
		}
		return Boolean.FALSE;
	}
	
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
		JSONObject reObj = new JSONObject();
		Set<Object> keys = obj.keySet();
		for(Object key : keys){
			if(obj.get(key) instanceof JSONObject) {
				JSONObject newobj = jsonPrint((JSONObject)obj.get(key), (String)key);
				reObj.put(key, newobj);
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
				reObj.put(key, newarr);
			}else if (obj.get(key) instanceof String) {
				String newKey;
				if(name != null) {
					newKey = new StringBuffer(name).append(".").append(key).toString();
				}else {
					newKey = (String)key;
				}
				if(REPLACE_KEY.contains(newKey) && !"".equals(obj.get(key).toString())){
					reObj.put(key, replaceByStar(obj.get(key).toString()));
				}else {
					reObj.put(key, obj.get(key));
				}
			}else {
				reObj.put(key, obj.get(key));
			}
		}
		return reObj;
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
	
	private static String getKeys() {

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
