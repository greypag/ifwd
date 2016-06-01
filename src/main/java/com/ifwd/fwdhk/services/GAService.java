package com.ifwd.fwdhk.services;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.ifwd.fwdhk.model.CreatePolicy;
import com.ifwd.fwdhk.model.HomeCareDetailsBean;

public interface GAService {
	
	public CreatePolicy createPolicy(HomeCareDetailsBean homeCareDetails, HttpServletResponse response, HttpServletRequest request) throws Exception;
	public JSONObject confirmPolicy(CreatePolicy createPolicy, HttpServletResponse response, HttpServletRequest request) throws Exception;
}
