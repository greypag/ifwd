package com.ifwd.fwdhk.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.services.OverseaService;
import com.ifwd.fwdhk.util.Methods;
@Controller
public class AjaxOverseaController extends BaseController{
	private final static Logger logger = LoggerFactory.getLogger(AjaxOverseaController.class);
	
	@Autowired
	private RestServiceDao restService;
	@Autowired
	private OverseaService overseaService;
	

	@RequestMapping(value = {"/ajax/oversea/prepareOverseaPlan"})
	public void getPlanDetails(Model model, HttpServletRequest request,HttpServletResponse response,HttpSession httpSession) {
		if (Methods.isXssAjax(request))
			return;
		try {
			overseaService.getPlanDetails(model, request, response, httpSession);
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
}
