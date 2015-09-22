package com.ifwd.fwdhk.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ifwd.fwdhk.util.MessagePageUtils;
@Controller
public class AjaxMessagePageController {

	public void getAllMessagePage(Model model, HttpServletRequest request) {
	//	String path = getClass().getResource("/").getFile().toString().replace("/classes" , "")+"jsp/merged";
	
	}
	
	@RequestMapping(value = "/ajax/getMessagePage", method = RequestMethod.POST)
	@ResponseBody
	public String getMessagePage(Model model, HttpServletRequest request) {
		String path = getClass().getResource("/").getFile().toString().replace("/classes" , "")+"jsp/merged";
		String messageKey = request.getParameter("messageKey");
		String page = MessagePageUtils.getMessagePage(messageKey, path);
		return page;
	}
	
}
