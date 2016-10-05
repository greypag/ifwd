package com.ifwd.fwdhk.services;

import java.util.List;

import org.springframework.http.HttpStatus;

import com.ifwd.fwdhk.model.OccupationBean;
import com.ifwd.fwdhk.model.motor.QuoteMotorCare;

public interface MotorCareValidationService {

	public boolean isValidPlanCode(String planCode);
	public HttpStatus validateMotorCareIfwd(QuoteMotorCare motorCare);
	public List<OccupationBean> getMotorOccupationList();
	
}
