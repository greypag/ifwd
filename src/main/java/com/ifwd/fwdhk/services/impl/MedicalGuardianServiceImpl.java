package com.ifwd.fwdhk.services.impl;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.easyhealth.CansurancePlanDetailBean;
import com.ifwd.fwdhk.services.MedicalGuardianService;
import com.ifwd.fwdhk.util.HeaderUtil;

@Service
public class MedicalGuardianServiceImpl implements MedicalGuardianService{

	@Autowired
	private RestServiceDao restService;
	@Autowired
	protected HeaderUtil headerUtil;
	
	@Override
	public JSONObject getPremium(CansurancePlanDetailBean planDetail,
			HttpServletRequest request) throws ECOMMAPIException {

		StringBuffer url = new StringBuffer();
		url.append(UserRestURIConstants.GET_MEDICAL_GUARDIAN_PREMIUM);
		url.append("?dob=");
//		String[] dob = planDetail.getDob().split("-");
//		planDetail.setDob(dob[2]+"-"+dob[1]+"-"+dob[0]);
		url.append(planDetail.getDob());
		url.append("&gender=");
		url.append(planDetail.getGender().equals("0")?"M":"F");
		url.append("&planCode=HCP1");
		url.append("&smoke=");		
		url.append("1".equals(planDetail.getSmoker())?true:false);
		url.append("&referralCode=" + planDetail.getReferralCode());
		final Map<String,String> header = headerUtil.getHeader(request);
		JSONObject jsonObject = new JSONObject();
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,url.toString(), header, jsonObject);

		return responseJsonObj;
	}

}
