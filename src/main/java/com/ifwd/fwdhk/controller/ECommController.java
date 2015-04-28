package com.ifwd.fwdhk.controller;

import javax.servlet.http.HttpServletRequest;
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
@SuppressWarnings("unchecked")
public class ECommController {
	@Autowired
	LocaleMessagePropertiesServiceImpl localeMessagePropertiesService;
	@RequestMapping(value = "/changeLang")
	public ModelAndView changeLang(HttpServletRequest request,
			@RequestParam String selectLang, @RequestParam String action) {
		HttpSession session = request.getSession();
		String viewName = "";
		session.setAttribute("language", selectLang);

		if (selectLang.compareToIgnoreCase("CN") == 0) 
		{
			//viewName = new String().replace(selectLang, "en");
			session.setAttribute("uiLocale", UserRestURIConstants.UILOCALE_TC);
		}
		else if (selectLang.compareToIgnoreCase("TC") == 0) 
		{
			//viewName = new String().replace(selectLang, "en");
			session.setAttribute("uiLocale", UserRestURIConstants.UILOCALE_TC);
		} 
		else if (selectLang.compareToIgnoreCase("EN") == 0) 
		{
			//viewName = new String().replace(selectLang, "tc");
			session.setAttribute("uiLocale", UserRestURIConstants.UILOCALE_EN);
		} 
		else 
		{
			session.setAttribute("uiLocale", UserRestURIConstants.UILOCALE_TC);
		}

		// viewName = action.replace("/", "");
		
		viewName = action;
		
		if (viewName.indexOf("en") > 0)
			viewName = viewName.replace("en", "tc");
		else
			viewName = viewName.replace("tc", "en");
		return new ModelAndView("redirect:" + viewName);

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
	
	@RequestMapping(value = {"home", "/{lang}/home", "/{lang}/home/sharing/"}, method = RequestMethod.GET)
	public String homePage(@RequestParam(required = false) final String promo, HttpServletRequest req, Model model) {
		HttpSession session = req.getSession(true);
		
		session.setAttribute("referralCode", StringHelper.emptyIfNull(promo));
		String pageTitle = WebServiceUtils.getPageTitle("page.index", UserRestURIConstants.getLanaguage(req));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.index", UserRestURIConstants.getLanaguage(req));

		
		String ogTitle = "";
		String ogType = "";
		String ogUrl = "";
		String ogImage = "";
		String ogDescription = "";
		
		System.out.println("URI " + req.getRequestURI().toString());
		System.out.println("URL " + req.getRequestURL().toString());
		
		
		if (req.getRequestURI().toString().equals(req.getContextPath() + "/home/sharing/")) {
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
		String lang = "CN";
//		session.setAttribute("language", lang);
//		// default locale
//		session.setAttribute("uiLocale", "zh-HK");
//		

		
		String dir = UserRestURIConstants.getSitePath(req);
		
//		session.setAttribute("language", "EN");
		return "../jsp/" + dir + "/index";
	}

	
}
