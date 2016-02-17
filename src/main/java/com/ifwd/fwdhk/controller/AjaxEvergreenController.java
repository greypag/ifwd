package com.ifwd.fwdhk.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.connector.response.BaseResponse;
import com.ifwd.fwdhk.services.EvergreenService;
@Controller
public class AjaxEvergreenController extends BaseController{
	private final static Logger logger = LoggerFactory.getLogger(AjaxEvergreenController.class);
	
	@Autowired
	private RestServiceDao restService;
	@Autowired
	private EvergreenService evergreenService;
	
	/**
	 * 预约服务中心提交时调用
	 */
	@RequestMapping(value = {"/ajax/savings-evergreen-insurance/upsertAppointment"})
	public void upsertAppointment(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			evergreenService.upsertAppointment(model, request, response);
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = {"/ajax/savings-evergreen-insurance/service-center-confirm/email"} )
	public void sendAppointmentAcknowledgeMailByAjax(Model model, HttpServletRequest request,HttpServletResponse response){
		try {
			BaseResponse br = evergreenService.sendAppointmentAcknowledgeMail(request);
			logger.info("apiJsonObj:"+br);
			ajaxReturn(response,br);
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = {"/ajax/savings-evergreen-insurance/putTimeSession"})
	public void putTimeSession(Model model, HttpServletRequest request,HttpServletResponse response) {
		try {
			String perferredTime = request.getParameter("perferredTime");
			request.getSession().setAttribute("perferredTime", perferredTime);
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = {"/ajax/savings-evergreen-insurance/getAppointmentAccessCode"})
	public void getAppointmentAccessCode(Model model, HttpServletRequest request,HttpServletResponse response) {
		try {
			evergreenService.getAppointmentAccessCode(model, request, response);
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
}
