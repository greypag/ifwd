package com.ifwd.fwdhk.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.services.EliteTermService;
import com.ifwd.fwdhk.util.Methods;
@Controller
public class AjaxEliteTermController extends BaseController{
	private final static Logger logger = LoggerFactory.getLogger(AjaxEliteTermController.class);
	
	@Autowired
	private RestServiceDao restService;
	@Autowired
	private EliteTermService eliteTermService;

	@RequestMapping(value = {"/ajax/eliteTerm/createEliteTermPolicy"})
	public void createEliteTermPolicy(HttpServletRequest request,HttpServletResponse response) {
		if (Methods.isXssAjax(request))
			return;
		try {
			ajaxReturn(response, eliteTermService.createEliteTermPolicy(request));
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	@RequestMapping(value = {"/ajax/eliteTerm/getEliteTermPremium"})
	public void getEliteTermPremium(HttpServletRequest request,HttpServletResponse response) {
		if (Methods.isXssAjax(request))
			return;
		try {
			ajaxReturn(response, eliteTermService.getEliteTermPremium(request));
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	@RequestMapping(value = {"/ajax/eliteTerm/finalizeEliteTermPolicy"})
	public void finalizeEliteTermPolicy(HttpServletRequest request,HttpServletResponse response) {
		if (Methods.isXssAjax(request))
			return;
		try {
			ajaxReturn(response, eliteTermService.finalizeEliteTermPolicy(request));
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	@RequestMapping(value = {"/ajax/eliteTerm/getUploadedDocument"})
	public void getUploadedDocument(HttpServletRequest request,HttpServletResponse response) {
		if (Methods.isXssAjax(request))
			return;
		try {
			ajaxReturn(response, eliteTermService.getUploadedDocument(request));
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = {"/ajax/eliteTerm/contactCs"})
	public void contactCs(HttpServletRequest request,HttpServletResponse response) {
		if (Methods.isXssAjax(request))
			return;
		try {
			ajaxReturn(response, eliteTermService.contactCs(request));
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = {"/ajax/eliteTerm/setEliteTermPolicyAgentEmail"})
	public void setEliteTermPolicyAgentEmail(HttpServletRequest request,HttpServletResponse response) {
		if (Methods.isXssAjax(request))
			return;
		try {
			ajaxReturn(response, eliteTermService.setEliteTermPolicyAgentEmail(request));
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
}
