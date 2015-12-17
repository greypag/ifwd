package com.ifwd.fwdhk.utils.services;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

@Component
public interface SendEmailDao {
	public boolean sendEmail(String emailId, String promotionalCode, HashMap<String, String> header);
	public boolean sendEmailByDiscover(String username, String planName, String emailId, String discover, HashMap<String, String> header);
	public boolean sendY5buddyEmail(HttpServletRequest request, String recipientEmail, HashMap<String, String> header);
	public boolean sendPromotionEmail(String emailId, HashMap<String, String> header);
}
