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
	public void getSavieOnlinePlandetail(Model model, HttpServletRequest request,HttpServletResponse response,HttpSession httpSession) throws ECOMMAPIException {
		try {
			String planCode = request.getParameter("planCode");
			int issueAge = Integer.valueOf(request.getParameter("issueAge"))+1;
			int paymentTerm = 100-issueAge;
			
			String premium = request.getParameter("premium");
			String referralCode = request.getParameter("referralCode");
			SaviePlanDetailsResponse apiResponse = connector.saviePlanDetails(planCode, issueAge, paymentTerm, premium, referralCode, null);
			
			JSONObject resultJsonObject = new JSONObject();
			if(!apiResponse.hasError()){
				List<SaviePlanDetailsRate> planDetails0Rate = apiResponse.getPlanDetails0Rate();
				List<SaviePlanDetailsRate> planDetails2Rate = apiResponse.getPlanDetails2Rate();
				List<SaviePlanDetailsRate> planDetails3Rate = apiResponse.getPlanDetails3Rate();
				List<SaviePlanDetailsRate> planDetails4Rate = apiResponse.getPlanDetails4Rate();
				
				if(planDetails0Rate !=null && planDetails0Rate.size()>0){
					List<JSONObject> inputTableList = new ArrayList<JSONObject>();
					JSONObject inputTable = new JSONObject();
					inputTable.accumulate("type", planCode);
					inputTable.accumulate("issueAge", issueAge);
					inputTable.accumulate("paymode", "monthly");
					inputTable.accumulate("premium", premium);
					inputTable.accumulate("paymentMode", "Single");
					inputTable.accumulate("paymentTerm", paymentTerm);
					inputTable.accumulate("promoCode", referralCode);
					inputTableList.add(inputTable);
					
					JSONObject planDetailJsonObject = new JSONObject();
					planDetailJsonObject.accumulate("inputTable", inputTableList);
					
					List<JSONObject> yearPlansList = new ArrayList<JSONObject>();
					
					for(int i =0;i<planDetails0Rate.size();i++){
						JSONObject yesrPlan = new JSONObject();
						yesrPlan.accumulate("year", Integer.valueOf(planDetails0Rate.get(i).getType().substring(1)));
						
						List<JSONObject> plansList = new ArrayList<JSONObject>();
						yesrPlan.accumulate("plans", plansList);
						yearPlansList.add(yesrPlan);
					}
					planDetailJsonObject.accumulate("yearPlans", yearPlansList);
					resultJsonObject.accumulate("result", "success");
					resultJsonObject.accumulate("errMsgs", "");
					resultJsonObject.accumulate("salesIllustration", planDetailJsonObject);
				}
				else{
					resultJsonObject.accumulate("result", "fail");
					resultJsonObject.accumulate("errMsgs", "Data exception");
					throw new ECOMMAPIException("Data exception!");
				}
			}
			else{
				resultJsonObject.accumulate("result", "fail");
				resultJsonObject.accumulate("errMsgs", apiResponse.getErrMsgs());
			}
			
			response.setContentType("text/json;charset=utf-8");
			//return data
			try {
				logger.info(resultJsonObject.toString());
				response.getWriter().print(resultJsonObject.toString());
			}catch(Exception e) {
				e.printStackTrace();
			}
		} catch (ECOMMAPIException e) {
			logger.info("SavieServiceImpl getPlanDetails occurs an exception!");
			logger.info(e.getMessage());
			e.printStackTrace();
		}
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
