package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.model.DistrictBean;
import com.ifwd.fwdhk.model.OverseaDetailsForm;
import com.ifwd.fwdhk.model.QuoteDetails;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.services.HomeCareService;
import com.ifwd.fwdhk.services.HomeCareServiceImpl;
import com.ifwd.fwdhk.services.OverseaService;
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
	private CommonUtils commonUtils;

	@Autowired
	private OverseaService overseaService;
	
	@RequestMapping(value = {"/{lang}/overseas-study-insurance"})
	public ModelAndView getOverseaLanding(@RequestParam(required = false) final String promo, Model model, HttpServletRequest request,HttpServletResponse response) {
		UserRestURIConstants.setController("Oversea");
		request.setAttribute("controller", UserRestURIConstants.getController());
		HttpSession session = request.getSession();
		session.removeAttribute("referralCode");
		if (promo != null) {
			if (!promo.equals("")) {
				session.setAttribute("referralCode", StringHelper.emptyIfNull(promo));
				
				
				
				//request.setAttribute("controller", UserRestURIConstants.getController());

				
				session.removeAttribute("createPolicy");
				session.removeAttribute("policyNo");
				try {
					overseaService.prepareOverseaQuote(request, response, session);
				} catch (Exception e) {
					logger.info(e.getMessage());
					e.printStackTrace();
				}
				QuoteDetails quoteDetails = (QuoteDetails)session.getAttribute("quoteDetails");
				if (quoteDetails != null) {
					request.setAttribute("quoteDetails", quoteDetails);
					model.addAttribute("quoteDetails", quoteDetails);
				} else {
					model.addAttribute("errMsgs", session.getAttribute("errMsgs"));
					
				}
				return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request)
						+ "/overseas-study-insurance/plan-options");
				
			}	
		}
		return OverseaPageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_OVERSEA_LANDING);
	}
	@RequestMapping(value = {"/{lang}/overseas-study-insurance/plan-options"})
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
			model.addAttribute("selectedRegion", request.getParameter("region")!=null&&request.getParameter("region").equals("Worldwide")?"0":"1");
		} else {
			model.addAttribute("errMsgs", session.getAttribute("errMsgs"));
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request)
					+ "/overseas-study-insurance");
		}
		return OverseaPageFlowControl.pageFlow(model, request, UserRestURIConstants.PAGE_PROPERTIES_OVERSEA_QUOTE);
	}
	@RequestMapping(value = {"/{lang}/overseas-study-insurance/application"})
	public ModelAndView getOverseaDetails(Model model, HttpServletRequest request) {
		UserRestURIConstants.setController("Oversea");
		HttpSession session = request.getSession();
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		if (session.getAttribute("token") == null) {
			model.addAttribute("errMsgs", "Session Expired");
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request)
					+ "/overseas-study-insurance");
		}
		String planName = WebServiceUtils.getParameterValue("planName", session, request);
		/*String planSummary = WebServiceUtils.getParameterValue("selectedAmountDue", session, request);
		String selectPlanPremium = WebServiceUtils.getParameterValue("selectPlanPremium", session, request);*/
		String selectPlanName = WebServiceUtils.getParameterValue("selectPlanName", session, request);
		
		model.addAttribute("planName", planName);
		model.addAttribute("selectPlanName", selectPlanName);
		
		String planIndex = WebServiceUtils.getParameterValue("planIndex", session, request);
		
		if(planName.equals("basicA")) {
			if("4".equals(planIndex) || "5".equals(planIndex)) {
				model.addAttribute("displayRegion", WebServiceUtils.getMessage("Overseas.PlanOptions.Region.WorldwideAsia", UserRestURIConstants.getLanaguage(request)));
				model.addAttribute("displayPlan", WebServiceUtils.getMessage("Overseas.Plan.Name.Short.Standard.PlanA", UserRestURIConstants.getLanaguage(request)));
			}else {
				model.addAttribute("displayRegion", WebServiceUtils.getMessage("Overseas.PlanOptions.Region.Worldwide", UserRestURIConstants.getLanaguage(request)));
				model.addAttribute("displayPlan", WebServiceUtils.getMessage("Overseas.Plan.Name.Short.Standard.PlanA", UserRestURIConstants.getLanaguage(request)));
			}
		}
		if(planName.equals("basicB")) {
			if("4".equals(planIndex) || "5".equals(planIndex)) {
				model.addAttribute("displayRegion", WebServiceUtils.getMessage("Overseas.PlanOptions.Region.WorldwideAsia", UserRestURIConstants.getLanaguage(request)));
				model.addAttribute("displayPlan", WebServiceUtils.getMessage("Overseas.Plan.Name.Short.Standard.PlanB", UserRestURIConstants.getLanaguage(request)));
			}else {
				model.addAttribute("displayRegion", WebServiceUtils.getMessage("Overseas.PlanOptions.Region.Worldwide", UserRestURIConstants.getLanaguage(request)));
				model.addAttribute("displayPlan", WebServiceUtils.getMessage("Overseas.Plan.Name.Short.Standard.PlanB", UserRestURIConstants.getLanaguage(request)));
			}
		}
		if(planName.equals("medicalWorldwideA")) {
			model.addAttribute("displayRegion", WebServiceUtils.getMessage("Overseas.PlanOptions.Region.Worldwide", UserRestURIConstants.getLanaguage(request)));
			model.addAttribute("displayPlan", WebServiceUtils.getMessage("Overseas.Plan.Name.Short.Comprehensive.PlanA", UserRestURIConstants.getLanaguage(request)));
		}
		if(planName.equals("medicalWorldwideB")) {
			model.addAttribute("displayRegion", WebServiceUtils.getMessage("Overseas.PlanOptions.Region.Worldwide", UserRestURIConstants.getLanaguage(request)));
			model.addAttribute("displayPlan", WebServiceUtils.getMessage("Overseas.Plan.Name.Short.Comprehensive.PlanB", UserRestURIConstants.getLanaguage(request)));
		}
		if(planName.equals("medicalAsiaA")) {
			model.addAttribute("displayRegion", WebServiceUtils.getMessage("Overseas.PlanOptions.Region.Asiaonly", UserRestURIConstants.getLanaguage(request)));
			model.addAttribute("displayPlan", WebServiceUtils.getMessage("Overseas.Plan.Name.Short.Comprehensive.PlanA", UserRestURIConstants.getLanaguage(request)));
		}
		if(planName.equals("medicalAsiaB")) {
			model.addAttribute("displayRegion", WebServiceUtils.getMessage("Overseas.PlanOptions.Region.Asiaonly", UserRestURIConstants.getLanaguage(request)));
			model.addAttribute("displayPlan", WebServiceUtils.getMessage("Overseas.Plan.Name.Short.Comprehensive.PlanB", UserRestURIConstants.getLanaguage(request)));
		}
		
		QuoteDetails quoteDetails = (QuoteDetails)session.getAttribute("quoteDetails");
		if(quoteDetails == null) {
			model.addAttribute("errMsgs", session.getAttribute("errMsgs"));
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request)
					+ "/overseas-study-insurance");
		}
		for(int i = 0; i < quoteDetails.getPlanName().length; i++) {
			if (quoteDetails.getPlanName()[i].equals(planName)) {
				session.setAttribute("planSelected", planName);
				model.addAttribute("planDiscount", quoteDetails.getDiscountAmount()[i]);
				NumberFormat formatter = new DecimalFormat("#0.00");  
				
				String splanSummary = quoteDetails.getToalDue()[i];
				float fplanSummary = Float.parseFloat(splanSummary);
				quoteDetails.getToalDue()[i] = formatter.format(fplanSummary);
				model.addAttribute("planSummary", quoteDetails.getToalDue()[i]);
				
				String sgrossPremium = quoteDetails.getGrossPremium()[i];
				float grossPremium = Float.parseFloat(sgrossPremium);
				quoteDetails.getGrossPremium()[i] = formatter.format(grossPremium);
				
				model.addAttribute("planPremium", quoteDetails.getGrossPremium()[i]);
				break;
			}
		}
		
		HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";

		header.put("language", WebServiceUtils.transformLanaguage(lang));

		if (request.getSession().getAttribute("username") != null) {
			header.put("userName", session.getAttribute("username").toString());
			header.put("token", session.getAttribute("token").toString());
		}
		String relationshipUrl = UserRestURIConstants.GET_BENE_RELATIONSHIP_CODE
				+ "?itemTable=BeneRelationshipCode";

		JSONObject relationShipJson = restService.consumeApi(
				HttpMethod.GET, relationshipUrl, header, null);

		if (relationShipJson.get("errMsgs") == null) {
			JSONArray relationshipJsonArray = (JSONArray) relationShipJson
					.get("optionItemDesc");
			logger.info("jsonRelationShipArray ====>>>>>>" + relationshipJsonArray);

			Map<String, String> mapRelationshipCode = new LinkedHashMap<String, String>();
			for (int i = 0; i < relationshipJsonArray.size(); i++) {
				JSONObject obj = (JSONObject) relationshipJsonArray
						.get(i);
				mapRelationshipCode.put(
						JsonUtils.checkJsonObjNull(obj, "itemCode"),
						JsonUtils.checkJsonObjNull(obj, "itemDesc"));
			}
			model.addAttribute("mapRelationshipCode",
					mapRelationshipCode);

		}
		
		String token = session.getAttribute("token").toString();
		String userName = session.getAttribute("username").toString();
		HomeCareService homecareService = new HomeCareServiceImpl();
		
		List<DistrictBean> districtList = homecareService.getDistrict(userName, token, lang);
		
		request.setAttribute("districtList", districtList);
		model.addAttribute("planIndex", planIndex);
		model.addAttribute("districtList", districtList);
		session.removeAttribute("overseaCreatePolicy");
		
		return OverseaPageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_OVERSEA_DETAILS);
	}
	@RequestMapping(value = {"/{lang}/overseas-study-insurance/payment"})
	public ModelAndView getOverseaSummary(Model model, HttpServletRequest request,
			@ModelAttribute("frmYourDetails") OverseaDetailsForm planDetailsForm) {
		HttpSession session = request.getSession();
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		
		String planSelected = (String) session.getAttribute("planSelected");
		if(session.getAttribute("token") == null || planSelected == null){
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request)
					+ "/overseas-study-insurance");	
		}
		UserRestURIConstants.setController("Oversea");
		request.setAttribute("controller", UserRestURIConstants.getController());
		 
		
		UserDetails userDetails = new UserDetails();
		String dueAmount = WebServiceUtils.getParameterValue("finalDueAmount",session, request);
		String originalAmount = WebServiceUtils.getParameterValue("finalOriginalAmount",session, request);
		session.setAttribute("dueAmount", dueAmount);
		session.setAttribute("originalAmount", originalAmount);
		
		String selectPlanName = planSelected;
		/*String applicantFullName = planDetailsForm.getFullName();
		String applicantHKID = planDetailsForm.getHkid();
		String applicantMobNo = planDetailsForm.getMobileNo();
		String emailAddress = planDetailsForm.getEmailAddress();
		String dob = planDetailsForm.getApplicantDob();*/
		String applicantFullName = WebServiceUtils.getParameterValue("fullName", session, request);
		String applicantHKID = WebServiceUtils.getParameterValue("hkid", session, request);
		String applicantMobNo = Methods.formatMobile(WebServiceUtils.getParameterValue("mobileNo", session, request));
		String emailAddress = WebServiceUtils.getParameterValue("emailAddress",	session, request);
		String dob = WebServiceUtils.getParameterValue("applicantDob",	session, request);
		dob = DateApi.pickDate1(dob);
		
		planDetailsForm = (OverseaDetailsForm) session.getAttribute("overseaPlanDetailsFormBySummary");
		
		HomeCareService homecareService = new HomeCareServiceImpl();
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc"))
			lang = "CN";
		List<DistrictBean> districts = homecareService.getDistrict(session.getAttribute("username").toString(), session.getAttribute("token").toString(), lang);
		Map<String, String> areas = homecareService.getArea(session.getAttribute("username").toString(), session.getAttribute("token").toString(), lang);
		planDetailsForm.setCorrespondenceAddressDistrictDesc(WebServiceUtils.getAreaDesc(areas, planDetailsForm.getCorrespondenceAddressDistrict()));
		planDetailsForm.setApplicantDistrictDesc(WebServiceUtils.getDistrictDesc(districts, planDetailsForm.getApplicantDistrict()));

		userDetails.setFullName(applicantFullName.toUpperCase());
		userDetails.setHkid(applicantHKID);
		userDetails.setMobileNo(applicantMobNo);
		userDetails.setEmailAddress(emailAddress);
		userDetails.setDob(dob);
		
		String path = request.getRequestURL().toString();
		String planIndex = WebServiceUtils.getParameterValue("planIndex", session, request);
		model.addAttribute("selectPlanName", selectPlanName);
		model.addAttribute("dueAmount", dueAmount.replace(",", ""));
		model.addAttribute("originalAmount", originalAmount.replace(",", ""));
		model.addAttribute("userDetails", userDetails);
		model.addAttribute("planIndex", planIndex);
		switch (planDetailsForm.getApplicantRelationship())
		{
			case "SE":
				model.addAttribute("applicantRelationshipDisplay", WebServiceUtils.getMessage("Overseas.userdetails.applicant.Relationship.Option1", UserRestURIConstants.getLanaguage(request)));
				break;
			case "CH":
				model.addAttribute("applicantRelationshipDisplay", WebServiceUtils.getMessage("Overseas.userdetails.applicant.Relationship.Option2", UserRestURIConstants.getLanaguage(request)));
				break;
			case "OT":
				model.addAttribute("applicantRelationshipDisplay", WebServiceUtils.getMessage("Overseas.userdetails.applicant.Relationship.Option3", UserRestURIConstants.getLanaguage(request)));
				break;			
		}
		model.addAttribute("planDetailsForm", planDetailsForm);
		StringBuffer sb = new StringBuffer();
		if(!StringUtils.isEmpty(planDetailsForm.getAddressofInstitutionLine1())) {
			sb.append(planDetailsForm.getAddressofInstitutionLine1());
		}
		if(sb.length() > 0) {
			if (!StringUtils.isEmpty(planDetailsForm.getAddressofInstitutionLine2())) {
				sb.append(", ").append(planDetailsForm.getAddressofInstitutionLine2());
			}
		}else {
			if (!StringUtils.isEmpty(planDetailsForm.getAddressofInstitutionLine2())) {
				sb.append(planDetailsForm.getAddressofInstitutionLine2());
			}
		}
		if(sb.length() > 0) {
			if (!StringUtils.isEmpty(planDetailsForm.getAddressofInstitutionLine3())) {
				sb.append(", ").append(planDetailsForm.getAddressofInstitutionLine3());
			}
		}else {
			if (!StringUtils.isEmpty(planDetailsForm.getAddressofInstitutionLine3())) {
				sb.append(planDetailsForm.getAddressofInstitutionLine3());
			}
		}
		model.addAttribute("AddressofInstitutionLine", sb.toString());
		model.addAttribute("overseaBeneficaryDesc", WebServiceUtils.getBeneRelationshipDesc(planDetailsForm.getPersonalBeneficiary(), WebServiceUtils.transformLanaguage(UserRestURIConstants.getLanaguage(request))));
		model.addAttribute("path", path.replace("payment", "confirmation?utm_nooverride=1"));
		model.addAttribute("failurePath", path + "?paymentGatewayFlag=true");
        String paymentGatewayFlag =request.getParameter("paymentGatewayFlag");
        String errorMsg =request.getParameter("errorMsg");
        if(paymentGatewayFlag != null && paymentGatewayFlag.compareToIgnoreCase("true") == 0 && errorMsg == null){            
            errorMsg = "Payment failure";     
        }        
        model.addAttribute("errormsg", errorMsg);        
        model.addAttribute("referralCode", session.getAttribute("referralCode"));
        model.addAttribute(session.getAttribute("createPolicy"));
        
		return OverseaPageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_OVERSEA_SUMMARY);
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = {"/{lang}/overseas-study-insurance/confirmation"})
	public ModelAndView getOverseaConfirmation(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("token") == null) {
			model.addAttribute("errormsg", "Session Expired");
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request)
					+ "/overseas-study-insurance");
		}
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		UserRestURIConstants.setController("Oversea");
		request.setAttribute("controller", UserRestURIConstants.getController());
		
		JSONObject parameters = new JSONObject();
		String referenceNo = (String)session.getAttribute("finalizeReferenceNo");
		model.addAttribute("referenceNo", referenceNo);
		parameters.put("referenceNo", referenceNo);
		parameters.put("transactionNumber", session.getAttribute("transNo"));
		parameters.put("transactionDate", session.getAttribute("transactionDate"));
		parameters.put("paymentFail", "0");
		
		String creditCardNo = (String)session.getAttribute("creditCardNo");
		
		if (creditCardNo !=null) { 
			try {
				parameters.put("creditCardNo", Methods.decryptStr((String)session.getAttribute("creditCardNo")));
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("errMsgs", e.toString());
				return new ModelAndView(UserRestURIConstants.getSitePath(request)
						+ "oversea/oversea-plan-summary");
			}
		} else {
			model.addAttribute("policyNo", StringHelper.emptyIfNull((String)session.getAttribute("policyNo")));
			model.addAttribute("emailAddress", session.getAttribute("emailAddress"));
			model.addAttribute("dueAmount", session.getAttribute("dueAmount"));
			model.addAttribute("referralCode", session.getAttribute("referralCode"));
			String pageTitle = WebServiceUtils.getPageTitle("page.oversea.confirmation", UserRestURIConstants.getLanaguage(request));
			String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.oversea.confirmation", UserRestURIConstants.getLanaguage(request));
			model.addAttribute("pageTitle", pageTitle);
			model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
			return new ModelAndView(UserRestURIConstants.getSitePath(request)
					+ "/oversea/oversea-plan-confirmation");				
		}
			
		parameters.put("expiryDate", session.getAttribute("expiryDate"));

		if(JsonUtils.hasEmpty(parameters)) {
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request)
					+ "/overseas-study-insurance");
		}
		
		HashMap<String, String> header = new HashMap<String, String>(
				COMMON_HEADERS);
		header.put("userName", session.getAttribute("username").toString());
		header.put("token", session.getAttribute("token").toString());
		header.put("language", WebServiceUtils
				.transformLanaguage(UserRestURIConstants
						.getLanaguage(request)));
		logger.info("OVERSEA_FINALIZE_POLICY Request " + JsonUtils.jsonPrint(parameters));
		new Thread(){
			public void run() {
				JSONObject responsObject = restService.consumeApi(HttpMethod.POST, UserRestURIConstants.OVERSEA_FINALIZE_POLICY, header, parameters);
				logger.info("OVERSEA_FINALIZE_POLICY Response " + responsObject);
			};
		}.start();
		
		session.removeAttribute("creditCardNo");
		session.removeAttribute("expiryDate");
		session.removeAttribute("upgradeTotalTravallingDays");
		session.removeAttribute("upgradeTotalTravallingDays");
		session.removeAttribute("upgradeUserDetails");
		session.removeAttribute("upgradePlandetailsForm");
		session.removeAttribute("upgradeCreateFlightPolicy");
		session.removeAttribute("upgradeSelectPlanName");
		session.removeAttribute("upgradeDueAmount");
		//session.removeAttribute("annualTravelQuote");
		session.removeAttribute("overseaCreatePolicy");
		session.removeAttribute("travel-temp-save");
		session.removeAttribute("overseaPlanDetailsFormBySummary");
		/*session.setAttribute("policyNo", responsObject.get("policyNo"));
		model.addAttribute("policyNo", responsObject.get("policyNo"));*/
		model.addAttribute("emailAddress", session.getAttribute("emailAddress"));
		model.addAttribute("referralCode", session.getAttribute("referralCode"));
		session.removeAttribute("referralCode");
		model.addAttribute("utm_nooverride", 1);
		return OverseaPageFlowControl.pageFlow(model,request, UserRestURIConstants.PAGE_PROPERTIES_OVERSEA_CONFIRMATION);
	}
}
