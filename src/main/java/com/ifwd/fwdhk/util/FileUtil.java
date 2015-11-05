package com.ifwd.fwdhk.util;

import java.io.File;

public class FileUtil {
	public static void deletFile(String path){
		 if (!path.endsWith(File.separator)) {  
			 path = path + File.separator;  
		 }  
		 File dirFile = new File(path);
		 if (!dirFile.exists() || !dirFile.isDirectory()) {  
		     return ;  
		 } 
		 File[] files = dirFile.listFiles();  
		 for (int i = 0; i < files.length; i++) {  
		     //删除子文件  
			 File file = files[i];
		     if (files[i].isFile()) {  
		    	 file.delete(); 
		     } //删除子目录  
		 }   
		 dirFile.delete();
	}
	
}
