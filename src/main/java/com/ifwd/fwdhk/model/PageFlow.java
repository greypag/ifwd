package com.ifwd.fwdhk.model;

public class PageFlow {

	private String currentPage;
	private String fromPage;
	private String toPage;
	
	public PageFlow(String currentPage, String fromPage, String toPage) {
		this.currentPage=currentPage;
		this.fromPage=fromPage;
		this.toPage=toPage;
	}
	public String getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}
	public String getFromPage() {
		return fromPage;
	}
	public void setFromPage(String fromPage) {
		this.fromPage = fromPage;
	}
	public String getToPage() {
		return toPage;
	}
	public void setToPage(String toPage) {
		this.toPage = toPage;
	}
	
	
}
