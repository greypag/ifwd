package com.ifwd.fwdhk.services.impl;

import javax.servlet.http.HttpServletRequest;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.connector.ECommWsConnector;
import com.ifwd.fwdhk.connector.response.savie.SaviePlanDetailsResponse;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.exception.ValidationExceptions;
import com.ifwd.fwdhk.services.SavieOnlineService;
import com.ifwd.fwdhk.util.ClientBrowserUtil;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.DateApi;
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
	public JSONObject getSavieOnlinePlandetails(HttpServletRequest request) throws ValidationExceptions,ECOMMAPIException{
		String insuredAmount = request.getParameter("insuredAmount");
		String dob = request.getParameter("dob");
		String promoCode = request.getParameter("promoCode");
		
		ValidationUtils.validation("insuredAmount", insuredAmount, request);
		ValidationUtils.validation("dob", dob, request);
		//ValidationUtils.validation("promoCode", promoCode, request);
		
		int issueAge = DateApi.getAge(DateApi.formatDate2(dob));
		
		SaviePlanDetailsResponse apiResponse = connector.saviePlanDetails("savie", issueAge, 100-issueAge, insuredAmount, promoCode, null);
		JSONObject jsonObject = new JSONObject();
		if(apiResponse.hasError()){
			throw new ECOMMAPIException(apiResponse.getErrMsgs()[0]);
		}
		else{
			jsonObject.put("planDetails0Rate", apiResponse.getPlanDetails0Rate());
		}
		return jsonObject;
	}
}
