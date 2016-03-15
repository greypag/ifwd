package com.ifwd.fwdhk.services.impl;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.services.CampaignService;

@Service
public class CampaignServiceImpl implements CampaignService {
	private final static Logger logger = LoggerFactory.getLogger(CampaignServiceImpl.class);
	
	@Autowired
	private RestServiceDao restService;

	public int getAvailablePromoCodeCountByCampaign(HttpServletRequest request) {		
		try {
			int campaignId = Integer.parseInt(request.getParameter("campaignId"));

			String Url = UserRestURIConstants.CAMPAIGN_PROMO_CODE_GET_COUNT 
					+ "?campaign_id="+campaignId;
			
			HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);

			JSONObject responseJsonObj = new JSONObject();
			responseJsonObj = restService.consumeApi(HttpMethod.GET, Url,
					header, null);
			logger.info("CAMPAIGN_PROMO_CODE_GET_COUNT : ", responseJsonObj);
			if (responseJsonObj.get("errMsgs") == null) {
				int availableCount = Integer.parseInt(responseJsonObj.get("availableCount").toString());
				return availableCount;
			} else {
				return -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public String assignCampaignPromoCode(HttpServletRequest request) {
		try {
			int campaignId = Integer.parseInt(request.getParameter("campaignId"));
			
			String Url = UserRestURIConstants.CAMPAIGN_PROMO_CODE_ASSIGN 
					+ "?campaign_id="+campaignId;

			HashMap<String, String> header = new HashMap<String, String>(
					COMMON_HEADERS);
			if (request.getSession().getAttribute("username") != null) {
				header.put("userName",
						request.getSession().getAttribute("username")
								.toString());
				header.put("token", request.getSession().getAttribute("token")
						.toString());
			}else {
				return "notlogin";
			}
			
			JSONObject responseJsonObj = new JSONObject();
			responseJsonObj = restService.consumeApi(HttpMethod.GET, Url,
					header, null);
			logger.info("CAMPAIGN_PROMO_CODE_ASSIGN : ", responseJsonObj);
			if (responseJsonObj.get("result").equals("success")) {
				return responseJsonObj.get("promoCode").toString();				
			} else {
				return responseJsonObj.get("result").toString(); // failed or duplicated
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	public Map<String,String> getAllAvailablePromoCodeCountByCampaign(HttpServletRequest request) {
		int[] indexs = {13, 5, 6, 7, 8, 9};
		
	    if (request.getParameter("hid")!=null) {	  
		    switch (Integer.parseInt(request.getParameter("hid").toString())) {
			    case 14:
		            indexs = new int[]{14};
		            break;
			    case 15:
		            indexs = new int[]{15};
		            break;
			    case 16:
		            indexs = new int[]{16};
		            break;
			    case 17:
		            indexs = new int[]{17};
		            break;
			    case 18:
		            indexs = new int[]{18};
		            break;
			    case -1:
		            indexs = new int[]{-1};
		            break;
		    }
	    }
		
		HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
		Map<String,String> map = new HashMap<String,String>();
		String Url;
		JSONObject responseJsonObj;
		for(int i = 0; i < indexs.length; i++) {
			Url = UserRestURIConstants.CAMPAIGN_PROMO_CODE_GET_COUNT + "?campaign_id=" + indexs[i];
			responseJsonObj = restService.consumeApi(HttpMethod.GET, Url, header, null);
			logger.info("CAMPAIGN_PROMO_CODE_GET_COUNT : " + responseJsonObj);
			if (responseJsonObj.get("errMsgs") == null) {
				map.put("count" + i, responseJsonObj.get("availableCount").toString());
			} else {
				map.put("count" + i, "0");
			} 
		}
		return map;
	}
}





