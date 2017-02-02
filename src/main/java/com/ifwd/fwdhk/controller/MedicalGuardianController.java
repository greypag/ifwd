
package com.ifwd.fwdhk.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.connector.response.eliteterm.CreateEliteTermPolicyResponse;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.services.EasyHealthService;
import com.ifwd.fwdhk.services.impl.EasyHealthServiceImpl;
import com.ifwd.fwdhk.util.EasyHealthPageFlowControl;
import com.ifwd.fwdhk.util.MedicalGuardianPageFlowControl;
import com.ifwd.fwdhk.util.SavieOnlinePageFlowControl;
import com.ifwd.fwdhk.util.HeaderUtil;
import com.ifwd.fwdhk.util.InitApplicationMessage;
@Controller
public class MedicalGuardianController extends BaseController {
	
	private final static Logger logger = LoggerFactory.getLogger(MedicalGuardianController.class);
	
	@Autowired
	private EasyHealthService easyHealthService;
	@Autowired
	protected HeaderUtil headerUtil;
	@Autowired
	protected EasyHealthServiceImpl easyHealthServiceImpl;
	
	
	
	
	@RequestMapping(value = {"/{lang}/medical-guardian"})
	public ModelAndView getMedicalGuardian(Model model, HttpServletRequest request, HttpSession httpSession) {
		easyHealthService.removeSession(request);
		return MedicalGuardianPageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_MEDICALGUARDIAN);
	}
	
	@RequestMapping(value = {"/{lang}/medical-guardian/plan-option"})
	public ModelAndView getMedicalGuardianPlanOption(Model model, HttpServletRequest request, HttpSession httpSession) {
		String backSummary = request.getParameter("backSummary");
		if(backSummary!=null && "Y".equals(backSummary)){
			model.addAttribute("backSummary", backSummary);
			request.getSession().setAttribute("ehStep", "1");
		}
		return MedicalGuardianPageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_MEDICALGUARDIAN_PLAN_OPTION);
	}
	
	@RequestMapping(value = {"/{lang}/medical-guardian/application-summary"})
	public ModelAndView getSavieOnlineLifePolicySummary(Model model, HttpServletRequest request, HttpSession httpSession) {
			model.addAttribute("plan", "medical-guardian");
			request.getSession().setAttribute("applicationSummaryYes", "applicationSummaryYes");
			return SavieOnlinePageFlowControl.pageFlow("medical-guardian",model,request, UserRestURIConstants.PAGE_PROPERTIES_MEDICALGUARDIAN_POLICY_SUMMARY);
			
		
	}
	
	@RequestMapping(value = {"/{lang}/medical-guardian/beneficiary-info"})
	public ModelAndView getSavieOnlineLifeBeneficaryInfo(Model model, HttpServletRequest request, HttpSession httpSession) {
		
			model.addAttribute("savieBeneficiaryRelationshipEN", InitApplicationMessage.lifeBeneficiaryRelationshipEN);
			model.addAttribute("savieBeneficiaryRelationshipCN", InitApplicationMessage.lifeBeneficiaryRelationshipCN);
			String backSummary = request.getParameter("backSummary");
			if(backSummary!=null && "Y".equals(backSummary)){
				model.addAttribute("backSummary", backSummary);
			}
			model.addAttribute("plan", "medical-guardian");
				return SavieOnlinePageFlowControl.pageFlow("medical-guardian",model,request, UserRestURIConstants.PAGE_PROPERTIES_MEDICALGUARDIAN_BENEFICARY_INFO);
			
		
	}
	
	
	@RequestMapping(value = {"/{lang}/medical-guardian/underwriting"})
	public ModelAndView getMedicalGuardianUnderwriting(Model model, HttpServletRequest request, HttpSession httpSession) {
			model.addAttribute("etCsContactPreferredDayEN", InitApplicationMessage.etCsContactPreferredDayEN);
			model.addAttribute("etCsContactPreferredDayCN", InitApplicationMessage.etCsContactPreferredDayCN);
			model.addAttribute("etCsContactPreferredTimeSlotEN", InitApplicationMessage.etCsContactPreferredTimeSlotEN);
			model.addAttribute("etCsContactPreferredTimeSlotCN", InitApplicationMessage.etCsContactPreferredTimeSlotCN);
			model.addAttribute("etEnquiryTypeEN", InitApplicationMessage.etEnquiryTypeEN);
			model.addAttribute("etEnquiryTypeCN", InitApplicationMessage.etEnquiryTypeCN);
			request.getSession().setAttribute("underwritingYes", "underwritingYes");
			return MedicalGuardianPageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_MEDICALGUARDIAN_UNDERWRITING);
		
	}
	
	@RequestMapping(value = {"/{lang}/medical-guardian/fatca"})
	public ModelAndView getSavieOnlineLifeFatca(Model model, HttpServletRequest request, HttpSession httpSession) {
		
		request.getSession().setAttribute("fatcaYes", "fatcaYes");
				return SavieOnlinePageFlowControl.pageFlow("medical-guardian",model,request, UserRestURIConstants.PAGE_PROPERTIES_MEDICALGUARDIAN_LIFE_FATCA);
		
	}
	
	@RequestMapping(value = {"/{lang}/medical-guardian/signature"})
	public ModelAndView getMedicalGuardianSignature(Model model, HttpServletRequest request,HttpSession session) {
		
			model.addAttribute("signatureFileSize", InitApplicationMessage.signatureFileSize);
			return EasyHealthPageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_EASYHEALTH_SIGNATURE);
		
	}
	
	@RequestMapping(value = {"/{lang}/medical-guardian/payment"})
	public ModelAndView getMedicalGuardianPayment(Model model, HttpServletRequest request) {
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		CreateEliteTermPolicyResponse lifePolicy = (CreateEliteTermPolicyResponse) request.getSession().getAttribute("lifePolicy");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/medical-guardian");
		}
		else if(lifePolicy == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/medical-guardian");
		}
		else{
			String path = request.getRequestURL().toString();
			model.addAttribute("successUrl", path.replace("payment", "document-upload"));
			model.addAttribute("failurePath", path);
			return MedicalGuardianPageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_MEDICALGUARDIAN_PAYMENT);
		}
	}

}
