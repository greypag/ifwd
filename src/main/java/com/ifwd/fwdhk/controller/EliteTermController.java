package com.ifwd.fwdhk.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.connector.request.eliteterm.CreateEliteTermPolicyRequest;
import com.ifwd.fwdhk.connector.response.BaseResponse;
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

	@RequestMapping(value = {"/{lang}/term-life-insurance/document-upload-hkid"})
	public ModelAndView uploadHkid(Model model, HttpServletRequest request) throws ECOMMAPIException {
		return new ModelAndView(UserRestURIConstants.getSitePath(request) 
				+ "eliteterm/" + UserRestURIConstants.PAGE_ELITE_TERMS_DOCUMENT_UPLOAD_HKID);
	}	
	
	@RequestMapping(value = {"/{lang}/term-life-insurance/document-upload-passport"})
	public ModelAndView uploadPassport(Model model, HttpServletRequest request) throws ECOMMAPIException {
		return new ModelAndView(UserRestURIConstants.getSitePath(request) 
				+ "eliteterm/" + UserRestURIConstants.PAGE_ELITE_TERMS_DOCUMENT_UPLOAD_PASSPORT);
	}	
	
	@RequestMapping(value = {"/{lang}/term-life-insurance/document-upload-address"})
	public ModelAndView uploadAddressProof(Model model, HttpServletRequest request) throws ECOMMAPIException {
		return new ModelAndView(UserRestURIConstants.getSitePath(request) 
				+ "eliteterm/" + UserRestURIConstants.PAGE_ELITE_TERMS_DOCUMENT_UPLOAD_ADDR_PROOF);
	}	
	
	@RequestMapping(value = {"/{lang}/term-life-insurance/select-plan","/{lang}/term-life-insurance/application"})
	public ModelAndView getSelectPlan(Model model, HttpServletRequest request) {
		CreateEliteTermPolicyRequest etPolicyApplication = (CreateEliteTermPolicyRequest) request.getSession().getAttribute("etPolicyApplication");
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
		model.addAttribute("lifeBeneficiaryRelationshipEN", InitApplicationMessage.lifeBeneficiaryRelationshipEN);
		model.addAttribute("lifeBeneficiaryRelationshipCN", InitApplicationMessage.lifeBeneficiaryRelationshipCN);
		
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
		
		String goApp = request.getParameter("goApp");
		if(goApp!=null && goApp!="" && !goApp.equals("")){
			goApp = StringEscapeUtils.escapeJavaScript(goApp);
			request.getSession().setAttribute("goApp", goApp);
		}
		
		request.getSession().removeAttribute("sendEmailOrNot");
		return EliteTermsFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_ELITE_TERMS_SELECT_PLAN);
	}

	@RequestMapping(value = {"/{lang}/term-life-insurance/payment"})
	public ModelAndView getPayment(Model model, HttpServletRequest request) {
		String path = request.getRequestURL().toString();
		model.addAttribute("successUrl", path.replace("payment", "document-upload"));
		model.addAttribute("failurePath", path);
		
		request.getSession().removeAttribute("sendEmailOrNot");
		return EliteTermsFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_ELITE_TERMS_PAYMENT);
	}
	
	@SuppressWarnings({ "restriction" })
	@RequestMapping(value = {"/{lang}/term-life-insurance/document-upload","/{lang}/term-life-insurance/document-upload-later"})
	public ModelAndView getDocumentUpload(Model model, HttpServletRequest request) {
		try {
			String policyNumber = (String) request.getParameter("policyNumber");
			if(StringUtils.isNotEmpty(policyNumber)){
				policyNumber = new String(new sun.misc.BASE64Decoder().decodeBuffer(policyNumber));

				//For checking against username at frontend. Ideal case is backend handle the username checking and return an unmatched_username error to frontend.
				String userName = eliteTermService.getPolicyUserName(request,policyNumber);
					request.getSession().setAttribute("policyUserName", userName);

				if(!eliteTermService.checkIsDocumentUpload(request,policyNumber)){
					CreateEliteTermPolicyResponse eliteTermPolicy = new CreateEliteTermPolicyResponse();
					eliteTermPolicy.setPolicyNo(policyNumber);
					request.getSession().setAttribute("eliteTermPolicy", eliteTermPolicy);
				}
			}else{
				request.getSession().setAttribute("policyUserName", null);
				CreateEliteTermPolicyResponse eliteTermPolicy = (CreateEliteTermPolicyResponse) request.getSession().getAttribute("eliteTermPolicy");
				if(eliteTermPolicy == null){
					return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request)
							+ "/"+UserRestURIConstants.URL_ELITE_TERMS_LANDING);
				}
				policyNumber = eliteTermPolicy.getPolicyNo();
				eliteTermService.checkIsDocumentUpload(request,policyNumber);
			}	
			
			String sendEmailOrNot = (String) request.getSession().getAttribute("sendEmailOrNot");
			CreateEliteTermPolicyResponse eliteTermPolicy = (CreateEliteTermPolicyResponse) request.getSession().getAttribute("eliteTermPolicy");
			logger.info("sendEmailOrNot:"+sendEmailOrNot);
			if(sendEmailOrNot == null || !sendEmailOrNot.equals("yes")){
				String creditCaredNo = (String) request.getSession().getAttribute("creditCaredNo");
				String expiryDate = (String) request.getSession().getAttribute("expiryDate");
				String cardHolderName = (String) request.getSession().getAttribute("cardHolderName");
				logger.info("creditCaredNo:"+creditCaredNo);
				logger.info("expiryDate:"+expiryDate);
				logger.info("cardHolderName:"+cardHolderName);
				logger.info("policyNo:"+eliteTermPolicy.getPolicyNo());
         		if(creditCaredNo !=null && !creditCaredNo.equals("") && expiryDate !=null && !expiryDate.equals("") && cardHolderName !=null && !cardHolderName.equals("") && eliteTermPolicy !=null && eliteTermPolicy.getPolicyNo()!=null && !eliteTermPolicy.getPolicyNo().equals("")){
         			BaseResponse br = eliteTermService.finalizeEliteTermPolicy(request, eliteTermPolicy.getPolicyNo());
         			logger.info("finalizeEliteTermPolicy errMsgs:"+br.getErrMsgs());
         			if(br !=null && !br.hasError()){
         				BaseResponse br2 = eliteTermService.sendEliteTermMail(request);
         				logger.info("sendEliteTermMail errMsgs:"+br2.getErrMsgs());
         			}
         		 }
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
		} catch (Exception e) {	
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return EliteTermsFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_ELITE_TERMS_CONFIRMATION);
	}
}
