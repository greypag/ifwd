package com.ifwd.fwdhk.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.common.document.PdfAttribute;
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
		return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_LANDING);
	}
	
	@RequestMapping(value = {"/{lang}/saving-insurance/plan-details"})
	public ModelAndView getSaviePlanDetails(Model model, HttpServletRequest request) {		
		return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_PLAN_DETAILS);
	}	
	
	
	@RequestMapping(value = {"/{lang}/saving-insurance/financial-needs-analysis"})
	public ModelAndView getSavieFNA(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_FNA);
	}
	
	@RequestMapping(value = {"/{lang}/saving-insurance/sales-illustration"})
	public ModelAndView getSavieSalesIllustration(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_SALES_ILLUSTRATION);
	}
	
	@RequestMapping(value = {"/{lang}/saving-insurance/application"})
	public ModelAndView getSaviePersonalinfo(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_APPLICATION);
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
		return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_SUMMARY);
	}
	
	@RequestMapping(value = {"/{lang}/saving-insurance/customer-service-centre"})
	public ModelAndView getSavieAppointment(Model model, HttpServletRequest request,@ModelAttribute("detailInfo")SavieFormApplicationBean savieDetail) {
		request.getSession().setAttribute("savieDetail", savieDetail);
		return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_CS);
	}
	
	@RequestMapping(value = {"/{lang}/saving-insurance/document-upload"})
	public ModelAndView getSavieDocumentUpload(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_DOCUMENT_UPLOAD);
	}
	
	
	@RequestMapping(value = {"/{lang}/saving-insurance/confirmation"})
	public ModelAndView getSavieThankyou(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_CONFIRMATION);
	}
	
	@RequestMapping(value = {"/{lang}/saving-insurance/declarations"})
	public ModelAndView getSavieDeclarationAuthorization(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_DECLARATION);
	}
	
	@RequestMapping(value = {"/{lang}/saving-insurance/signature"})
	public ModelAndView getSavieSignature(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_SIGNATURE);
	}
	
	@RequestMapping(value = {"/{lang}/saving-insurance/interest-gathering"})
	public ModelAndView getSavieEmailConfirmed(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_INTEREST_GATHERING);
	}
	
	@RequestMapping(value = {"/{lang}/saving-insurance/email-submitted"})
	public ModelAndView getSavieEmailSubmitted(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_EMAIL_SUBMITTED);
	}
	
	@RequestMapping(value = {"/{lang}/saving-insurance/pdf-show"})
 	public ModelAndView showPdf(Model model, HttpServletRequest request,@RequestParam String pdfName) {
		request.getSession().setAttribute("pdfName", pdfName);
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
	
	@RequestMapping(value = {"/{lang}/download"})
	public String downloadFile(Model model, HttpServletRequest request) throws FileNotFoundException {
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		
		List<PdfAttribute> attributeList = new ArrayList<PdfAttribute>();

		attributeList.add(new PdfAttribute("totalYear", "68"));
		attributeList.add(new PdfAttribute("applicationNo", "自助息理財壽險計畫"));
		attributeList.add(new PdfAttribute("chineseName", "William Zhu"));
		attributeList.add(new PdfAttribute("gender", "男"));
		attributeList.add(new PdfAttribute("dateTime", "11/12/1986"));
		attributeList.add(new PdfAttribute("singlePremiumAmount", "10,000"));
		attributeList.add(new PdfAttribute("age", "15"));
		attributeList.add(new PdfAttribute("paymentMethod", "港幣"));
		attributeList.add(new PdfAttribute("Premium", "1,000"));
		attributeList.add(new PdfAttribute("singlePremiumAmount", "100,000"));
		attributeList.add(new PdfAttribute("paymentType", " - "));
		attributeList.add(new PdfAttribute("verson", "1.0"));
		attributeList.add(new PdfAttribute("versionNum", "23.224.839"));
		String year66 = "66";
		for (int i = 0; i < 13; i++) {
			if (i > 5 && i < 11) {
				attributeList.add(new PdfAttribute("endYear" + i, (i - 4) * 5
						+ ""));
			} else if (i < 6) {
				attributeList.add(new PdfAttribute("endYear" + i, i + ""));
			} else if (i == 11) {
				if (year66 == null && "".equals(year66)) {
					attributeList.add(new PdfAttribute("endYear" + i, "100"));
				} else {
					attributeList.add(new PdfAttribute("endYear" + i, "66"));
				}

			} else if (i == 12) {
				attributeList.add(new PdfAttribute("endYear" + i, "100"));
			}

			attributeList.add(new PdfAttribute("totalPremium" + i, "10,000"));
			if (i < 4) {

				attributeList.add(new PdfAttribute("interestedRate" + i,
						"3.21%"));
				attributeList.add(new PdfAttribute("accountEOP" + i,
						"23,232,322"));
				attributeList.add(new PdfAttribute("guranteedSurrenderBenefit"
						+ i, "100,000"));
				attributeList.add(new PdfAttribute("guranteedDeathBenefit" + i,
						"2,000"));
			} else {

				for (int y = 1; y < 5; y++) {
					attributeList.add(new PdfAttribute(
							"guranteedSurrenderBenefit" + y + "_" + i,
							"100,000"));
					attributeList.add(new PdfAttribute("guranteedDeathBenefit"
							+ y + "_" + i, "2,000"));
				}
			}

		}
		//FileInputStream fileInputStream = new FileInputStream("D:\\template\\SavieProposalTemplateChi3_20150716.pdf");
		
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
	public void fileDownload(HttpServletRequest request,HttpServletResponse response) {
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
		  
		File file = new File("D:\\workspace\\fwdhk\\download.pdf");
		//File file = new File(path + "download/" + "download.pdf");
		
		try {  
			FileInputStream inputStream = new FileInputStream(file);  
			
			 
			out = response.getOutputStream();  
			
			int b = 0;  
			while ((b = inputStream.read()) != -1){  
				
				out.write(b);  
			}  
			inputStream.close();  
			out.close();  
			out.flush();  
			
		} catch (IOException e) {  
			e.printStackTrace();  
		}
	}
	
	
}
