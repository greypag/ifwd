package com.ifwd.fwdhk.services;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ifwd.fwdhk.model.HomeCareDetailsBean;

public interface GAService {
	
	public String processSummary(HomeCareDetailsBean homeCareDetails, HttpServletResponse response, HttpServletRequest request) throws Exception;
}
