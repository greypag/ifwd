package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.io.IOException;
import java.util.HashMap;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.ifwd.fwdhk.services.LocaleMessagePropertiesServiceImpl;
import com.ifwd.fwdhk.util.StringHelper;
import com.ifwd.fwdhk.util.WebServiceUtils;
import com.ifwd.fwdhk.utils.services.SendEmailDao;

@Controller
public class ECommController {
	@Autowired
	private SendEmailDao sendEmail;
	@Autowired
	private RestServiceDao restService;
	@Autowired
	LocaleMessagePropertiesServiceImpl localeMessagePropertiesService;
	
	@RequestMapping(value = {"/AGODA", "/agoda", "/Agoda"}, method = RequestMethod.GET)
	public RedirectView getSavieShortcut(Model model, HttpServletRequest request)
	{
		RedirectView rv = new RedirectView("http://www.agoda.com/fwdtravel");
		rv.setStatusCode(HttpStatus.MOVED_PERMANENTLY);
		return rv;
	}
	
	@RequestMapping(value = "/changeLang")
	public ModelAndView changeLang(HttpServletRequest request,
			@RequestParam String selectLang, @RequestParam String action, HttpServletResponse response) throws IOException {
		if (!action.toLowerCase().contains("/tc/") && !action.toLowerCase().contains("/en/") && !action.contains("joinus") && !action.contains("/error/")) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);			
			return null;
		} else if (action.contains(".") && !action.contains("/error/")) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);			
			return null;
		} else {
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
		int[] indexs = {5, 6, 7, 8, 9};
		String Url;
		String code;
		JSONObject responseJsonObj;
		
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
				switch (Integer.parseInt(choose)) {
				case 5:
					discount="80%";
					date="31-03-2016";
					offername="Fanfare.offername0";
					break;
				case 6:
					discount="HK$ 218";
					date="31-03-2016";
					offername="Fanfare.offername1";
					break;
				case 7:
					discount="HK$ 135";
					date="31-03-2016";
					offername="Fanfare.offername2";
					break;
				case 8:
					discount="50%";
					date="31-03-2016";
					offername="Fanfare.offername3";
					break;
				case 9:
					discount="40%";
					date="31-03-2016";
					offername="Fanfare.offername4";
					break;
				default:
					break;
				}
				sendEmail.sendEmailByDiscover(offername, username, discount, "Fanfare.planname" + choose, code, date, email, header);
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
		for(int i = 0; i < indexs.length; i++) {
			Url = UserRestURIConstants.CAMPAIGN_PROMO_CODE_GET_COUNT + "?campaign_id=" + indexs[i];
			responseJsonObj = restService.consumeApi(HttpMethod.GET, Url, header, null);
			if (responseJsonObj.get("errMsgs") == null) {
				int availableCount = Integer.parseInt(responseJsonObj.get("availableCount").toString());
				model.addAttribute("count" + i, availableCount);
			} else {
				model.addAttribute("count" + i, 0);
			} 
		}
		session.removeAttribute("chooseCampaign");
		return new ModelAndView(UserRestURIConstants.getSitePath(request) + "campaign/fwdiscover");			
	}	
}



