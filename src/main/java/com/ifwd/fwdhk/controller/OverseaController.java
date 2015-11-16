package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.model.DistrictBean;
import com.ifwd.fwdhk.model.OverseaDetailsForm;
import com.ifwd.fwdhk.model.QuoteDetails;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.services.HomeCareService;
import com.ifwd.fwdhk.services.HomeCareServiceImpl;
import com.ifwd.fwdhk.services.SavieService;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.DateApi;
import com.ifwd.fwdhk.util.JsonUtils;
import com.ifwd.fwdhk.util.Methods;
import com.ifwd.fwdhk.util.OverseaPageFlowControl;
import com.ifwd.fwdhk.util.StringHelper;
import com.ifwd.fwdhk.util.WebServiceUtils;

@Controller
public class OverseaController extends BaseController{
	
	private final static Logger logger = LoggerFactory.getLogger(OverseaController.class);
	
	@Autowired
	private RestServiceDao restService;
	@Autowired
	private SavieService savieService;
	@Autowired
	private CommonUtils commonUtils;

	@RequestMapping(value = {"/{lang}/oversea-insurance"})
	public ModelAndView getOverseaLanding(Model model, HttpServletRequest request) {
		UserRestURIConstants.setController("Oversea");
		request.setAttribute("controller", UserRestURIConstants.getController());
		
		return OverseaPageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_OVERSEA_LANDING);
	}
	@RequestMapping(value = {"/{lang}/oversea-insurance/quote"})
	public ModelAndView getOverseaQuote(Model model, HttpServletRequest request) {
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		UserRestURIConstants.setController("Oversea");
		request.setAttribute("controller", UserRestURIConstants.getController());

		HttpSession session = request.getSession();
		session.removeAttribute("createPolicy");
		session.removeAttribute("policyNo");
		
		QuoteDetails quoteDetails = (QuoteDetails)session.getAttribute("quoteDetails");
		if (quoteDetails != null) {
			request.setAttribute("quoteDetails", quoteDetails);
			model.addAttribute("quoteDetails", quoteDetails);
		} else {
			model.addAttribute("errMsgs", session.getAttribute("errMsgs"));
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request)
					+ "/oversea-insurance");
		}

		return OverseaPageFlowControl.pageFlow(model, request, UserRestURIConstants.PAGE_PROPERTIES_OVERSEA_QUOTE);
	}
	@RequestMapping(value = {"/{lang}/oversea-insurance/details"})
	public ModelAndView getOverseaDetails(Model model, HttpServletRequest request) {
		UserRestURIConstants.setController("Oversea");
		HttpSession session = request.getSession();
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		if (session.getAttribute("token") == null) {
			model.addAttribute("errMsgs", "Session Expired");
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request)
					+ "/oversea-insurance");
		}
		String planName = WebServiceUtils.getParameterValue("planName", session, request);
		String planSummary = WebServiceUtils.getParameterValue("selectedAmountDue", session, request);
		String selectPlanPremium = WebServiceUtils.getParameterValue("selectPlanPremium", session, request);
		String selectPlanName = WebServiceUtils.getParameterValue("selectPlanName", session, request);
		
		model.addAttribute("planName", planName);
		model.addAttribute("selectPlanName", selectPlanName);
		QuoteDetails quoteDetails = (QuoteDetails)session.getAttribute("quoteDetails");
		if(quoteDetails == null) {
			model.addAttribute("errMsgs", session.getAttribute("errMsgs"));
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request)
					+ "/oversea-insurance");
		}
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		String token = session.getAttribute("token").toString();
		String userName = session.getAttribute("username").toString();
		HomeCareService homecareService = new HomeCareServiceImpl();
		List<DistrictBean> districtList = homecareService.getDistrict(userName, token, lang);
		request.setAttribute("districtList", districtList);
		model.addAttribute("districtList", districtList);
		
		return OverseaPageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_OVERSEA_DETAILS);
	}
	@RequestMapping(value = {"/{lang}/oversea-insurance/summary"})
	public ModelAndView getOverseaSummary(Model model, HttpServletRequest request,
			@ModelAttribute("frmYourDetails") OverseaDetailsForm planDetailsForm) {
		HttpSession session = request.getSession();
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		
		String planSelected = (String) session.getAttribute("planSelected");
		if(session.getAttribute("token") == null || planSelected == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request)
					+ "/oversea-insurance");	
		}
		UserRestURIConstants.setController("Oversea");
		request.setAttribute("controller", UserRestURIConstants.getController());
		 
		
		UserDetails userDetails = new UserDetails();
		String dueAmount = WebServiceUtils.getParameterValue("finalDueAmount",session, request);
		String originalAmount = WebServiceUtils.getParameterValue("finalOriginalAmount",session, request);
		session.setAttribute("dueAmount", dueAmount);
		session.setAttribute("originalAmount", originalAmount);
		
		String selectPlanName = planSelected;
		//String deaprtureDate = DateApi.pickDate1((String)session.getAttribute("departureDate"));
		//String returnDate = DateApi.pickDate1((String) session.getAttribute("returnDate"));
		String applicantFullName = planDetailsForm.getFullName();
		String applicantHKID = planDetailsForm.getHkid();
		String applicantMobNo = planDetailsForm.getMobileNo();
		String emailAddress = planDetailsForm.getEmailAddress();
		String dob = planDetailsForm.getApplicantDob();
		dob = DateApi.pickDate1(dob);
		
		planDetailsForm = (OverseaDetailsForm) session.getAttribute("overseaPlanDetailsFormBySummary");
		
		HomeCareService homecareService = new HomeCareServiceImpl();
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		List<DistrictBean> districts = homecareService.getDistrict(session.getAttribute("username").toString(), session.getAttribute("token").toString(), lang);
		Map<String, String> areas = homecareService.getArea(session.getAttribute("username").toString(), session.getAttribute("token").toString(), lang);
		//planDetailsForm.setApplicantAreaDesc(WebServiceUtils.getAreaDesc(areas, planDetailsForm.getc));
		planDetailsForm.setApplicantDistrictDesc(WebServiceUtils.getDistrictDesc(districts, planDetailsForm.getApplicantDistrict()));

		String langSelected = UserRestURIConstants.getLanaguage(request);
		String[] relationships;
		String[] beneRelationships;
		/*for (int inx = 0; inx < planDetailsForm.getTotalPersonalTraveller(); inx++) {
			relationships = planDetailsForm.getPersonalRelationDesc();
			if(relationships == null){
				relationships = new String[planDetailsForm.getTotalPersonalTraveller()];
			}
			beneRelationships = planDetailsForm.getPersonalBeneRelationDesc();
			if(beneRelationships == null){
				beneRelationships = new String[planDetailsForm.getTotalPersonalTraveller()];
			}
			planDetailsForm.setPersonalRelationDesc(WebServiceUtils.getInsuredRelationshipDesc(relationships, langSelected, planDetailsForm.getPersonalBeneficiary()[inx], inx));
			planDetailsForm.setPersonalBeneRelationDesc(WebServiceUtils.getBeneRelationshipDesc(beneRelationships, langSelected, planDetailsForm.getPersonalBeneficiary()[inx], inx));		
		}*/
		
		userDetails.setFullName(applicantFullName);
		userDetails.setHkid(applicantHKID);
		userDetails.setMobileNo(applicantMobNo);
		userDetails.setEmailAddress(emailAddress);
		userDetails.setDob(dob);
        final String BENE_RELATIONSHIP_SELF = "SE";

		//TravelQuoteBean travelBean = new TravelQuoteBean();
		//travelBean.setTrLeavingDate(deaprtureDate);
		//travelBean.setTrBackDate(returnDate);
		
		String path = request.getRequestURL().toString();
		model.addAttribute("selectPlanName", selectPlanName);
		model.addAttribute("dueAmount", dueAmount.replace(",", ""));
		model.addAttribute("originalAmount", originalAmount.replace(",", ""));
		model.addAttribute("userDetails", userDetails);
		//model.addAttribute("travelBean", travelBean);
		model.addAttribute("planDetailsForm", planDetailsForm);
		model.addAttribute("path", path.replace("summary", "confirmation?utm_nooverride=1"));
		model.addAttribute("failurePath", path + "?paymentGatewayFlag=true");
        String paymentGatewayFlag =request.getParameter("paymentGatewayFlag");
        String errorMsg =request.getParameter("errorMsg");
        if(paymentGatewayFlag != null && paymentGatewayFlag.compareToIgnoreCase("true") == 0 && errorMsg == null){            
            errorMsg = "Payment failure";     
        }        
        model.addAttribute("errormsg", errorMsg);        
        model.addAttribute("referralCode", session.getAttribute("referralCode"));
        model.addAttribute(session.getAttribute("createPolicy"));
        
        String pageTitle = WebServiceUtils.getPageTitle("page.travelPlanSummary", UserRestURIConstants.getLanaguage(request));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.travelPlanSummary", UserRestURIConstants.getLanaguage(request));
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
		
		return OverseaPageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_OVERSEA_SUMMARY);
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = {"/{lang}/oversea-insurance/confirmation"})
	public ModelAndView getOverseaConfirmation(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("token") == null) {
			model.addAttribute("errormsg", "Session Expired");
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request)
					+ "/oversea-insurance");
		}
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		UserRestURIConstants.setController("Oversea");
		request.setAttribute("controller", UserRestURIConstants.getController());
		

		JSONObject responsObject = new JSONObject();

		try {
			JSONObject parameters = new JSONObject();
			String requestNo = (String) session.getAttribute("transNo");
			String email = (String) session.getAttribute("emailAddress");
			parameters.put("referenceNo", session.getAttribute("finalizeReferenceNo"));
			parameters.put("transactionNumber", session.getAttribute("transNo"));
			parameters.put("transactionDate", session.getAttribute("transactionDate"));
			parameters.put("paymentFail", "0");
			
			String creditCardNo = (String)session.getAttribute("creditCardNo");
			
			if (creditCardNo !=null) { 
				parameters.put("creditCardNo", Methods.decryptStr((String)session.getAttribute("creditCardNo"))); 
			} else {
				model.addAttribute("policyNo", StringHelper.emptyIfNull((String)session.getAttribute("policyNo")));
				model.addAttribute("emailAddress", session.getAttribute("emailAddress"));
				model.addAttribute("dueAmount", session.getAttribute("dueAmount"));
				model.addAttribute("referralCode", session.getAttribute("referralCode"));
				String pageTitle = WebServiceUtils.getPageTitle("page.travelPlanConfirmation", UserRestURIConstants.getLanaguage(request));
				String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.travelPlanConfirmation", UserRestURIConstants.getLanaguage(request));
				model.addAttribute("pageTitle", pageTitle);
				model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
				return new ModelAndView(UserRestURIConstants.getSitePath(request)
						+ "/oversea/oversea-plan-confirmation");				
			}
				
			parameters.put("expiryDate", session.getAttribute("expiryDate"));

			if(JsonUtils.hasEmpty(parameters)) {
				return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request)
						+ "/oversea-insurance");
			}
			
			HashMap<String, String> header = new HashMap<String, String>(
					COMMON_HEADERS);
			header.put("userName", session.getAttribute("username").toString());
			header.put("token", session.getAttribute("token").toString());
			header.put("language", WebServiceUtils
					.transformLanaguage(UserRestURIConstants
							.getLanaguage(request)));
			logger.info("TRAVEL_FINALIZE_POLICY Request " + JsonUtils.jsonPrint(parameters));
			responsObject = restService.consumeApi(HttpMethod.POST,
					UserRestURIConstants.OVERSEA_FINALIZE_POLICY, header,
					parameters);
			logger.info("TRAVEL_FINALIZE_POLICY Response " + responsObject);
			
			if (responsObject.get("errMsgs") == null) {
				session.removeAttribute("creditCardNo");
				session.removeAttribute("expiryDate");
				session.removeAttribute("upgradeTotalTravallingDays");
				session.removeAttribute("upgradeTotalTravallingDays");
				session.removeAttribute("upgradeUserDetails");
				session.removeAttribute("upgradePlandetailsForm");
				session.removeAttribute("upgradeCreateFlightPolicy");
				session.removeAttribute("upgradeSelectPlanName");
				session.removeAttribute("upgradeDueAmount");
				session.removeAttribute("annualTravelQuote");
				session.removeAttribute("travelCreatePolicy");
				session.removeAttribute("travel-temp-save");
				session.setAttribute("policyNo", responsObject.get("policyNo"));
				model.addAttribute("policyNo", responsObject.get("policyNo"));
				model.addAttribute("emailAddress",
						session.getAttribute("emailAddress"));
				model.addAttribute("referralCode",
						session.getAttribute("referralCode"));
				String pageTitle = WebServiceUtils.getPageTitle("page.travelPlanConfirmation", UserRestURIConstants.getLanaguage(request));
				String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.travelPlanConfirmation", UserRestURIConstants.getLanaguage(request));
				session.removeAttribute("referralCode");  // vincent - remove session attribute "referral code" if success
				model.addAttribute("utm_nooverride", 1);
				model.addAttribute("pageTitle", pageTitle);
				model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
				return OverseaPageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_OVERSEA_CONFIRMATION);
			} else {
				if (responsObject.get("errMsgs").toString().contains("invalid payment amount")) {
					model.addAttribute("errorHeader1", "Invalid Payment Amount");
					model.addAttribute("errorDescription1", "There is a mismatch of the payment amount with the policy");
					model.addAttribute("errorHeader2", "Please DO NOT retry the payment");
					model.addAttribute("errorDescription2", "Contact our CS at 3123 3123");
				} else {
					model.addAttribute("errorHeader1", UserRestURIConstants.ERROR_HEADER1_1 + email + UserRestURIConstants.ERROR_HEADER1_2);
					model.addAttribute("errorDescription1", UserRestURIConstants.ERROR_DESCRIPTION1 + " " + requestNo);
					model.addAttribute("errorHeader2", UserRestURIConstants.ERROR_HEADER2_1 + " " + email + UserRestURIConstants.ERROR_HEADER2_2);
					model.addAttribute("errorDescription2", UserRestURIConstants.ERROR_DESCRIPTION2 + " " + requestNo);
				}		
				return new ModelAndView(UserRestURIConstants.getSitePath(request)
						+ "error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			
			model.addAttribute("errMsgs", e.toString());
			return new ModelAndView(UserRestURIConstants.getSitePath(request)
					+ "oversea/oversea-plan-summary");
		}
	}
}
