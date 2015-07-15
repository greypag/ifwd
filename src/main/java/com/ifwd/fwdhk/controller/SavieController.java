package com.ifwd.fwdhk.controller;



import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.model.savie.SavieFormApplicationBean;
import com.ifwd.fwdhk.services.SavieService;
import com.ifwd.fwdhk.util.SaviePageFlowControl;
@Controller
public class SavieController extends BaseController{
	
	private final static Logger logger = LoggerFactory.getLogger(SavieController.class);
	
	@Autowired
	private RestServiceDao restService;
	@Autowired
	private SavieService savieService;

	@RequestMapping(value = {"/{lang}/saving-insurance/landing","/{lang}/saving-insurance"})
	public ModelAndView getSavieLanding(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request);
	}
	
	@RequestMapping(value = {"/{lang}/saving-insurance/plan-details"})
	public ModelAndView getSaviePlanDetails(Model model, HttpServletRequest request) {		
		return SaviePageFlowControl.pageFlow(model,request);
	}	
	
	
	@RequestMapping(value = {"/{lang}/saving-insurance/financial-needs-analysis"})
	public ModelAndView getSavieFNA(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request);
	}
	
	@RequestMapping(value = {"/{lang}/saving-insurance/sales-illustration"})
	public ModelAndView getSavieIllustration(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request);
	}
	
	@RequestMapping(value = {"/{lang}/saving-insurance/application"})
	public ModelAndView getSaviePersonalinfo(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request);
	}
	
	@RequestMapping(value = {"/{lang}/saving-insurance/application-summary"})
	public ModelAndView getSavieOrderSummary(Model model, HttpServletRequest request,@ModelAttribute("detailInfo")SavieFormApplicationBean savieDetail) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		logger.debug(savieDetail.getSavieApplicantBean().getFirstName());
		logger.debug(savieDetail.getSavieEmploymentBean().getEmploymentStatus());
		request.getSession().setAttribute("savieDetail", savieDetail);
		
		return SaviePageFlowControl.pageFlow(model,request);
	}
	
	@RequestMapping(value = {"/{lang}/saving-insurance/customer-service-centre"})
	public ModelAndView getSavieAppointment(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request);
	}
	
	@RequestMapping(value = {"/{lang}/saving-insurance/document-upload"})
	public ModelAndView getSavieDocumentUpload(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request);
	}
	
	
	@RequestMapping(value = {"/{lang}/saving-insurance/confirmation"})
	public ModelAndView getSavieThankyou(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request);
	}
	
	@RequestMapping(value = {"/{lang}/saving-insurance/declarations"})
	public ModelAndView getSavieDeclarationAuthorization(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request);
	}
	
	@RequestMapping(value = {"/{lang}/saving-insurance/signature"})
	public ModelAndView getSavieSignature(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request);
	}
	

	
	/**
	 * test save image
	 * @param model
	 * @param request
	 * @param response
	 * @param file
	 * @throws Exception
	 */
	
	@RequestMapping(value = {"/{lang}/sendEmail"})
	public String getsendEmailInfo(Model model, HttpServletRequest request) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		return UserRestURIConstants.getSitePath(request)+ "savie/savie-sendEmail";
	}
	
	@RequestMapping(value = {"/savie-image"},method=RequestMethod.POST)
	public void getSavieImage(Model model, HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value="file", required=false) MultipartFile file) throws Exception{
		
		 byte[] bytes = file.getBytes(); 
		 String str =  getBASE64(bytes);
		 int i = str.length();
		 byte[] bytess = getFromBASE64(str);
	        System.out.println(file.getOriginalFilename());  
	        String uploadDir = request.getRealPath("/")+"upload";  
	        File dirPath = new File(uploadDir);  
	        if (!dirPath.exists()) {   
	            dirPath.mkdirs();  
	        }  
	        String sep = System.getProperty("file.separator");  
	        File uploadedFile = new File(uploadDir + sep  
	                + file.getOriginalFilename());  
	        FileCopyUtils.copy(bytess, uploadedFile);  
	        response.getWriter().write("true");  
	}
	
	/**
	 * test save signature image/svg
	 * @param model
	 * @param request
	 * @param response
	 * @param image BASE64String 
	 * @throws Exception
	 */
	@RequestMapping(value = {"/savie-save-signature"},method=RequestMethod.POST)
	public void getSavieSaveJsignature(Model model, HttpServletRequest request,HttpServletResponse response,
			@RequestParam String image) throws Exception{
		
		 //byte[] bytes = file.getBytes(); 
		 //String str =  getBASE64(bytes);
		 int i = image.length();
		 byte[] bytess = getFromBASE64(image);
	       // System.out.println(file.getOriginalFilename());  
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
	
	
	@SuppressWarnings("restriction")
	public  String getBASE64(byte[] bytes) { 
		if (bytes == null) return null; 
		return (new sun.misc.BASE64Encoder()).encode(bytes); 
	} 

	// 将 BASE64 编码的字符串 s 进行解码 
	@SuppressWarnings("restriction")
	public  byte[] getFromBASE64(String s) { 
		if (s == null) return null; 
		sun.misc.BASE64Decoder decoder = new sun.misc.BASE64Decoder(); 
		try { 
			byte[] b = decoder.decodeBuffer(s); 
			return b; 
		} catch (Exception e) { 
			return null; 
		} 
	}
	
}
