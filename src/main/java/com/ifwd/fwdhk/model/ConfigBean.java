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
	@Value("#{configProperties['savieMailFrom']}")
	private String savieMailFrom;
	@Value("#{configProperties['innerMailTo']}")
	private String innerMailTo;
	@Value("#{configProperties['Url_SZWS']}")
	private String Url_SZWS;
	@Value("#{configProperties['pdfImagesKey']}")
	private String pdfImagesKey;
	@Value("#{configProperties['becomePartnerMailTo']}")
	private String becomePartnerMailTo;

	@Value("#{configProperties['appId']}")
	private String appId;
	
	@Value("#{configProperties['publicKey']}")
	private String publicKey;
	
	@Value("#{configProperties['apiKei']}")
	private String apiKei;
	
	@Value("#{configProperties['tagGoUrl']}")
	private String tagGoUrl;

	@Value("#{configProperties['isContentEditable']?:false}")
	private boolean isContentEditable;
	
	public boolean getIsContentEditable() {
		return this.isContentEditable;
	}
	
	public void setIsContentEditable(boolean isContentEditable) {
		this.isContentEditable = isContentEditable;
	}

	public String getUrl_SZWS() {
		return Url_SZWS;
	}

	public void setUrl_SZWS(String url_SZWS) {
		Url_SZWS = url_SZWS;
	}

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

	public String getSavieMailFrom() {
		return savieMailFrom;
	}

	public void setSavieMailFrom(String savieMailFrom) {
		this.savieMailFrom = savieMailFrom;
	}
	
	public String getPdfImagesKey() {
		return pdfImagesKey;
	}
	
	public void setPdfImagesKey(String pdfImagesKey) {
		this.pdfImagesKey = pdfImagesKey;
	}

	public String getBecomePartnerMailTo() {
		return becomePartnerMailTo;
	}

	public void setBecomePartnerMailTo(String becomePartnerMailTo) {
		this.becomePartnerMailTo = becomePartnerMailTo;
	}

	public String getAppId() {
		return appId;
	}

	public void setAppId(String appId) {
		this.appId = appId;
	}

	public String getPublicKey() {
		return publicKey;
	}

	public void setPublicKey(String publicKey) {
		this.publicKey = publicKey;
	}

	public String getApiKei() {
		return apiKei;
	}

	public void setApiKei(String apiKei) {
		this.apiKei = apiKei;
	}

	public String getTagGoUrl() {
		return tagGoUrl;
	}

	public void setTagGoUrl(String tagGoUrl) {
		this.tagGoUrl = tagGoUrl;
	}
	

}
