package com.ifwd.fwdhk.model.life;

import java.util.List;

import net.sf.ezmorph.bean.MorphDynaBean;

public class ProductRecommendation {
	private String errMsgs;
	private Float affordabilityPremium;
	private String next_page;
	private List<MorphDynaBean> product_list;
	private List<String> remarks;
	private String q1;
	private String q2;
	private String fulfilled;
	private String hasILAS;
	
	
	public String getErrMsgs() {
		return errMsgs;
	}
	public void setErrMsgs(String errMsgs) {
		this.errMsgs = errMsgs;
	}
	public String getNext_page() {
		return next_page;
	}
	public void setNext_page(String next_page) {
		this.next_page = next_page;
	}
	public List<MorphDynaBean> getProduct_list() {
		return product_list;
	}
	public void setProduct_list(List<MorphDynaBean> product_list) {
		this.product_list = product_list;
	}
	public List<String> getRemarks() {
		return remarks;
	}
	public void setRemarks(List<String> remarks) {
		this.remarks = remarks;
	}
	public Float getAffordabilityPremium() {
		return affordabilityPremium;
	}
	public void setAffordabilityPremium(Float affordabilityPremium) {
		this.affordabilityPremium = affordabilityPremium;
	}
	public String getQ1() {
		return q1;
	}
	public void setQ1(String q1) {
		this.q1 = q1;
	}
	public String getQ2() {
		return q2;
	}
	public void setQ2(String q2) {
		this.q2 = q2;
	}
	public String getFulfilled() {
		return fulfilled;
	}
	public void setFulfilled(String fulfilled) {
		this.fulfilled = fulfilled;
	}
	public String getHasILAS() {
		return hasILAS;
	}
	public void setHasILAS(String hasILAS) {
		this.hasILAS = hasILAS;
	}

}
