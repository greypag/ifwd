package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;
import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
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
import org.springframework.web.bind.annotation.RequestBody;
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
import com.ifwd.fwdhk.model.passkit.TravelCarePass;
import com.ifwd.fwdhk.model.passkit.PassPolicyNoBean;
import com.ifwd.fwdhk.model.ProvieRiderEligibility;
import com.ifwd.fwdhk.model.motor.PolicyDriverDetails;
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
@Api(value = "/passkit", description = "Operations about passkit")
public class PasskitController extends BaseController{
	
	private final static Logger logger = LoggerFactory.getLogger(PasskitController.class);

	private static final RequestMethod[] POST = null;
	
	@Autowired
	private RestServiceDao restService;
	@Autowired
	private LifeService passkitOnlineService;
	@Autowired
	private CommonUtils commonUtils;
	
	/*
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
			// Temporarily add the meta og keys
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
*/	
	@RequestMapping(value = "/api/passkit/validatePolicyByPolicyNo", method = GET, produces = {APPLICATION_JSON_VALUE})
	@ApiOperation(
		value = "Check if policy is available"
		)
	@ApiResponses(value = {@ApiResponse(code = 400, message = "Invalid policy Number"),
						   @ApiResponse(code = 500, message = "System error")})
	public boolean validatePolicyByPolicyNo(
			@ApiParam(value = "PolicyNo", required = true) @RequestParam("policyNo") String policyNo
			, HttpServletRequest request) {
		
		//super.IsAuthenticate(request);
		
		//HttpSession session=request.getSession();
		JSONObject resultJsonObject = new JSONObject();
    	try {
    		resultJsonObject = passkitOnlineService.validatePolicyByPolicyNo(policyNo,request);
    		//String errMsgs= (String) resultJsonObject.get("errMsgs");
    		boolean valid = (boolean) resultJsonObject.get("valid");
    		return valid;
    	} catch (Exception e) {
    		e.printStackTrace();
    		return false;
    	}
	}

	@RequestMapping(value = "/api/passkit/validatePolicyHoldersByPolicyNo", method = GET, produces = {APPLICATION_JSON_VALUE})
	@ApiOperation(
		value = "Check if policy holders is available"
		)
	@ApiResponses(value = {@ApiResponse(code = 400, message = "Invalid policy holders"),
						   @ApiResponse(code = 500, message = "System error")})
	public boolean validatePolicyHoldersByPolicyNo(
			@ApiParam(value = "PolicyNo", required = true) @RequestParam("policyNo") String policyNo,
			@ApiParam(value = "HkId", required = true) @RequestParam("hkId") String hkId
			, HttpServletRequest request) {
		
		
		//HttpSession session=request.getSession();
		JSONObject resultJsonObject = new JSONObject();
    	try {
    		resultJsonObject = passkitOnlineService.validatePolicyHoldersByPolicyNo(policyNo,hkId,request);
    		//String errMsgs= (String) resultJsonObject.get("errMsgs");
    		boolean valid = (boolean) resultJsonObject.get("valid");
    		return valid;
    	} catch (Exception e) {
    		e.printStackTrace();
    		return false;
    	}
	}

	
	@ApiOperation(
			value = "Create travelCare pass ",
			response = TravelCarePass.class			
			)
	@ApiResponses(value = {			
			@ApiResponse(code = 400, message = "Invalid Policy Number"),
			@ApiResponse(code = 500, message = "System error")
			})
	@RequestMapping(value = {"/api/passkit/createTravelCarePassKit"}, method = RequestMethod.POST)
	public ResponseEntity<TravelCarePass> createTravelCarePassKit(
			@ApiParam(value = "Policy Number", required = true) @RequestBody PassPolicyNoBean passPolicy,
			HttpServletRequest request) {
		
		// super.IsAuthenticate(request);
		JSONObject resultJsonObject = new JSONObject();
		TravelCarePass travelCarePass = new TravelCarePass();
		try {
			resultJsonObject = passkitOnlineService.createTravelCarePassKit(passPolicy,request);
			String errMsgs= (String) resultJsonObject.get("errMsgs");
			travelCarePass.setErrMsgs(errMsgs);
			travelCarePass.setPassId((String) resultJsonObject.get("passId"));
			travelCarePass.setPassId((String) resultJsonObject.get("url"));
			return Responses.ok(travelCarePass);
		} catch (Exception e) {
			e.printStackTrace();
    		return Responses.error(null);
		}
	}
	
	
//end of class	
}
