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

import com.ifwd.fwdhk.model.OptionItemDesc;

@SuppressWarnings("rawtypes")
@Component
public class InitApplicationMessage implements ApplicationListener{
	
	private final static Logger logger = LoggerFactory.getLogger(InitApplicationMessage.class);
	
	
	@Autowired
	private CommonUtils commonUtils;
	
	public static List<OptionItemDesc> maritalStatusesEN;	
	public static List<OptionItemDesc> maritalStatusesCN;
	
	
	public static List<OptionItemDesc> savieDistrictEN;
	public static List<OptionItemDesc> savieDistrictCN;
	public static List<OptionItemDesc> employmentStatusEN;
	public static List<OptionItemDesc> employmentStatusCN;
	public static List<OptionItemDesc> nationalityEN;
	public static List<OptionItemDesc> nationalityCN;
	public static List<OptionItemDesc> occupationEN;
	public static List<OptionItemDesc> occupationCN;
	public static List<OptionItemDesc> natureOfBusinessEN;
	public static List<OptionItemDesc> natureOfBusinessCN;
	public static List<OptionItemDesc> monthlyPersonalIncomeEN;
	public static List<OptionItemDesc> monthlyPersonalIncomeCN;
	public static List<OptionItemDesc> savieBeneficiaryRelationshipEN;
	public static List<OptionItemDesc> savieBeneficiaryRelationshipCN;
	
	public static List<OptionItemDesc> placeOfBirthEN;
	public static List<OptionItemDesc> placeOfBirthCN;
	
	public static String initToken;
	public static String initUsername;

	@Override
	public void onApplicationEvent(ApplicationEvent event) {
		if (event instanceof ContextStartedEvent || event instanceof ContextRefreshedEvent) {
			
			try {
				savieDistrictEN = commonUtils.getOptionItemDescList("savieDistrict","EN");
			} catch (Exception e) {
				logger.info("error : "+e.getMessage());
				savieDistrictEN=null;
			}
			logger.info("savieDistrictEN : " + savieDistrictEN);
			
			try {
				savieDistrictCN = commonUtils.getOptionItemDescList("savieDistrict","CH");
			} catch (Exception e) {
				logger.info("error : "+e.getMessage());
				savieDistrictCN=null;
			}
			logger.info("savieDistrictCH : " + savieDistrictCN);
			
			try {
				employmentStatusEN = commonUtils.getOptionItemDescList("employmentStatus","EN");
			} catch (Exception e) {
				logger.info("error : "+e.getMessage());
				employmentStatusEN=null;
			}
			logger.info("employmentStatusEN : " + employmentStatusEN);
			
			try {
				employmentStatusCN = commonUtils.getOptionItemDescList("employmentStatus","CH");
			} catch (Exception e) {
				logger.info("error : "+e.getMessage());
				employmentStatusCN=null;
			}
			logger.info("employmentStatusCH : " + employmentStatusCN);
			
			try {
				nationalityEN = commonUtils.getOptionItemDescList("nationality","EN");
			} catch (Exception e) {
				logger.info("error : "+e.getMessage());
				nationalityEN=null;
			}
			logger.info("nationalityCH : " + nationalityEN);
			
			try {
				nationalityCN = commonUtils.getOptionItemDescList("nationality","CH");
			} catch (Exception e) {
				logger.info("error : "+e.getMessage());
				nationalityCN=null;
			}
			logger.info("nationalityCH : " + nationalityCN);
			
			try {
				occupationEN = commonUtils.getOptionItemDescList("occupation","EN");
			} catch (Exception e) {
				logger.info("error : "+e.getMessage());
				occupationEN=null;
			}
			logger.info("occupationEN : " + occupationEN);
			
			try {
				occupationCN = commonUtils.getOptionItemDescList("occupation","CH");
			} catch (Exception e) {
				logger.info("error : "+e.getMessage());
				occupationCN=null;
			}
			logger.info("occupationCH : " + occupationCN);
			
			try {
				natureOfBusinessEN = commonUtils.getOptionItemDescList("natureOfBusiness","EN");
			} catch (Exception e) {
				logger.info("error : "+e.getMessage());
				natureOfBusinessEN=null;
			}
			logger.info("natureOfBusinessEN : " + natureOfBusinessEN);
			
			try {
				natureOfBusinessCN = commonUtils.getOptionItemDescList("natureOfBusiness","CH");
			} catch (Exception e) {
				logger.info("error : "+e.getMessage());
				natureOfBusinessCN=null;
			}
			logger.info("natureOfBusinessCH : " + natureOfBusinessCN);
			
			try {
				monthlyPersonalIncomeEN = commonUtils.getOptionItemDescList("monthlyPersonalIncome","EN");
			} catch (Exception e) {
				logger.info("error : "+e.getMessage());
				monthlyPersonalIncomeEN=null;
			}
			logger.info("monthlyPersonalIncomeEN : " + monthlyPersonalIncomeEN);
			
			try {
				monthlyPersonalIncomeCN = commonUtils.getOptionItemDescList("monthlyPersonalIncome","CH");
			} catch (Exception e) {
				logger.info("error : "+e.getMessage());
				monthlyPersonalIncomeCN=null;
			}
			logger.info("monthlyPersonalIncomeCH : " + monthlyPersonalIncomeCN);
			
			try {
				savieBeneficiaryRelationshipEN = commonUtils.getOptionItemDescList("savieBeneficiaryRelationship","EN");
			} catch (Exception e) {
				logger.info("error : "+e.getMessage());
				savieBeneficiaryRelationshipEN=null;
			}
			logger.info("savieBeneficiaryRelationshipEN : " + savieBeneficiaryRelationshipEN);
			
			try {
				savieBeneficiaryRelationshipCN = commonUtils.getOptionItemDescList("savieBeneficiaryRelationship","CH");
			} catch (Exception e) {
				logger.info("error : "+e.getMessage());
				savieBeneficiaryRelationshipCN=null;
			}
			logger.info("savieBeneficiaryRelationshipCH : " + savieBeneficiaryRelationshipCN);
			
			try {
				placeOfBirthEN = commonUtils.getOptionItemDescList("placeOfBirth","EN");
			} catch (Exception e) {
				logger.info("error : "+e.getMessage());
				placeOfBirthEN=null;
			}
			logger.info("placeOfBirthEN : " + placeOfBirthEN);
			
			try {
				placeOfBirthCN = commonUtils.getOptionItemDescList("placeOfBirth","CH");
			} catch (Exception e) {
				logger.info("error : "+e.getMessage());
				placeOfBirthCN=null;
			}
			logger.info("PlaceOfBirthCH : " + placeOfBirthCN);
			
		}
	}
	
	
}
