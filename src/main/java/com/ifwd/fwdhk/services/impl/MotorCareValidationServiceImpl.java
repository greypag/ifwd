package com.ifwd.fwdhk.services.impl;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;
import static org.apache.commons.lang3.StringUtils.isBlank;
import static org.apache.commons.lang3.StringUtils.length;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.time.DateUtils;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fwd.model.motor.CarDetail;
import com.fwd.model.motor.Driver;
import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.model.OccupationBean;
import com.ifwd.fwdhk.model.motor.MotorCareDetails;
import com.ifwd.fwdhk.services.MotorCareValidationService;

@Service
public class MotorCareValidationServiceImpl implements
		MotorCareValidationService {

	private static final String DEFAULT_TOMCAT_COMP_PLANCODE = "Comp";
	private static final String DEFAULT_TOMCAT_THIRD_PLANCODE = "Third";
	
	private final static Logger logger = LoggerFactory.getLogger(MotorCareValidationServiceImpl.class);
	
	@Autowired
	protected RestServiceDao restService;

	private boolean isStandardOccupation(String occupationCode){
		if(occupationCode==null || occupationCode.isEmpty()){
			return true;
		}
		
		List<OccupationBean> motorOccupationList = getMotorOccupationList();
		for(OccupationBean occupation: motorOccupationList){
			if(occupation!=null && occupationCode.equals(occupation.getCode()))
			{
				return occupation.isStandard();
			}
		}
		return true;
	}
	
	@SuppressWarnings("unchecked")
	public List<OccupationBean> getMotorOccupationList(){
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext("motor_occupation.xml");
		List<OccupationBean> motorOccupationList = (List<OccupationBean>) context.getBean("motorOccupationList");
//		logger.info("motorOccupationList:"+motorOccupationList);
		return motorOccupationList;
	}	
	
	
	private String urlEncodeInputSpace (String input) throws UnsupportedEncodingException {
		return StringUtils.replace(URLEncoder.encode(input, "UTF-8"), "+", "%20");
	}
	
	private HttpStatus validationCarMakeMode(String makeCode, String carModel){
//		Make/Model //417
//		Electronic car //414
		if(makeCode==null || makeCode.isEmpty() 
				|| carModel==null || carModel.isEmpty()){
			return HttpStatus.OK; 
		}
		
		try {
			String encodedMake = urlEncodeInputSpace(makeCode);
			String encodedCarModel = urlEncodeInputSpace(carModel);			
			String url = UserRestURIConstants.MOTOR_CARE_CARDETAILS_SUPPLEMENT_SECOND_GET + "?makeCode=" + encodedMake + "&carModel=" + encodedCarModel;
			
			JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET, url, COMMON_HEADERS, null);
			
			logger.debug("validationCarMakeMode responseJsonObj:"+responseJsonObj);
			
			if (responseJsonObj.get("errMsgs") == null) {
				if(responseJsonObj.get("carDetail") != null && responseJsonObj.get("carDetail").toString().length() > 0) {
					ObjectMapper mapper = new ObjectMapper();					
					CarDetail carDetail = mapper.readValue(responseJsonObj.get("carDetail").toString(), CarDetail.class);
					
					// no need to check e car for full version
					/*
					if(carDetail.isElectricCar()){
						return HttpStatus.valueOf(414);
					}
					*/
					
					String carGroup = carDetail.getCarGroup();
					if(!("1".equals(carGroup) || "3".equals(carGroup) || "9".equals(carGroup))){
						return HttpStatus.valueOf(417);
					}
					
				}
			}else{
				logger.error("validationCarMakeMode carDetails Exception:"+responseJsonObj.get("errMsgs"));
				return HttpStatus.valueOf(504);	
			}
		} catch (Exception e) {
			logger.error("validationCarMakeMode Exception", e.getMessage());
			e.printStackTrace();
			return HttpStatus.valueOf(504);
		}
		return HttpStatus.OK; 
	}
	
	
	public boolean isValidPlanCode(String planCode){
		if(DEFAULT_TOMCAT_COMP_PLANCODE.equals(planCode)){
			return true;
		}else if(DEFAULT_TOMCAT_THIRD_PLANCODE.equals(planCode)){
			return true;
		}
		return false;
	}
	
	public HttpStatus validateMotorCareIfwd(MotorCareDetails motorCare){
		
		if(motorCare==null || motorCare.getCarDetail()==null || motorCare.getApplicant()==null){
			return HttpStatus.OK;
		}
		
//		Make/Model
		HttpStatus validCarMakeMode = validationCarMakeMode(motorCare.getCarDetail().getMakeCode(),motorCare.getCarDetail().getModel());
		if(!HttpStatus.OK.equals(validCarMakeMode)){
			return validCarMakeMode;
		}
		
//		Occupation
		String occupationCode = motorCare.getApplicant().getOccupation();
		if(!isStandardOccupation(occupationCode)){
			return HttpStatus.valueOf(406);	
		}

		
//		NCD
		if(motorCare.getApplicant().getNcb()!=null 
				&& motorCare.getApplicant().getNcb()<=0){
			return HttpStatus.valueOf(415);
		}
		
//		I am between 25-70 years old
		if(!motorCare.getApplicant().isValidAgeGroup()){
			return HttpStatus.valueOf(408);
		}
//		I’ve been driving for 2 or more years
		if(!motorCare.getApplicant().isDriveMoreThanTwo()){
			return HttpStatus.valueOf(409);
		}
			
//		Year of Manufacture
		String carYearStr = motorCare.getCarDetail().getYearOfManufacture();
		if(carYearStr!=null){
			try {
				int carYear = Integer.parseInt(carYearStr);
				int thisYear = Calendar.getInstance().get(Calendar.YEAR);
				int diffYear = thisYear-carYear;
				if(diffYear<-1 || diffYear>13){
					return HttpStatus.valueOf(410);
				}else if((diffYear>=8 && diffYear<=13) && !DEFAULT_TOMCAT_THIRD_PLANCODE.equals(motorCare.getPlanCode())){
					return HttpStatus.valueOf(416);
				}
			} catch (NumberFormatException e) {
				logger.error("validateMotorCareIfwd method has error:"+e.getMessage());
				return HttpStatus.valueOf(410);
			}
		}
		
//		Estimated Value
		Integer estVal = motorCare.getCarDetail().getEstimatedValue();
		if(estVal !=null){
			if(estVal > 999999){
				return HttpStatus.valueOf(412);
			}else if(estVal < 50000){
				return HttpStatus.valueOf(413);
			}
		}
		
		return HttpStatus.OK;//200
	}
	
	public boolean passFieldCheckCarDetails(MotorCareDetails motorCare){
		try {
			if (isBlank(motorCare.getCarDetail().getChassisNumber())
				|| isBlank(motorCare.getCarDetail().getModelDesc()) 				
				|| isBlank(motorCare.getPolicyId()) ) {
				return false;
			}			
			
			// Check the car is Electric or not 
			boolean isElectronicCar = false;
			String url = UserRestURIConstants.MOTOR_CARE_CARDETAILS_SUPPLEMENT_SECOND_GET 
					+ "?makeCode=" + urlEncodeInputSpace(motorCare.getCarDetail().getMakeCode()) + "&carModel=" + urlEncodeInputSpace(motorCare.getCarDetail().getModel());
			JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET, url, COMMON_HEADERS, null);
			
			if (responseJsonObj.get("errMsgs") == null && responseJsonObj.get("carDetail") != null && responseJsonObj.get("carDetail").toString().length() > 0) {
				ObjectMapper mapper = new ObjectMapper();					
				CarDetail carDetail = mapper.readValue(responseJsonObj.get("carDetail").toString(), CarDetail.class);
				isElectronicCar = carDetail.isElectricCar();
			}
			
			if (!isElectronicCar) {
				if (motorCare.getCarDetail().getEngineCapacity() <= 0) {
					return false;
				}
				
				// Check CC Length
				if (length(motorCare.getCarDetail().getEngineCapacity().toString()) <3 
						|| length(motorCare.getCarDetail().getEngineCapacity().toString()) >4) {
					return false;
				}	
			}
				
			// Check Chassis Number
			if (length(motorCare.getCarDetail().getChassisNumber()) <3 
					|| length(motorCare.getCarDetail().getChassisNumber()) >30) {
				return false;
			}
				
			// Check Bank
			if (motorCare.getCarDetail().isBankMortgage() ) {
				if (isBlank(motorCare.getCarDetail().getBankMortgageName())) {
					return false;
				}				
				if (length(motorCare.getCarDetail().getBankMortgageName()) <3 
						|| length(motorCare.getCarDetail().getBankMortgageName()) >50) {
					return false;
				}
			}
		} catch (NullPointerException | IOException e) {
			return false;
		}
		return true;
	}
	
	public boolean passFieldCheckDriverDetails(MotorCareDetails motorCare){
		try {
			if (isBlank(motorCare.getApplicant().getName())				
				|| isBlank(motorCare.getApplicant().getDateOfBirth())
				|| isBlank(motorCare.getApplicant().getContactNo())
				|| isBlank(motorCare.getApplicant().getEmail())
				|| isBlank(motorCare.getApplicant().getHkid())
				|| isBlank(motorCare.getApplicant().getCorrespondenceAddress().getDistrict())
				|| isBlank(motorCare.getApplicant().getCorrespondenceAddress().getHkKlNt())
				|| isBlank(motorCare.getPolicyStartDate())
				|| isBlank(motorCare.getPolicyId())				
				) {
				return false;
			}	
			
			int age = getAgeUntilToday (DateUtils.parseDate(motorCare.getApplicant().getDateOfBirth(), new String[]{"dd-MM-yyyy"}));
			if (age < 25 || age > 70) {
				return false;
			}
			
			// Check Estate and building
			if ( isBlank(motorCare.getApplicant().getCorrespondenceAddress().getBuilding()) &&
				 isBlank(motorCare.getApplicant().getCorrespondenceAddress().getEstate()) &&
				 isBlank(motorCare.getApplicant().getCorrespondenceAddress().getStreetName()) &&
				 isBlank(motorCare.getApplicant().getCorrespondenceAddress().getStreetNo())
				 ) {	
					return false;
			}
			
			// Check Policy Start Date
			Date policyStartDte = DateUtils.parseDate(motorCare.getPolicyStartDate(), new String[]{"dd-MM-yyyy"});
			if (DateUtils.truncatedCompareTo(policyStartDte, new Date(), Calendar.DAY_OF_MONTH) < 0 ||
				DateUtils.truncatedCompareTo(policyStartDte, DateUtils.addDays(new Date(), 90), Calendar.DAY_OF_MONTH) > 0)
			{
				return false;
			}
		} catch (NullPointerException e) {
			return false;
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	
	public boolean passFieldCheckPolicyDetails(MotorCareDetails motorCare){
		try {
			if (motorCare.getDriver() == null || motorCare.getDriver().size() <=0) {
				return false;
			}
					
			for (Driver driver: motorCare.getDriver()){
				if (isBlank(driver.getName())
						|| isBlank(driver.getOccupation())				
						|| isBlank(driver.getHkid())						
						) {
						return false;
					}					
			}
			
			if (isBlank(motorCare.getNameOfPreviousInusrancer())
				|| isBlank(motorCare.getRegNoofPreviousPolicy())				
				|| isBlank(motorCare.getExpDateOfPreviousInsurance())
				|| isBlank(motorCare.getPreviousPolicyNo())
				|| isBlank(motorCare.getPolicyId())				
				) {
				return false;
			}
			
			// Check Length
			if (length(motorCare.getRegNoofPreviousPolicy()) <1 
					|| length(motorCare.getRegNoofPreviousPolicy()) >8) {
				return false;
			}
			
			// Check Previous Insurance Expiry Date
			Date expDate = DateUtils.parseDate(motorCare.getExpDateOfPreviousInsurance(), new String[]{"dd-MM-yyyy"});
			Date policyStartDte = DateUtils.parseDate(motorCare.getPolicyStartDate(), new String[]{"dd-MM-yyyy"});
			
			// need Expiry date <= Start Date
			if (DateUtils.truncatedCompareTo(expDate, policyStartDte, Calendar.DAY_OF_MONTH) <= 0) {
				// Valid
			} else {
				return false;
			}
						
			if (DateUtils.truncatedCompareTo(policyStartDte, DateUtils.addDays(expDate, 366), Calendar.DAY_OF_MONTH) <= 0) {
				// Valid
			} else {
				return false;
			}
		} catch (NullPointerException e) {
			return false;
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	
	private int getAgeUntilToday (Date birthdayInput) {
		LocalDate today = LocalDate.now();
		LocalDate birthday = birthdayInput.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

		Period p = Period.between(birthday, today);
		return p.getYears();

	}
	
}
