package com.ifwd.fwdhk.controller;



import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.model.savie.SavieFormApplicationBean;
import com.ifwd.fwdhk.services.SavieService;
import com.ifwd.fwdhk.util.SaviePageFlowControl;
@Controller
public class SavieController extends BaseController{
	
	private final static Logger logger = LoggerFactory.getLogger(SavieController.class);
	
	@Autowired
	private RestServiceDao restService;
	@Autowired
	private SavieService savieService;

	@RequestMapping(value = {"/{lang}/savie-landing"})
	public String getSavieLanding(Model model, HttpServletRequest request) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		return UserRestURIConstants.getSitePath(request)+ "savie/savie-landing";
	}
	
	@RequestMapping(value = {"/{lang}/savie-plan-details"})
	public ModelAndView getSaviePlanDetails(Model model, HttpServletRequest request) {		
		return SaviePageFlowControl.pageFlow(model,request);
	}
	
	
	
	@RequestMapping(value = {"/{lang}/sendEmail"})
	public String getsendEmailInfo(Model model, HttpServletRequest request) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		return UserRestURIConstants.getSitePath(request)+ "savie/savie-sendEmail";
	}
	
	@RequestMapping(value = {"/{lang}/savie-fna"})
	public ModelAndView getSavieFNA(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request);
	}
	
	@RequestMapping(value = {"/{lang}/savie-application-details"})
	public String getSaviePersonalinfo(Model model, HttpServletRequest request) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		return UserRestURIConstants.getSitePath(request)+ "savie/savie-application-details";
	}
	
	@RequestMapping(value = {"/{lang}/savie-order-summary"})
	public String getSavieOrderSummary(Model model, HttpServletRequest request,@ModelAttribute("detailInfo")SavieFormApplicationBean savieDetail) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		logger.debug(savieDetail.getSavieApplicantBean().getFirstName());
		logger.debug(savieDetail.getSavieEmploymentBean().getEmploymentStatus());
		request.getSession().setAttribute("savieDetail", savieDetail);
		return UserRestURIConstants.getSitePath(request)+ "savie/savie-order-summary";
	}
	
	@RequestMapping(value = {"/{lang}/savie-appointment"})
	public String getSavieAppointment(Model model, HttpServletRequest request) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		return UserRestURIConstants.getSitePath(request)+ "savie/savie-appointment";
	}
	
	@RequestMapping(value = {"/{lang}/savie-document-upload"})
	public String getSavieDocumentUpload(Model model, HttpServletRequest request) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		return UserRestURIConstants.getSitePath(request)+ "savie/savie-document-upload";
	}
	
	
	@RequestMapping(value = {"/{lang}/savie-thankyou"})
	public String getSavieThankyou(Model model, HttpServletRequest request) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		return UserRestURIConstants.getSitePath(request)+ "savie/savie-thankyou";
	}
	
	@RequestMapping(value = {"/{lang}/savie-declaration-authorization"})
	public String getSavieDeclarationAuthorization(Model model, HttpServletRequest request) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		return UserRestURIConstants.getSitePath(request)+ "savie/savie-declaration-authorization";
	}
	
	@RequestMapping(value = {"/{lang}/savie-signature"})
	public String getSavieSignature(Model model, HttpServletRequest request) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		return UserRestURIConstants.getSitePath(request)+ "savie/savie-signature";
	}
	
	@RequestMapping(value = {"/{lang}/savie-edit-view"})
	public String getSavieEditView(Model model, HttpServletRequest request) {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		return UserRestURIConstants.getSitePath(request)+ "savie/savie-edit-view";
	}
	
	
}
