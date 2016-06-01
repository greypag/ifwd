package com.ifwd.fwdhk.services.impl;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.joda.time.LocalDate;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.connector.ECommWsConnector;
import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.model.CreatePolicy;
import com.ifwd.fwdhk.model.HomeCareDetailsBean;
import com.ifwd.fwdhk.services.GAService;
import com.ifwd.fwdhk.util.ClientBrowserUtil;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.DateApi;
import com.ifwd.fwdhk.util.HeaderUtil;
import com.ifwd.fwdhk.util.JsonUtils;
import com.ifwd.fwdhk.util.StringHelper;
import com.ifwd.fwdhk.util.WebServiceUtils;
@Service
public class GAServiceImpl implements GAService {
	private final static Logger logger = LoggerFactory.getLogger(GAServiceImpl.class);
	
	@Autowired
	private RestServiceDao restService;
	
	@Autowired
	private CommonUtils commonUtils;
	
	@Autowired 
	protected ECommWsConnector connector;
	
	@Autowired
	protected HeaderUtil headerUtil;
	
	@Autowired
	protected ClientBrowserUtil clientBrowserUtil;
	
	public String processSummary(HomeCareDetailsBean homeCareDetails, HttpServletResponse response, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		String referralCode = (String)session.getAttribute("referralCode");
		String theClubMembershipNo = (String)session.getAttribute("theClubMembershipNo");
		
		JSONObject parameters = new JSONObject();
		JSONObject correspondenceAddress = new JSONObject();
		JSONObject insuredAddress = new JSONObject();
		JSONObject applicant = new JSONObject();
		
		String passportORhkid = WebServiceUtils.getParameterValue("apphkidandpassport", session, request);
		String hkId = StringHelper.emptyIfNull(WebServiceUtils.getParameterValue("hkId", session, request));
		String applicantName = WebServiceUtils.getParameterValue("applicantName", session, request);
		String emailAddress = WebServiceUtils.getParameterValue("emailAddress", session, request);
		String mobileNo = WebServiceUtils.getParameterValue("mobileNo", session, request);
		String dob = DateApi.formatString(WebServiceUtils.getParameterValue("applicantDob", session, request));
		Date effectiveDate = DateApi.formatDate(homeCareDetails.getEffectiveDate());
		LocalDate date = new LocalDate(effectiveDate);
		String edate = date.toString();
		
		parameters.put("commencementDate", edate);
		parameters.put("netFloorArea", homeCareDetails.getNetFloorArea());
		parameters.put("planCode", homeCareDetails.getPlanCode());

		

		parameters.put("correspondenceAddress", correspondenceAddress);

		applicant.put("name", applicantName);
		applicant.put("gender", "M");

		applicant.put("dob", dob);

		if(passportORhkid.equalsIgnoreCase("appHkid")) {
			applicant.put("hkId", hkId);
			applicant.put("passport", "");
		}else {
			applicant.put("hkId", "");
			applicant.put("passport", hkId);			
		}
		
		applicant.put("email", emailAddress);
		applicant.put("mobileNo", mobileNo);
		applicant.put("occupation", "");
		applicant.put("optIn1", homeCareDetails.getCheckbox1());
		applicant.put("optIn2", homeCareDetails.getCheckbox2());

		parameters.put("applicant", applicant);

		correspondenceAddress.put("room", homeCareDetails.getApplicantRoom());
		correspondenceAddress.put("floor", homeCareDetails.getApplicantFloor());
		correspondenceAddress.put("block", homeCareDetails.getApplicantBlock());
		correspondenceAddress.put("building", homeCareDetails.getApplicantBuilding());
		correspondenceAddress.put("estate", homeCareDetails.getApplicantEstate());
		correspondenceAddress.put("streetNo", homeCareDetails.getApplicantStreetNo());
		correspondenceAddress.put("streetName", homeCareDetails.getApplicantStreetName());
		correspondenceAddress.put("district", homeCareDetails.getApplicantDistrict());
		correspondenceAddress.put("area", homeCareDetails.getApplicantArea());


		insuredAddress.put("room", homeCareDetails.getaRoom());
		insuredAddress.put("floor", homeCareDetails.getaFloor());
		insuredAddress.put("block", homeCareDetails.getaBlock());
		insuredAddress.put("building", homeCareDetails.getaBuilding());
		insuredAddress.put("estate", homeCareDetails.getaEstate());
		insuredAddress.put("streetNo", homeCareDetails.getaStreetNo());
		insuredAddress.put("streetName", homeCareDetails.getaStreetName());
		insuredAddress.put("district", homeCareDetails.getaDistrict());
		insuredAddress.put("area", homeCareDetails.getaArea());
		
		parameters.put("insuredAddress", insuredAddress);
		parameters.put("referralCode", referralCode);
		
		parameters.put("externalParty", StringUtils.isEmpty(theClubMembershipNo) ? "" : "THE CLUB");
		parameters.put("externalPartyCode", theClubMembershipNo);
		
		Map<String, String> header = headerUtil.getHeader(request);
		logger.info("HOMECARE_CREATE_POLICY Request" + JsonUtils.jsonPrint(parameters));
		JSONObject responsObject = restService
				.consumeApi(HttpMethod.PUT,
						UserRestURIConstants.HOMECARE_CREATE_POLICY, header,
						parameters);
		logger.info("HOMECARE_CREATE_POLICY Response" + JsonUtils.jsonPrint(responsObject));

		CreatePolicy createPolicy = new CreatePolicy();
		if (responsObject.get("errMsgs") == null) {
			createPolicy.setReferralCode(JsonUtils.checkJsonObjNull(responsObject, "referralCode"));
			createPolicy.setReferenceNo(JsonUtils.checkJsonObjNull(responsObject, "referenceNo"));
			createPolicy.setPlanCode(JsonUtils.checkJsonObjNull(responsObject, "planCode"));
			createPolicy.setPaymentGateway(JsonUtils.checkJsonObjNull(responsObject, "paymentGateway"));
			createPolicy.setMerchantId(JsonUtils.checkJsonObjNull(responsObject, "merchantId"));
			createPolicy.setCurrCode(JsonUtils.checkJsonObjNull(responsObject, "currCode"));
			createPolicy.setPaymentType(JsonUtils.checkJsonObjNull(responsObject, "paymentType"));
			createPolicy.setLang(JsonUtils.checkJsonObjNull(responsObject, "lang"));
			session.setAttribute("createPolicy", createPolicy);
			return "success";
		} else {
			//createPolicy.setErrMsgs(responsObject.get("errMsgs").toString());
			return responsObject.get("errMsgs").toString();
		}
		
	}
}
