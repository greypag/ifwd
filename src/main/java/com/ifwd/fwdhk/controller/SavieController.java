package com.ifwd.fwdhk.controller;



import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.model.savie.SavieFormApplicationBean;
import com.ifwd.fwdhk.services.SavieService;
import com.ifwd.fwdhk.util.CommonEnum.GenderEnum;
import com.ifwd.fwdhk.util.CommonEnum.MaritalStatusEnum;
import com.ifwd.fwdhk.util.SaviePageFlowControl;
@Controller
public class SavieController extends BaseController{
	
	private final static Logger logger = LoggerFactory.getLogger(SavieController.class);
	
	@Autowired
	private RestServiceDao restService;
	@Autowired
	private SavieService savieService;

	@RequestMapping(value = {"/{lang}/saving-insurance/landing","/{lang}/saving-insurance"})
	public ModelAndView getSavieLanding(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request);
	}
	
	@RequestMapping(value = {"/{lang}/saving-insurance/plan-details"})
	public ModelAndView getSaviePlanDetails(Model model, HttpServletRequest request) {		
		return SaviePageFlowControl.pageFlow(model,request);
	}	
	
	
	@RequestMapping(value = {"/{lang}/saving-insurance/financial-needs-analysis"})
	public ModelAndView getSavieFNA(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request);
	}
	
	@RequestMapping(value = {"/{lang}/saving-insurance/sales-illustration"})
	public ModelAndView getSavieIllustration(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request);
	}
	
	@RequestMapping(value = {"/{lang}/saving-insurance/application"})
	public ModelAndView getSaviePersonalinfo(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request);
	}
	
	@RequestMapping(value = {"/{lang}/saving-insurance/application-summary"}, method = RequestMethod.POST)
	public ModelAndView getSavieOrderSummary(Model model, HttpServletRequest request,
			@ModelAttribute("detailInfo")SavieFormApplicationBean savieDetail,
			@RequestParam String appGender,
			@RequestParam String maritalStatus,
			@RequestParam String birthday) {
		if("F".equals(appGender)){
			savieDetail.getSavieApplicantBean().setGender(GenderEnum.FEMALE);
		}
		else{
			savieDetail.getSavieApplicantBean().setGender(GenderEnum.MALE);
		}
		if("S".equals(maritalStatus)){
			savieDetail.getSavieApplicantBean().setMaritalStatus(MaritalStatusEnum.Single);
		}
		else{
			savieDetail.getSavieApplicantBean().setMaritalStatus(MaritalStatusEnum.Married);
		}
		if(!"".equals(birthday)){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			try {
				savieDetail.getSavieApplicantBean().setBirthday(sdf.parse(birthday));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		
		request.getSession().setAttribute("savieDetail", savieDetail);
		return SaviePageFlowControl.pageFlow(model,request);
	}
	
	@RequestMapping(value = {"/{lang}/saving-insurance/customer-service-centre"})
	public ModelAndView getSavieAppointment(Model model, HttpServletRequest request,@ModelAttribute("detailInfo")SavieFormApplicationBean savieDetail) {
		request.getSession().setAttribute("savieDetail", savieDetail);
		return SaviePageFlowControl.pageFlow(model,request);
	}
	
	@RequestMapping(value = {"/{lang}/saving-insurance/document-upload"})
	public ModelAndView getSavieDocumentUpload(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request);
	}
	
	
	@RequestMapping(value = {"/{lang}/saving-insurance/confirmation"})
	public ModelAndView getSavieThankyou(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request);
	}
	
	@RequestMapping(value = {"/{lang}/saving-insurance/declarations"})
	public ModelAndView getSavieDeclarationAuthorization(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request);
	}
	
	@RequestMapping(value = {"/{lang}/saving-insurance/signature"})
	public ModelAndView getSavieSignature(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request);
	}
	
	@RequestMapping(value = {"/{lang}/saving-insurance/interest-gathering"})
	public ModelAndView getSavieEmailConfirmed(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request);
	}
	
	@RequestMapping(value = {"/{lang}/saving-insurance/email-submitted"})
	public ModelAndView getSavieEmailSubmitted(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request);
	}
	

	
	/**
	 * test save image
	 * @param model
	 * @param request
	 * @param response
	 * @param file
	 * @throws Exception
	 */
	
	@RequestMapping(value = {"/{lang}/sendEmail"})
	public String getsendEmailInfo(Model model, HttpServletRequest request) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		return UserRestURIConstants.getSitePath(request)+ "savie/savie-sendEmail";
	}
	

	
}
