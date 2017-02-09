
package com.ifwd.fwdhk.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.connector.response.eliteterm.CreateEliteTermPolicyResponse;
import com.ifwd.fwdhk.connector.response.life.GetVulnerableCustomerResponse;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.OptionItemDesc;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.model.easyhealth.CansurancePlanDetailBean;
import com.ifwd.fwdhk.model.easyhealth.EasyHealthPlanDetailBean;
import com.ifwd.fwdhk.model.easyhealth.EasyHealthPremiumSelectPlan;
import com.ifwd.fwdhk.model.life.LifeEmploymentInfoBean;
import com.ifwd.fwdhk.model.life.LifePersonalDetailsBean;
import com.ifwd.fwdhk.model.life.SavieFnaBean;
import com.ifwd.fwdhk.model.life.SaviePlanDetailsBean;
import com.ifwd.fwdhk.services.EasyHealthService;
import com.ifwd.fwdhk.services.LifeService;
import com.ifwd.fwdhk.services.MedicalGuardianService;
import com.ifwd.fwdhk.services.impl.EasyHealthServiceImpl;
import com.ifwd.fwdhk.services.impl.LifeServiceImpl;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.EasyHealthPageFlowControl;
import com.ifwd.fwdhk.util.MedicalGuardianPageFlowControl;
import com.ifwd.fwdhk.util.SavieOnlinePageFlowControl;
import com.ifwd.fwdhk.util.SaviePageFlowControl;
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
	@Autowired
	protected CommonUtils commonUtils;
	@Autowired
	protected LifeServiceImpl lifeServiceImpl;
	@Autowired
	private LifeService savieOnlineService;
	
	
	@Autowired
	private MedicalGuardianService medicalGuardianService;
	
	@RequestMapping(value = {"/{lang}/medical-insurance/cansurance"})
	public ModelAndView getMedicalGuardian(Model model, HttpServletRequest request, HttpSession httpSession) {
		easyHealthService.removeSession(request);
		return MedicalGuardianPageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_MEDICALGUARDIAN);
	}
	
	@RequestMapping(value = {"/{lang}/medical-insurance/cansurance/cansurance-plan-option"})
	public ModelAndView getMedicalGuardianPlanOption(Model model, HttpServletRequest request, HttpSession httpSession) {
		String backSummary = request.getParameter("backSummary");
		if(backSummary!=null && "Y".equals(backSummary)){
			model.addAttribute("backSummary", backSummary);
			request.getSession().setAttribute("ehStep", "1");
		}
		return MedicalGuardianPageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_MEDICALGUARDIAN_PLAN_OPTION);
	}
	
	@RequestMapping(value = {"/{lang}/medical-insurance/cansurance-application-summary"})
	public ModelAndView getSavieOnlineLifePolicySummary(Model model, HttpServletRequest request, HttpSession httpSession) {
			model.addAttribute("plan", "cansurance");
			request.getSession().setAttribute("applicationSummaryYes", "applicationSummaryYes");
			return SavieOnlinePageFlowControl.pageFlow("medical-insurance/cansurance",model,request, UserRestURIConstants.PAGE_PROPERTIES_MEDICALGUARDIAN_POLICY_SUMMARY);
			
		
	}
	
	@RequestMapping(value = {"/{lang}/medical-insurance/cansurance-declaration"})
	public ModelAndView getSavieOnlineLifeDeclaration(Model model, HttpServletRequest request, HttpSession httpSession) {
			model.addAttribute("plan", "cansurance");
			return SavieOnlinePageFlowControl.pageFlow("medical-insurance/cansurance",model,request, UserRestURIConstants.PAGE_PROPERTIES_MEDICALGUARDIAN_DECLARATION);
	}
	
	
	
	@RequestMapping(value = {"/{lang}/medical-insurance/cansurance-beneficiary-info"})
	public ModelAndView getSavieOnlineLifeBeneficaryInfo(Model model, HttpServletRequest request, HttpSession httpSession) {
		
			model.addAttribute("savieBeneficiaryRelationshipEN", InitApplicationMessage.lifeBeneficiaryRelationshipEN);
			model.addAttribute("savieBeneficiaryRelationshipCN", InitApplicationMessage.lifeBeneficiaryRelationshipCN);
			String backSummary = request.getParameter("backSummary");
			if(backSummary!=null && "Y".equals(backSummary)){
				model.addAttribute("backSummary", backSummary);
			}
			model.addAttribute("plan", "medical-guardian");
				return SavieOnlinePageFlowControl.pageFlow("medical-insurance/cansurance",model,request, UserRestURIConstants.PAGE_PROPERTIES_MEDICALGUARDIAN_BENEFICARY_INFO);
	}
	
	
	@RequestMapping(value = {"/{lang}/medical-insurance/cansurance-underwriting"})
	public ModelAndView getMedicalGuardianUnderwriting(Model model, HttpServletRequest request, HttpSession httpSession) throws ECOMMAPIException {
		   

			
			CansurancePlanDetailBean cplanDetail = new CansurancePlanDetailBean();
			cplanDetail.setDob("1990-01-30");
			cplanDetail.setGender("0");
			cplanDetail.setSmoker("0");
			EasyHealthPlanDetailBean planDetail =  new  EasyHealthPlanDetailBean(cplanDetail);
			EasyHealthPremiumSelectPlan selectPlan = new EasyHealthPremiumSelectPlan();
			
			selectPlan.setAccidentalDeathBenefit("");
			selectPlan.setDailyHospitalCash("");
			selectPlan.setDeathBenefit("");
			selectPlan.setInfectiousDisease("");
			selectPlan.setIntensiveCareUnit("");

		
		    httpSession.setAttribute("ehPlanDetail", planDetail);
		    httpSession.setAttribute("selectPlan", selectPlan); 
		    try {
		    	JSONObject jsonObject = medicalGuardianService.getPremium(cplanDetail, request);
		    	JSONArray plans = (JSONArray) jsonObject.get("plans");
				JSONObject price = (JSONObject) plans.get(0);
				selectPlan.setMonthlyPremium((String)price.get("monthlyPremium"));
				selectPlan.setDiscount((String)price.get("discountedAmount"));
				//selectPlan.setDiscount("5");
				selectPlan.setAmountDue((String)price.get("totalDue"));
				selectPlan.setGender(cplanDetail.getGender());

			} catch (ECOMMAPIException e) {
				logger.info(e.getMessage());
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
			
			model.addAttribute("etCsContactPreferredDayEN", InitApplicationMessage.etCsContactPreferredDayEN);
			model.addAttribute("etCsContactPreferredDayCN", InitApplicationMessage.etCsContactPreferredDayCN);
			model.addAttribute("etCsContactPreferredTimeSlotEN", InitApplicationMessage.etCsContactPreferredTimeSlotEN);
			model.addAttribute("etCsContactPreferredTimeSlotCN", InitApplicationMessage.etCsContactPreferredTimeSlotCN);
			model.addAttribute("etEnquiryTypeEN", InitApplicationMessage.etEnquiryTypeEN);
			model.addAttribute("etEnquiryTypeCN", InitApplicationMessage.etEnquiryTypeCN);
			request.getSession().setAttribute("underwritingYes", "underwritingYes");
			return MedicalGuardianPageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_MEDICALGUARDIAN_UNDERWRITING);
		
	}
	
	@RequestMapping(value = {"/{lang}/medical-insurance/cansurance-fatca"})
	public ModelAndView getSavieOnlineLifeFatca(Model model, HttpServletRequest request, HttpSession httpSession) {
		
		request.getSession().setAttribute("fatcaYes", "fatcaYes");
				return SavieOnlinePageFlowControl.pageFlow("medical-insurance/cansurance",model,request, UserRestURIConstants.PAGE_PROPERTIES_MEDICALGUARDIAN_LIFE_FATCA);
		
	}
	
	@RequestMapping(value = {"/{lang}/medical-insurance/cansurance-signature"})
	public ModelAndView getMedicalGuardianSignature(Model model, HttpServletRequest request,HttpSession session) {
		model.addAttribute("signatureFileSize", InitApplicationMessage.signatureFileSize);
		
		try {
			session.setAttribute("prod", "guardian");
			easyHealthService.createLifePolicy(request, request.getSession());
			
			
		} catch (ECOMMAPIException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		
		
		request.setAttribute("plan", "medical-insurance/cansurance");
		return EasyHealthPageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_EASYHEALTH_SIGNATURE);
		
	
}
	
	@RequestMapping(value = {"/{lang}/medical-insurance/cansurance-personal-details"})
	public ModelAndView getSavieOnlineLifePersonalDetails(Model model, HttpServletRequest request,HttpSession httpSession) {
		
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
			
			model.addAttribute("plan", "cansurance");
			return SavieOnlinePageFlowControl.pageFlow("medical-insurance/cansurance",model,request, UserRestURIConstants.PAGE_PROPERTIES_MEDICALGUARDIAN_PERSONAL_DETAILS);
			
		
	}
	
	
	@RequestMapping(value = {"/{lang}/medical-insurance/cansurance-employment-info"})
	public ModelAndView getSavieOnlineLifeEmploymentInfo(Model model, HttpServletRequest request,HttpSession httpSession) {
			
		
		
			SavieFnaBean savieFna = (SavieFnaBean) request.getSession().getAttribute("savieFna");
			
			model.addAttribute("employmentStatusEN", InitApplicationMessage.employmentStatusEN);
			model.addAttribute("employmentStatusCN", InitApplicationMessage.employmentStatusCN);
			if(savieFna!=null && savieFna.getNature_of_business() !=null && savieFna.getNature_of_business()!=""){
				model.addAttribute("occupationEN", InitApplicationMessage.getOccupationByNob(commonUtils,savieFna.getNature_of_business(), "EN", "1", request));
				model.addAttribute("occupationCN", InitApplicationMessage.getOccupationByNob(commonUtils,savieFna.getNature_of_business(), "CH", "1", request));
			}
			model.addAttribute("natureOfBusinessEN", InitApplicationMessage.natureOfBusinessEN);
			model.addAttribute("natureOfBusinessCN", InitApplicationMessage.natureOfBusinessCN);
			
			model.addAttribute("etCsContactPreferredDayEN", InitApplicationMessage.etCsContactPreferredDayEN);
			model.addAttribute("etCsContactPreferredDayCN", InitApplicationMessage.etCsContactPreferredDayCN);
			model.addAttribute("etCsContactPreferredTimeSlotEN", InitApplicationMessage.etCsContactPreferredTimeSlotEN);
			model.addAttribute("etCsContactPreferredTimeSlotCN", InitApplicationMessage.etCsContactPreferredTimeSlotCN);
			model.addAttribute("etEnquiryTypeEN", InitApplicationMessage.etEnquiryTypeEN);
			model.addAttribute("etEnquiryTypeCN", InitApplicationMessage.etEnquiryTypeCN);
			model.addAttribute("etEducationLevelEN", InitApplicationMessage.etEducationLevelEN);
			model.addAttribute("etEducationLevelCN", InitApplicationMessage.etEducationLevelCN);
			
			String backSummary = request.getParameter("backSummary");
			if(backSummary!=null && "Y".equals(backSummary)){
				model.addAttribute("backSummary", backSummary);
			}
			LifeEmploymentInfoBean lifeEmploymentInfo = (LifeEmploymentInfoBean) request.getSession().getAttribute("lifeEmploymentInfo");
			if(lifeEmploymentInfo!=null && lifeEmploymentInfo.getNatureOfBusiness() !=null && lifeEmploymentInfo.getNatureOfBusiness()!=""){
				model.addAttribute("occupationEN", InitApplicationMessage.getOccupationByNob(commonUtils,lifeEmploymentInfo.getNatureOfBusiness(), "EN", "1", request));
				model.addAttribute("occupationCN", InitApplicationMessage.getOccupationByNob(commonUtils,lifeEmploymentInfo.getNatureOfBusiness(), "CH", "1", request));
			}
			
			String code = null;
			String codeO = null;
			String liquidAssets = null;
			if(savieFna!=null && savieFna.getQ4_b_amount() != null && !savieFna.getQ4_b_amount().equals("")){
				int liquidAssetsAmt = Integer.valueOf(savieFna.getQ4_b_amount().replace(",", ""));
				if(liquidAssetsAmt<=10000){
					liquidAssets = "LA1";
				}
				else if (liquidAssetsAmt>10000&&liquidAssetsAmt<=50000){
					liquidAssets = "LA2";
				}
				else if (liquidAssetsAmt>50000&&liquidAssetsAmt<=100000){
					liquidAssets = "LA3";
				}
				else{
					liquidAssets = "LA4";						
				}
				if(savieFna.getQ4_a_others()!=null && savieFna.getQ4_a_others()!=""){
					int money = Integer.valueOf(savieFna.getQ4_a_others().replace(",", ""));
					
					if(money<=10000){
						code = "mpi1";
						codeO = "AOS1";
					}
					else if(money>=10001&&money<=15000){
						code = "mpi2";
						codeO = "AOS2";
					}
					else if(money>=15001&&money<=20000){
						code = "mpi3";
						codeO = "AOS3";
					}
					else if(money>=20001&&money<=25000){
						code = "mpi4";
						codeO = "AOS4";
					}
					else if(money>=25001&&money<=30000){
						code = "mpi5";
						codeO = "AOS5";
					}
					else if(money>=30001&&money<=40000){
						code = "mpi6";
						codeO = "AOS6";
					}
					else if(money>=40001&&money<=55000){
						code = "mpi7";
						codeO = "AOS7";
					}
					else if(money>=55001){
						code = "mpi8";
						codeO = "AOS8";
					}
				}
				else if("0".equals(savieFna.getQ4_a())){
					code = "mpi1";
					codeO = "AOS1";
				}
				else if("1".equals(savieFna.getQ4_a())){
					code = "mpi1,mpi2,mpi3";
					codeO = "AOS1,AOS2,AOS3";
				}
				else if("2".equals(savieFna.getQ4_a())){
					code = "mpi3,mpi4,mpi5,mpi6,mpi7";
					codeO = "AOS3,AOS4,AOS5,AOS6,AOS7";
				}
				else if("3".equals(savieFna.getQ4_a())){
					code = "mpi7,mpi8";
					codeO = "AOS7,AOS8";
				}
				else if("4".equals(savieFna.getQ4_a())){
					code = "mpi8";
					codeO = "AOS8";
				}
			}
			List<OptionItemDesc> monthlyPersonalIncomeEN = new ArrayList<OptionItemDesc>();
			List<OptionItemDesc> monthlyPersonalIncomeCN = new ArrayList<OptionItemDesc>();
			if(code!=null && code!=""){
				String[] str = code.split(",");
				if(str!=null && str.length>0){
					for(int i=0;i<str.length;i++){
						for(int j=0;j<InitApplicationMessage.monthlyPersonalIncomeEN.size();j++){
							OptionItemDesc optionEn = InitApplicationMessage.monthlyPersonalIncomeEN.get(j);
							OptionItemDesc optionCn = InitApplicationMessage.monthlyPersonalIncomeCN.get(j);
							if(str[i].equals(optionEn.getItemCode())){
								monthlyPersonalIncomeEN.add(optionEn);
								monthlyPersonalIncomeCN.add(optionCn);
							}
						}
					}
				}
			}
			else{
				monthlyPersonalIncomeEN = InitApplicationMessage.monthlyPersonalIncomeEN;
				monthlyPersonalIncomeCN = InitApplicationMessage.monthlyPersonalIncomeCN;
			}
			model.addAttribute("monthlyPersonalIncomeEN", monthlyPersonalIncomeEN);
			model.addAttribute("monthlyPersonalIncomeCN", monthlyPersonalIncomeCN);
			
			List<OptionItemDesc> etAmountOtherSourceEN = new ArrayList<OptionItemDesc>();
			List<OptionItemDesc> etAmountOtherSourceCN = new ArrayList<OptionItemDesc>();
			if(codeO!=null && codeO!=""){
				String[] str = codeO.split(",");
				if(str!=null && str.length>0){
					for(int i=0;i<str.length;i++){
						for(int j=0;j<InitApplicationMessage.etAmountOtherSourceEN.size();j++){
							OptionItemDesc optionEn = InitApplicationMessage.etAmountOtherSourceEN.get(j);
							OptionItemDesc optionCn = InitApplicationMessage.etAmountOtherSourceCN.get(j);
							if(str[i].equals(optionEn.getItemCode())){
								etAmountOtherSourceEN.add(optionEn);
								etAmountOtherSourceCN.add(optionCn);
							}
						}
					}
				}
			}
			else{
				etAmountOtherSourceEN = InitApplicationMessage.etAmountOtherSourceEN;
				etAmountOtherSourceCN = InitApplicationMessage.etAmountOtherSourceCN;
			}
			model.addAttribute("etAmountOtherSourceEN", etAmountOtherSourceEN);
			model.addAttribute("etAmountOtherSourceCN", etAmountOtherSourceCN);

			List<OptionItemDesc> liquidAssetsEN = new ArrayList<OptionItemDesc>();
			List<OptionItemDesc> liquidAssetsCN = new ArrayList<OptionItemDesc>();
			if(liquidAssets!=null && liquidAssets!=""){
				for(int j=0;j<InitApplicationMessage.etLiquidAssetEN.size();j++){
					OptionItemDesc optionEn = InitApplicationMessage.etLiquidAssetEN.get(j);
					OptionItemDesc optionCn = InitApplicationMessage.etLiquidAssetCN.get(j);
					if(liquidAssets.equals(optionEn.getItemCode())){
						liquidAssetsEN.add(optionEn);
						liquidAssetsCN.add(optionCn);
					}
				}
			}
			else{
				liquidAssetsEN = InitApplicationMessage.etLiquidAssetEN;
				liquidAssetsCN = InitApplicationMessage.etLiquidAssetCN;
			}
			model.addAttribute("etLiquidAssetEN", liquidAssetsEN);
			model.addAttribute("etLiquidAssetCN", liquidAssetsCN);
			
			model.addAttribute("plan", "cansurance");
				return SavieOnlinePageFlowControl.pageFlow("medical-insurance/cansurance",model,request, UserRestURIConstants.PAGE_PROPERTIES_MEDICALGUARDIAN_EMPLOYMENT_INFO);
			
	
	}
	
	@RequestMapping(value = {"/{lang}/medical-insurance/cansurance-payment"})
	public ModelAndView getMedicalGuardianPayment(Model model, HttpServletRequest request,HttpSession session) {
		    LifePersonalDetailsBean lifePersonalDetails = (LifePersonalDetailsBean) session.getAttribute("lifePersonalDetails");
		
			String path = request.getRequestURL().toString();
			model.addAttribute("successUrl", path.replace("payment", "document-upload"));
			model.addAttribute("failurePath", path);
			request.setAttribute("plan", "medical-insurance/cansurance");
			session.setAttribute("fname", lifePersonalDetails.getFirstname());
			session.setAttribute("lname", lifePersonalDetails.getLastname());
			return MedicalGuardianPageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_MEDICALGUARDIAN_PAYMENT);
		
	}

	
	
	@RequestMapping(value = {"/{lang}/medical-insurance/cansurance-document-upload"})
	public ModelAndView getSavieDocumentUpload(Model model, HttpServletRequest request) {
		model.addAttribute("signatureWidth", InitApplicationMessage.signatureWidth);
		model.addAttribute("signatureHeight", InitApplicationMessage.signatureHeight);
		model.addAttribute("applicationFileSize", InitApplicationMessage.applicationFileSize);
		request.setAttribute("plan", "medical-insurance/cansurance");
		return SavieOnlinePageFlowControl.pageFlow("medical-insurance/cansurance",model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_DOCUMENT_UPLOAD);
	}
	
	@RequestMapping(value = {"/{lang}/medical-insurance/cansurance-confirmation"})
	public ModelAndView getSavieOnlineUploadConfirmation(Model model, HttpServletRequest request
			,HttpSession session) {
		SaviePlanDetailsBean saviePlanDetails = (SaviePlanDetailsBean) request.getSession().getAttribute("saviePlanDetails");
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		CreateEliteTermPolicyResponse lifePolicy = (CreateEliteTermPolicyResponse) request.getSession().getAttribute("lifePolicy");
		
		model.addAttribute("contactTimeEN", InitApplicationMessage.contactTimeEN);
		model.addAttribute("contactTimeCN", InitApplicationMessage.contactTimeCN);
		
		return SavieOnlinePageFlowControl.pageFlow("medical-insurance/cansurance",model,request, UserRestURIConstants.PAGE_PROPERTIES_MEDICALGUARDIAN_UPLOAD_CONFIRMATION);
		
	}
	
}
