package com.ifwd.fwdhk.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.connector.response.BaseResponse;
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
import com.ifwd.fwdhk.services.SavieOnlineService;
import com.ifwd.fwdhk.util.Methods;
@Controller
public class AjaxSavieOnlineController extends BaseController{
	private final static Logger logger = LoggerFactory.getLogger(AjaxSavieOnlineController.class);
	
	@Autowired
	private RestServiceDao restService;
	@Autowired
	private SavieOnlineService savieOnlineService;
	
	@RequestMapping(value = {"/ajax/savie-online/getSavieOnlinePlandetails"})
	public void getSavieOnlinePlandetails(SaviePlanDetailsBean saviePlanDetails,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		String language = (String) session.getAttribute("language");
		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			saviePlanDetails.validate(language);
			jsonObject.put("apiData", savieOnlineService.getSavieOnlinePlandetails(saviePlanDetails, request).toString());
			String[] dob = saviePlanDetails.getDob().split("/");
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
	
	@RequestMapping(value = {"/ajax/savie-online/lifePersonalDetails"})
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
	
	@RequestMapping(value = {"/ajax/savie-online/lifeEmploymentInfo"})
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
	
	@RequestMapping(value = {"/ajax/savie-online/lifeBeneficaryInfo"})
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
	
	@RequestMapping(value = {"/ajax/savie-online/lifePayment"})
	public void lifePayment(LifePaymentBean lifePayment,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		String language = (String) session.getAttribute("language");
		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			lifePayment.validate(language);
			request.getSession().setAttribute("lifePayment", lifePayment);
		}
		catch (ValidateExceptions e) {
			jsonObject.put("errorMsg", e.getList().toString());
		}
		logger.info(jsonObject.toString());
		ajaxReturn(response, jsonObject);
	}
	
	@RequestMapping(value = {"/ajax/savie-online/createLifePolicy"})
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

	@RequestMapping(value = {"/ajax/savie-online/finalizeLifePolicy"})
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
	
	@RequestMapping(value = {"/ajax/savie-online/update"})
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
	
	@RequestMapping(value = {"/ajax/savie-online/show"})
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
	
	@RequestMapping(value = {"/ajax/savie-online/product-recommend"})
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
	
	@RequestMapping(value = {"/ajax/savie-online/getPurchaseHistoryByPlanCode"})
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
	
	@RequestMapping(value = {"/ajax/savie-online/enquiry"})
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
	
	@RequestMapping(value = {"/ajax/savie-online/getBranchCode"})
	public void getOccupationByAjax(Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {
		List<OptionItemDesc> OptionItemDescList = new ArrayList<OptionItemDesc>();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			OptionItemDescList = savieOnlineService.getBranchCode(request);
		}
		catch (ECOMMAPIException e) {
		}
		logger.info(OptionItemDescList.toString());
		ajaxReturn(response, OptionItemDescList);
	}
	
	@RequestMapping(value = {"/ajax/savie-online/createPolicyApplicationSaveforLater"})
	public void createPolicyApplicationSaveforLater(LifePersonalDetailsBean lifePersonalDetails,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			jsonObject = savieOnlineService.createPolicyApplicationSaveforLater(request);
		}
		catch (ECOMMAPIException e) {
			jsonObject.put("errorMsg", e.getMessage());
		}
		logger.info(jsonObject.toString());
		ajaxReturn(response, jsonObject);
	}
}
