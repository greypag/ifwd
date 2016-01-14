package com.ifwd.fwdhk.services.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.connector.ECommWsConnector;
import com.ifwd.fwdhk.connector.response.savie.SaviePlanDetailsRate;
import com.ifwd.fwdhk.connector.response.savie.SaviePlanDetailsResponse;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.exception.ValidationExceptions;
import com.ifwd.fwdhk.services.SavieOnlineService;
import com.ifwd.fwdhk.util.ClientBrowserUtil;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.HeaderUtil;
import com.ifwd.fwdhk.util.ValidationUtils;
@Service
public class SavieOnlineServiceImpl implements SavieOnlineService {
	private final static Logger logger = LoggerFactory.getLogger(SavieOnlineServiceImpl.class);
	
	@Autowired
	private RestServiceDao restService;
	
	@Autowired
	private CommonUtils commonUtils;
	
	@Autowired 
	protected ECommWsConnector connector;
	
	@Autowired
	protected HeaderUtil headerUtil;
	
	@Autowired
	protected ClientBrowserUtil clientBrowserUtil;

	@Override
	public void getSavieOnlinePlandetails(HttpServletRequest request) throws ECOMMAPIException {
		String insuredAmount = request.getParameter("insuredAmount");
		String dob = request.getParameter("dob");
		String promoCode = request.getParameter("promoCode");
		
		//SaviePlanDetailsResponse apiResponse = connector.saviePlanDetails("savie", issueAge, paymentTerm, premium, referralCode, null);
	}
	
	@Override
	public void plandetailsValidateFormByAjax(HttpServletRequest request) throws ValidationExceptions {
		String insuredAmount = request.getParameter("insuredAmount");
		String dob = request.getParameter("dob");
		String promoCode = request.getParameter("promoCode");
			
		ValidationUtils.validation("insuredAmount", insuredAmount, request);
		ValidationUtils.validation("dob", dob, request);
		ValidationUtils.validation("promoCode", promoCode, request);
	}
}
