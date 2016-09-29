package com.ifwd.fwdhk.services.impl;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.List;

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
import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.model.OccupationBean;
import com.ifwd.fwdhk.model.motor.CarDetail;
import com.ifwd.fwdhk.model.motor.QuoteMotorCare;
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
					if(carDetail.isElectricCar()){
						return HttpStatus.valueOf(414);
					}
					String carGroup = carDetail.getCarGroup();
					if(!("1".equals(carGroup) || "3".equals(carGroup) || "9".equals(carGroup))){
						return HttpStatus.valueOf(417);
					}
				}
			}else{
				logger.error("validationCarMakeMode carDetails Exception:"+responseJsonObj.get("errMsgs"));
				return HttpStatus.INTERNAL_SERVER_ERROR;	
			}
		} catch (Exception e) {
			logger.error("validationCarMakeMode Exception", e);
			return HttpStatus.INTERNAL_SERVER_ERROR;
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
	
	public HttpStatus validateMotorCareIfwd(QuoteMotorCare motorCare){
		if(motorCare==null || motorCare.getQuoteDriver()==null){
			return HttpStatus.OK;
		}
		
//		Make/Model
		HttpStatus validCarMakeMode = validationCarMakeMode(motorCare.getQuoteDriver().getCarMakeCode(),motorCare.getQuoteDriver().getCarModel());
		if(!HttpStatus.OK.equals(validCarMakeMode)){
			return validCarMakeMode;
		}
		
//		Occupation
		String occupationCode = motorCare.getQuoteDriver().getOccupation();
		if(!isStandardOccupation(occupationCode)){
			return HttpStatus.valueOf(406);	
		}

		
//		NCD
		if(motorCare.getQuoteDriver().getNcb()!=null 
				&& motorCare.getQuoteDriver().getNcb()<=0){
			return HttpStatus.valueOf(415);
		}
		
//		I am between 25-70 years old
		if(!motorCare.getQuoteDriver().isValidAgeGroup()){
			return HttpStatus.valueOf(408);
		}
//		I’ve been driving for 2 or more years
		if(!motorCare.getQuoteDriver().isDriveMoreThanTwo()){
			return HttpStatus.valueOf(409);
		}
			
//		Year of Manufacture
		String carYearStr = motorCare.getQuoteDriver().getCarYearOfManufacture();
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
				return HttpStatus.valueOf(410);
			}
		}
		
//		Estimated Value
		Integer estVal = motorCare.getQuoteDriver().getCarEstimatedValue();
		if(estVal !=null){
			if(estVal > 2000000){
				return HttpStatus.valueOf(412);
			}else if(estVal < 50000){
				return HttpStatus.valueOf(413);
			}
		}
		
		return HttpStatus.OK;//200
	}
}
