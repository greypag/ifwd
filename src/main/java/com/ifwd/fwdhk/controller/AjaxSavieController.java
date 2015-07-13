package com.ifwd.fwdhk.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.connector.response.BaseResponse;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.SendEmailInfo;
import com.ifwd.fwdhk.services.SavieService;
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
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = {"/ajax/savie/sendEmailByAjax"} )
	public void sendEmailByAjax(Model model, HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam String dreamName,
			@RequestParam String dreamLevelDescription,
			@RequestParam int dreamBudget,
			@RequestParam int currentSavings,
			@RequestParam int savingPeriod,
			@RequestParam int annualReturnRate,
			@RequestParam float monthSavingsNoInterest,
			@RequestParam float monthSavingsWithInterest,
			@RequestParam String playerEmail) {
		
		SendEmailInfo sei = new SendEmailInfo();
		sei.setDreamName(dreamName);
		sei.setDreamLevelDescription(dreamLevelDescription);
		sei.setDreamBudget(dreamBudget);
		sei.setCurrentSavings(currentSavings);
		sei.setSavingPeriod(savingPeriod);
		sei.setAnnualReturnRate(annualReturnRate);
		sei.setMonthSavingsNoInterest(monthSavingsNoInterest);
		sei.setMonthSavingsWithInterest(monthSavingsWithInterest);
		sei.setPlayerEmail(playerEmail);
		
		try {
			BaseResponse br = savieService.SendEmail(request,sei);
			
			logger.info("apiJsonObj:"+br);
			
			ajaxReturn(response,br);
			
			
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		
		
	}
	
	
	@RequestMapping(value = {"/ajax/savie/sendLeadByAjax"} )
	public void sendLeadByAjax(Model model, HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam String email,
			@RequestParam String answer1,
			@RequestParam String step) {
		
		try {
			
			BaseResponse br = savieService.sendLead(email,answer1,step);
			
			logger.info("apiJsonObj:"+br);
			
			ajaxReturn(response,br);
			
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		
			
	
	}
}
