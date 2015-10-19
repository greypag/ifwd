package com.ifwd.fwdhk.controller;

import java.util.Map;
import java.io.File;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.CreatePolicy;
import com.ifwd.fwdhk.services.SavieService;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.EliteTermsFlowControl;
import com.ifwd.fwdhk.util.HeaderUtil;
import com.ifwd.fwdhk.util.InitApplicationMessage;
import com.ifwd.fwdhk.util.JsonUtils;

@Controller
public class EliteTermController extends BaseController{
	
	private final static Logger logger = LoggerFactory.getLogger(EliteTermController.class);
	
	@Autowired
	private RestServiceDao restService;
	@Autowired
	private SavieService savieService;
	@Autowired
	private CommonUtils commonUtils;
	
	@RequestMapping(value = {"/{lang}/elite-term/landing"})
	public ModelAndView getLanding(Model model, HttpServletRequest request) {
		return EliteTermsFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_ELITE_TERMS_LANDING);
	}
	
	@RequestMapping(value = {"/{lang}/elite-term/select-plan"})
	public ModelAndView getSelectPlan(Model model, HttpServletRequest request) {
		model.addAttribute("signatureFileSize", InitApplicationMessage.signatureFileSize);
		
		model.addAttribute("maritalStatusesEN", InitApplicationMessage.maritalStatusesEN);
		model.addAttribute("maritalStatusesCN", InitApplicationMessage.maritalStatusesCN);
		model.addAttribute("placeOfBirthEN", InitApplicationMessage.placeOfBirthEN);
		model.addAttribute("placeOfBirthCN", InitApplicationMessage.placeOfBirthCN);
		model.addAttribute("nationalityEN", InitApplicationMessage.nationalityEN);
		model.addAttribute("nationalityCN", InitApplicationMessage.nationalityCN);
		model.addAttribute("savieDistrictEN", InitApplicationMessage.savieDistrictEN);
		model.addAttribute("savieDistrictCN", InitApplicationMessage.savieDistrictCN);
		model.addAttribute("employmentStatusEN", InitApplicationMessage.employmentStatusEN);
		model.addAttribute("employmentStatusCN", InitApplicationMessage.employmentStatusCN);
		model.addAttribute("occupationEN", InitApplicationMessage.occupationEN);
		model.addAttribute("occupationCN", InitApplicationMessage.occupationCN);
		model.addAttribute("natureOfBusinessEN", InitApplicationMessage.natureOfBusinessEN);
		model.addAttribute("natureOfBusinessCN", InitApplicationMessage.natureOfBusinessCN);
		model.addAttribute("monthlyPersonalIncomeEN", InitApplicationMessage.monthlyPersonalIncomeEN);
		model.addAttribute("monthlyPersonalIncomeCN", InitApplicationMessage.monthlyPersonalIncomeCN);
		model.addAttribute("savieBeneficiaryRelationshipEN", InitApplicationMessage.savieBeneficiaryRelationshipEN);
		model.addAttribute("savieBeneficiaryRelationshipCN", InitApplicationMessage.savieBeneficiaryRelationshipCN);
		
		model.addAttribute("etCsContactPreferredDayEN", InitApplicationMessage.etCsContactPreferredDayEN);
		model.addAttribute("etCsContactPreferredDayCN", InitApplicationMessage.etCsContactPreferredDayCN);
		model.addAttribute("etCsContactPreferredTimeSlotEN", InitApplicationMessage.etCsContactPreferredTimeSlotEN);
		model.addAttribute("etCsContactPreferredTimeSlotCN", InitApplicationMessage.etCsContactPreferredTimeSlotCN);
		model.addAttribute("etEnquiryTypeEN", InitApplicationMessage.etEnquiryTypeEN);
		model.addAttribute("etEnquiryTypeCN", InitApplicationMessage.etEnquiryTypeCN);
		return EliteTermsFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_ELITE_TERMS_SELECT_PLAN);
	}

	@RequestMapping(value = {"/{lang}/elite-term/payment"})
	public ModelAndView getPayment(Model model, HttpServletRequest request) {
		String path = request.getRequestURL().toString();
		model.addAttribute("successUrl", path.replace("select-plan", "document-upload"));
		model.addAttribute("failurePath", path + "?paymentGatewayFlag=true");
		return EliteTermsFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_ELITE_TERMS_PAYMENT);
	}
	
	@RequestMapping(value = {"/{lang}/elite-term/document-upload"})
	public ModelAndView getDocumentUpload(Model model, HttpServletRequest request) {
		return EliteTermsFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_ELITE_TERMS_DOCUMENT_UPLOAD);
	}
	
	@RequestMapping(value = {"/{lang}/elite-term/confirmation"})
	public ModelAndView getConfirmation(Model model, HttpServletRequest request) {
		try {
			savieService.uploadEliteTermDocuments(request);
		} catch (ECOMMAPIException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return EliteTermsFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_ELITE_TERMS_CONFIRMATION);
	}
}
