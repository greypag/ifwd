package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.exception.ValidateExceptions;
import com.ifwd.fwdhk.model.easyhealth.EasyHealthPlanDetailBean;
import com.ifwd.fwdhk.services.EasyHealthService;
import com.ifwd.fwdhk.services.HomeService;
import com.ifwd.fwdhk.services.LocaleMessagePropertiesServiceImpl;
import com.ifwd.fwdhk.services.OverseaService;
import com.ifwd.fwdhk.services.impl.LifeServiceImpl;
import com.ifwd.fwdhk.util.Methods;
import com.ifwd.fwdhk.util.StringHelper;
import com.ifwd.fwdhk.util.WebServiceUtils;
import com.ifwd.fwdhk.utils.services.SendEmailDao;

@Controller
public class ECommController extends BaseController {
	
	private final static Logger logger = LoggerFactory.getLogger(ECommController.class);
	
	@Autowired
	private SendEmailDao sendEmail;
	@Autowired
	private RestServiceDao restService;
	@Autowired
	LocaleMessagePropertiesServiceImpl localeMessagePropertiesService;
	@Autowired
	private HomeService homeService;
	@Autowired
	private WorkingHolidayController workingHolidayController;
	@Autowired
	private EasyHealthService easyHealthService;
	@Autowired
	private OverseaService overseaService;

	@RequestMapping(value = {"/page"}, method = RequestMethod.GET)
	public RedirectView getExternalLanding(Model model, HttpServletRequest request) 
	{
		RedirectView rv = null;
		String product = request.getParameter("product");
		String language = request.getParameter("lang");
		if (language == null || (!language.equals("en") && !language.equals("tc"))) {
			language = "en";
		}
		try {
			switch (product) {
				case "easyHomeCare":
					if (!Boolean.parseBoolean(request.getParameter("age")) 
							|| !Boolean.parseBoolean(request.getParameter("storeye"))
							|| !Boolean.parseBoolean(request.getParameter("areas")))
					{
						throw new Exception("Invalid input paramter for Easy Home Care");
					}
					homeService.getHomeCareQuote(UserRestURIConstants.URL_EASY_HOME_LANDING, request, request.getParameter("promoCode"), "N", "N");
					rv = new RedirectView(language+"/household-insurance/easy-home-care/quote");
					break;
				case "homeLiability":
					if (!Boolean.parseBoolean(request.getParameter("age")) 
							|| !Boolean.parseBoolean(request.getParameter("storeye"))
							|| !Boolean.parseBoolean(request.getParameter("areas")))
					{
						throw new Exception("Invalid input paramter for Home Liability");
					}
					homeService.getHomeCareQuote(UserRestURIConstants.URL_HOME_LIABILITY_LANDING, request, request.getParameter("promoCode"), "N", "N");
					rv = new RedirectView(language+"/household-insurance/home-liability/quote");
					break;
				case "overseasStudyCare":
					if (request.getParameter("region") != null && (!request.getParameter("region").equals("Worldwide") && !request.getParameter("region").equals("Asia")))
					{
						throw new Exception("Invalid input paramter for Overseas Study Care"); 
					}					
					overseaService.applyPromotionCode(request, null, request.getSession());
					rv = new RedirectView(language+"/overseas-study-insurance/plan-options?region="+request.getParameter("region"));
					break;
				case "workingHoliday":
					if (request.getParameter("plan") != null && (!request.getParameter("plan").equals("A") && !request.getParameter("plan").equals("B")))
					{
						throw new Exception("Invalid input paramter for Working Holiday"); 
					}
					HttpSession session = request.getSession();
					session.setAttribute("referralCode", request.getParameter("promoCode"));
					workingHolidayController.prepareWorkingHolidayPlan(request);
					rv = new RedirectView(language+"/working-holiday-insurance/quote?plan="+request.getParameter("plan"));
					break;
				case "easyHealth":
					EasyHealthPlanDetailBean planDetail = new EasyHealthPlanDetailBean();
					try {
						planDetail.setDobdmy(request.getParameter("dob"));
						planDetail.setGender("M".equals(request.getParameter("gender"))?"0":"1");
						planDetail.setSmoker(Boolean.parseBoolean(request.getParameter("smoker"))?"1":"0");
					} catch (Exception ex) {
						throw new Exception("Invalid input paramter for Easy Health"); 
					}

					try {
						easyHealthService.getPremium(planDetail, request);
					} catch (ECOMMAPIException e) {
						logger.info(e.getMessage());
						e.printStackTrace();
					}		
					rv = new RedirectView(language+"/medical-insurance/plan-option");
					break;
				default:
					rv = new RedirectView(language);
					break;
			}		
		} catch (Exception ex) {
			rv = new RedirectView(language);
		}
		rv.setStatusCode(HttpStatus.MOVED_TEMPORARILY);
		return rv;
	}
	
	@RequestMapping(value = {"/{lang}/home-insurance"}, method = RequestMethod.GET)
	public RedirectView getSavieShortcut(Model model, HttpServletRequest request)
	{
		RedirectView rv = new RedirectView("household-insurance/easy-home-care");
		rv.setStatusCode(HttpStatus.MOVED_PERMANENTLY);
		return rv;
	}
	
	@RequestMapping(value = "/changeLang")
	public ModelAndView changeLang(HttpServletRequest request,
			@RequestParam String selectLang, @RequestParam String action, HttpServletResponse response) throws IOException {
		
		if (action.contains("utm_source") && action.contains("utm_medium") && action.contains("utm_campaign")){
			action=action.substring(0,action.indexOf("?"));
		}
		if (!action.toLowerCase().contains("/tc/") && !action.toLowerCase().contains("/en/") && !action.contains("joinus") && !action.contains("/error/")) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);			
			return null;
		} 
		else if (action.contains(".") && !action.contains("/error/")) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);			
			return null;
		} 
		else {
			HttpSession session = request.getSession();
			String viewName = "";
			
			selectLang = selectLang.toLowerCase();
			session.setAttribute("language", selectLang);

			if (selectLang.equals("cn")) 
			{
				session.setAttribute("uiLocale", UserRestURIConstants.UILOCALE_TC);
			}
			else if (selectLang.equals("tc")) 
			{
				session.setAttribute("uiLocale", UserRestURIConstants.UILOCALE_TC);
			} 
			else if (selectLang.compareToIgnoreCase("en") == 0) 
			{
				session.setAttribute("uiLocale", UserRestURIConstants.UILOCALE_EN);
			} 
			else 
			{
				session.setAttribute("uiLocale", UserRestURIConstants.UILOCALE_TC);
			}
			
			if(action.contains(".") && action.contains("/error/")){
				response.sendError(Integer.parseInt(Pattern.compile("[^0-9]").matcher(action).replaceAll("")));
				return null;
			}
			else
			{
				viewName = action;
				
				if (viewName.indexOf("/en/") >= 0)
					viewName = viewName.replace("/en/", "/tc/");
				else
					viewName = viewName.replace("/tc/", "/en/");
				return new ModelAndView("redirect:" + viewName);
				
			}

			
			
		} 
	}
	
	@RequestMapping(value = "/redirect")
	public ModelAndView redirect(HttpServletRequest request,
			@RequestParam String action, @RequestParam String errMsgs) {
		
		String viewName = action.replace("/", "");
		if (StringHelper.isStringNullOrEmpty(errMsgs))
			return new ModelAndView("redirect:" + viewName + "?errMsgs="
					+ errMsgs);
		else
			return new ModelAndView("redirect:" + viewName);	
	}
	
	@RequestMapping(value = {"home", "/en/home", "/en/home/sharing/", "/tc/home", "tc/home", "tc/home/sharing/", "tc", "en", "tc/", "en/"}, method = RequestMethod.GET)
	public String homePage(@RequestParam(required = false) final String promo, HttpServletRequest req, Model model, HttpServletResponse response,
			@RequestParam(required = false) final String utm_source,
			@RequestParam(required = false) final String utm_medium,
			@RequestParam(required = false) final String utm_campaign,
			@RequestParam(required = false) final String utm_content) {
		
//		if (!lang.equals("tc") && !lang.equals("en")) {
//			
//			response.setStatus( HttpServletResponse.SC_BAD_REQUEST  );
//			
//			return null;
//	
//		} else {

			model.addAttribute("utm_source", utm_source);
			model.addAttribute("utm_medium", utm_medium);
			model.addAttribute("utm_campaign", utm_campaign);
			model.addAttribute("utm_content", utm_content);
			
			UserRestURIConstants urc = new UserRestURIConstants();
			urc.updateLanguage(req);
			HttpSession session = req.getSession(true);
			session.setAttribute("referralCode", StringHelper.emptyIfNull(promo));
			String pageTitle = WebServiceUtils.getPageTitle("page.index", UserRestURIConstants.getLanaguage(req));
			String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.index", UserRestURIConstants.getLanaguage(req));
			
			String ogTitle = "";
			String ogType = "";
			String ogUrl = "";
			String ogImage = "";
			String ogDescription = "";
			if (req.getRequestURI().toString().equals(req.getContextPath() + "/tc/home/sharing/") || req.getRequestURI().toString().equals(req.getContextPath() + "/en/home/sharing/")) {
				ogTitle = WebServiceUtils.getPageTitle("index.sharing.og.title", UserRestURIConstants.getLanaguage(req));
				ogType = WebServiceUtils.getPageTitle("index.sharing.og.type", UserRestURIConstants.getLanaguage(req));
				ogUrl = WebServiceUtils.getPageTitle("index.sharing.og.url", UserRestURIConstants.getLanaguage(req));
				ogImage = WebServiceUtils.getPageTitle("index.sharing.og.image", UserRestURIConstants.getLanaguage(req));
				ogDescription = WebServiceUtils.getPageTitle("index.sharing.og.description", UserRestURIConstants.getLanaguage(req));
			} else {
				ogTitle = WebServiceUtils.getPageTitle("index.og.title", UserRestURIConstants.getLanaguage(req));
				ogType = WebServiceUtils.getPageTitle("index.og.type", UserRestURIConstants.getLanaguage(req));
				ogUrl = WebServiceUtils.getPageTitle("index.og.url", UserRestURIConstants.getLanaguage(req));
				ogImage = WebServiceUtils.getPageTitle("index.og.image", UserRestURIConstants.getLanaguage(req));
				ogDescription = WebServiceUtils.getPageTitle("index.og.description", UserRestURIConstants.getLanaguage(req));
			}
			
			model.addAttribute("pageTitle", pageTitle);
			model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
			
			model.addAttribute("ogTitle", ogTitle);
			model.addAttribute("ogType", ogType);
			model.addAttribute("ogUrl", ogUrl);
			model.addAttribute("ogImage", ogImage);
			model.addAttribute("ogDescription", ogDescription);
			model.addAttribute("canonical", WebServiceUtils.getPageTitle("canonical.main",
					UserRestURIConstants.getLanaguage(req)));

			// String lang = "CN";
	//		session.setAttribute("language", lang);
	//		// default locale
	//		session.setAttribute("uiLocale", "zh-HK");
	//		
	
			
			String dir = UserRestURIConstants.getSitePath(req);
			
	//		session.setAttribute("language", "EN");
			return "../jsp/" + dir + "/index";
//		}
		
	}
	
	
	@RequestMapping(value = {"/{lang}/maintenace", "/{lang}/maintenance"})
	public ModelAndView maintenace(HttpServletRequest request,HttpServletResponse response) {
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		return new ModelAndView(UserRestURIConstants.getSitePath(request) + "/maintenace");
	}

	@RequestMapping(value = {"/cx/{lang}", "/cx/{lang}/"})
	public ModelAndView getCxHomePage(HttpServletRequest request,HttpServletResponse response, Model model) {
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		model.addAttribute("pageClass", "en t1");
		return new ModelAndView(UserRestURIConstants.getSitePath(request) + "/cx/t1");
	}

	@RequestMapping(value = {"/cx/{lang}/step2"})
	public ModelAndView getCxStep2(HttpServletRequest request,HttpServletResponse response, Model model) {
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		model.addAttribute("pageClass", "en t2");
		return new ModelAndView(UserRestURIConstants.getSitePath(request) + "/cx/t2");
	}

	@RequestMapping(value = {"/cx/{lang}/step3"})
	public ModelAndView getCxStep3(HttpServletRequest request,HttpServletResponse response, Model model) {
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		model.addAttribute("pageClass", "en t3");
		return new ModelAndView(UserRestURIConstants.getSitePath(request) + "/cx/t3");
	}

	@RequestMapping(value = {"/cx/{lang}/step4"})
	public ModelAndView getCxStep4(HttpServletRequest request,HttpServletResponse response, Model model) {
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		model.addAttribute("pageClass", "en t4");		
		return new ModelAndView(UserRestURIConstants.getSitePath(request) + "/cx/t4");
	}

	@RequestMapping(value = {"/cx/{lang}/login"})
	public ModelAndView getCxLogin(HttpServletRequest request,HttpServletResponse response, Model model) {
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		model.addAttribute("pageClass", "en t8");		
		return new ModelAndView(UserRestURIConstants.getSitePath(request) + "/cx/t8");
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = {"/cx/action"})
	public void getCxAction(HttpServletRequest request,HttpServletResponse response) {
		JSONObject jsonObject = new JSONObject();
		if (request.getParameter("step").equals("get_flight")){
			if (!request.getParameter("flight_num").equals("CX337")){
				jsonObject.put("errorMsg", "fail");
			}
		} else {
			jsonObject.put("data", "pass");		
		}
		
		ajaxReturn(response, jsonObject);
	}
	
	@RequestMapping(value = "/en/fwdiscover")
	public RedirectView getFanFareEnglishHomePage(HttpServletRequest request, Model model)  {
		RedirectView rv = new RedirectView("https://i2.fwd.com.hk/en");
		rv.setStatusCode(HttpStatus.MOVED_PERMANENTLY);
		return rv;	
	}
	
	@RequestMapping(value = "/tc/fwdiscover")
	public RedirectView getFanFareChineseHomePage(HttpServletRequest request, Model model)  {
		RedirectView rv = new RedirectView("https://i2.fwd.com.hk/");
		rv.setStatusCode(HttpStatus.MOVED_PERMANENTLY);
		return rv;	
	}	
}



