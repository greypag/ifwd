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
import com.ifwd.fwdhk.model.savie.SaviePlanDetailsBean;
import com.ifwd.fwdhk.services.SavieService;
import com.ifwd.fwdhk.util.SaviePageFlowControl;
import com.ifwd.fwdhk.util.WebServiceUtils;
@Controller
public class SavieController {
	
	private final static Logger logger = LoggerFactory.getLogger(SavieController.class);
	
	@Autowired
	private RestServiceDao restService;
	private SavieService savieService;

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
	@RequestMapping(value = {"/{lang}/planDetailByAjax"})
	public void planDetailByAjax(Model model, HttpServletRequest request,HttpServletResponse response) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		
		String product = request.getParameter("product");
		String issueAge = request.getParameter("issueAge");
		String paymentTerm = request.getParameter("paymentTerm");
		String premium = request.getParameter("premium");
		String referralCode = request.getParameter("referralCode");
		
		StringBuffer url = new StringBuffer();
		url.append(UserRestURIConstants.SAVIE_PLAN_DETAIL);
		url.append("?product=");
		url.append(product);
		url.append("&issueAge=");
		url.append(issueAge);
		url.append("&paymentTerm=");
		url.append(paymentTerm);
		url.append("&premium=");
		url.append(premium);
		url.append("&referralCode=");
		url.append(referralCode);

		HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
		header.put("language", WebServiceUtils.transformLanaguage(lang));
		logger.debug(url.toString());
		
		org.json.simple.JSONObject apiJsonObj = restService.consumeApi(HttpMethod.GET,url.toString(), header, null);
		
		logger.info("apiJsonObj:"+apiJsonObj);
		
		
		SaviePlanDetailsBean planDetail = savieService.getPlanDetails(apiJsonObj, product, issueAge, paymentTerm, premium, referralCode);
		request.getSession().setAttribute("planDetail", planDetail);
		
		JSONObject resultJsonObject = savieService.getPlanDetailsAjax(apiJsonObj, product, issueAge, paymentTerm, premium, referralCode);
		
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
		
		String to = request.getParameter("to"); //"nathaniel.kw.cheung@fwd.com";//
		String message = request.getParameter("message");//"<h1>my testing</h1><u>underline</u>";//
		String subject = request.getParameter("subject");//"html testing";//
		String attachment = request.getParameter("attachment");//null;//
		String from = request.getParameter("from");//"sit@ecomm.fwd.com";//
		String isHtml = request.getParameter("isHTML");//"true"; 
		boolean isHTML = false;
		if("TRUE".equals(isHtml.toUpperCase())){
			 isHTML = true;
		}
		
		org.json.simple.JSONObject parameters = new org.json.simple.JSONObject();
		parameters.put("to", to);
		parameters.put("message", message);
		parameters.put("subject", subject);
		parameters.put("attachment", attachment);
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
