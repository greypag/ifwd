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
	
	
	public static List<OptionItemDesc> savieDistrictEN;
	public static List<OptionItemDesc> savieDistrictCH;
	public static List<OptionItemDesc> employmentStatusEN;
	public static List<OptionItemDesc> employmentStatusCH;
	public static List<OptionItemDesc> nationalityEN;
	public static List<OptionItemDesc> nationalityCH;
	public static List<OptionItemDesc> occupationEN;
	public static List<OptionItemDesc> occupationCH;
	public static List<OptionItemDesc> natureOfBusinessEN;
	public static List<OptionItemDesc> natureOfBusinessCH;
	public static List<OptionItemDesc> monthlyPersonalIncomeEN;
	public static List<OptionItemDesc> monthlyPersonalIncomeCH;
	public static List<OptionItemDesc> savieBeneficiaryRelationshipEN;
	public static List<OptionItemDesc> savieBeneficiaryRelationshipCH;
	
	public static List<OptionItemDesc> placeOfBirthEN;
	public static List<OptionItemDesc> PlaceOfBirthCH;

	@Override
	public void onApplicationEvent(ApplicationEvent event) {
		if (event instanceof ContextStartedEvent || event instanceof ContextRefreshedEvent) {
			
			try {
				savieDistrictEN = commonUtils.getOptionItemDescList("savieDistrict","EN");
			} catch (Exception e) {
				logger.info("error : "+e.getMessage());
				nationalityEN=null;
			}
			logger.info("savieDistrictEN : " + savieDistrictEN);
			
			try {
				savieDistrictCH = commonUtils.getOptionItemDescList("savieDistrict","CH");
			} catch (Exception e) {
				logger.info("error : "+e.getMessage());
				nationalityCH=null;
			}
			logger.info("savieDistrictCH : " + savieDistrictCH);
			
			try {
				employmentStatusEN = commonUtils.getOptionItemDescList("employmentStatus","EN");
			} catch (Exception e) {
				logger.info("error : "+e.getMessage());
				nationalityCH=null;
			}
			logger.info("employmentStatusEN : " + employmentStatusEN);
			
			try {
				employmentStatusCH = commonUtils.getOptionItemDescList("employmentStatus","CH");
			} catch (Exception e) {
				logger.info("error : "+e.getMessage());
				nationalityCH=null;
			}
			logger.info("employmentStatusCH : " + employmentStatusCH);
			
			try {
				nationalityCH = commonUtils.getOptionItemDescList("nationality","EN");
			} catch (Exception e) {
				logger.info("error : "+e.getMessage());
				nationalityCH=null;
			}
			logger.info("nationalityCH : " + nationalityCH);
			
			try {
				nationalityCH = commonUtils.getOptionItemDescList("nationality","CH");
			} catch (Exception e) {
				logger.info("error : "+e.getMessage());
				nationalityCH=null;
			}
			logger.info("nationalityCH : " + nationalityCH);
			
			try {
				occupationEN = commonUtils.getOptionItemDescList("occupation","EN");
			} catch (Exception e) {
				logger.info("error : "+e.getMessage());
				nationalityCH=null;
			}
			logger.info("occupationEN : " + occupationEN);
			
			try {
				occupationCH = commonUtils.getOptionItemDescList("occupation","CH");
			} catch (Exception e) {
				logger.info("error : "+e.getMessage());
				nationalityCH=null;
			}
			logger.info("occupationCH : " + occupationCH);
			
			try {
				natureOfBusinessEN = commonUtils.getOptionItemDescList("natureOfBusiness","EN");
			} catch (Exception e) {
				logger.info("error : "+e.getMessage());
				nationalityCH=null;
			}
			logger.info("natureOfBusinessEN : " + natureOfBusinessEN);
			
			try {
				natureOfBusinessCH = commonUtils.getOptionItemDescList("natureOfBusiness","CH");
			} catch (Exception e) {
				logger.info("error : "+e.getMessage());
				nationalityCH=null;
			}
			logger.info("natureOfBusinessCH : " + nationalityCH);
			
			try {
				monthlyPersonalIncomeEN = commonUtils.getOptionItemDescList("monthlyPersonalIncome","EN");
			} catch (Exception e) {
				logger.info("error : "+e.getMessage());
				nationalityCH=null;
			}
			logger.info("monthlyPersonalIncomeEN : " + monthlyPersonalIncomeEN);
			
			try {
				monthlyPersonalIncomeCH = commonUtils.getOptionItemDescList("monthlyPersonalIncome","EN");
			} catch (Exception e) {
				logger.info("error : "+e.getMessage());
				nationalityCH=null;
			}
			logger.info("monthlyPersonalIncomeCH : " + monthlyPersonalIncomeCH);
			
			try {
				savieBeneficiaryRelationshipEN = commonUtils.getOptionItemDescList("savieBeneficiaryRelationship","EN");
			} catch (Exception e) {
				logger.info("error : "+e.getMessage());
				nationalityCH=null;
			}
			logger.info("savieBeneficiaryRelationshipEN : " + savieBeneficiaryRelationshipEN);
			
			try {
				savieBeneficiaryRelationshipCH = commonUtils.getOptionItemDescList("savieBeneficiaryRelationship","CH");
			} catch (Exception e) {
				logger.info("error : "+e.getMessage());
				nationalityCH=null;
			}
			logger.info("savieBeneficiaryRelationshipCH : " + savieBeneficiaryRelationshipCH);
			
			try {
				placeOfBirthEN = commonUtils.getOptionItemDescList("placeOfBirth","EN");
			} catch (Exception e) {
				logger.info("error : "+e.getMessage());
				nationalityCH=null;
			}
			logger.info("placeOfBirthEN : " + placeOfBirthEN);
			
			try {
				PlaceOfBirthCH = commonUtils.getOptionItemDescList("PlaceOfBirth","CH");
			} catch (Exception e) {
				logger.info("error : "+e.getMessage());
				nationalityCH=null;
			}
			logger.info("PlaceOfBirthCH : " + PlaceOfBirthCH);
			
		}
	}
	
	
}
