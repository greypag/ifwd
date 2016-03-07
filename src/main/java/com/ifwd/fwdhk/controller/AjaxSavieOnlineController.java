package com.ifwd.fwdhk.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.json.simple.JSONObject;
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
import com.ifwd.fwdhk.connector.response.eliteterm.CreateEliteTermPolicyResponse;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.exception.ValidateExceptions;
import com.ifwd.fwdhk.model.OptionItemDesc;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.model.savieOnline.LifeBeneficaryInfoBean;
import com.ifwd.fwdhk.model.savieOnline.LifeEmploymentInfoBean;
import com.ifwd.fwdhk.model.savieOnline.LifePaymentBean;
import com.ifwd.fwdhk.model.savieOnline.LifePersonalDetailsBean;
import com.ifwd.fwdhk.model.savieOnline.SavieFnaBean;
import com.ifwd.fwdhk.model.savieOnline.SaviePlanDetailsBean;
import com.ifwd.fwdhk.model.savieOnline.LifeDeclarationBean;
import com.ifwd.fwdhk.services.SavieOnlineService;
import com.ifwd.fwdhk.util.ErrorMessageUtils;
import com.ifwd.fwdhk.util.ImgUtil;
import com.ifwd.fwdhk.util.Methods;
import com.ifwd.fwdhk.util.NumberFormatUtils;
@Controller
public class AjaxSavieOnlineController extends BaseController{
	private final static Logger logger = LoggerFactory.getLogger(AjaxSavieOnlineController.class);
	
	@Autowired
	private RestServiceDao restService;
	@Autowired
	private SavieOnlineService savieOnlineService;
	
	private static final String WATERMARK = "/resources/images/elite-terms/Watermark.png";
	
	@RequestMapping(value = {"/ajax/savings-insurance/getSavieOnlinePlandetails"})
	public void getSavieOnlinePlandetails(SaviePlanDetailsBean saviePlanDetails,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		String language = (String) session.getAttribute("language");
		net.sf.json.JSONObject jsonObject = new net.sf.json.JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			saviePlanDetails.validate(language);
			saviePlanDetails.setInsuredAmount1(NumberFormatUtils.formatNumber(saviePlanDetails.getInsuredAmount()));
			jsonObject = savieOnlineService.getSavieOnlinePlandetails(saviePlanDetails, request, session);
			String[] dob = saviePlanDetails.getDob().split("-");
			saviePlanDetails.setDob1(dob[2]+"·"+dob[1]+"·"+dob[0]);
			saviePlanDetails.setDob2(dob[0]+"-"+dob[1]+"-"+dob[2]);
			request.getSession().setAttribute("saviePlanDetails", saviePlanDetails);
		}
		catch (ValidateExceptions e) {
			jsonObject.put("errorMsg", e.getList().toString());
		}
		catch (ECOMMAPIException e) {
			jsonObject.put("errorMsg", e.getMessage());
		} 
		logger.info(jsonObject.toString());
		ajaxReturn(response, jsonObject);
	}
	
	@RequestMapping(value = {"/ajax/savings-insurance/lifePersonalDetails"})
	public void lifePersonalDetails(LifePersonalDetailsBean lifePersonalDetails ,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		String language = (String) session.getAttribute("language");
		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			lifePersonalDetails.validate(language);
			request.getSession().setAttribute("lifePersonalDetails", lifePersonalDetails);
		}
		catch (ValidateExceptions e) {
			jsonObject.put("errorMsg", e.getList().toString());
		}
		logger.info(jsonObject.toString());
		ajaxReturn(response, jsonObject);
	}
	
	@RequestMapping(value = {"/ajax/savings-insurance/lifeEmploymentInfo"})
	public void lifeEmploymentInfo(LifeEmploymentInfoBean lifeEmploymentInfo,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		String language = (String) session.getAttribute("language");
		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			lifeEmploymentInfo.validate(language);
			request.getSession().setAttribute("lifeEmploymentInfo", lifeEmploymentInfo);
		}
		catch (ValidateExceptions e) {
			jsonObject.put("errorMsg", e.getList().toString());
		}
		logger.info(jsonObject.toString());
		ajaxReturn(response, jsonObject);
	}
	
	@RequestMapping(value = {"/ajax/savings-insurance/lifeBeneficaryInfo"})
	public void lifeBeneficaryInfo(LifeBeneficaryInfoBean lifeBeneficaryInfo,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		String language = (String) session.getAttribute("language");
		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			lifeBeneficaryInfo.validate(language);
			request.getSession().setAttribute("lifeBeneficaryInfo", lifeBeneficaryInfo);
		}
		catch (ValidateExceptions e) {
			jsonObject.put("errorMsg", e.getList().toString());
		}
		logger.info(jsonObject.toString());
		ajaxReturn(response, jsonObject);
	}
	
	@RequestMapping(value = {"/ajax/savings-insurance/lifePayment"})
	public void lifePayment(LifePaymentBean lifePayment,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		String language = (String) session.getAttribute("language");
		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			lifePayment.validate(language);
			if(lifePayment!=null && lifePayment.getBranchCode()!=null && !"".equals(lifePayment.getBranchCode())){
				try {
					List<OptionItemDesc> OptionItemDescList = savieOnlineService.getBranchCode(lifePayment.getBankCode(), request);
					if(OptionItemDescList!=null && OptionItemDescList.size()>0){
						for(int i=0;i<OptionItemDescList.size();i++){
							if(OptionItemDescList.get(i).getItemCode().equals(lifePayment.getBranchCode())){
								lifePayment.setBranchName(OptionItemDescList.get(i).getItemDesc());
							}
						}
					}
				} 
				catch (ECOMMAPIException e) {
					logger.info(e.getMessage());
				}
			}
			request.getSession().setAttribute("lifePayment", lifePayment);
		}
		catch (ValidateExceptions e) {
			jsonObject.put("errorMsg", e.getList().toString());
		}
		logger.info(jsonObject.toString());
		ajaxReturn(response, jsonObject);
	}
	
	@RequestMapping(value = {"/ajax/savings-insurance/lifeDeclaration"})
	public void lifeDeclaration(LifeDeclarationBean lifeDeclaration,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		String language = (String) session.getAttribute("language");
		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			lifeDeclaration.validate(language);
			request.getSession().setAttribute("lifeDeclaration", lifeDeclaration);
		}
		catch (ValidateExceptions e) {
			jsonObject.put("errorMsg", e.getList().toString());
		}
		logger.info(jsonObject.toString());
		ajaxReturn(response, jsonObject);
	}
	
	@RequestMapping(value = {"/ajax/savings-insurance/createLifePolicy"})
	public void createLifePolicy(HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			savieOnlineService.createLifePolicy(request, session);
			jsonObject.put("successMsg", "yes");
		}
		catch (ECOMMAPIException e) {
			jsonObject.put("errorMsg", e.getMessage());
		}
		logger.info(jsonObject.toString());
		ajaxReturn(response, jsonObject);
	}

	@RequestMapping(value = {"/ajax/savings-insurance/finalizeLifePolicy"})
	public void finalizeLifePolicy(HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			savieOnlineService.finalizeLifePolicy(request, session);
		}
		catch (ECOMMAPIException e) {
			jsonObject.put("errorMsg", e.getMessage());
		}
		logger.info(jsonObject.toString());
		ajaxReturn(response, jsonObject);
	}
	
	@RequestMapping(value = {"/ajax/savings-insurance/update"})
	public void update(SavieFnaBean savieFna,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			UserDetails userDetails = (UserDetails) session.getAttribute("userDetails");
			savieFna.setName(userDetails.getUserName());
			savieFna.setUser_name(userDetails.getUserName());
			jsonObject = savieOnlineService.saveProductFna(savieFna, request);
			session.setAttribute("savieFna", savieFna);
		} 
		catch (ECOMMAPIException e) {
			jsonObject.put("errorMsg", "api error");
		}
		logger.info(jsonObject.toString());
		ajaxReturn(response, jsonObject);
	}
	
	@RequestMapping(value = {"/ajax/savings-insurance/show"})
	public void show(HttpServletRequest request,HttpServletResponse response) {
		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			jsonObject = savieOnlineService.getFna(request);
		}
		catch (ECOMMAPIException e) {
			jsonObject.put("errorMsg", "api error");
		}
		logger.info(jsonObject.toString());
		ajaxReturn(response, jsonObject);
	}
	
	@RequestMapping(value = {"/ajax/savings-insurance/product-recommend"})
	public void productRecommend(SavieFnaBean savieFna,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		//String language = (String) session.getAttribute("language");
		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			jsonObject = savieOnlineService.getProductrRecommend(savieFna, request);
		}
		catch (ECOMMAPIException e) {
			jsonObject.put("errorMsg", "api error");
		}
		logger.info(jsonObject.toString());
		ajaxReturn(response, jsonObject);
	}
	
	@RequestMapping(value = {"/ajax/savings-insurance/getPurchaseHistoryByPlanCode"})
	public void getPurchaseHistoryByPlanCode(HttpServletRequest request,HttpServletResponse response) {
		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			jsonObject = savieOnlineService.getPurchaseHistoryByPlanCode(request);
			savieOnlineService.getPolicyApplicationSaveforLater(request);
		}
		catch (ECOMMAPIException e) {
			jsonObject.put("errorMsg", "api error");
		}
		logger.info(jsonObject.toString());
		ajaxReturn(response, jsonObject);
	}
	
	@RequestMapping(value = {"/ajax/savings-insurance/enquiry"})
	public void enquiry(HttpServletRequest request,HttpServletResponse response) {
		/*JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}*/
		
		String jsonObject = "{\"status\":0}";
		logger.info(jsonObject.toString());
		response.setContentType("text/json;charset=utf-8");
		try {
			response.getWriter().print(jsonObject);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = {"/ajax/savings-insurance/getBranchCode"})
	public void getOccupationByAjax(Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {
		List<OptionItemDesc> OptionItemDescList = new ArrayList<OptionItemDesc>();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			String value = request.getParameter("value");
			OptionItemDescList = savieOnlineService.getBranchCode(value, request);
		}
		catch (ECOMMAPIException e) {
		}
		logger.info(OptionItemDescList.toString());
		ajaxReturn(response, OptionItemDescList);
	}
	
	@RequestMapping(value = {"/ajax/savings-insurance/lifePersonalDetailsSaveforLater"})
	public void lifePersonalDetailsSaveforLater(LifePersonalDetailsBean lifePersonalDetails,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		String language = (String) session.getAttribute("language");
		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			lifePersonalDetails.validate(language);
			savieOnlineService.lifePersonalDetailsSaveforLater(lifePersonalDetails, request);
		}
		catch (ValidateExceptions e) {
			jsonObject.put("errorMsg", e.getList().toString());
		}
		catch (ECOMMAPIException e) {
			jsonObject.put("errorMsg", e.getMessage());
		}
		logger.info(jsonObject.toString());
		ajaxReturn(response, jsonObject);
	}
	
	@RequestMapping(value = {"/ajax/savings-insurance/lifeEmploymentInfoSaveforLater"})
	public void lifeEmploymentInfoSaveforLater(LifeEmploymentInfoBean lifeEmploymentInfo,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		String language = (String) session.getAttribute("language");
		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			lifeEmploymentInfo.validate(language);
			savieOnlineService.lifeEmploymentInfoSaveforLater(lifeEmploymentInfo, request);
		}
		catch (ValidateExceptions e) {
			jsonObject.put("errorMsg", e.getList().toString());
		}
		catch (ECOMMAPIException e) {
			jsonObject.put("errorMsg", e.getMessage());
		}
		logger.info(jsonObject.toString());
		ajaxReturn(response, jsonObject);
	}
	
	@RequestMapping(value = {"/ajax/savings-insurance/lifeBeneficaryInfoSaveforLater"})
	public void lifeBeneficaryInfoSaveforLater(LifeBeneficaryInfoBean lifeBeneficaryInfo,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		String language = (String) session.getAttribute("language");
		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			lifeBeneficaryInfo.validate(language);
			savieOnlineService.lifeBeneficaryInfoSaveforLater(lifeBeneficaryInfo, request);
		}
		catch (ValidateExceptions e) {
			jsonObject.put("errorMsg", e.getList().toString());
		}
		catch (ECOMMAPIException e) {
			jsonObject.put("errorMsg", e.getMessage());
		}
		logger.info(jsonObject.toString());
		ajaxReturn(response, jsonObject);
	}
	
	@RequestMapping(value = {"/ajax/savings-insurance/lifePaymentSaveforLater"})
	public void lifePaymentSaveforLater(LifePaymentBean lifePayment,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		String language = (String) session.getAttribute("language");
		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			lifePayment.validate(language);
			savieOnlineService.lifePaymentSaveforLater(lifePayment, request);
		}
		catch (ValidateExceptions e) {
			jsonObject.put("errorMsg", e.getList().toString());
		}
		catch (ECOMMAPIException e) {
			jsonObject.put("errorMsg", e.getMessage());
		}
		logger.info(jsonObject.toString());
		ajaxReturn(response, jsonObject);
	}
	
	@RequestMapping(value = {"/ajax/savings-insurance/lifeDeclarationSaveforLater"})
	public void lifeDeclarationSaveforLater(LifeDeclarationBean lifeDeclaration,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			savieOnlineService.lifeDeclarationSaveforLater(lifeDeclaration, request);
		}
		catch (ECOMMAPIException e) {
			jsonObject.put("errorMsg", e.getMessage());
		}
		logger.info(jsonObject.toString());
		ajaxReturn(response, jsonObject);
	}
	
	@RequestMapping(value = {"/ajax/savings-insurance/getEliteTermImage"},method = RequestMethod.POST)
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
				
				CreateEliteTermPolicyResponse lifePolicy = (CreateEliteTermPolicyResponse) request.getSession().getAttribute("lifePolicy");
				String policyNo = lifePolicy.getPolicyNo();
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
	
	@RequestMapping(value = {"/ajax/savings-insurance/getEliteTermSendImageFlage"},method = RequestMethod.POST)
	  public void getEliteTermSendImageFlage(HttpServletRequest request, HttpServletResponse response,
	            @RequestParam String passportFlage,
	            @RequestParam String uploadLaterFlage
	            ) throws Exception {
			if (Methods.isXssAjax(request)) {				
				return;
			}
		
			try {
				request.getSession().setAttribute("uploadLaterFlage", uploadLaterFlage);
				ajaxReturn(response, savieOnlineService.sendImage(request, passportFlage));
			} catch (Exception e) {
				logger.info(e.getMessage());
				e.printStackTrace();
			}
	}
	
	@RequestMapping(value = {"/ajax/savings-insurance/uploadSignature"})
	public void uploadSignature(HttpServletRequest request,HttpServletResponse response,@RequestParam String image){
		if (Methods.isXssAjax(request)) {
			return;
		}
		try {
			ajaxReturn(response,savieOnlineService.uploadSignature(request,image));
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	/**
	 * 通过ajax获取时间段
	 */
	@RequestMapping(value = {"/ajax/savings-insurance/getTimeSlot"})
	public void getTimeSlot(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			savieOnlineService.getTimeSlot(model, request, response);
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	/**
	 * 预约服务中心提交时调用
	 */
	@RequestMapping(value = {"/ajax/savings-insurance/upsertAppointment"})
	public void upsertAppointment(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			savieOnlineService.getAccessCode(request);
			savieOnlineService.upsertAppointment(model, request, response);
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
}
