package com.ifwd.fwdhk.services.impl;

import java.util.List;

import com.ifwd.fwdhk.model.BankBean;
import com.ifwd.fwdhk.model.BankBranchBean;
import com.ifwd.fwdhk.model.DistrictBean;
import com.ifwd.fwdhk.model.HomeCareDetailsBean;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.model.savie.SavieAppointmentScheduleBean;
import com.ifwd.fwdhk.model.savie.SavieFormApplicationBean;
import com.ifwd.fwdhk.model.savie.SavieFormDeclarationAuthorizationBean;
import com.ifwd.fwdhk.model.savie.SavieFormDocumentBean;
import com.ifwd.fwdhk.model.savie.SavieFormFNABean;
import com.ifwd.fwdhk.model.savie.SavieFormSetAppointmentBean;
import com.ifwd.fwdhk.model.savie.SavieFormSignatureBean;
import com.ifwd.fwdhk.model.savie.SavieIllustrationBean;
import com.ifwd.fwdhk.model.savie.SaviePolicy;
import com.ifwd.fwdhk.model.savie.SaviePolicyAccountBalanceBean;
import com.ifwd.fwdhk.model.savie.SavieServiceCentreBean;
import com.ifwd.fwdhk.services.SavieService;

public class SavieServiceImpl implements SavieService {

	@Override
	public List<SavieServiceCentreBean> getServiceCentre(String userName,
			String token, String language) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SaviePolicyAccountBalanceBean> getSavieRate(String userName, String token,
			String language) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<DistrictBean> getDistrict(String userName, String token,
			String language) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BankBean> getBank(String userName, String token, String language) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BankBranchBean> getBankBranch(String userName, String token,
			String language, Integer bankCode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SaviePolicy createSaviePolicy(String userName, String token,
			String language, SavieFormApplicationBean application,
			SavieFormSetAppointmentBean appointment,
			SavieFormSignatureBean signature,
			SavieFormDeclarationAuthorizationBean authorization,
			SavieFormDocumentBean documents) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SavieIllustrationBean getIllustration(String userName, String token,
			String language) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String upsertFNA(String userName, String token, String language,
			SavieFormFNABean fna) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String upsertApplication(String userName, String token,
			String language, SavieFormApplicationBean application) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String upsertAppointment(String userName, String token,
			String language, SavieFormSetAppointmentBean appointment) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String upsertSignature(String userName, String token,
			String language, SavieFormSignatureBean signature) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String upsertDeclarationAuthorization(String userName, String token,
			String language, SavieFormDeclarationAuthorizationBean authorization) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String upsertDocument(String userName, String token,
			String language, SavieFormDocumentBean documents) {
		// TODO Auto-generated method stub
		return null;
	}

	

	
	

	



}
