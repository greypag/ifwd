package com.ifwd.fwdhk.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.connector.response.eliteterm.CreateEliteTermPolicyResponse;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.services.EliteTermService;
import com.ifwd.fwdhk.services.SavieService;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.EliteTermsFlowControl;
import com.ifwd.fwdhk.util.InitApplicationMessage;

@Controller
public class EliteTermController extends BaseController{
	
	private final static Logger logger = LoggerFactory.getLogger(EliteTermController.class);
	
	@Autowired
	private RestServiceDao restService;
	@Autowired
	private SavieService savieService;
	
	@Autowired
	private EliteTermService eliteTermService;
	
	@Autowired
	private CommonUtils commonUtils;
	
	@RequestMapping(value = {"/{lang}/term-life-insurance"})
	public ModelAndView getLanding(Model model, HttpServletRequest request) throws ECOMMAPIException {
		eliteTermService.removeEtSession(request);
		return EliteTermsFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_ELITE_TERMS_LANDING);
	}
	
	@RequestMapping(value = {"/{lang}/term-life-insurance/select-plan","/{lang}/term-life-insurance/application"})
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
		model.addAttribute("etLiquidAssetEN", InitApplicationMessage.etLiquidAssetEN);
		model.addAttribute("etLiquidAssetCN", InitApplicationMessage.etLiquidAssetCN);
		model.addAttribute("etAmountOtherSourceEN", InitApplicationMessage.etAmountOtherSourceEN);
		model.addAttribute("etAmountOtherSourceCN", InitApplicationMessage.etAmountOtherSourceCN);
		model.addAttribute("etEducationLevelEN", InitApplicationMessage.etEducationLevelEN);
		model.addAttribute("etEducationLevelCN", InitApplicationMessage.etEducationLevelCN);
		
		model.addAttribute("goApp", request.getParameter("goApp"));
		return EliteTermsFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_ELITE_TERMS_SELECT_PLAN);
	}

	@RequestMapping(value = {"/{lang}/term-life-insurance/payment"})
	public ModelAndView getPayment(Model model, HttpServletRequest request) {
		String path = request.getRequestURL().toString();
		model.addAttribute("successUrl", path.replace("payment", "document-upload"));
		model.addAttribute("failurePath", path);
		return EliteTermsFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_ELITE_TERMS_PAYMENT);
	}
	
	@SuppressWarnings({ "restriction", "unused" })
	@RequestMapping(value = {"/{lang}/term-life-insurance/document-upload","/{lang}/term-life-insurance/document-upload-later"})
	public ModelAndView getDocumentUpload(Model model, HttpServletRequest request) {
		try {
			String policyNumber = (String) request.getParameter("policyNumber");
			if(StringUtils.isNotEmpty(policyNumber)){
				policyNumber = new String(new sun.misc.BASE64Decoder().decodeBuffer(policyNumber));
				if(eliteTermService.checkIsDocumentUpload(request,policyNumber)){
					return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request)
							+ "/"+UserRestURIConstants.URL_ELITE_TERMS_LANDING);
				}
				String userName = eliteTermService.getPolicyUserName(request,policyNumber);
				request.getSession().setAttribute("policyUserName", userName);
				if(StringUtils.isEmpty(userName)){
					return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request)
							+ "/"+UserRestURIConstants.URL_ELITE_TERMS_LANDING);
				}
				CreateEliteTermPolicyResponse eliteTermPolicy = new CreateEliteTermPolicyResponse();
				eliteTermPolicy.setPolicyNo(policyNumber);
				request.getSession().setAttribute("eliteTermPolicy", eliteTermPolicy);
			}		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return EliteTermsFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_ELITE_TERMS_DOCUMENT_UPLOAD);
	}
	
	@RequestMapping(value = {"/{lang}/term-life-insurance/confirmation"})
	public ModelAndView getConfirmation(Model model, HttpServletRequest request) {
		try {
			UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
			String email = userDetails.getEmailAddress();
			model.addAttribute("confirmationEmail", email);
			eliteTermService.uploadEliteTermDocuments(request);
		} catch (ECOMMAPIException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return EliteTermsFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_ELITE_TERMS_CONFIRMATION);
	}
}
