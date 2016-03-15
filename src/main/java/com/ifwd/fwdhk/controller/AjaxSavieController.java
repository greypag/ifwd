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
import com.ifwd.fwdhk.services.SavieService;
import com.ifwd.fwdhk.util.Methods;
import com.ifwd.fwdhk.util.ValidationUtils;
@Controller
public class AjaxSavieController extends BaseController{
	private final static Logger logger = LoggerFactory.getLogger(AjaxSavieController.class);
	
	@Autowired
	private RestServiceDao restService;
	@Autowired
	private SavieService savieService;
	

	@RequestMapping(value = {"/ajax/savie/planDetails/get"})
	public void getPlanDetailsByAjax(Model model, HttpServletRequest request,HttpServletResponse response,HttpSession httpSession) {
		if (Methods.isXssAjax(request))
			return;
		try {
			savieService.getPlanDetails(model, request, response, httpSession);
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = {"/ajax/savie/sales-illustration/createPdf"})
	public void createSalesIllustrationPdfByAjax(Model model, HttpServletRequest request,HttpServletResponse response,HttpSession httpSession) throws Exception {
		try {
			savieService.createSalesIllustrationPdf(model, request, response, httpSession);
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = {"/ajax/savie/sales-illustration/uploadPdf"})
	public void uploadSalesIllustrationPdfByAjax(Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {
		try {
			savieService.uploadSalesIllustrationPdf(model, request, response);
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	/*@RequestMapping(value = {"/ajax/savie/miniCaculator/sendEmail"} )
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
			
			BaseResponse br = savieService.sendEmail(request,sei);
			
			logger.info("apiJsonObj:"+br);
			
			ajaxReturn(response,br);
			
			
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		
		
	}*/
	
	
	@RequestMapping(value = {"/ajax/savie/interestGather/post"} )
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
				BaseResponse br = savieService.sendLead(request);
				
				logger.info("apiJsonObj:"+br);
				
				ajaxReturn(response,br);
			}
			
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}

	}
	
	

	@RequestMapping(value = {"/ajax/savie/messages/email"} )
	public void sendMessagesEmailByAjax(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		
		try {
			
			BaseResponse br = savieService.sendMessagesEmail(request);
			
			logger.info("apiJsonObj:"+br);
			
			ajaxReturn(response,br);
			
			
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		
		
	}
	
	
	@RequestMapping(value = {"/ajax/savie/savie-image/post"},method=RequestMethod.POST)
	public void getSavieImage(Model model, HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value="file", required=false) MultipartFile file){
			try {
				logger.info("fileName:"+file.getOriginalFilename());
				BaseResponse br = savieService.uploadDocuments(request,file);
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
	@RequestMapping(value = {"/ajax/savie/savie-save-signature/post"},method=RequestMethod.POST)
	public void getSavieSaveJsignature(Model model, HttpServletRequest request,HttpServletResponse response,
			@RequestParam String image){

		try {
			BaseResponse br = savieService.signature(request,image);
			logger.info("apiJsonObj:"+br);
			ajaxReturn(response,br);
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
 
	}
	
	@RequestMapping(value = {"/ajax/savie/application/getOccupation"})
	public void getOccupationByAjax(Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {
		try {
			savieService.getOccupation(model, request, response);
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = {"/ajax/savie/savings-insurance/verifyAccessCode"})
	public void verifyAccessCode(Model model, HttpServletRequest request
			,HttpServletResponse response) {
		try {
			savieService.verifyAccessCode(model, request, response);
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	/**
	 * 通过ajax获取可预约时间段
	 */
	@RequestMapping(value = {"/ajax/savie/savings-insurance/getAllAvailableTimeSlot"})
	public void getAllAvailableTimeSlot(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			savieService.getAllAvailableTimeSlot(model, request, response);
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	/**
	 * 通过ajax获取时间段
	 */
	@RequestMapping(value = {"/ajax/savie/savings-insurance/getTimeSlot"})
	public void getTimeSlot(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			savieService.getTimeSlot(model, request, response);
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	/**
	 * 保存储蓄金额
	 * @return 
	 */
	@RequestMapping(value = {"/ajax/savie/savings-insurance/saveAmount"})
	public void saveAmount(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			savieService.saveAmount(model, request, response);
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		
	}
}
