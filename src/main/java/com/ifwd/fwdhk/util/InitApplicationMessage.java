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
	
	public static List<OptionItemDesc> savieAnsEN;
	public static List<OptionItemDesc> savieAnsCN;
	
	public static String initToken;
	public static String initUsername;
	
	
	public static String signatureWidth;
	public static String signatureHeight;
	public static String signatureFileSize;
	public static String applicationFileSize;
	

	@Override
	public void onApplicationEvent(ApplicationEvent event) {
		if (event instanceof ContextStartedEvent || event instanceof ContextRefreshedEvent) {
			init(commonUtils);
		}
	}
	
	
	public static void init(CommonUtils commonUtils){
		logger.info("init : start application");
		
		
		try {
			maritalStatusesEN = commonUtils.getOptionItemDescList("maritalStatus","EN");
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			System.exit(0);
			maritalStatusesEN=null;
		}
		logger.info("maritalStatusesEN : " + maritalStatusesEN);
		
		try {
			maritalStatusesCN = commonUtils.getOptionItemDescList("maritalStatus","CH");
		} catch (Exception e) {
			logger.info("error : "+e.getMessage());
			System.exit(0);
			maritalStatusesCN=null;
		}
		logger.info("maritalStatusesCN : " + maritalStatusesCN);

		try {
			savieDistrictEN = commonUtils.getOptionItemDescList("savieDistrict","EN");
		} catch (Exception e) {
			logger.info("error : "+e.getMessage());
			System.exit(0);
			savieDistrictEN=null;
		}
		logger.info("savieDistrictEN : " + savieDistrictEN);
		
		try {
			savieDistrictCN = commonUtils.getOptionItemDescList("savieDistrict","CH");
		} catch (Exception e) {
			logger.info("error : "+e.getMessage());
			System.exit(0);
			savieDistrictCN=null;
		}
		logger.info("savieDistrictCH : " + savieDistrictCN);
		
		try {
			employmentStatusEN = commonUtils.getOptionItemDescList("employmentStatus","EN");
		} catch (Exception e) {
			logger.info("error : "+e.getMessage());
			System.exit(0);
			employmentStatusEN=null;
		}
		logger.info("employmentStatusEN : " + employmentStatusEN);
		
		try {
			employmentStatusCN = commonUtils.getOptionItemDescList("employmentStatus","CH");
		} catch (Exception e) {
			logger.info("error : "+e.getMessage());
			System.exit(0);
			employmentStatusCN=null;
		}
		logger.info("employmentStatusCN : " + employmentStatusCN);
		
		try {
			nationalityEN = commonUtils.getOptionItemDescList("nationality","EN");
		} catch (Exception e) {
			logger.info("error : "+e.getMessage());
			System.exit(0);
			nationalityEN=null;
		}
		logger.info("nationalityEN : " + nationalityEN);
		
		try {
			nationalityCN = commonUtils.getOptionItemDescList("nationality","CH");
		} catch (Exception e) {
			logger.info("error : "+e.getMessage());
			System.exit(0);
			nationalityCN=null;
		}
		logger.info("nationalityCN : " + nationalityCN);
		
		try {
			occupationEN = commonUtils.getOptionItemDescList("occupation","EN");
		} catch (Exception e) {
			logger.info("error : "+e.getMessage());
			System.exit(0);
			occupationEN=null;
		}
		logger.info("occupationEN : " + occupationEN);
		
		try {
			occupationCN = commonUtils.getOptionItemDescList("occupation","CH");
		} catch (Exception e) {
			logger.info("error : "+e.getMessage());
			System.exit(0);
			occupationCN=null;
		}
		logger.info("occupationCN : " + occupationCN);
		
		try {
			natureOfBusinessEN = commonUtils.getOptionItemDescList("natureOfBusiness","EN");
		} catch (Exception e) {
			logger.info("error : "+e.getMessage());
			System.exit(0);
			natureOfBusinessEN=null;
		}
		logger.info("natureOfBusinessEN : " + natureOfBusinessEN);
		
		try {
			natureOfBusinessCN = commonUtils.getOptionItemDescList("natureOfBusiness","CH");
		} catch (Exception e) {
			logger.info("error : "+e.getMessage());
			System.exit(0);
			natureOfBusinessCN=null;
		}
		logger.info("natureOfBusinessCN : " + natureOfBusinessCN);
		
		try {
			monthlyPersonalIncomeEN = commonUtils.getOptionItemDescList("monthlyPersonalIncome","EN");
		} catch (Exception e) {
			logger.info("error : "+e.getMessage());
			System.exit(0);
			monthlyPersonalIncomeEN=null;
		}
		logger.info("monthlyPersonalIncomeEN : " + monthlyPersonalIncomeEN);
		
		try {
			monthlyPersonalIncomeCN = commonUtils.getOptionItemDescList("monthlyPersonalIncome","CH");
		} catch (Exception e) {
			logger.info("error : "+e.getMessage());
			System.exit(0);
			monthlyPersonalIncomeCN=null;
		}
		logger.info("monthlyPersonalIncomeCN : " + monthlyPersonalIncomeCN);
		
		try {
			savieBeneficiaryRelationshipEN = commonUtils.getOptionItemDescList("beneficiaryInfo","EN");
		} catch (Exception e) {
			logger.info("error : "+e.getMessage());
			System.exit(0);
			savieBeneficiaryRelationshipEN=null;
		}
		logger.info("savieBeneficiaryRelationshipEN : " + savieBeneficiaryRelationshipEN);
		
		try {
			savieBeneficiaryRelationshipCN = commonUtils.getOptionItemDescList("beneficiaryInfo","CH");
		} catch (Exception e) {
			logger.info("error : "+e.getMessage());
			System.exit(0);
			savieBeneficiaryRelationshipCN=null;
		}
		logger.info("savieBeneficiaryRelationshipCN : " + savieBeneficiaryRelationshipCN);
		
		try {
			placeOfBirthEN = commonUtils.getOptionItemDescList("placeOfBirth","EN");
		} catch (Exception e) {
			logger.info("error : "+e.getMessage());
			System.exit(0);
			placeOfBirthEN=null;
		}
		logger.info("placeOfBirthEN : " + placeOfBirthEN);
		
		try {
			placeOfBirthCN = commonUtils.getOptionItemDescList("placeOfBirth","CH");
		} catch (Exception e) {
			logger.info("error : "+e.getMessage());
			System.exit(0);
			placeOfBirthCN=null;
		}
		logger.info("placeOfBirthCN : " + placeOfBirthCN);
		
		try {
			savieAnsEN = commonUtils.getOptionItemDescList("SavieAns","EN");
		} catch (Exception e) {
			logger.info("error : "+e.getMessage());
			System.exit(0);
			savieAnsEN=null;
		}
		logger.info("savieAnsEN : " + savieAnsEN);
		
		try {
			savieAnsCN = commonUtils.getOptionItemDescList("SavieAns","CH");
		} catch (Exception e) {
			logger.info("error : "+e.getMessage());
			System.exit(0);
			savieAnsCN=null;
		}
		logger.info("savieAnsCN : " + savieAnsCN);
	
		try {
			commonUtils.getImageConfig();
		} catch (Exception e) {
			logger.info("error : "+e.getMessage());
			System.exit(0);
		}
		logger.info("signatureWidth : " + signatureWidth + "signatureHeight : " + signatureHeight);
		
	
	}
	
}