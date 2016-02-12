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

			int campaignId = Integer.parseInt(request.getParameter("campaignId"));
			String result = campaignService.assignCampaignPromoCode(request);
			String discount="";
			String date="";
			String offername = "";
			String index = "";
			String tnc = "";
			switch (campaignId) {
			case 13:
				discount="Fanfare.discount5";
				date="31-05-2016";
				offername="Fanfare.offername5";
				index = "5";
				tnc="Fanfare.tnc5";
				break;
			case 5:
				discount="Fanfare.discount0";
				date="31-05-2016";
				offername="Fanfare.offername0";
				index = "0";
				tnc="Fanfare.tnc0";
				break;
			case 6:
				discount="Fanfare.discount1";
				date="31-05-2016";
				offername="Fanfare.offername1";
				index = "1";
				tnc="Fanfare.tnc1";
				break;
			case 7:
				discount="Fanfare.discount2";
				date="31-05-2016";
				offername="Fanfare.offername2";
				index = "2";
				tnc="Fanfare.tnc2";
				break;
			case 8:
				discount="Fanfare.discount3";
				date="31-05-2016";
				offername="Fanfare.offername3";
				index = "3";
				tnc="Fanfare.tnc3";
				break;
			case 9:
				discount="Fanfare.discount4";
				date="31-05-2016";
				offername="Fanfare.offername4";
				index = "4";
				tnc="Fanfare.tnc4";
				break;
			default:
				break;
			}
			
			Map<String,String> map = new HashMap<String,String>();
			switch (result) {
				case "duplicated":
				case "failed":
				case "error":
					map.put("result", result);
					map.put("promoCode", "");
					map.put("index", index);
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
					String username = session.getAttribute("username").toString();
					
					sendEmail.sendEmailByDiscover(offername, username, discount, "Fanfare.planname" + campaignId, result, date, email, header, request, tnc);
					map.put("result", "success");
					map.put("promoCode", result);
					map.put("index", index);
					break;
			}			
			ajaxReturn(response, map);
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/ajax/campaign/getAllPromoCodeCount")
	@ResponseBody
	public void getAllAvailablePromoCodeCountByCampaign(HttpServletRequest request, HttpServletResponse response) {
		try {
			if (Methods.isXssAjax(request)) {
				throw new Exception("invalid AJAX call");
			}
			Map<String, String> counts = campaignService.getAllAvailablePromoCodeCountByCampaign(request);
			ajaxReturn(response, counts);
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/ajax/campaign/setChooseCampaign")
	@ResponseBody
	public void setChooseCampaign(HttpServletRequest request, HttpServletResponse response) {
		try {
			if (Methods.isXssAjax(request)) {
				throw new Exception("invalid AJAX call");
			}
			String choose = request.getParameter("campaignId");
			HttpSession session = request.getSession();
			session.setAttribute("chooseCampaign", choose);
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
}





