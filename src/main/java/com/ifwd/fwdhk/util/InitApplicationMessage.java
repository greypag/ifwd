package com.ifwd.fwdhk.util;

import java.util.List;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

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
	public static HashMap<String, List<OptionItemDesc>> nob_occListEN;
	public static HashMap<String, List<OptionItemDesc>> nob_occListCN;
	public static List<OptionItemDesc> monthlyPersonalIncomeEN;
	public static List<OptionItemDesc> monthlyPersonalIncomeCN;
	public static List<OptionItemDesc> savieBeneficiaryRelationshipEN;
	public static List<OptionItemDesc> savieBeneficiaryRelationshipCN;
	
	public static List<OptionItemDesc> lifeBeneficiaryRelationshipEN;
	public static List<OptionItemDesc> lifeBeneficiaryRelationshipCN;
	
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
	
	public static List<OptionItemDesc> etEducationLevelEN;
	public static List<OptionItemDesc> etEducationLevelCN;
	
	public static List<OptionItemDesc> occupationEnNoB1;
	public static List<OptionItemDesc> occupationCnNoB1;
	public static List<OptionItemDesc> occupationEnNoB2;
	public static List<OptionItemDesc> occupationCnNoB2;
	public static List<OptionItemDesc> occupationEnNoB3;
	public static List<OptionItemDesc> occupationCnNoB3;
	public static List<OptionItemDesc> occupationEnNoB4;
	public static List<OptionItemDesc> occupationCnNoB4;
	public static List<OptionItemDesc> occupationEnNoB5;
	public static List<OptionItemDesc> occupationCnNoB5;
	public static List<OptionItemDesc> occupationEnNoB6;
	public static List<OptionItemDesc> occupationCnNoB6;
	public static List<OptionItemDesc> occupationEnNoB7;
	public static List<OptionItemDesc> occupationCnNoB7;
	public static List<OptionItemDesc> occupationEnNoB8;
	public static List<OptionItemDesc> occupationCnNoB8;
	public static List<OptionItemDesc> occupationEnNoB9;
	public static List<OptionItemDesc> occupationCnNoB9;
	public static List<OptionItemDesc> occupationEnNoB10;
	public static List<OptionItemDesc> occupationCnNoB10;
	public static List<OptionItemDesc> occupationEnNoB11;
	public static List<OptionItemDesc> occupationCnNoB11;
	public static List<OptionItemDesc> occupationEnNoB12;
	public static List<OptionItemDesc> occupationCnNoB12;
	public static List<OptionItemDesc> occupationEnNoB13;
	public static List<OptionItemDesc> occupationCnNoB13;
	public static List<OptionItemDesc> occupationEnNoB14;
	public static List<OptionItemDesc> occupationCnNoB14;
	public static List<OptionItemDesc> occupationEnNoB15;
	public static List<OptionItemDesc> occupationCnNoB15;
	public static List<OptionItemDesc> occupationEnNoB16;
	public static List<OptionItemDesc> occupationCnNoB16;
	public static List<OptionItemDesc> occupationEnNoB17;
	public static List<OptionItemDesc> occupationCnNoB17;
	public static List<OptionItemDesc> occupationEnNoB18;
	public static List<OptionItemDesc> occupationCnNoB18;
	public static List<OptionItemDesc> occupationEnNoB19;
	public static List<OptionItemDesc> occupationCnNoB19;
	public static List<OptionItemDesc> occupationEnNoB20;
	public static List<OptionItemDesc> occupationCnNoB20;
	public static List<OptionItemDesc> occupationEnNoB21;
	public static List<OptionItemDesc> occupationCnNoB21;
	public static List<OptionItemDesc> occupationEnNoB22;
	public static List<OptionItemDesc> occupationCnNoB22;
	public static List<OptionItemDesc> occupationEnNoB23;
	public static List<OptionItemDesc> occupationCnNoB23;
	public static List<OptionItemDesc> occupationEnNoB24;
	public static List<OptionItemDesc> occupationCnNoB24;
	
	public static List<OptionItemDesc> bankCodeEN;
	public static List<OptionItemDesc> bankCodeCN;
	public static List<OptionItemDesc> branchCodeEN;
	public static List<OptionItemDesc> branchCodeCN;
	

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
			nob_occListEN = new HashMap<String, List<OptionItemDesc>>();
			String itemCode = "";
			for( OptionItemDesc item: natureOfBusinessEN ) {
				itemCode = item.getItemCode();
				nob_occListEN.put(itemCode, commonUtils.getOptionItemDescList(itemCode,"EN",type));
			}
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("natureOfBusiness_OccupationEN : " + nob_occListEN);
		
		try {
			nob_occListCN = new HashMap<String, List<OptionItemDesc>>();
			String itemCode = "";
			for( OptionItemDesc item: natureOfBusinessEN ) {
				itemCode = item.getItemCode();
				nob_occListCN.put(itemCode, commonUtils.getOptionItemDescList(itemCode,"CH",type));
			}
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("natureOfBusiness_OccupationCN : " + nob_occListCN);

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
			lifeBeneficiaryRelationshipEN = commonUtils.getOptionItemDescList("lifeBeneficiary","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("lifeBeneficiaryRelationshipEN : " + lifeBeneficiaryRelationshipEN);
		
		try {
			lifeBeneficiaryRelationshipCN = commonUtils.getOptionItemDescList("lifeBeneficiary","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("lifeBeneficiaryRelationshipCN : " + lifeBeneficiaryRelationshipCN);
		
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
		
		try {
			etEducationLevelEN = commonUtils.getOptionItemDescList("educationLevel","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("etEducationLevelEN : " + etEducationLevelEN);
		
		try {
			etEducationLevelCN = commonUtils.getOptionItemDescList("educationLevel","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("etEducationLevelCN : " + etEducationLevelCN);
		
		try {
			occupationEnNoB1 = commonUtils.getOptionItemDescList("NoB1","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB1 : " + occupationEnNoB1);
		
		try {
			occupationCnNoB1 = commonUtils.getOptionItemDescList("NoB1","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB1 : " + occupationCnNoB1);
		
		try {
			occupationEnNoB2 = commonUtils.getOptionItemDescList("NoB2","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB2 : " + occupationEnNoB2);
		
		try {
			occupationCnNoB2 = commonUtils.getOptionItemDescList("NoB2","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB2 : " + occupationCnNoB2);
		
		try {
			occupationEnNoB3 = commonUtils.getOptionItemDescList("NoB3","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB3 : " + occupationEnNoB3);
		
		try {
			occupationCnNoB3 = commonUtils.getOptionItemDescList("NoB3","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB3 : " + occupationCnNoB3);
		
		try {
			occupationEnNoB4 = commonUtils.getOptionItemDescList("NoB4","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB4 : " + occupationEnNoB4);
		
		try {
			occupationCnNoB4 = commonUtils.getOptionItemDescList("NoB4","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB4 : " + occupationCnNoB4);
		
		try {
			occupationEnNoB5 = commonUtils.getOptionItemDescList("NoB5","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB5 : " + occupationEnNoB5);
		
		try {
			occupationCnNoB5 = commonUtils.getOptionItemDescList("NoB5","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB5 : " + occupationCnNoB5);
		
		try {
			occupationEnNoB6 = commonUtils.getOptionItemDescList("NoB6","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB6 : " + occupationEnNoB6);
		
		try {
			occupationCnNoB6 = commonUtils.getOptionItemDescList("NoB6","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB6 : " + occupationCnNoB6);
		
		try {
			occupationEnNoB7 = commonUtils.getOptionItemDescList("NoB7","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB7 : " + occupationEnNoB7);
		
		try {
			occupationCnNoB7 = commonUtils.getOptionItemDescList("NoB7","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB7 : " + occupationCnNoB7);
		
		try {
			occupationEnNoB8 = commonUtils.getOptionItemDescList("NoB8","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB8 : " + occupationEnNoB8);
		
		try {
			occupationCnNoB8 = commonUtils.getOptionItemDescList("NoB8","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB8 : " + occupationCnNoB8);
		
		try {
			occupationEnNoB9 = commonUtils.getOptionItemDescList("NoB9","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB9 : " + occupationEnNoB9);
		
		try {
			occupationCnNoB9 = commonUtils.getOptionItemDescList("NoB9","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB9 : " + occupationCnNoB9);
		
		try {
			occupationEnNoB10 = commonUtils.getOptionItemDescList("NoB10","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB10 : " + occupationEnNoB10);
		
		try {
			occupationCnNoB10 = commonUtils.getOptionItemDescList("NoB10","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB10 : " + occupationCnNoB10);
		
		try {
			occupationEnNoB11 = commonUtils.getOptionItemDescList("NoB11","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB11 : " + occupationEnNoB11);
		
		try {
			occupationCnNoB11 = commonUtils.getOptionItemDescList("NoB11","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB11 : " + occupationCnNoB11);
		
		try {
			occupationEnNoB12 = commonUtils.getOptionItemDescList("NoB12","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB12 : " + occupationEnNoB12);
		
		try {
			occupationCnNoB12 = commonUtils.getOptionItemDescList("NoB12","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB12 : " + occupationCnNoB12);
		
		try {
			occupationEnNoB13 = commonUtils.getOptionItemDescList("NoB13","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB13 : " + occupationEnNoB13);
		
		try {
			occupationCnNoB13 = commonUtils.getOptionItemDescList("NoB13","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB13 : " + occupationCnNoB13);
		
		try {
			occupationEnNoB14 = commonUtils.getOptionItemDescList("NoB14","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB14 : " + occupationEnNoB14);
		
		try {
			occupationCnNoB14 = commonUtils.getOptionItemDescList("NoB14","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB14 : " + occupationCnNoB14);
		
		try {
			occupationEnNoB15 = commonUtils.getOptionItemDescList("NoB15","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB15 : " + occupationEnNoB15);
		
		try {
			occupationCnNoB15 = commonUtils.getOptionItemDescList("NoB15","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB15 : " + occupationCnNoB15);
		
		try {
			occupationEnNoB16 = commonUtils.getOptionItemDescList("NoB16","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB16 : " + occupationEnNoB16);
		
		try {
			occupationCnNoB16 = commonUtils.getOptionItemDescList("NoB16","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB16 : " + occupationCnNoB16);
		
		try {
			occupationEnNoB17 = commonUtils.getOptionItemDescList("NoB17","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB17 : " + occupationEnNoB17);
		
		try {
			occupationCnNoB17 = commonUtils.getOptionItemDescList("NoB17","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB17 : " + occupationCnNoB17);
		
		try {
			occupationEnNoB18 = commonUtils.getOptionItemDescList("NoB18","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB18 : " + occupationEnNoB18);
		
		try {
			occupationCnNoB18 = commonUtils.getOptionItemDescList("NoB18","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB18 : " + occupationCnNoB18);
		
		try {
			occupationEnNoB19 = commonUtils.getOptionItemDescList("NoB19","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB19 : " + occupationEnNoB19);
		
		try {
			occupationCnNoB19 = commonUtils.getOptionItemDescList("NoB19","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB19 : " + occupationCnNoB19);
		
		try {
			occupationEnNoB20 = commonUtils.getOptionItemDescList("NoB20","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB20 : " + occupationEnNoB20);
		
		try {
			occupationCnNoB20 = commonUtils.getOptionItemDescList("NoB20","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB20 : " + occupationCnNoB20);
		
		try {
			occupationEnNoB21 = commonUtils.getOptionItemDescList("NoB21","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB21 : " + occupationEnNoB21);
		
		try {
			occupationCnNoB21 = commonUtils.getOptionItemDescList("NoB21","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB21 : " + occupationCnNoB21);
		
		try {
			occupationEnNoB22 = commonUtils.getOptionItemDescList("NoB22","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB22 : " + occupationEnNoB22);
		
		try {
			occupationCnNoB22 = commonUtils.getOptionItemDescList("NoB22","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB22 : " + occupationCnNoB22);
		
		try {
			occupationEnNoB23 = commonUtils.getOptionItemDescList("NoB23","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB23 : " + occupationEnNoB23);
		
		try {
			occupationCnNoB23 = commonUtils.getOptionItemDescList("NoB23","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB23 : " + occupationCnNoB23);
		
		try {
			occupationEnNoB24 = commonUtils.getOptionItemDescList("NoB24","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB24 : " + occupationEnNoB24);
		
		try {
			occupationCnNoB24 = commonUtils.getOptionItemDescList("NoB24","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB24 : " + occupationCnNoB24);
		
		try {
			bankCodeEN = commonUtils.getOptionItemDescList("BankCode","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("bankCodeEN : " + bankCodeEN);
		
		try {
			bankCodeCN = commonUtils.getOptionItemDescList("BankCode","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("bankCodeCN : " + bankCodeCN);
		try {
			branchCodeEN = commonUtils.getOptionItemDescList("Branchcode","EN",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("branchCodeEN : " + branchCodeEN);
		
		try {
			branchCodeCN = commonUtils.getOptionItemDescList("Branchcode","CH",type);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
			if("start".equals(type)){
				System.exit(0);
			}
		}
		logger.info("branchCodeCN : " + branchCodeCN);
	}
	
	public static List<OptionItemDesc> getOccupationByNob(CommonUtils commonUtils,String nobCode,String language,String type, HttpServletRequest request){
		List<OptionItemDesc> occupation = null;
		try {
			occupation = commonUtils.getOptionItemDescList(nobCode,language,type, request);
		} catch (Exception e) {
			logger.error("error : "+e.getMessage());
		}
		logger.info("occupation : " + occupation);
		return occupation;
	}
}
