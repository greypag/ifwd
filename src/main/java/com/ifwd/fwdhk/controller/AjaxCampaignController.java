package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ifwd.fwdhk.services.CampaignService;
import com.ifwd.fwdhk.util.Methods;
import com.ifwd.fwdhk.util.WebServiceUtils;
import com.ifwd.fwdhk.utils.services.SendEmailDao;

@Controller
public class AjaxCampaignController extends BaseController {
	
	private final static Logger logger = LoggerFactory.getLogger(AjaxCampaignController.class);

	@Autowired
	private CampaignService campaignService;
	@Autowired
	private SendEmailDao sendEmail;
	
	@RequestMapping(value = "/ajax/campaign/promoCodeCount")
	@ResponseBody
	public void getAvailablePromoCodeCountByCampaign(HttpServletRequest request, HttpServletResponse response) {
		try {
			if (Methods.isXssAjax(request)) {
				throw new Exception("invalid AJAX call");
			}

			int count = campaignService.getAvailablePromoCodeCountByCampaign(request);

			Map<String,String> map = new HashMap<String,String>();
			map.put("count", Integer.toString(count));
			
			ajaxReturn(response, map);
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/ajax/campaign/assignPromoCode")
	@ResponseBody
	public void assignCampaignPromoCode(HttpServletRequest request, HttpServletResponse response) {
		try {
			if (Methods.isXssAjax(request)) {
				throw new Exception("invalid AJAX call");
			}

			String result = campaignService.assignCampaignPromoCode(request);
			
			Map<String,String> map = new HashMap<String,String>();
			switch (result) {
				case "duplicated":
				case "failed":
				case "error":
					map.put("result", result);
					map.put("promoCode", "");
					break;
				default:
					HttpSession session = request.getSession();
					HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
					header.put("userName", session.getAttribute("username").toString());
					header.put("token", session.getAttribute("token").toString());
					header.put("language", WebServiceUtils
							.transformLanaguage(UserRestURIConstants
									.getLanaguage(request)));
					String email = session.getAttribute("emailAddress").toString();
					sendEmail.sendEmailByDiscover(email, result, header);
					map.put("result", "success");
					map.put("promoCode", result);
					break;
			}			
			ajaxReturn(response, map);
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}	
}