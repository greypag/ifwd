package com.ifwd.fwdhk.services;

import java.text.ParseException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;
import com.ifwd.fwdhk.model.PlanDetailsForm;
import com.ifwd.fwdhk.model.TravelQuoteBean;

public interface AnnualTravelService {

	public String updateTravelQuote(@ModelAttribute("travelQuote") TravelQuoteBean travelQuote,BindingResult result, Model model, HttpServletRequest request);
	public String applyPromotionCode(@ModelAttribute("travelQuote") TravelQuoteBean travelQuote,BindingResult result, Model model, HttpServletRequest request) throws ParseException;
	public String processPayment(HttpServletRequest request,HttpServletResponse response);
	public String getPromoCode(HttpServletRequest request,HttpServletResponse response);
	public String sendEmail(HttpServletRequest request);
	public ModelAndView getTravelPlan(TravelQuoteBean travelQuote, Model model, HttpServletRequest request) throws Exception;
	public ModelAndView getTravelHomePage(final String promo, HttpServletRequest request, Model model, 
			final String utm_source,
			final String utm_medium,
			final String utm_campaign,
			final String utm_content) throws Exception;
	public ModelAndView prepareTravelInsuranceUserDetails(TravelQuoteBean travelQuote,
			BindingResult result, Model model, HttpServletRequest request) throws Exception;
	public ModelAndView prepareTravelInsuranceTravelSummary(PlanDetailsForm planDetailsForm,
			BindingResult result, Model model, HttpServletRequest request) throws Exception;
}
