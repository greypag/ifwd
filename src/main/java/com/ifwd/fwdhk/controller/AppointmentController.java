package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;
import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;
import static org.springframework.http.MediaType.APPLICATION_XML_VALUE;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ifwd.fwdhk.connector.response.savie.ServiceCentreResponse;
import com.ifwd.fwdhk.connector.response.savie.ServiceCentreResult;
import com.ifwd.fwdhk.controller.core.Responses;
import com.ifwd.fwdhk.model.AppointmentBooking;
import com.ifwd.fwdhk.model.TimeSlotEntity;


@Controller
@RequestMapping(value = "/api/appointment", produces = {APPLICATION_JSON_VALUE, APPLICATION_XML_VALUE})
@Api(value = "/appointment", description = "Operations about appointment")
public class AppointmentController extends BaseController {
	
	public enum AppointmentType {
		SAVIE_OFFLINE(1),
		PAY_LATER(2),
		EASY_HEALTH_OFFLINE(3),
		PROVIE_OFFLINE(4);
		
	    private final int value;
	    
	    private AppointmentType(int value) {
	        this.value = value;
	    }

	    public int getValue() {
	        return value;
	    }
	}
	
	@RequestMapping(value = "/centre", method = GET)
	@ApiOperation(
		value = "Get available customer service centre for appointment",
		response = ServiceCentreResult.class,
		responseContainer = "List"
		)
	@ApiResponses(value = {@ApiResponse(code = 400, message = "Invalid appointment type"),
			@ApiResponse(code = 500, message = "System error")})
	public ResponseEntity<List<ServiceCentreResult>> getAvailableCentre(
			@ApiParam(value = "Appointment type", required = true) @RequestParam("type") AppointmentType type
			, @ApiParam(value = "Display language",  allowableValues = "EN,ZH", required = true) @RequestParam("language") String language
			, HttpServletRequest request) {
		
		super.IsAuthenticate(request);
		
		try {
			HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
			header.put("language", language);
			
			ServiceCentreResponse apiResponse = connector.consumeECommWs(UserRestURIConstants.SERVICE_CENTRE, HttpMethod.GET, null
					, ServiceCentreResponse.class, header);

			return Responses.ok(apiResponse.getServiceCentres());
		} catch (Exception e) {
			return Responses.error(null);
		}
	}

	@RequestMapping(value = "/timeSlotEntity", method = GET)
	@ApiOperation(
		value = "Find available date and time",
		response = TimeSlotEntity.class,
		responseContainer = "List"
		)
	@ApiResponses(value = {@ApiResponse(code = 400, message = "Invalid appointment type")
							, @ApiResponse(code = 404, message = "No available timeslot")	
							, @ApiResponse(code = 500, message = "System error")})
	public ResponseEntity<List<TimeSlotEntity>> findAvailableDateByCentre(
			@ApiParam(value = "Service centre code", required = true) @RequestParam("centreCode") String centreCode
			,@ApiParam(value = "Appointment type", required = true) @RequestParam("type") AppointmentType type
			,@ApiParam(value = "Appointment date (in dd-MM-yyyy format)", required = false) @RequestParam("date") String preferredDate
			, HttpServletRequest request) {
		
		super.IsAuthenticate(request);

		List<TimeSlotEntity> timeSlots = new ArrayList<TimeSlotEntity>();
		try {
			org.json.simple.JSONObject responseJsonObj = new org.json.simple.JSONObject();
			String url = UserRestURIConstants.SERVICE_URL + "/appointment/timeSlot?date=" + preferredDate
					+ "&serviceCentreCode=" + centreCode + "&appointmentTypeId=" + type.value;
				
			responseJsonObj = restService.consumeApi(HttpMethod.GET, url, COMMON_HEADERS, null);
			if(responseJsonObj.get("timeSlots") != null 
					&& responseJsonObj.get("timeSlots").toString().length() > 0) {
				ObjectMapper mapper = new ObjectMapper();
				timeSlots = mapper.readValue(responseJsonObj.get("timeSlots").toString(), mapper.getTypeFactory().constructCollectionType(List.class, TimeSlotEntity.class));
				if (preferredDate != null) {
					for (TimeSlotEntity slot: timeSlots) {
						slot.setDate(preferredDate);
					}
				}
				return Responses.ok(timeSlots);
			} else {
				return Responses.notFound(null);
			}
		} catch (Exception e) {
			return Responses.error(null);
		}
	}
	
	@RequestMapping(method = POST)
	@ApiOperation(
		value = "Book appointment",
		response = AppointmentBooking.class
		)
	@ApiResponses(value = {@ApiResponse(code = 400, message = "Invalid appointment type"),
							@ApiResponse(code = 405, message = "The number of appointments must be less than 2"),
							@ApiResponse(code = 406, message = "Access code has already been used"),
							@ApiResponse(code = 409, message = "Reservation is invalid"),
							@ApiResponse(code = 500, message = "System error")})
	public ResponseEntity<AppointmentBooking> bookAppointment(
			@ApiParam(value = "Appointment booking", required = true) @RequestBody AppointmentBooking booking
			/*
			@ApiParam(value = "Appointment date (in dd-MM-yyyy format)", required = true) @RequestParam("preferredDate") String preferredDate
			,@ApiParam(value = "Appointment time (in HH:Mi format)", required = true) @RequestParam("preferredTime") String preferredTime
			,@ApiParam(value = "CS centre code", required = true) @RequestParam("centreCode") String centreCode
			,@ApiParam(value = "Plan code", required = true) @RequestParam("planCode") String planCode
			,@ApiParam(value = "User name", required = true) @RequestParam("userName") String userName
			,@ApiParam(value = "Appointment type", required = true) @RequestParam("type") AppointmentType type
			*/
			, HttpServletRequest request) {
		
		super.IsAuthenticate(request);

		String url = UserRestURIConstants.SERVICE_URL + "/appointment/accessCode";
		org.json.simple.JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET, url, COMMON_HEADERS, null);
		if(responseJsonObj.get("errMsgs")!=null){
			return Responses.error(null); // cannot get access code
		}
		String accessCode = responseJsonObj.get("accessCode").toString();

		org.json.simple.JSONObject parameters = new org.json.simple.JSONObject();
		parameters.put("planCode", booking.getPlanCode());
		parameters.put("accessCode", accessCode);

		String applicationUrl = UserRestURIConstants.SERVICE_URL + "/savie/application";
		org.json.simple.JSONObject appJsonObj = restService.consumeApi(HttpMethod.PUT, applicationUrl, COMMON_HEADERS, parameters);
		String applicationNumber = (String)appJsonObj.get("applicationNumber");
		
		if(appJsonObj != null) {
			parameters = new org.json.simple.JSONObject();
			parameters.put("serviceCentreCode", booking.getCentreCode());
			parameters.put("date", booking.getPreferredDate());
			parameters.put("timeSlot", booking.getPreferredTime());
			parameters.put("planCode", booking.getPlanCode());
			parameters.put("policyNumber", "");
			parameters.put("applicationNumber", applicationNumber);
			parameters.put("userName", booking.getUserName());
			parameters.put("status", "Active");
			parameters.put("remarks", "");
			parameters.put("accessCode", accessCode);
			parameters.put("servicingAgent", "");
			parameters.put("appointmentTypeId", 1);
			
			String makeUrl = UserRestURIConstants.SERVICE_URL + "/appointment/make";
			org.json.simple.JSONObject makeJsonObj = restService.consumeApi(HttpMethod.POST, makeUrl, COMMON_HEADERS, parameters);
			
			if (makeJsonObj.get("errMsgs") == null) {
				booking.setReferenceNum(applicationNumber);
				return Responses.ok(booking);
			} else {
				if (makeJsonObj.get("errMsgs").toString().equals("[\"Access code has already been used\"]")) {
					return Responses.notAcceptable(null);
				} else if (makeJsonObj.get("errMsgs").toString().equals("[\"The number of appointments must be less than 2\"]")) {
					return Responses.methodNotAllowed(null);
				} else if (makeJsonObj.get("errMsgs").toString().equals("[\"Reservation is invalid\"]")) {
					return Responses.conflict(null);
				} else {
					return Responses.error(null);
				}
			}
		} else {
			return Responses.error(null);
		}					
	}
	
	@RequestMapping(value = "/{refNum}", method = GET)
	@ApiOperation(
		value = "Find appointment booking",
		response = AppointmentBooking.class
		)
	@ApiResponses(value = {@ApiResponse(code = 401, message = "Unauthorized"),
			@ApiResponse(code = 404, message = "System cannot find appointment booking"),
			@ApiResponse(code = 500, message = "System error")})
	public ResponseEntity<AppointmentBooking> findAppointmentBooking(
			@ApiParam(value = "Booking reference number", required = true) @PathVariable("refNum") String refNum
			, HttpServletRequest request) {
		
		super.IsAuthenticate(request);

		AppointmentBooking booking = new AppointmentBooking();
		booking.setReferenceNum(refNum);
		booking.setCentreCode("");
		booking.setPreferredDate("");
		booking.setPreferredTime("");
		booking.setUserName("");
		
		if (booking != null) {
			if (!booking.getUserName().equals(MemberController.GetUserName(request))) {
				return Responses.unauthorized(null);
			} else {					
				return Responses.ok(booking);
			}					
		} else {
			return Responses.notFound(null);
		}
	}
}
