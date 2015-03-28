package com.ifwd.fwdhk.model;


public class UserDetails {

	private Long id;
	private String userName;
	private String fullName;
	private String password;
	private String confirmPassword;
	private String emailAddress;
	private String token;
	private String mobileNo;
	private String optIn2;
	private String optIn1;
	private String referralCount;
	private String gender;
	private String referralLink;
	private String referralCode;
	private String dob;
	private String referralCodeUsedCount;
	private String hkid;
	private String passport;
	
	
	

	public String getPassport() {
		return passport;
	}

	public void setPassport(String passport) {
		this.passport = passport;
	}

	public Long getId() {
		return id;
	}

	public String getHkid() {
		return hkid;
	}

	public void setHkid(String hkid) {
		this.hkid = hkid;
	}



	public void setId(Long id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getOptIn2() {
		return optIn2;
	}

	public void setOptIn2(String optIn2) {
		this.optIn2 = optIn2;
	}

	public String getOptIn1() {
		return optIn1;
	}

	public void setOptIn1(String optIn1) {
		this.optIn1 = optIn1;
	}

	public String getReferralCount() {
		return referralCount;
	}

	public void setReferralCount(String referralCount) {
		this.referralCount = referralCount;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getReferralLink() {
		return referralLink;
	}

	public void setReferralLink(String referralLink) {
		this.referralLink = referralLink;
	}

	public String getReferralCode() {
		return referralCode;
	}

	public void setReferralCode(String referralCode) {
		this.referralCode = referralCode;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getReferralCodeUsedCount() {
		return referralCodeUsedCount;
	}

	public void setReferralCodeUsedCount(String referralCodeUsedCount) {
		this.referralCodeUsedCount = referralCodeUsedCount;
	}

}
