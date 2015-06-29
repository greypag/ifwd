package com.ifwd.fwdhk.services;

import java.util.List;

import com.ifwd.fwdhk.model.BankBean;
import com.ifwd.fwdhk.model.BankBranchBean;
import com.ifwd.fwdhk.model.DistrictBean;
import com.ifwd.fwdhk.model.HomeCareDetailsBean;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.model.savie.CreateSaviePolicy;
import com.ifwd.fwdhk.model.savie.SavieRateBean;
import com.ifwd.fwdhk.model.savie.SavieServiceCentreBean;


public interface SavieCareService {

	public List<SavieServiceCentreBean> getServiceCentre(String userName, String token, String language); 
	public List<SavieRateBean> getRate(String userName, String token, String language); 
	public List<DistrictBean> getDistrict(String userName, String token, String language); 
	public List<BankBean> getBank(String userName, String token, String language); 
	public List<BankBranchBean> getBankBranch(String userName, String token, String language,Integer bankCode); 
	
	
	public CreateSaviePolicy createSavieCarePolicy(String userName, String token,HomeCareDetailsBean homeCareDetails, UserDetails userDetails, String language, String referralCode);
	
	//getIllustration
	//upsertFNA
	//upsertAppointment
	
	
	
	//fileUpload?
	//signature?
	
	
	
	//1/check session, and redirect to savie landing page if session expired
	//2/validate the object
	//3/check page flow object
	    //define from page and to page
	//4/create response object
	//5/call service layer
	    //4.1/store the response into response object
	//6/put the required object into session
	//7/return result
	//8/return the next page (if applicable)
	
	
	
	
	
	
	
}
