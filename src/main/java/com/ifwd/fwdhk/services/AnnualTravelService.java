package com.ifwd.fwdhk.services;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.model.AnnualDetailsForm;
import com.ifwd.fwdhk.model.AnnualTravelQuoteBean;
import com.ifwd.fwdhk.model.TravelQuoteBean;

public interface AnnualTravelService {

	public String updateTravelQuote(@ModelAttribute("annualTravelQuote") TravelQuoteBean travelQuote,BindingResult result, Model model, HttpServletRequest request);
	public String applyPromotionCode(@ModelAttribute("annualTravelQuote") TravelQuoteBean travelQuote,BindingResult result, Model model, HttpServletRequest request) throws ParseException;
	public String processPayment(HttpServletRequest request,HttpServletResponse response);
	public String getPromoCode(HttpServletRequest request,HttpServletResponse response);
	public String sendEmail(HttpServletRequest request);
	public String getAnnualTravelPlan(AnnualTravelQuoteBean travelQuote, Model model, HttpServletRequest request) throws Exception;
	public String prepareTravelInsuranceUserDetails(TravelQuoteBean travelQuote,
			BindingResult result, Model model, HttpServletRequest request) throws Exception;
	public String prepareTravelInsuranceTravelSummary(AnnualDetailsForm planDetailsForm,
			BindingResult result, Model model, HttpServletRequest request) throws Exception;
}
