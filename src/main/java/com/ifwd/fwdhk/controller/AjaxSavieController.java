package com.ifwd.fwdhk.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.model.SendEmailInfo;
import com.ifwd.fwdhk.model.savie.SavieFormApplicationBean;
import com.ifwd.fwdhk.services.SavieService;
import com.ifwd.fwdhk.util.SaviePageFlowControl;
@Controller
public class AjaxSavieController extends BaseController{
	
	private final static Logger logger = LoggerFactory.getLogger(AjaxSavieController.class);
	
	@Autowired
	private RestServiceDao restService;
	@Autowired
	private SavieService savieService;

	@RequestMapping(value = {"/ajax/savie/planDetails/get"})
	public void getPlanDetailsByAjax(Model model, HttpServletRequest request,HttpServletResponse response) {
		try {
			savieService.getPlanDetails(model, request, response);
		} catch (Exception e) {
			
			// TODO: handle exception
		}
	}
}
