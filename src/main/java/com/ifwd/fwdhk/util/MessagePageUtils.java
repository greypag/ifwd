package com.ifwd.fwdhk.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.ui.Model;

public class MessagePageUtils {
	public void getAllMessagePage(Model model, HttpServletRequest request) {
		String path = request.getSession().getServletContext().getRealPath("/")+"WEB-INF/jsp/merged";
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
            	if(lineTxt.contains("<fmt:message")){
            		String key = lineTxt.split("key=\"")[1].split("\"")[0];
            		if(map.get("key") == null && StringUtils.isNotEmpty(key)){
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
	
	
	
	public static String getMessagePage(String messageKey, String path) {
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
		return page;
	}
	
	private static void readFile(File[] files,String path,List<String> nameList){
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
	private static boolean searchFile(String path,String messageKey){
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
