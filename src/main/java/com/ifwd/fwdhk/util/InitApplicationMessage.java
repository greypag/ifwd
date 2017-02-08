package com.ifwd.fwdhk.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.ServletContext;
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
import com.ifwd.fwdhk.message.ECommConnector;
import com.ifwd.fwdhk.model.DistrictBean;
import com.ifwd.fwdhk.model.OptionItemDesc;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

@SuppressWarnings("rawtypes")
@Component
public class InitApplicationMessage implements ApplicationListener {

	private final static Logger logger = LoggerFactory
			.getLogger(InitApplicationMessage.class);

	@Autowired
	private CommonUtils commonUtils;

	@Autowired
	protected ECommConnector connector;

	@Autowired
	private ServletContext application;

	public static List<OptionItemDesc> maritalStatusesEN;
	public static List<OptionItemDesc> maritalStatusesCN;

	public static LinkedHashMap<String, String> areaEN;
	public static LinkedHashMap<String, String> areaCN;
	public static LinkedHashMap<String, String> netFloorAreaEN;
	public static LinkedHashMap<String, String> netFloorAreaCN;
	public static List<DistrictBean> districtEN;
	public static List<DistrictBean> districtCN;
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
	public static List<OptionItemDesc> contactTimeEN;
	public static List<OptionItemDesc> contactTimeCN;

	@Override
	public void onApplicationEvent(ApplicationEvent event) {
		if (event instanceof ContextStartedEvent
				|| event instanceof ContextRefreshedEvent) {
			if (true) {
				init(commonUtils,"start",connector,application);
				//writeAllSessionObjects();
			} else {
				readAllSessionObjects();
			}
				
			
			
		}
	}
	
	
	private void readAllSessionObjects() {
		etCsContactPreferredDayEN = readSessionObject("etCsContactPreferredDayEN");
		etCsContactPreferredDayCN = readSessionObject("etCsContactPreferredDayCN");
		etCsContactPreferredTimeSlotEN = readSessionObject("etCsContactPreferredTimeSlotEN");
		etCsContactPreferredTimeSlotCN = readSessionObject("etCsContactPreferredTimeSlotCN");
		etEnquiryTypeEN = readSessionObject("etEnquiryTypeEN");
		etEnquiryTypeCN = readSessionObject("etEnquiryTypeCN");
		etLiquidAssetEN = readSessionObject("etLiquidAssetEN");
		etLiquidAssetCN = readSessionObject("etLiquidAssetCN");
		etAmountOtherSourceEN = readSessionObject("etAmountOtherSourceEN");
		etAmountOtherSourceCN = readSessionObject("etAmountOtherSourceCN");
		etEducationLevelEN = readSessionObject("etEducationLevelEN");
		etEducationLevelCN = readSessionObject("etEducationLevelCN");
		occupationEnNoB1 = readSessionObject("occupationEnNoB1");
		occupationCnNoB1 = readSessionObject("occupationCnNoB1");
		occupationEnNoB2 = readSessionObject("occupationEnNoB2");
		occupationCnNoB2 = readSessionObject("occupationCnNoB2");
		occupationEnNoB3 = readSessionObject("occupationEnNoB3");
		occupationCnNoB3 = readSessionObject("occupationCnNoB3");
		occupationEnNoB4 = readSessionObject("occupationEnNoB4");
		occupationCnNoB4 = readSessionObject("occupationCnNoB4");
		occupationEnNoB5 = readSessionObject("occupationEnNoB5");
		occupationCnNoB5 = readSessionObject("occupationCnNoB5");
		occupationEnNoB6 = readSessionObject("occupationEnNoB6");
		occupationCnNoB6 = readSessionObject("occupationCnNoB6");
		occupationEnNoB7 = readSessionObject("occupationEnNoB7");
		occupationCnNoB7 = readSessionObject("occupationCnNoB7");
		occupationEnNoB8 = readSessionObject("occupationEnNoB8");
		occupationCnNoB8 = readSessionObject("occupationCnNoB8");
		occupationEnNoB9 = readSessionObject("occupationEnNoB9");
		occupationCnNoB9 = readSessionObject("occupationCnNoB9");
		occupationEnNoB10 = readSessionObject("occupationEnNoB10");
		occupationCnNoB10 = readSessionObject("occupationCnNoB10");
		occupationEnNoB11 = readSessionObject("occupationEnNoB11");
		occupationCnNoB11 = readSessionObject("occupationCnNoB11");
		occupationEnNoB12 = readSessionObject("occupationEnNoB12");
		occupationCnNoB12 = readSessionObject("occupationCnNoB12");
		occupationEnNoB13 = readSessionObject("occupationEnNoB13");
		occupationCnNoB13 = readSessionObject("occupationCnNoB13");
		occupationEnNoB14 = readSessionObject("occupationEnNoB14");
		occupationCnNoB14 = readSessionObject("occupationCnNoB14");
		occupationEnNoB15 = readSessionObject("occupationEnNoB15");
		occupationCnNoB15 = readSessionObject("occupationCnNoB15");
		occupationEnNoB16 = readSessionObject("occupationEnNoB16");
		occupationCnNoB16 = readSessionObject("occupationCnNoB16");
		occupationEnNoB17 = readSessionObject("occupationEnNoB17");
		occupationCnNoB17 = readSessionObject("occupationCnNoB17");
		occupationEnNoB18 = readSessionObject("occupationEnNoB18");
		occupationCnNoB18 = readSessionObject("occupationCnNoB18");
		occupationEnNoB19 = readSessionObject("occupationEnNoB19");
		occupationCnNoB19 = readSessionObject("occupationCnNoB19");
		occupationEnNoB20 = readSessionObject("occupationEnNoB20");
		occupationCnNoB20 = readSessionObject("occupationCnNoB20");
		occupationEnNoB21 = readSessionObject("occupationEnNoB21");
		occupationCnNoB21 = readSessionObject("occupationCnNoB21");
		occupationEnNoB22 = readSessionObject("occupationEnNoB22");
		occupationCnNoB22 = readSessionObject("occupationCnNoB22");
		occupationEnNoB23 = readSessionObject("occupationEnNoB23");
		occupationCnNoB23 = readSessionObject("occupationCnNoB23");
		occupationEnNoB24 = readSessionObject("occupationEnNoB24");
		occupationCnNoB24 = readSessionObject("occupationCnNoB24");
		bankCodeEN = readSessionObject("bankCodeEN");
		bankCodeCN = readSessionObject("bankCodeCN");
		branchCodeEN = readSessionObject("branchCodeEN");
		branchCodeCN = readSessionObject("branchCodeCN");
		contactTimeEN = readSessionObject("contactTimeEN");
		contactTimeCN = readSessionObject("contactTimeCN");

	}
	

	private void writeAllSessionObjects() {
		writeSessionObject("etCsContactPreferredDayEN",etCsContactPreferredDayEN);
		writeSessionObject("etCsContactPreferredDayCN",etCsContactPreferredDayCN);
		writeSessionObject("etCsContactPreferredTimeSlotEN",etCsContactPreferredTimeSlotEN);
		writeSessionObject("etCsContactPreferredTimeSlotCN",etCsContactPreferredTimeSlotCN);
		writeSessionObject("etEnquiryTypeEN",etEnquiryTypeEN);
		writeSessionObject("etEnquiryTypeCN",etEnquiryTypeCN);
		writeSessionObject("etLiquidAssetEN",etLiquidAssetEN);
		writeSessionObject("etLiquidAssetCN",etLiquidAssetCN);
		writeSessionObject("etAmountOtherSourceEN",etAmountOtherSourceEN);
		writeSessionObject("etAmountOtherSourceCN",etAmountOtherSourceCN);
		writeSessionObject("etEducationLevelEN",etEducationLevelEN);
		writeSessionObject("etEducationLevelCN",etEducationLevelCN);
		writeSessionObject("occupationEnNoB1",occupationEnNoB1);
		writeSessionObject("occupationCnNoB1",occupationCnNoB1);
		writeSessionObject("occupationEnNoB2",occupationEnNoB2);
		writeSessionObject("occupationCnNoB2",occupationCnNoB2);
		writeSessionObject("occupationEnNoB3",occupationEnNoB3);
		writeSessionObject("occupationCnNoB3",occupationCnNoB3);
		writeSessionObject("occupationEnNoB4",occupationEnNoB4);
		writeSessionObject("occupationCnNoB4",occupationCnNoB4);
		writeSessionObject("occupationEnNoB5",occupationEnNoB5);
		writeSessionObject("occupationCnNoB5",occupationCnNoB5);
		writeSessionObject("occupationEnNoB6",occupationEnNoB6);
		writeSessionObject("occupationCnNoB6",occupationCnNoB6);
		writeSessionObject("occupationEnNoB7",occupationEnNoB7);
		writeSessionObject("occupationCnNoB7",occupationCnNoB7);
		writeSessionObject("occupationEnNoB8",occupationEnNoB8);
		writeSessionObject("occupationCnNoB8",occupationCnNoB8);
		writeSessionObject("occupationEnNoB9",occupationEnNoB9);
		writeSessionObject("occupationCnNoB9",occupationCnNoB9);
		writeSessionObject("occupationEnNoB10",occupationEnNoB10);
		writeSessionObject("occupationCnNoB10",occupationCnNoB10);
		writeSessionObject("occupationEnNoB11",occupationEnNoB11);
		writeSessionObject("occupationCnNoB11",occupationCnNoB11);
		writeSessionObject("occupationEnNoB12",occupationEnNoB12);
		writeSessionObject("occupationCnNoB12",occupationCnNoB12);
		writeSessionObject("occupationEnNoB13",occupationEnNoB13);
		writeSessionObject("occupationCnNoB13",occupationCnNoB13);
		writeSessionObject("occupationEnNoB14",occupationEnNoB14);
		writeSessionObject("occupationCnNoB14",occupationCnNoB14);
		writeSessionObject("occupationEnNoB15",occupationEnNoB15);
		writeSessionObject("occupationCnNoB15",occupationCnNoB15);
		writeSessionObject("occupationEnNoB16",occupationEnNoB16);
		writeSessionObject("occupationCnNoB16",occupationCnNoB16);
		writeSessionObject("occupationEnNoB17",occupationEnNoB17);
		writeSessionObject("occupationCnNoB17",occupationCnNoB17);
		writeSessionObject("occupationEnNoB18",occupationEnNoB18);
		writeSessionObject("occupationCnNoB18",occupationCnNoB18);
		writeSessionObject("occupationEnNoB19",occupationEnNoB19);
		writeSessionObject("occupationCnNoB19",occupationCnNoB19);
		writeSessionObject("occupationEnNoB20",occupationEnNoB20);
		writeSessionObject("occupationCnNoB20",occupationCnNoB20);
		writeSessionObject("occupationEnNoB21",occupationEnNoB21);
		writeSessionObject("occupationCnNoB21",occupationCnNoB21);
		writeSessionObject("occupationEnNoB22",occupationEnNoB22);
		writeSessionObject("occupationCnNoB22",occupationCnNoB22);
		writeSessionObject("occupationEnNoB23",occupationEnNoB23);
		writeSessionObject("occupationCnNoB23",occupationCnNoB23);
		writeSessionObject("occupationEnNoB24",occupationEnNoB24);
		writeSessionObject("occupationCnNoB24",occupationCnNoB24);
		writeSessionObject("bankCodeEN",bankCodeEN);
		writeSessionObject("bankCodeCN",bankCodeCN);
		writeSessionObject("branchCodeEN",branchCodeEN);
		writeSessionObject("branchCodeCN",branchCodeCN);
		writeSessionObject("contactTimeEN",contactTimeEN);
		writeSessionObject("contactTimeCN",contactTimeCN);

		
	}

	public static void writeSessionObject(String type, List<OptionItemDesc> l) {
		try {
			FileOutputStream out = new FileOutputStream("c:\\temp\\" + type + ".out");
			ObjectOutputStream oos = new ObjectOutputStream(out);
			oos.writeObject(l);
			oos.flush();
		} catch (Exception e) {
			System.out.println("Problem serializing: " + e);
			e.printStackTrace();
		} 

	}
	
	@SuppressWarnings("unchecked")
	public static List<OptionItemDesc> readSessionObject(String type) {
		try {
	      FileInputStream in = new FileInputStream("c:\\temp\\" + type + ".out");
	      ObjectInputStream ois = new ObjectInputStream(in);
	      return (List<OptionItemDesc>) (ois.readObject());
	    } catch (Exception e) {
	      System.out.println("Problem serializing: " + e);
	      e.printStackTrace();
	      return null;
	    }
		

	}
	

	public static void init(CommonUtils commonUtils, String type,
			ECommConnector connector, ServletContext application) {
		if ("start".equals(type)) {
			logger.info("init : start application");
		} else {
			logger.info("init : reload api data");
		}
		try {
			maritalStatusesEN = commonUtils.getOptionItemDescList(
					"maritalStatus", "EN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("maritalStatusesEN : " + maritalStatusesEN);

		try {
			maritalStatusesCN = commonUtils.getOptionItemDescList(
					"maritalStatus", "CH", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("maritalStatusesCN : " + maritalStatusesCN);

		try {
			areaEN = commonUtils.getArea("EN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("areaEN : " + areaEN);

		try {
			areaCN = commonUtils.getArea("CN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("areaCN : " + areaCN);

		try {
			netFloorAreaEN = commonUtils.getNetFloorArea("EN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("netFloorAreaEN : " + netFloorAreaEN);

		try {
			netFloorAreaCN = commonUtils.getNetFloorArea("CN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("netFloorAreaCN : " + netFloorAreaCN);

		try {
			districtEN = commonUtils.getDistrict("EN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("districtEN : " + districtEN);

		try {
			districtCN = commonUtils.getDistrict("CN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("districtCN : " + districtCN);

		try {
			savieDistrictEN = commonUtils.getOptionItemDescList(
					"savieDistrict", "EN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("savieDistrictEN : " + savieDistrictEN);

		try {
			savieDistrictCN = commonUtils.getOptionItemDescList(
					"savieDistrict", "CH", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("savieDistrictCH : " + savieDistrictCN);

		try {
			employmentStatusEN = commonUtils.getOptionItemDescList(
					"employmentStatus", "EN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("employmentStatusEN : " + employmentStatusEN);

		try {
			employmentStatusCN = commonUtils.getOptionItemDescList(
					"employmentStatus", "CH", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("employmentStatusCN : " + employmentStatusCN);

		try {
			nationalityEN = commonUtils.getOptionItemDescList("nationality",
					"EN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("nationalityEN : " + nationalityEN);

		try {
			nationalityCN = commonUtils.getOptionItemDescList("nationality",
					"CH", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("nationalityCN : " + nationalityCN);

		try {
			occupationEN = commonUtils.getOptionItemDescList("occupation",
					"EN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationEN : " + occupationEN);

		try {
			occupationCN = commonUtils.getOptionItemDescList("occupation",
					"CH", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationCN : " + occupationCN);

		try {
			natureOfBusinessEN = commonUtils.getOptionItemDescList(
					"natureOfBusiness", "EN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("natureOfBusinessEN : " + natureOfBusinessEN);

		try {
			natureOfBusinessCN = commonUtils.getOptionItemDescList(
					"natureOfBusiness", "CH", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("natureOfBusinessCN : " + natureOfBusinessCN);

		try {
			contactTimeEN = commonUtils.getOptionItemDescList("VCCT", "EN",
					type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("contactTimeEN : " + contactTimeEN);

		try {
			contactTimeCN = commonUtils.getOptionItemDescList("VCCT", "CN",
					type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("contactTimeCN : " + contactTimeCN);

		try {
			nob_occListEN = new HashMap<String, List<OptionItemDesc>>();
			String itemCode = "";
			for (OptionItemDesc item : natureOfBusinessEN) {
				itemCode = item.getItemCode();
				nob_occListEN
						.put(itemCode, commonUtils.getOptionItemDescList(
								itemCode, "EN", type));
			}
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("natureOfBusiness_OccupationEN : " + nob_occListEN);

		try {
			nob_occListCN = new HashMap<String, List<OptionItemDesc>>();
			String itemCode = "";
			for (OptionItemDesc item : natureOfBusinessEN) {
				itemCode = item.getItemCode();
				nob_occListCN
						.put(itemCode, commonUtils.getOptionItemDescList(
								itemCode, "CH", type));
			}
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("natureOfBusiness_OccupationCN : " + nob_occListCN);

		try {
			monthlyPersonalIncomeEN = commonUtils.getOptionItemDescList(
					"monthlyPersonalIncome", "EN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("monthlyPersonalIncomeEN : " + monthlyPersonalIncomeEN);

		try {
			monthlyPersonalIncomeCN = commonUtils.getOptionItemDescList(
					"monthlyPersonalIncome", "CH", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("monthlyPersonalIncomeCN : " + monthlyPersonalIncomeCN);

		try {
			savieBeneficiaryRelationshipEN = commonUtils.getOptionItemDescList(
					"beneficiaryInfo", "EN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("savieBeneficiaryRelationshipEN : "
				+ savieBeneficiaryRelationshipEN);

		try {
			savieBeneficiaryRelationshipCN = commonUtils.getOptionItemDescList(
					"beneficiaryInfo", "CH", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("savieBeneficiaryRelationshipCN : "
				+ savieBeneficiaryRelationshipCN);

		try {
			lifeBeneficiaryRelationshipEN = commonUtils.getOptionItemDescList(
					"lifeBeneficiary", "EN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("lifeBeneficiaryRelationshipEN : "
				+ lifeBeneficiaryRelationshipEN);

		try {
			lifeBeneficiaryRelationshipCN = commonUtils.getOptionItemDescList(
					"lifeBeneficiary", "CH", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("lifeBeneficiaryRelationshipCN : "
				+ lifeBeneficiaryRelationshipCN);

		try {
			placeOfBirthEN = commonUtils.getOptionItemDescList("placeOfBirth",
					"EN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("placeOfBirthEN : " + placeOfBirthEN);

		try {
			placeOfBirthCN = commonUtils.getOptionItemDescList("placeOfBirth",
					"CH", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("placeOfBirthCN : " + placeOfBirthCN);

		try {
			savieAnsEN = commonUtils.getOptionItemDescList("SavieAns", "EN",
					type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("savieAnsEN : " + savieAnsEN);

		try {
			savieAnsCN = commonUtils.getOptionItemDescList("SavieAns", "CH",
					type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("savieAnsCN : " + savieAnsCN);

		try {
			commonUtils.getImageConfig(type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("signatureWidth : " + signatureWidth + "signatureHeight : "
				+ signatureHeight);

		try {
			commonUtils.getServiceCentre("EN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("serviceCentreEN : " + serviceCentreEN);

		try {
			commonUtils.getServiceCentre("CH", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("serviceCentreCN : " + serviceCentreCN);

		try {
			etCsContactPreferredDayEN = commonUtils.getOptionItemDescList(
					"csContactPreferredDay", "EN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("etCsContactPreferredDayEN : " + etCsContactPreferredDayEN);

		try {
			etCsContactPreferredDayCN = commonUtils.getOptionItemDescList(
					"csContactPreferredDay", "CH", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("etCsContactPreferredDayCN : " + etCsContactPreferredDayCN);

		try {
			etCsContactPreferredTimeSlotEN = commonUtils.getOptionItemDescList(
					"csContactPreferredTimeSlot", "EN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("etCsContactPreferredTimeSlotEN : "
				+ etCsContactPreferredTimeSlotEN);

		try {
			etCsContactPreferredTimeSlotCN = commonUtils.getOptionItemDescList(
					"csContactPreferredTimeSlot", "CH", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("etCsContactPreferredTimeSlotCN : "
				+ etCsContactPreferredTimeSlotCN);

		try {
			etEnquiryTypeEN = commonUtils.getOptionItemDescList("enquiryType",
					"EN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("etEnquiryTypeEN : " + etEnquiryTypeEN);

		try {
			etEnquiryTypeCN = commonUtils.getOptionItemDescList("enquiryType",
					"CH", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("etEnquiryTypeCN : " + etEnquiryTypeCN);

		try {
			etLiquidAssetEN = commonUtils.getOptionItemDescList("liquidAsset",
					"EN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("etLiquidAssetEN : " + etLiquidAssetEN);

		try {
			etLiquidAssetCN = commonUtils.getOptionItemDescList("liquidAsset",
					"CH", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("etLiquidAssetCN : " + etLiquidAssetCN);

		try {
			etAmountOtherSourceEN = commonUtils.getOptionItemDescList(
					"amountOtherSource", "EN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("etAmountOtherSourceEN : " + etAmountOtherSourceEN);

		try {
			etAmountOtherSourceCN = commonUtils.getOptionItemDescList(
					"amountOtherSource", "CH", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("etAmountOtherSourceCN : " + etAmountOtherSourceCN);

		try {
			etEducationLevelEN = commonUtils.getOptionItemDescList(
					"educationLevel", "EN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("etEducationLevelEN : " + etEducationLevelEN);

		try {
			etEducationLevelCN = commonUtils.getOptionItemDescList(
					"educationLevel", "CH", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("etEducationLevelCN : " + etEducationLevelCN);

		try {
			occupationEnNoB1 = commonUtils.getOptionItemDescList("NoB1", "EN",
					type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB1 : " + occupationEnNoB1);

		try {
			occupationCnNoB1 = commonUtils.getOptionItemDescList("NoB1", "CH",
					type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB1 : " + occupationCnNoB1);

		try {
			occupationEnNoB2 = commonUtils.getOptionItemDescList("NoB2", "EN",
					type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB2 : " + occupationEnNoB2);

		try {
			occupationCnNoB2 = commonUtils.getOptionItemDescList("NoB2", "CH",
					type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB2 : " + occupationCnNoB2);

		try {
			occupationEnNoB3 = commonUtils.getOptionItemDescList("NoB3", "EN",
					type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB3 : " + occupationEnNoB3);

		try {
			occupationCnNoB3 = commonUtils.getOptionItemDescList("NoB3", "CH",
					type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB3 : " + occupationCnNoB3);

		try {
			occupationEnNoB4 = commonUtils.getOptionItemDescList("NoB4", "EN",
					type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB4 : " + occupationEnNoB4);

		try {
			occupationCnNoB4 = commonUtils.getOptionItemDescList("NoB4", "CH",
					type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB4 : " + occupationCnNoB4);

		try {
			occupationEnNoB5 = commonUtils.getOptionItemDescList("NoB5", "EN",
					type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB5 : " + occupationEnNoB5);

		try {
			occupationCnNoB5 = commonUtils.getOptionItemDescList("NoB5", "CH",
					type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB5 : " + occupationCnNoB5);

		try {
			occupationEnNoB6 = commonUtils.getOptionItemDescList("NoB6", "EN",
					type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB6 : " + occupationEnNoB6);

		try {
			occupationCnNoB6 = commonUtils.getOptionItemDescList("NoB6", "CH",
					type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB6 : " + occupationCnNoB6);

		try {
			occupationEnNoB7 = commonUtils.getOptionItemDescList("NoB7", "EN",
					type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB7 : " + occupationEnNoB7);

		try {
			occupationCnNoB7 = commonUtils.getOptionItemDescList("NoB7", "CH",
					type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB7 : " + occupationCnNoB7);

		try {
			occupationEnNoB8 = commonUtils.getOptionItemDescList("NoB8", "EN",
					type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB8 : " + occupationEnNoB8);

		try {
			occupationCnNoB8 = commonUtils.getOptionItemDescList("NoB8", "CH",
					type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB8 : " + occupationCnNoB8);

		try {
			occupationEnNoB9 = commonUtils.getOptionItemDescList("NoB9", "EN",
					type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB9 : " + occupationEnNoB9);

		try {
			occupationCnNoB9 = commonUtils.getOptionItemDescList("NoB9", "CH",
					type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB9 : " + occupationCnNoB9);

		try {
			occupationEnNoB10 = commonUtils.getOptionItemDescList("NoB10",
					"EN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB10 : " + occupationEnNoB10);

		try {
			occupationCnNoB10 = commonUtils.getOptionItemDescList("NoB10",
					"CH", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB10 : " + occupationCnNoB10);

		try {
			occupationEnNoB11 = commonUtils.getOptionItemDescList("NoB11",
					"EN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB11 : " + occupationEnNoB11);

		try {
			occupationCnNoB11 = commonUtils.getOptionItemDescList("NoB11",
					"CH", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB11 : " + occupationCnNoB11);

		try {
			occupationEnNoB12 = commonUtils.getOptionItemDescList("NoB12",
					"EN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB12 : " + occupationEnNoB12);

		try {
			occupationCnNoB12 = commonUtils.getOptionItemDescList("NoB12",
					"CH", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB12 : " + occupationCnNoB12);

		try {
			occupationEnNoB13 = commonUtils.getOptionItemDescList("NoB13",
					"EN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB13 : " + occupationEnNoB13);

		try {
			occupationCnNoB13 = commonUtils.getOptionItemDescList("NoB13",
					"CH", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB13 : " + occupationCnNoB13);

		try {
			occupationEnNoB14 = commonUtils.getOptionItemDescList("NoB14",
					"EN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB14 : " + occupationEnNoB14);

		try {
			occupationCnNoB14 = commonUtils.getOptionItemDescList("NoB14",
					"CH", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB14 : " + occupationCnNoB14);

		try {
			occupationEnNoB15 = commonUtils.getOptionItemDescList("NoB15",
					"EN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB15 : " + occupationEnNoB15);

		try {
			occupationCnNoB15 = commonUtils.getOptionItemDescList("NoB15",
					"CH", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB15 : " + occupationCnNoB15);

		try {
			occupationEnNoB16 = commonUtils.getOptionItemDescList("NoB16",
					"EN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB16 : " + occupationEnNoB16);

		try {
			occupationCnNoB16 = commonUtils.getOptionItemDescList("NoB16",
					"CH", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB16 : " + occupationCnNoB16);

		try {
			occupationEnNoB17 = commonUtils.getOptionItemDescList("NoB17",
					"EN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB17 : " + occupationEnNoB17);

		try {
			occupationCnNoB17 = commonUtils.getOptionItemDescList("NoB17",
					"CH", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB17 : " + occupationCnNoB17);

		try {
			occupationEnNoB18 = commonUtils.getOptionItemDescList("NoB18",
					"EN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB18 : " + occupationEnNoB18);

		try {
			occupationCnNoB18 = commonUtils.getOptionItemDescList("NoB18",
					"CH", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB18 : " + occupationCnNoB18);

		try {
			occupationEnNoB19 = commonUtils.getOptionItemDescList("NoB19",
					"EN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB19 : " + occupationEnNoB19);

		try {
			occupationCnNoB19 = commonUtils.getOptionItemDescList("NoB19",
					"CH", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB19 : " + occupationCnNoB19);

		try {
			occupationEnNoB20 = commonUtils.getOptionItemDescList("NoB20",
					"EN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB20 : " + occupationEnNoB20);

		try {
			occupationCnNoB20 = commonUtils.getOptionItemDescList("NoB20",
					"CH", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB20 : " + occupationCnNoB20);

		try {
			occupationEnNoB21 = commonUtils.getOptionItemDescList("NoB21",
					"EN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB21 : " + occupationEnNoB21);

		try {
			occupationCnNoB21 = commonUtils.getOptionItemDescList("NoB21",
					"CH", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB21 : " + occupationCnNoB21);

		try {
			occupationEnNoB22 = commonUtils.getOptionItemDescList("NoB22",
					"EN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB22 : " + occupationEnNoB22);

		try {
			occupationCnNoB22 = commonUtils.getOptionItemDescList("NoB22",
					"CH", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB22 : " + occupationCnNoB22);

		try {
			occupationEnNoB23 = commonUtils.getOptionItemDescList("NoB23",
					"EN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB23 : " + occupationEnNoB23);

		try {
			occupationCnNoB23 = commonUtils.getOptionItemDescList("NoB23",
					"CH", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB23 : " + occupationCnNoB23);

		try {
			occupationEnNoB24 = commonUtils.getOptionItemDescList("NoB24",
					"EN", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationEnNoB24 : " + occupationEnNoB24);

		try {
			occupationCnNoB24 = commonUtils.getOptionItemDescList("NoB24",
					"CH", type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("occupationCnNoB24 : " + occupationCnNoB24);

		try {
			bankCodeEN = commonUtils.getOptionItemDescList("BankCode", "EN",
					type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("bankCodeEN : " + bankCodeEN);

		try {
			bankCodeCN = commonUtils.getOptionItemDescList("BankCode", "CH",
					type);
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("bankCodeCN : " + bankCodeCN);
		try {
			branchCodeEN = new ArrayList<OptionItemDesc>();
			for (OptionItemDesc item : InitApplicationMessage.bankCodeEN) {
				branchCodeEN.addAll(commonUtils.getOptionItemDescList(
						item.getItemCode(), "EN", type));
			}
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("branchCodeEN : " + branchCodeEN);

		try {
			branchCodeCN = new ArrayList<OptionItemDesc>();
			for (OptionItemDesc item : InitApplicationMessage.bankCodeCN) {
				branchCodeCN.addAll(commonUtils.getOptionItemDescList(
						item.getItemCode(), "CN", type));
			}
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
			if ("start".equals(type)) {
				System.exit(0);
			}
		}
		logger.info("branchCodeCN : " + branchCodeCN);

		// Map<String,Map<String,String>> allMessages = null;
		// try {
		// MessageResponse messageResponse = connector.getAllMessage();
		// allMessages = messageResponse.getAllMessages();
		// application.setAttribute("allMessages", allMessages);
		// } catch (Exception e) {
		// logger.error("error : "+e.getMessage());
		// if("start".equals(type)){
		// System.exit(0);
		// }
		// }
		// logger.info("allMessages : " + allMessages);
	}

	public static List<OptionItemDesc> getOccupationByNob(
			CommonUtils commonUtils, String nobCode, String language,
			String type, HttpServletRequest request) {
		List<OptionItemDesc> occupation = null;
		try {
			if (nobCode.indexOf("Bank") == 0) {
				if (language.equals("EN")) {
					occupation = InitApplicationMessage.branchCodeEN;
				} else {
					occupation = InitApplicationMessage.branchCodeCN;
				}
			} else {
				switch (nobCode) {
				case "NoB1":
					if (language.equals("EN")) {
						occupation = InitApplicationMessage.occupationEnNoB1;
					} else {
						occupation = InitApplicationMessage.occupationCnNoB1;
					}
					break;
				case "NoB10":
					if (language.equals("EN")) {
						occupation = InitApplicationMessage.occupationEnNoB10;
					} else {
						occupation = InitApplicationMessage.occupationCnNoB10;
					}
					break;
				case "NoB11":
					if (language.equals("EN")) {
						occupation = InitApplicationMessage.occupationEnNoB11;
					} else {
						occupation = InitApplicationMessage.occupationCnNoB11;
					}
					break;
				case "NoB12":
					if (language.equals("EN")) {
						occupation = InitApplicationMessage.occupationEnNoB12;
					} else {
						occupation = InitApplicationMessage.occupationCnNoB12;
					}
					break;
				case "NoB13":
					if (language.equals("EN")) {
						occupation = InitApplicationMessage.occupationEnNoB13;
					} else {
						occupation = InitApplicationMessage.occupationCnNoB13;
					}
					break;
				case "NoB14":
					if (language.equals("EN")) {
						occupation = InitApplicationMessage.occupationEnNoB14;
					} else {
						occupation = InitApplicationMessage.occupationCnNoB14;
					}
					break;
				case "NoB15":
					if (language.equals("EN")) {
						occupation = InitApplicationMessage.occupationEnNoB15;
					} else {
						occupation = InitApplicationMessage.occupationCnNoB15;
					}
					break;
				case "NoB16":
					if (language.equals("EN")) {
						occupation = InitApplicationMessage.occupationEnNoB16;
					} else {
						occupation = InitApplicationMessage.occupationCnNoB16;
					}
					break;
				case "NoB17":
					if (language.equals("EN")) {
						occupation = InitApplicationMessage.occupationEnNoB17;
					} else {
						occupation = InitApplicationMessage.occupationCnNoB17;
					}
					break;
				case "NoB18":
					if (language.equals("EN")) {
						occupation = InitApplicationMessage.occupationEnNoB18;
					} else {
						occupation = InitApplicationMessage.occupationCnNoB18;
					}
					break;
				case "NoB19":
					if (language.equals("EN")) {
						occupation = InitApplicationMessage.occupationEnNoB19;
					} else {
						occupation = InitApplicationMessage.occupationCnNoB19;
					}
					break;
				case "NoB2":
					if (language.equals("EN")) {
						occupation = InitApplicationMessage.occupationEnNoB2;
					} else {
						occupation = InitApplicationMessage.occupationCnNoB2;
					}
					break;
				case "NoB20":
					if (language.equals("EN")) {
						occupation = InitApplicationMessage.occupationEnNoB20;
					} else {
						occupation = InitApplicationMessage.occupationCnNoB20;
					}
					break;
				case "NoB21":
					if (language.equals("EN")) {
						occupation = InitApplicationMessage.occupationEnNoB21;
					} else {
						occupation = InitApplicationMessage.occupationCnNoB21;
					}
					break;
				case "NoB22":
					if (language.equals("EN")) {
						occupation = InitApplicationMessage.occupationEnNoB22;
					} else {
						occupation = InitApplicationMessage.occupationCnNoB22;
					}
					break;
				case "NoB23":
					if (language.equals("EN")) {
						occupation = InitApplicationMessage.occupationEnNoB23;
					} else {
						occupation = InitApplicationMessage.occupationCnNoB23;
					}
					break;
				case "NoB24":
					if (language.equals("EN")) {
						occupation = InitApplicationMessage.occupationEnNoB24;
					} else {
						occupation = InitApplicationMessage.occupationCnNoB24;
					}
					break;
				case "NoB3":
					if (language.equals("EN")) {
						occupation = InitApplicationMessage.occupationEnNoB3;
					} else {
						occupation = InitApplicationMessage.occupationCnNoB3;
					}
					break;
				case "NoB4":
					if (language.equals("EN")) {
						occupation = InitApplicationMessage.occupationEnNoB4;
					} else {
						occupation = InitApplicationMessage.occupationCnNoB4;
					}
					break;
				case "NoB5":
					if (language.equals("EN")) {
						occupation = InitApplicationMessage.occupationEnNoB5;
					} else {
						occupation = InitApplicationMessage.occupationCnNoB5;
					}
					break;
				case "NoB6":
					if (language.equals("EN")) {
						occupation = InitApplicationMessage.occupationEnNoB6;
					} else {
						occupation = InitApplicationMessage.occupationCnNoB6;
					}
					break;
				case "NoB7":
					if (language.equals("EN")) {
						occupation = InitApplicationMessage.occupationEnNoB7;
					} else {
						occupation = InitApplicationMessage.occupationCnNoB7;
					}
					break;
				case "NoB8":
					if (language.equals("EN")) {
						occupation = InitApplicationMessage.occupationEnNoB8;
					} else {
						occupation = InitApplicationMessage.occupationCnNoB8;
					}
					break;
				case "NoB9":
					if (language.equals("EN")) {
						occupation = InitApplicationMessage.occupationEnNoB9;
					} else {
						occupation = InitApplicationMessage.occupationCnNoB9;
					}
					break;
				}
			}
		} catch (Exception e) {
			logger.error("error : " + e.getMessage());
		}
		logger.info("occupation : " + occupation);
		return occupation;
	}
}
