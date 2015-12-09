package com.ifwd.fwdhk.services;

import javax.servlet.http.HttpServletRequest;

public interface CampaignService {
	
	public int getAvailablePromoCodeCountByCampaign(HttpServletRequest request);
	
	public String assignCampaignPromoCode(HttpServletRequest request);

}
