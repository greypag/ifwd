package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
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
import com.ifwd.fwdhk.model.savieOnline.SavieFnaBean;
import com.ifwd.fwdhk.services.SavieOnlineService;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.DateApi;
import com.ifwd.fwdhk.util.HeaderUtil;
import com.ifwd.fwdhk.util.InitApplicationMessage;
import com.ifwd.fwdhk.util.SavieOnlinePageFlowControl;
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
	
	@Autowired
	protected HeaderUtil headerUtil;

	@RequestMapping(value = {"/{lang}/savie-online/savie-landing"})
	public ModelAndView getSavieOnlineLanding(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_LANDING);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/savie-plan-details"})
	public ModelAndView getSavieOnlinePlandetails(Model model, HttpServletRequest request) {
		
		Date date = new Date();
		Calendar startDOB = new GregorianCalendar();
		startDOB.setTime(date); 
		startDOB.add(startDOB.YEAR, -70);
		startDOB.add(startDOB.DATE, 1);
		model.addAttribute("startDOB", DateApi.formatString(startDOB.getTime()));
		
		Calendar defaultDOB = new GregorianCalendar();
		defaultDOB.setTime(date); 
		defaultDOB.add(defaultDOB.YEAR, -18);
		model.addAttribute("defaultDOB", DateApi.formatString(defaultDOB.getTime()));
		
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
		model.addAttribute("maritalStatusesEN", InitApplicationMessage.maritalStatusesEN);
		model.addAttribute("maritalStatusesCN", InitApplicationMessage.maritalStatusesCN);
		model.addAttribute("placeOfBirthEN", InitApplicationMessage.placeOfBirthEN);
		model.addAttribute("placeOfBirthCN", InitApplicationMessage.placeOfBirthCN);
		model.addAttribute("nationalityEN", InitApplicationMessage.nationalityEN);
		model.addAttribute("nationalityCN", InitApplicationMessage.nationalityCN);
		model.addAttribute("savieDistrictEN", InitApplicationMessage.savieDistrictEN);
		model.addAttribute("savieDistrictCN", InitApplicationMessage.savieDistrictCN);
		
		String backSummary = request.getParameter("backSummary");
		if(backSummary!=null && "Y".equals(backSummary)){
			model.addAttribute("backSummary", backSummary);
		}
		SavieFnaBean savieFna = (SavieFnaBean) request.getSession().getAttribute("savieFna");
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_PERSONAL_DETAILS);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/life-employment-info"})
	public ModelAndView getSavieOnlineLifeEmploymentInfo(Model model, HttpServletRequest request) {
		model.addAttribute("employmentStatusEN", InitApplicationMessage.employmentStatusEN);
		model.addAttribute("employmentStatusCN", InitApplicationMessage.employmentStatusCN);
		model.addAttribute("occupationEN", InitApplicationMessage.occupationEN);
		model.addAttribute("occupationCN", InitApplicationMessage.occupationCN);
		model.addAttribute("natureOfBusinessEN", InitApplicationMessage.natureOfBusinessEN);
		model.addAttribute("natureOfBusinessCN", InitApplicationMessage.natureOfBusinessCN);
		model.addAttribute("monthlyPersonalIncomeEN", InitApplicationMessage.monthlyPersonalIncomeEN);
		model.addAttribute("monthlyPersonalIncomeCN", InitApplicationMessage.monthlyPersonalIncomeCN);
		
		model.addAttribute("etCsContactPreferredDayEN", InitApplicationMessage.etCsContactPreferredDayEN);
		model.addAttribute("etCsContactPreferredDayCN", InitApplicationMessage.etCsContactPreferredDayCN);
		model.addAttribute("etCsContactPreferredTimeSlotEN", InitApplicationMessage.etCsContactPreferredTimeSlotEN);
		model.addAttribute("etCsContactPreferredTimeSlotCN", InitApplicationMessage.etCsContactPreferredTimeSlotCN);
		model.addAttribute("etEnquiryTypeEN", InitApplicationMessage.etEnquiryTypeEN);
		model.addAttribute("etEnquiryTypeCN", InitApplicationMessage.etEnquiryTypeCN);
		model.addAttribute("etLiquidAssetEN", InitApplicationMessage.etLiquidAssetEN);
		model.addAttribute("etLiquidAssetCN", InitApplicationMessage.etLiquidAssetCN);
		model.addAttribute("etAmountOtherSourceEN", InitApplicationMessage.etAmountOtherSourceEN);
		model.addAttribute("etAmountOtherSourceCN", InitApplicationMessage.etAmountOtherSourceCN);
		model.addAttribute("etEducationLevelEN", InitApplicationMessage.etEducationLevelEN);
		model.addAttribute("etEducationLevelCN", InitApplicationMessage.etEducationLevelCN);
		
		model.addAttribute("occupationEnNoB1", InitApplicationMessage.occupationEnNoB1);
		model.addAttribute("occupationCnNoB1", InitApplicationMessage.occupationCnNoB1);
		model.addAttribute("occupationEnNoB2", InitApplicationMessage.occupationEnNoB2);
		model.addAttribute("occupationCnNoB2", InitApplicationMessage.occupationCnNoB2);
		model.addAttribute("occupationEnNoB3", InitApplicationMessage.occupationEnNoB3);
		model.addAttribute("occupationCnNoB3", InitApplicationMessage.occupationCnNoB3);
		model.addAttribute("occupationEnNoB4", InitApplicationMessage.occupationEnNoB4);
		model.addAttribute("occupationCnNoB4", InitApplicationMessage.occupationCnNoB4);
		model.addAttribute("occupationEnNoB5", InitApplicationMessage.occupationEnNoB5);
		model.addAttribute("occupationCnNoB5", InitApplicationMessage.occupationCnNoB5);
		model.addAttribute("occupationEnNoB6", InitApplicationMessage.occupationEnNoB6);
		model.addAttribute("occupationCnNoB6", InitApplicationMessage.occupationCnNoB6);
		model.addAttribute("occupationEnNoB7", InitApplicationMessage.occupationEnNoB7);
		model.addAttribute("occupationCnNoB7", InitApplicationMessage.occupationCnNoB7);
		model.addAttribute("occupationEnNoB8", InitApplicationMessage.occupationEnNoB8);
		model.addAttribute("occupationCnNoB8", InitApplicationMessage.occupationCnNoB8);
		model.addAttribute("occupationEnNoB9", InitApplicationMessage.occupationEnNoB9);
		model.addAttribute("occupationCnNoB9", InitApplicationMessage.occupationCnNoB9);
		model.addAttribute("occupationEnNoB10", InitApplicationMessage.occupationEnNoB10);
		model.addAttribute("occupationCnNoB10", InitApplicationMessage.occupationCnNoB10);
		model.addAttribute("occupationEnNoB11", InitApplicationMessage.occupationEnNoB11);
		model.addAttribute("occupationCnNoB11", InitApplicationMessage.occupationCnNoB11);
		model.addAttribute("occupationEnNoB12", InitApplicationMessage.occupationEnNoB12);
		model.addAttribute("occupationCnNoB12", InitApplicationMessage.occupationCnNoB12);
		model.addAttribute("occupationEnNoB13", InitApplicationMessage.occupationEnNoB13);
		model.addAttribute("occupationCnNoB13", InitApplicationMessage.occupationCnNoB13);
		model.addAttribute("occupationEnNoB14", InitApplicationMessage.occupationEnNoB14);
		model.addAttribute("occupationCnNoB14", InitApplicationMessage.occupationCnNoB14);
		model.addAttribute("occupationEnNoB15", InitApplicationMessage.occupationEnNoB15);
		model.addAttribute("occupationCnNoB15", InitApplicationMessage.occupationCnNoB15);
		model.addAttribute("occupationEnNoB16", InitApplicationMessage.occupationEnNoB16);
		model.addAttribute("occupationCnNoB16", InitApplicationMessage.occupationCnNoB16);
		model.addAttribute("occupationEnNoB17", InitApplicationMessage.occupationEnNoB17);
		model.addAttribute("occupationCnNoB17", InitApplicationMessage.occupationCnNoB17);
		model.addAttribute("occupationEnNoB18", InitApplicationMessage.occupationEnNoB18);
		model.addAttribute("occupationCnNoB18", InitApplicationMessage.occupationCnNoB18);
		model.addAttribute("occupationEnNoB19", InitApplicationMessage.occupationEnNoB19);
		model.addAttribute("occupationCnNoB19", InitApplicationMessage.occupationCnNoB19);
		model.addAttribute("occupationEnNoB20", InitApplicationMessage.occupationEnNoB20);
		model.addAttribute("occupationCnNoB20", InitApplicationMessage.occupationCnNoB20);
		model.addAttribute("occupationEnNoB21", InitApplicationMessage.occupationEnNoB21);
		model.addAttribute("occupationCnNoB21", InitApplicationMessage.occupationCnNoB21);
		model.addAttribute("occupationEnNoB22", InitApplicationMessage.occupationEnNoB22);
		model.addAttribute("occupationCnNoB22", InitApplicationMessage.occupationCnNoB22);
		model.addAttribute("occupationEnNoB23", InitApplicationMessage.occupationEnNoB23);
		model.addAttribute("occupationCnNoB23", InitApplicationMessage.occupationCnNoB23);
		model.addAttribute("occupationEnNoB24", InitApplicationMessage.occupationEnNoB24);
		model.addAttribute("occupationCnNoB24", InitApplicationMessage.occupationCnNoB24);
		
		String backSummary = request.getParameter("backSummary");
		if(backSummary!=null && "Y".equals(backSummary)){
			model.addAttribute("backSummary", backSummary);
		}
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_EMPLOYMENT_INFO);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/life-beneficary-info"})
	public ModelAndView getSavieOnlineLifeBeneficaryInfo(Model model, HttpServletRequest request) {
		model.addAttribute("savieBeneficiaryRelationshipEN", InitApplicationMessage.savieBeneficiaryRelationshipEN);
		model.addAttribute("savieBeneficiaryRelationshipCN", InitApplicationMessage.savieBeneficiaryRelationshipCN);
		
		String backSummary = request.getParameter("backSummary");
		if(backSummary!=null && "Y".equals(backSummary)){
			model.addAttribute("backSummary", backSummary);
		}
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_BENEFICARY_INFO);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/life-payment"})
	public ModelAndView getSavieOnlineLifePayment(Model model, HttpServletRequest request) {
		model.addAttribute("bankCodeEN", InitApplicationMessage.bankCodeEN);
		model.addAttribute("bankCodeCN", InitApplicationMessage.bankCodeCN);
		model.addAttribute("branchCodeEN", InitApplicationMessage.branchCodeEN);
		model.addAttribute("branchCodeCN", InitApplicationMessage.branchCodeCN);
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
	public ModelAndView getSavieOnlineLifeReview4(Model model, HttpServletRequest request,HttpSession session) {
		try {
			savieOnlineService.createApplicationFormPdf("1", request, session);
			savieOnlineService.createFnaFormPdf("1", request, session);
		}
		catch (Exception e) {
			logger.info(e.getMessage());
			request.getSession().setAttribute("errorMsg", e.getMessage());
		}
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_REVIEW4);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/life-signature"})
	public ModelAndView getSavieOnlineLifeSignature(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_SIGNATURE);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/life-document-upload"})
	public ModelAndView getSavieOnlineLifeDocumentUpload(Model model, HttpServletRequest request,HttpSession session) {
		JSONObject jsonObject = new JSONObject();
		try {
			savieOnlineService.uploadSavieOnlineDocument(request);
			savieOnlineService.finalizeLifePolicy(request, session);
		}
		catch (ECOMMAPIException e) {
			jsonObject.put("errorMsg", e.getMessage());
		}
		catch (Exception e) {
			jsonObject.put("errorMsg", e.getMessage());
		}
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_LIFE_DOCUMENT_UPLOAD);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/upload-confirmation"})
	public ModelAndView getSavieOnlineUploadConfirmation(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_UPLOAD_CONFIRMATION);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/upload-later-confirmation"})
	public ModelAndView getSavieOnlineUploadLaterConfirmation(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_UPLOAD_LATER_CONFIRMATION);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/sign-offline-confirmation"})
	public ModelAndView getSavieOnlineSignOfflineConfirmation(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_SIGN_OFFLINE_CONFIRMATION);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/pay-later-confirmation"})
	public ModelAndView getSavieOnlinePayLaterConfirmation(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_PAY_LATER_CONFIRMATION);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/appointment-confirmation"})
	public ModelAndView getSavieOnlineAppointmentConfirmation(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIEONLINE_APPOINTMENT_CONFIRMATION);
	}
	
	@RequestMapping(value = {"/{lang}/savie-online/service-center"})
	public ModelAndView getSavieOnlineLifeServiceCenter(Model model, HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		session.setAttribute("savingAmount", "200000");
		response.setContentType("text/json;charset=utf-8");
		String Url = UserRestURIConstants.SERVICE_URL + "/appointment/accessCode";
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc")) {
			lang = "CN";
		}
		final Map<String,String> header = headerUtil.getHeader(request);
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
