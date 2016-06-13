package com.ifwd.fwdhk.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.CreatePolicy;
import com.ifwd.fwdhk.model.HomeCareDetailsBean;
import com.ifwd.fwdhk.services.GAService;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.Methods;
@Controller
public class AjaxHomeController extends BaseController{
	private final static Logger logger = LoggerFactory.getLogger(AjaxHomeController.class);
	
	@Autowired
	private RestServiceDao restService;
	
	@Autowired
	private CommonUtils commonUtils;
	
	@Autowired
	private GAService gaService;
	
	@RequestMapping(value = {"/ajax/{plan}/processSummary"})
	public void getQuote(@PathVariable("plan") String plan, @ModelAttribute("ef-form-application") HomeCareDetailsBean homeCareDetails,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		if (Methods.isXssAjax(request)) {
			return;
		}
		JSONObject result = new JSONObject();
		try {
			CreatePolicy createdPolicy = gaService.createPolicy(plan, homeCareDetails, response, request);
			if(createdPolicy.getErrMsgs() == null) {
				result = gaService.confirmPolicy(plan, createdPolicy.getReferenceNo(), response, request);
				
			}else {
				result.put("errMsgs", createdPolicy.getErrMsgs());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		ajaxReturn(response, result);
	}
	@RequestMapping(value = {"/ajax/{plan}/submitPolicy"})
	public void getSubmitPolicy(@PathVariable("plan") String plan, HttpServletRequest request,HttpServletResponse response,
			HttpSession session) {
		if (Methods.isXssAjax(request)) {
			return;
		}
		JSONObject result = new JSONObject();
		String referenceNo = request.getParameter("referenceNo");
		try {
			result = gaService.SubmitPolicy(plan, referenceNo, response, request, session);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ajaxReturn(response, result);
	}

	@RequestMapping(value = {"/ajax/{plan}/getHomeCareQuote"})
	public void getHomeCareQuote(@PathVariable("plan") String plan,HttpServletRequest request,HttpServletResponse response,HttpSession session){
		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			jsonObject = gaService.getHomeCareQuote(plan, request, session);
		}
		catch (ECOMMAPIException e) {
			jsonObject.put("errorMsg", e.getMessage());
		}
		logger.info(jsonObject.toString());
		ajaxReturn(response, jsonObject);
	}
}
