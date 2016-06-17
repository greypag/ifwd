package com.ifwd.fwdhk.services;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

public interface TravelService {

	public JSONObject finalizeTravelCarePolicy(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception;
}
