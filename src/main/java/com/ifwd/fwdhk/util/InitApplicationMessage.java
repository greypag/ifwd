package com.ifwd.fwdhk.util;

import java.util.HashMap;
import java.util.List;

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
import com.ifwd.fwdhk.model.savie.OptionItemDesc;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

@SuppressWarnings("rawtypes")
@Component
public class InitApplicationMessage implements ApplicationListener{
	
	public static QuoteDetails quoteDetails ;
	
	@Autowired
	private RestServiceDao restService;
	
	@Autowired
	private List<OptionItemDesc> maritalStatuses;
	
	@Autowired
	private List<OptionItemDesc> savieDistrict;
	
	@Autowired
	private List<OptionItemDesc> employmentStatus;
	
	@Autowired
	private List<OptionItemDesc> nationality;
	
	@Autowired
	private List<OptionItemDesc> occupation;
	
	@Autowired
	private List<OptionItemDesc> natureOfBusiness;
	
	@Autowired
	private List<OptionItemDesc> monthlyPersonalIncome;
	
	@Autowired
	private List<OptionItemDesc> savieBeneficiaryRelationship;

	@Override
	public void onApplicationEvent(ApplicationEvent event) {
		if (event instanceof ContextStartedEvent || event instanceof ContextRefreshedEvent) {
			
			String Url = UserRestURIConstants.HOMECARE_GET_NET_FLOOR_AREA + "?itemTable=maritalStatus";
			
			HashMap<String, String> header = new HashMap<String, String>(
					COMMON_HEADERS);
			
			header.put("userName", "*DIRECTGI");
			header.put("token", "a5684816-51b4-a2bc-fdd8-33887464726b");
			
			JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,
					Url, header, null);
			
			System.out.println("***********responseJsonObj****************:"+responseJsonObj);
			
			/*if (responseJsonObj.get("errMsgs") == null) {
				OptionItemDesc maritalStatus = new OptionItemDesc();
				
				JSONObject jsonOptionItemDescs = new JSONObject();
				jsonOptionItemDescs = (JSONObject)responseJsonObj.get("optionItemDesc");
				
				maritalStatus.setItemTable((String)jsonOptionItemDescs.get("itemTable"));
				maritalStatus.setItemDesc((String)jsonOptionItemDescs.get("itemDesc"));
				maritalStatus.setItemCode((String)jsonOptionItemDescs.get("itemCode"));
				maritalStatus.setItemLang((String)jsonOptionItemDescs.get("itemLang"));
				
			}
			System.out.println("***********responseJsonObj****************:"+responseJsonObj);*/
			
			
		}
	}
	
}
