package com.ifwd.fwdhk.services;

import java.util.List;

import org.springframework.http.HttpStatus;

import com.ifwd.fwdhk.model.OccupationBean;
import com.ifwd.fwdhk.model.motor.MotorCareDetails;

public interface MotorCareValidationService {

	public boolean isValidPlanCode(String planCode);
	public HttpStatus validateMotorCareIfwd(MotorCareDetails motorCare);
	public List<OccupationBean> getMotorOccupationList();
	
}
