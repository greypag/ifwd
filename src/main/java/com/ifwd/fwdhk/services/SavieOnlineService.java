package com.ifwd.fwdhk.services;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.ui.Model;

import com.ifwd.fwdhk.connector.response.BaseResponse;
import com.ifwd.fwdhk.connector.response.eliteterm.CreateEliteTermPolicyResponse;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.OptionItemDesc;
import com.ifwd.fwdhk.model.savieOnline.SavieFnaBean;
import com.ifwd.fwdhk.model.savieOnline.SaviePlanDetailsBean;

public interface SavieOnlineService {
	public JSONObject getSavieOnlinePlandetails(SaviePlanDetailsBean saviePlanDetails,HttpServletRequest request) throws ECOMMAPIException;
	public void createSalesIllustrationPdf(HttpServletRequest request) throws Exception;
	public void createApplicationFormPdf(HttpServletRequest request,HttpSession session) throws Exception;
	public JSONObject saveProductFna(SavieFnaBean savieFna,HttpServletRequest request) throws ECOMMAPIException;
	public JSONObject getProductrRecommend(SavieFnaBean savieFna,HttpServletRequest request) throws ECOMMAPIException;
	public JSONObject getFna(HttpServletRequest request) throws ECOMMAPIException;
	public JSONObject getPurchaseHistoryByPlanCode(HttpServletRequest request) throws ECOMMAPIException;
	public CreateEliteTermPolicyResponse createLifePolicy(HttpServletRequest request,HttpSession session)throws ECOMMAPIException;
	public BaseResponse finalizeLifePolicy(HttpServletRequest request,HttpSession session)throws ECOMMAPIException;
	public List<OptionItemDesc> getBranchCode(HttpServletRequest request) throws ECOMMAPIException;
	
}
