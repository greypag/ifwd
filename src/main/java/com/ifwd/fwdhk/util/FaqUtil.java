package com.ifwd.fwdhk.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

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