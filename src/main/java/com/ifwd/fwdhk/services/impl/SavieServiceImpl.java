package com.ifwd.fwdhk.services.impl;

import java.util.List;

import com.ifwd.fwdhk.model.BankBean;
import com.ifwd.fwdhk.model.BankBranchBean;
import com.ifwd.fwdhk.model.DistrictBean;
import com.ifwd.fwdhk.model.HomeCareDetailsBean;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.model.savie.SavieAppointmentScheduleBean;
import com.ifwd.fwdhk.model.savie.SavieFinancialNeedAnalysisBean;
import com.ifwd.fwdhk.model.savie.SavieIllustrationBean;
import com.ifwd.fwdhk.model.savie.SaviePolicy;
import com.ifwd.fwdhk.model.savie.SavieRateBean;
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
	public List<SavieRateBean> getSavieRate(String userName, String token,
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
			HomeCareDetailsBean homeCareDetails, UserDetails userDetails,
			String language, String referralCode) {
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
			SavieFinancialNeedAnalysisBean fna) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String upsertAppointment(String userName, String token,
			String language, SavieAppointmentScheduleBean fna) {
		// TODO Auto-generated method stub
		return null;
	}



}
