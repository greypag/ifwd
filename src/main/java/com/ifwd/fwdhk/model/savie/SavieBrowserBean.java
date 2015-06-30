package com.ifwd.fwdhk.model.savie;

public class SavieBrowserBean {
	private String osName;//操作系统名称  
	private String osArch;//操作系统构架
	private String osVersion; //操作系统版本
	private String agent;//获取浏览器名称 
	
	
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

	
	   
	   
}
