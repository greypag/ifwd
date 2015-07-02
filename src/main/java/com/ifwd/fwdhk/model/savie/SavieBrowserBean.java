package com.ifwd.fwdhk.model.savie;

public class SavieBrowserBean {
	private String osName;//操作系统名称  
	private String osArch;//操作系统构架
	private String osVersion; //操作系统版本
	private String agent;//获取浏览器名称 
	
	
	private String method;//获得客户端向服务器端传送数据的方法有GET、POST、PUT等类型  
	
/*	
	private String RequestURI;//获得发出请求字符串的客户端地址  
	private String ServletPath;//获得客户端所请求的脚本文件的文件路径  
	private String ServerName;//获得服务器的名字  
	private String ServerPort;//获得服务器的端口号  	
*/	
	private String remoteAddr;//获得客户端的IP地址  
	private String remoteHost;//获得客户端电脑的名字，
	private String protocol;
	public String getOsName() {
		return osName;
	}
	public void setOsName(String osName) {
		this.osName = osName;
	}
	public String getOsArch() {
		return osArch;
	}
	public void setOsArch(String osArch) {
		this.osArch = osArch;
	}
	public String getOsVersion() {
		return osVersion;
	}
	public void setOsVersion(String osVersion) {
		this.osVersion = osVersion;
	}
	public String getAgent() {
		return agent;
	}
	public void setAgent(String agent) {
		this.agent = agent;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public String getRemoteAddr() {
		return remoteAddr;
	}
	public void setRemoteAddr(String remoteAddr) {
		this.remoteAddr = remoteAddr;
	}
	public String getRemoteHost() {
		return remoteHost;
	}
	public void setRemoteHost(String remoteHost) {
		this.remoteHost = remoteHost;
	}
	public String getProtocol() {
		return protocol;
	}
	public void setProtocol(String protocol) {
		this.protocol = protocol;
	}
	
	
	
	

	

	
	   
	   
}
