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
//		String message = "<p>Thank your for registering for receiving offers, upgrades and information from FWD*.  Your promotion code is ABC. <br><p>"
//				+ "FWD respects your privacy. For more information, please read our privacy policy at <a href='http://www.fwd.com.hk/en-US/home/pdo.html'>http://www.fwd.com.hk/en-US/home/pdo.html</a>.<br><p>"
//				+ "*Note: You may unsubscribe at any time.  To unsubscribe, pls call us at 3123-3123.<br><br><br>";
		String message = "\u60A8\u597D,<p><p>\u591A\u8B1D\u60A8\u767B\u8A18\u8A02\u95B1\u5BCC\u885B\u7684\u63A8\u5EE3\u512A\u60E0\u3001\u5347\u7D1A\u734E\u8CDE\u53CA\u516C\u53F8\u8CC7\u8A0A*\u3002\u60A8\u53EF\u4EE5\u4F7F\u7528\u63A8\u5EE3\u7DE8\u865F " + promotionalCode + " \u7372\u53D6\u7DB2\u4E0A\u6295\u4FDD\u512A\u60E0\u3002<p>"
				+ "\u5BCC\u885B\u6642\u523B\u4EE5\u5BA2\u6236\u79C1\u96B1\u70BA\u5148\uFF0C\u4F60\u53EF\u4EE5\u53C3\u95B1<a href='http://www.fwd.com.hk/zh-HK/home/pdo.html'>http://www.fwd.com.hk/zh-HK/home/pdo.html</a>\u4E86\u89E3\u6211\u5011\u7684\u500B\u4EBA\u8CC7\u6599\u4FDD\u8B77\u653F\u7B56\u3002<p>*\u8A3B: \u60A8\u53EF\u4EE5\u96A8\u6642\u81F4\u96FB3123-3123\u53D6\u6D88\u8A02\u95B1<p><p>Hi,<p><p>Thank you for registering to receive offers, upgrades and information from FWD*. You can use the promotion code " + promotionalCode + " to get discounts from online purchases.<p>FWD respects your privacy. For more information, please read our Personal Data Protection Policy at <a href='http://www.fwd.com.hk/en-US/home/pdo.html'>http://www.fwd.com.hk/en-US/home/pdo.html</a>.<p> *Note: You may unsubscribe at any time.  To unsubscribe, please call us at 3123-3123.";
//		
		//ByteBuffer message = Charset.forName("UTF-8").encode("您好");
		
		//String message = "\u60A8\u597D";
		JSONObject email_params = new JSONObject();
		email_params.put("to", emailId);
		email_params.put("message", message);
		email_params.put("subject", "FWD Promotion Code");
		email_params.put("attachment", null);
		email_params.put("from", "i-noreply.hk@fwd.com");
		email_params.put("isHtml", true);

		
		
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
