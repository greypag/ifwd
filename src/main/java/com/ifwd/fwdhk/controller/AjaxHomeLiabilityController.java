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
import org.springframework.web.bind.annotation.RequestMapping;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.model.CreatePolicy;
import com.ifwd.fwdhk.model.HomeCareDetailsBean;
import com.ifwd.fwdhk.services.GAService;
import com.ifwd.fwdhk.util.CommonUtils;
@Controller
public class AjaxHomeLiabilityController extends BaseController{
	private final static Logger logger = LoggerFactory.getLogger(AjaxHomeLiabilityController.class);
	
	@Autowired
	private RestServiceDao restService;
	
	@Autowired
	private CommonUtils commonUtils;
	
	@Autowired
	private GAService gaService;
	
	@RequestMapping(value = {"/ajax/homeliability/processSummary"})
	public void getQuote(@ModelAttribute("ef-form-application") HomeCareDetailsBean homeCareDetails,
			HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		JSONObject result = new JSONObject();
		try {
			CreatePolicy createPolicy = gaService.createPolicy(homeCareDetails, response, request);
			if(createPolicy.getErrMsgs() == null) {
				result = gaService.confirmPolicy(createPolicy, response, request);
				
			}else {
				result.put("errMsgs", createPolicy.getErrMsgs());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		ajaxReturn(response, result);
	}
}
