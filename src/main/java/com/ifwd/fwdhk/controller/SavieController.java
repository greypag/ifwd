package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.io.FileInputStream;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
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
import com.ifwd.fwdhk.connector.response.savie.ServiceCentreResponse;
import com.ifwd.fwdhk.connector.response.savie.ServiceCentreResult;
import com.ifwd.fwdhk.model.OptionItemDesc;
import com.ifwd.fwdhk.model.savie.SavieFormApplicationBean;
import com.ifwd.fwdhk.services.SavieService;
import com.ifwd.fwdhk.util.CommonEnum.GenderEnum;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.DateApi;
import com.ifwd.fwdhk.util.HeaderUtil;
import com.ifwd.fwdhk.util.InitApplicationMessage;
import com.ifwd.fwdhk.util.SaviePageFlowControl;
import com.ifwd.fwdhk.util.WebServiceUtils;

@Controller
public class SavieController extends BaseController{
	
	private final static Logger logger = LoggerFactory.getLogger(SavieController.class);
	
	@Autowired
	private RestServiceDao restService;
	@Autowired
	private SavieService savieService;
	@Autowired
	private CommonUtils commonUtils;
		
	@RequestMapping(value = {"/savie", "/Savie", "/SAVIE"}, method = RequestMethod.GET)
	public RedirectView getSavieShortcut(Model model, HttpServletRequest request)
	{
		RedirectView rv = new RedirectView(request.getContextPath() + "/tc/savings-insurance?utm_source=Offline&utm_medium=referral&utm_campaign=Offline|SA|P1|");
		rv.setStatusCode(HttpStatus.MOVED_PERMANENTLY);
		return rv;
	}	

	@RequestMapping(value = {"/{lang}/savings-insurance/landing"})
	public ModelAndView getSavieLanding(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_LANDING);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/plan-details-sp", "/{lang}/savings-insurance/plan-details-rp"})
	public ModelAndView getSaviePlanDetails(Model model, HttpServletRequest request, HttpSession httpSession) {	
		HttpSession session = request.getSession();
		String accessCode = (String) httpSession.getAttribute("accessCode");
		logger.info(accessCode);
		String key = "savie.planDetails";
		String pageTitle = WebServiceUtils.getPageTitle("page." + key,
				UserRestURIConstants.getLanaguage(request));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle(
				"meta." + key, UserRestURIConstants.getLanaguage(request));
		String ogTitle = WebServiceUtils.getPageTitle(key + ".og.title",
				UserRestURIConstants.getLanaguage(request));
		String ogType = WebServiceUtils.getPageTitle(key + ".og.type",
				UserRestURIConstants.getLanaguage(request));
		String ogUrl = WebServiceUtils.getPageTitle(key + ".og.url",
				UserRestURIConstants.getLanaguage(request));
		String ogImage = WebServiceUtils.getPageTitle(key + ".og.image",
				UserRestURIConstants.getLanaguage(request));
		String ogDescription = WebServiceUtils.getPageTitle(
				key + ".og.description",
				UserRestURIConstants.getLanaguage(request));

		if (request.getRequestURL().toString().contains("-rp")) {
			httpSession.setAttribute("savieType", "RP");
			key = "rp";
		} else {
			httpSession.setAttribute("savieType", "SP");
			key = "sp";
		}
		
		String twitterCard = WebServiceUtils.getPageTitle("twitter.savie." + key + ".card",
				UserRestURIConstants.getLanaguage(request));
		String twitterImage = WebServiceUtils.getPageTitle("twitter.savie." + key + ".image",
				UserRestURIConstants.getLanaguage(request));
		String twitterSite = WebServiceUtils.getPageTitle("twitter.savie." + key + ".site",
				UserRestURIConstants.getLanaguage(request));
		String twitterUrl = WebServiceUtils.getPageTitle("twitter.savie." + key + ".url",
				UserRestURIConstants.getLanaguage(request));
		String canonical = WebServiceUtils.getPageTitle("canonical.savie." + key + "",
				UserRestURIConstants.getLanaguage(request));
		
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
		model.addAttribute("ogTitle", ogTitle);
		model.addAttribute("ogType", ogType);
		model.addAttribute("ogUrl", ogUrl);
		model.addAttribute("ogImage", ogImage);
		model.addAttribute("ogDescription", ogDescription);
		model.addAttribute("twitterCard", twitterCard);
		model.addAttribute("twitterImage", twitterImage);
		model.addAttribute("twitterSite", twitterSite);
		model.addAttribute("twitterUrl", twitterUrl);
		model.addAttribute("canonical", canonical);
		
		/*String current = request.getServletPath();
		if(current.endsWith("plan-details-sp")) {
			model.addAttribute("planType", "sp");
		}else if (current.endsWith("plan-details-rp")) {
			model.addAttribute("planType", "rp");
		}*/
		
		if(org.apache.commons.lang.StringUtils.isNotBlank((String)session.getAttribute("savingAmount"))
				|| org.apache.commons.lang.StringUtils.isNotBlank(accessCode)) {
			httpSession.setAttribute("accessCode", accessCode);
			if("thankyou".equals(request.getParameter("thankyou"))){
				model.addAttribute("thankyou", request.getParameter("thankyou"));
			}
			SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
			Date date = new Date();
			Calendar startDOB = new GregorianCalendar();
			startDOB.setTime(date); 
			startDOB.add(startDOB.YEAR, -70);
			startDOB.add(startDOB.DATE, 1);
			model.addAttribute("startDOB", format.format(startDOB.getTime()));
			Calendar defaultDOB = new GregorianCalendar();
			defaultDOB.setTime(date); 
			defaultDOB.add(defaultDOB.YEAR, -18);
			model.addAttribute("defaultDOB", format.format(defaultDOB.getTime()));
			model.addAttribute("nextPageFlow2", "customer-service-centre");
			
			return new ModelAndView("/merged/savie/plan-details");
			//return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_PLAN_DETAILS);
		}else {
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request)
					+ "/savings-insurance");
		}
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
	public ModelAndView getSavieOrderSummary(Model model, HttpServletRequest request,HttpSession httpSession,
			@ModelAttribute("detailInfo")SavieFormApplicationBean savieDetail,
			@RequestParam String appGender,
			@RequestParam String maritalStatus,
			@RequestParam String beneficiaryBeansGenders1) throws ParseException {
		//@RequestParam String birthday
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");                
		String birthOfDay = (String) httpSession.getAttribute("birthOfDay");
		//05/28/1995
		if(null != birthOfDay){
			String[] date= birthOfDay.split("/");
			birthOfDay = date[2]+"-"+date[0]+"-"+date[1];
			logger.info(birthOfDay);
			savieDetail.getSavieApplicantBean().setBirthday(sdf.parse(birthOfDay));
		}
		if("F".equals(appGender)){
			savieDetail.getSavieApplicantBean().setGender(GenderEnum.FEMALE);
		}
		else{
			savieDetail.getSavieApplicantBean().setGender(GenderEnum.MALE);
		}
		
		savieDetail.getSavieApplicantBean().setResidentialDistrictDesc(savieDetail.getSavieApplicantBean().getResidentialDistrict().split("-")[1]);
		savieDetail.getSavieApplicantBean().setResidentialDistrict(savieDetail.getSavieApplicantBean().getResidentialDistrict().split("-")[0]);
		savieDetail.getSavieApplicantBean().setMaritalStatusDesc(maritalStatus.split("-")[1]);
		savieDetail.getSavieApplicantBean().setMaritalStatus(maritalStatus.split("-")[0]);
		savieDetail.getSavieApplicantBean().setPlaceOfBirthDesc(savieDetail.getSavieApplicantBean().getPlaceOfBirth().split("-")[1]);
		savieDetail.getSavieApplicantBean().setPlaceOfBirth(savieDetail.getSavieApplicantBean().getPlaceOfBirth().split("-")[0]);
		savieDetail.getSavieApplicantBean().setNationalityDesc(savieDetail.getSavieApplicantBean().getNationality().split("-")[1]);
		savieDetail.getSavieApplicantBean().setNationality(savieDetail.getSavieApplicantBean().getNationality().split("-")[0]);
		
		savieDetail.getSavieEmploymentBean().setEmploymentStatusDesc(savieDetail.getSavieEmploymentBean().getEmploymentStatus().split("-")[1]);
		savieDetail.getSavieEmploymentBean().setEmploymentStatus(savieDetail.getSavieEmploymentBean().getEmploymentStatus().split("-")[0]);
		savieDetail.getSavieEmploymentBean().setOccupationDesc(savieDetail.getSavieEmploymentBean().getOccupation().split("-")[1]);
		savieDetail.getSavieEmploymentBean().setOccupation(savieDetail.getSavieEmploymentBean().getOccupation().split("-")[0]);
		savieDetail.getSavieEmploymentBean().setNatureOfBusinessDesc(savieDetail.getSavieEmploymentBean().getNatureOfBusiness().split("-")[1]);
		savieDetail.getSavieEmploymentBean().setNatureOfBusiness(savieDetail.getSavieEmploymentBean().getNatureOfBusiness().split("-")[0]);
		savieDetail.getSavieEmploymentBean().setMonthlyPersonalIncomeDesc(savieDetail.getSavieEmploymentBean().getMonthlyPersonalIncome().split("-")[1]);
		savieDetail.getSavieEmploymentBean().setMonthlyPersonalIncome(savieDetail.getSavieEmploymentBean().getMonthlyPersonalIncome().split("-")[0]);
		
		if("male".equals(beneficiaryBeansGenders1)){
			savieDetail.getSavieBeneficiaryBeans().get(0).setGender(GenderEnum.MALE);
		}
		else{
			savieDetail.getSavieBeneficiaryBeans().get(0).setGender(GenderEnum.FEMALE);
		}
		
		if(savieDetail.getSavieBeneficiaryBeans() !=null && savieDetail.getSavieBeneficiaryBeans().size()>0){
			for(int a=0;a<savieDetail.getSavieBeneficiaryBeans().size();a++){
				savieDetail.getSavieBeneficiaryBeans().get(a).setRelationshipDesc(savieDetail.getSavieBeneficiaryBeans().get(a).getRelationship().split("-")[1]);
				savieDetail.getSavieBeneficiaryBeans().get(a).setRelationship(savieDetail.getSavieBeneficiaryBeans().get(a).getRelationship().split("-")[0]);
			}
		}
		request.getSession().setAttribute("savieDetail", savieDetail);
		return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_SUMMARY);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/document-upload"})
	public ModelAndView getSavieDocumentUpload(Model model, HttpServletRequest request) {
		model.addAttribute("signatureWidth", InitApplicationMessage.signatureWidth);
		model.addAttribute("signatureHeight", InitApplicationMessage.signatureHeight);
		model.addAttribute("applicationFileSize", InitApplicationMessage.applicationFileSize);
		return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_DOCUMENT_UPLOAD);
	}
	
	
	/*@RequestMapping(value = {"/{lang}/savings-insurance/confirmation"})
	public ModelAndView getSavieThankyou(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_CONFIRMATION);
	}*/
	
	@RequestMapping(value = {"/{lang}/savings-insurance/declarations"})
	public ModelAndView getSavieDeclarationAuthorization(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_DECLARATION);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/signature"})
	public ModelAndView getSavieSignature(Model model, HttpServletRequest request) {
		model.addAttribute("signatureFileSize", InitApplicationMessage.signatureFileSize);
		return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_SIGNATURE);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/interest-gathering"})
	public ModelAndView getSavieEmailConfirmed(Model model, HttpServletRequest request) {

		String affiliate = (String) request.getParameter("affiliate");
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
		
		model.addAttribute("savieAns", savieAns);
		model.addAttribute("affiliate", affiliate);
		return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_INTEREST_GATHERING);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/o2o-landing/{affiliate}"})
	public void getSavieEmailConfirmedId(Model model, HttpServletRequest request,HttpServletResponse response,@PathVariable int affiliate) {
		try {
			request.setAttribute("affiliate", affiliate+"");
			String url =  request.getServletPath();
			url = url.substring(0,url.lastIndexOf("/"));
			request.getRequestDispatcher(url).forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/*@RequestMapping(value = {"/{lang}/savings-insurance/email-submitted","/{lang}/savings-insurance/o2o-landing/email-submitted"})
	public ModelAndView getSavieEmailSubmitted(Model model, HttpServletRequest request) {
		String referer = request.getHeader("referer");
		if(referer != null && (referer.endsWith("/savings-insurance/email-submitted") || referer.endsWith("/savings-insurance/o2o-landing/email-submitted")
				|| referer.endsWith("/savings-insurance/o2o-landing") || referer.endsWith("/savings-insurance/")
				|| referer.endsWith("/savings-insurance") || referer.indexOf("savings-insurance?affiliate") > 1
				|| referer.indexOf("/savings-insurance/o2o-landing?affiliate") > 1)) {
			return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_EMAIL_SUBMITTED);
		}else {
			return getSavieEmailConfirmed(model, request);
		//}
	}*/
	
	@RequestMapping(value = {"/{lang}/savings-insurance/pdf-show"})
 	public ModelAndView showPdf(Model model, HttpServletRequest request,@RequestParam String pdfName,@RequestParam String requestNo) {
		request.getSession().setAttribute("pdfName", pdfName);
		request.getSession().setAttribute("requestNo", requestNo);
		return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_PDF);
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
		InitApplicationMessage.init(commonUtils, "reload");
		
		return new ModelAndView(UserRestURIConstants.getSitePath(request)
				+ "downloadTest");
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/customer-service-centre"})
	public ModelAndView chooseServiceCenter(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		//savingAmount为空时返回首页
		if(org.apache.commons.lang.StringUtils.isNotBlank((String)session.getAttribute("savingAmount")) && org.apache.commons.lang.StringUtils.isNotBlank((String)session.getAttribute("username")) && org.apache.commons.lang.StringUtils.isNotBlank((String)session.getAttribute("accessCode"))) {
			String lang = UserRestURIConstants.getLanaguage(request);
			String Url = UserRestURIConstants.SERVICE_URL + "/appointment/timeSlot/all";
			if (lang.equals("tc")) {
				lang = "CN";
			}
			Map<String,String> header = new HashMap<String, String>(COMMON_HEADERS);
			if(session.getAttribute("authenticate") !=null && session.getAttribute("authenticate").equals("true")){
				HeaderUtil hu = new HeaderUtil();
				header = hu.getHeader(request);
			}
			else{
				header.put("userName", "*DIRECTGI");
				header.put("token", commonUtils.getToken("reload"));
			}
			header.put("language", WebServiceUtils.transformLanaguage(lang));
			org.json.simple.JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,Url, header, null);
			logger.info(responseJsonObj.toString());
			if(responseJsonObj.get("serviceCentres") == null || responseJsonObj.get("serviceCentres") == ""){
				logger.info(responseJsonObj.toString());
			}
			org.json.simple.JSONArray serviceCentresArr = (JSONArray) responseJsonObj.get("serviceCentres");
			org.json.simple.JSONObject serviceCentreObj = new JSONObject();
			
			//serviceCentreResponse 没有可以预约的中心不要显示在下拉列中
			ServiceCentreResponse serviceCentreResponse;
			if (lang.equals("CN")) {
				serviceCentreResponse = InitApplicationMessage.serviceCentreCN;
			}else {
				serviceCentreResponse =InitApplicationMessage.serviceCentreEN;
			}
			
			Map<String, ServiceCentreResult> entityMap = new HashMap<String, ServiceCentreResult>();
			List<ServiceCentreResult> serviceCentreResultList = serviceCentreResponse.getServiceCentres();
			org.json.simple.JSONArray datesArray;
			org.json.simple.JSONObject datesObj;
			Map<String, List<String>> datesMap = new HashMap<String, List<String>>();
			List<String> datesList;
			List<String> calendarList;
			long beforeDay = 86400000;//1天
			
			if(serviceCentresArr!=null && serviceCentresArr.size()>0){
				serviceCentreObj = (JSONObject) serviceCentresArr.get(0);
				calendarList = DateApi.timeslot(2, 24);
				
				datesList = new ArrayList<String>();
				for(ServiceCentreResult entity :serviceCentreResultList) {
					if(entity.getServiceCentreCode().equals(serviceCentreObj.get("serviceCentreCode"))) {
						entityMap.put(entity.getServiceCentreCode(), entity);
						
						datesArray = (JSONArray) serviceCentreObj.get("dates");
						for(int j = 0; j< datesArray.size(); j++) {
							datesObj = (JSONObject)datesArray.get(j);
							datesList.add(DateApi.formatTime((long)datesObj.get("date") - beforeDay));
						}
						calendarList.removeAll(datesList);
						datesMap.put(entity.getServiceCentreCode(), calendarList);
						break;
					}
				}
			}
			if(serviceCentresArr!=null && serviceCentresArr.size()>1){
				for(int i=1;i<serviceCentresArr.size();i++){
					org.json.simple.JSONArray datesArr = (JSONArray) serviceCentreObj.get("dates");
					org.json.simple.JSONObject dateObj = (JSONObject) datesArr.get(0);
					long date = (long) dateObj.get("date");
					
					org.json.simple.JSONObject serviceCentreObjB = (JSONObject) serviceCentresArr.get(i);
					org.json.simple.JSONArray datesArrB = (JSONArray) serviceCentreObjB.get("dates");
					org.json.simple.JSONObject dateObjB = (JSONObject) datesArrB.get(0);
					long dateB = (long) dateObjB.get("date");
					if(date>dateB){
						serviceCentreObj = serviceCentreObjB;
					}
					
					calendarList = DateApi.timeslot(2, 24);
					datesList = new ArrayList<String>();
					for(ServiceCentreResult entity : serviceCentreResultList) {
						if(entity.getServiceCentreCode().equals(serviceCentreObjB.get("serviceCentreCode"))) {
							entityMap.put(entity.getServiceCentreCode(), entity);
							
							datesArray = (JSONArray) serviceCentreObjB.get("dates");
							for(int j = 0; j< datesArray.size(); j++) {
								datesObj = (JSONObject)datesArray.get(j);
								datesList.add(DateApi.formatTime((Long)datesObj.get("date") - beforeDay));
							}
							calendarList.removeAll(datesList);
							datesMap.put(entity.getServiceCentreCode(), calendarList);
							break;
						}
					}
				}
			} /*else if(serviceCentresArr!=null && serviceCentresArr.size()==1){
				serviceCentreObj = (JSONObject) serviceCentresArr.get(0);
			}*/
			
			List<ServiceCentreResult> results = new ArrayList<ServiceCentreResult>();
			for(ServiceCentreResult result : entityMap.values()) {
				results.add(result);
			}
			logger.info("entityMap: " + entityMap);
			logger.info("datesMap: " + datesMap);
			serviceCentreResponse.setServiceCentres(results);
			
			model.addAttribute("serviceCentre", serviceCentreResponse);
			model.addAttribute("datesMap", datesMap);
			model.addAttribute("results", results);
			
			org.json.simple.JSONArray datesArr = (JSONArray) serviceCentreObj.get("dates");
			org.json.simple.JSONObject dateObj = (JSONObject) datesArr.get(0);
			if(session.getAttribute("csCenter") == null || session.getAttribute("csCenter") == ""){
				session.setAttribute("csCenter", serviceCentreObj.get("serviceCentreCode"));
			}
			if(session.getAttribute("perferredDate") == null || session.getAttribute("perferredDate") == ""){
		        Date date= new Date(Long.parseLong(dateObj.get("date").toString()));  
		        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
				session.setAttribute("perferredDate", formatter.format(date));
			}
			logger.info(session.getAttribute("perferredDate").toString());
			
			String key = "savie.centre";
			String pageTitle = WebServiceUtils.getPageTitle("page." + key,
					UserRestURIConstants.getLanaguage(request));
			String pageMetaDataDescription = WebServiceUtils.getPageTitle(
					"meta." + key, UserRestURIConstants.getLanaguage(request));
			String ogTitle = WebServiceUtils.getPageTitle(key + ".og.title",
					UserRestURIConstants.getLanaguage(request));
			String ogType = WebServiceUtils.getPageTitle(key + ".og.type",
					UserRestURIConstants.getLanaguage(request));
			String ogUrl = WebServiceUtils.getPageTitle(key + ".og.url",
					UserRestURIConstants.getLanaguage(request));
			String ogImage = WebServiceUtils.getPageTitle(key + ".og.image",
					UserRestURIConstants.getLanaguage(request));
			String ogDescription = WebServiceUtils.getPageTitle(
					key + ".og.description",
					UserRestURIConstants.getLanaguage(request));
			if("RP".equals(session.getAttribute("savieType"))) {
				key = "rp";
			}else {
				key = "sp";
			}
			String twitterCard = WebServiceUtils.getPageTitle("twitter.savie." + key + ".card",
					UserRestURIConstants.getLanaguage(request));
			String twitterImage = WebServiceUtils.getPageTitle("twitter.savie." + key + ".image",
					UserRestURIConstants.getLanaguage(request));
			String twitterSite = WebServiceUtils.getPageTitle("twitter.savie." + key + ".site",
					UserRestURIConstants.getLanaguage(request));
			String twitterUrl = WebServiceUtils.getPageTitle("twitter.savie." + key + ".url",
					UserRestURIConstants.getLanaguage(request));
			String canonical = WebServiceUtils.getPageTitle("canonical.savie." + key + "",
					UserRestURIConstants.getLanaguage(request));

			model.addAttribute("pageTitle", pageTitle);
			model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
			model.addAttribute("ogTitle", ogTitle);
			model.addAttribute("ogType", ogType);
			model.addAttribute("ogUrl", ogUrl);
			model.addAttribute("ogImage", ogImage);
			model.addAttribute("ogDescription", ogDescription);
			model.addAttribute("twitterCard", twitterCard);
			model.addAttribute("twitterImage", twitterImage);
			model.addAttribute("twitterSite", twitterSite);
			model.addAttribute("twitterUrl", twitterUrl);
			model.addAttribute("canonical", canonical);
			
			return new ModelAndView("/merged/savie/customer-service-centre");
			//return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_CENTRE);
		} else {
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request)
					+ "/savings-insurance");
		}
	}
	
	
	@RequestMapping(value = {"/{lang}/savings-insurance/appointment-success"})
	public ModelAndView appointmentSuccess(Model model, HttpServletRequest request) {
		return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_SAVIE_APPOINTMENT_SUCCESS);
	}
	
	/**
	 * 预约成功跳转页面
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = {"/{lang}/savings-insurance/confirmation-sp"})
	public ModelAndView confirmationOffline(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		//savingAmount为空时返回首页
		if(org.apache.commons.lang.StringUtils.isNotBlank((String)session.getAttribute("savingAmount"))) {
			savieService.confirmationOffline(model, request);
			
			
			String key = "savie.confirmation";
			String pageTitle = WebServiceUtils.getPageTitle("page." + key,
					UserRestURIConstants.getLanaguage(request));
			String pageMetaDataDescription = WebServiceUtils.getPageTitle(
					"meta." + key, UserRestURIConstants.getLanaguage(request));
			String ogTitle = WebServiceUtils.getPageTitle(key + ".og.title",
					UserRestURIConstants.getLanaguage(request));
			String ogType = WebServiceUtils.getPageTitle(key + ".og.type",
					UserRestURIConstants.getLanaguage(request));
			String ogUrl = WebServiceUtils.getPageTitle(key + ".og.url",
					UserRestURIConstants.getLanaguage(request));
			String ogImage = WebServiceUtils.getPageTitle(key + ".og.image",
					UserRestURIConstants.getLanaguage(request));
			String ogDescription = WebServiceUtils.getPageTitle(
					key + ".og.description",
					UserRestURIConstants.getLanaguage(request));
			String twitterCard = WebServiceUtils.getPageTitle("twitter.savie.sp.card",
					UserRestURIConstants.getLanaguage(request));
			String twitterImage = WebServiceUtils.getPageTitle("twitter.savie.sp.image",
					UserRestURIConstants.getLanaguage(request));
			String twitterSite = WebServiceUtils.getPageTitle("twitter.savie.sp.site",
					UserRestURIConstants.getLanaguage(request));
			String twitterUrl = WebServiceUtils.getPageTitle("twitter.savie.sp.url",
					UserRestURIConstants.getLanaguage(request));
			String canonical = WebServiceUtils.getPageTitle("canonical.savie.sp",
					UserRestURIConstants.getLanaguage(request));

			model.addAttribute("pageTitle", pageTitle);
			model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
			model.addAttribute("ogTitle", ogTitle);
			model.addAttribute("ogType", ogType);
			model.addAttribute("ogUrl", ogUrl);
			model.addAttribute("ogImage", ogImage);
			model.addAttribute("ogDescription", ogDescription);
			model.addAttribute("twitterCard", twitterCard);
			model.addAttribute("twitterImage", twitterImage);
			model.addAttribute("twitterSite", twitterSite);
			model.addAttribute("twitterUrl", twitterUrl);
			model.addAttribute("canonical", canonical);
			return new ModelAndView("/merged/savie/confirmation-offline");
			//return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_CONFIRMATION);
			
		}else {
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request)
					+ "/savings-insurance");
		}
		
	}
	
	/**
	 * 预约成功跳转页面
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = {"/{lang}/savings-insurance/confirmation-rp"})
	public ModelAndView confirmationOfflinePp(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		//savingAmount为空时返回首页
		if(org.apache.commons.lang.StringUtils.isNotBlank((String)session.getAttribute("savingAmount"))) {
			savieService.confirmationOffline(model, request);
			String key = "savierp.confirmation.rp";
			String pageTitle = WebServiceUtils.getPageTitle("page." + key,
					UserRestURIConstants.getLanaguage(request));
			String pageMetaDataDescription = WebServiceUtils.getPageTitle(
					"meta." + key, UserRestURIConstants.getLanaguage(request));
			String ogTitle = WebServiceUtils.getPageTitle(key + ".og.title",
					UserRestURIConstants.getLanaguage(request));
			String ogType = WebServiceUtils.getPageTitle(key + ".og.type",
					UserRestURIConstants.getLanaguage(request));
			String ogUrl = WebServiceUtils.getPageTitle(key + ".og.url",
					UserRestURIConstants.getLanaguage(request));
			String ogImage = WebServiceUtils.getPageTitle(key + ".og.image",
					UserRestURIConstants.getLanaguage(request));
			String ogDescription = WebServiceUtils.getPageTitle(
					key + ".og.description",
					UserRestURIConstants.getLanaguage(request));
			String twitterCard = WebServiceUtils.getPageTitle("twitter.savie.rp.card",
					UserRestURIConstants.getLanaguage(request));
			String twitterImage = WebServiceUtils.getPageTitle("twitter.savie.rp.image",
					UserRestURIConstants.getLanaguage(request));
			String twitterSite = WebServiceUtils.getPageTitle("twitter.savie.rp.site",
					UserRestURIConstants.getLanaguage(request));
			String twitterUrl = WebServiceUtils.getPageTitle("twitter.savie.rp.url",
					UserRestURIConstants.getLanaguage(request));
			String canonical = WebServiceUtils.getPageTitle("canonical.savie.rp",
					UserRestURIConstants.getLanaguage(request));

			model.addAttribute("pageTitle", pageTitle);
			model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
			model.addAttribute("ogTitle", ogTitle);
			model.addAttribute("ogType", ogType);
			model.addAttribute("ogUrl", ogUrl);
			model.addAttribute("ogImage", ogImage);
			model.addAttribute("ogDescription", ogDescription);
			model.addAttribute("twitterCard", twitterCard);
			model.addAttribute("twitterImage", twitterImage);
			model.addAttribute("twitterSite", twitterSite);
			model.addAttribute("twitterUrl", twitterUrl);
			model.addAttribute("canonical", canonical);
			
			
			return new ModelAndView("/merged/savie/confirmation-rp");
			//return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_CONFIRMATION_RP);
		}else {
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request)
					+ "/savings-insurance");
		}
		
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance/single-premium"})
	public ModelAndView o2OLanding(Model model, HttpServletRequest request, HttpSession httpSession) {
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
		String key = "savie.landing";
		String pageTitle = WebServiceUtils.getPageTitle("page." + key,
				UserRestURIConstants.getLanaguage(request));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle(
				"meta." + key, UserRestURIConstants.getLanaguage(request));
		String ogTitle = WebServiceUtils.getPageTitle(key + ".og.title",
				UserRestURIConstants.getLanaguage(request));
		String ogType = WebServiceUtils.getPageTitle(key + ".og.type",
				UserRestURIConstants.getLanaguage(request));
		String ogUrl = WebServiceUtils.getPageTitle(key + ".og.url",
				UserRestURIConstants.getLanaguage(request));
		String ogImage = WebServiceUtils.getPageTitle(key + ".og.image",
				UserRestURIConstants.getLanaguage(request));
		String ogDescription = WebServiceUtils.getPageTitle(
				key + ".og.description",
				UserRestURIConstants.getLanaguage(request));
		String twitterCard = WebServiceUtils.getPageTitle("twitter.savie.sp.card",
				UserRestURIConstants.getLanaguage(request));
		String twitterImage = WebServiceUtils.getPageTitle("twitter.savie.sp.image",
				UserRestURIConstants.getLanaguage(request));
		String twitterSite = WebServiceUtils.getPageTitle("twitter.savie.sp.site",
				UserRestURIConstants.getLanaguage(request));
		String twitterUrl = WebServiceUtils.getPageTitle("twitter.savie.sp.url",
				UserRestURIConstants.getLanaguage(request));
		String canonical = WebServiceUtils.getPageTitle("canonical.savie.sp",
				UserRestURIConstants.getLanaguage(request));

		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
		model.addAttribute("ogTitle", ogTitle);
		model.addAttribute("ogType", ogType);
		model.addAttribute("ogUrl", ogUrl);
		model.addAttribute("ogImage", ogImage);
		model.addAttribute("ogDescription", ogDescription);
		model.addAttribute("twitterCard", twitterCard);
		model.addAttribute("twitterImage", twitterImage);
		model.addAttribute("twitterSite", twitterSite);
		model.addAttribute("twitterUrl", twitterUrl);
		model.addAttribute("canonical", canonical);
		
		return new ModelAndView("/merged/savie/savings-insurance-sp");

		
		//return SaviePageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_SAVIE_LANDING);
	}
	
	@RequestMapping(value = {"/{lang}/savings-insurance" ,"/{lang}/savings-insurance/regular-premium"})
	public ModelAndView getLanding(Model model, HttpServletRequest request, HttpSession httpSession) {
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
		String key = "savierp.landing.rp";
		String pageTitle = WebServiceUtils.getPageTitle("page." + key,
				UserRestURIConstants.getLanaguage(request));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta."
				+ key, UserRestURIConstants.getLanaguage(request));
		String ogTitle = WebServiceUtils.getPageTitle(key + ".og.title",
				UserRestURIConstants.getLanaguage(request));
		String ogType = WebServiceUtils.getPageTitle(key + ".og.type",
				UserRestURIConstants.getLanaguage(request));
		String ogUrl = WebServiceUtils.getPageTitle(key + ".og.url",
				UserRestURIConstants.getLanaguage(request));
		String ogImage = WebServiceUtils.getPageTitle(key + ".og.image",
				UserRestURIConstants.getLanaguage(request));
		String ogDescription = WebServiceUtils
				.getPageTitle(key + ".og.description",
						UserRestURIConstants.getLanaguage(request));
		String twitterCard = WebServiceUtils.getPageTitle("twitter.savie.rp.card",
				UserRestURIConstants.getLanaguage(request));
		String twitterImage = WebServiceUtils.getPageTitle("twitter.savie.rp.image",
				UserRestURIConstants.getLanaguage(request));
		String twitterSite = WebServiceUtils.getPageTitle("twitter.savie.rp.site",
				UserRestURIConstants.getLanaguage(request));
		String twitterUrl = WebServiceUtils.getPageTitle("twitter.savie.rp.url",
				UserRestURIConstants.getLanaguage(request));
		String canonical = WebServiceUtils.getPageTitle("canonical.savie.rp",
				UserRestURIConstants.getLanaguage(request));

		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
		model.addAttribute("ogTitle", ogTitle);
		model.addAttribute("ogType", ogType);
		model.addAttribute("ogUrl", ogUrl);
		model.addAttribute("ogImage", ogImage);
		model.addAttribute("ogDescription", ogDescription);
		model.addAttribute("twitterCard", twitterCard);
		model.addAttribute("twitterImage", twitterImage);
		model.addAttribute("twitterSite", twitterSite);
		model.addAttribute("twitterUrl", twitterUrl);
		model.addAttribute("canonical", canonical);
		
		return new ModelAndView("/merged/savie/savings-insurance-rp");
	}
}
