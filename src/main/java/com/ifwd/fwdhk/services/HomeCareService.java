/**
* The HomeCareService having all abstract methods which are need to require for HOME care Module 
* @author  Prakash
* @since   2015-03-18 
*/

package com.ifwd.fwdhk.services;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.ifwd.fwdhk.model.CreatePolicy;
import com.ifwd.fwdhk.model.DistrictBean;
import com.ifwd.fwdhk.model.FinalizePolicy;
import com.ifwd.fwdhk.model.HomeCareDetailsBean;
import com.ifwd.fwdhk.model.HomeCareQuetionaries;
import com.ifwd.fwdhk.model.HomeQuoteBean;
import com.ifwd.fwdhk.model.QuoteDetails;
import com.ifwd.fwdhk.model.UserDetails;

public interface  HomeCareService {
	public List< HomeCareQuetionaries> getHomeQuetionaries(String token, String userName, String language);
	public HomeQuoteBean getHomePlan(String token, String userName, String userReferralCode , String answer1, String answer2, String language);
	public String getHomePlanToString(String token, String userName, String userReferralCode , String answer1, String answer2, String language);
	public List<DistrictBean>getDistrict(String userName, String token, String language); 
	public LinkedHashMap<String, String> getArea(String userName, String token, String language);
	
	public Map<String, String> getNetFloorArea(String userName, String token, String language); 
	
	public CreatePolicy createHomeCarePolicy(String userName, String token,HomeCareDetailsBean homeCareDetails, UserDetails userDetails, String language, String referralCode);
	public CreatePolicy confirmHomeCarePolicy(String userName, String token,
			String referenceNo, String language);
	/*public List<String>confirmHomeCare(String userName, String token, String referenceNo, String transactionNumber,String transactionDate, String creditCardNo, String expiryDate);*/ 
	public CreatePolicy finalizeHomeCarePolicy(String userName, String token,String referenceNo, String transactionNumber,String transactionDate,String creditCardNo, String expiryDate, String emailId, String language);

}
