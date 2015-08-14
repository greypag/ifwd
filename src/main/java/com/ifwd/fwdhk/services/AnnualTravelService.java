package com.ifwd.fwdhk.services;

import java.text.ParseException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.multipart.MultipartFile;
import com.ifwd.fwdhk.model.DistrictBean;
import com.ifwd.fwdhk.model.TravelQuoteBean;

public interface AnnualTravelService {

	public String updateTravelQuote(@ModelAttribute("travelQuote") TravelQuoteBean travelQuote,BindingResult result, Model model, HttpServletRequest request);
	public String applyPromotionCode(@ModelAttribute("travelQuote") TravelQuoteBean travelQuote,BindingResult result, Model model, HttpServletRequest request) throws ParseException;
	public String processPayment(HttpServletRequest request,HttpServletResponse response);
	public String getPromoCode(HttpServletRequest request,HttpServletResponse response);
	public String sendEmail(HttpServletRequest request);
	
}
