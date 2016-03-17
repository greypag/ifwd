package com.ifwd.fwdhk.model.savieOnline;

import java.util.List;

public class Products {
	private String q1;
	private String q2;
	private String name;
	private String type;
	private Boolean show;
	private List<String> features;
	private List<String> objectives;
	private String type_desc;
	private String product_code;
	private List<String> contribution_period;
	private String min_issue_age;
	private String max_issue_age;
	private Integer protection_period;
	private String key_product_risks;
	private String key_exclusions;
	private String brochure_url;
	private String product_url;
	

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

	public String getType_desc() {
		return type_desc;
	}

	public void setType_desc(String type_desc) {
		this.type_desc = type_desc;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Boolean getShow() {
		return show;
	}

	public void setShow(Boolean show) {
		this.show = show;
	}

	public String getProduct_code() {
		return product_code;
	}

	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}

	public List<String> getContribution_period() {
		return contribution_period;
	}

	public void setContribution_period(List<String> contribution_period) {
		this.contribution_period = contribution_period;
	}

	public String getMin_issue_age() {
		return min_issue_age;
	}

	public void setMin_issue_age(String min_issue_age) {
		this.min_issue_age = min_issue_age;
	}

	public String getMax_issue_age() {
		return max_issue_age;
	}

	public void setMax_issue_age(String max_issue_age) {
		this.max_issue_age = max_issue_age;
	}

	public Integer getProtection_period() {
		return protection_period;
	}

	public void setProtection_period(Integer protection_period) {
		this.protection_period = protection_period;
	}

	public List<String> getFeatures() {
		return features;
	}

	public void setFeatures(List<String> features) {
		this.features = features;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public List<String> getObjectives() {
		return objectives;
	}

	public void setObjectives(List<String> objectives) {
		this.objectives = objectives;
	}

	public String getKey_product_risks() {
		return key_product_risks;
	}

	public void setKey_product_risks(String key_product_risks) {
		this.key_product_risks = key_product_risks;
	}

	public String getKey_exclusions() {
		return key_exclusions;
	}

	public void setKey_exclusions(String key_exclusions) {
		this.key_exclusions = key_exclusions;
	}

	public String getBrochure_url() {
		return brochure_url;
	}

	public void setBrochure_url(String brochure_url) {
		this.brochure_url = brochure_url;
	}

	public String getProduct_url() {
		return product_url;
	}

	public void setProduct_url(String product_url) {
		this.product_url = product_url;
	}

}
