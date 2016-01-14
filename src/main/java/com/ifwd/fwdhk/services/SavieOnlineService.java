package com.ifwd.fwdhk.services;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.exception.ValidationExceptions;

public interface SavieOnlineService {
	public void getSavieOnlinePlandetails(HttpServletRequest request) throws ECOMMAPIException;
	public void plandetailsValidateFormByAjax(HttpServletRequest request) throws ValidationExceptions;
	
}
