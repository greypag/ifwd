package com.ifwd.fwdhk.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.savieOnline.LifeEmploymentInfoBean;
import com.ifwd.fwdhk.model.savieOnline.LifePersonalDetailsBean;
import com.ifwd.fwdhk.model.savieOnline.SaviePlanDetailsBean;
import com.ifwd.fwdhk.services.SavieOnlineService;
import com.ifwd.fwdhk.util.Methods;
import com.ifwd.utils.ValidationExceptions;
@Controller
public class AjaxSavieOnlineController extends BaseController{
	private final static Logger logger = LoggerFactory.getLogger(AjaxSavieOnlineController.class);
	
	@Autowired
	private RestServiceDao restService;
	@Autowired
	private SavieOnlineService savieOnlineService;
	
	@RequestMapping(value = {"/ajax/savie-online/getSavieOnlinePlandetails"})
	public void getSavieOnlinePlandetails(SaviePlanDetailsBean saviePlanDetails,HttpServletRequest request,HttpServletResponse response) {
		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			saviePlanDetails.validate(request);
			
			jsonObject.put("apiData", savieOnlineService.getSavieOnlinePlandetails(saviePlanDetails, request).toString());
		}
		catch (ValidationExceptions e) {
			jsonObject.put("errorMsg", e.getResolvableMessage().getCodes()[0]);
		}
		catch (ECOMMAPIException e) {
			jsonObject.put("errorMsg", e.getMessage());
		} 
		logger.info(jsonObject.toString());
		ajaxReturn(response, jsonObject);
	}
	
	@RequestMapping(value = {"/ajax/savie-online/lifePersonalDetails"})
	public void lifePersonalDetails(LifePersonalDetailsBean lifePersonalDetails ,HttpServletRequest request,HttpServletResponse response) {
		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			lifePersonalDetails.validate(request);
		}
		catch (ValidationExceptions e) {
			jsonObject.put("errorMsg", e.getResolvableMessage().getCodes()[0]);
		}
		logger.info(jsonObject.toString());
		ajaxReturn(response, jsonObject);
	}
	
	@RequestMapping(value = {"/ajax/savie-online/lifeEmploymentInfo"})
	public void lifeEmploymentInfo(LifeEmploymentInfoBean lifeEmploymentInfo,HttpServletRequest request,HttpServletResponse response) {
		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			lifeEmploymentInfo.validate(request);
		}
		catch (ValidationExceptions e) {
			jsonObject.put("errorMsg", e.getResolvableMessage().getCodes()[0]);
		}
		logger.info(jsonObject.toString());
		ajaxReturn(response, jsonObject);
	}
	
	@RequestMapping(value = {"/ajax/savie-online/show"})
	public void show(HttpServletRequest request,HttpServletResponse response) {
		/*JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}*/
		
		String jsonObject = "{\"name\":\"Chan Tai Man\",\"gender\":0,\"dob\": \"2015-12-31\",\"marital_status\": 0,\"dependents\": 0,\"education\": 2,\"employment_status\":\"ES1\",\"nature_of_business\":\"NoB1\",\"occupation\":\"NoBD4\",\"occupation_others\":null,\"q1\": \"1,2,3\",\"q1_others\": null,\"q2\": \"1,3\",\"q2_others\": null,\"q3\": 2,\"q4\": 0,\"q4_a\": 0,\"q4_a_others\": 9999,\"q4_b\": \"0\",\"q4_b_amount\": 100000,\"q4_b_others\": null,\"q4_c\": 10000,\"q4_d_1\": 8000,\"q4_d_2\": 20000,\"q4_e\": 0,\"q4_f\": 0,\"q4_g\": \"0\",\"q4_g_others\": null,\"last_update\": \"2015-12-31 23:52:00\"}";
		logger.info(jsonObject.toString());
		response.setContentType("text/json;charset=utf-8");
		try {
			response.getWriter().print(jsonObject);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = {"/ajax/savie-online/update"})
	public void update(HttpServletRequest request,HttpServletResponse response) {
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
	
	@RequestMapping(value = {"/ajax/savie-online/product-recommend"})
	public void productRecommend(HttpServletRequest request,HttpServletResponse response) {
		/*JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}*/
		
		String jsonObject = "{"+
			  "\"next_page\": \"/api/product_recommend.php?sort_by=1&page=2\","+
			  "\"product_list\": ["+
			  "{"+
			  "\"type\": \" Universal life\","+
			  "\"type_desc\": \"The description for Universal life product type. \","+
			  "\"products\": ["+
			  "{"+
			  "\"name\": \"Savie\","+
			  "\"show\": true,"+
			  "\"product_code\": \"HG123\","+
			  "\"contribution_period\": [\"5\", \"10\", \"to age 100\"],"+
			  "\"min_issue_age\": 1,"+
			  "\"max_issue_age\": 75,"+
			  "\"protection_period\": 100,"+
			  "\"features\": [\"Long Term Planning\", \"We offer guaranted cash value\", \"Special bonus\",\"Long Term Planning\", \"We offer guaranted cash value\", \"Special bonus\"],"+
			  "\"type\": \"Universal life\","+
			  "\"objectives\": [\"Investment\", \"Preparation for health care needs\"],"+
			  "\"key_product_risks\": \"<ul><li>Credit risk</li><li>Inflation risk</li></ul>\","+
			  "\"key_exclusions\": \"Example:<ul><li>Disease</li></ul>\","+
			  "\"brochure_url\": \"https://i.fwd.com.hk/resources/brochure-pdf/savie_brochure.pdf\","+
			  "\"product_url\": \"https://i.fwd.com.hk/tc/savings-insurance\""+
			  "},"+
			  "{"+
			  "\"name\": \"MaxFocus\","+
			  "\"show\": true,"+
			  "\"product_code\": \"MXFCS\","+
			  "\"contribution_period\": [\"10\"],"+
			  "\"min_issue_age\": 1,"+
			  "\"max_issue_age\": 75,"+
			  "\"protection_period\": 100,"+
			  "\"features\": [\"Long Term Planning\", \"We offer guaranted cash value\", \"Special bonus\"],"+
			  "\"type\": \"Life protection without saving\","+
			  "\"objectives\": [\"Investment\", \"Preparation for health care needs\"],"+
			  "\"key_product_risks\": \"<ul><li>Credit risk</li><li>Inflation risk</li></ul>\","+
			  "\"key_exclusions\": \"Example:<ul><li>Disease</li></ul>\","+
			  "\"brochure_url\": \"https://i.fwd.com.hk/resources/brochure-pdf/savie_brochure.pdf\","+
			  "\"product_url\": null"+
			  "},"+
			  "{"+
			  "\"name\": \"Balance refundable hospital income plan\","+
			  "\"show\": false,"+
			  "\"product_code\": \"MXFCS\","+
			  "\"contribution_period\": [\"10\"],"+
			  "\"min_issue_age\": 1,"+
			  "\"max_issue_age\": 75,"+
			  "\"protection_period\": 100,"+
			  "\"features\": [\"Long Term Planning\", \"We offer guaranted cash value\", \"Special bonus\"],"+
			  "\"type\": \"Life protection without saving\","+
			  "\"objectives\": [\"Investment\", \"Preparation for health care needs\"],"+
			  "\"key_product_risks\": \"<ul><li>Credit risk</li><li>Inflation risk</li></ul>\","+
			  "\"key_exclusions\": \"Example:<ul><li>Disease</li></ul>\","+
			  "\"brochure_url\": \"https://i.fwd.com.hk/resources/brochure-pdf/savie_brochure.pdf\","+
			  "\"product_url\": null"+
			  "}"+
			  "]"+
			  "},"+
			  "{"+
			  "\"type\": \"Life protection without saving\","+
			  "\"type_desc\": \"The description for Life protection without saving.\","+
			  "\"products\": ["+
			  "{"+
			  "\"name\": \"Elite Term Plan\","+
			  "\"show\": true,"+
			  "\"product_code\": \"HTLS\","+
			  "\"contribution_period\": [\"5\", \"10\"],"+
			  "\"min_issue_age\": 1,"+
			  "\"max_issue_age\": 60,"+
			  "\"protection_period\": 100,"+
			  "\"features\": [\"Fill the protection gap at low cost\", \"Guaranteed same Premium for first 20 policy years\", \"Choice of protection level\"],"+
			  "\"objectives\": [\"Protection till age 95\", \"Simplified purchase process\"],"+
			  "\"key_product_risks\": \"<ul><li>Credit risk</li><li>Inflation risk</li></ul>\","+
			  "\"key_exclusions\": \"Example:<ul><li>Disease</li></ul>\","+
			  "\"brochure_url\": \"https://i.fwd.com.hk/resources/policy-provisions-pdf/Elite_brochure_En.pdf\","+
			  "\"product_url\": \"https://i.fwd.com.hk/tc/term-life-insurance\""+
			  "}"+
			  "]"+
			  "},"+
			  "{"+
			  "\"type\": \"Pure insurance product\","+
			  "\"type_desc\": \"The description for Pure insurance product.\","+
			  "\"products\":  null"+
			  "}"+
			  "]"+
			"}";
		logger.info(jsonObject.toString());
		response.setContentType("text/json;charset=utf-8");
		try {
			response.getWriter().print(jsonObject);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
