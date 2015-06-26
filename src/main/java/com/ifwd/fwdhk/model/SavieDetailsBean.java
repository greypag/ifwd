package com.ifwd.fwdhk.model;

import java.util.ArrayList;
import java.util.List;

public class SavieDetailsBean {
	private List<SavieBeneficary> beneficaryList = new ArrayList<>();

	public List<SavieBeneficary> getBeneficaryList() {
		return beneficaryList;
	}

	public void setBeneficaryList(List<SavieBeneficary> beneficaryList) {
		this.beneficaryList = beneficaryList;
	}
}
