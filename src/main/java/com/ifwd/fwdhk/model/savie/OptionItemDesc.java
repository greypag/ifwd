package com.ifwd.fwdhk.model.savie;

import org.springframework.stereotype.Component;


@Component
public class OptionItemDesc {
	
	private String itemTable;
	
	private String itemCode;
	
	private String itemLang;
	
	private String itemDesc;

	public String getItemTable() {
		return itemTable;
	}

	public void setItemTable(String itemTable) {
		this.itemTable = itemTable;
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public String getItemLang() {
		return itemLang;
	}

	public void setItemLang(String itemLang) {
		this.itemLang = itemLang;
	}

	public String getItemDesc() {
		return itemDesc;
	}

	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}
	
	
}
