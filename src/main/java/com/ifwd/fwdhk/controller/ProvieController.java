package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;
import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

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

import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import springfox.documentation.annotations.ApiIgnore;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.common.document.PDFGeneration;
import com.ifwd.fwdhk.common.document.PdfAttribute;
import com.ifwd.fwdhk.connector.response.savie.ServiceCentreResponse;
import com.ifwd.fwdhk.connector.response.savie.ServiceCentreResult;
import com.ifwd.fwdhk.model.AppointmentBooking.AppointmentType;
import com.ifwd.fwdhk.controller.core.Responses;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.exception.ValidateExceptions;
import com.ifwd.fwdhk.model.OptionItemDesc;
import com.ifwd.fwdhk.model.ProviePlanDetails;
import com.ifwd.fwdhk.model.ProvieRiderEligibility;
import com.ifwd.fwdhk.model.provie.ProviePlanDetailsBean;
import com.ifwd.fwdhk.model.savie.SavieFormApplicationBean;
import com.ifwd.fwdhk.services.LifeService;
//import com.ifwd.fwdhk.services.SavieService;
import com.ifwd.fwdhk.util.CommonEnum.GenderEnum;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.HeaderUtil;
import com.ifwd.fwdhk.util.InitApplicationMessage;
import com.ifwd.fwdhk.util.Methods;
import com.ifwd.fwdhk.util.NumberFormatUtils;
import com.ifwd.fwdhk.util.ProviePageFlowControl;
import com.ifwd.fwdhk.util.SavieOnlinePageFlowControl;
import com.ifwd.fwdhk.util.WebServiceUtils;

@Controller
@Api(value = "/provie", description = "Operations about provie")
public class ProvieController extends BaseController{
	
	private final static Logger logger = LoggerFactory.getLogger(ProvieController.class);
	
	@Autowired
	private RestServiceDao restService;
	@Autowired
	private LifeService provieOnlineService;
	@Autowired
	private CommonUtils commonUtils;
	
	@ApiIgnore
	@RequestMapping(value = {"/{lang}/savings-insurance/provie"})
	public ModelAndView o2OLanding(Model model, HttpServletRequest request, HttpSession httpSession) {
		provieOnlineService.removeProvieOnlineSession(request);
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
		return ProviePageFlowControl.pageFlow("savings-insurance",model,request, UserRestURIConstants.PAGE_PROPERTIES_PROVIE_LANDING);
	}
		
	@ApiIgnore
	@RequestMapping(value = {"/{lang}/savings-insurance/provie-plan-details"})
	public ModelAndView getProviePlanDetails(Model model, HttpServletRequest request, HttpSession httpSession) {	
		HttpSession session = request.getSession();

		String accessCode = (String) httpSession.getAttribute("accessCode");
		logger.info(accessCode);
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
			model.addAttribute("sliderMin", "30000");
			model.addAttribute("sliderMax", "400000");
			model.addAttribute("sliderValue", "100000");
			//model.addAttribute("extraRiderDisabled", "ddd");
			return ProviePageFlowControl.pageFlow("", model,request, UserRestURIConstants.PAGE_PROPERTIES_PROVIE_PLANDETAILS);
		}else {
			/* Temporarily add the meta og keys*/
			String key = UserRestURIConstants.PAGE_PROPERTIES_PROVIE_PLANDETAILS;
			model.addAttribute("pageTitle", WebServiceUtils.getPageTitle("page."+key, UserRestURIConstants.getLanaguage(request)));
			model.addAttribute("pageMetaDataDescription", WebServiceUtils.getPageTitle("meta."+key, UserRestURIConstants.getLanaguage(request)));
			model.addAttribute("ogTitle", WebServiceUtils.getPageTitle(key + ".og.title", UserRestURIConstants.getLanaguage(request)));
			model.addAttribute("ogType", WebServiceUtils.getPageTitle(key + ".og.type", UserRestURIConstants.getLanaguage(request)));
			model.addAttribute("ogUrl", WebServiceUtils.getPageTitle(key + ".og.url", UserRestURIConstants.getLanaguage(request)));
			model.addAttribute("ogImage", WebServiceUtils.getPageTitle(key + ".og.imgage", UserRestURIConstants.getLanaguage(request)));
			model.addAttribute("ogDescription", WebServiceUtils.getPageTitle(key + ".og.description", UserRestURIConstants.getLanaguage(request)));
			model.addAttribute("scriptName", WebServiceUtils.getPageTitle(key + ".script.name", UserRestURIConstants.getLanaguage(request)));
			model.addAttribute("scriptDescription", WebServiceUtils.getPageTitle(key + ".script.description", UserRestURIConstants.getLanaguage(request)));
			model.addAttribute("scriptChildName", WebServiceUtils.getPageTitle(key + ".script.child.name", UserRestURIConstants.getLanaguage(request)));
			model.addAttribute("scriptImg", WebServiceUtils.getPageTitle(key + ".og.image", UserRestURIConstants.getLanaguage(request)));
			model.addAttribute("planIndex", ""); //Plan Name
			model.addAttribute("pageIndex", key); // Page Index

			return new ModelAndView(UserRestURIConstants.getSitePath(request)
					+ "provie/provie-plan-details");
		}
	}	

	@SuppressWarnings("unchecked")
	@RequestMapping(value = {"/ajax/savings-insurance/getProvieRiderEligibility"})
	public void getProvieRiderEligibility(HttpServletRequest request,HttpServletResponse response) {
		JSONObject jsonObject = new JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			jsonObject=provieOnlineService.getProvieRiderEligibility(request);
		}
		catch (ECOMMAPIException e) {
			jsonObject.put("errorMsg", "api error");
		}
		logger.info(jsonObject.toString());
		ajaxReturn(response, jsonObject);
	}
		
	
	@RequestMapping(value = {"/ajax/savings-insurance/getProvieRiderPlan"})
	public void getProvieRiderPlan(ProviePlanDetailsBean proviePlanDetails,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		String language = (String) session.getAttribute("language");
		net.sf.json.JSONObject jsonObject = new net.sf.json.JSONObject();
		if(Methods.isXssAjax(request)){
			return;
		}
		try {
			proviePlanDetails.validate(language);
			proviePlanDetails.setInsuredAmount1(NumberFormatUtils.formatNumber(proviePlanDetails.getInsuredAmount()));
			jsonObject = provieOnlineService.getProvieRiderPlan(proviePlanDetails, request, session);
			//String[] dob1 = (String) request.getAttribute("dob");
			String[] dob = proviePlanDetails.getDob().split("-");
			proviePlanDetails.setDob1(dob[2]+"路"+dob[1]+"路"+dob[0]);
			proviePlanDetails.setDob2(dob[0]+"-"+dob[1]+"-"+dob[2]);
			
			request.getSession().setAttribute("proviePlanDetails", proviePlanDetails);
		}
		catch (ValidateExceptions e) {
			jsonObject.put("errorMsg", e.getList().toString());
		}
		catch (ECOMMAPIException e) {
			jsonObject.put("errorMsg", e.getMessage());
		} 
		logger.info(jsonObject.toString());
		ajaxReturn(response, jsonObject);
	}
	
	
	
	@ApiIgnore
	@RequestMapping(value = {"/{lang}/savings-insurance/provie-customer-service-centre"})
	public ModelAndView getProvieAppointment(Model model, HttpServletRequest request) {
		String planCode= (String) request.getParameter("planCode");
		model.addAttribute("planCode", planCode);
		HttpSession session=request.getSession();
		session.setAttribute("planCode", planCode);
		return ProviePageFlowControl.pageFlow(planCode,model,request, UserRestURIConstants.PAGE_PROPERTIES_PROVIE_SERVICE_CENTER);
	}
	
	@ApiIgnore
	@RequestMapping(value = {"/{lang}/savings-insurance/provie-confirmation-appointment-sp"})
	public ModelAndView getProvieThankyouSp(Model model, HttpServletRequest request) {
		HttpSession session=request.getSession();
		String planCode = (String) session.getAttribute("planCode");
		return ProviePageFlowControl.pageFlow(planCode,model,request, UserRestURIConstants.PAGE_PROPERTIES_PROVIE_CONFIRMATION_APPOINTMENT_SP);
	}
	
	@ApiIgnore
	@RequestMapping(value = {"/{lang}/savings-insurance/provie-confirmation-appointment-rp"})
	public ModelAndView getProvieThankyouRp(Model model, HttpServletRequest request) {
		HttpSession session=request.getSession();
		String planCode = (String) session.getAttribute("planCode");
		return ProviePageFlowControl.pageFlow(planCode,model,request, UserRestURIConstants.PAGE_PROPERTIES_PROVIE_CONFIRMATION_APPOINTMENT_RP);
	}
	
	@RequestMapping(value = "/api/provie/planDetails", method = GET, produces = {APPLICATION_JSON_VALUE})
	@ApiOperation(
		value = "Get Provie plan details",
		response = ProviePlanDetails.class
		)
	@ApiResponses(value = {@ApiResponse(code = 400, message = "Invalid appointment type"),
			@ApiResponse(code = 500, message = "System error")})
	public ResponseEntity<ProviePlanDetails> getPlanDetails(
			@ApiParam(value = "Premium", required = true) @RequestParam("premium") Float premium
			, @ApiParam(value = "Plan Code (SP/RP)", allowableValues = "PROVIE-SP,PROVIE-RP", required = true) @RequestParam("planCode") String planCode
			, @ApiParam(value = "Currency", allowableValues = "USD,HKD",  required = true) @RequestParam("currency") String currency
			, @ApiParam(value = "DOB of applicant (in dd/MM/yyyy format)",  required = true) @RequestParam("dob") String dob
			, @ApiParam(value = "Additional rider", allowableValues = "ACCIDENTIAL_DEATH_BENEFIT,CANCER_BENEFIT,TERM_LIFE_BENEFIT",  required = true) @RequestParam("rider") String rider
			, @ApiParam(value = "Payment Term") @RequestParam("paymentTerm") String paymentTerm
			, HttpServletRequest request) {
		
		//super.IsAuthenticate(request);
		
		HttpSession session=request.getSession();
		

		
		ProviePlanDetailsBean planDetailsBean= new ProviePlanDetailsBean(String.valueOf(premium), planCode.toUpperCase(), dob.replace("/", "-"), "", currency, rider, paymentTerm);
		net.sf.json.JSONObject resultJsonObject = new net.sf.json.JSONObject();
		/*
		url : context + "/ajax/savings-insurance/getProvieRiderPlan",
		data: {
			insuredAmount : premium,
			paymentType : paymentMode,
			dob : $("#plan-dob-datepicker").val(),
			promoCode : $("#promoCode").val(),
			paymentYear:paymentYear,
			currency:currency,
			rider:rider
			},
		*/
		try {
			resultJsonObject = provieOnlineService.getProvieRiderPlan(planDetailsBean, request, session);
			ProviePlanDetails plans = new ProviePlanDetails();
			
			plans.setPlanCode(resultJsonObject.getString("planCode").toUpperCase());
			plans.setCurrency(resultJsonObject.getString("currency"));
			plans.setRider(rider);
			
			List<ProviePlanDetails.Plan> list = new ArrayList<ProviePlanDetails.Plan>();
			net.sf.json.JSONArray ja = resultJsonObject.getJSONArray("plans");
			for (int i = 0; i < ja.size(); i++) {
				 net.sf.json.JSONObject jo = (net.sf.json.JSONObject) ja.get(i);
		            ProviePlanDetails.Plan plan = plans.new Plan();
					plan.setPremiumYear(jo.getInt("premiumYear"));
					//logger.info(String.valueOf(jo.getInt("premiumYear")));
					plan.setRate(jo.getDouble("rate"));
					plan.setTotalPaid(jo.getInt("totalPaid"));
					plan.setAccountValue(Float.valueOf(jo.getInt("accountValue")));
					//logger.info(String.valueOf(jo.getInt("accountValue")));
					plan.setDeathBenefit(Float.valueOf(jo.getInt("deathBenefit")));
					plan.setRiderValue(Integer.valueOf(calculateRider(jo.getInt("accountValue"), plans.getRider())));
					//logger.info(String.valueOf(jo.getInt("riderValue")));
					list.add(plan);
			}
			plans.setPlans(list);
			
			List<ProviePlanDetails.CreditRates> listCrdt = new ArrayList<ProviePlanDetails.CreditRates>();
			net.sf.json.JSONArray crdtArr = resultJsonObject.getJSONArray("creditRates");
			for (int i = 0; i < crdtArr.size(); i++) {
				 net.sf.json.JSONObject jo = (net.sf.json.JSONObject) crdtArr.get(i);
				 ProviePlanDetails.CreditRates crdt = plans.new CreditRates();
				 crdt.setRate(jo.getDouble("rate"));
				 net.sf.json.JSONArray planArr = jo.getJSONArray("plans");
				 List<ProviePlanDetails.Plan> paList = new ArrayList<ProviePlanDetails.Plan>();
				 for (int j=0;j<planArr.size();j++) {
		            net.sf.json.JSONObject pa = (net.sf.json.JSONObject) planArr.get(j);
		            ProviePlanDetails.Plan plan = plans.new Plan();
					plan.setPremiumYear(pa.getInt("premiumYear"));
					plan.setRate(pa.getDouble("rate"));
					plan.setAccountValue(Float.valueOf(pa.getInt("accountValue")));
					plan.setDeathBenefit(Float.valueOf(pa.getInt("deathBenefit")));
					plan.setTotalPaid(Float.valueOf(pa.getInt("totalPaid")));
					
					plan.setRiderValue(calculateRider(pa.getInt("accountValue"), plans.getRider()));
					paList.add(plan);
				 }
				 crdt.setPlans(paList);
				 listCrdt.add(crdt);
			}
			plans.setPlans(list);
			plans.setCreditRates(listCrdt);
			return Responses.ok(plans);
			
		} catch (Exception e) {
			e.printStackTrace();
			return Responses.error(null);
		}
	}

	private int calculateRider(int accountValue, String rider) {
		if ("CANCER_BENEFIT".equals(rider)){
			return (int)(accountValue * 0.5);
		} else if("TERM_LIFE_BENEFIT".equals(rider)){
			return (int)(accountValue * 1);
		} else if("ACCIDENTIAL_DEATH_BENEFIT".equals(rider)){
			return (int)(accountValue * 5);
		} else {
			return (int)(accountValue * 1);
		}
	}

	@RequestMapping(value = "/api/provie/getProvieRiderEligibility", method = GET, produces = {APPLICATION_JSON_VALUE})
	@ApiOperation(
		value = "Get Rider Eligibility",
		response = ProvieRiderEligibility.class
		)
	@ApiResponses(value = {@ApiResponse(code = 400, message = "Invalid appointment type"),
			@ApiResponse(code = 500, message = "System error")})
	public  ResponseEntity<ProvieRiderEligibility> getRiderEligibility(
			HttpServletRequest request) {
			
		//HttpSession session=request.getSession();
		
		
		JSONObject resultJsonObject = new JSONObject();
		ProvieRiderEligibility riderEligibility = new ProvieRiderEligibility();
	    
    	try {
    		resultJsonObject = provieOnlineService.getProvieRiderEligibility(request);
    		boolean accdnt= (boolean) resultJsonObject.get("accidentalDeathBenefit");
    		riderEligibility.setAccidentalDeathBenefit(accdnt);
    		//riderEligibility.setAccidentalDeathBenefit(true);
    		riderEligibility.setCancerBenefit((boolean) resultJsonObject.get("cancerBenefit"));
    		riderEligibility.setTermLifeBenefit((boolean) resultJsonObject.get("termBenefitEligible"));
		
    		return Responses.ok(riderEligibility);
    	} catch (Exception e) {
    		e.printStackTrace();
    		return Responses.error(null);
    	}

	}
	
//end of class	
}
