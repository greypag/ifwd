package com.ifwd.fwdhk.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ifwd.fwdhk.controller.HomeCareController;

public class MessagePageUtils {
	private final static Logger logger = LoggerFactory.getLogger(MessagePageUtils.class);
	@SuppressWarnings("rawtypes")
	public static List<MessagePageEntity> getAllMessagePage(String path)throws Exception{
		File file = new File(path);
		File[] files = file.listFiles();
		List<String> nameList = new ArrayList<String>();
		readFile(files, path,nameList);
		Map<String,String> map = new HashMap<String,String>();
		for (String fileName : nameList) {
			if(fileName.indexOf(".jsp")!=-1){
				searchKey(path,fileName,map);
			}
		}
		List<MessagePageEntity> mpList = new ArrayList<MessagePageEntity>();
		Iterator it = map.keySet().iterator();
		while(it.hasNext()){
			MessagePageEntity ma = new MessagePageEntity();
			String key = (String) it.next();
			String page = map.get(key);
			ma.setKey(key);
			ma.setPage(page);
			mpList.add(ma);
		}
		return mpList;
	}
	
	private static void searchKey(String path,String fileName,Map<String,String> map)throws Exception{
			File file = new File(fileName);
			InputStreamReader read = new InputStreamReader(new FileInputStream(file));//考虑到编码格式
            BufferedReader bufferedReader = new BufferedReader(read);
            String lineTxt = null;
            String pageName = fileName.replace(path+"/", "");
            while((lineTxt = bufferedReader.readLine()) != null){
            	//logger.info("lineTxt : "+lineTxt);
            	Pattern p = Pattern.compile("\\s+key=\"(.*?)\"\\s+");
                Matcher m = p.matcher(lineTxt);
                while (m.find()) {
                	String key =m.group(1);
                	//logger.info("key : "+key);
                    if(map.get(key) == null && StringUtils.isNotEmpty(key)){
                		map.put(key, pageName);
            		}else{
            			String messagePage = map.get(key);
            			if(!messagePage.contains(pageName)){
            				messagePage = messagePage +","+pageName;
            				map.put(key, messagePage);
            			}
            		}
                } 
            }      
            bufferedReader.close();
            read.close();
	}
	
	
	
	public static String getMessagePage(String messageKey, String path)throws Exception {
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
	
	private static void readFile(File[] files,String path,List<String> nameList)throws Exception{
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
	private static boolean searchFile(String path,String messageKey)throws Exception{
			File file = new File(path);
			InputStreamReader read = new InputStreamReader(new FileInputStream(file));//考虑到编码格式
            BufferedReader bufferedReader = new BufferedReader(read);
            String lineTxt = null;
            while((lineTxt = bufferedReader.readLine()) != null){
            	if(lineTxt.trim().indexOf(" code=\""+messageKey+"\"") != -1){
            		return true;
            	}
            }
            bufferedReader.close();
            read.close();
		return false;
	}
}
