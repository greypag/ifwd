package com.ifwd.fwdhk.model.life;

import java.util.List;

public class ProductList {
	private List<OtherTypes> other_types;
	private String group;
	private String groupCode;
	private List<Products> products;

	public String getGroupCode() {
		return groupCode;
	}

	public void setGroupCode(String groupCode) {
		this.groupCode = groupCode;
	}

	public List<OtherTypes> getOther_types() {
		return other_types;
	}

	public void setOther_types(List<OtherTypes> other_types) {
		this.other_types = other_types;
	}

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	public List<Products> getProducts() {
		return products;
	}

	public void setProducts(List<Products> products) {
		this.products = products;
	}

}
