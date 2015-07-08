package com.ifwd.fwdhk.api.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Component;

import com.ifwd.fwdhk.model.SendEmailInfo;

@Component
public interface RestServiceDao {
	public JSONObject consumeApi(HttpMethod type, String url,
			Map<String, String> header, JSONObject parameters);

	public void consumeLoginApi(HttpServletRequest request);
	
	public JSONObject SendEmail(SendEmailInfo sei);
}
