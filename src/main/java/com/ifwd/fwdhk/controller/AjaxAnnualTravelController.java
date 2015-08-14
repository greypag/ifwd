package com.ifwd.fwdhk.controller;

import java.io.IOException;
import java.text.ParseException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ifwd.fwdhk.model.TravelQuoteBean;
import com.ifwd.fwdhk.services.AnnualTravelService;

@Controller
public class AjaxAnnualTravelController {
	
	private final static Logger logger = LoggerFactory.getLogger(AjaxAnnualTravelController.class);

	@Autowired
	private AnnualTravelService annualTravelService;
	
	// BMG updateTravelQuote
	// return JSON
	@RequestMapping(value = "/ajax/annualTravel/updateTravelQuote/update", method = RequestMethod.POST)
	@ResponseBody
	public String updateTravelQuote(@ModelAttribute("travelQuote") TravelQuoteBean travelQuote,BindingResult result, Model model, HttpServletRequest request) {
		String str = null;
		try {
			str = annualTravelService.updateTravelQuote(travelQuote, result, model, request);
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		return str;
	}
	
	@RequestMapping(value = "/ajax/annualTravel/applyTravelPromoCode/apply", method = RequestMethod.POST)
	@ResponseBody
	public String applyPromotionCode(@ModelAttribute("travelQuote") TravelQuoteBean travelQuote,BindingResult result, Model model, HttpServletRequest request) throws ParseException {
		String str = null;
		try {
			str = annualTravelService.applyPromotionCode(travelQuote, result, model, request);
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		return str;
	}
	
	@RequestMapping(value = "/ajax/annualTravel/processTravePayment/post")
	@ResponseBody
	public String processPayment(HttpServletRequest request,HttpServletResponse response){
		String str = null;
		try {
			str = annualTravelService.processPayment(request, response);
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		return str;
	}
	
	@RequestMapping(value = "/ajax/annualTravel/getPromoCode/get")
	@ResponseBody
	public String getPromoCode(HttpServletRequest request,HttpServletResponse response) throws IOException {
		String str = null;
		try {
			str = annualTravelService.getPromoCode(request, response);
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		return str;
	}
	
	@RequestMapping(value = "/ajax/annualTravel/sendEmail/send")
	@ResponseBody
	public String sendEmail(HttpServletRequest request) {
		String str = null;
		try {
			str = annualTravelService.sendEmail(request);
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		return str;
	}
}