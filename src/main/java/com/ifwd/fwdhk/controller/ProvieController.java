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
import com.ifwd.fwdhk.controller.AppointmentController.AppointmentType;
import com.ifwd.fwdhk.controller.core.Responses;
import com.ifwd.fwdhk.model.OptionItemDesc;
import com.ifwd.fwdhk.model.ProviePlanDetails;
import com.ifwd.fwdhk.model.savie.SavieFormApplicationBean;
import com.ifwd.fwdhk.services.LifeService;
//import com.ifwd.fwdhk.services.SavieService;
import com.ifwd.fwdhk.util.CommonEnum.GenderEnum;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.HeaderUtil;
import com.ifwd.fwdhk.util.InitApplicationMessage;
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
	@RequestMapping(value = {"/{lang}/savings-insurance/provie/plan-details-sp","/{lang}/savings-insurance/plan-details-rp"})
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
			return ProviePageFlowControl.pageFlow("", model,request, UserRestURIConstants.PAGE_PROPERTIES_PROVIE_PLANDETAILS);
		}else {
			return new ModelAndView(UserRestURIConstants.getSitePath(request)
					+ "provie/plan-details-sp");
		}
	}	
	
	@ApiIgnore
	@RequestMapping(value = {"/{lang}/savings-insurance/provie/customer-service-centre"})
	public ModelAndView getProvieAppointment(Model model, HttpServletRequest request) {
		return ProviePageFlowControl.pageFlow("",model,request, UserRestURIConstants.PAGE_PROPERTIES_PROVIE_SERVICE_CENTER);
	}
	
	@ApiIgnore
	@RequestMapping(value = {"/{lang}/savings-insurance/provie/confirmation-appointment"})
	public ModelAndView getProvieThankyou(Model model, HttpServletRequest request) {
		return ProviePageFlowControl.pageFlow("",model,request, UserRestURIConstants.PAGE_PROPERTIES_PROVIE_CONFIRMATION_APPOINTMENT);
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
			, @ApiParam(value = "Plan Code (SP/RP)", allowableValues = "SP,RP", required = true) @RequestParam("planCode") String planCode
			, @ApiParam(value = "Currency", allowableValues = "USD,HKD",  required = true) @RequestParam("currency") String currency
			, @ApiParam(value = "DOB of applicant (in dd/MM/yyyy format)",  required = true) @RequestParam("dob") String dob
			, @ApiParam(value = "Additional rider",  required = true) @RequestParam("rider") String rider
			, HttpServletRequest request) {
		
		super.IsAuthenticate(request);
		
		try {
			ProviePlanDetails plans = new ProviePlanDetails();
			plans.setPlanCode("Provie-SP");
			plans.setCurrency("HKD");
			plans.setRider("PA");
			List<ProviePlanDetails.Plan> list = new ArrayList<ProviePlanDetails.Plan>();
			ProviePlanDetails.Plan plan = plans.new Plan();
			plan.setPremiumYear(1);
			plan.setRate(1);
			plan.setTotalPaid(10000);
			plan.setAccountValue(10001);
			plan.setDeathBenefit(10002);
			plan.setRiderValue(10003);
			list.add(plan);
			
			plan = plans.new Plan();
			plan.setPremiumYear(2);
			plan.setRate(1.1);
			plan.setTotalPaid(10000);
			plan.setAccountValue(10001);
			plan.setDeathBenefit(10002);
			plan.setRiderValue(10003);
			list.add(plan);

			plan = plans.new Plan();
			plan.setPremiumYear(3);
			plan.setRate(1.2);
			plan.setTotalPaid(10000);
			plan.setAccountValue(10001);
			plan.setDeathBenefit(10002);
			plan.setRiderValue(10003);
			list.add(plan);

			plan = plans.new Plan();
			plan.setPremiumYear(4);
			plan.setRate(1.3);
			plan.setTotalPaid(10000);
			plan.setAccountValue(10001);
			plan.setDeathBenefit(10002);
			plan.setRiderValue(10003);
			list.add(plan);

			plan = plans.new Plan();
			plan.setPremiumYear(5);
			plan.setRate(1.4);
			plan.setTotalPaid(10000);
			plan.setAccountValue(10001);
			plan.setDeathBenefit(10002);
			plan.setRiderValue(10003);
			list.add(plan);

			plans.setPlans(list);
			return Responses.ok(plans);
		} catch (Exception e) {
			return Responses.error(null);
		}
	}
}
