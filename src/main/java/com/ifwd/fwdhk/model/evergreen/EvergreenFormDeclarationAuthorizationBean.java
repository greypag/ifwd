package com.ifwd.fwdhk.model.evergreen;

public class EvergreenFormDeclarationAuthorizationBean {
	
	private boolean personalInformationCollectionStatement;
	
	private boolean cancellationRightandRefundofPremium;
	
	private boolean application;
	
	private boolean doNotSentInfoToMe;
	
	private boolean doNotProvideMyData;

	public boolean isPersonalInformationCollectionStatement() {
		return personalInformationCollectionStatement;
	}

	public void setPersonalInformationCollectionStatement(
			boolean personalInformationCollectionStatement) {
		this.personalInformationCollectionStatement = personalInformationCollectionStatement;
	}

	public boolean isCancellationRightandRefundofPremium() {
		return cancellationRightandRefundofPremium;
	}

	public void setCancellationRightandRefundofPremium(
			boolean cancellationRightandRefundofPremium) {
		this.cancellationRightandRefundofPremium = cancellationRightandRefundofPremium;
	}

	public boolean isApplication() {
		return application;
	}

	public void setApplication(boolean application) {
		this.application = application;
	}

	public boolean isDoNotSentInfoToMe() {
		return doNotSentInfoToMe;
	}

	public void setDoNotSentInfoToMe(boolean doNotSentInfoToMe) {
		this.doNotSentInfoToMe = doNotSentInfoToMe;
	}

	public boolean isDoNotProvideMyData() {
		return doNotProvideMyData;
	}

	public void setDoNotProvideMyData(boolean doNotProvideMyData) {
		this.doNotProvideMyData = doNotProvideMyData;
	}
	
	
	
}
