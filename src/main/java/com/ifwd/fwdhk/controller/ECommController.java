package com.ifwd.fwdhk.controller;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.services.LocaleMessagePropertiesServiceImpl;
import com.ifwd.fwdhk.util.StringHelper;
import com.ifwd.fwdhk.util.WebServiceUtils;

@Controller
public class ECommController {
	@Autowired
	LocaleMessagePropertiesServiceImpl localeMessagePropertiesService;
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
	
	
	@RequestMapping(value = "/{lang}/maintenace")
	public ModelAndView maintenace(HttpServletRequest request,HttpServletResponse response) {
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		return new ModelAndView(UserRestURIConstants.getSitePath(request) + "/maintenace");
	}
	
}
