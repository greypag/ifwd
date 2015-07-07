package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.model.savie.SavieFormApplicationBean;
import com.ifwd.fwdhk.util.SaviePageFlowControl;
import com.ifwd.fwdhk.util.WebServiceUtils;
@Controller
public class SavieController {
	
	private final static Logger logger = LoggerFactory.getLogger(SavieController.class);
	
	@Autowired
	private RestServiceDao restService;

	@RequestMapping(value = {"/{lang}/savie-landing"})
	public String getSavieLanding(Model model, HttpServletRequest request) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		return UserRestURIConstants.getSitePath(request)+ "savie/savie-landing";
	}
	
	@SuppressWarnings("unused")
	@RequestMapping(value = {"/{lang}/savie-plan-details"})
	public String getSavieIllustration(Model model, HttpServletRequest request) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		
		
		model.addAttribute("nextPageFlow", SaviePageFlowControl.pageFlow(request));
		
		String redirectUrl=SaviePageFlowControl.pageFlow(request);
		return UserRestURIConstants.getSitePath(request)+ "savie/savie-plan-details";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = {"/{lang}/getPlanDetailsByAjax"})
	public void getSavieIllustrationByAjax(Model model, HttpServletRequest request,HttpServletResponse response) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		
		String planCode = request.getParameter("planCode");
		String issueAge = request.getParameter("issueAge");
		String paymentTerm = request.getParameter("paymentTerm");
		String premium = request.getParameter("premium");
		String referralCode = request.getParameter("referralCode");
		
		StringBuffer Url = new StringBuffer();
		Url.append(UserRestURIConstants.SAVIE_GET_ILLUSTRATION);
		Url.append("?planCode=");
		Url.append("Savie");
		Url.append("&issueAge=");
		Url.append(issueAge);
		Url.append("&paymentTerm=");
		Url.append(paymentTerm);
		Url.append("&premium=");
		Url.append(premium);
		Url.append("&referralCode=");
		Url.append(referralCode);

		HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
		header.put("language", WebServiceUtils.transformLanaguage(lang));
		logger.debug(Url.toString());
		
		org.json.simple.JSONObject apiJsonObj = restService.consumeApi(HttpMethod.GET,Url.toString(), header, null);
		
		logger.info("apiJsonObj:"+apiJsonObj);
		
		JSONObject resultJsonObject = new JSONObject();
		if(null == apiJsonObj.get("errMsgs")){
			String jsonStr = apiJsonObj.toJSONString();
			JSONObject responseJsonObj = JSONObject.fromObject(jsonStr);
			logger.info("getSavieIllustrationByAjax API:" + responseJsonObj);
			
			List<JSONObject> planDetails0Rate = (List<JSONObject>) responseJsonObj.get("planDetails0Rate");
			List<JSONObject> planDetails2Rate = (List<JSONObject>) responseJsonObj.get("planDetails2Rate");
			List<JSONObject> planDetails3Rate = (List<JSONObject>) responseJsonObj.get("planDetails3Rate");
			List<JSONObject> planDetails4Rate = (List<JSONObject>) responseJsonObj.get("planDetails4Rate");
			
			List<JSONObject> inputTableList = new ArrayList<JSONObject>();
			JSONObject inputTable = new JSONObject();
			inputTable.accumulate("type", planCode);
			inputTable.accumulate("issueAge", issueAge);
			inputTable.accumulate("paymode", "monthly");
			inputTable.accumulate("premium", premium);
			inputTable.accumulate("paymentTerm", paymentTerm);
			inputTable.accumulate("promoCode", referralCode);
			inputTableList.add(inputTable);
			
			JSONObject planDetailsJsonObject = new JSONObject();
			planDetailsJsonObject.accumulate("inputTable", inputTableList);
			
			List<JSONObject> yearPlansList = new ArrayList<JSONObject>();
			
			for(int i =0;i<planDetails0Rate.size();i++){
				JSONObject yesrPlan = new JSONObject();
				yesrPlan.accumulate("year", Integer.valueOf(planDetails0Rate.get(i).getString("type").substring(1)));
				
				List<JSONObject> plansList = new ArrayList<JSONObject>();
				
				JSONObject plan0 = new JSONObject();
				plan0.accumulate("accountBalance", Float.valueOf(planDetails0Rate.get(i).getString("accountEOP")));
				plan0.accumulate("rate","zero");
				plansList.add(plan0);
				
				JSONObject plan2 = new JSONObject();
				plan2.accumulate("accountBalance", Float.valueOf(planDetails2Rate.get(i).getString("accountEOP")));
				plan2.accumulate("rate","two");
				plansList.add(plan2);
				
				JSONObject plan3 = new JSONObject();
				plan3.accumulate("accountBalance", Float.valueOf(planDetails3Rate.get(i).getString("accountEOP")));
				plan3.accumulate("rate","three");
				plansList.add(plan3);
				
				JSONObject plan4 = new JSONObject();
				plan4.accumulate("accountBalance", Float.valueOf(planDetails4Rate.get(i).getString("accountEOP")));
				plan4.accumulate("rate","four");
				plansList.add(plan4);
				
				yesrPlan.accumulate("plans", plansList);
				yearPlansList.add(yesrPlan);
			}
			planDetailsJsonObject.accumulate("yearPlans", yearPlansList);
			resultJsonObject.accumulate("salesIllustration", planDetailsJsonObject);
		}
		else{
			resultJsonObject.accumulate("salesIllustration", apiJsonObj.get("errMsgs"));
		}
		
		logger.info(resultJsonObject.toString());
		
		response.setContentType("text/json;charset=utf-8");
		//return data
		try {
			response.getWriter().print(resultJsonObject.toString());
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = {"/sendEmailByAjax"})
	public void sendEmailByAjax(Model model, HttpServletRequest request,HttpServletResponse response) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		
		HttpSession session = request.getSession();
		
		String token = null, username = null;
		if ((session.getAttribute("token") != null)
				&& (session.getAttribute("username") != null)) {
			token = session.getAttribute("token").toString();
			username = session.getAttribute("username").toString();
		} 
		restService.consumeLoginApi(request);
		if ((session.getAttribute("token") != null)) {
			token = session.getAttribute("token").toString();
			username = session.getAttribute("username").toString();
		}
		
		String to = "nathaniel.kw.cheung@fwd.com";//request.getParameter("to"); //
		String message = "<h1>my testing</h1><u>underline</u>";//request.getParameter("message");//
		String subject = "html testing";//request.getParameter("subject");//
		String attachment = null;//request.getParameter("attachment");//
		String from = "sit@ecomm.fwd.com";//request.getParameter("from");//
		String isHtml ="true"; //request.getParameter("isHTML");
		boolean isHTML = false;
		if("TRUE".equals(isHtml.toUpperCase())){
			 isHTML = true;
		}
		
		org.json.simple.JSONObject parameters = new org.json.simple.JSONObject();
		parameters.put("to", to);
		parameters.put("message", message);
		parameters.put("subject", subject);
		//parameters.put("attachment", attachment);
		parameters.put("from", from);
		parameters.put("isHtml", isHTML);
		
		HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
		//header.put("language", WebServiceUtils.transformLanaguage(lang));
		header.put("userName", username);
		header.put("token", token);
		
		org.json.simple.JSONObject apiJsonObj = restService.consumeApi(HttpMethod.POST,UserRestURIConstants.SEND_EMAIL, header, parameters);
		
		logger.info("apiJsonObj:"+apiJsonObj);
		
		JSONObject resultJsonObject = new JSONObject();
		
		resultJsonObject.accumulate("errMsgs", apiJsonObj.get("errMsgs"));
		
		logger.info(resultJsonObject.toString());
		
		response.setContentType("text/json;charset=utf-8");
		//return data
		try {
			response.getWriter().print(resultJsonObject.toString());
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = {"/{lang}/savie-fna"})
	public String getSavieFNA(Model model, HttpServletRequest request) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		return UserRestURIConstants.getSitePath(request)+ "savie/savie-fna";
	}
	
	@RequestMapping(value = {"/{lang}/savie-application-details"})
	public String getSaviePersonalinfo(Model model, HttpServletRequest request) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		return UserRestURIConstants.getSitePath(request)+ "savie/savie-application-details";
	}
	
	@RequestMapping(value = {"/{lang}/savie-order-summary"})
	public String getSavieOrderSummary(Model model, HttpServletRequest request,@ModelAttribute("detailInfo")SavieFormApplicationBean savieDetail) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		logger.debug(savieDetail.getSavieApplicantBean().getFirstName());
		logger.debug(savieDetail.getSavieEmploymentBean().getEmploymentStatus());
		request.getSession().setAttribute("savieDetail", savieDetail);
		return UserRestURIConstants.getSitePath(request)+ "savie/savie-order-summary";
	}
	
	@RequestMapping(value = {"/{lang}/savie-appointment"})
	public String getSavieAppointment(Model model, HttpServletRequest request) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		return UserRestURIConstants.getSitePath(request)+ "savie/savie-appointment";
	}
	
	@RequestMapping(value = {"/{lang}/savie-document-upload"})
	public String getSavieDocumentUpload(Model model, HttpServletRequest request) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		return UserRestURIConstants.getSitePath(request)+ "savie/savie-document-upload";
	}
	
	
	@RequestMapping(value = {"/{lang}/savie-thankyou"})
	public String getSavieThankyou(Model model, HttpServletRequest request) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		return UserRestURIConstants.getSitePath(request)+ "savie/savie-thankyou";
	}
	
	@RequestMapping(value = {"/{lang}/savie-declaration-authorization"})
	public String getSavieDeclarationAuthorization(Model model, HttpServletRequest request) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		return UserRestURIConstants.getSitePath(request)+ "savie/savie-declaration-authorization";
	}
	
	@RequestMapping(value = {"/{lang}/savie-signature"})
	public String getSavieSignature(Model model, HttpServletRequest request) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		return UserRestURIConstants.getSitePath(request)+ "savie/savie-signature";
	}
	
	@RequestMapping(value = {"/{lang}/savie-edit-view"})
	public String getSavieEditView(Model model, HttpServletRequest request) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		return UserRestURIConstants.getSitePath(request)+ "savie/savie-edit-view";
	}
	
	
}
