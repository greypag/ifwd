package com.ifwd.fwdhk.util;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.context.event.ContextStartedEvent;
import org.springframework.stereotype.Component;

import com.ifwd.fwdhk.model.savie.OptionItemDesc;

@SuppressWarnings("rawtypes")
@Component
public class InitApplicationMessage implements ApplicationListener{
	
	private final static Logger logger = LoggerFactory.getLogger(InitApplicationMessage.class);
	
	
	@Autowired
	private CommonUtils commonUtils;
	
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
			
			try {
				nationality = commonUtils.getOptionItemDescList("nationality");
			} catch (Exception e) {
				logger.info("error : "+e.getMessage());
				nationality=null;
			}
			logger.info("nationality : " + nationality);
			
		}
	}
	
	
}
