package com.ifwd.fwdhk.model;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component("configBean")
public class ConfigBean {

	@Value("#{configProperties['url']}")
	private String url;
	@Value("#{configProperties['documentPath']}")
	private String documentPath;
	@Value("#{configProperties['imgMaxWidth']}")
	private String imgMaxWidth;
	@Value("#{configProperties['imgMaxHeight']}")
	private String imgMaxHeight;
	@Value("#{configProperties['imgMaxSize']}")
	private String imgMaxSize;
	@Value("#{configProperties['imgMaxRatio']}")
	private String imgMaxRatio;
	@Value("#{configProperties['innerMailFrom']}")
	private String innerMailFrom;
	@Value("#{configProperties['promoteMailFrom']}")
	private String promoteMailFrom;
	@Value("#{configProperties['innerMailTo']}")
	private String innerMailTo;

	public String getUrl() {
		return url;
	}

	public String getDocumentPath() {
		return documentPath;
	}

	public String getImgMaxWidth() {
		return imgMaxWidth;
	}

	public String getImgMaxHeight() {
		return imgMaxHeight;
	}

	public String getImgMaxSize() {
		return imgMaxSize;
	}

	public String getImgMaxRatio() {
		return imgMaxRatio;
	}

	public String getInnerMailFrom() {
		return innerMailFrom;
	}

	public String getInnerMailTo() {
		return innerMailTo;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public void setDocumentPath(String documentPath) {
		this.documentPath = documentPath;
	}

	public void setImgMaxWidth(String imgMaxWidth) {
		this.imgMaxWidth = imgMaxWidth;
	}

	public void setImgMaxHeight(String imgMaxHeight) {
		this.imgMaxHeight = imgMaxHeight;
	}

	public void setImgMaxSize(String imgMaxSize) {
		this.imgMaxSize = imgMaxSize;
	}

	public void setImgMaxRatio(String imgMaxRatio) {
		this.imgMaxRatio = imgMaxRatio;
	}

	public void setInnerMailFrom(String innerMailFrom) {
		this.innerMailFrom = innerMailFrom;
	}

	public void setInnerMailTo(String innerMailTo) {
		this.innerMailTo = innerMailTo;
	}

	public String getPromoteMailFrom() {
		return promoteMailFrom;
	}

	public void setPromoteMailFrom(String promoteMailFrom) {
		this.promoteMailFrom = promoteMailFrom;
	}

}
