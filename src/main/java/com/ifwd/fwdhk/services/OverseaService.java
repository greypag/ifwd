package com.ifwd.fwdhk.services;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.OverseaDetailsForm;

public interface OverseaService {

	public void prepareOverseaQuote(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception;

	public void prepareOverseaDetails(Model model, HttpServletRequest request, HttpServletResponse response,
			HttpSession httpSession) throws ECOMMAPIException;

	public String applyPromotionCode(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception ;

	public String processOverseaPayment(HttpServletRequest request, HttpServletResponse response);

	public String prepareOverseaSummary(OverseaDetailsForm planDetailsForm, BindingResult result, Model model,
			HttpServletRequest request) throws Exception;
}
