package com.ifwd.fwdhk.services;

import java.util.List;

import com.ifwd.fwdhk.model.BankBean;
import com.ifwd.fwdhk.model.BankBranchBean;
import com.ifwd.fwdhk.model.CreateSaviePolicy;
import com.ifwd.fwdhk.model.DistrictBean;
import com.ifwd.fwdhk.model.HomeCareDetailsBean;
import com.ifwd.fwdhk.model.SavieRateBean;
import com.ifwd.fwdhk.model.SavieServiceCentreBean;
import com.ifwd.fwdhk.model.UserDetails;


public interface SavieCareService {

	public List<SavieServiceCentreBean> getServiceCentre(String userName, String token, String language); 
	public List<SavieRateBean> getRate(String userName, String token, String language); 
	public List<DistrictBean> getDistrict(String userName, String token, String language); 
	public List<BankBean> getBank(String userName, String token, String language); 
	public List<BankBranchBean> getBankBranch(String userName, String token, String language,Integer bankCode); 
	
	
	public CreateSaviePolicy createSavieCarePolicy(String userName, String token,HomeCareDetailsBean homeCareDetails, UserDetails userDetails, String language, String referralCode);
	
}
