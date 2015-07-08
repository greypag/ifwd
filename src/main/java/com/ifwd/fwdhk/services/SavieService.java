package com.ifwd.fwdhk.services;

import java.util.List;

import com.ifwd.fwdhk.model.BankBean;
import com.ifwd.fwdhk.model.BankBranchBean;
import com.ifwd.fwdhk.model.DistrictBean;
import com.ifwd.fwdhk.model.OptionItemDesc;
import com.ifwd.fwdhk.model.savie.SavieFormApplicationBean;
import com.ifwd.fwdhk.model.savie.SavieFormDeclarationAuthorizationBean;
import com.ifwd.fwdhk.model.savie.SavieFormDocumentBean;
import com.ifwd.fwdhk.model.savie.SavieFormFNABean;
import com.ifwd.fwdhk.model.savie.SavieFormSetAppointmentBean;
import com.ifwd.fwdhk.model.savie.SavieFormSignatureBean;
import com.ifwd.fwdhk.model.savie.SaviePlanDetailsBean;
import com.ifwd.fwdhk.model.savie.SaviePolicy;
import com.ifwd.fwdhk.model.savie.SaviePolicyAccountBalanceBean;
import com.ifwd.fwdhk.model.savie.SavieServiceCentreBean;


public interface SavieService {

	public List<SavieServiceCentreBean> getServiceCentre(String userName, String token, String language); 
	public List<SaviePolicyAccountBalanceBean> getSavieRate(String userName, String token, String language); 
	public List<DistrictBean> getDistrict(String userName, String token, String language); 
	public List<BankBean> getBank(String userName, String token, String language); 
	public List<BankBranchBean> getBankBranch(String userName, String token, String language,Integer bankCode); 
	
	
	public SaviePolicy createSaviePolicy(String userName, String token, String language,SavieFormApplicationBean application,SavieFormSetAppointmentBean appointment,SavieFormSignatureBean signature,SavieFormDeclarationAuthorizationBean authorization,SavieFormDocumentBean documents);
	
	public SaviePlanDetailsBean getPlanDetails(String userName, String token, String language,String referralCode);
	public String upsertFNA(String userName, String token, String language,SavieFormFNABean fna);
	public String upsertApplication(String userName, String token, String language,SavieFormApplicationBean application);
	public String upsertAppointment(String userName, String token, String language,SavieFormSetAppointmentBean appointment);
	public String upsertSignature(String userName, String token, String language,SavieFormSignatureBean signature);
	public String upsertDeclarationAuthorization(String userName, String token, String language,SavieFormDeclarationAuthorizationBean authorization);
	public String upsertDocument(String userName, String token, String language,SavieFormDocumentBean documents);
	
	public List<OptionItemDesc> getMaritalStatus(String language);
	public List<OptionItemDesc> getSavieDistrict(String language);
	public List<OptionItemDesc> getEmploymentStatus(String language);
	public List<OptionItemDesc> getNationality(String language);
	public List<OptionItemDesc> getNatureOfBusiness(String language);
	public List<OptionItemDesc> getPlaceOfBirth(String language);
	public List<OptionItemDesc> getMonthlyPersonalIncome(String language);
	public List<OptionItemDesc> getSavieBeneficiaryRelationship(String language);
	public List<OptionItemDesc> getOccupation(String language);
	
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
