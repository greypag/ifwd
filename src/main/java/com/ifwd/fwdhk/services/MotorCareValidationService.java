package com.ifwd.fwdhk.services;

import java.util.List;

import org.springframework.http.HttpStatus;

import com.ifwd.fwdhk.model.OccupationBean;
import com.ifwd.fwdhk.model.motor.MotorCareDetails;

public interface MotorCareValidationService {

	boolean isValidPlanCode(String planCode);
	HttpStatus validateMotorCareIfwd(MotorCareDetails motorCare);
	List<OccupationBean> getMotorOccupationList();
	
	boolean passFieldCheckCarDetails(MotorCareDetails motorCare);
	boolean passFieldCheckDriverDetails(MotorCareDetails motorCare);
	boolean passFieldCheckPolicyDetails(MotorCareDetails motorCare);
}
