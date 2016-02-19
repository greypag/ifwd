package com.ifwd.fwdhk.model.savieOnline;

import java.util.List;

public class ProductList {
	private String group;
	private List<Products> products;
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
