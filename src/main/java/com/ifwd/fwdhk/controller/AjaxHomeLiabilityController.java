package com.ifwd.fwdhk.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.model.life.SaviePlanDetailsBean;
import com.ifwd.fwdhk.util.CommonUtils;
@Controller
public class AjaxHomeLiabilityController extends BaseController{
	private final static Logger logger = LoggerFactory.getLogger(AjaxHomeLiabilityController.class);
	
	@Autowired
	private RestServiceDao restService;
	
	@Autowired
	private CommonUtils commonUtils;
	
	@RequestMapping(value = {"/ajax/home-liability-insurance/"})
	public void getQuote(SaviePlanDetailsBean saviePlanDetails,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		
		ajaxReturn(response, null);
	}
}
