package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.services.SavieOnlineService;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.HeaderUtil;
import com.ifwd.fwdhk.util.InitApplicationMessage;
import com.ifwd.fwdhk.util.SavieOnlinePageFlowControl;
import com.ifwd.fwdhk.util.SaviePageFlowControl;
import com.ifwd.fwdhk.util.WebServiceUtils;
@Controller
public class SavieOnlineController extends BaseController{
	
	private final static Logger logger = LoggerFactory.getLogger(SavieOnlineController.class);
	
	@Autowired
	private RestServiceDao restService;
	@Autowired
	private SavieOnlineService savieOnlineService;
	@Autowired
	private CommonUtils commonUtils;

	@RequestMapping(value = {"/{lang}/savie-online/savie-landing"})
	public ModelAndView getSavieOnlineLanding(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_LANDING);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/savie-plan-details"})
	public ModelAndView getSavieOnlinePlandetails(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_PLANDETAILS);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/savie-fna"}) 
	public ModelAndView getSavieOnlineFna(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_FNA);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/savie-product"}) 
	public ModelAndView getSavieOnlinepProduct(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_PRODUCT);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/savie-review"}) 
	public ModelAndView getSavieOnlinepReview(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_PRODUCT);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/savie-sales-illustration"})
	public ModelAndView getSavieOnlineSalesIllustration(Model model, HttpServletRequest request) {
		try {
			savieOnlineService.createSalesIllustrationPdf(request);
		}
		catch (Exception e) {
			request.getSession().setAttribute("errorMsg", e.getMessage());
		}
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_SALES_ILLUSTRATION);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/life-fatca"})
	public ModelAndView getSavieOnlineLifeFatca(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_FATCA);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/life-personal-details"})
	public ModelAndView getSavieOnlineLifePersonalDetails(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_PERSONAL_DETAILS);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/life-employment-info"})
	public ModelAndView getSavieOnlineLifeEmploymentInfo(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_EMPLOYMENT_INFO);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/life-beneficary-info"})
	public ModelAndView getSavieOnlineLifeBeneficaryInfo(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_BENEFICARY_INFO);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/life-payment"})
	public ModelAndView getSavieOnlineLifePayment(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_PAYMENT);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/life-policy-summary"})
	public ModelAndView getSavieOnlineLifePolicySummary(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_POLICY_SUMMARY);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/life-declaration"})
	public ModelAndView getSavieOnlineLifeDeclaration(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_DECLARATION);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/life-review4"})
	public ModelAndView getSavieOnlineLifeReview4(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_REVIEW4);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/life-signature"})
	public ModelAndView getSavieOnlineLifeSignature(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_SIGNATURE);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/life-document-upload"})
	public ModelAndView getSavieOnlineLifeDocumentUpload(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_DOCUMENT_UPLOAD);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/life-confirmation"})
	public ModelAndView getSavieOnlineLifeConfirmation(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_CONFIRMATION);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/service-center"})
	public ModelAndView getSavieOnlineLifeServiceCenter(Model model, HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		session.setAttribute("savingAmount", "200000");
		session.setAttribute("username", "savie online");
		response.setContentType("text/json;charset=utf-8");
		String Url = UserRestURIConstants.SERVICE_URL + "/appointment/accessCode";
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc")) {
			lang = "CN";
		}
		
		HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
		header.put("userName", "*DIRECTGI");
		header.put("token", commonUtils.getToken("reload"));
		header.put("language", WebServiceUtils.transformLanaguage(lang));
		org.json.simple.JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,Url, header, null);
		if(responseJsonObj.get("errMsgs")==null){
			request.getSession().setAttribute("accessCode", responseJsonObj.get("accessCode"));
		}
		response.setContentType("text/json;charset=utf-8");
		try {
			logger.info(responseJsonObj.toString());
			response.getWriter().print(responseJsonObj.toString());
		}catch(Exception e) {  
			e.printStackTrace();
		}
			if (lang.equals("tc")) {
				model.addAttribute("serviceCentre", InitApplicationMessage.serviceCentreCN);
			}else {
				model.addAttribute("serviceCentre", InitApplicationMessage.serviceCentreEN);
			}
			
			String Url1 = UserRestURIConstants.SERVICE_URL + "/appointment/timeSlot/all";
			if (lang.equals("tc")) {
				lang = "CN";
			}
			Map<String,String> header1 = new HashMap<String, String>(COMMON_HEADERS);
			if(session.getAttribute("authenticate") !=null && session.getAttribute("authenticate").equals("true")){
				HeaderUtil hu = new HeaderUtil();
				header1 = hu.getHeader(request);
			}
			else{
				header1.put("userName", "*DIRECTGI");
				header1.put("token", commonUtils.getToken("reload"));
			}
			header1.put("language", WebServiceUtils.transformLanaguage(lang));
			org.json.simple.JSONObject responseJsonObj1 = restService.consumeApi(HttpMethod.GET,Url1, header1, null);
			if(responseJsonObj1.get("serviceCentres") == null || responseJsonObj1.get("serviceCentres") == ""){
				logger.info(responseJsonObj1.toString());
			}
			org.json.simple.JSONArray serviceCentresArr = (JSONArray) responseJsonObj1.get("serviceCentres");
			org.json.simple.JSONObject serviceCentreObj = new JSONObject();
			if(serviceCentresArr!=null && serviceCentresArr.size()>0){
				serviceCentreObj = (JSONObject) serviceCentresArr.get(0);
			}
			if(serviceCentresArr!=null && serviceCentresArr.size()>1){
				for(int i=1;i<serviceCentresArr.size();i++){
					org.json.simple.JSONArray datesArr = (JSONArray) serviceCentreObj.get("dates");
					org.json.simple.JSONObject dateObj = (JSONObject) datesArr.get(0);
					long date = (long) dateObj.get("date");
					
					org.json.simple.JSONObject serviceCentreObjB = (JSONObject) serviceCentresArr.get(i);
					org.json.simple.JSONArray datesArrB = (JSONArray) serviceCentreObjB.get("dates");
					org.json.simple.JSONObject dateObjB = (JSONObject) datesArrB.get(0);
					long dateB = (long) dateObjB.get("date");
					if(date>dateB){
						serviceCentreObj = serviceCentreObjB;
					}
				}
			}
			else if(serviceCentresArr!=null && serviceCentresArr.size()==1){
				serviceCentreObj = (JSONObject) serviceCentresArr.get(0);
			}
			
			org.json.simple.JSONArray datesArr = (JSONArray) serviceCentreObj.get("dates");
			org.json.simple.JSONObject dateObj = (JSONObject) datesArr.get(0);
			if(session.getAttribute("csCenter") == null || session.getAttribute("csCenter") == ""){
				session.setAttribute("csCenter", serviceCentreObj.get("serviceCentreCode"));
			}
			if(session.getAttribute("perferredDate") == null || session.getAttribute("perferredDate") == ""){
		        Date date= new Date(Long.parseLong(dateObj.get("date").toString()));  
		        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy"); 
		        logger.info(formatter.format(date));
				session.setAttribute("perferredDate", formatter.format(date));
			}
			logger.info(session.getAttribute("perferredDate").toString());
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_SERVICE_CENTER);
	}
}
