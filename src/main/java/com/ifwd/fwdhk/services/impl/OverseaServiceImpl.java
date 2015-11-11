package com.ifwd.fwdhk.services.impl;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.joda.time.LocalDate;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.QuoteDetails;
import com.ifwd.fwdhk.services.OverseaService;
import com.ifwd.fwdhk.util.WebServiceUtils;

@Service
public class OverseaServiceImpl implements OverseaService {
	private final static Logger logger = LoggerFactory.getLogger(OverseaServiceImpl.class);
	
	@Autowired
	private RestServiceDao restService;
	
	@Override
	public void getPlanDetails(Model model, HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws ECOMMAPIException {
		String token = null, username = null;
		if ((session.getAttribute("token") != null)
				&& (session.getAttribute("username") != null)) {
			token = session.getAttribute("token").toString();
			username = session.getAttribute("username").toString();
		} else {
			restService.consumeLoginApi(request);
			if ((session.getAttribute("token") != null)) {
				token = session.getAttribute("token").toString();
				username = session.getAttribute("username").toString();
			}
		}
		
		String Url = UserRestURIConstants.OVERSEA_GET_QUOTE + "?planCode=Overseas"
				+ "&referralCode=";// + (String) session.getAttribute("referralCode");

		HashMap<String, String> header = new HashMap<String, String>(
				COMMON_HEADERS);
		if (request.getSession().getAttribute("username") != null) {
			header.put("userName", username);
			header.put("token", token);
		}
		
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		
		header.put("language", WebServiceUtils.transformLanaguage(lang));
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,
				Url, header, null);
		logger.info("OVERSEA_GET_QUOTE Response " + responseJsonObj);
		
		if (responseJsonObj.get("errMsgs") == null) {
			/*QuoteDetails quoteDetails = new QuoteDetails();
			responseJsonObj.get("referralCode");
			responseJsonObj.get("referralName");
			responseJsonObj.get("priceInfoA");
			responseJsonObj.get("priceInfoB");
			JSONObject jsonPriceInfoA = new JSONObject();
			jsonPriceInfoA = (JSONObject) responseJsonObj.get("priceInfoA");
			JSONObject jsonPriceInfoB = new JSONObject();
			jsonPriceInfoB = (JSONObject) responseJsonObj.get("priceInfoB");
			String planeName[] = { "A", "B" };
			String grossPrem[] = {
					jsonPriceInfoA.get("grossPremium").toString(),
					jsonPriceInfoB.get("grossPremium").toString() };

			String discountPercentage[] = {
					jsonPriceInfoA.get("discountPercentage").toString(),
					jsonPriceInfoB.get("discountPercentage").toString() };

			String discountAmount[] = {
					jsonPriceInfoA.get("discountAmount").toString(),
					jsonPriceInfoB.get("discountAmount").toString() };

			String totalNetPremium[] = {
					jsonPriceInfoA.get("totalNetPremium").toString(),
					jsonPriceInfoB.get("totalNetPremium").toString() };

			String totalDue[] = {
					jsonPriceInfoA.get("totalDue").toString(),
					jsonPriceInfoB.get("totalDue").toString() };

			quoteDetails.setGrossPremium(grossPrem);
			quoteDetails.setDiscountPercentage(discountPercentage);
			quoteDetails.setDiscountAmount(discountAmount);
			quoteDetails.setTotalNetPremium(totalNetPremium);
			quoteDetails.setToalDue(totalDue);
			quoteDetails.setPlanName(planeName);
			session.setAttribute("quoteDetails", quoteDetails);*/
			responseJsonObj.put("result", "success");
		}else{
			responseJsonObj.put("result", "fail");
		}
		
		try {
			logger.info(responseJsonObj.toString());
			response.getWriter().print(responseJsonObj.toString());
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
