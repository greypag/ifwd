package com.ifwd.fwdhk.model.savieOnline;

import java.util.List;

import net.sf.ezmorph.bean.MorphDynaBean;

public class ProductRecommendation {
	private String errMsgs;
	private String next_page;
	private List<MorphDynaBean> product_list;
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
	

	

}
