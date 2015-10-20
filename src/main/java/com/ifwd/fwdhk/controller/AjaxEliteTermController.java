package com.ifwd.fwdhk.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

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
	
	@RequestMapping(value = {"/ajax/eliteTerm/getEliteTermImage"},method = RequestMethod.POST)
	  public void doAddImageByGroupId(HttpServletRequest request, HttpServletResponse response,
	            @RequestParam(value = "name", required = true) String name,
	            @RequestParam(value = "img", required = true) CommonsMultipartFile imageFile
	            ) throws Exception {
			try {
				String uploadDir = request.getRealPath("/")+"upload"+"/"+"123456";  
		        File dirPath = new File(uploadDir);  
		        if (!dirPath.exists()) {   
		            dirPath.mkdirs();  
		        } 
		        String[] str = imageFile.getContentType().split("/");
		        String imageName = name+"."+str[str.length-1];
				request.getSession().setAttribute(name, imageName);
				request.getSession().setAttribute(name+"Type", str[str.length-1]);
		        byte[] bytes = imageFile.getBytes();
		        String sep = System.getProperty("file.separator");  
		        File uploadedFile = new File(uploadDir + sep  
		                + imageName);  
		        FileCopyUtils.copy(bytes, uploadedFile);  
		        response.getWriter().write("true");
			} catch (Exception e) {
				logger.info(e.getMessage());
				e.printStackTrace();
			}
	}
	
	@RequestMapping(value = {"/ajax/eliteTerm/getEliteTermSendImageFlage"},method = RequestMethod.POST)
	  public void getEliteTermSendImageFlage(HttpServletRequest request, HttpServletResponse response,
	            @RequestParam String passportFlage,
	            @RequestParam String uploadLaterFlage
	            ) throws Exception {
			try {
				request.getSession().setAttribute("passportFlage", passportFlage);
				request.getSession().setAttribute("uploadLaterFlage", uploadLaterFlage);
			} catch (Exception e) {
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
	
	@RequestMapping(value = {"/ajax/eliteTerm/uploadSignature"})
	public void uploadSignature(HttpServletRequest request,HttpServletResponse response,@RequestParam String image){
		if (Methods.isXssAjax(request))
			return;
		try {
			ajaxReturn(response,eliteTermService.uploadSignature(request, image));
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
	
	@RequestMapping(value = {"/ajax/eliteTerm/sendEliteTermMail"})
	public void sendEliteTermMail(HttpServletRequest request,HttpServletResponse response) {
		if (Methods.isXssAjax(request))
			return;
		try {
			ajaxReturn(response, eliteTermService.sendEliteTermMail(request));
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
	
	@RequestMapping(value = {"/ajax/eliteTerm/uploadDocuments"})
	public void uploadDocuments(HttpServletRequest request,HttpServletResponse response,@RequestParam String file){
		if (Methods.isXssAjax(request))
			return;
		try {
			ajaxReturn(response,eliteTermService.uploadDocuments(request, file));
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
}
