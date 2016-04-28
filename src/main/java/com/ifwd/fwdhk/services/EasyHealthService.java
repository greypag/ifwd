package com.ifwd.fwdhk.services;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import com.ifwd.fwdhk.connector.response.eliteterm.CreateEliteTermPolicyResponse;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.easyhealth.EasyHealthPlanDetailBean;
public interface EasyHealthService {
	public JSONObject getPremium(EasyHealthPlanDetailBean planDetail,HttpServletRequest request) throws ECOMMAPIException;
	public CreateEliteTermPolicyResponse createLifePolicy(HttpServletRequest request,HttpSession session)throws ECOMMAPIException;
	public void putPaymentSession(HttpServletRequest request)throws Exception;
	public void removeSession(HttpServletRequest request);
	public void putPremium(HttpServletRequest request) throws Exception;
	
}
