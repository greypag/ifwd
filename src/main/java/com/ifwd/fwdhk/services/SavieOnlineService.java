package com.ifwd.fwdhk.services;

import javax.servlet.http.HttpServletRequest;
import org.json.simple.JSONObject;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.exception.ValidationExceptions;

public interface SavieOnlineService {
	public JSONObject getSavieOnlinePlandetails(HttpServletRequest request) throws ValidationExceptions,ECOMMAPIException;
	
}
