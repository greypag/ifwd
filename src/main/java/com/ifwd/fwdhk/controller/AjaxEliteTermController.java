package com.ifwd.fwdhk.controller;

import java.io.File;
import java.lang.reflect.Method;
import java.security.AccessController;
import java.security.PrivilegedAction;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.connector.response.BaseResponse;
import com.ifwd.fwdhk.connector.response.eliteterm.CreateEliteTermPolicyResponse;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.services.EliteTermService;
import com.ifwd.fwdhk.util.ErrorMessageUtils;
import com.ifwd.fwdhk.util.ImgUtil;
import com.ifwd.fwdhk.util.Methods;
@Controller
public class AjaxEliteTermController extends BaseController{
	private final static Logger logger = LoggerFactory.getLogger(AjaxEliteTermController.class);
	
	@Autowired
	private RestServiceDao restService;
	@Autowired
	private EliteTermService eliteTermService;


	@SuppressWarnings({ "restriction" })
	@RequestMapping(value = {"/ajax/eliteTerm/postEliteTermImage"})
	  public void doAddImageByForm(HttpServletRequest request, HttpServletResponse response,
			  MultipartFile hkidFileToUpload,
			  MultipartFile passportFileToUpload,
			  MultipartFile fileToUpload
	            ) throws Exception {
		MultipartFile file;
		if( hkidFileToUpload!= null) {
			file = hkidFileToUpload;
		}else if( passportFileToUpload!= null) {
			file = passportFileToUpload;
		}else if( fileToUpload!= null) {
			file = fileToUpload;
		}else{
			return;
		}
		
		try {
				String imgMaxSize = UserRestURIConstants.getProperties("imgMaxSize");
				String name = file.getOriginalFilename();
				long size = file.getSize();
				if(size/(1024*1024) > Integer.valueOf(imgMaxSize)){
					throw new ECOMMAPIException(ErrorMessageUtils.getMessage("picture.not.greater.than",request)+" "+imgMaxSize+"MB");
				}
				
				CreateEliteTermPolicyResponse eliteTermPolicy = (CreateEliteTermPolicyResponse) request.getSession().getAttribute("eliteTermPolicy");
				String policyNo = eliteTermPolicy.getPolicyNo();
				String documentPath = UserRestURIConstants.getProperties("documentPath");
				String uploadDir = documentPath + "/"+new sun.misc.BASE64Encoder().encode(policyNo.getBytes()); 
		        File dirPath = new File(uploadDir);  
		        if (!dirPath.exists()) {   
		            dirPath.mkdirs();  
		        } 
		        String fileName = file.getOriginalFilename();
		        
		        String imgName = name.substring(0, name.lastIndexOf("."));
		        
		        String realName = imgName+".jpg";
				request.getSession().setAttribute(imgName, realName);
				request.getSession().setAttribute(imgName+"Type", "jpg");
		        byte[] bytes = file.getBytes();
		        String sep = System.getProperty("file.separator");  
		        File uploadedFile = new File(uploadDir + sep  
		                + fileName);  
		        FileCopyUtils.copy(bytes, uploadedFile); 
//		        if(!FileUtil.checkImageFile(uploadDir + sep  
//		                + fileName)){
//		        	throw new ECOMMAPIException("Illegal file");
//		        }
		        
		        File toFile = new File(uploadDir + sep  
				                + realName);
		        ImgUtil.ImageToPdfToJPG(uploadDir + sep+ fileName, uploadDir + sep + imgName + ".pdf", toFile , request);
//				ImgUtil.changeImageToJPG(uploadedFile,toFile,request);
		        response.getWriter().write("true");
		    } catch (ECOMMAPIException e) {
				String error = e.getMessage();
				response.setCharacterEncoding("utf-8");  //这里不设置编码会有乱码
	            response.setContentType("text/plain;charset=utf-8");
	            response.setHeader("Cache-Control", "no-cache");  
	            response.getWriter().write(error);
	        }catch (Exception e) {
				logger.info(e.getMessage());
				e.printStackTrace();
				response.getWriter().write("system error");
	        }
	}
	
	@SuppressWarnings({ "restriction" })
	@RequestMapping(value = {"/ajax/eliteTerm/getEliteTermImage"},method = RequestMethod.POST)
	  public void doAddImageByGroupId(HttpServletRequest request, HttpServletResponse response,
	            @RequestParam(value = "name", required = true) String name,
	            @RequestParam(value = "img", required = true) MultipartFile imageFile
	            ) throws Exception {
			try {
				String imgMaxSize = UserRestURIConstants.getProperties("imgMaxSize");
				long size = imageFile.getSize();
				if(size/(1024*1024) > Integer.valueOf(imgMaxSize)){
					throw new ECOMMAPIException(ErrorMessageUtils.getMessage("picture.not.greater.than",request)+" "+imgMaxSize+"MB");
				}
				
				CreateEliteTermPolicyResponse eliteTermPolicy = (CreateEliteTermPolicyResponse) request.getSession().getAttribute("eliteTermPolicy");
				String policyNo = eliteTermPolicy.getPolicyNo();
				String documentPath = UserRestURIConstants.getProperties("documentPath");
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
//		        if(!FileUtil.checkImageFile(uploadDir + sep  
//		                + fileName)){
//		        	throw new ECOMMAPIException("Illegal file");
//		        }
		        
		        File toFile = new File(uploadDir + sep  
				                + realName);
		        ImgUtil.ImageToPdfToJPG(uploadDir + sep+ fileName, uploadDir + sep + name + ".pdf", toFile , request);
				String copyImagePath = request.getRealPath("/")+"resources/images/elite-terms/COPY.png";
				File copyImageFile = new File(copyImagePath);
				ImgUtil.pressImage(copyImageFile, toFile, 0, 0);
//				ImgUtil.changeImageToJPG(uploadedFile,toFile,request);
		        response.getWriter().write("true");
			} catch (ECOMMAPIException e) {
				String error = e.getMessage();
				response.setCharacterEncoding("utf-8");  //这里不设置编码会有乱码
	            response.setContentType("text/plain;charset=utf-8");
	            response.setHeader("Cache-Control", "no-cache");  
				response.getWriter().write(error);
			}catch (Exception e) {
				logger.info(e.getMessage());
				e.printStackTrace();
				response.getWriter().write("system error");
			}
	}

	
	@RequestMapping(value = {"/ajax/eliteTerm/getEliteTermSendImageFlage"},method = RequestMethod.POST)
	  public void getEliteTermSendImageFlage(HttpServletRequest request, HttpServletResponse response,
	            @RequestParam String passportFlage,
	            @RequestParam String uploadLaterFlage
	            ) throws Exception {
			try {
				request.getSession().setAttribute("uploadLaterFlage", uploadLaterFlage);
				ajaxReturn(response, eliteTermService.sendImage(request,passportFlage));
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
            BaseResponse errorResponse = new BaseResponse();
            errorResponse.setErrMsg(e.getMessage());
            ajaxReturn(response, errorResponse);
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = {"/ajax/eliteTerm/uploadSignature"})
	public void uploadSignature(HttpServletRequest request,HttpServletResponse response,@RequestParam String image,@RequestParam String policyNo){
		if (Methods.isXssAjax(request))
			return;
		try {
			ajaxReturn(response,eliteTermService.uploadSignature(request,image,policyNo));
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
	
	
	@RequestMapping(value = {"/ajax/eliteTerm/putEtPlanOptionSession"})
	public void putEtPlanOptionSession(HttpServletRequest request,HttpServletResponse response) {
		if (Methods.isXssAjax(request))
			return;
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
		if (Methods.isXssAjax(request))
			return;
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
		if (Methods.isXssAjax(request))
			return;
		try {
			ajaxReturn(response, eliteTermService.getPromoteCode(request));
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
}
