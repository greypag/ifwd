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
import com.ifwd.fwdhk.controller.UserRestURIConstants;
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
		GetEliteTermPremiumResponse eliteTermPremium = (GetEliteTermPremiumResponse) request.getSession().getAttribute("eliteTermPremium");
		CreateEliteTermPolicyResponse apiReturn = null;
		try {
			final Map<String,String> header = headerUtil.getHeader(request);
			
			logger.debug(request.getParameterMap().toString());
			JSONObject parameters = new JSONObject();
			parameters.put("planCode", "EliteTerm");
			JSONObject applicant = new JSONObject();
			applicant.put("firstName", request.getParameter("savieApplicantBean.firstName"));
			applicant.put("lastName", request.getParameter("savieApplicantBean.lastName"));
			applicant.put("chineseName", request.getParameter("savieApplicantBean.chineseName"));
			String[] dob = request.getParameter("dob").toString().split("-");
			applicant.put("dob", dob[2]+"-"+dob[1]+"-"+dob[0]);
			applicant.put("gender", request.getParameter("savieApplicantBeanGender"));
			applicant.put("hkId", request.getParameter("savieApplicantBean.hkId"));
			applicant.put("passport", "");
			//request.getParameter("savieApplicantBean.maritalStatus").split("-")[0]
			applicant.put("maritalStatus", "SINGLE");
			applicant.put("placeOfBirth", request.getParameter("savieApplicantBean.placeOfBirth").split("-")[0]);
			applicant.put("nationality", request.getParameter("savieApplicantBean.nationality").split("-")[0]);
			applicant.put("residentialTelNoCountryCode", request.getParameter("savieApplicantBean[0].residentialTelNo"));
			applicant.put("residentialTelNo", request.getParameter("savieApplicantBean[1].residentialTelNo"));
			applicant.put("mobileNoCountryCode", request.getParameter("savieApplicantBean[0].mobileNo"));
			applicant.put("mobileNo", request.getParameter("savieApplicantBean[1].mobileNo"));
			applicant.put("email", request.getParameter("savieApplicantBean.emailAddress"));
			JSONObject residentialAddress = new JSONObject();
			residentialAddress.put("line1", request.getParameter("savieApplicantBean.residentialAdress1"));
			residentialAddress.put("line2", request.getParameter("savieApplicantBean.residentialAdress2"));
			residentialAddress.put("line3", request.getParameter("savieApplicantBean.residentialAdress3"));
			residentialAddress.put("line4", "R District");
			residentialAddress.put("district", request.getParameter("savieApplicantBean.residentialDistrict").split("-")[0]);
			applicant.put("residentialAddress", residentialAddress);
			JSONObject correspondenceAddress = new JSONObject();
			correspondenceAddress.put("line1", request.getParameter("savieApplicantBean.correspondenceAdress1"));
			correspondenceAddress.put("line2", request.getParameter("savieApplicantBean.correspondenceAdress2"));
			correspondenceAddress.put("line3", request.getParameter("savieApplicantBean.correspondenceAdress3"));
			correspondenceAddress.put("line4", "C District");
			correspondenceAddress.put("district", request.getParameter("savieApplicantBean.correspondenceDistrict").split("-")[0]);
			applicant.put("correspondenceAddress", correspondenceAddress);
			JSONObject permanentAddress = new JSONObject();
			permanentAddress.put("line1", request.getParameter("savieApplicantBean.permanentAddress1"));
			permanentAddress.put("line2", request.getParameter("savieApplicantBean.permanentAddress2"));
			permanentAddress.put("line3", request.getParameter("savieApplicantBean.permanentAddress3"));
			permanentAddress.put("line4", "C District");
			permanentAddress.put("district", request.getParameter("savieApplicantBean.permanentAddress").split("-")[0]);
			applicant.put("permanentAddress", permanentAddress);
			JSONObject employmentStatus = new JSONObject();
			employmentStatus.put("employmentStatus", request.getParameter("savieEmploymentBean.employmentStatus").split("-")[0]);
			employmentStatus.put("occupation", request.getParameter("savieEmploymentBean.occupation").split("-")[0]);
			employmentStatus.put("educationLevel", request.getParameter("savieEmploymentBean.educationLevel").split("-")[0]);
			employmentStatus.put("natureOfBusiness", request.getParameter("savieEmploymentBean.natureOfBusiness").split("-")[0]);
			employmentStatus.put("monthlyPersonalIncome", request.getParameter("savieEmploymentBean.monthlyPersonalIncome").split("-")[0]);
			employmentStatus.put("liquidAsset", "");
			applicant.put("employmentStatus", employmentStatus);
			applicant.put("smoke", request.getParameter("savieApplicantBeanSmoke"));
			parameters.put("applicant", applicant);
			JSONArray beneficiaries = new JSONArray();
			JSONObject beneficiarie1 = new JSONObject();
			beneficiarie1.put("firstName", request.getParameter("savieBeneficiaryBean[0].firstName"));
			beneficiarie1.put("lastName", request.getParameter("savieBeneficiaryBean[0].lastName"));
			beneficiarie1.put("chineseName", request.getParameter("savieBeneficiaryBean[0].chineseName"));
			beneficiarie1.put("hkId", request.getParameter("savieBeneficiaryBean[0].hkId"));
			beneficiarie1.put("passport", request.getParameter("savieBeneficiaryBean[0].passportNo"));
			beneficiarie1.put("gender", request.getParameter("savieBeneficiaryBean[0].gender"));
			beneficiarie1.put("relationship", request.getParameter("savieBeneficiaryBean[0].relationship").split("-")[0]);
			beneficiarie1.put("entitlement", request.getParameter("savieBeneficiaryBean[0].entitlement"));
			beneficiaries.add(beneficiarie1);
			parameters.put("beneficiaries", beneficiaries);
			JSONObject payment = new JSONObject();
			payment.put("amount", Double.valueOf(eliteTermPremium.getMonthlyDuePremium())*2.00);
			payment.put("paymentMethod", "CreditCard");
			payment.put("bankName", "");
			payment.put("branchName", "");
			payment.put("accountNo", "");
			payment.put("expiryDate", "");
			parameters.put("payment", payment);
			parameters.put("insuredAmount", 100000);
			logger.info(parameters.toString());
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
			request.getSession().setAttribute("eliteTermPremium", apiReturn);
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
