package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;
import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;
import static org.springframework.http.MediaType.APPLICATION_XML_VALUE;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.ArrayList;
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
		
	@RequestMapping(value = "/getAvailableCentre", method = GET)
	@ApiOperation(
		value = "Get available customer service center for appointment",
		response = ServiceCentreResult.class,
		responseContainer = "List"
		)
	@ApiResponses(value = {@ApiResponse(code = 400, message = "Invalid appointment type"),
			@ApiResponse(code = 500, message = "System error")})
	public ResponseEntity<List<ServiceCentreResult>> getAvailableCentre(
			@ApiParam(value = "Appointment type ID", required = true) @RequestParam("typeId") String typeId
			, @ApiParam(value = "Display language",  allowableValues = "EN,CH", required = true) @RequestParam("language") String language
			, HttpServletRequest request) {
		
		super.IsAuthenticate(request);
		
		try {
			HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
			header.put("language", language);
			
			ServiceCentreResponse apiResponse = connector.consumeECommWs(UserRestURIConstants.SERVICE_CENTRE, HttpMethod.GET, null
					, ServiceCentreResponse.class, header);

			return Responses.ok(apiResponse.getServiceCentres());
		} catch (Exception e) {
			throw new RuntimeException("System error");
		}
	}

	@RequestMapping(value = "/findAvailableDateByCentre", method = GET)
	@ApiOperation(
		value = "Find available date by customer service center for appointment type",
		response = TimeSlotEntity.class,
		responseContainer = "List"
		)
	@ApiResponses(value = {@ApiResponse(code = 400, message = "Invalid appointment type"),
			@ApiResponse(code = 500, message = "System error")})
	public ResponseEntity<List<String>> findAvailableDateByCentre(
			@ApiParam(value = "CS centre code", required = true) @RequestParam("centreCode") String centreCode
			,@ApiParam(value = "Appointment type ID", required = true) @RequestParam("typeId") String typeId
			, HttpServletRequest request) {
		
		super.IsAuthenticate(request);

		List<String> availDate = new ArrayList<String>();
		try {
			// TODO
		} catch (Exception e) {
			return Responses.ok(availDate);
		}
		return Responses.ok(availDate);
	}
	
	@RequestMapping(value = "/findAvailableTimeByCentre", method = GET)
	@ApiOperation(
		value = "Find available time by customer service center for appointment type",
		response = TimeSlotEntity.class,
		responseContainer = "List"
		)
	@ApiResponses(value = {@ApiResponse(code = 400, message = "Invalid appointment type"),
			@ApiResponse(code = 500, message = "System error")})
	public ResponseEntity<List<TimeSlotEntity>> findAvailableTimeByCentre(
			@ApiParam(value = "CS centre code", required = true) @RequestParam("centreCode") String centreCode
			,@ApiParam(value = "Appointment date (in dd-MM-yyyy)", required = true) @RequestParam("preferredDate") String preferredDate
			,@ApiParam(value = "Appointment type ID", required = true) @RequestParam("typeId") String typeId
			, HttpServletRequest request) {
		
		super.IsAuthenticate(request);

		List<TimeSlotEntity> timeSlots = new ArrayList<TimeSlotEntity>();
		try {
			org.json.simple.JSONObject responseJsonObj = new org.json.simple.JSONObject();
			String url = UserRestURIConstants.SERVICE_URL + "/appointment/timeSlot?date=" + preferredDate
					+ "&serviceCentreCode=" + centreCode + "&appointmentTypeId=" + typeId;
				
			responseJsonObj = restService.consumeApi(HttpMethod.GET, url, COMMON_HEADERS, null);
			if(responseJsonObj.get("timeSlots") != null 
					&& responseJsonObj.get("timeSlots").toString().length() > 0) {
				ObjectMapper mapper = new ObjectMapper();
				timeSlots = mapper.readValue(responseJsonObj.get("timeSlots").toString(), mapper.getTypeFactory().constructCollectionType(List.class, TimeSlotEntity.class));
			}
		} catch (Exception e) {
			return Responses.ok(timeSlots);
		}
		return Responses.ok(timeSlots);
	}
	
	@RequestMapping(method = POST)
	@ApiOperation(
		value = "Book appointment",
		response = AppointmentBooking.class
		)
	@ApiResponses(value = {@ApiResponse(code = 400, message = "Invalid appointment type"),
			@ApiResponse(code = 500, message = "System error")})
	public ResponseEntity<AppointmentBooking> bookAppointment(
			@ApiParam(value = "CS centre code", required = true) @RequestParam("centreCode") String centreCode
			,@ApiParam(value = "Appointment date (in dd-MM-yyyy format)", required = true) @RequestParam("preferredDate") String preferredDate
			,@ApiParam(value = "Appointment time (in HH:Mi format)", required = true) @RequestParam("preferredTime") String preferredTime
			,@ApiParam(value = "Plan code", required = true) @RequestParam("planCode") String planCode
			,@ApiParam(value = "User name", required = true) @RequestParam("userName") String userName
			,@ApiParam(value = "Appointment type ID", required = true) @RequestParam("typeId") String typeId
			, HttpServletRequest request) {
		
		super.IsAuthenticate(request);

		String url = UserRestURIConstants.SERVICE_URL + "/appointment/accessCode";
		org.json.simple.JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET, url, COMMON_HEADERS, null);
		if(responseJsonObj.get("errMsgs")!=null){
			throw new RuntimeException("Cannot get access code");
		}
		String accessCode = responseJsonObj.get("accessCode").toString();


		org.json.simple.JSONObject parameters = new org.json.simple.JSONObject();
		parameters.put("planCode", planCode);
		parameters.put("accessCode", accessCode);

		String applicationUrl = UserRestURIConstants.SERVICE_URL + "/savie/application";
		org.json.simple.JSONObject appJsonObj = restService.consumeApi(HttpMethod.PUT, applicationUrl, COMMON_HEADERS, parameters);
		String applicationNumber = (String)appJsonObj.get("applicationNumber");
		
		if(appJsonObj != null) {
			parameters = new org.json.simple.JSONObject();
			parameters.put("serviceCentreCode", centreCode);
			parameters.put("date", preferredDate);
			parameters.put("timeSlot", preferredTime);
			parameters.put("planCode", planCode);
			parameters.put("policyNumber", "");
			parameters.put("applicationNumber", applicationNumber);
			parameters.put("userName", userName);
			parameters.put("status", "Active");
			parameters.put("remarks", "");
			parameters.put("accessCode", accessCode);
			parameters.put("servicingAgent", "");
			parameters.put("appointmentTypeId", typeId);
			
			String makeUrl = UserRestURIConstants.SERVICE_URL + "/appointment/make";
			org.json.simple.JSONObject makeJsonObj = restService.consumeApi(HttpMethod.POST, makeUrl, COMMON_HEADERS, parameters);
			
			if (makeJsonObj.get("errMsgs") == null) {
				AppointmentBooking booking = new AppointmentBooking();
				booking.setReferenceNum(applicationNumber);
				booking.setCentreCode(centreCode);
				booking.setPreferredDate(preferredDate);
				booking.setPreferredTime(preferredTime);
				return Responses.ok(booking);
			} else {
				throw new RuntimeException(makeJsonObj.get("errMsgs").toString());			
			}
		} else {
			throw new RuntimeException("Application error");
		}					
	}
	
	@RequestMapping(method = GET)
	@ApiOperation(
		value = "Find appointment booking",
		response = AppointmentBooking.class
		)
	@ApiResponses(value = {@ApiResponse(code = 401, message = "Unauthorized"),
			@ApiResponse(code = 404, message = "System cannot find appointment booking"),
			@ApiResponse(code = 500, message = "System error")})
	public ResponseEntity<AppointmentBooking> findAppointmentBooking(
			@ApiParam(value = "Booking reference number", required = true) @RequestParam("referenceNum") String referenceNum
			, HttpServletRequest request) {
		
		super.IsAuthenticate(request);

		AppointmentBooking booking = new AppointmentBooking();
		booking.setReferenceNum(referenceNum);
		booking.setCentreCode("");
		booking.setPreferredDate("");
		booking.setPreferredTime("");
		booking.setUserName("");
		
		if (!booking.getUserName().equals(MemberController.GetUserName(request))) {
			return Responses.unauthorized(null);
		} else {					
			return Responses.ok(booking);
		}					
	}
}
