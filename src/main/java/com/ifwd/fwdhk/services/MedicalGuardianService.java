package com.ifwd.fwdhk.services;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.easyhealth.EasyHealthPlanDetailBean;

public interface MedicalGuardianService {
	public JSONObject getPremium(EasyHealthPlanDetailBean planDetail,HttpServletRequest request) throws ECOMMAPIException;
}
