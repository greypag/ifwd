package com.ifwd.fwdhk.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.connector.response.BaseResponse;
import com.ifwd.fwdhk.connector.response.eliteterm.CreateEliteTermPolicyResponse;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.eliteterm.EliteTermPlanDetailBean;
import com.ifwd.fwdhk.services.EliteTermService;
import com.ifwd.fwdhk.util.ErrorMessageUtils;
import com.ifwd.fwdhk.util.ImgUtil;
import com.ifwd.fwdhk.util.Methods;
@Controller
public class AjaxEliteTermController extends BaseController{
	
	private static final Logger logger = LoggerFactory.getLogger(AjaxEliteTermController.class);
	
	private static final String WATERMARK = "/resources/images/elite-terms/Watermark.png";
	
	@Autowired
	private RestServiceDao restService;
	@Autowired
	private EliteTermService eliteTermService;


	@SuppressWarnings({ "restriction" })
	@RequestMapping(value = {"/ajax/eliteTerm/postEliteTermImage"})
	  public void doAddImageByForm(HttpServletRequest request, HttpServletResponse response,
			  MultipartFile iframeHkidFileToUpload,
			  MultipartFile iframePassportFileToUpload,
			  MultipartFile iframeFileToUpload
	            ) throws Exception {
		if (Methods.isXssAjax(request)) {
			return;
		}
		
		MultipartFile file;
		String imgName;
		if( iframeHkidFileToUpload!= null) {
			file = iframeHkidFileToUpload;
			imgName = "hkidFileToUpload";
		}else if( iframePassportFileToUpload!= null) {
			file = iframePassportFileToUpload;
			imgName = "passportFileToUpload";
		}else if( iframeFileToUpload!= null) {
			file = iframeFileToUpload;
			imgName = "fileToUploadProofAdd";
		}else{
			return;
		}
		
		try {
				String imgMaxSize = UserRestURIConstants.getConfigs("imgMaxSize");
				long size = file.getSize();
				if(size/(1024*1024) > Integer.valueOf(imgMaxSize)){
					throw new ECOMMAPIException(ErrorMessageUtils.getMessage("picture.not.greater.than",request)+" "+imgMaxSize+"MB");
				}
				
				CreateEliteTermPolicyResponse eliteTermPolicy = (CreateEliteTermPolicyResponse) request.getSession().getAttribute("eliteTermPolicy");
				String policyNo = eliteTermPolicy.getPolicyNo();
				String documentPath = UserRestURIConstants.getConfigs("documentPath");
				String uploadDir = documentPath + "/"+new sun.misc.BASE64Encoder().encode(policyNo.getBytes()); 
		        File dirPath = new File(uploadDir);  
		        if (!dirPath.exists()) {   
		            dirPath.mkdirs();  
		        } 
		        String fileName = file.getOriginalFilename();
		        
		        
		        String realName = imgName+".jpg";
				request.getSession().setAttribute(imgName, realName);
				request.getSession().setAttribute(imgName+"Type", "jpg");
		        byte[] bytes = file.getBytes();
		        String sep = System.getProperty("file.separator");  
		        File uploadedFile = new File(uploadDir + sep  
		                + fileName);  
		        FileCopyUtils.copy(bytes, uploadedFile); 
		        String toPath = uploadDir + sep + realName;
		        logger.debug("toPath: " + toPath);
				File toFile = new File(toPath);
		        ImgUtil.ImageToPdfToJPG(uploadDir + sep+ fileName, uploadDir + sep + imgName + ".pdf", toFile , request);
		        String copyImagePath = request.getRealPath(WATERMARK);
				logger.debug("copyImagePath: " + copyImagePath);
		        File copyImageFile = new File(copyImagePath);
				try {
					ImgUtil.pressImage(copyImageFile, toFile, 0, 0);
				} catch (Exception e) {
					logger.error(ExceptionUtils.getStackTrace(e));
					response.getWriter().write("system error");
				}
		        response.getWriter().write("true");
		    } catch (ECOMMAPIException e) {
		    	logger.error(ExceptionUtils.getStackTrace(e));
		    	String error = e.getMessage();
				response.setCharacterEncoding("utf-8");  //这里不设置编码会有乱码
	            response.setContentType("text/plain;charset=utf-8");
	            response.setHeader("Cache-Control", "no-cache");  
	            response.getWriter().write(error);
	        }catch (Exception e) {
	        	logger.error(ExceptionUtils.getStackTrace(e));
				response.getWriter().write("system error");
	        }
	}
	
	@SuppressWarnings({ "restriction" })
	@RequestMapping(value = {"/ajax/eliteTerm/getEliteTermImage"},method = RequestMethod.POST)
	  public void doAddImageByGroupId(HttpServletRequest request, HttpServletResponse response,
	            @RequestParam(value = "name", required = true) String name,
	            @RequestParam(value = "img", required = true) MultipartFile imageFile
	            ) throws Exception {
			if (Methods.isXssAjax(request)) {
				return;
			}
		
			try {
				String imgMaxSize = UserRestURIConstants.getConfigs("imgMaxSize");
				long size = imageFile.getSize();
				if(size/(1024*1024) > Integer.valueOf(imgMaxSize)){
					throw new ECOMMAPIException(ErrorMessageUtils.getMessage("picture.not.greater.than",request)+" "+imgMaxSize+"MB");
				}
				
				CreateEliteTermPolicyResponse eliteTermPolicy = (CreateEliteTermPolicyResponse) request.getSession().getAttribute("eliteTermPolicy");
				String policyNo = eliteTermPolicy.getPolicyNo();
				String documentPath = UserRestURIConstants.getConfigs("documentPath");
				String uploadDir = documentPath + "/"+new sun.misc.BASE64Encoder().encode(policyNo.getBytes()); 
		        File dirPath = new File(uploadDir);  
		        if (!dirPath.exists()) {   
		            dirPath.mkdirs();  
		        } 
		        String fileName = imageFile.getOriginalFilename();
		        String realName = name+".jpg";
				request.getSession().setAttribute(name, realName);
				request.getSession().setAttribute(name+"Type", "jpg");
		        byte[] bytes = imageFile.getBytes();
		        String sep = System.getProperty("file.separator");  
		        File uploadedFile = new File(uploadDir + sep  
		                + fileName);  
		        FileCopyUtils.copy(bytes, uploadedFile); 
		        String toPath = uploadDir + sep + realName;
		        logger.debug("toPath: " + toPath);
				File toFile = new File(toPath);
		        ImgUtil.ImageToPdfToJPG(uploadDir + sep+ fileName, uploadDir + sep + name + ".pdf", toFile , request);
				String copyImagePath = request.getRealPath(WATERMARK);
				logger.debug("copyImagePath: " + copyImagePath);
				File copyImageFile = new File(copyImagePath);
				ImgUtil.pressImage(copyImageFile, toFile, 0, 0);
		        response.getWriter().write("true");
			} catch (ECOMMAPIException e) {
				logger.error(ExceptionUtils.getStackTrace(e));
				String error = e.getMessage();
				response.setCharacterEncoding("utf-8");  //这里不设置编码会有乱码
	            response.setContentType("text/plain;charset=utf-8");
	            response.setHeader("Cache-Control", "no-cache");  
				response.getWriter().write(error);
			}catch (Exception e) {
				logger.error(ExceptionUtils.getStackTrace(e));
				response.getWriter().write("system error");
			}
	}

	
	@RequestMapping(value = {"/ajax/eliteTerm/getEliteTermSendImageFlage"},method = RequestMethod.POST)
	  public void getEliteTermSendImageFlage(HttpServletRequest request, HttpServletResponse response,
	            @RequestParam String passportFlage,
	            @RequestParam String uploadLaterFlage
	            ) throws Exception {
			if (Methods.isXssAjax(request)) {				
				return;
			}
		
			try {
				request.getSession().setAttribute("uploadLaterFlage", uploadLaterFlage);
				ajaxReturn(response, eliteTermService.sendImage(request,passportFlage));
			} catch (Exception e) {
				logger.info(e.getMessage());
				e.printStackTrace();
			}
	}
	
	
	@RequestMapping(value = {"/ajax/eliteTerm/getEliteTermPremium"})
	public void getEliteTermPremium(EliteTermPlanDetailBean etPlanDetail,HttpServletRequest request,HttpServletResponse response) {
		if (Methods.isXssAjax(request)) {
			return;
		}
		try {
			ajaxReturn(response, eliteTermService.getEliteTermPremium(etPlanDetail, request));
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = {"/ajax/eliteTerm/createEliteTermPolicy"})
	public void createEliteTermPolicy(HttpServletRequest request,HttpServletResponse response) {
		if (Methods.isXssAjax(request)) {
			return;
		}
		try {
			ajaxReturn(response, eliteTermService.createEliteTermPolicy(request));
		} catch (ECOMMAPIException e) {
            BaseResponse errorResponse = new BaseResponse();
            errorResponse.setErrMsg(e.getMessage());
            ajaxReturn(response, errorResponse);
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = {"/ajax/eliteTerm/uploadSignature"})
	public void uploadSignature(HttpServletRequest request,HttpServletResponse response,@RequestParam String image,@RequestParam String policyNo){
		if (Methods.isXssAjax(request)) {
			return;
		}
		try {
			ajaxReturn(response,eliteTermService.uploadSignature(request,image,policyNo));
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}

	@RequestMapping(value = {"/ajax/eliteTerm/finalizeEliteTermPolicy"})
	public void finalizeEliteTermPolicy(HttpServletRequest request,HttpServletResponse response) {
		if (Methods.isXssAjax(request)) {
			return;
		}
		try {
			CreateEliteTermPolicyResponse eliteTermPolicy = (CreateEliteTermPolicyResponse) request.getSession().getAttribute("eliteTermPolicy");
			ajaxReturn(response, eliteTermService.finalizeEliteTermPolicy(request,eliteTermPolicy.getPolicyNo()));
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = {"/ajax/eliteTerm/sendEliteTermMail"})
	public void sendEliteTermMail(HttpServletRequest request,HttpServletResponse response) {
		if (Methods.isXssAjax(request)) {
			return;
		}
		try {
			ajaxReturn(response, eliteTermService.sendEliteTermMail(request));
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = {"/ajax/eliteTerm/getUploadedDocument"})
	public void getUploadedDocument(HttpServletRequest request,HttpServletResponse response) {
		if (Methods.isXssAjax(request)) {
			return;
		}
		try {
			ajaxReturn(response, eliteTermService.getUploadedDocument(request));
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = {"/ajax/eliteTerm/contactCs"})
	public void contactCs(HttpServletRequest request,HttpServletResponse response) {
		if (Methods.isXssAjax(request)) {
			return;
		}
		try {
			ajaxReturn(response, eliteTermService.contactCs(request));
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = {"/ajax/eliteTerm/setEliteTermPolicyAgentEmail"})
	public void setEliteTermPolicyAgentEmail(HttpServletRequest request,HttpServletResponse response) {
		if (Methods.isXssAjax(request)) {
			return;
		}
		try {
			ajaxReturn(response, eliteTermService.setEliteTermPolicyAgentEmail(request));
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping(value = {"/ajax/eliteTerm/putEtPlanOptionSession"})
	public void putEtPlanOptionSession(HttpServletRequest request,HttpServletResponse response) {
		if (Methods.isXssAjax(request)) {
			return;
		}
		try {
			eliteTermService.putEtPlanOptionSession(request);
			ajaxReturn(response,"success");
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	@RequestMapping(value = {"/ajax/eliteTerm/putEtPaymentSession"})
	public void putEtPaymentSession(HttpServletRequest request,HttpServletResponse response) {
		if (Methods.isXssAjax(request)) {
			return;
		}
		try {
			eliteTermService.putEtPaymentSession(request);
			ajaxReturn(response,"success");
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = {"/ajax/eliteTerm/getPromoteCode"})
	public void getPromoteCode(HttpServletRequest request,HttpServletResponse response) {
		if (Methods.isXssAjax(request)) {
			return;
		}
		try {
			ajaxReturn(response, eliteTermService.getPromoteCode(request));
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = {"/ajax/eliteTerm/putEtPageKeySession"})
	public void putEtPageKeySession(HttpServletRequest request,HttpServletResponse response) {
		if (Methods.isXssAjax(request)) {
			return;
		}
		try {
			eliteTermService.putEtPageKeySession(request);
			ajaxReturn(response,"success");
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = {"/ajax/eliteTerm/putPersonalInfoSession"})
	public void putPersonalInfoSession(HttpServletRequest request,HttpServletResponse response) {
		if (Methods.isXssAjax(request)) {
			return;
		}
		try {
			eliteTermService.putPersonalInfoSession(request);
			ajaxReturn(response,"success");
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = {"/ajax/eliteTerm/putEmploymentInfoSession"})
	public void putEmploymentInfoSession(HttpServletRequest request,HttpServletResponse response) {
		if (Methods.isXssAjax(request)) {
			return;
		}
		try {
			eliteTermService.putEmploymentInfoSession(request);
			ajaxReturn(response,"success");
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = {"/ajax/eliteTerm/putBeneficiaryInfoSession"})
	public void putBeneficiaryInfoSession(HttpServletRequest request,HttpServletResponse response) {
		if (Methods.isXssAjax(request)) {
			return;
		}
		try {
			eliteTermService.putBeneficiaryInfoSession(request);
			ajaxReturn(response,"success");
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
}
