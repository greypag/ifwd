package com.ifwd.fwdhk.util;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

@Component
public class ClientBrowserUtil {
	
	public static Map<String,Object> getClientInfo(HttpServletRequest request){
		Map<String,Object> map = new HashMap<String,Object>();
		String agent = request.getHeader("User-Agent");
//		StringTokenizer st = new StringTokenizer(agent,";");  
//		st.nextToken();  
//		String userbrowser = st.nextToken();  //browser name
		//String useros = st.nextToken(); //user system operation
		
		String ip = request.getHeader("x-forwarded-for");
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		ip = request.getHeader("Proxy-Client-IP");
		}
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		ip = request.getRemoteAddr();
		} 
				
		int port = request.getRemotePort();
		
		/*System.out.println("agent : " + agent);
		System.out.println("port : " + port);
		System.out.println("ip : " + ip);
		System.out.println("userbrowser : " + userbrowser);
		System.out.println("useros : " + useros);
		System.out.println("operation system name : " + System.getProperty("os.name"));
		System.out.println("operation system version : " + System.getProperty("os.version"));
		System.out.println("operation system arch : " + System.getProperty("os.arch"));*/
		//map.put("useros", useros);
		map.put("agent", agent);
		map.put("port", port);
		map.put("ip", ip);
		//map.put("userbrowser", userbrowser);
		map.put("osName", System.getProperty("os.name"));
		map.put("osVersion", System.getProperty("os.version"));
		map.put("osArch", System.getProperty("os.arch"));
		
		
		
		return map;
	}
	
	
}
