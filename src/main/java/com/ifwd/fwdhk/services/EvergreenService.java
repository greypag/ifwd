package com.ifwd.fwdhk.services;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.ifwd.fwdhk.connector.response.BaseResponse;
import com.ifwd.fwdhk.exception.ECOMMAPIException;


public interface EvergreenService {

	public void upsertAppointment(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public BaseResponse sendAppointmentAcknowledgeMail(HttpServletRequest request)throws ECOMMAPIException;
	public void getAppointmentAccessCode(Model model, HttpServletRequest request,HttpServletResponse response) throws Exception;
	
	
	
	
	
	
	
}
