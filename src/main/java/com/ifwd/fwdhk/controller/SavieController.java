package com.ifwd.fwdhk.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.common.document.PDFGeneration;
import com.ifwd.fwdhk.common.document.PdfAttribute;
import com.ifwd.fwdhk.model.OptionItemDesc;
import com.ifwd.fwdhk.model.savie.SavieFormApplicationBean;
import com.ifwd.fwdhk.services.SavieService;
import com.ifwd.fwdhk.util.CommonEnum.GenderEnum;
import com.ifwd.fwdhk.util.CommonEnum.MaritalStatusEnum;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.InitApplicationMessage;
import com.ifwd.fwdhk.util.SaviePageFlowControl;

@Controller
public class SavieController extends BaseController{
	
	private final static Logger logger = LoggerFactory.getLogger(SavieController.class);
	
	@Autowired
	private RestServiceDao restService;
	@Autowired
	private SavieService savieService;
	@Autowired
	private CommonUtils commonUtils;
		
	@RequestMapping(value="/{lang}/savie", method = RequestMethod.GET)
	public RedirectView getSavieShortcut(Model model, HttpServletRequest request)
	{
		RedirectView rv = new RedirectView(request.getContextPath() + "/" + UserRestURIConstants.getLanaguage(request) + "/savings-insurance?utm_source=Offline&utm_medium=referral&utm_campaign=Offline|SA|P1|");
		rv.setStatusCode(HttpStatus.MOVED_PERMANENTLY);
		return rv;
	}	

	@RequestMapping(value = {"/{lang}/savings-insurance/landing"})
	public ModelAndView getSavieLanding(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_LANDING);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/plan-details"})
	public ModelAndView getSaviePlanDetails(Model model, HttpServletRequest request) {		
		return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_PLAN_DETAILS);
	}	
	
	
	@RequestMapping(value = {"/{lang}/savings-insurance/financial-needs-analysis"})
	public ModelAndView getSavieFNA(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_FNA);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/sales-illustration"})
	public ModelAndView getSavieSalesIllustration(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_SALES_ILLUSTRATION);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/application"})
	public ModelAndView getSaviePersonalinfo(Model model, HttpServletRequest request) {
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
		return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_APPLICATION);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/application-summary"}, method = RequestMethod.POST)
	public ModelAndView getSavieOrderSummary(Model model, HttpServletRequest request,
			@ModelAttribute("detailInfo")SavieFormApplicationBean savieDetail,
			@RequestParam String appGender,
			@RequestParam String maritalStatus) {
		//@RequestParam String birthday
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
		/*if(!"".equals(birthday)){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			try {
				savieDetail.getSavieApplicantBean().setBirthday(sdf.parse(birthday));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}*/
		
		
		request.getSession().setAttribute("savieDetail", savieDetail);
		return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_SUMMARY);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/customer-service-centre"})
	public ModelAndView getSavieAppointment(Model model, HttpServletRequest request,@ModelAttribute("detailInfo")SavieFormApplicationBean savieDetail) {
		request.getSession().setAttribute("savieDetail", savieDetail);
		return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_CS);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/document-upload"})
	public ModelAndView getSavieDocumentUpload(Model model, HttpServletRequest request) {
		model.addAttribute("signatureWidth", InitApplicationMessage.signatureWidth);
		model.addAttribute("signatureHeight", InitApplicationMessage.signatureHeight);
		model.addAttribute("applicationFileSize", InitApplicationMessage.applicationFileSize);
		return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_DOCUMENT_UPLOAD);
	}
	
	
	@RequestMapping(value = {"/{lang}/savings-insurance/confirmation"})
	public ModelAndView getSavieThankyou(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_CONFIRMATION);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/declarations"})
	public ModelAndView getSavieDeclarationAuthorization(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_DECLARATION);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/signature"})
	public ModelAndView getSavieSignature(Model model, HttpServletRequest request) {
		model.addAttribute("signatureFileSize", InitApplicationMessage.signatureFileSize);
		return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_SIGNATURE);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/interest-gathering","/{lang}/savings-insurance"})
	public ModelAndView getSavieEmailConfirmed(Model model, HttpServletRequest request) {

		String affiliate = (String) request.getAttribute("affiliate");
		if(affiliate == null){
			affiliate = "";
		}
		String lang = UserRestURIConstants.getLanaguage(request);
		List<OptionItemDesc> savieAns;
		if(lang.equals("tc")){
			lang = "CN";
			savieAns=InitApplicationMessage.savieAnsCN;
		}else{
			savieAns=InitApplicationMessage.savieAnsEN;
		}
		UserRestURIConstants.setController("Savie");
		request.setAttribute("controller", UserRestURIConstants.getController());
		
		model.addAttribute("savieAns", savieAns);
		model.addAttribute("affiliate", affiliate);
		return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_INTEREST_GATHERING);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/interest-gathering/{affiliate}"})
	public void getSavieEmailConfirmedId(Model model, HttpServletRequest request,HttpServletResponse response,@PathVariable int affiliate) {
		try {
			request.setAttribute("affiliate", affiliate+"");
			String url =  request.getServletPath();
			url = url.substring(0,url.lastIndexOf("/"));
			request.getRequestDispatcher(url).forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping(value = {"/{lang}/savings-insurance/email-submitted","/{lang}/savings-insurance/interest-gathering/email-submitted"})
	public ModelAndView getSavieEmailSubmitted(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_EMAIL_SUBMITTED);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/pdf-show"})
 	public ModelAndView showPdf(Model model, HttpServletRequest request,@RequestParam String pdfName,@RequestParam String requestNo) {
		request.getSession().setAttribute("pdfName", pdfName);
		request.getSession().setAttribute("requestNo", requestNo);
		return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_PDF);
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
	
	
	
	/**
	 * 
	 * @param model
	 * @param request
	 * @return download page
	 */
	@RequestMapping(value = {"/{lang}/downloadPage"})
	public ModelAndView goDownloadPage(Model model, HttpServletRequest request){
		logger.info("go to download page");
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		return new ModelAndView(UserRestURIConstants.getSitePath(request)
				+ "downloadTest");
	}
	
	/**
	 * 
	 * @param request download target file
	 * @param response
	 */
	@RequestMapping(value = {"/{lang}/fileDownload"})
	public void fileDownload(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc")){
			lang = "CN";
		}
		
		//String path = servletContext.getRealPath("/"); 
		logger.info(request.getServletPath());
		logger.info(request.getSession().getServletContext().getRealPath("\\"));
		
		response.setContentType("multipart/form-data");  
		
		response.setHeader("Content-Disposition", "attachment;fileName="+"a.pdf");  
		ServletOutputStream out;  
		out = response.getOutputStream();  
		List<PdfAttribute> attributeList=new ArrayList<PdfAttribute>();		
		attributeList.add(new PdfAttribute("chineseName","吳錦美"));
		attributeList.add(new PdfAttribute("age","http://i2.sinaimg.cn/dy/deco/2012/0613/yocc20120613img01/news_logo.png","Image"));
		attributeList.add(new PdfAttribute("Premium","http://www.fwd.com.hk/img/logo.jpg","Image"));
		String pdfTemplatePath = request.getRealPath("/").replace("\\", "/")+"pdf/"+"SavieProposalTemplateChi3.pdf";
		InputStream is = new FileInputStream(pdfTemplatePath);
		PDFGeneration.generatePdf(is, out, attributeList);
		out.close();  
		out.flush();
		
		

	}
	
	/**
	 * @param request reload init message
	 * @param response
	 */
	@RequestMapping(value = {"/{lang}/reloadInitAppMsg"},method=RequestMethod.GET)
	public ModelAndView reloadInitMsg(HttpServletRequest request,HttpServletResponse response){
		InitApplicationMessage.init(commonUtils);
		
		return new ModelAndView(UserRestURIConstants.getSitePath(request)
				+ "downloadTest");
	}
}
