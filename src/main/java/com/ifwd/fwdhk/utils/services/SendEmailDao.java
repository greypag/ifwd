package com.ifwd.fwdhk.utils.services;

import java.util.HashMap;

import org.springframework.stereotype.Component;

@Component
public interface SendEmailDao {
	public boolean sendEmail(String emailId, String promotionalCode, HashMap<String, String> header);
	public boolean sendPromotionEmail(String emailId, HashMap<String, String> header);
}
