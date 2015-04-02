package com.ifwd.fwdhk.utils.services;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Component;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.controller.UserRestURIConstants;

@Component
public class SendEmailService implements SendEmailDao {

	@Autowired
	RestServiceDao restService;

	@SuppressWarnings("unchecked")
	@Override
	public boolean sendEmail(String emailId, String promotionalCode,
			HashMap<String, String> header) {
		boolean result = false;
		String message = "Thank your for registering for receiving offers, upgrades and information from FWD*.  Your promotion code is ABC. \n\n"
				+ "FWD respects your privacy. For more information, please read our privacy policy at <link to FWD or iFWD site>.\n\n"
				+ "*Note: You may unsubscribe at any time.  To unsubscribe, pls call us at 3123-3123.";

		JSONObject email_params = new JSONObject();
		email_params.put("to", emailId);
		email_params.put("message", message);
		email_params.put("subject", "FWD Promotion Code");
		email_params.put("attachment", null);
		email_params.put("from", "ecommerce.hk@fwd.com");

		JSONObject resp = restService.consumeApi(HttpMethod.POST,
				UserRestURIConstants.SEND_MAIL, header, email_params);
		if (resp != null) {
			if (checkJsonObjNull(resp, "errMsgs").equals("null")) {
				result = true;
			}
		}
		return result;
	}

	public String checkJsonObjNull(JSONObject obj, String checkByStr) {
		if (obj.get(checkByStr) != null) {
			return obj.get(checkByStr).toString();
		} else {
			return "null";
		}
	}

	@Override
	public boolean sendPromotionEmail(String emailId,
			HashMap<String, String> header) {
		// TODO Auto-generated method stub
		return false;
	}

}
