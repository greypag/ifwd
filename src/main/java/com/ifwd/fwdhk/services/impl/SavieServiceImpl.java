package com.ifwd.fwdhk.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.model.BankBean;
import com.ifwd.fwdhk.model.BankBranchBean;
import com.ifwd.fwdhk.model.DistrictBean;
import com.ifwd.fwdhk.model.savie.OptionItemDesc;
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
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.InitApplicationMessage;

@Service
public class SavieServiceImpl implements SavieService {
	
	
	@Autowired
	private RestServiceDao restService;
	
	@Autowired
	private CommonUtils commonUtils;

	@Override
	public List<SavieServiceCentreBean> getServiceCentre(String userName,
			String token, String language) {
		return null;
	}

	@Override
	public List<SaviePolicyAccountBalanceBean> getSavieRate(String userName, String token,
			String language) {
		return null;
	}

	@Override
	public List<DistrictBean> getDistrict(String userName, String token,
			String language) {
				return null;
	}
	
	
	
	@Override
	public List<BankBean> getBank(String userName, String token, String language) {
		return null;
	}

	@Override
	public List<BankBranchBean> getBankBranch(String userName, String token,
			String language, Integer bankCode) {
		return null;
	}

	@Override
	public SaviePolicy createSaviePolicy(String userName, String token,
			String language, SavieFormApplicationBean application,
			SavieFormSetAppointmentBean appointment,
			SavieFormSignatureBean signature,
			SavieFormDeclarationAuthorizationBean authorization,
			SavieFormDocumentBean documents) {
		return null;
	}

	@Override
	public SavieIllustrationBean getIllustration(String userName, String token,
			String language) {
/*		getSavieIllustration	GET	/savie/salesIllustrations	"QUERY STRING

		product [string:10][M],
		referralCode : [string:16][O],
		issueAge:[int][M],
		paymentTerm: [int][M],
		premium: [float][M],
		"	"{
		  ""errMsgs"": null,
		  ""salesIllustration0Rate"": [
		    {
		      ""seq"": int,
		      ""policyYear"": int,
		      ""policyMonth"": int`,
		      ""policyAccMonth"": int,
		      ""premium"": float,
		      ""totalPremium"": float,
		      ""principal"": float,
		      ""interestedRate"": float,
		      ""monthlyInterestedRate"": float,
		      ""accInterest"": float,
		      ""accountEOP"": float,
		      ""age"": int,
		      ""guranteedSurrenderBenefit"": float,
		      ""guranteedDeathBenefit"": float,
		      ""nonGuaranteeRate"": float,
		      ""type"": String
		    }, ...
		   ],
		  ""salesIllustration2Rate"": [
		    {
		      ""seq"": int,
		      ""policyYear"": int,
		      ""policyMonth"": int`,
		      ""policyAccMonth"": int,
		      ""premium"": float,
		      ""totalPremium"": float,
		      ""principal"": float,
		      ""interestedRate"": float,
		      ""monthlyInterestedRate"": float,
		      ""accInterest"": float,
		      ""accountEOP"": float,
		      ""age"": int,
		      ""guranteedSurrenderBenefit"": float,
		      ""guranteedDeathBenefit"": float,
		      ""nonGuaranteeRate"": float,
		      ""type"": String
		    }, ...
		   ],
		  ""salesIllustration3Rate"": [
		    {
		      ""seq"": int,
		      ""policyYear"": int,
		      ""policyMonth"": int`,
		      ""policyAccMonth"": int,
		      ""premium"": float,
		      ""totalPremium"": float,
		      ""principal"": float,
		      ""interestedRate"": float,
		      ""monthlyInterestedRate"": float,
		      ""accInterest"": float,
		      ""accountEOP"": float,
		      ""age"": int,
		      ""guranteedSurrenderBenefit"": float,
		      ""guranteedDeathBenefit"": float,
		      ""nonGuaranteeRate"": float,
		      ""type"": String
		    }, ...
		   ],
		  ""salesIllustration4Rate"": [
		    {
		      ""seq"": int,
		      ""policyYear"": int,
		      ""policyMonth"": int`,
		      ""policyAccMonth"": int,
		      ""premium"": float,
		      ""totalPremium"": float,
		      ""principal"": float,
		      ""interestedRate"": float,
		      ""monthlyInterestedRate"": float,
		      ""accInterest"": float,
		      ""accountEOP"": float,
		      ""age"": int,
		      ""guranteedSurrenderBenefit"": float,
		      ""guranteedDeathBenefit"": float,
		      ""nonGuaranteeRate"": float,
		      ""type"": String
		    }, ...
		   ],
		  ""premium"": float
		  ""paymentTerm"": int,
		  ""issueAge"": int,
		  ""referralCode"": String


		}"	/savie/salesIllustration?product=savie&issueAge=19&paymentTerm=82&premium=1000&referralCode=nathaniel.kw.cheung@fwd.com	"{
		  ""errMsgs"": null,
		  ""salesIllustration0Rate"": [
		    {
		      ""seq"": 47,
		      ""policyYear"": 3,
		      ""policyMonth"": 11,
		      ""policyAccMonth"": 47,
		      ""premium"": 0,
		      ""totalPremium"": 1000,
		      ""principal"": 1103.248,
		      ""interestedRate"": 0,
		      ""monthlyInterestedRate"": 0,
		      ""accInterest"": 0,
		      ""accountEOP"": 1103.248,
		      ""age"": 22,
		      ""guranteedSurrenderBenefit"": 1103.248,
		      ""guranteedDeathBenefit"": 2103.248,
		      ""nonGuaranteeRate"": 0,
		      ""type"": ""Y4""
		    },
		    {
		      ""seq"": 59,
		      ""policyYear"": 4,
		      ""policyMonth"": 11,
		      ""policyAccMonth"": 59,
		      ""premium"": 0,
		      ""totalPremium"": 1000,
		      ""principal"": 1103.248,
		      ""interestedRate"": 0,
		      ""monthlyInterestedRate"": 0,
		      ""accInterest"": 0,
		      ""accountEOP"": 1103.248,
		      ""age"": 23,
		      ""guranteedSurrenderBenefit"": 1103.248,
		      ""guranteedDeathBenefit"": 2103.248,
		      ""nonGuaranteeRate"": 0,
		      ""type"": ""Y5""
		    },
		    {
		      ""seq"": 119,
		      ""policyYear"": 9,
		      ""policyMonth"": 11,
		      ""policyAccMonth"": 119,
		      ""premium"": 0,
		      ""totalPremium"": 1000,
		      ""principal"": 1103.248,
		      ""interestedRate"": 0,
		      ""monthlyInterestedRate"": 0,
		      ""accInterest"": 0,
		      ""accountEOP"": 1103.248,
		      ""age"": 28,
		      ""guranteedSurrenderBenefit"": 1103.248,
		      ""guranteedDeathBenefit"": 2103.248,
		      ""nonGuaranteeRate"": 0,
		      ""type"": ""Y10""
		    },
		    {
		      ""seq"": 239,
		      ""policyYear"": 19,
		      ""policyMonth"": 11,
		      ""policyAccMonth"": 239,
		      ""premium"": 0,
		      ""totalPremium"": 1000,
		      ""principal"": 1103.248,
		      ""interestedRate"": 0,
		      ""monthlyInterestedRate"": 0,
		      ""accInterest"": 0,
		      ""accountEOP"": 1103.248,
		      ""age"": 38,
		      ""guranteedSurrenderBenefit"": 1103.248,
		      ""guranteedDeathBenefit"": 2103.248,
		      ""nonGuaranteeRate"": 0,
		      ""type"": ""Y15""
		    },
		    {
		      ""seq"": 299,
		      ""policyYear"": 24,
		      ""policyMonth"": 11,
		      ""policyAccMonth"": 299,
		      ""premium"": 0,
		      ""totalPremium"": 1000,
		      ""principal"": 1103.248,
		      ""interestedRate"": 0,
		      ""monthlyInterestedRate"": 0,
		      ""accInterest"": 0,
		      ""accountEOP"": 1103.248,
		      ""age"": 43,
		      ""guranteedSurrenderBenefit"": 1103.248,
		      ""guranteedDeathBenefit"": 2103.248,
		      ""nonGuaranteeRate"": 0,
		      ""type"": ""Y20""
		    },
		    {
		      ""seq"": 359,
		      ""policyYear"": 29,
		      ""policyMonth"": 11,
		      ""policyAccMonth"": 359,
		      ""premium"": 0,
		      ""totalPremium"": 1000,
		      ""principal"": 1103.248,
		      ""interestedRate"": 0,
		      ""monthlyInterestedRate"": 0,
		      ""accInterest"": 0,
		      ""accountEOP"": 1103.248,
		      ""age"": 48,
		      ""guranteedSurrenderBenefit"": 1103.248,
		      ""guranteedDeathBenefit"": 2103.248,
		      ""nonGuaranteeRate"": 0,
		      ""type"": ""Y25""
		    },
		    {
		      ""seq"": 439,
		      ""policyYear"": 36,
		      ""policyMonth"": 7,
		      ""policyAccMonth"": 439,
		      ""premium"": 0,
		      ""totalPremium"": 1000,
		      ""principal"": 1103.248,
		      ""interestedRate"": 0,
		      ""monthlyInterestedRate"": 0,
		      ""accInterest"": 0,
		      ""accountEOP"": 1103.248,
		      ""age"": 55,
		      ""guranteedSurrenderBenefit"": 1103.248,
		      ""guranteedDeathBenefit"": 2103.248,
		      ""nonGuaranteeRate"": 0,
		      ""type"": ""Y30""
		    },
		    {
		      ""seq"": 983,
		      ""policyYear"": 81,
		      ""policyMonth"": 11,
		      ""policyAccMonth"": 983,
		      ""premium"": 0,
		      ""totalPremium"": 1000,
		      ""principal"": 1103.248,
		      ""interestedRate"": 0,
		      ""monthlyInterestedRate"": 0,
		      ""accInterest"": 0,
		      ""accountEOP"": 1103.248,
		      ""age"": 100,
		      ""guranteedSurrenderBenefit"": 1103.248,
		      ""guranteedDeathBenefit"": 2103.248,
		      ""nonGuaranteeRate"": 0,
		      ""type"": ""A100""
		    }
		  ],
		  ""salesIllustration2Rate"": [
		    {
		      ""seq"": 47,
		      ""policyYear"": 3,
		      ""policyMonth"": 11,
		      ""policyAccMonth"": 47,
		      ""premium"": 0,
		      ""totalPremium"": 1000,
		      ""principal"": 1103.248,
		      ""interestedRate"": 0.02,
		      ""monthlyInterestedRate"": 0.0016666666,
		      ""accInterest"": 0,
		      ""accountEOP"": 1125.313,
		      ""age"": 22,
		      ""guranteedSurrenderBenefit"": 1125.313,
		      ""guranteedDeathBenefit"": 2125.313,
		      ""nonGuaranteeRate"": 0,
		      ""type"": ""Y4""
		    },
		    {
		      ""seq"": 59,
		      ""policyYear"": 4,
		      ""policyMonth"": 11,
		      ""policyAccMonth"": 59,
		      ""premium"": 0,
		      ""totalPremium"": 1000,
		      ""principal"": 1125.313,
		      ""interestedRate"": 0.02,
		      ""monthlyInterestedRate"": 0.0016666666,
		      ""accInterest"": 0,
		      ""accountEOP"": 1147.8192,
		      ""age"": 23,
		      ""guranteedSurrenderBenefit"": 1147.8192,
		      ""guranteedDeathBenefit"": 2147.8193,
		      ""nonGuaranteeRate"": 0,
		      ""type"": ""Y5""
		    },
		    {
		      ""seq"": 119,
		      ""policyYear"": 9,
		      ""policyMonth"": 11,
		      ""policyAccMonth"": 119,
		      ""premium"": 0,
		      ""totalPremium"": 1000,
		      ""principal"": 1242.4364,
		      ""interestedRate"": 0.02,
		      ""monthlyInterestedRate"": 0.0016666666,
		      ""accInterest"": 0,
		      ""accountEOP"": 1267.2852,
		      ""age"": 28,
		      ""guranteedSurrenderBenefit"": 1267.2852,
		      ""guranteedDeathBenefit"": 2267.2852,
		      ""nonGuaranteeRate"": 0,
		      ""type"": ""Y10""
		    },
		    {
		      ""seq"": 239,
		      ""policyYear"": 19,
		      ""policyMonth"": 11,
		      ""policyAccMonth"": 239,
		      ""premium"": 0,
		      ""totalPremium"": 1000,
		      ""principal"": 1514.5232,
		      ""interestedRate"": 0.02,
		      ""monthlyInterestedRate"": 0.0016666666,
		      ""accInterest"": 0,
		      ""accountEOP"": 1544.8136,
		      ""age"": 38,
		      ""guranteedSurrenderBenefit"": 1544.8136,
		      ""guranteedDeathBenefit"": 2544.8135,
		      ""nonGuaranteeRate"": 0,
		      ""type"": ""Y15""
		    },
		    {
		      ""seq"": 299,
		      ""policyYear"": 24,
		      ""policyMonth"": 11,
		      ""policyAccMonth"": 299,
		      ""premium"": 0,
		      ""totalPremium"": 1000,
		      ""principal"": 1672.1559,
		      ""interestedRate"": 0.02,
		      ""monthlyInterestedRate"": 0.0016666666,
		      ""accInterest"": 0,
		      ""accountEOP"": 1705.599,
		      ""age"": 43,
		      ""guranteedSurrenderBenefit"": 1705.599,
		      ""guranteedDeathBenefit"": 2705.599,
		      ""nonGuaranteeRate"": 0,
		      ""type"": ""Y20""
		    },
		    {
		      ""seq"": 359,
		      ""policyYear"": 29,
		      ""policyMonth"": 11,
		      ""policyAccMonth"": 359,
		      ""premium"": 0,
		      ""totalPremium"": 1000,
		      ""principal"": 1846.1952,
		      ""interestedRate"": 0.02,
		      ""monthlyInterestedRate"": 0.0016666666,
		      ""accInterest"": 0,
		      ""accountEOP"": 1883.1191,
		      ""age"": 48,
		      ""guranteedSurrenderBenefit"": 1883.1191,
		      ""guranteedDeathBenefit"": 2883.1191,
		      ""nonGuaranteeRate"": 0,
		      ""type"": ""Y25""
		    },
		    {
		      ""seq"": 439,
		      ""policyYear"": 36,
		      ""policyMonth"": 7,
		      ""policyAccMonth"": 439,
		      ""premium"": 0,
		      ""totalPremium"": 1000,
		      ""principal"": 2120.698,
		      ""interestedRate"": 0.02,
		      ""monthlyInterestedRate"": 0.0016666666,
		      ""accInterest"": 28.275972,
		      ""accountEOP"": 2148.9739,
		      ""age"": 55,
		      ""guranteedSurrenderBenefit"": 2148.9739,
		      ""guranteedDeathBenefit"": 3148.9739,
		      ""nonGuaranteeRate"": 0,
		      ""type"": ""Y30""
		    },
		    {
		      ""seq"": 983,
		      ""policyYear"": 81,
		      ""policyMonth"": 11,
		      ""policyAccMonth"": 983,
		      ""premium"": 0,
		      ""totalPremium"": 1000,
		      ""principal"": 5169.9507,
		      ""interestedRate"": 0.02,
		      ""monthlyInterestedRate"": 0.0016666666,
		      ""accInterest"": 103.39901,
		      ""accountEOP"": 5273.3496,
		      ""age"": 100,
		      ""guranteedSurrenderBenefit"": 5273.3496,
		      ""guranteedDeathBenefit"": 6273.3496,
		      ""nonGuaranteeRate"": 0,
		      ""type"": ""A100""
		    }
		  ],
		  ""salesIllustration3Rate"": [
		    {
		      ""seq"": 47,
		      ""policyYear"": 3,
		      ""policyMonth"": 11,
		      ""policyAccMonth"": 47,
		      ""premium"": 0,
		      ""totalPremium"": 1000,
		      ""principal"": 1103.248,
		      ""interestedRate"": 0.03,
		      ""monthlyInterestedRate"": 0.0025,
		      ""accInterest"": 0,
		      ""accountEOP"": 1136.3455,
		      ""age"": 22,
		      ""guranteedSurrenderBenefit"": 1136.3455,
		      ""guranteedDeathBenefit"": 2136.3455,
		      ""nonGuaranteeRate"": 0,
		      ""type"": ""Y4""
		    },
		    {
		      ""seq"": 59,
		      ""policyYear"": 4,
		      ""policyMonth"": 11,
		      ""policyAccMonth"": 59,
		      ""premium"": 0,
		      ""totalPremium"": 1000,
		      ""principal"": 1136.3455,
		      ""interestedRate"": 0.03,
		      ""monthlyInterestedRate"": 0.0025,
		      ""accInterest"": 0,
		      ""accountEOP"": 1170.4358,
		      ""age"": 23,
		      ""guranteedSurrenderBenefit"": 1170.4358,
		      ""guranteedDeathBenefit"": 2170.4358,
		      ""nonGuaranteeRate"": 0,
		      ""type"": ""Y5""
		    },
		    {
		      ""seq"": 119,
		      ""policyYear"": 9,
		      ""policyMonth"": 11,
		      ""policyAccMonth"": 119,
		      ""premium"": 0,
		      ""totalPremium"": 1000,
		      ""principal"": 1317.3358,
		      ""interestedRate"": 0.03,
		      ""monthlyInterestedRate"": 0.0025,
		      ""accInterest"": 0,
		      ""accountEOP"": 1356.8558,
		      ""age"": 28,
		      ""guranteedSurrenderBenefit"": 1356.8558,
		      ""guranteedDeathBenefit"": 2356.856,
		      ""nonGuaranteeRate"": 0,
		      ""type"": ""Y10""
		    },
		    {
		      ""seq"": 239,
		      ""policyYear"": 19,
		      ""policyMonth"": 11,
		      ""policyAccMonth"": 239,
		      ""premium"": 0,
		      ""totalPremium"": 1000,
		      ""principal"": 1770.3893,
		      ""interestedRate"": 0.03,
		      ""monthlyInterestedRate"": 0.0025,
		      ""accInterest"": 0,
		      ""accountEOP"": 1823.501,
		      ""age"": 38,
		      ""guranteedSurrenderBenefit"": 1823.501,
		      ""guranteedDeathBenefit"": 2823.501,
		      ""nonGuaranteeRate"": 0,
		      ""type"": ""Y15""
		    },
		    {
		      ""seq"": 299,
		      ""policyYear"": 24,
		      ""policyMonth"": 11,
		      ""policyAccMonth"": 299,
		      ""premium"": 0,
		      ""totalPremium"": 1000,
		      ""principal"": 2052.3665,
		      ""interestedRate"": 0.03,
		      ""monthlyInterestedRate"": 0.0025,
		      ""accInterest"": 0,
		      ""accountEOP"": 2113.9375,
		      ""age"": 43,
		      ""guranteedSurrenderBenefit"": 2113.9375,
		      ""guranteedDeathBenefit"": 3113.9375,
		      ""nonGuaranteeRate"": 0,
		      ""type"": ""Y20""
		    },
		    {
		      ""seq"": 359,
		      ""policyYear"": 29,
		      ""policyMonth"": 11,
		      ""policyAccMonth"": 359,
		      ""premium"": 0,
		      ""totalPremium"": 1000,
		      ""principal"": 2379.2551,
		      ""interestedRate"": 0.03,
		      ""monthlyInterestedRate"": 0.0025,
		      ""accInterest"": 0,
		      ""accountEOP"": 2450.6328,
		      ""age"": 48,
		      ""guranteedSurrenderBenefit"": 2450.6328,
		      ""guranteedDeathBenefit"": 3450.6328,
		      ""nonGuaranteeRate"": 0,
		      ""type"": ""Y25""
		    },
		    {
		      ""seq"": 439,
		      ""policyYear"": 36,
		      ""policyMonth"": 7,
		      ""policyAccMonth"": 439,
		      ""premium"": 0,
		      ""totalPremium"": 1000,
		      ""principal"": 2926.184,
		      ""interestedRate"": 0.03,
		      ""monthlyInterestedRate"": 0.0025,
		      ""accInterest"": 58.52368,
		      ""accountEOP"": 2984.7078,
		      ""age"": 55,
		      ""guranteedSurrenderBenefit"": 2984.7078,
		      ""guranteedDeathBenefit"": 3984.7078,
		      ""nonGuaranteeRate"": 0,
		      ""type"": ""Y30""
		    },
		    {
		      ""seq"": 983,
		      ""policyYear"": 81,
		      ""policyMonth"": 11,
		      ""policyAccMonth"": 983,
		      ""premium"": 0,
		      ""totalPremium"": 1000,
		      ""principal"": 11065.648,
		      ""interestedRate"": 0.03,
		      ""monthlyInterestedRate"": 0.0025,
		      ""accInterest"": 331.96945,
		      ""accountEOP"": 11397.618,
		      ""age"": 100,
		      ""guranteedSurrenderBenefit"": 11397.618,
		      ""guranteedDeathBenefit"": 12397.618,
		      ""nonGuaranteeRate"": 0,
		      ""type"": ""A100""
		    }
		  ],
		  ""salesIllustration4Rate"": [
		    {
		      ""seq"": 47,
		      ""policyYear"": 3,
		      ""policyMonth"": 11,
		      ""policyAccMonth"": 47,
		      ""premium"": 0,
		      ""totalPremium"": 1000,
		      ""principal"": 1103.248,
		      ""interestedRate"": 0.04,
		      ""monthlyInterestedRate"": 0.0033333332,
		      ""accInterest"": 0,
		      ""accountEOP"": 1147.3779,
		      ""age"": 22,
		      ""guranteedSurrenderBenefit"": 1147.3779,
		      ""guranteedDeathBenefit"": 2147.378,
		      ""nonGuaranteeRate"": 0,
		      ""type"": ""Y4""
		    },
		    {
		      ""seq"": 59,
		      ""policyYear"": 4,
		      ""policyMonth"": 11,
		      ""policyAccMonth"": 59,
		      ""premium"": 0,
		      ""totalPremium"": 1000,
		      ""principal"": 1147.3779,
		      ""interestedRate"": 0.04,
		      ""monthlyInterestedRate"": 0.0033333332,
		      ""accInterest"": 0,
		      ""accountEOP"": 1193.2731,
		      ""age"": 23,
		      ""guranteedSurrenderBenefit"": 1193.2731,
		      ""guranteedDeathBenefit"": 2193.273,
		      ""nonGuaranteeRate"": 0,
		      ""type"": ""Y5""
		    },
		    {
		      ""seq"": 119,
		      ""policyYear"": 9,
		      ""policyMonth"": 11,
		      ""policyAccMonth"": 119,
		      ""premium"": 0,
		      ""totalPremium"": 1000,
		      ""principal"": 1395.9607,
		      ""interestedRate"": 0.04,
		      ""monthlyInterestedRate"": 0.0033333332,
		      ""accInterest"": 0,
		      ""accountEOP"": 1451.7991,
		      ""age"": 28,
		      ""guranteedSurrenderBenefit"": 1451.7991,
		      ""guranteedDeathBenefit"": 2451.799,
		      ""nonGuaranteeRate"": 0,
		      ""type"": ""Y10""
		    },
		    {
		      ""seq"": 239,
		      ""policyYear"": 19,
		      ""policyMonth"": 11,
		      ""policyAccMonth"": 239,
		      ""premium"": 0,
		      ""totalPremium"": 1000,
		      ""principal"": 2066.3628,
		      ""interestedRate"": 0.04,
		      ""monthlyInterestedRate"": 0.0033333332,
		      ""accInterest"": 0,
		      ""accountEOP"": 2149.0173,
		      ""age"": 38,
		      ""guranteedSurrenderBenefit"": 2149.0173,
		      ""guranteedDeathBenefit"": 3149.0173,
		      ""nonGuaranteeRate"": 0,
		      ""type"": ""Y15""
		    },
		    {
		      ""seq"": 299,
		      ""policyYear"": 24,
		      ""policyMonth"": 11,
		      ""policyAccMonth"": 299,
		      ""premium"": 0,
		      ""totalPremium"": 1000,
		      ""principal"": 2514.0464,
		      ""interestedRate"": 0.04,
		      ""monthlyInterestedRate"": 0.0033333332,
		      ""accInterest"": 0,
		      ""accountEOP"": 2614.6082,
		      ""age"": 43,
		      ""guranteedSurrenderBenefit"": 2614.6082,
		      ""guranteedDeathBenefit"": 3614.6082,
		      ""nonGuaranteeRate"": 0,
		      ""type"": ""Y20""
		    },
		    {
		      ""seq"": 359,
		      ""policyYear"": 29,
		      ""policyMonth"": 11,
		      ""policyAccMonth"": 359,
		      ""premium"": 0,
		      ""totalPremium"": 1000,
		      ""principal"": 3058.7214,
		      ""interestedRate"": 0.04,
		      ""monthlyInterestedRate"": 0.0033333332,
		      ""accInterest"": 0,
		      ""accountEOP"": 3181.0703,
		      ""age"": 48,
		      ""guranteedSurrenderBenefit"": 3181.0703,
		      ""guranteedDeathBenefit"": 4181.0703,
		      ""nonGuaranteeRate"": 0,
		      ""type"": ""Y25""
		    },
		    {
		      ""seq"": 439,
		      ""policyYear"": 36,
		      ""policyMonth"": 7,
		      ""policyAccMonth"": 439,
		      ""premium"": 0,
		      ""totalPremium"": 1000,
		      ""principal"": 4025.0686,
		      ""interestedRate"": 0.04,
		      ""monthlyInterestedRate"": 0.0033333332,
		      ""accInterest"": 107.33515,
		      ""accountEOP"": 4132.404,
		      ""age"": 55,
		      ""guranteedSurrenderBenefit"": 4132.404,
		      ""guranteedDeathBenefit"": 5132.404,
		      ""nonGuaranteeRate"": 0,
		      ""type"": ""Y30""
		    },
		    {
		      ""seq"": 983,
		      ""policyYear"": 81,
		      ""policyMonth"": 11,
		      ""policyAccMonth"": 983,
		      ""premium"": 0,
		      ""totalPremium"": 1000,
		      ""principal"": 23511.129,
		      ""interestedRate"": 0.04,
		      ""monthlyInterestedRate"": 0.0033333332,
		      ""accInterest"": 940.44507,
		      ""accountEOP"": 24451.574,
		      ""age"": 100,
		      ""guranteedSurrenderBenefit"": 24451.574,
		      ""guranteedDeathBenefit"": 25451.574,
		      ""nonGuaranteeRate"": 0,
		      ""type"": ""A100""
		    }
		  ],
		  ""premium"": 1000,
		  ""paymentTerm"": 82,
		  ""issueAge"": 19,
		  ""referralCode"": ""nathaniel.kw.cheung@fwd.com""
		}"												

		
		*/
		return null;
	}

	@Override
	public String upsertFNA(String userName, String token, String language,
			SavieFormFNABean fna) {
		return null;
	}

	@Override
	public String upsertApplication(String userName, String token,
			String language, SavieFormApplicationBean application) {
		return null;
	}

	@Override
	public String upsertAppointment(String userName, String token,
			String language, SavieFormSetAppointmentBean appointment) {
		return null;
	}

	@Override
	public String upsertSignature(String userName, String token,
			String language, SavieFormSignatureBean signature) {
		return null;
	}

	@Override
	public String upsertDeclarationAuthorization(String userName, String token,
			String language, SavieFormDeclarationAuthorizationBean authorization) {
		return null;
	}

	@Override
	public String upsertDocument(String userName, String token,
			String language, SavieFormDocumentBean documents) {
/*
		40		Savie	ecommerce portal	ecommerce ws	uploadDocument	PUT	/savie/documents	"{
		   documentType: [string:16][M] (either hkId, passport, addressProof),
		    fileType: [string: 8][M],
		    fileContent: [string] (in base64)
		}"															
*/
		
		return null;
	}

	@Override
	public List<OptionItemDesc> getMaritalStatus(String language) {
		
		if(language.equalsIgnoreCase("EN"))
		{
			if(InitApplicationMessage.maritalStatusesEN!=null)
			{
				return InitApplicationMessage.maritalStatusesEN;
			}
			else
			{
				InitApplicationMessage.maritalStatusesEN=commonUtils.getOptionItemDescList("maritalStatuses",language);
				return InitApplicationMessage.maritalStatusesEN;
			}			
		}
		else
		{
			if(InitApplicationMessage.maritalStatusesCN!=null)
			{
				return InitApplicationMessage.maritalStatusesCN;
			}
			else
			{
				InitApplicationMessage.maritalStatusesCN=commonUtils.getOptionItemDescList("maritalStatuses",language);
				return InitApplicationMessage.maritalStatusesCN;
			}
		}
		
		
		//return commonUtils.getOptionItemDescList("maritalStatuses",language);
	}

	@Override
	public List<OptionItemDesc> getSavieDistrict(String language) {
		
		if(language.equalsIgnoreCase("EN"))
		{
			if(InitApplicationMessage.savieDistrictEN!=null)
			{
				return InitApplicationMessage.savieDistrictEN;
			}
			else
			{
				InitApplicationMessage.savieDistrictEN=commonUtils.getOptionItemDescList("savieDistrict",language);
				return InitApplicationMessage.savieDistrictEN;
			}
		}
		else
		{
			if(InitApplicationMessage.savieDistrictCN!=null)
			{
				return InitApplicationMessage.savieDistrictCN;
			}
			else
			{
				InitApplicationMessage.savieDistrictCN=commonUtils.getOptionItemDescList("savieDistrict",language);
				return InitApplicationMessage.savieDistrictCN;
			}
			
		}
		
		//return commonUtils.getOptionItemDescList("savieDistrict",language);
	}

	@Override
	public List<OptionItemDesc> getEmploymentStatus(String language) {
		
		if(language.equalsIgnoreCase("EN"))
		{
			if(InitApplicationMessage.employmentStatusEN!=null)
			{
				return InitApplicationMessage.employmentStatusEN;
			}
			else
			{
				InitApplicationMessage.employmentStatusEN=commonUtils.getOptionItemDescList("employmentStatus",language);
				return InitApplicationMessage.employmentStatusEN;
			}
		}
		else
		{
			if(InitApplicationMessage.employmentStatusCN!=null)
			{
				return InitApplicationMessage.employmentStatusCN;
			}
			else
			{
				InitApplicationMessage.employmentStatusCN=commonUtils.getOptionItemDescList("employmentStatus",language);
				return InitApplicationMessage.employmentStatusCN;
			}
			
		}
		
		//return commonUtils.getOptionItemDescList("employmentStatus",language);
	}

	@Override
	public List<OptionItemDesc> getNationality(String language) {
		if(language.equalsIgnoreCase("EN"))
		{
			if(InitApplicationMessage.nationalityEN!=null)
			{
				return InitApplicationMessage.nationalityEN;
			}
			else
			{
				InitApplicationMessage.nationalityEN=commonUtils.getOptionItemDescList("nationality",language);
				return InitApplicationMessage.nationalityEN;
			}
		}
		else
		{
			if(InitApplicationMessage.nationalityCN!=null)
			{
				return InitApplicationMessage.nationalityCN;
			}
			else
			{
				InitApplicationMessage.nationalityCN=commonUtils.getOptionItemDescList("employmentStatus",language);
				return InitApplicationMessage.nationalityCN;
			}			
		}
		//return commonUtils.getOptionItemDescList("nationality",language);
	}

	@Override
	public List<OptionItemDesc> getNatureOfBusiness(String language) {
		if(language.equalsIgnoreCase("EN"))
		{
			if(InitApplicationMessage.natureOfBusinessEN!=null)
			{
				return InitApplicationMessage.natureOfBusinessEN;
			}
			else
			{
				InitApplicationMessage.natureOfBusinessEN=commonUtils.getOptionItemDescList("natureOfBusiness",language);
				return InitApplicationMessage.natureOfBusinessEN;
			}
		}
		else
		{
			if(InitApplicationMessage.natureOfBusinessCN!=null)
			{
				return InitApplicationMessage.natureOfBusinessCN;
			}
			else
			{
				InitApplicationMessage.natureOfBusinessCN=commonUtils.getOptionItemDescList("natureOfBusiness",language);
				return InitApplicationMessage.natureOfBusinessCN;
			}			
		}
		//return commonUtils.getOptionItemDescList("natureOfBusiness",language);
	}

	@Override
	public List<OptionItemDesc> getPlaceOfBirth(String language) {
		if(language.equalsIgnoreCase("EN"))
		{
			if(InitApplicationMessage.placeOfBirthEN!=null)
			{
				return InitApplicationMessage.placeOfBirthEN;
			}
			else
			{
				InitApplicationMessage.placeOfBirthEN=commonUtils.getOptionItemDescList("placeOfBirth",language);
				return InitApplicationMessage.placeOfBirthEN;
			}
		}
		else
		{
			if(InitApplicationMessage.placeOfBirthCN!=null)
			{
				return InitApplicationMessage.placeOfBirthCN;
			}
			else
			{
				InitApplicationMessage.placeOfBirthCN=commonUtils.getOptionItemDescList("placeOfBirth",language);
				return InitApplicationMessage.placeOfBirthCN;
			}			
		}
		//return commonUtils.getOptionItemDescList("placeOfBirth",language);
	}

	@Override
	public List<OptionItemDesc> getMonthlyPersonalIncome(String language) {
		if(language.equalsIgnoreCase("EN"))
		{
			if(InitApplicationMessage.monthlyPersonalIncomeEN!=null)
			{
				return InitApplicationMessage.monthlyPersonalIncomeEN;
			}
			else
			{
				InitApplicationMessage.monthlyPersonalIncomeEN=commonUtils.getOptionItemDescList("monthlyPersonalIncome",language);
				return InitApplicationMessage.monthlyPersonalIncomeEN;
			}
		}
		else
		{
			if(InitApplicationMessage.monthlyPersonalIncomeCN!=null)
			{
				return InitApplicationMessage.monthlyPersonalIncomeCN;
			}
			else
			{
				InitApplicationMessage.monthlyPersonalIncomeCN=commonUtils.getOptionItemDescList("monthlyPersonalIncome",language);
				return InitApplicationMessage.monthlyPersonalIncomeCN;
			}			
		}
		//return commonUtils.getOptionItemDescList("monthlyPersonalIncome",language);
	}

	@Override
	public List<OptionItemDesc> getSavieBeneficiaryRelationship(String language) {
		if(language.equalsIgnoreCase("EN"))
		{
			if(InitApplicationMessage.savieBeneficiaryRelationshipEN!=null)
			{
				return InitApplicationMessage.savieBeneficiaryRelationshipEN;
			}
			else
			{
				InitApplicationMessage.savieBeneficiaryRelationshipEN=commonUtils.getOptionItemDescList("savieBeneficiaryRelationship",language);
				return InitApplicationMessage.savieBeneficiaryRelationshipEN;
			}
		}
		else
		{
			if(InitApplicationMessage.savieBeneficiaryRelationshipCN!=null)
			{
				return InitApplicationMessage.savieBeneficiaryRelationshipCN;
			}
			else
			{
				InitApplicationMessage.savieBeneficiaryRelationshipCN=commonUtils.getOptionItemDescList("savieBeneficiaryRelationship",language);
				return InitApplicationMessage.savieBeneficiaryRelationshipCN;
			}			
		}
		//return commonUtils.getOptionItemDescList("savieBeneficiaryRelationship",language);
	}

	@Override
	public List<OptionItemDesc> getOccupation(String language) {
			if(language.equalsIgnoreCase("EN"))
			{
				if(InitApplicationMessage.occupationEN!=null)
				{
					return InitApplicationMessage.occupationEN;
				}
				else
				{
					InitApplicationMessage.occupationEN=commonUtils.getOptionItemDescList("occupation",language);
					return InitApplicationMessage.occupationEN;
				}
			}
			else
			{
				if(InitApplicationMessage.occupationCN!=null)
				{
					return InitApplicationMessage.occupationCN;
				}
				else
				{
					InitApplicationMessage.occupationCN=commonUtils.getOptionItemDescList("occupation",language);
					return InitApplicationMessage.occupationCN;
				}			
			}
		//return commonUtils.getOptionItemDescList("occupation",language);
	}
}
