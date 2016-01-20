package com.ifwd.fwdhk.services;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import com.ifwd.fwdhk.ajax.request.SaviePlanDetailsGetRequest;
import com.ifwd.fwdhk.exception.ECOMMAPIException;

public interface SavieOnlineService {
	public JSONObject getSavieOnlinePlandetails(SaviePlanDetailsGetRequest saviePlanDetails,HttpServletRequest request) throws ECOMMAPIException;
	public void createSalesIllustrationPdf(HttpServletRequest request) throws Exception;
	
}
