package com.ifwd.fwdhk.services.impl;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.connector.ECommWsConnector;
import com.ifwd.fwdhk.connector.response.BaseResponse;
import com.ifwd.fwdhk.connector.response.eliteterm.CreateEliteTermPolicyResponse;
import com.ifwd.fwdhk.connector.response.eliteterm.GetEliteTermPremiumResponse;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.services.EliteTermService;
import com.ifwd.fwdhk.util.ClientBrowserUtil;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.HeaderUtil;
@Service
public class EliteTermServiceImpl implements EliteTermService {
	private final static Logger logger = LoggerFactory.getLogger(EliteTermServiceImpl.class);
	
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
	
	@Override
	public CreateEliteTermPolicyResponse createEliteTermPolicy(HttpServletRequest request)throws ECOMMAPIException{
		CreateEliteTermPolicyResponse apiReturn = null;
		try {
			final Map<String,String> header = headerUtil.getHeader(request);
			
			JSONObject parameters = new JSONObject();
			parameters.put("planCode", "EliteTerm");
			JSONObject applicant = new JSONObject();
			applicant.put("firstName", "Nat");
			applicant.put("lastName", "Cheung");
			applicant.put("chineseName", "張國偉");
			applicant.put("dob", "1980-01-01");
			applicant.put("gender", "M");
			applicant.put("hkId", "A1234563");
			applicant.put("passport", "");
			applicant.put("maritalStatus", "SINGLE");
			applicant.put("placeOfBirth", "HK");
			applicant.put("nationality", "Chinese");
			applicant.put("residentialTelNoCountryCode", "852");
			applicant.put("residentialTelNo", "23886166");
			applicant.put("mobileNoCountryCode", "852");
			applicant.put("mobileNo", "93886166");
			applicant.put("email", "nathaniel.kw.cheung@fwd.com");
			JSONObject residentialAddress = new JSONObject();
			residentialAddress.put("line1", "R Line1");
			residentialAddress.put("line2", "R Line2");
			residentialAddress.put("line3", "R Line3");
			residentialAddress.put("line4", "R District");
			residentialAddress.put("district", "HKG");
			applicant.put("residentialAddress", residentialAddress);
			JSONObject correspondenceAddress = new JSONObject();
			correspondenceAddress.put("line1", "C Line1");
			correspondenceAddress.put("line2", "C Line2");
			correspondenceAddress.put("line3", "C Line3");
			correspondenceAddress.put("line4", "C District");
			correspondenceAddress.put("district", "HKG");
			applicant.put("correspondenceAddress", correspondenceAddress);
			JSONObject employmentStatus = new JSONObject();
			employmentStatus.put("employmentStatus", "ABC");
			employmentStatus.put("occupation", "CCC");
			employmentStatus.put("educationLevel", "SS");
			employmentStatus.put("natureOfBusiness", "DDD");
			employmentStatus.put("monthlyPersonalIncome", "EEE");
			employmentStatus.put("liquidAsset", "");
			applicant.put("employmentStatus", employmentStatus);
			applicant.put("smoke", true);
			parameters.put("applicant", applicant);
			JSONArray beneficiaries = new JSONArray();
			JSONObject beneficiarie1 = new JSONObject();
			beneficiarie1.put("firstName", "Beneficiary First Name");
			beneficiarie1.put("lastName", "Beneficiary Last Name");
			beneficiarie1.put("chineseName", "受保人1");
			beneficiarie1.put("hkId", "L5147304");
			beneficiarie1.put("passport", "");
			beneficiarie1.put("gender", "M");
			beneficiarie1.put("relationship", "BR");
			beneficiarie1.put("entitlement", "100");
			beneficiaries.add(beneficiarie1);
			parameters.put("beneficiaries", beneficiaries);
			JSONObject payment = new JSONObject();
			applicant.put("amount", "100.00");
			applicant.put("paymentMethod", "");
			applicant.put("bankName", "bankName");
			applicant.put("branchName", "branchName");
			applicant.put("accountNo", "");
			applicant.put("expiryDate", "");
			parameters.put("payment", payment);
			parameters.put("insuredAmount", 100000);
			apiReturn = connector.createEliteTermPolicy(parameters, header);
		}catch(Exception e){
			logger.info("EliteTermServiceImpl createEliteTermPolicy occurs an exception!");
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		return apiReturn;
	}
	
	@Override
	public GetEliteTermPremiumResponse getEliteTermPremium(HttpServletRequest request)throws ECOMMAPIException{
		GetEliteTermPremiumResponse apiReturn = null;
		try {
			final Map<String,String> header = headerUtil.getHeader(request);
			apiReturn = connector.getEliteTermPremium(request, header);
		}catch(Exception e){
			logger.info("EliteTermServiceImpl getEliteTermPremium occurs an exception!");
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		return apiReturn;
	}
	
	@Override
	public BaseResponse finalizeEliteTermPolicy(HttpServletRequest request)throws ECOMMAPIException{
		BaseResponse apiReturn = null;
		try {
			final Map<String,String> header = headerUtil.getHeader(request);
			
			JSONObject parameters = new JSONObject();
			parameters.put("creditCaredNo", request.getParameter("creditCaredNo"));
			parameters.put("expiryDate", request.getParameter("expiryDate"));
			parameters.put("cardHolderName", request.getParameter("cardHolderName"));
			parameters.put("policyNo", request.getParameter("policyNo"));
			apiReturn = connector.finalizeEliteTermPolicy(parameters, header);
		}catch(Exception e){
			logger.info("EliteTermServiceImpl finalizeEliteTermPolicy occurs an exception!");
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		return apiReturn;
	}
	
	@Override
	public BaseResponse getUploadedDocument(HttpServletRequest request)throws ECOMMAPIException{
		BaseResponse apiReturn = null;
		try {
			final Map<String,String> header = headerUtil.getHeader(request);
			apiReturn = connector.getUploadedDocument(header);
		}catch(Exception e){
			logger.info("EliteTermServiceImpl getUploadedDocument occurs an exception!");
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		return apiReturn;
	}
	
	@Override
	public BaseResponse contactCs(HttpServletRequest request)throws ECOMMAPIException{
		BaseResponse apiReturn = null;
		try {
			final Map<String,String> header = headerUtil.getHeader(request);
			
			JSONObject parameters = new JSONObject();
			parameters.put("name", request.getParameter("name"));
			parameters.put("email", request.getParameter("email"));
			parameters.put("mobile", request.getParameter("mobile"));
			parameters.put("preferredDay", request.getParameter("preferredDay"));
			parameters.put("preferredTimeSlot", request.getParameter("preferredTimeSlot"));
			parameters.put("enquiryType", request.getParameter("enquiryType"));
			parameters.put("channel", request.getParameter("channel"));
			parameters.put("product", request.getParameter("product"));
			apiReturn = connector.contactCs(parameters, header);
		}catch(Exception e){
			logger.info("EliteTermServiceImpl contactCs occurs an exception!");
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		return apiReturn;
	}
	
	@Override
	public BaseResponse setEliteTermPolicyAgentEmail(HttpServletRequest request)throws ECOMMAPIException{
		BaseResponse apiReturn = null;
		try {
			final Map<String,String> header = headerUtil.getHeader(request);
			
			JSONObject parameters = new JSONObject();
			parameters.put("policyNo", request.getParameter("policyNo"));
			parameters.put("agentEmail", request.getParameter("agentEmail"));
			apiReturn = connector.setEliteTermPolicyAgentEmail(parameters, header);
		}catch(Exception e){
			logger.info("EliteTermServiceImpl setEliteTermPolicyAgentEmail occurs an exception!");
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		return apiReturn;
	}
	
	@Override
	public BaseResponse uploadSignature(HttpServletRequest request,String image)throws ECOMMAPIException{		
		BaseResponse br = null;
		try {
			final Map<String,String> header = headerUtil.getHeader(request);
			
			Map<String,Object> clientBrowserInfo = ClientBrowserUtil.getClientInfo(request);
			JSONObject parameters = new JSONObject();
			parameters.put("clientBrowserInfo", clientBrowserInfo);
			parameters.put("fileType", "png");
			parameters.put("signatureType", "application");
			parameters.put("base64", image);
			br = connector.uploadSignature(parameters, header);
		} catch (ECOMMAPIException e) {
			logger.info("EliteTermServiceImpl uploadSignature occurs an exception!");
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		return br;
	}
	
	@Override
	public BaseResponse uploadDocuments(HttpServletRequest request,String file)throws ECOMMAPIException{		
		BaseResponse br = null;
		try {
			final Map<String,String> header = headerUtil.getHeader(request);
			
			Map<String,Object> clientBrowserInfo = ClientBrowserUtil.getClientInfo(request);
			JSONObject parameters = new JSONObject();
			parameters.put("clientBrowserInfo", clientBrowserInfo);
			parameters.put("fileType", "png");
			parameters.put("documentType", "HKID");
			parameters.put("originalFilePath", "C:\\abc.png");
			parameters.put("base64", file);
			br = connector.uploadDocument(parameters, header);
		} catch (ECOMMAPIException e) {
			logger.info("EliteTermServiceImpl uploadDocuments occurs an exception!");
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		return br;
	}
	
}
