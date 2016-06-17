package com.ifwd.fwdhk.services;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.CreatePolicy;
import com.ifwd.fwdhk.model.HomeCareDetailsBean;

public interface GAService {
	
	public CreatePolicy createPolicy(String plan, HomeCareDetailsBean homeCareDetails, HttpServletResponse response, HttpServletRequest request) throws Exception;
	public JSONObject confirmPolicy(String plan, String referenceNo, HttpServletResponse response, HttpServletRequest request) throws Exception;
	public JSONObject SubmitPolicy(String plan, String referenceNo, HttpServletResponse response, HttpServletRequest request, HttpSession session) throws Exception;
	public JSONObject finalizeHomeCarePolicy(String plan, String paymentFail, HttpServletResponse response, HttpServletRequest request, HttpSession session) throws Exception;
	public JSONObject getHomeCareQuote(String plan,HttpServletRequest request,HttpSession session)throws ECOMMAPIException;
}
