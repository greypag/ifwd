package com.ifwd.fwdhk.services;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface CampaignService {
	
	public int getAvailablePromoCodeCountByCampaign(HttpServletRequest request);
	
	public String assignCampaignPromoCode(HttpServletRequest request);
	
	public Map<String,String> getAllAvailablePromoCodeCountByCampaign(HttpServletRequest request);

}
