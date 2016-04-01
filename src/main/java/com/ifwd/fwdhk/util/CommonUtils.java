package com.ifwd.fwdhk.util;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;




import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Component;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.connector.ECommWsConnector;
import com.ifwd.fwdhk.connector.response.savie.ServiceCentreResponse;
import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.model.OptionItemDesc;

@Component
public class CommonUtils {
	
	private final static Logger logger = LoggerFactory.getLogger(CommonUtils.class);
	
	@Autowired
	private RestServiceDao restService;
	
	@Autowired 
	protected ECommWsConnector connector;
	
	@SuppressWarnings("unchecked")
	public String getToken(String type) {
		
		String token = "";
		
		if(StringUtils.isEmpty(InitApplicationMessage.initToken)){
			try {
				JSONObject params = new JSONObject();
				params.put("userName", "*DIRECTGI");
				params.put("password", "");
				
				//logger.info("USER_LOGIN Requset" + JsonUtils.jsonPrint(params));
				JSONObject response = restService.consumeApi(HttpMethod.POST,
						UserRestURIConstants.USER_LOGIN, COMMON_HEADERS,
						params);
				//logger.info("response: " + response);
				if (response.get("errMsgs") == null && response != null) {
					token= response.get("token").toString();
					InitApplicationMessage.initToken = token;
				}
				
			} catch (Exception e) {
				logger.error("error : "+e.getMessage());
				if("start".equals(type)){
					System.exit(0);
				}
			}
		}
		else
		{
			token = InitApplicationMessage.initToken ;
		}
		return token;
	}

	public List<OptionItemDesc> getOptionItemDescList(String param,String language, String type) {
		return getOptionItemDescList(param, language, type, null);
	}
	
	public List<OptionItemDesc> getOptionItemDescList(String param,String language, String type, HttpServletRequest request) {
		List<OptionItemDesc> OptionItemDescList = new ArrayList<OptionItemDesc>();
		
		if(param.equals("occupation")) {
			for(int k=1;k<25;k++){
				try {
					String Url = UserRestURIConstants.SERVICE_URL + "/option/itemDesc?itemTable=NOB"+k;
					
					HashMap<String, String> header = new HashMap<String, String>(
							COMMON_HEADERS);

					String username = null;
					String token = null;
					if (request != null) {
						HttpSession session = request.getSession();
						if(session != null && session.getAttribute("token") != null && session.getAttribute("username") != null) {
							username = session.getAttribute("username").toString();
							token = session.getAttribute("token").toString();
						}							
					}
					if (username == null){
						username = "*DIRECTGI";
						token = getToken(type);
					}
					header.put("userName", username);
					header.put("token", token);
					header.put("language", WebServiceUtils.transformLanaguage(language));
					
					JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,
							Url, header, null);
					
					logger.info("***********responseJsonObj****************:"+responseJsonObj);
					
					if(responseJsonObj==null){
						
					} else {
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
						else{
							logger.error("error : "+responseJsonObj.get("errMsgs"));
							if("start".equals(type)){
								System.exit(0);
							}
						}
					}
				} catch (Exception e) {
					logger.error("error : " + e.getMessage());
					if("start".equals(type)){
						System.exit(0);
					}
				}
			}
			
		} else {
			try {
				String Url = UserRestURIConstants.SERVICE_URL + "/option/itemDesc?itemTable="+param;
				
				HashMap<String, String> header = new HashMap<String, String>(
						COMMON_HEADERS);
				
				String username = null;
				String token = null;
				if (request != null) {
					HttpSession session = request.getSession();
					if(session != null && session.getAttribute("token") != null && session.getAttribute("username") != null) {
						username = session.getAttribute("username").toString();
						token = session.getAttribute("token").toString();
					}							
				}
				if (username == null){
					username = "*DIRECTGI";
					token = getToken(type);
				}
				header.put("userName", username);
				header.put("token", token);
				header.put("language", WebServiceUtils.transformLanaguage(language));
				
				JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,
						Url, header, null);
				
				logger.info("***********responseJsonObj****************:"+responseJsonObj);
				if(responseJsonObj==null){
					
				} else {
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
					else{
						logger.error("error : " + responseJsonObj.get("errMsgs"));
						if("start".equals(type)){
							System.exit(0);
						}
					}
				}
			} catch (Exception e) {
				logger.error("error : " + e.getMessage());
				if("start".equals(type)){
					System.exit(0);
				}
			}
		}
		
		return OptionItemDescList;
	}
	
	public void getImageConfig(String type){
		String configurationKey = "";
		String configurationValue = "";
		
		try {
			String Url = UserRestURIConstants.IMAGE_CONFIG;
			HashMap<String, String> header = new HashMap<String, String>(
					COMMON_HEADERS);
			
			header.put("userName", "*DIRECTGI");
			header.put("token", getToken(type));
			header.put("language", "EN");
			
			JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,
					Url, header, null);
			if(responseJsonObj==null){
				
			} else {
				if (responseJsonObj.get("errMsgs") == null) {
					
					JSONArray jsonOptionItemDescs = (JSONArray)responseJsonObj.get("configuration");
					
					if(jsonOptionItemDescs.size()>0){
						for(int i = 0; i<jsonOptionItemDescs.size(); i++){
							
							JSONObject imageConfigObj=(JSONObject)jsonOptionItemDescs.get(i);
							configurationKey = (String)imageConfigObj.get("configurationKey");
							configurationValue = (String)imageConfigObj.get("configurationValue");
							
							if("signature.width".equals(configurationKey)){
								InitApplicationMessage.signatureWidth = configurationValue;
							}else if("signature.height".equals(configurationKey)){
								InitApplicationMessage.signatureHeight = configurationValue;
							}else if("signature.file.size".equals(configurationKey)){
								InitApplicationMessage.signatureFileSize = configurationValue;
							}else if("application.file.size".equals(configurationKey)){
								InitApplicationMessage.applicationFileSize = configurationValue;
							}
							
						}
					}
					}
				else{
					logger.error("error : " + responseJsonObj.get("errMsgs"));
					if("start".equals(type)){
						System.exit(0);
					}
				}
			}
				
			logger.info("***********responseJsonObj****************:"+responseJsonObj);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		
	}
	
	public void getServiceCentre(String language, String type){
		try {
			String Url = UserRestURIConstants.SERVICE_CENTRE;
			HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
			
			header.put("userName", "*DIRECTGI");
			header.put("token", getToken(type));
			header.put("language", WebServiceUtils.transformLanaguage(language));
			
			ServiceCentreResponse apiResponse = connector.consumeECommWs(Url, HttpMethod.GET, null, ServiceCentreResponse.class, header);
			if(apiResponse==null){
			} 
			else{
				if (!apiResponse.hasError()) {
					if("EN".equals(language)){
						InitApplicationMessage.serviceCentreEN = apiResponse;
					}
					else{
						InitApplicationMessage.serviceCentreCN = apiResponse;
					}
				}
				else{
					logger.error("error : " + apiResponse.getErrMsgs());
					if("start".equals(type)){
						System.exit(0);
					}
				}
			}
			logger.info("***********responseJsonObj****************:"+apiResponse);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		
	}
}
