package com.ifwd.fwdhk.message;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.configuration.ConfigurationException;
import org.apache.commons.configuration.PropertiesConfiguration;
import org.apache.commons.configuration.reloading.FileChangedReloadingStrategy;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.message.ECommConnector;
import com.ifwd.fwdhk.message.MessageResponse;
import com.ifwd.fwdhk.services.LocaleMessagePropertiesServiceImpl;

@Controller
public class MessageController {
	
	private static Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	@Autowired
	LocaleMessagePropertiesServiceImpl localeMessagePropertiesService;
	
	@Autowired protected ECommConnector connector;
	
	@Autowired  
	private javax.servlet.ServletContext application;
	
	
	
	@RequestMapping(value = "/refresh")
	public ModelAndView refresh(HttpServletRequest request, HttpServletResponse response,Model model) throws IOException, ConfigurationException {
		
		MessageResponse messageResponse=connector.getAllMessage();
		
		Map<String,Map<String,String>> allMessages=messageResponse.getAllMessages();
		
		/*String path =this.getClass().getResource("/").getPath();
		
		logger.info("----Resource Path----"+path);
		File f = new File(path);
		if(!f.exists()){
			f.mkdirs();
		} 
		
		for (String langCountry : allMessages.keySet()) {
				String fileName="travel_"+langCountry+".properties";
				logger.info("fileName : "+path+fileName);
				File file = new File(f,fileName);				
				if(!file.exists()){
					try {
						file.createNewFile();  
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				OutputStream fos = new FileOutputStream(path+fileName); 
				Properties prop = new Properties();				
				Map<String, String> names=allMessages.get(langCountry);
				for (Map.Entry<String, String> entry : names.entrySet()) {
					prop.setProperty(entry.getKey(),entry.getValue());									  
				}
				prop.store(fos,"");
				fos.flush();
				fos.close();
				

				
				java.util.StringTokenizer language = new java.util.StringTokenizer(langCountry,"_");
				String lang =  language.nextToken();
				String country = language.nextToken();
				//String[] local=key.split("_");
				//Locale locale = new Locale(local[0]);
				logger.info("----lang----"+lang);
				logger.info("----country----"+country);
				Locale locale = new java.util.Locale (lang,country);
				logger.info("locale : "+locale.toString());
				try {
					ResourceBundle res = ResourceBundle.getBundle("travel",locale);
					logger.info("travel.main.desc1 : "+res.getString("travel.main.desc1"));
				} catch (Exception e) {					
					e.printStackTrace();
				}
				
		}
		
		ResourceBundle.clearCache();
		ResourceBundle.clearCache();
		*/
		
		try {
			application.setAttribute("allMessages", allMessages);
			model.addAttribute("refreshResult", "I18N Refresh Success.");
		} catch (Exception e) {
			model.addAttribute("refreshResult", "I18N Refresh Fail.");
		}
		
		
		return new ModelAndView(UserRestURIConstants.getSitePath(request)
				+ "refresh");
	}
	
	
	@RequestMapping(value = {"/{lang}/getAllMessagePage"})
	public void getAllMessagePage(Model model, HttpServletRequest request) {
		String path = getClass().getResource("/").getFile().toString().replace("/classes" , "")+"jsp/merged";
		File file = new File(path);
		File[] files = file.listFiles();
		List<String> nameList = new ArrayList<String>();
		readFile(files, path,nameList);
		List<String> keyList = new ArrayList<String>();
		Map<String,String> map = new HashMap<String,String>();
		for (String fileName : nameList) {
			if(fileName.indexOf(".jsp")!=-1){
				searchKey(fileName,keyList,map);
			}
		}
		for (String key : keyList) {
			String messageKey = key;
		}
	}
	
	private void searchKey(String path,List<String> keyList,Map<String,String> map){
        try {
			File file = new File(path);
			InputStreamReader read = new InputStreamReader(new FileInputStream(file));//考虑到编码格式
            BufferedReader bufferedReader = new BufferedReader(read);
            String lineTxt = null;
            while((lineTxt = bufferedReader.readLine()) != null){
            	//<p><fmt:message key="savie.confirmation.offline.A.hkid" bundle="${msg}" /></p>
            	if(lineTxt.contains("<s:message")){
            		String[] key1 = lineTxt.split("code=\"");
            		String key =lineTxt.split("code=\"")[key1.length-1].split("\"")[0];
            		if(StringUtils.isNotEmpty(key) && map.get(key) == null ){
                		keyList.add(key);
                		map.put(key, key);
            		}
            	}
            }
            read.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	@RequestMapping(value = {"/{lang}/getMessagePage"})
	public void getMessagePage(Model model, HttpServletRequest request) {
		String path = getClass().getResource("/").getFile().toString().replace("/classes" , "")+"jsp/merged";
		String messageKey=request.getParameter("messageKey");
		String page="";
		File file = new File(path);
		File[] files = file.listFiles();
		List<String> nameList = new ArrayList<String>();
		readFile(files, path,nameList);
		for (String fileName : nameList) {
			if(fileName.indexOf(".jsp")!=-1){
				if(searchFile(fileName,messageKey)){
					if("".equals(page)){
						page = fileName.replace(path+"/", "");
					}else{
						page = page+","+fileName.replace(path+"/", "");
					}
				}
			}
		}
		System.out.println(page);
	}
	
	private void readFile(File[] files,String path,List<String> nameList){
		for (int i = 0; i < files.length; i++) {
			  if(!files[i].isDirectory()){
				  nameList.add(path+"/"+files[i].getName());
			  }else{
				  File[] fileFiles = files[i].listFiles();
				  String path1 = path +"/"+files[i].getName();
				  readFile(fileFiles, path1, nameList);
			  }
			}
			
	}
	
	@SuppressWarnings("resource")
	private boolean searchFile(String path,String messageKey){
        try {
			File file = new File(path);
			InputStreamReader read = new InputStreamReader(new FileInputStream(file));//考虑到编码格式
            BufferedReader bufferedReader = new BufferedReader(read);
            String lineTxt = null;
            while((lineTxt = bufferedReader.readLine()) != null){
            	if(lineTxt.indexOf(messageKey) != -1){
            		return true;
            	}
            }
            read.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	
	
	
}
