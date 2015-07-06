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
	
	public static List<OptionItemDesc> maritalStatusesEN;	
	public static List<OptionItemDesc> maritalStatusesCH;
	
	@Autowired
	private List<OptionItemDesc> savieDistrictEN;	
	@Autowired
	private List<OptionItemDesc> savieDistrictCH;
	
	@Autowired
	private List<OptionItemDesc> employmentStatusEN;
	@Autowired
	private List<OptionItemDesc> employmentStatusCH;
	
	@Autowired
	private List<OptionItemDesc> nationalityEN;
	@Autowired
	private List<OptionItemDesc> nationalityCH;
	
	@Autowired
	private List<OptionItemDesc> occupationEN;
	@Autowired
	private List<OptionItemDesc> occupationCH;
	
	@Autowired
	private List<OptionItemDesc> natureOfBusinessEN;
	@Autowired
	private List<OptionItemDesc> natureOfBusinessCH;
	
	@Autowired
	private List<OptionItemDesc> monthlyPersonalIncomeEN;
	@Autowired
	private List<OptionItemDesc> monthlyPersonalIncomeCH;
	
	@Autowired
	private List<OptionItemDesc> savieBeneficiaryRelationshipEN;
	@Autowired
	private List<OptionItemDesc> savieBeneficiaryRelationshipCH;

	@Override
	public void onApplicationEvent(ApplicationEvent event) {
		if (event instanceof ContextStartedEvent || event instanceof ContextRefreshedEvent) {
			
			try {
				nationalityEN = commonUtils.getOptionItemDescList("nationality","EN");
			} catch (Exception e) {
				logger.info("error : "+e.getMessage());
				nationalityEN=null;
			}
			logger.info("nationalityEN : " + nationalityEN);
			
			try {
				nationalityCH = commonUtils.getOptionItemDescList("nationality","CH");
			} catch (Exception e) {
				logger.info("error : "+e.getMessage());
				nationalityCH=null;
			}
			logger.info("nationalityCH : " + nationalityCH);
			
		}
	}
	
	
}
