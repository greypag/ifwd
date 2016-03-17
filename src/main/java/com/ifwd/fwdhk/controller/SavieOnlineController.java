package com.ifwd.fwdhk.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang.StringUtils;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.OptionItemDesc;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.model.savieOnline.LifePaymentBean;
import com.ifwd.fwdhk.model.savieOnline.SavieFnaBean;
import com.ifwd.fwdhk.services.SavieOnlineService;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.DateApi;
import com.ifwd.fwdhk.util.HeaderUtil;
import com.ifwd.fwdhk.util.InitApplicationMessage;
import com.ifwd.fwdhk.util.SavieOnlinePageFlowControl;
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

	/*@RequestMapping(value = {"/{lang}/savings-insurance","/{lang}/savings-insurance/"})
	public ModelAndView getSavieOnlineLanding(Model model, HttpServletRequest request) {
		savieOnlineService.removeSavieOnlineSession(request);
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LANDING);
	}*/
	
    @RequestMapping(value = {"/{lang}/savings-insurance/fna-test"})
    public ModelAndView getFnaTestPage(Model model, HttpServletRequest request, HttpSession httpSession) {
           return new ModelAndView(UserRestURIConstants.getSitePath(request) + "fna-test");
    }	

	@RequestMapping(value = {"/{lang}/savings-insurance" ,"/{lang}/savings-insurance/regular-premium"})
	public ModelAndView getLanding(Model model, HttpServletRequest request, HttpSession httpSession) {
		savieOnlineService.removeSavieOnlineSession(request);
		String affiliate = (String) request.getParameter("affiliate");
		if(affiliate == null){
			affiliate = "";
		}
		httpSession.setAttribute("savieType", "RP");
		String lang = UserRestURIConstants.getLanaguage(request);
		List<OptionItemDesc> savieAns;
		if(lang.equals("tc")){
			lang = "CN";
			savieAns=InitApplicationMessage.savieAnsCN;
		}else{
			savieAns=InitApplicationMessage.savieAnsEN;
		}
		model.addAttribute("savieAns", savieAns);
		model.addAttribute("affiliate", affiliate);
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_REGULAR_PREMIUM);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/single-premium"})
	public ModelAndView o2OLanding(Model model, HttpServletRequest request, HttpSession httpSession) {
		savieOnlineService.removeSavieOnlineSession(request);
		String affiliate = (String) request.getParameter("affiliate");
		if(affiliate == null){
			affiliate = "";
		}
		httpSession.setAttribute("savieType", "SP");
		String lang = UserRestURIConstants.getLanaguage(request);
		List<OptionItemDesc> savieAns;
		if(lang.equals("tc")){
			lang = "CN";
			savieAns=InitApplicationMessage.savieAnsCN;
		}else{
			savieAns=InitApplicationMessage.savieAnsEN;
		}
		model.addAttribute("savieAns", savieAns);
		model.addAttribute("affiliate", affiliate);
		return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_SINGLE_PREMIUM);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/plan-details-rp", "/{lang}/savings-insurance/plan-details-sp"})
	public ModelAndView getSavieOnlinePlandetails(Model model, HttpServletRequest request) {
		String savieType = (String)request.getSession().getAttribute("savieType");
		if(!StringUtils.isBlank(savieType)) {
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
			}else {
				defaultDOB.setTime(date1); 
				defaultDOB.add(defaultDOB.YEAR, -18);
			}
			model.addAttribute("defaultDOB", DateApi.formatString(defaultDOB.getTime()));
			return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_PLANDETAILS);
		}else {
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
	}
	
	@RequestMapping(value = {"/{lang}/FNA/financial-needs-analysis"}) 
	public ModelAndView getSavieOnlineFna(Model model, HttpServletRequest request) {
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		else{
			try {
				savieOnlineService.getFna(request);
			}
			catch (ECOMMAPIException e) {}
			
			if(request.getSession().getAttribute("savieFna")!=null){
				return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/FNA/review");
			} else {
				return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_FNA);
			}
		}
		
	}
	
	@RequestMapping(value = {"/{lang}/FNA/review"}) 
	public ModelAndView getSavieOnlinepReview(Model model, HttpServletRequest request) {
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		else{
			return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_PRODUCT);
		}
	}
	
	@RequestMapping(value = {"/{lang}/FNA/product-recommendation"}) 
	public ModelAndView getSavieOnlinepProduct(Model model, HttpServletRequest request) {
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		else{
			model.addAttribute("etCsContactPreferredDayEN", InitApplicationMessage.etCsContactPreferredDayEN);
			model.addAttribute("etCsContactPreferredDayCN", InitApplicationMessage.etCsContactPreferredDayCN);
			model.addAttribute("etCsContactPreferredTimeSlotEN", InitApplicationMessage.etCsContactPreferredTimeSlotEN);
			model.addAttribute("etCsContactPreferredTimeSlotCN", InitApplicationMessage.etCsContactPreferredTimeSlotCN);
			model.addAttribute("etEnquiryTypeEN", InitApplicationMessage.etEnquiryTypeEN);
			model.addAttribute("etEnquiryTypeCN", InitApplicationMessage.etEnquiryTypeCN);
			return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_PRODUCT);
		}
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/sales-illustration"})
	public ModelAndView getSavieOnlineSalesIllustration(Model model, HttpServletRequest request) {
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		else{
			try {
				savieOnlineService.createSalesIllustrationPdf("1",request);
			}
			catch (Exception e) {
				logger.info(e.getMessage(),e);
				request.getSession().setAttribute("errorMsg", e.getMessage());
			}
			return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_SALES_ILLUSTRATION);
		}
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/fatca"})
	public ModelAndView getSavieOnlineLifeFatca(Model model, HttpServletRequest request) {
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		else{
			return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LIFE_FATCA);
		}
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/personal-details"})
	public ModelAndView getSavieOnlineLifePersonalDetails(Model model, HttpServletRequest request) {
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		else{
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
			return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LIFE_PERSONAL_DETAILS);
		}
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/employment-info"})
	public ModelAndView getSavieOnlineLifeEmploymentInfo(Model model, HttpServletRequest request) {
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		else{
			SavieFnaBean savieFna = (SavieFnaBean) request.getSession().getAttribute("savieFna");
			
			model.addAttribute("employmentStatusEN", InitApplicationMessage.employmentStatusEN);
			model.addAttribute("employmentStatusCN", InitApplicationMessage.employmentStatusCN);
			if(savieFna!=null && savieFna.getNature_of_business() !=null && savieFna.getNature_of_business()!=""){
				model.addAttribute("occupationEN", InitApplicationMessage.getOccupationByNob(commonUtils,savieFna.getNature_of_business(), "EN", "1"));
				model.addAttribute("occupationCN", InitApplicationMessage.getOccupationByNob(commonUtils,savieFna.getNature_of_business(), "CH", "1"));
			}
			model.addAttribute("natureOfBusinessEN", InitApplicationMessage.natureOfBusinessEN);
			model.addAttribute("natureOfBusinessCN", InitApplicationMessage.natureOfBusinessCN);
			
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
			
			/*model.addAttribute("occupationEnNoB1", InitApplicationMessage.occupationEnNoB1);
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
			model.addAttribute("occupationCnNoB24", InitApplicationMessage.occupationCnNoB24);*/
			
			String backSummary = request.getParameter("backSummary");
			if(backSummary!=null && "Y".equals(backSummary)){
				model.addAttribute("backSummary", backSummary);
			}
			
			String code = null;
			if(savieFna!=null && (savieFna.getQ4_a() !=null || (savieFna.getQ4_a_others()!=null && savieFna.getQ4_a_others()!=""))){
				if(savieFna.getQ4_a_others()!=null && savieFna.getQ4_a_others()!=""){
					int money = Integer.valueOf(savieFna.getQ4_a_others().replace(",", ""));
					if(money<=10000){
						code = "mpi1";
					}
					else if(money>=10001&&money<=15000){
						code = "mpi2";
					}
					else if(money>=15001&&money<=20000){
						code = "mpi3";
					}
					else if(money>=20001&&money<=25000){
						code = "mpi4";
					}
					else if(money>=25001&&money<=30000){
						code = "mpi5";
					}
					else if(money>=30001&&money<=40000){
						code = "mpi6";
					}
					else if(money>=40001&&money<=55000){
						code = "mpi7";
					}
					else if(money>=55001){
						code = "mpi8";
					}
				}
				else if("0".equals(savieFna.getQ4_a())){
					code = "mpi1";
				}
				else if("1".equals(savieFna.getQ4_a())){
					code = "mpi2,mpi3";
				}
				else if("2".equals(savieFna.getQ4_a())){
					code = "mpi4,mpi5,mpi6,mpi7";
				}
				else if("3".equals(savieFna.getQ4_a())){
					code = "mpi7,mpi8";
				}
				else if("4".equals(savieFna.getQ4_a())){
					code = "mpi8";
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
			return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LIFE_EMPLOYMENT_INFO);
		}
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/beneficiary-info"})
	public ModelAndView getSavieOnlineLifeBeneficaryInfo(Model model, HttpServletRequest request) {
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		else{
			model.addAttribute("savieBeneficiaryRelationshipEN", InitApplicationMessage.lifeBeneficiaryRelationshipEN);
			model.addAttribute("savieBeneficiaryRelationshipCN", InitApplicationMessage.lifeBeneficiaryRelationshipCN);
			
			String backSummary = request.getParameter("backSummary");
			if(backSummary!=null && "Y".equals(backSummary)){
				model.addAttribute("backSummary", backSummary);
			}
			return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LIFE_BENEFICARY_INFO);
		}
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/payment"})
	public ModelAndView getSavieOnlineLifePayment(Model model, HttpServletRequest request) {
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		else{
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
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/application-summary"})
	public ModelAndView getSavieOnlineLifePolicySummary(Model model, HttpServletRequest request) {
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		else{
			return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LIFE_POLICY_SUMMARY);
		}
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/declaration"})
	public ModelAndView getSavieOnlineLifeDeclaration(Model model, HttpServletRequest request) {
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		else{
			return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LIFE_DECLARATION);
		}
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/signature"})
	public ModelAndView getSavieOnlineLifeSignature(Model model, HttpServletRequest request,HttpSession session) {
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		else{
			try {
				model.addAttribute("signatureFileSize", InitApplicationMessage.signatureFileSize);
				
				if(StringUtils.isNotBlank((String)session.getAttribute("username"))){
					savieOnlineService.getCustomerServiceCentre(model, request, session);
					savieOnlineService.createApplicationFormPdf("1", request, session);
					savieOnlineService.createFnaFormPdf("1", request, session);
					
					String pdfName = (String) request.getSession().getAttribute("pdfName");
					if(pdfName==null || "".equals(pdfName)){
						savieOnlineService.createSalesIllustrationPdf("1",request);
					}
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
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/document-upload"})
	public ModelAndView getSavieOnlineLifeDocumentUpload(Model model, HttpServletRequest request,HttpSession session) {
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		else{
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
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/confirmation"})
	public ModelAndView getSavieOnlineUploadConfirmation(Model model, HttpServletRequest request) {
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		else{
			try {
				JSONObject models = new JSONObject();
				models.put("name", request.getSession().getAttribute("username"));
				savieOnlineService.sendEmails(request, "savieComplete", models);
			} catch (Exception e) {
				e.printStackTrace();
				logger.info(e.getMessage());
			}
			
			return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_UPLOAD_CONFIRMATION);
		}
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/confirmation-upload-later"})
	public ModelAndView getSavieOnlineUploadLaterConfirmation(Model model, HttpServletRequest request) {
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		else{
			try {
				JSONObject models = new JSONObject();
				models.put("name", request.getSession().getAttribute("username"));
				savieOnlineService.sendEmails(request, "uploadDocument", models);
			} catch (Exception e) {
				e.printStackTrace();
				logger.info(e.getMessage());
			}
			return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_UPLOAD_LATER_CONFIRMATION);
		}
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/confirmation-offline-signature"})
	public ModelAndView getSavieOnlineSignOfflineConfirmation(Model model, HttpServletRequest request) {
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		else{
			
			try {
				savieOnlineService.CustomerServiceCentreConfirmation("signLater", model, request);
			} catch (Exception e) {
				e.printStackTrace();
				logger.info(e.getMessage());
			}
			return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_SIGN_OFFLINE_CONFIRMATION);
		}
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = {"/{lang}/savings-insurance/confirmation-paylater"})
	public ModelAndView getSavieOnlinePayLaterConfirmation(Model model, HttpServletRequest request) {
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		else{
			try {
				savieOnlineService.CustomerServiceCentreConfirmation("paylater", model, request);
			} catch (Exception e) {
				e.printStackTrace();
				logger.info(e.getMessage());
			}
			return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_PAY_LATER_CONFIRMATION);
		}
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/confirmation-appointment"})
	public ModelAndView getSavieOnlineAppointmentConfirmation(Model model, HttpServletRequest request) {
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}else{
			try {
				savieOnlineService.CustomerServiceCentreConfirmation("offlineApplication", model, request);
			} catch (Exception e) {
				e.printStackTrace();
				logger.info(e.getMessage());
			}
			return SavieOnlinePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_APPOINTMENT_CONFIRMATION);
		}
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/customer-service-centre"})
	public ModelAndView getSavieOnlineLifeServiceCenter(Model model, HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		if(userDetails == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance");
		}
		else{
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
}
