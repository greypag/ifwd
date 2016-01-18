package com.ifwd.fwdhk.services;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.exception.ValidationExceptions;
import com.ifwd.fwdhk.model.savieOnline.SaviePlanDetailsBean;

public interface SavieOnlineService {
	public JSONObject getSavieOnlinePlandetails(SaviePlanDetailsBean saviePlanDetails,HttpServletRequest request) throws ECOMMAPIException;
	
}
