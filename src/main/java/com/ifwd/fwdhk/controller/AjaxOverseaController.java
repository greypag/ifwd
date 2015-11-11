package com.ifwd.fwdhk.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.OverseaDetailsForm;
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
	public void preparePlanDetails(Model model, HttpServletRequest request,HttpServletResponse response,HttpSession httpSession) {
		if (Methods.isXssAjax(request))
			return;
		try {
			overseaService.preparePlanDetails(model, request, response, httpSession);
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/ajax/oversea/prepareOverseaSummary")
	@ResponseBody
	public String prepareOverseaSummary(
			@ModelAttribute("frmYourDetails") OverseaDetailsForm planDetailsForm,
			BindingResult result, Model model, HttpServletRequest request) throws Exception {
		try {
			return overseaService.prepareOverseaSummary(planDetailsForm, result, model, request);
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
			return "fail";
		}
	}
}
