package com.ifwd.fwdhk.controller;



import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.connector.response.BaseResponse;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.SendEmailInfo;
import com.ifwd.fwdhk.services.SavieService;
import com.ifwd.fwdhk.util.ZipUtils;
@Controller
public class AjaxSavieController extends BaseController{
	private final static Logger logger = LoggerFactory.getLogger(AjaxSavieController.class);
	
	@Autowired
	private RestServiceDao restService;
	@Autowired
	private SavieService savieService;

	@RequestMapping(value = {"/ajax/savie/planDetails/get"})
	public void getPlanDetailsByAjax(Model model, HttpServletRequest request,HttpServletResponse response,HttpSession httpSession) {
		try {
			savieService.getPlanDetails(model, request, response, httpSession);;
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = {"/ajax/savie/sales-illustration/createPdf"})
	public void createSalesIllustrationPdfByAjax(Model model, HttpServletRequest request,HttpServletResponse response,HttpSession httpSession) throws Exception {
		try {
			savieService.createSalesIllustrationPdf(model, request, response, httpSession);;
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = {"/ajax/savie/miniCaculator/sendEmail"} )
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
	
	
	@RequestMapping(value = {"/ajax/savie/interestedGather/get"} )
	public void sendLeadByAjax(Model model, HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam String email,
			@RequestParam String mobileNo,
			@RequestParam String answer1,
			@RequestParam String step) {
		
		try {
			
			BaseResponse br = savieService.sendLead(request);
			
			logger.info("apiJsonObj:"+br);
			
			ajaxReturn(response,br);
			
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}

	}
	
	
	@RequestMapping(value = {"/ajax/savie/savie-image/post"},method=RequestMethod.POST)
	public void getSavieImage(Model model, HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value="file", required=false) MultipartFile file) throws Exception{
			byte[] bytes = file.getBytes(); 
			// String gzip = ZipUtils.gzip(bytes);
			logger.info("fileName:"+file.getOriginalFilename());
	        String uploadDir = request.getRealPath("/")+"upload";  
	        File dirPath = new File(uploadDir);  
	        if (!dirPath.exists()) {   
	            dirPath.mkdirs();  
	        }  
	        String sep = System.getProperty("file.separator");  
	        File uploadedFile = new File(uploadDir + sep  
	                + file.getOriginalFilename());  
	        FileCopyUtils.copy(bytes, uploadedFile);  
	        response.getWriter().write("true");  
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
	@SuppressWarnings("restriction")
	@RequestMapping(value = {"/ajax/savie/savie-save-signature/post"},method=RequestMethod.POST)
	public void getSavieSaveJsignature(Model model, HttpServletRequest request,HttpServletResponse response,
			@RequestParam String image) throws Exception{

			String gzip = ZipUtils.gzip(new sun.misc.BASE64Decoder().decodeBuffer(image));
			String unGzip = ZipUtils.gunzip(gzip);
	
			byte[] bytess = unGzip.getBytes();//new sun.misc.BASE64Decoder().decodeBuffer(image);
		
	        String uploadDir = request.getRealPath("/")+"upload";  
	        File dirPath = new File(uploadDir);  
	        if (!dirPath.exists()) {   
	            dirPath.mkdirs();  
	        }  
	        String sep = System.getProperty("file.separator");  
	        File uploadedFile = new File(uploadDir + sep  
	                + "signature.svg"); 
	        FileCopyUtils.copy(bytess, uploadedFile);  
	        response.getWriter().write("true"); 
	}
	
}
