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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.connector.response.BaseResponse;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.SendEmailInfo;
import com.ifwd.fwdhk.services.EvergreenService;
import com.ifwd.fwdhk.util.Methods;
import com.ifwd.fwdhk.util.ValidationUtils;
@Controller
public class AjaxEvergreenController extends BaseController{
	private final static Logger logger = LoggerFactory.getLogger(AjaxEvergreenController.class);
	
	@Autowired
	private RestServiceDao restService;
	@Autowired
	private EvergreenService evergreenService;
	

	@RequestMapping(value = {"/ajax/savings-evergreen-insurance/planDetails/get"})
	public void getPlanDetailsByAjax(Model model, HttpServletRequest request,HttpServletResponse response,HttpSession httpSession) {
		if (Methods.isXssAjax(request))
			return;
		try {
			evergreenService.getPlanDetails(model, request, response, httpSession);
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = {"/ajax/savings-evergreen-insurance/createPdf"})
	public void createSalesIllustrationPdfByAjax(Model model, HttpServletRequest request,HttpServletResponse response,HttpSession httpSession) throws Exception {
		try {
			evergreenService.createSalesIllustrationPdf(model, request, response, httpSession);
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = {"/ajax/savings-evergreen-insurance/uploadPdf"})
	public void uploadSalesIllustrationPdfByAjax(Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {
		try {
			evergreenService.uploadSalesIllustrationPdf(model, request, response);
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = {"/ajax/savings-evergreen-insurance/miniCaculator/sendEmail"} )
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
		if (Methods.isXssAjax(request))
			return;
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
			
			BaseResponse br = evergreenService.sendEmail(request,sei);
			
			logger.info("apiJsonObj:"+br);
			
			ajaxReturn(response,br);
			
			
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		
		
	}
	
	
	@RequestMapping(value = {"/ajax/savings-evergreen-insurance/interestGather/post"} )
	public void sendLeadByAjax(Model model, HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam String email,
			@RequestParam String mobileNo,
			@RequestParam String answer1,
			@RequestParam String step,
			@RequestParam String captcha) {
		
		if (Methods.isXssAjax(request))
			return;
		
		try {
			
			boolean isValidRequest = true;

			if ("1".equals(step)) {
				isValidRequest = ValidationUtils.verifyGoogleRecaptcha(captcha);
			}
			if (!isValidRequest) {
				try {
					response.setContentType("text/json;charset=utf-8");					
					response.getWriter().print("{\"errMsgs\":\"captcha error\"}");
				}catch(Exception e) {
					e.printStackTrace();
				}				
			} else {
				BaseResponse br = evergreenService.sendLead(request);
				
				logger.info("apiJsonObj:"+br);
				
				ajaxReturn(response,br);
			}
			
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}

	}
	
	

	@RequestMapping(value = {"/ajax/savings-evergreen-insurance/messages/email"} )
	public void sendMessagesEmailByAjax(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		
		try {
			
			BaseResponse br = evergreenService.sendMessagesEmail(request);
			
			logger.info("apiJsonObj:"+br);
			
			ajaxReturn(response,br);
			
			
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		
		
	}
	
	
	@RequestMapping(value = {"/ajax/savings-evergreen-insurance/savie-image/post"},method=RequestMethod.POST)
	public void getSavieImage(Model model, HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value="file", required=false) MultipartFile file){
			try {
				logger.info("fileName:"+file.getOriginalFilename());
				BaseResponse br = evergreenService.uploadDocuments(request,file);
				logger.info("apiJsonObj:"+br);
				ajaxReturn(response,br);
			} catch (ECOMMAPIException e) {
				logger.info(e.getMessage());
				e.printStackTrace();
			}
	}
	
	/**
	 * test save signature image/svg
	 * @param model
	 * 
	 * @param request
	 * @param response
	 * @param image BASE64String 
	 * @throws Exception
	 */
	@RequestMapping(value = {"/ajax/savings-evergreen-insurance/savie-save-signature/post"},method=RequestMethod.POST)
	public void getSavieSaveJsignature(Model model, HttpServletRequest request,HttpServletResponse response,
			@RequestParam String image){

		try {
			BaseResponse br = evergreenService.signature(request,image);
			logger.info("apiJsonObj:"+br);
			ajaxReturn(response,br);
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
 
	}
	
	@RequestMapping(value = {"/ajax/savings-evergreen-insurance/application/getOccupation"})
	public void getOccupationByAjax(Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {
		try {
			evergreenService.getOccupation(model, request, response);
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = {"/ajax/savings-evergreen-insurance/verifyAccessCode"})
	public void verifyAccessCode(Model model, HttpServletRequest request
			,HttpServletResponse response) {
		try {
			evergreenService.verifyAccessCode(model, request, response);
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	/**
	 * 通过ajax获取可预约时间段
	 */
	@RequestMapping(value = {"/ajax/savings-evergreen-insurance/getAllAvailableTimeSlot"})
	public void getAllAvailableTimeSlot(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			evergreenService.getAllAvailableTimeSlot(model, request, response);
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	/**
	 * 通过ajax获取时间段
	 */
	@RequestMapping(value = {"/ajax/savings-evergreen-insurance/getTimeSlot"})
	public void getTimeSlot(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			evergreenService.getTimeSlot(model, request, response);
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
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
	
	/**
	 * 保存储蓄金额
	 * @return 
	 */
	@RequestMapping(value = {"/ajax/savings-evergreen-insurance/saveAmount"})
	public void saveAmount(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			evergreenService.saveAmount(model, request, response);
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
