package com.ifwd.fwdhk.util;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Component;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.model.OptionItemDesc;

@Component
public class CommonUtils {
	
	private final static Logger logger = LoggerFactory.getLogger(CommonUtils.class);
	
	@Autowired
	private RestServiceDao restService;
	
	@SuppressWarnings("unchecked")
	public String getToken() {
		String token = "";
		
		try {
			JSONObject params = new JSONObject();
			params.put("userName", "*DIRECTGI");
			params.put("password", "");
			
			logger.info("USER_LOGIN Requset" + JsonUtils.jsonPrint(params));
			JSONObject response = restService.consumeApi(HttpMethod.POST,
					UserRestURIConstants.USER_LOGIN, COMMON_HEADERS,
					params);
			logger.info("response: " + response);
			if (response.get("errMsgs") == null && response != null) {
				token= response.get("token").toString();
			}
		} catch (Exception e) {
			logger.info("error : " + e.getMessage());
		}
	
		return token;
	}

	
	public List<OptionItemDesc> getOptionItemDescList(String param,String language) {
		
		List<OptionItemDesc> OptionItemDescList = new ArrayList<OptionItemDesc>();
		
		
		try {
			String Url = UserRestURIConstants.SERVICE_URL + "/option/itemDesc?itemTable="+param;
			
			HashMap<String, String> header = new HashMap<String, String>(
					COMMON_HEADERS);
			
			header.put("userName", "*DIRECTGI");
			header.put("token", getToken());
			header.put("language", WebServiceUtils.transformLanaguage("language"));
			
			JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,
					Url, header, null);
			
			logger.info("***********responseJsonObj****************:"+responseJsonObj);
			
			if (responseJsonObj.get("errMsgs") == null) {
				
				JSONArray jsonOptionItemDescs = (JSONArray)responseJsonObj.get("optionItemDesc");
				
				if(jsonOptionItemDescs.size()>0){
					for(int i = 0; i<jsonOptionItemDescs.size(); i++){
						
						JSONObject maritalStatusObj=(JSONObject)jsonOptionItemDescs.get(i);
						
						OptionItemDesc optionItemDesc = new OptionItemDesc();				
						
						optionItemDesc.setItemTable((String)maritalStatusObj.get("itemTable"));
						optionItemDesc.setItemDesc((String)maritalStatusObj.get("itemDesc"));
						optionItemDesc.setItemCode((String)maritalStatusObj.get("itemCode"));
						optionItemDesc.setItemLang((String)maritalStatusObj.get("itemLang"));
						
						OptionItemDescList.add(optionItemDesc);
					}
				}
				
			}
		} catch (Exception e) {
			logger.info("error : " + e.getMessage());
		}
		return OptionItemDescList;
	}
	
}
