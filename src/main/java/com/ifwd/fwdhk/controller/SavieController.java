package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.util.SaviePageFlowControl;
import com.ifwd.fwdhk.util.WebServiceUtils;
import com.ifwd.fwdhk.util.StringHelper;

@Controller
public class SavieController {
	
	private final static Logger logger = LoggerFactory.getLogger(SavieController.class);
	
	@Autowired
	private RestServiceDao restService;

	@RequestMapping(value = {"/{lang}/savie-application-detail1"})
	public String getSaviePersonalinfo(Model model, HttpServletRequest request) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		logger.debug(request.getParameter("beneGivenName"));
		logger.debug(request.getParameter("beneLastName"));
		logger.debug(request.getParameter("beneChineseName"));
		logger.debug(request.getParameter("hkidOrPassportNo"));
		logger.debug(request.getParameter("beneGender"));
		logger.debug(request.getParameter("beneEntitlement"));	
		
		setupStepAttributes(model, "1");
		return UserRestURIConstants.getSitePath(request)+ "savie/savie-application-details";
	}
	
	@RequestMapping(value = {"/{lang}/savie-application-detail2"})
	public String getSavieEmploymentInfo(Model model, HttpServletRequest request) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		logger.debug(request.getParameter("givenName"));
		logger.debug(request.getParameter("emailAddress"));
		logger.debug(request.getParameter("lastName"));
		logger.debug(request.getParameter("telNo"));
		logger.debug(request.getParameter("chineseName"));
		logger.debug(request.getParameter("mobileNo"));
		logger.debug(request.getParameter("hkid"));
		logger.debug(request.getParameter("residentialAddress1"));
		logger.debug(request.getParameter("gender"));
		logger.debug(request.getParameter("residentialAddress2"));
		logger.debug(request.getParameter("maritalStatus"));
		logger.debug(request.getParameter("residentialAddress3"));
		logger.debug(request.getParameter("dateOfBirth"));
		logger.debug(request.getParameter("district"));
		logger.debug(request.getParameter("placeOfBirth"));
		logger.debug(request.getParameter("nationality"));
		logger.debug(request.getParameter("addressIsSame"));
		
		setupStepAttributes(model, "2");
		return UserRestURIConstants.getSitePath(request)+ "savie/savie-application-details";
	}
	
	@RequestMapping(value = {"/{lang}/savie-application-detail3"})
	public String getSavieBeneficiaryInfo(Model model, HttpServletRequest request) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		logger.debug(request.getParameter("employmentStatus"));
		logger.debug(request.getParameter("natureOfBusiness"));
		logger.debug(request.getParameter("occupation"));
		logger.debug(request.getParameter("monthlyPersonalIncome"));
		
		setupStepAttributes(model, "3");
		return UserRestURIConstants.getSitePath(request)+ "savie/savie-application-details";
	}
	
	private void setupStepAttributes(Model model, String step) {
    	model.addAttribute("step", step);
	}
	
	@RequestMapping(value = {"/{lang}/savie-landing"})
	public String getSavieLanding(Model model, HttpServletRequest request) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		return UserRestURIConstants.getSitePath(request)+ "savie/savie-landing";
	}
	
	@RequestMapping(value = {"/{lang}/savie-illustration"})
	public String getSavieIllustration(Model model, HttpServletRequest request) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		
		
		
		
		String redirectUrl=SaviePageFlowControl.pageFlow(request);
		
		
		
		return redirectUrl;
	}

	@RequestMapping(value = {"/{lang}/getSavieIllustrationByAjax"})
	public void getSavieIllustrationByAjax(Model model, HttpServletRequest request,HttpServletResponse response) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		
		
		String Url = "";

		HashMap<String, String> header = new HashMap<String, String>(
				COMMON_HEADERS);
		/*header.put("language", WebServiceUtils.transformLanaguage(lang));
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,
				Url, header, null);*/
		String jsonStr = "{ \"errMsgs\": null, \"salesIllustration0Rate\": [ { \"seq\": 47, \"policyYear\": 3, \"policyMonth\": 11, \"policyAccMonth\": 47, \"premium\": 0, \"totalPremium\": 1000, \"principal\": 1103.248, \"interestedRate\": 0, \"monthlyInterestedRate\": 0, \"accInterest\": 0, \"accountEOP\": 1103.248, \"age\": 22, \"guranteedSurrenderBenefit\": 1103.248, \"guranteedDeathBenefit\": 2103.248, \"nonGuaranteeRate\": 0, \"type\": \"Y4\" }, { \"seq\": 59, \"policyYear\": 4, \"policyMonth\": 11, \"policyAccMonth\": 59, \"premium\": 0, \"totalPremium\": 1000, \"principal\": 1103.248, \"interestedRate\": 0, \"monthlyInterestedRate\": 0, \"accInterest\": 0, \"accountEOP\": 1103.248, \"age\": 23, \"guranteedSurrenderBenefit\": 1103.248, \"guranteedDeathBenefit\": 2103.248, \"nonGuaranteeRate\": 0, \"type\": \"Y5\" }, { \"seq\": 119, \"policyYear\": 9, \"policyMonth\": 11, \"policyAccMonth\": 119, \"premium\": 0, \"totalPremium\": 1000, \"principal\": 1103.248, \"interestedRate\": 0, \"monthlyInterestedRate\": 0, \"accInterest\": 0, \"accountEOP\": 1103.248, \"age\": 28, \"guranteedSurrenderBenefit\": 1103.248, \"guranteedDeathBenefit\": 2103.248, \"nonGuaranteeRate\": 0, \"type\": \"Y10\" }, { \"seq\": 239, \"policyYear\": 19, \"policyMonth\": 11, \"policyAccMonth\": 239, \"premium\": 0, \"totalPremium\": 1000, \"principal\": 1103.248, \"interestedRate\": 0, \"monthlyInterestedRate\": 0, \"accInterest\": 0, \"accountEOP\": 1103.248, \"age\": 38, \"guranteedSurrenderBenefit\": 1103.248, \"guranteedDeathBenefit\": 2103.248, \"nonGuaranteeRate\": 0, \"type\": \"Y15\" }, { \"seq\": 299, \"policyYear\": 24, \"policyMonth\": 11, \"policyAccMonth\": 299, \"premium\": 0, \"totalPremium\": 1000, \"principal\": 1103.248, \"interestedRate\": 0, \"monthlyInterestedRate\": 0, \"accInterest\": 0, \"accountEOP\": 1103.248, \"age\": 43, \"guranteedSurrenderBenefit\": 1103.248, \"guranteedDeathBenefit\": 2103.248, \"nonGuaranteeRate\": 0, \"type\": \"Y20\" }, { \"seq\": 359, \"policyYear\": 29, \"policyMonth\": 11, \"policyAccMonth\": 359, \"premium\": 0, \"totalPremium\": 1000, \"principal\": 1103.248, \"interestedRate\": 0, \"monthlyInterestedRate\": 0, \"accInterest\": 0, \"accountEOP\": 1103.248, \"age\": 48, \"guranteedSurrenderBenefit\": 1103.248, \"guranteedDeathBenefit\": 2103.248, \"nonGuaranteeRate\": 0, \"type\": \"Y25\" }, { \"seq\": 439, \"policyYear\": 36, \"policyMonth\": 7, \"policyAccMonth\": 439, \"premium\": 0, \"totalPremium\": 1000, \"principal\": 1103.248, \"interestedRate\": 0, \"monthlyInterestedRate\": 0, \"accInterest\": 0, \"accountEOP\": 1103.248, \"age\": 55, \"guranteedSurrenderBenefit\": 1103.248, \"guranteedDeathBenefit\": 2103.248, \"nonGuaranteeRate\": 0, \"type\": \"Y30\" }, { \"seq\": 983, \"policyYear\": 81, \"policyMonth\": 11, \"policyAccMonth\": 983, \"premium\": 0, \"totalPremium\": 1000, \"principal\": 1103.248, \"interestedRate\": 0, \"monthlyInterestedRate\": 0, \"accInterest\": 0, \"accountEOP\": 1103.248, \"age\": 100, \"guranteedSurrenderBenefit\": 1103.248, \"guranteedDeathBenefit\": 2103.248, \"nonGuaranteeRate\": 0, \"type\": \"A100\" } ], \"salesIllustration2Rate\": [ { \"seq\": 47, \"policyYear\": 3, \"policyMonth\": 11, \"policyAccMonth\": 47, \"premium\": 0, \"totalPremium\": 1000, \"principal\": 1103.248, \"interestedRate\": 0.02, \"monthlyInterestedRate\": 0.0016666666, \"accInterest\": 0, \"accountEOP\": 1125.313, \"age\": 22, \"guranteedSurrenderBenefit\": 1125.313, \"guranteedDeathBenefit\": 2125.313, \"nonGuaranteeRate\": 0, \"type\": \"Y4\" }, { \"seq\": 59, \"policyYear\": 4, \"policyMonth\": 11, \"policyAccMonth\": 59, \"premium\": 0, \"totalPremium\": 1000, \"principal\": 1125.313, \"interestedRate\": 0.02, \"monthlyInterestedRate\": 0.0016666666, \"accInterest\": 0, \"accountEOP\": 1147.8192, \"age\": 23, \"guranteedSurrenderBenefit\": 1147.8192, \"guranteedDeathBenefit\": 2147.8193, \"nonGuaranteeRate\": 0, \"type\": \"Y5\" }, { \"seq\": 119, \"policyYear\": 9, \"policyMonth\": 11, \"policyAccMonth\": 119, \"premium\": 0, \"totalPremium\": 1000, \"principal\": 1242.4364, \"interestedRate\": 0.02, \"monthlyInterestedRate\": 0.0016666666, \"accInterest\": 0, \"accountEOP\": 1267.2852, \"age\": 28, \"guranteedSurrenderBenefit\": 1267.2852, \"guranteedDeathBenefit\": 2267.2852, \"nonGuaranteeRate\": 0, \"type\": \"Y10\" }, { \"seq\": 239, \"policyYear\": 19, \"policyMonth\": 11, \"policyAccMonth\": 239, \"premium\": 0, \"totalPremium\": 1000, \"principal\": 1514.5232, \"interestedRate\": 0.02, \"monthlyInterestedRate\": 0.0016666666, \"accInterest\": 0, \"accountEOP\": 1544.8136, \"age\": 38, \"guranteedSurrenderBenefit\": 1544.8136, \"guranteedDeathBenefit\": 2544.8135, \"nonGuaranteeRate\": 0, \"type\": \"Y15\" }, { \"seq\": 299, \"policyYear\": 24, \"policyMonth\": 11, \"policyAccMonth\": 299, \"premium\": 0, \"totalPremium\": 1000, \"principal\": 1672.1559, \"interestedRate\": 0.02, \"monthlyInterestedRate\": 0.0016666666, \"accInterest\": 0, \"accountEOP\": 1705.599, \"age\": 43, \"guranteedSurrenderBenefit\": 1705.599, \"guranteedDeathBenefit\": 2705.599, \"nonGuaranteeRate\": 0, \"type\": \"Y20\" }, { \"seq\": 359, \"policyYear\": 29, \"policyMonth\": 11, \"policyAccMonth\": 359, \"premium\": 0, \"totalPremium\": 1000, \"principal\": 1846.1952, \"interestedRate\": 0.02, \"monthlyInterestedRate\": 0.0016666666, \"accInterest\": 0, \"accountEOP\": 1883.1191, \"age\": 48, \"guranteedSurrenderBenefit\": 1883.1191, \"guranteedDeathBenefit\": 2883.1191, \"nonGuaranteeRate\": 0, \"type\": \"Y25\" }, { \"seq\": 439, \"policyYear\": 36, \"policyMonth\": 7, \"policyAccMonth\": 439, \"premium\": 0, \"totalPremium\": 1000, \"principal\": 2120.698, \"interestedRate\": 0.02, \"monthlyInterestedRate\": 0.0016666666, \"accInterest\": 28.275972, \"accountEOP\": 2148.9739, \"age\": 55, \"guranteedSurrenderBenefit\": 2148.9739, \"guranteedDeathBenefit\": 3148.9739, \"nonGuaranteeRate\": 0, \"type\": \"Y30\" }, { \"seq\": 983, \"policyYear\": 81, \"policyMonth\": 11, \"policyAccMonth\": 983, \"premium\": 0, \"totalPremium\": 1000, \"principal\": 5169.9507, \"interestedRate\": 0.02, \"monthlyInterestedRate\": 0.0016666666, \"accInterest\": 103.39901, \"accountEOP\": 5273.3496, \"age\": 100, \"guranteedSurrenderBenefit\": 5273.3496, \"guranteedDeathBenefit\": 6273.3496, \"nonGuaranteeRate\": 0, \"type\": \"A100\" } ], \"salesIllustration3Rate\": [ { \"seq\": 47, \"policyYear\": 3, \"policyMonth\": 11, \"policyAccMonth\": 47, \"premium\": 0, \"totalPremium\": 1000, \"principal\": 1103.248, \"interestedRate\": 0.03, \"monthlyInterestedRate\": 0.0025, \"accInterest\": 0, \"accountEOP\": 1136.3455, \"age\": 22, \"guranteedSurrenderBenefit\": 1136.3455, \"guranteedDeathBenefit\": 2136.3455, \"nonGuaranteeRate\": 0, \"type\": \"Y4\" }, { \"seq\": 59, \"policyYear\": 4, \"policyMonth\": 11, \"policyAccMonth\": 59, \"premium\": 0, \"totalPremium\": 1000, \"principal\": 1136.3455, \"interestedRate\": 0.03, \"monthlyInterestedRate\": 0.0025, \"accInterest\": 0, \"accountEOP\": 1170.4358, \"age\": 23, \"guranteedSurrenderBenefit\": 1170.4358, \"guranteedDeathBenefit\": 2170.4358, \"nonGuaranteeRate\": 0, \"type\": \"Y5\" }, { \"seq\": 119, \"policyYear\": 9, \"policyMonth\": 11, \"policyAccMonth\": 119, \"premium\": 0, \"totalPremium\": 1000, \"principal\": 1317.3358, \"interestedRate\": 0.03, \"monthlyInterestedRate\": 0.0025, \"accInterest\": 0, \"accountEOP\": 1356.8558, \"age\": 28, \"guranteedSurrenderBenefit\": 1356.8558, \"guranteedDeathBenefit\": 2356.856, \"nonGuaranteeRate\": 0, \"type\": \"Y10\" }, { \"seq\": 239, \"policyYear\": 19, \"policyMonth\": 11, \"policyAccMonth\": 239, \"premium\": 0, \"totalPremium\": 1000, \"principal\": 1770.3893, \"interestedRate\": 0.03, \"monthlyInterestedRate\": 0.0025, \"accInterest\": 0, \"accountEOP\": 1823.501, \"age\": 38, \"guranteedSurrenderBenefit\": 1823.501, \"guranteedDeathBenefit\": 2823.501, \"nonGuaranteeRate\": 0, \"type\": \"Y15\" }, { \"seq\": 299, \"policyYear\": 24, \"policyMonth\": 11, \"policyAccMonth\": 299, \"premium\": 0, \"totalPremium\": 1000, \"principal\": 2052.3665, \"interestedRate\": 0.03, \"monthlyInterestedRate\": 0.0025, \"accInterest\": 0, \"accountEOP\": 2113.9375, \"age\": 43, \"guranteedSurrenderBenefit\": 2113.9375, \"guranteedDeathBenefit\": 3113.9375, \"nonGuaranteeRate\": 0, \"type\": \"Y20\" }, { \"seq\": 359, \"policyYear\": 29, \"policyMonth\": 11, \"policyAccMonth\": 359, \"premium\": 0, \"totalPremium\": 1000, \"principal\": 2379.2551, \"interestedRate\": 0.03, \"monthlyInterestedRate\": 0.0025, \"accInterest\": 0, \"accountEOP\": 2450.6328, \"age\": 48, \"guranteedSurrenderBenefit\": 2450.6328, \"guranteedDeathBenefit\": 3450.6328, \"nonGuaranteeRate\": 0, \"type\": \"Y25\" }, { \"seq\": 439, \"policyYear\": 36, \"policyMonth\": 7, \"policyAccMonth\": 439, \"premium\": 0, \"totalPremium\": 1000, \"principal\": 2926.184, \"interestedRate\": 0.03, \"monthlyInterestedRate\": 0.0025, \"accInterest\": 58.52368, \"accountEOP\": 2984.7078, \"age\": 55, \"guranteedSurrenderBenefit\": 2984.7078, \"guranteedDeathBenefit\": 3984.7078, \"nonGuaranteeRate\": 0, \"type\": \"Y30\" }, { \"seq\": 983, \"policyYear\": 81, \"policyMonth\": 11, \"policyAccMonth\": 983, \"premium\": 0, \"totalPremium\": 1000, \"principal\": 11065.648, \"interestedRate\": 0.03, \"monthlyInterestedRate\": 0.0025, \"accInterest\": 331.96945, \"accountEOP\": 11397.618, \"age\": 100, \"guranteedSurrenderBenefit\": 11397.618, \"guranteedDeathBenefit\": 12397.618, \"nonGuaranteeRate\": 0, \"type\": \"A100\" } ], \"salesIllustration4Rate\": [ { \"seq\": 47, \"policyYear\": 3, \"policyMonth\": 11, \"policyAccMonth\": 47, \"premium\": 0, \"totalPremium\": 1000, \"principal\": 1103.248, \"interestedRate\": 0.04, \"monthlyInterestedRate\": 0.0033333332, \"accInterest\": 0, \"accountEOP\": 1147.3779, \"age\": 22, \"guranteedSurrenderBenefit\": 1147.3779, \"guranteedDeathBenefit\": 2147.378, \"nonGuaranteeRate\": 0, \"type\": \"Y4\" }, { \"seq\": 59, \"policyYear\": 4, \"policyMonth\": 11, \"policyAccMonth\": 59, \"premium\": 0, \"totalPremium\": 1000, \"principal\": 1147.3779, \"interestedRate\": 0.04, \"monthlyInterestedRate\": 0.0033333332, \"accInterest\": 0, \"accountEOP\": 1193.2731, \"age\": 23, \"guranteedSurrenderBenefit\": 1193.2731, \"guranteedDeathBenefit\": 2193.273, \"nonGuaranteeRate\": 0, \"type\": \"Y5\" }, { \"seq\": 119, \"policyYear\": 9, \"policyMonth\": 11, \"policyAccMonth\": 119, \"premium\": 0, \"totalPremium\": 1000, \"principal\": 1395.9607, \"interestedRate\": 0.04, \"monthlyInterestedRate\": 0.0033333332, \"accInterest\": 0, \"accountEOP\": 1451.7991, \"age\": 28, \"guranteedSurrenderBenefit\": 1451.7991, \"guranteedDeathBenefit\": 2451.799, \"nonGuaranteeRate\": 0, \"type\": \"Y10\" }, { \"seq\": 239, \"policyYear\": 19, \"policyMonth\": 11, \"policyAccMonth\": 239, \"premium\": 0, \"totalPremium\": 1000, \"principal\": 2066.3628, \"interestedRate\": 0.04, \"monthlyInterestedRate\": 0.0033333332, \"accInterest\": 0, \"accountEOP\": 2149.0173, \"age\": 38, \"guranteedSurrenderBenefit\": 2149.0173, \"guranteedDeathBenefit\": 3149.0173, \"nonGuaranteeRate\": 0, \"type\": \"Y15\" }, { \"seq\": 299, \"policyYear\": 24, \"policyMonth\": 11, \"policyAccMonth\": 299, \"premium\": 0, \"totalPremium\": 1000, \"principal\": 2514.0464, \"interestedRate\": 0.04, \"monthlyInterestedRate\": 0.0033333332, \"accInterest\": 0, \"accountEOP\": 2614.6082, \"age\": 43, \"guranteedSurrenderBenefit\": 2614.6082, \"guranteedDeathBenefit\": 3614.6082, \"nonGuaranteeRate\": 0, \"type\": \"Y20\" }, { \"seq\": 359, \"policyYear\": 29, \"policyMonth\": 11, \"policyAccMonth\": 359, \"premium\": 0, \"totalPremium\": 1000, \"principal\": 3058.7214, \"interestedRate\": 0.04, \"monthlyInterestedRate\": 0.0033333332, \"accInterest\": 0, \"accountEOP\": 3181.0703, \"age\": 48, \"guranteedSurrenderBenefit\": 3181.0703, \"guranteedDeathBenefit\": 4181.0703, \"nonGuaranteeRate\": 0, \"type\": \"Y25\" }, { \"seq\": 439, \"policyYear\": 36, \"policyMonth\": 7, \"policyAccMonth\": 439, \"premium\": 0, \"totalPremium\": 1000, \"principal\": 4025.0686, \"interestedRate\": 0.04, \"monthlyInterestedRate\": 0.0033333332, \"accInterest\": 107.33515, \"accountEOP\": 4132.404, \"age\": 55, \"guranteedSurrenderBenefit\": 4132.404, \"guranteedDeathBenefit\": 5132.404, \"nonGuaranteeRate\": 0, \"type\": \"Y30\" }, { \"seq\": 983, \"policyYear\": 81, \"policyMonth\": 11, \"policyAccMonth\": 983, \"premium\": 0, \"totalPremium\": 1000, \"principal\": 23511.129, \"interestedRate\": 0.04, \"monthlyInterestedRate\": 0.0033333332, \"accInterest\": 940.44507, \"accountEOP\": 24451.574, \"age\": 100, \"guranteedSurrenderBenefit\": 24451.574, \"guranteedDeathBenefit\": 25451.574, \"nonGuaranteeRate\": 0, \"type\": \"A100\" } ], \"premium\": 1000, \"paymentTerm\": 82, \"issueAge\": 19, \"referralCode\": \"nathaniel.kw.cheung@fwd.com\" }";
		
		JSONObject responseJsonObj = JSONObject.fromObject(jsonStr);
		logger.info("getSavieIllustrationByAjax API:" + responseJsonObj);
		logger.info(responseJsonObj.getString("salesIllustration0Rate"));
		
		List<JSONObject> SalesIllustration0Rate = (List<JSONObject>) responseJsonObj.get("salesIllustration0Rate");
		List<JSONObject> SalesIllustration2Rate = (List<JSONObject>) responseJsonObj.get("salesIllustration2Rate");
		List<JSONObject> SalesIllustration3Rate = (List<JSONObject>) responseJsonObj.get("salesIllustration3Rate");
		List<JSONObject> SalesIllustration4Rate = (List<JSONObject>) responseJsonObj.get("salesIllustration4Rate");
		
		JSONObject resultJsonObject = new JSONObject();
		
		List<JSONObject> inputTableList = new ArrayList<JSONObject>();
		JSONObject inputTable = new JSONObject();
		inputTable.accumulate("type", "Savie");
		inputTable.accumulate("issueAge", "19");
		inputTable.accumulate("paymode", "monthly");
		inputTable.accumulate("premium", "1000");
		inputTable.accumulate("paymentTerm", "10");
		inputTable.accumulate("promoCode", "threeYearGuarantee");
		inputTableList.add(inputTable);
		
		JSONObject salesIllustrationJsonObject = new JSONObject();
		salesIllustrationJsonObject.accumulate("inputTable", inputTableList);
		
		List<JSONObject> yearPlansList = new ArrayList<JSONObject>();
		
		for(int i =0;i<SalesIllustration0Rate.size();i++){
			JSONObject yesrPlan = new JSONObject();
			yesrPlan.accumulate("year", Integer.valueOf(SalesIllustration0Rate.get(i).getString("type").substring(1)));
			
			List<JSONObject> plansList = new ArrayList<JSONObject>();
			
			JSONObject plan0 = new JSONObject();
			plan0.accumulate("accountBalance", Float.valueOf(SalesIllustration0Rate.get(i).getString("accountEOP")));
			plan0.accumulate("rate","zero");
			plansList.add(plan0);
			
			JSONObject plan2 = new JSONObject();
			plan2.accumulate("accountBalance", Float.valueOf(SalesIllustration2Rate.get(i).getString("accountEOP")));
			plan2.accumulate("rate","two");
			plansList.add(plan2);
			
			JSONObject plan3 = new JSONObject();
			plan3.accumulate("accountBalance", Float.valueOf(SalesIllustration3Rate.get(i).getString("accountEOP")));
			plan3.accumulate("rate","three");
			plansList.add(plan3);
			
			JSONObject plan4 = new JSONObject();
			plan4.accumulate("accountBalance", Float.valueOf(SalesIllustration4Rate.get(i).getString("accountEOP")));
			plan4.accumulate("rate","four");
			plansList.add(plan4);
			
			yesrPlan.accumulate("plans", plansList);
			yearPlansList.add(yesrPlan);
		}
        salesIllustrationJsonObject.accumulate("yearPlans", yearPlansList);
		resultJsonObject.accumulate("salesIllustration", salesIllustrationJsonObject);
		
		logger.info(resultJsonObject.toString());
		
		response.setContentType("text/json;charset=utf-8");
		//return data
		try {
			response.getWriter().print(resultJsonObject.toString());
		}catch(Exception e) {
			e.printStackTrace();
		}
	}	
}
