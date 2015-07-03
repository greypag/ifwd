package com.ifwd.fwdhk.util;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.util.Date;
import java.util.HashMap;

import org.joda.time.LocalDate;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.context.event.ContextStartedEvent;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Component;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.model.QuoteDetails;

@SuppressWarnings("rawtypes")
@Component
public class InitApplicationMessage implements ApplicationListener{
	
	public static QuoteDetails quoteDetails ;
	
	@Autowired
	private RestServiceDao restService;

	@Override
	public void onApplicationEvent(ApplicationEvent event) {
		if (event instanceof ContextStartedEvent || event instanceof ContextRefreshedEvent) {
			quoteDetails = new QuoteDetails();
			LocalDate commencementDate = new LocalDate(new Date());
			String Url = UserRestURIConstants.WORKINGHOLIDAY_GET_QUOTE + "?planCode=WorkingHoliday"
					+ "&commencementDate=" + commencementDate + "&referralCode=" + "";
	
			HashMap<String, String> header = new HashMap<String, String>(
					COMMON_HEADERS);
			
			header.put("userName", "*DIRECTGI");
			header.put("token", "a5684816-51b4-a2bc-fdd8-33887464726b");
			
			
			
			header.put("language", WebServiceUtils.transformLanaguage("CN"));
			JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,
					Url, header, null);
			
			quoteDetails.setReferralCode((String)responseJsonObj.get("referralCode"));
			quoteDetails.setReferralName((String)responseJsonObj.get("referralName"));
			quoteDetails.setPlanCode((String)responseJsonObj.get("planCode"));
			System.out.println("***********responseJsonObj****************:"+responseJsonObj);
			
		}
	}
	
}
