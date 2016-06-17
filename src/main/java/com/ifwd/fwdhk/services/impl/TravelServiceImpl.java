package com.ifwd.fwdhk.services.impl;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.services.TravelService;
import com.ifwd.fwdhk.util.JsonUtils;
import com.ifwd.fwdhk.util.Methods;
import com.ifwd.fwdhk.util.WebServiceUtils;

@Service
public class TravelServiceImpl implements TravelService {
	private final static Logger logger = LoggerFactory.getLogger(TravelServiceImpl.class);
	
	@Autowired
	private RestServiceDao restService;
	
	public JSONObject finalizeTravelCarePolicy(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		String creditCardNo = (String)session.getAttribute("creditCardNo");
		String dueAmount = (String)session.getAttribute("dueAmount");
		
		JSONObject responsObject = new JSONObject();
		JSONObject parameters = new JSONObject();
		parameters.put("referenceNo", session.getAttribute("finalizeReferenceNo"));
		parameters.put("transactionNumber", session.getAttribute("transNo"));
		parameters.put("transactionDate", session.getAttribute("transactionDate"));
		parameters.put("paymentFail", "0");
		if("0.00".equals(dueAmount) && creditCardNo == null) {
			creditCardNo = "0000000000000000";
			parameters.put("expiryDate", "122030");
		} else {
			if(session.getAttribute("creditCardNo") !=null && session.getAttribute("creditCardNo") != ""){
				creditCardNo = Methods.decryptStr((String)session.getAttribute("creditCardNo")); 
			}
			parameters.put("expiryDate", session.getAttribute("expiryDate"));
		}
		
		parameters.put("creditCardNo", creditCardNo); 
		
		HashMap<String, String> header = new HashMap<String, String>(
				COMMON_HEADERS);
		header.put("userName", session.getAttribute("username").toString());
		header.put("token", session.getAttribute("token").toString());
		header.put("language", WebServiceUtils.transformLanaguage(UserRestURIConstants
						.getLanaguage(request)));
		
		logger.info("TRAVEL_FINALIZE_POLICY Request " + JsonUtils.jsonPrint(parameters));
		responsObject = restService.consumeApi(HttpMethod.POST,
				UserRestURIConstants.TRAVEL_FINALIZE_POLICY, header,
				parameters);
		logger.info("TRAVEL_FINALIZE_POLICY Response " + responsObject);
		
		if(responsObject.get("errMsgs") == null) {
			session.setAttribute("policyNo", responsObject.get("policyNo"));
			session.removeAttribute("creditCardNo");
			session.removeAttribute("expiryDate");
			session.removeAttribute("upgradeTotalTravallingDays");
			session.removeAttribute("upgradeTotalTravallingDays");
			session.removeAttribute("upgradeUserDetails");
			session.removeAttribute("upgradePlandetailsForm");
			session.removeAttribute("upgradeCreateFlightPolicy");
			session.removeAttribute("upgradeSelectPlanName");
			session.removeAttribute("upgradeDueAmount");
			session.removeAttribute("travelQuote");
			session.removeAttribute("travelCreatePolicy");
			session.removeAttribute("travel-temp-save");
		}
		
		return responsObject;
	}
	
}
