package com.ifwd.fwdhk.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpMethod;

import com.ifwd.fwdhk.api.controller.RestServiceImpl;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;;

public class FaqUtil {

    private JSONObject _faqObject;
    private JSONArray _faqArray;
    private String _key;
    
    private RestServiceImpl restService = new RestServiceImpl();
    
    public FaqUtil(){
    	
    }
    
	public FaqUtil(String url, String key){
        //_faqObject = this.getCall(url);
        //_faqArray = (JSONArray) _faqObject.get(key);
    }

    public JSONObject getJsonObjectFromFile(String path){

        InputStream is = null;
        String jsonTxt = "";
        JSONObject jsonObj = new JSONObject();

        File f = new File(path);
        if (f.exists()){
            try {
				is = new FileInputStream(path);
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
            
            try {
				jsonTxt = IOUtils.toString(is, "UTF8");
			} catch (IOException e) {
				e.printStackTrace();
			}
            
            JSONParser parser = new JSONParser();
            
            try {
				jsonObj = (JSONObject) parser.parse(jsonTxt);
			} catch (ParseException e) {
				e.printStackTrace();
			}
        }

        return jsonObj;
    }

    public JSONObject getJsonObject(String url){
        return restService.consumeApi(HttpMethod.GET, url, COMMON_HEADERS, null);
    }

    public JSONObject getJsonObjectByPost(String url, JSONObject params){
        return restService.consumeApi(HttpMethod.POST, url, COMMON_HEADERS, params);
    }

    public ArrayList<String> getFAQTopic(){

        JSONArray faqArr = this._faqArray;
        ArrayList<String> resultList = new ArrayList<>();

        for(int i=0; i<faqArr.size(); i++){
        	String currKey = ((JSONObject) faqArr.get(i)).get("faq_topic").toString(); 
            if( resultList.indexOf(currKey) == -1 ){
                resultList.add(currKey);
            }
        }
        return resultList;
    }

    //public JSONObject getJsonObject(){
    //    return this._faqObject;
    //}

    //public ArrayList<JSONObject> getFAQIndex(){
//
    //    JSONArray faqArr = this._faqArray;
    //    ArrayList<JSONObject> resultList = new ArrayList<>();
//
    //    for(int i=0; i<faqArr.size(); i++){
    //        resultList.add((JSONObject)faqArr.get(i));
    //    }
//
    //    //Sorting
    //    // To be implemented
//
    //    return resultList;
    //}
    
    public static JSONArray sortJSON(JSONObject jsonObj, Comparator<JSONObject> customComp ){
    	JSONArray arr = new JSONArray();
    	return arr;
    }
}