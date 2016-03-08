package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
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
import com.ifwd.fwdhk.connector.response.savie.ServiceCentreResponse;
import com.ifwd.fwdhk.connector.response.savie.ServiceCentreResult;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.savieOnline.LifePaymentBean;
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

	@RequestMapping(value = {"/{lang}/savings-insurance","/{lang}/savings-insurance/"})
	public ModelAndView getSavieOnlineLanding(Model model, HttpServletRequest request) {
		savieOnlineService.removeSavieOnlineSession(request);
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LANDING);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/plan-details"})
	public ModelAndView getSavieOnlinePlandetails(Model model, HttpServletRequest request) {
		
		Date date = new Date();
		Calendar startDOB = new GregorianCalendar();
		startDOB.setTime(date); 
		startDOB.add(startDOB.YEAR, -70);
		startDOB.add(startDOB.DATE, 1);
		model.addAttribute("startDOB", DateApi.formatString(startDOB.getTime()));
		
		Calendar defaultDOB = new GregorianCalendar();
		Date date1 = new Date();
		String type = request.getParameter("type");
		if("2".equals(type)){
			model.addAttribute("type", type);
			SavieFnaBean savieFna = (SavieFnaBean) request.getSession().getAttribute("savieFna");
			date1 = DateApi.formatDate(savieFna.getDob());
			defaultDOB.setTime(date1); 
		}
		else{
			defaultDOB.setTime(date1); 
			defaultDOB.add(defaultDOB.YEAR, -18);
		}
		
		model.addAttribute("defaultDOB", DateApi.formatString(defaultDOB.getTime()));
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_PLANDETAILS);
	}
	
	@RequestMapping(value = {"/{lang}/FNA/financial-needs-analysis"}) 
	public ModelAndView getSavieOnlineFna(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_FNA);
	}
	
	@RequestMapping(value = {"/{lang}/FNA/review"}) 
	public ModelAndView getSavieOnlinepReview(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_PRODUCT);
	}
	
	@RequestMapping(value = {"/{lang}/FNA/product-recommendation"}) 
	public ModelAndView getSavieOnlinepProduct(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_PRODUCT);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/sales-illustration"})
	public ModelAndView getSavieOnlineSalesIllustration(Model model, HttpServletRequest request) {
		try {
			savieOnlineService.createSalesIllustrationPdf(request);
		}
		catch (Exception e) {
			request.getSession().setAttribute("errorMsg", e.getMessage());
		}
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_SALES_ILLUSTRATION);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/fatca"})
	public ModelAndView getSavieOnlineLifeFatca(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LIFE_FATCA);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/personal-details"})
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
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LIFE_PERSONAL_DETAILS);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/employment-info"})
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
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LIFE_EMPLOYMENT_INFO);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/beneficiary-info"})
	public ModelAndView getSavieOnlineLifeBeneficaryInfo(Model model, HttpServletRequest request) {
		model.addAttribute("savieBeneficiaryRelationshipEN", InitApplicationMessage.savieBeneficiaryRelationshipEN);
		model.addAttribute("savieBeneficiaryRelationshipCN", InitApplicationMessage.savieBeneficiaryRelationshipCN);
		
		String backSummary = request.getParameter("backSummary");
		if(backSummary!=null && "Y".equals(backSummary)){
			model.addAttribute("backSummary", backSummary);
		}
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LIFE_BENEFICARY_INFO);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/payment"})
	public ModelAndView getSavieOnlineLifePayment(Model model, HttpServletRequest request) {
		model.addAttribute("bankCodeEN", InitApplicationMessage.bankCodeEN);
		model.addAttribute("bankCodeCN", InitApplicationMessage.bankCodeCN);
		
		String backSummary = request.getParameter("backSummary");
		if(backSummary!=null && "Y".equals(backSummary)){
			model.addAttribute("backSummary", backSummary);
		}
		
		LifePaymentBean lifePayment = (LifePaymentBean) request.getSession().getAttribute("lifePayment");
		if(lifePayment!=null && lifePayment.getBankCode()!=null && !"".equals(lifePayment.getBankCode())){
			try {
				model.addAttribute("branchCodeEN", savieOnlineService.getBranchCode(lifePayment.getBankCode(), request));
				model.addAttribute("branchCodeCN", savieOnlineService.getBranchCode(lifePayment.getBankCode(), request));
			} 
			catch (ECOMMAPIException e) {
				logger.info(e.getMessage());
				model.addAttribute("branchCodeEN", InitApplicationMessage.branchCodeEN);
				model.addAttribute("branchCodeCN", InitApplicationMessage.branchCodeCN);
			}
		}
		else{
			model.addAttribute("branchCodeEN", InitApplicationMessage.branchCodeEN);
			model.addAttribute("branchCodeCN", InitApplicationMessage.branchCodeCN);
		}
		
		//
		HttpSession session = request.getSession();
		if(StringUtils.isNotBlank((String)session.getAttribute("username"))){
			try {
				savieOnlineService.getCustomerServiceCentre(model, request, session);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
			return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LIFE_PAYMENT);
		}else {
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request)
					+ "/savings-insurance");
		}
		
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/application-summary"})
	public ModelAndView getSavieOnlineLifePolicySummary(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LIFE_POLICY_SUMMARY);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/declaration"})
	public ModelAndView getSavieOnlineLifeDeclaration(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LIFE_DECLARATION);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/signature"})
	public ModelAndView getSavieOnlineLifeSignature(Model model, HttpServletRequest request,HttpSession session) {
		try {
			model.addAttribute("signatureFileSize", InitApplicationMessage.signatureFileSize);
			
			if(StringUtils.isNotBlank((String)session.getAttribute("username"))){
				savieOnlineService.getCustomerServiceCentre(model, request, session);
				savieOnlineService.createApplicationFormPdf("1", request, session);
				savieOnlineService.createFnaFormPdf("1", request, session);
			}else {
				return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request)
						+ "/savings-insurance");
			}
		}
		catch (Exception e) {
			logger.info(e.getMessage());
			request.getSession().setAttribute("errorMsg", e.getMessage());
		}
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LIFE_SIGNATURE);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/document-upload"})
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
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LIFE_DOCUMENT_UPLOAD);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/confirmation"})
	public ModelAndView getSavieOnlineUploadConfirmation(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_UPLOAD_CONFIRMATION);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/confirmation-upload-later"})
	public ModelAndView getSavieOnlineUploadLaterConfirmation(Model model, HttpServletRequest request) {
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_UPLOAD_LATER_CONFIRMATION);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/confirmation-offline-signature"})
	public ModelAndView getSavieOnlineSignOfflineConfirmation(Model model, HttpServletRequest request) {
		String centre = request.getParameter("centre");
		String preferredDate = request.getParameter("preferred-date");
		String preferredTime = request.getParameter("preferred-time");
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc")) {
			lang = "CN";
		}
		ServiceCentreResponse serviceCentreResponse;
		if (lang.equals("CN")) {
			serviceCentreResponse = InitApplicationMessage.serviceCentreCN;
		}else {
			serviceCentreResponse =InitApplicationMessage.serviceCentreEN;
		}
		List<ServiceCentreResult> serviceCentreResultList = serviceCentreResponse.getServiceCentres();
		for(ServiceCentreResult entity :serviceCentreResultList) {
			if(entity.getServiceCentreCode().equals(centre)) {
				model.addAttribute("centerName", entity.getServiceCentreName());
				model.addAttribute("centerAddress", entity.getAddress());
				break;
			}
		}
		
		model.addAttribute("preferredDate", preferredDate);
		model.addAttribute("preferredTime", preferredTime);
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_SIGN_OFFLINE_CONFIRMATION);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/confirmation-paylater"})
	public ModelAndView getSavieOnlinePayLaterConfirmation(Model model, HttpServletRequest request) {
		String centre = request.getParameter("centre");
		String preferredDate = request.getParameter("preferred-date");
		String preferredTime = request.getParameter("preferred-time");
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc")) {
			lang = "CN";
		}
		ServiceCentreResponse serviceCentreResponse;
		if (lang.equals("CN")) {
			serviceCentreResponse = InitApplicationMessage.serviceCentreCN;
		}else {
			serviceCentreResponse =InitApplicationMessage.serviceCentreEN;
		}
		List<ServiceCentreResult> serviceCentreResultList = serviceCentreResponse.getServiceCentres();
		for(ServiceCentreResult entity :serviceCentreResultList) {
			if(entity.getServiceCentreCode().equals(centre)) {
				model.addAttribute("centerName", entity.getServiceCentreName());
				model.addAttribute("centerAddress", entity.getAddress());
				break;
			}
		}
		
		model.addAttribute("preferredDate", preferredDate);
		model.addAttribute("preferredTime", preferredTime);
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_PAY_LATER_CONFIRMATION);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/confirmation-appointment"})
	public ModelAndView getSavieOnlineAppointmentConfirmation(Model model, HttpServletRequest request) {
		String centre = request.getParameter("centre");
		String preferredDate = request.getParameter("preferred-date");
		String preferredTime = request.getParameter("preferred-time");
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc")) {
			lang = "CN";
		}
		ServiceCentreResponse serviceCentreResponse;
		if (lang.equals("CN")) {
			serviceCentreResponse = InitApplicationMessage.serviceCentreCN;
		}else {
			serviceCentreResponse =InitApplicationMessage.serviceCentreEN;
		}
		List<ServiceCentreResult> serviceCentreResultList = serviceCentreResponse.getServiceCentres();
		for(ServiceCentreResult entity :serviceCentreResultList) {
			if(entity.getServiceCentreCode().equals(centre)) {
				model.addAttribute("centerName", entity.getServiceCentreName());
				model.addAttribute("centerAddress", entity.getAddress());
				break;
			}
		}
		
		model.addAttribute("preferredDate", preferredDate);
		model.addAttribute("preferredTime", preferredTime);
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_APPOINTMENT_CONFIRMATION);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/customer-service-centre"})
	public ModelAndView getSavieOnlineLifeServiceCenter(Model model, HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		/*session.setAttribute("savingAmount", "200000");
		response.setContentType("text/json;charset=utf-8");*/
		
		if(StringUtils.isNotBlank((String)session.getAttribute("username"))){
			try {
				savieOnlineService.getCustomerServiceCentre(model, request, session);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
			return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_SERVICE_CENTER);
		}else {
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request)
					+ "/savings-insurance/plan-details");
		}
	}
	
}
