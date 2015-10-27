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

import com.ifwd.fwdhk.connector.response.savie.ServiceCentreResponse;
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
	
	public static ServiceCentreResponse serviceCentreEN;
	public static ServiceCentreResponse serviceCentreCN;
	
	public static List<OptionItemDesc> etCsContactPreferredDayEN;
	public static List<OptionItemDesc> etCsContactPreferredDayCN;
	
	public static List<OptionItemDesc> etCsContactPreferredTimeSlotEN;
	public static List<OptionItemDesc> etCsContactPreferredTimeSlotCN;
	
	public static List<OptionItemDesc> etEnquiryTypeEN;
	public static List<OptionItemDesc> etEnquiryTypeCN;
	
	public static List<OptionItemDesc> etLiquidAssetEN;
	public static List<OptionItemDesc> etLiquidAssetCN;
	
	public static List<OptionItemDesc> etAmountOtherSourceEN;
	public static List<OptionItemDesc> etAmountOtherSourceCN;
	

	@Override
	public void onApplicationEvent(ApplicationEvent event) {
		if (event instanceof ContextStartedEvent || event instanceof ContextRefreshedEvent) {
			init(commonUtils,"start");
		}
	}

	public static void init(CommonUtils commonUtils, String type){
		if("start".equals(type)){
			logger.info("init : start application");
		}
		else{
			logger.info("init : reload api data");
		}
		try {
			maritalStatusesEN = commonUtils.getOptionItemDescList("maritalStatus","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("maritalStatusesEN : " + maritalStatusesEN);
		
		try {
			maritalStatusesCN = commonUtils.getOptionItemDescList("maritalStatus","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("maritalStatusesCN : " + maritalStatusesCN);

		try {
			savieDistrictEN = commonUtils.getOptionItemDescList("savieDistrict","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("savieDistrictEN : " + savieDistrictEN);
		
		try {
			savieDistrictCN = commonUtils.getOptionItemDescList("savieDistrict","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("savieDistrictCH : " + savieDistrictCN);
		
		try {
			employmentStatusEN = commonUtils.getOptionItemDescList("employmentStatus","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("employmentStatusEN : " + employmentStatusEN);
		
		try {
			employmentStatusCN = commonUtils.getOptionItemDescList("employmentStatus","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("employmentStatusCN : " + employmentStatusCN);
		
		try {
			nationalityEN = commonUtils.getOptionItemDescList("nationality","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("nationalityEN : " + nationalityEN);
		
		try {
			nationalityCN = commonUtils.getOptionItemDescList("nationality","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("nationalityCN : " + nationalityCN);
		
		try {
			occupationEN = commonUtils.getOptionItemDescList("occupation","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationEN : " + occupationEN);
		
		try {
			occupationCN = commonUtils.getOptionItemDescList("occupation","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationCN : " + occupationCN);
		
		try {
			natureOfBusinessEN = commonUtils.getOptionItemDescList("natureOfBusiness","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("natureOfBusinessEN : " + natureOfBusinessEN);
		
		try {
			natureOfBusinessCN = commonUtils.getOptionItemDescList("natureOfBusiness","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("natureOfBusinessCN : " + natureOfBusinessCN);
		
		try {
			monthlyPersonalIncomeEN = commonUtils.getOptionItemDescList("monthlyPersonalIncome","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("monthlyPersonalIncomeEN : " + monthlyPersonalIncomeEN);
		
		try {
			monthlyPersonalIncomeCN = commonUtils.getOptionItemDescList("monthlyPersonalIncome","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("monthlyPersonalIncomeCN : " + monthlyPersonalIncomeCN);
		
		try {
			savieBeneficiaryRelationshipEN = commonUtils.getOptionItemDescList("beneficiaryInfo","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("savieBeneficiaryRelationshipEN : " + savieBeneficiaryRelationshipEN);
		
		try {
			savieBeneficiaryRelationshipCN = commonUtils.getOptionItemDescList("beneficiaryInfo","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("savieBeneficiaryRelationshipCN : " + savieBeneficiaryRelationshipCN);
		
		try {
			placeOfBirthEN = commonUtils.getOptionItemDescList("placeOfBirth","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("placeOfBirthEN : " + placeOfBirthEN);
		
		try {
			placeOfBirthCN = commonUtils.getOptionItemDescList("placeOfBirth","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("placeOfBirthCN : " + placeOfBirthCN);
		
		try {
			savieAnsEN = commonUtils.getOptionItemDescList("SavieAns","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("savieAnsEN : " + savieAnsEN);
		
		try {
			savieAnsCN = commonUtils.getOptionItemDescList("SavieAns","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("savieAnsCN : " + savieAnsCN);
	
		try {
			commonUtils.getImageConfig(type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("signatureWidth : " + signatureWidth + "signatureHeight : " + signatureHeight);
		
		try {
			commonUtils.getServiceCentre("EN", type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("serviceCentreEN : " + serviceCentreEN);
		
		try {
			commonUtils.getServiceCentre("CH", type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("serviceCentreCN : " + serviceCentreCN);
		
		try {
			etCsContactPreferredDayEN = commonUtils.getOptionItemDescList("csContactPreferredDay","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("etCsContactPreferredDayEN : " + etCsContactPreferredDayEN);
		
		try {
			etCsContactPreferredDayCN = commonUtils.getOptionItemDescList("csContactPreferredDay","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("etCsContactPreferredDayCN : " + etCsContactPreferredDayCN);
		
		try {
			etCsContactPreferredTimeSlotEN = commonUtils.getOptionItemDescList("csContactPreferredTimeSlot","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("etCsContactPreferredTimeSlotEN : " + etCsContactPreferredTimeSlotEN);
		
		try {
			etCsContactPreferredTimeSlotCN = commonUtils.getOptionItemDescList("csContactPreferredTimeSlot","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("etCsContactPreferredTimeSlotCN : " + etCsContactPreferredTimeSlotCN);
		
		try {
			etEnquiryTypeEN = commonUtils.getOptionItemDescList("enquiryType","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("etEnquiryTypeEN : " + etEnquiryTypeEN);
		
		try {
			etEnquiryTypeCN = commonUtils.getOptionItemDescList("enquiryType","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("etEnquiryTypeCN : " + etEnquiryTypeCN);
		
		try {
			etLiquidAssetEN = commonUtils.getOptionItemDescList("liquidAsset","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("etLiquidAssetEN : " + etLiquidAssetEN);
		
		try {
			etLiquidAssetCN = commonUtils.getOptionItemDescList("liquidAsset","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("etLiquidAssetCN : " + etLiquidAssetCN);
		
		try {
			etAmountOtherSourceEN = commonUtils.getOptionItemDescList("amountOtherSource","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("etAmountOtherSourceEN : " + etAmountOtherSourceEN);
		
		try {
			etAmountOtherSourceCN = commonUtils.getOptionItemDescList("amountOtherSource","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("etAmountOtherSourceCN : " + etAmountOtherSourceCN);
	}
}
