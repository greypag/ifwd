package com.ifwd.fwdhk.model.evergreen;

public class EvergreenBrowserBean {
	private String osName;// operating system name; 
	private String osArch;// operating system architecture
	private String osVersion;  //operating system version
	private String agent;//Get the name of the browser 
	
	
	private String method;//method to get the client to transmit data to a server, there are GET, POST, PUT, and other types  
	
/*	
	private String RequestURI;// get a string requesting client address  
	private String ServletPath;//get the script file on the client requested the file path 
	private String ServerName;//get server's name  
	private String ServerPort;//get server port number  	
*/	
	private String remoteAddr;//obtain the IP address of the client 
	private String remoteHost;//get the client computer's name
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
