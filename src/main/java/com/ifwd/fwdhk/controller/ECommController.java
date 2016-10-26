package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.io.IOException;
import java.util.HashMap;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
import com.ifwd.fwdhk.services.HomeService;
import com.ifwd.fwdhk.services.LocaleMessagePropertiesServiceImpl;
import com.ifwd.fwdhk.util.Methods;
import com.ifwd.fwdhk.util.StringHelper;
import com.ifwd.fwdhk.util.WebServiceUtils;
import com.ifwd.fwdhk.utils.services.SendEmailDao;

@Controller
public class ECommController extends BaseController {
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

	@RequestMapping(value = {"/page"}, method = RequestMethod.GET)
	public RedirectView getExternalLanding(Model model, HttpServletRequest request) 
	{
		RedirectView rv = null;
		String product = request.getParameter("product");
		String language = request.getParameter("lang");
		if (language == null || (language != "en" && language != "tc")) {
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
						throw new Exception("Invalid input paramter for Easy Home Care");
					}
					homeService.getHomeCareQuote(UserRestURIConstants.URL_HOME_LIABILITY_LANDING, request, request.getParameter("promoCode"), "N", "N");
					rv = new RedirectView(language+"/household-insurance/home-liability/quote");
					break;
				case "overseasStudyCare":
					rv = new RedirectView(language+"/overseas-study-insurance/plan-options");
					break;
				case "workingHoliday":
					if (request.getParameter("plan") != null && (request.getParameter("plan").equals("A") || request.getParameter("plan").equals("B")))
					{
						throw new Exception("Invalid input paramter for Working Holiday"); 
					}
					HttpSession session = request.getSession();
					session.setAttribute("referralCode", request.getParameter("promoCode"));
					workingHolidayController.prepareWorkingHolidayPlan(request);
					rv = new RedirectView(language+"/working-holiday-insurance/quote?plan="+request.getParameter("plan"));
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
	
	@RequestMapping(value = "/{lang}/fwdiscover")
	public ModelAndView getFanFareHomePage(HttpServletRequest request, Model model)  {
		model.addAttribute("pageTitle", WebServiceUtils.getPageTitle("page.discover", UserRestURIConstants.getLanaguage(request)));
		model.addAttribute("pageMetaDataDescription", WebServiceUtils.getPageTitle("meta.discover", UserRestURIConstants.getLanaguage(request)));
		model.addAttribute("ogTitle", WebServiceUtils.getPageTitle("discover.og.title", UserRestURIConstants.getLanaguage(request)));
		model.addAttribute("ogType", WebServiceUtils.getPageTitle("discover.og.type", UserRestURIConstants.getLanaguage(request)));
		model.addAttribute("ogUrl", WebServiceUtils.getPageTitle("discover.og.url", UserRestURIConstants.getLanaguage(request)));
		model.addAttribute("ogImage", WebServiceUtils.getPageTitle("discover.og.image", UserRestURIConstants.getLanaguage(request)));
		model.addAttribute("ogDescription", WebServiceUtils.getPageTitle("discover.og.description", UserRestURIConstants.getLanaguage(request)));
		
		HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
		HttpSession session = request.getSession();
		String choose = (String)session.getAttribute("chooseCampaign");
		int[] indexs = {8, 9, 23, 5, 6, 7};
		
		String Url;
		String code;
		JSONObject responseJsonObj;
		
		// int hotelVoucherCampaignId = -1;
		/* hotel voucher start */
	    java.util.Calendar cal = java.util.Calendar.getInstance();
	    cal.setTime(java.util.Calendar.getInstance().getTime());

	    int month = cal.get(java.util.Calendar.MONTH);
	    int day = cal.get(java.util.Calendar.DAY_OF_MONTH);
	    int hour = cal.get(java.util.Calendar.HOUR_OF_DAY);

		/* savie voucher */
	    if (month == 4 && request.getParameter("regular")==null) {
	    	if ((day == 21 && hour >= 15) || (day >= 22 && day < 31) || (day == 31 && hour < 15)) {
				indexs = new int[]{13};
	    	}
	    }	    	   
	    int hotelVoucherCampaignId = -1;
/*
	    if (month == 3 && day <= 30) {
	        if (day == 20) {
	        	if (hour >= 15) {
		            hotelVoucherCampaignId = 14;
	        	} else {
		            hotelVoucherCampaignId = -1;
	        	}
	        } else if (day == 21) {
	        	if (hour >= 15) {
		            hotelVoucherCampaignId = 15;
	        	} else {
		            hotelVoucherCampaignId = 14;
	        	}
	        } else if (day == 22) {
	        	if (hour >= 15) {
		            hotelVoucherCampaignId = 16;
	        	} else {
		            hotelVoucherCampaignId = 15;
	        	}
	        } else if (day == 23) {
	        	if (hour >= 15) {
		            hotelVoucherCampaignId = 17;
	        	} else {
		            hotelVoucherCampaignId = 16;
	        	}
	        } else if (day == 24) {
	        	if (hour >= 15) {
		            hotelVoucherCampaignId = 18;
	        	} else {
		            hotelVoucherCampaignId = 17;
	        	}
	        } else if (day >= 25 && day < 30) {
	            hotelVoucherCampaignId = 18;
	        } else if (day == 30) {
	        	if (hour >= 15) {
		            hotelVoucherCampaignId = -1;
	        	} else {
		            hotelVoucherCampaignId = 18;
	        	}
	        }
	    }
	    if (request.getParameter("hid")!=null) {
	    	hotelVoucherCampaignId = Integer.parseInt(request.getParameter("hid").toString());
	    }	    
*/

	    if (hotelVoucherCampaignId != -1) {
		    switch(hotelVoucherCampaignId) {
			    case 14:
		            indexs = new int[]{14};
		            break;
			    case 15:
		            indexs = new int[]{15};
		            break;
			    case 16:
		            indexs = new int[]{16};
		            break;
			    case 17:
		            indexs = new int[]{17};
		            break;
			    case 18:
		            indexs = new int[]{18};
		            break;
			    case -1:
		            indexs = new int[]{-1};
		            break;
		    }
	    }
	    /* hotel voucher end */
	    session.setAttribute("hotelVoucherCampaignId", hotelVoucherCampaignId);
		
		if(!StringUtils.isEmpty(choose) &&
				(session.getAttribute("authenticate") !=null && session.getAttribute("authenticate").equals("true"))) {
			Url = UserRestURIConstants.CAMPAIGN_PROMO_CODE_ASSIGN 
					+ "?campaign_id="+choose;

			header.put("userName", request.getSession().getAttribute("username").toString());
			header.put("token", request.getSession().getAttribute("token").toString());
			responseJsonObj = restService.consumeApi(HttpMethod.GET, Url,
					header, null);

			if (responseJsonObj.get("result").equals("success")) {
				code = responseJsonObj.get("promoCode").toString();
				String email = session.getAttribute("emailAddress").toString();
				String username = session.getAttribute("username").toString();
				String discount="";
				String date="";
				String offername = "";
				String tnc = "";
				switch (Integer.parseInt(choose)) {
					case 13:
						discount="Fanfare.discount5";
						date="31-05-2016";
						offername="Fanfare.offername5";
						tnc="Fanfare.tnc5";
						break;
					case 5:
						discount="Fanfare.discount0";
						date="31-01-2017";
						offername="Fanfare.offername0";
						tnc="Fanfare.tnc0";
						break;
					case 6:
						discount="Fanfare.discount1";
						date="31-01-2017";
						offername="Fanfare.offername1";
						tnc="Fanfare.tnc1";
						break;
					case 7:
						discount="Fanfare.discount2";
						date="31-01-2017";
						offername="Fanfare.offername2";
						tnc="Fanfare.tnc2";
						break;
					case 8:
						discount="Fanfare.discount3";
						date="31-01-2017";
						offername="Fanfare.offername3";
						tnc="Fanfare.tnc3";
						break;
					case 9:
						discount="Fanfare.discount4";
						date="31-01-2017";
						offername="Fanfare.offername4";
						tnc="Fanfare.tnc4";
						break;
					case 14:
						discount="Fanfare.discount6";
						date="31-05-2016";
						offername="Fanfare.offername6";
						tnc="Fanfare.tnc6";
						break;
					case 15:
						discount="Fanfare.discount7";
						date="31-05-2016";
						offername="Fanfare.offername7";
						tnc="Fanfare.tnc7";
						break;
					case 16:
						discount="Fanfare.discount8";
						date="31-05-2016";
						offername="Fanfare.offername8";
						tnc="Fanfare.tnc8";
						break;
					case 17:
						discount="Fanfare.discount9";
						date="31-05-2016";
						offername="Fanfare.offername9";
						tnc="Fanfare.tnc9";
						break;
					case 18:
						discount="Fanfare.discount10";
						date="31-05-2016";
						offername="Fanfare.offername10";
						tnc="Fanfare.tnc10";
						break;
                    case 23:
                        discount="Fanfare.discount11";
                        date="31-01-2017";
                        offername="Fanfare.offername11";
                        tnc="Fanfare.tnc11";
                        break;
						
					default:
						break;
				}
				sendEmail.sendEmailByDiscover(offername, username, discount, "Fanfare.planname" + choose, code, date, email, header, request, tnc);
			} else {
				code = responseJsonObj.get("result").toString(); // failed or duplicated
			}
			for(int i = 0; i < indexs.length; i++){
				if(choose.equals(String.valueOf(indexs[i]))){
					request.setAttribute("chooseIndex", i);
					break;
				}
			}
			request.setAttribute("chooseCode", code);
			request.setAttribute("chooseId", choose);
		}
		
		
		
		Url = UserRestURIConstants.CAMPAIGN_PROMO_CODE_GET_COUNTS + "?";
		for(int i = 0; i < indexs.length; i++) {
			if (i > 0) {
				Url = Url + "&";
			}
			Url = Url + "campaign_id" + (i + 1) + "=" + indexs[i];
		}
		
		responseJsonObj = restService.consumeApi(HttpMethod.GET, Url, header, null);
		if (responseJsonObj.get("errMsgs") == null) {
			JSONArray promoCodeCounts = (JSONArray) responseJsonObj.get("promoCodeCounts");
			for (int i =0; i< promoCodeCounts.size(); i++) {
				JSONObject o = (JSONObject) promoCodeCounts.get(i);
				System.out.println("i " + i + " count " + o.get("count").toString());
				model.addAttribute("count" + i, o.get("count").toString());
				
			}
		}
//		
//		
//		
//		for(int i = 0; i < indexs.length; i++) {
//			Url = UserRestURIConstants.CAMPAIGN_PROMO_CODE_GET_COUNT + "?campaign_id=" + indexs[i];
//			responseJsonObj = restService.consumeApi(HttpMethod.GET, Url, header, null);
//			if (responseJsonObj.get("errMsgs") == null) {
//				int availableCount = Integer.parseInt(responseJsonObj.get("availableCount").toString());
//				model.addAttribute("count" + i, availableCount);
//			} else {
//				model.addAttribute("count" + i, 0);
//			} 
//		}
		session.removeAttribute("chooseCampaign");
		return new ModelAndView(UserRestURIConstants.getSitePath(request) + "campaign/fwdiscover");			
	}	
}



