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

public class SavieCareServiceImpl implements SavieCareService {

	@Override
	public List<SavieServiceCentreBean> getServiceCentre(String userName,
			String token, String language) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SavieRateBean> getRate(String userName, String token,
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
	public CreateSaviePolicy createSavieCarePolicy(String userName,
			String token, HomeCareDetailsBean homeCareDetails,
			UserDetails userDetails, String language, String referralCode) {
		// TODO Auto-generated method stub
		return null;
	}

}
