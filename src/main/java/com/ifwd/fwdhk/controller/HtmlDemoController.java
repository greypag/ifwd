package com.ifwd.fwdhk.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HtmlDemoController extends BaseController {

	@RequestMapping(value = { "/{lang}/htmldemo/{page}" })
	public ModelAndView htmlPage(Model model, HttpServletRequest request,
			@PathVariable("page") String page) {
		
		return new ModelAndView(UserRestURIConstants.getSitePath(request)
				+ "htmldemo/" + page);
	}
}
