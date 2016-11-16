package com.ifwd.fwdhk.services.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;

import com.ifwd.ecomm.chinese.ZHConverter;
import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.connector.ECommWsConnector;
import com.ifwd.fwdhk.connector.request.eliteterm.CreateEliteTermPolicyRequest;
import com.ifwd.fwdhk.connector.response.BaseResponse;
import com.ifwd.fwdhk.connector.response.eliteterm.CreateEliteTermPolicyResponse;
import com.ifwd.fwdhk.connector.response.eliteterm.GetEliteTermPremiumResponse;
import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.OptionItemDesc;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.model.eliteterm.EliteTermPlanDetailBean;
import com.ifwd.fwdhk.model.life.LifeDeclarationBean;
import com.ifwd.fwdhk.services.EliteTermService;
import com.ifwd.fwdhk.util.ClientBrowserUtil;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.FileUtil;
import com.ifwd.fwdhk.util.HeaderUtil;
import com.ifwd.fwdhk.util.ImgUtil;
import com.ifwd.fwdhk.util.Methods;import com.ifwd.fwdhk.util.InitApplicationMessage;import com.ifwd.fwdhk.util.PolicyNoUtil;
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
		EliteTermPlanDetailBean etPlanDetail = (EliteTermPlanDetailBean) request.getSession().getAttribute("etPlanDetail");
		
		if (eliteTermPremium == null) {
			throw new ECOMMAPIException("session expired");
		}
		CreateEliteTermPolicyRequest etPolicyApplication = (CreateEliteTermPolicyRequest) request.getSession().getAttribute("etPolicyApplication");
		if(etPolicyApplication == null){
			etPolicyApplication = new CreateEliteTermPolicyRequest();
		}		
		CreateEliteTermPolicyResponse apiReturn = null;
		StringBuffer inputMsg = new StringBuffer();
		try {
			final Map<String,String> header = headerUtil.getHeader1(request);
			
			logger.debug(request.getParameterMap().toString());
			JSONObject parameters = new JSONObject();
			parameters.put("planCode", "ET");
			JSONObject applicant = new JSONObject();
			applicant.put("firstName", request.getParameter("savieApplicantBean.firstName"));
			etPolicyApplication.getApplicant().setFirstName(applicant.getString("firstName"));
			applicant.put("lastName", request.getParameter("savieApplicantBean.lastName"));
			etPolicyApplication.getApplicant().setLastName(applicant.getString("lastName"));
			applicant.put("chineseName", request.getParameter("savieApplicantBean.chineseName"));
			etPolicyApplication.getApplicant().setChineseName(applicant.getString("chineseName"));
			inputMsg.append(applicant.getString("chineseName"));
			String[] dob = request.getParameter("dob").toString().split("-");
			applicant.put("dob", dob[2]+"-"+dob[1]+"-"+dob[0]);
			etPolicyApplication.getApplicant().setDob(applicant.getString("dob"));
			applicant.put("gender", request.getParameter("savieApplicantBeanGender"));
			etPolicyApplication.getApplicant().setGender(applicant.getString("gender"));
			applicant.put("hkId", request.getParameter("savieApplicantBean.hkId"));
			etPolicyApplication.getApplicant().setHkId(applicant.getString("hkId"));
			applicant.put("passport", "");
			etPolicyApplication.getApplicant().setPassport(applicant.getString("passport"));
			applicant.put("maritalStatus", request.getParameter("savieApplicantBean.maritalStatus")!=null?request.getParameter("savieApplicantBean.maritalStatus").split("-")[0]:"");
			applicant.put("placeOfBirth", request.getParameter("savieApplicantBean.placeOfBirth")!=null?request.getParameter("savieApplicantBean.placeOfBirth").split("-")[0]:"");
			applicant.put("nationality", request.getParameter("savieApplicantBean.nationality")!=null?request.getParameter("savieApplicantBean.nationality").split("-")[0]:"");
			applicant.put("residentialTelNoCountryCode", "852");
			applicant.put("residentialTelNo", request.getParameter("savieApplicantBean.residentialTelNo"));
			applicant.put("mobileNoCountryCode", "852");
			applicant.put("mobileNo", Methods.formatMobile(request.getParameter("savieApplicantBean.mobileNo")));
			etPolicyApplication.getApplicant().setMobileNo(applicant.getString("mobileNo"));
			applicant.put("email", request.getParameter("savieApplicantBean.emailAddress"));
			request.getSession().setAttribute("eliteTermEmail", request.getParameter("savieApplicantBean.emailAddress"));
			etPolicyApplication.getApplicant().setEmail(applicant.getString("email"));
			JSONObject permanentAddress = new JSONObject();
			permanentAddress.put("line1", request.getParameter("savieApplicantBean.permanentAddress1"));
			permanentAddress.put("line2", request.getParameter("savieApplicantBean.permanentAddress2"));
			permanentAddress.put("line3", request.getParameter("savieApplicantBean.permanentAddress3"));
			permanentAddress.put("line4", request.getParameter("savieApplicantBean.permanentAddress")!=null?request.getParameter("savieApplicantBean.permanentAddress").split("-")[0]:"");
			
			inputMsg.append(request.getParameter("savieApplicantBean.permanentAddress1"));
			inputMsg.append(request.getParameter("savieApplicantBean.permanentAddress2"));
			inputMsg.append(request.getParameter("savieApplicantBean.permanentAddress3"));
			inputMsg.append(request.getParameter("savieApplicantBean.permanentAddress4"));
			
			permanentAddress.put("district", request.getParameter("savieApplicantBean.permanentAddress")!=null?request.getParameter("savieApplicantBean.permanentAddress").split("-")[0]:"");
			applicant.put("permanentAddress", permanentAddress);
			JSONObject residentialAddress = new JSONObject();
			if(request.getParameter("savieApplicantBean.isResidential") != null && request.getParameter("savieApplicantBean.isResidential").equals("true")){
				residentialAddress.put("line1", request.getParameter("savieApplicantBean.residentialAdress1"));
				residentialAddress.put("line2", request.getParameter("savieApplicantBean.residentialAdress2"));
				residentialAddress.put("line3", request.getParameter("savieApplicantBean.residentialAdress3"));
				residentialAddress.put("line4", request.getParameter("savieApplicantBean.residentialDistrict")!=null?request.getParameter("savieApplicantBean.residentialDistrict").split("-")[0]:"");
				residentialAddress.put("district", request.getParameter("savieApplicantBean.residentialDistrict")!=null?request.getParameter("savieApplicantBean.residentialDistrict").split("-")[0]:"");
			}
			else{
				residentialAddress.put("line1", permanentAddress.get("line1"));
				residentialAddress.put("line2", permanentAddress.get("line2"));
				residentialAddress.put("line3", permanentAddress.get("line3"));
				residentialAddress.put("line4", permanentAddress.get("line4"));
				residentialAddress.put("district", permanentAddress.get("district"));
			}
			
			inputMsg.append(residentialAddress.getString("line1"));
			inputMsg.append(residentialAddress.getString("line2"));
			inputMsg.append(residentialAddress.getString("line3"));
			inputMsg.append(residentialAddress.getString("line4"));
			
			applicant.put("residentialAddress", residentialAddress);
			JSONObject correspondenceAddress = new JSONObject();
			if(request.getParameter("savieApplicantBean.addressIsSame") != null && request.getParameter("savieApplicantBean.addressIsSame").equals("true")){
				correspondenceAddress.put("line1", request.getParameter("savieApplicantBean.correspondenceAdress1"));
				correspondenceAddress.put("line2", request.getParameter("savieApplicantBean.correspondenceAdress2"));
				correspondenceAddress.put("line3", request.getParameter("savieApplicantBean.correspondenceAdress3"));
				correspondenceAddress.put("line4", request.getParameter("savieApplicantBean.correspondenceDistrict")!=null?request.getParameter("savieApplicantBean.correspondenceDistrict").split("-")[0]:"");
				correspondenceAddress.put("district", request.getParameter("savieApplicantBean.correspondenceDistrict")!=null?request.getParameter("savieApplicantBean.correspondenceDistrict").split("-")[0]:"");
			}
			else{
				correspondenceAddress.put("line1", residentialAddress.get("line1"));
				correspondenceAddress.put("line2", residentialAddress.get("line2"));
				correspondenceAddress.put("line3", residentialAddress.get("line3"));
				correspondenceAddress.put("line4", residentialAddress.get("line4"));
				correspondenceAddress.put("district", residentialAddress.get("district"));
			}
			
			inputMsg.append(correspondenceAddress.getString("line1"));
			inputMsg.append(correspondenceAddress.getString("line2"));
			inputMsg.append(correspondenceAddress.getString("line3"));
			inputMsg.append(correspondenceAddress.getString("line4"));
			
			applicant.put("correspondenceAddress", correspondenceAddress);
			JSONObject employmentStatus = new JSONObject();
			employmentStatus.put("employmentStatus", request.getParameter("savieEmploymentBean.employmentStatus")!=null?request.getParameter("savieEmploymentBean.employmentStatus").split("-")[0]:"");
			employmentStatus.put("occupation", request.getParameter("savieEmploymentBean.occupation")!=null?request.getParameter("savieEmploymentBean.occupation").split("-")[0]:"");
			employmentStatus.put("educationLevel", request.getParameter("savieEmploymentBean.educationLevel")!=null?request.getParameter("savieEmploymentBean.educationLevel").split("-")[0]:"");
			employmentStatus.put("natureOfBusiness", request.getParameter("savieEmploymentBean.natureOfBusiness")!=null?request.getParameter("savieEmploymentBean.natureOfBusiness").split("-")[0]:"");
			employmentStatus.put("monthlyPersonalIncome", request.getParameter("savieEmploymentBean.monthlyPersonalIncome")!=null?request.getParameter("savieEmploymentBean.monthlyPersonalIncome").split("-")[0]:"");
			employmentStatus.put("liquidAsset", request.getParameter("savieEmploymentBean.liquidAssets")!=null?request.getParameter("savieEmploymentBean.liquidAssets").split("-")[0]:"");
			employmentStatus.put("amountOtherSource", request.getParameter("savieEmploymentBean.sourceOfIncome")!=null?request.getParameter("savieEmploymentBean.sourceOfIncome").split("-")[0]:"");
			employmentStatus.put("employerName", request.getParameter("savieEmploymentBean.currentEmployerName"));
			applicant.put("employmentStatus", employmentStatus);
			applicant.put("smoke", etPlanDetail.getSmoke());
			applicant.put("optOut1", (request.getParameter("isMarketingInfo")!=null&&!request.getParameter("isMarketingInfo").equals(""))?"true":"false");
			applicant.put("optOut2", (request.getParameter("isPersonalData")!=null&&!request.getParameter("isPersonalData").equals(""))?"true":"false");
			
			parameters.put("applicant", applicant);
			JSONObject insured = new JSONObject();
			insured.put("name", applicant.getString("firstName")+" "+applicant.getString("lastName"));
			insured.put("hkId", applicant.getString("hkId"));
			insured.put("passport", applicant.getString("passport"));
			insured.put("relationship", "SE");
			JSONArray beneficiaries = new JSONArray();
			JSONObject beneficiarie1 = new JSONObject();
			JSONObject beneficiarie2 = new JSONObject();
			JSONObject beneficiarie3 = new JSONObject();
			if(request.getParameter("beneficiary-info") != null && request.getParameter("beneficiary-info").equals("name-others-now")){
				if(request.getParameter("savieBeneficiaryBean[0].firstName")!=null && request.getParameter("savieBeneficiaryBean[0].firstName")!=""){
					beneficiarie1.put("firstName", request.getParameter("savieBeneficiaryBean[0].firstName"));
					beneficiarie1.put("lastName", request.getParameter("savieBeneficiaryBean[0].lastName"));
					beneficiarie1.put("chineseName", request.getParameter("savieBeneficiaryBean[0].chineseName"));
					inputMsg.append(beneficiarie1.getString("chineseName"));
					beneficiarie1.put("hkId", request.getParameter("savieBeneficiaryBean[0].hkId"));
					beneficiarie1.put("passport", request.getParameter("savieBeneficiaryBean[0].passportNo"));
					beneficiarie1.put("gender", request.getParameter("savieBeneficiaryBean[0].gender"));
					beneficiarie1.put("relationship", request.getParameter("savieBeneficiaryBean[0].relationship")!=null?request.getParameter("savieBeneficiaryBean[0].relationship").split("-")[0]:"");
					beneficiarie1.put("entitlement", request.getParameter("savieBeneficiaryBean[0].entitlement"));
					beneficiaries.add(beneficiarie1);
				}
				if(request.getParameter("savieBeneficiaryBean[1].firstName")!=null && request.getParameter("savieBeneficiaryBean[1].firstName")!=""){
					beneficiarie2.put("firstName", request.getParameter("savieBeneficiaryBean[1].firstName"));
					beneficiarie2.put("lastName", request.getParameter("savieBeneficiaryBean[1].lastName"));
					beneficiarie2.put("chineseName", request.getParameter("savieBeneficiaryBean[1].chineseName"));
					inputMsg.append(beneficiarie2.getString("chineseName"));
					beneficiarie2.put("hkId", request.getParameter("savieBeneficiaryBean[1].hkId"));
					beneficiarie2.put("passport", request.getParameter("savieBeneficiaryBean[1].passportNo"));
					beneficiarie2.put("gender", request.getParameter("savieBeneficiaryBean[1].gender"));
					beneficiarie2.put("relationship", request.getParameter("savieBeneficiaryBean[1].relationship")!=null?request.getParameter("savieBeneficiaryBean[1].relationship").split("-")[0]:"");
					beneficiarie2.put("entitlement", request.getParameter("savieBeneficiaryBean[1].entitlement"));
					beneficiaries.add(beneficiarie2);
				}
				if(request.getParameter("savieBeneficiaryBean[2].firstName")!=null && request.getParameter("savieBeneficiaryBean[2].firstName")!=""){
					beneficiarie3.put("firstName", request.getParameter("savieBeneficiaryBean[2].firstName"));
					beneficiarie3.put("lastName", request.getParameter("savieBeneficiaryBean[2].lastName"));
					beneficiarie3.put("chineseName", request.getParameter("savieBeneficiaryBean[2].chineseName"));
					inputMsg.append(beneficiarie3.getString("chineseName"));
					beneficiarie3.put("hkId", request.getParameter("savieBeneficiaryBean[2].hkId"));
					beneficiarie3.put("passport", request.getParameter("savieBeneficiaryBean[2].passportNo"));
					beneficiarie3.put("gender", request.getParameter("savieBeneficiaryBean[2].gender"));
					beneficiarie3.put("relationship", request.getParameter("savieBeneficiaryBean[2].relationship")!=null?request.getParameter("savieBeneficiaryBean[2].relationship").split("-")[0]:"");
					beneficiarie3.put("entitlement", request.getParameter("savieBeneficiaryBean[2].entitlement"));
					beneficiaries.add(beneficiarie3);
				}
			}
			else{
				beneficiarie1.put("firstName", applicant.getString("firstName"));
				beneficiarie1.put("lastName", applicant.getString("lastName"));
				beneficiarie1.put("chineseName", applicant.getString("chineseName"));
				inputMsg.append(beneficiarie1.getString("chineseName"));
				beneficiarie1.put("hkId", applicant.getString("hkId"));
				beneficiarie1.put("passport", applicant.getString("passport"));
				beneficiarie1.put("gender", applicant.getString("gender"));
				beneficiarie1.put("relationship", "SE");
				beneficiarie1.put("entitlement", "100");
				beneficiaries.add(beneficiarie1);
			}
			insured.put("beneficiaries", beneficiaries);
			parameters.put("insured", insured);
			JSONObject payment = new JSONObject();
			payment.put("amount", Double.valueOf(eliteTermPremium.getMonthlyDuePremium())*2.00);
			payment.put("paymentMethod", "CreditCard");
			payment.put("bankName", "");
			payment.put("branchName", "");
			payment.put("accountNo", "");
			payment.put("expiryDate", "");
			parameters.put("payment", payment);
			parameters.put("insuredAmount", etPolicyApplication.getAmount());
			parameters.put("referralCode", eliteTermPremium.getPromoCode()!=null?eliteTermPremium.getPromoCode():"");
			
			if(!"None".equals(request.getParameter("hasTheClubMembershipNo"))){
				parameters.put("externalParty", "THE CLUB");
				parameters.put("externalPartyCode", request.getParameter("theClubMembershipNo"));
			}
			else{
				parameters.put("externalParty", "");
				parameters.put("externalPartyCode", "");
			}
			logger.info(parameters.toString());
			
			/*if(ZHConverter.hasSimpleChinese(inputMsg.toString())){
				String[] errMsgs = new String[]{"Some input information contains simplified Chinese"};
				apiReturn.setErrMsgs(errMsgs);
				logger.info(errMsgs[0]);
			}
			else{*/
				apiReturn = connector.createEliteTermPolicy(parameters, header);
			//}
			
			request.getSession().setAttribute("eliteTermPolicy", apiReturn);
			request.getSession().setAttribute("etPolicyApplication", etPolicyApplication);
		}catch(Exception e){
			logger.info("EliteTermServiceImpl createEliteTermPolicy occurs an exception!");
			logger.error(e.getMessage());
			logger.error(ExceptionUtils.getStackTrace(e));
			e.printStackTrace();
		}
		return apiReturn;
	}
	
	@Override
	@SuppressWarnings({ "restriction", "unchecked", "unused"})
	public BaseResponse sendImage(HttpServletRequest request,String passportFlage) throws ECOMMAPIException{
		BaseResponse apiReturn = new BaseResponse();
		FileInputStream is = null;
		BaseResponse br = null;
		try {
			CreateEliteTermPolicyResponse eliteTermPolicy = (CreateEliteTermPolicyResponse) request.getSession().getAttribute("eliteTermPolicy");
			String policyNo = eliteTermPolicy.getPolicyNo();
			String documentPath = UserRestURIConstants.getConfigs("documentPath");
			String uploadDir = documentPath + "/"+new sun.misc.BASE64Encoder().encode(policyNo.getBytes())+"/"; 
			File file = new File(uploadDir);
			byte data[];
			int i;
			final Map<String, String> header = headerUtil.getHeader1(request);
			Map<String,Object> clientBrowserInfo = ClientBrowserUtil.getClientInfo(request);
			org.json.simple.JSONObject parameters = new org.json.simple.JSONObject();
			parameters.put("clientBrowserInfo", clientBrowserInfo);
			parameters.put("policyNo", policyNo);
			parameters.put("planCode", "ET");
			String fileToUpload = (String) request.getSession().getAttribute("fileToUploadProofAdd");
			String hkidFileToUpload = (String) request.getSession().getAttribute("hkidFileToUpload");
			File hkidFileToUploadImage = new File(uploadDir+hkidFileToUpload);
			File fileToUploadImage = new File(uploadDir+fileToUpload);
			is = new FileInputStream(fileToUploadImage);
			i = is.available(); // 得到文件大小  
			data = new byte[i];  
			is.read(data); // 读数据  
			is.close();  
			String fileToUploadImageBase64 =new sun.misc.BASE64Encoder().encode(data);
			String fileToUploadProofAddType = (String) request.getSession().getAttribute("fileToUploadProofAddType");
			parameters.put("fileType", fileToUploadProofAddType);
			parameters.put("documentType", "proof");
			parameters.put("originalFilePath", policyNo+PolicyNoUtil.getRandomString()+"."+fileToUploadProofAddType);
			parameters.put("base64", fileToUploadImageBase64);
			br = connector.uploadDocuments(parameters, header);
			if(br.getErrMsgs()!=null){
				throw new ECOMMAPIException("system error");
			}
			if("true".equals(passportFlage)){
				String passportFileToUpload = (String) request.getSession().getAttribute("passportFileToUpload");
				File passportFileToUploadImage = new File(uploadDir+passportFileToUpload);
				is = new FileInputStream(passportFileToUploadImage);
				i = is.available(); // 得到文件大小  
				data = new byte[i];  
				is.read(data); // 读数据  
				is.close();  
				String passportFileToUploadImageBase64 =new sun.misc.BASE64Encoder().encode(data);
				String passportFileToUploadType = (String) request.getSession().getAttribute("passportFileToUploadType");
				parameters.put("fileType", passportFileToUploadType);
				parameters.put("documentType", "passport");
				parameters.put("originalFilePath", policyNo+PolicyNoUtil.getRandomString()+"."+passportFileToUploadType);
				parameters.put("base64", passportFileToUploadImageBase64);
				br = connector.uploadDocuments(parameters, header);
				if(br.getErrMsgs()!=null){
					throw new ECOMMAPIException("system error");
				}
			}
				
			is = new FileInputStream(hkidFileToUploadImage);
			i = is.available(); // 得到文件大小  
			data = new byte[i];  
			is.read(data); // 读数据  
			is.close();  
			String hkidFileToUploadImageBase64 =new sun.misc.BASE64Encoder().encode(data);
			String  hkidFileToUploadType = (String) request.getSession().getAttribute("hkidFileToUploadType");
			parameters.put("fileType", hkidFileToUploadType);
			parameters.put("documentType", "hkid");
			parameters.put("originalFilePath", policyNo+PolicyNoUtil.getRandomString()+"."+hkidFileToUploadType);
			parameters.put("base64", hkidFileToUploadImageBase64);
			br = connector.uploadDocuments(parameters, header);
			if(br.getErrMsgs()!=null){
				throw new ECOMMAPIException("system error");
			}
	        FileUtil.deletFile(uploadDir);
	        request.getSession().removeAttribute("fileToUploadProofAdd");
	        request.getSession().removeAttribute("hkidFileToUpload");
	        request.getSession().removeAttribute("passportFileToUpload");
	        request.getSession().removeAttribute("fileToUploadProofAddType");
	        request.getSession().removeAttribute("passportFileToUploadType");
	        request.getSession().removeAttribute("hkidFileToUploadType");
		}catch(ECOMMAPIException e){
			logger.info("EliteTermServiceImpl sendImage occurs an exception!");
			logger.error(e.getMessage());
			logger.error(ExceptionUtils.getStackTrace(e));
			e.printStackTrace();
			apiReturn.setErrMsg(e.getMessage());
			return apiReturn;
		}catch(Exception e){
			logger.info("EliteTermServiceImpl sendImage occurs an exception!");
			logger.error(e.getMessage());
			logger.error(ExceptionUtils.getStackTrace(e));
			e.printStackTrace();
			apiReturn.setErrMsg("system error");
			return apiReturn;
		}finally{
			try {
				is.close();
			} catch (IOException e) {
				logger.error(e.getMessage());
				logger.error(ExceptionUtils.getStackTrace(e));
				e.printStackTrace();
			}  
		}
		return apiReturn;
	}
	
	@Override
	public GetEliteTermPremiumResponse getEliteTermPremium(EliteTermPlanDetailBean etPlanDetail,HttpServletRequest request)throws ECOMMAPIException{
		GetEliteTermPremiumResponse apiReturn = null;
		try {
			final Map<String,String> header = headerUtil.getHeader1(request);
			apiReturn = connector.getEliteTermPremium(etPlanDetail, header);
			request.getSession().setAttribute("etPlanDetail", etPlanDetail);
			request.getSession().setAttribute("eliteTermPremium", apiReturn);
			request.getSession().removeAttribute("sendEmailOrNot");
		}catch(Exception e){
			logger.info("EliteTermServiceImpl getEliteTermPremium occurs an exception!");
			logger.error(e.getMessage());
			logger.error(ExceptionUtils.getStackTrace(e));
			e.printStackTrace();
			apiReturn.setErrMsg("api error");
		}
		return apiReturn;
	}
	
	@Override
	public BaseResponse finalizeEliteTermPolicy(HttpServletRequest request,String policyNo)throws ECOMMAPIException{
		BaseResponse apiReturn = null;
		try {
			final Map<String,String> header = headerUtil.getHeader1(request);
			
			JSONObject parameters = new JSONObject();
			parameters.put("planCode", "ET");
			parameters.put("creditCaredNo", request.getSession().getAttribute("creditCaredNo"));
			parameters.put("expiryDate", request.getSession().getAttribute("expiryDate"));
			parameters.put("cardHolderName", request.getSession().getAttribute("cardHolderName"));
			parameters.put("policyNo", policyNo);
			apiReturn = connector.finalizeEliteTermPolicy(parameters, header);
		}catch(Exception e){
			logger.info("EliteTermServiceImpl finalizeEliteTermPolicy occurs an exception!");
			logger.error(e.getMessage());
			logger.error(ExceptionUtils.getStackTrace(e));
			e.printStackTrace();
		}
		return apiReturn;
	}
	
	@Override
	public BaseResponse getUploadedDocument(HttpServletRequest request)throws ECOMMAPIException{
		BaseResponse apiReturn = null;
		try {
			final Map<String,String> header = headerUtil.getHeader1(request);
			apiReturn = connector.getUploadedDocument(header);
		}catch(Exception e){
			logger.info("EliteTermServiceImpl getUploadedDocument occurs an exception!");
			logger.error(e.getMessage());
			logger.error(ExceptionUtils.getStackTrace(e));
			e.printStackTrace();
		}
		return apiReturn;
	}
	
	@Override
	public BaseResponse contactCs(HttpServletRequest request)throws ECOMMAPIException{
		BaseResponse apiReturn = null;
		try {
			final Map<String,String> header = headerUtil.getHeader1(request);
			
			JSONObject parameters = new JSONObject();
			parameters.put("name", request.getParameter("name"));
			parameters.put("email", request.getParameter("email"));
			parameters.put("mobile", Methods.formatMobile(request.getParameter("mobile")));
			parameters.put("preferredDay", request.getParameter("preferredDay").split("-")[0]);
			parameters.put("preferredTimeSlot", request.getParameter("preferredTimeSlot").split("-")[0]);
			parameters.put("enquiryType", request.getParameter("enquiryType").split("-")[0]);
			parameters.put("channel", request.getParameter("channel"));
			parameters.put("product", request.getParameter("product"));
			apiReturn = connector.contactCs(parameters, header);
		}catch(Exception e){
			logger.info("EliteTermServiceImpl contactCs occurs an exception!");
			logger.error(e.getMessage());
			logger.error(ExceptionUtils.getStackTrace(e));
			e.printStackTrace();
		}
		return apiReturn;
	}
	
	@Override
	public BaseResponse setEliteTermPolicyAgentEmail(HttpServletRequest request)throws ECOMMAPIException{
		BaseResponse apiReturn = null;
		try {
			final Map<String,String> header = headerUtil.getHeader1(request);
			
			JSONObject parameters = new JSONObject();
			parameters.put("policyNo", request.getParameter("policyNo"));
			parameters.put("agentEmail", request.getParameter("agentEmail"));
			apiReturn = connector.setEliteTermPolicyAgentEmail(parameters, header);
		}catch(Exception e){
			logger.info("EliteTermServiceImpl setEliteTermPolicyAgentEmail occurs an exception!");
			logger.error(e.getMessage());
			logger.error(ExceptionUtils.getStackTrace(e));
			e.printStackTrace();
		}
		return apiReturn;
	}
	
	@SuppressWarnings("restriction")
	@Override
	public BaseResponse uploadSignature(HttpServletRequest request,String image,String policyNo)throws ECOMMAPIException{		
		BaseResponse br = null;
		try {
			String documentPath = UserRestURIConstants.getConfigs("documentPath");
			String uploadDir = documentPath + "/"+new sun.misc.BASE64Encoder().encode(policyNo.getBytes()); 
	        File dirPath = new File(uploadDir);  
	        if (!dirPath.exists()) {   
	            dirPath.mkdirs();  
	        } 
	        String sep = System.getProperty("file.separator"); 
	        File uploadedFile = new File(uploadDir + sep  
	                + "JSignature.png");
	        byte[] bytes = new sun.misc.BASE64Decoder().decodeBuffer(image);
	        FileCopyUtils.copy(bytes, uploadedFile);
	        File toFile = new File(uploadDir + sep  
	                + "JSignature.jpg");
	        ImgUtil.changeImageToJPG(uploadedFile, toFile,request);
	        
	        byte[] toFileBytes= FileCopyUtils.copyToByteArray(toFile);
	        image = new sun.misc.BASE64Encoder().encode(toFileBytes);

	        FileUtil.deletFile(uploadDir);
	        
			final Map<String,String> header = headerUtil.getHeader1(request);
			Map<String,Object> clientBrowserInfo = ClientBrowserUtil.getClientInfo(request);
			JSONObject parameters = new JSONObject();
			parameters.put("clientBrowserInfo", clientBrowserInfo);
			parameters.put("planCode", "ET");
			parameters.put("fileType", "jpg");
			parameters.put("documentType", "signature");
			parameters.put("originalFilePath", "");
			parameters.put("base64", image);
			parameters.put("policyNo", policyNo);
			br = connector.uploadSignature(parameters, header);
		} catch (ECOMMAPIException e) {
			logger.info("EliteTermServiceImpl uploadSignature occurs an exception!");
			logger.error(e.getMessage());
			logger.error(ExceptionUtils.getStackTrace(e));
			e.printStackTrace();
		} catch (Exception e) {
			logger.info("EliteTermServiceImpl uploadSignature occurs an exception!");
			logger.error(e.getMessage());
			logger.error(ExceptionUtils.getStackTrace(e));
			e.printStackTrace();
		}
		return br;
	}
	
	
	@Override
	public BaseResponse sendEliteTermMail(HttpServletRequest request)throws ECOMMAPIException{
		BaseResponse br = null;
		try {
			CreateEliteTermPolicyResponse eliteTermPolicy = (CreateEliteTermPolicyResponse) request.getSession().getAttribute("eliteTermPolicy");
			String policyNo = eliteTermPolicy.getPolicyNo();
			String language = (String) request.getSession().getAttribute("language");
			if(StringUtils.isEmpty(language)){
				language = "tc";
			}
			CreateEliteTermPolicyRequest etPolicyApplication = (CreateEliteTermPolicyRequest) request.getSession().getAttribute("etPolicyApplication");
			UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
			String customerName = userDetails.getFullName();
			if(StringUtils.isEmpty(customerName)){
				customerName =  userDetails.getFirstName()+" "+userDetails.getLastName();
			}
			final Map<String,String> header = headerUtil.getHeader1(request);
			header.put("language", "ZH");
			String to = (String) request.getSession().getAttribute("eliteTermEmail");
			logger.info("To Email:"+to);
			String serverUrl = request.getScheme()+"://"+request.getServerName()+request.getContextPath();
			if (request.getServerPort() != 80 && request.getServerPort() != 443)
			{
				serverUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
			}
			String imgUrl = serverUrl + "/resources/images/elite-terms/ifwd_hero-banner_edm.jpg";
			String url = serverUrl + "/"+language+"/term-life-insurance/document-upload?policyNumber="+new sun.misc.BASE64Encoder().encode(policyNo.getBytes());
			
			String message = "<html><head><meta charset='UTF-8'><title>FWD Elite Term – Pending ["+policyNo+"]</title></head>"
					       + "<body><div marginwidth='0' marginheight='0' style='margin:0;padding:0;background-color:#f2f2f2;min-height:100%!important;width:100%!important'><center>"
					       + "<table align='center' border='0' cellpadding='0' cellspacing='0' height='100%' width='100%' style='border-collapse:collapse;margin:0;padding:0;background-color:#f2f2f2;height:100%!important;width:100%!important'>"
					       + "<tbody><tr><td align='center' valign='top' style='margin:0;padding:20px;border-top:0;height:100%!important;width:100%!important'>"
					       + "<table border='0' cellpadding='0' cellspacing='0' width='600' style='border-collapse:collapse;border:0'>"
					       + "<tbody><tr><td align='center' valign='top'><table border='0' cellpadding='0' cellspacing='0' width='600' style='border-collapse:collapse;background-color:#ffffff;border-top:0;border-bottom:0'>"
					       + "<tbody><tr><td valign='top' style='padding-top:9px'><table border='0' cellpadding='0' cellspacing='0' width='100%' style='border-collapse:collapse'>"
					       + "<tbody><tr><td valign='top'><table align='left' border='0' cellpadding='0' cellspacing='0' width='266' style='border-collapse:collapse'>"
					       + "<tbody><tr><td valign='top' style='padding-top:9px;padding-left:18px;padding-bottom:9px;padding-right:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px;line-height:125%;text-align:left'><a href='"+serverUrl+"' style='word-wrap:break-word;color:#606060;font-weight:normal;text-decoration:underline' target='_blank'><img align='none' src='"+serverUrl+"/resources/images/fwd-email-logo.jpg' style='margin:0px;border:0;outline:none;text-decoration:none;min-height:auto!important' class='CToWUd'></a></td></tr></tbody></table>"
					       + "<table align='right' border='0' cellpadding='0' cellspacing='0' width='297' style='border-collapse:collapse'><tbody><tr><td valign='top' style='padding-top:9px;padding-right:18px;padding-bottom:9px;padding-left:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px;line-height:125%;text-align:left'><div style='text-align:right'><br></div></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table></td></tr>"
					       + "<tr><td align='center' valign='top'><table border='0' cellpadding='0' cellspacing='0' width='600' style='border-collapse:collapse;background-color:#ffffff;border-top:0;border-bottom:0'>"
					       + "<tbody><tr><td valign='top'><table border='0' cellpadding='0' cellspacing='0' width='100%' style='border-collapse:collapse'>"
					       + "<tbody><tr><td valign='top' style='padding:0px'><table align='left' width='100%' border='0' cellpadding='0' cellspacing='0' style='border-collapse:collapse'>"
					       + "<tbody><tr><td valign='top' style='padding-right:0px;padding-left:0px;padding-top:0;padding-bottom:0;text-align:center'><img align='center' alt='' "
					       + "src='"+imgUrl+"' "
					       + "width='600' style='max-width:600px;padding-bottom:0;display:inline!important;vertical-align:bottom;border:0;outline:none;text-decoration:none' class='CToWUd a6T' tabindex='0'>"
					       + "<div class='a6S' dir='ltr' style='opacity: 0.01; left: 572px; top: 311px;'><div id=':sw' class='T-I J-J5-Ji aQv T-I-ax7 L3 a5q' role='button' tabindex='0' aria-label='Download attachment ' data-tooltip-class='a1V' data-tooltip='Download'>"
					       + "<div class='aSK J-J5-Ji aYr'></div></div></div></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table></td></tr>"
					       + "<tr><td align='center' valign='top'><table border='0' cellpadding='0' cellspacing='0' width='600' style='border-collapse:collapse;background-color:#ffffff;border-top:0;border-bottom:0'>"
					       + "<tbody><tr><td valign='top'><table border='0' cellpadding='0' cellspacing='0' width='100%' style='border-collapse:collapse'>"
					       + "<tbody><tr><td valign='top'><table align='left' border='0' cellpadding='0' cellspacing='0' width='600' style='border-collapse:collapse'>"
					       + "<tbody><tr><td valign='top' style='padding:9px 18px;line-height:125%;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px;text-align:left'><div style='text-align:center'>"
					       + "<p dir='ltr' style='line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px'><span><span style='background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap'>"
					       + "Dear "+customerName+"，</span></span></p>"
					       + "<p dir='ltr' style='line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px'><span><span style='background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap'>Thank you for purchasing FWD Elite Term Insurance Plan via our website. Your first 2 months’ premium payment has been accepted. </p>"
					       + "<p dir='ltr' style='line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px'><span><span style='background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap'>多謝閣下經我們的網站投保富衛智理想定期保障計劃 。您的首2個月保費款項已被接納。</p>"
					       + "<p dir='ltr' style='line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px'><span><span style='background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap'>Your policy is not yet in force. To complete your application process, please upload your [HKID card copy], [passport copy] and [address proof] through the following link. </p>"
					       + "<p dir='ltr' style='line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px'><span><span style='background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap'>您的保單尚未正式生效，您需要通過以下的連結上載您的[身份證副本]，[護照複印件]和[住址證明]。</p>"
					       + "<a style='color:#ff8c00' href='"+url+"'><span style='background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap;text-decoration:underline;'>Document Upload 上載檔案</span></a>&nbsp;</p>"
					       + "<p dir='ltr' style='line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px'><span><span style='background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap'>Please ensure you complete the application process within 30 days, otherwise your application will be void.  For enquiry, please contact us at <a href=\"tel:+85231233123\">(852) 3123 3123</a> or via email at cs.hk@fwd.com.</p>"
					       + "<p dir='ltr' style='line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px'><span><span style='background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap'>請確保於30天內完成申請投保程序，否則您的投保申請會被作廢。如有任何查詢，請致電富衛客戶熱線 <a href=\"tel:+85231233123\">(852) 3123 3123</a> 或電郵至 cs.hk@fwd.com.</p>"
					       + "<p dir='ltr' style='line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px'><span><span style='background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap'>Please ignore this email if you have already successfully uploaded the above mentioned file. </p>"
					       + "<p dir='ltr' style='line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px'><span><span style='background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap'>請忽略此電郵，如果你已成功上載上述檔案。</p>&nbsp;"
					       + "<p dir='ltr' style='line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px'><span><span style='background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap'>We wish you a happy life!</p>"
					       + "<p dir='ltr' style='line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px'><span><span style='background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap'>祝閣下生活愉快！</p>&nbsp;"
					       + "<p dir='ltr' style='line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px'><span><span style='background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap'>Regards,<br>FWD Life Insurance Company (Bermuda) Limited (“FWD”)<br>富衛人壽保險(百慕達)有限公司（「富衛」）謹啟</span></span></p></div></td></tr></tbody></table></td></tr></tbody></table>"
					       + "<table border='0' cellpadding='0' cellspacing='0' width='100%' style='border-collapse:collapse'><tbody><tr><td style='padding:18px'>"
					       + "<table border='0' cellpadding='0' cellspacing='0' width='100%' style='border-top-width:1px;border-top-style:dotted;border-top-color:#999999;border-collapse:collapse'>"
					       + "<tbody><tr><td><span></span></td></tr></tbody></table></td></tr></tbody></table>"
					       + "<table border='0' cellpadding='0' cellspacing='0' width='100%' style='border-collapse:collapse'><tbody><tr><td valign='top'>"
					       + "<table align='left' border='0' cellpadding='0' cellspacing='0' width='600' style='border-collapse:collapse'>"
					       + "<tbody><tr><td valign='top' style='padding-top:9px;padding-right:18px;padding-bottom:9px;padding-left:18px;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px;line-height:150%;text-align:left'>"
					       + "<p dir='ltr' style='line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px'><span><span style='background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap'>Remarks: In case of discrepancies between the English and Chinese versions, English version shall prevail. </p>"
					       + "<p dir='ltr' style='line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px'><span><span style='background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap'>備註：中英文本如有歧異，概以英文本為準。</p></td></tr></tbody></table></td></tr></tbody></table>"
					       + "<table border='0' cellpadding='0' cellspacing='0' width='100%' style='border-collapse:collapse'><tbody><tr><td valign='top'>"
					       + "<table align='left' border='0' cellpadding='0' cellspacing='0' width='600' style='border-collapse:collapse'>"
					       + "<tbody><tr><td valign='top' style='padding-top:9px;padding-right:18px;padding-bottom:9px;padding-left:18px;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px;line-height:150%;text-align:left'><div style='text-align:center'>備註：此乃電腦發出之電子郵件，請不要回覆。<br>Note: This is an automatically generated email, please do not reply.</div></td></tr></tbody></table></td></tr></tbody></table>"
					       + "<table border='0' cellpadding='0' cellspacing='0' width='100%' style='border-collapse:collapse'><tbody><tr><td style='padding:18px'>"
					       + "<table border='0' cellpadding='0' cellspacing='0' width='100%' style='border-top-width:1px;border-top-style:dotted;border-top-color:#999999;border-collapse:collapse'><tbody><tr><td><span></span></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table></td></tr>"
					       + "<tr><td align='center' valign='top'><table border='0' cellpadding='0' cellspacing='0' width='600' style='border-collapse:collapse;background-color:#ffffff;border-top:0;border-bottom:0'>"
					       + "<tbody><tr><td valign='top' style='padding-bottom:9px'><table border='0' cellpadding='0' cellspacing='0' width='100%' style='border-collapse:collapse'>"
					       + "<tbody><tr><td valign='top'><table align='left' border='0' cellpadding='0' cellspacing='0' width='600' style='border-collapse:collapse'><tbody>"
					       + "<tr><td valign='top' style='padding-top:9px;padding-right:18px;padding-bottom:9px;padding-left:18px;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px;line-height:125%;text-align:left'><div style='text-align:center'>"
					       + "<p dir='ltr' style='line-height:1.2;margin-top:0pt;margin-bottom:10pt;text-align:center;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px'><span><span style='background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap'>富衛人壽保險(百慕達)有限公司</span></span></p>"
					       + "<p dir='ltr' style='line-height:1.2;margin-top:0pt;margin-bottom:10pt;text-align:center;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px'><a href='http://www.fwd.com.hk/' style='word-wrap:break-word;color:#606060;font-weight:normal;text-decoration:underline' target='_blank'><span style='color:#ff8c00'><span style='font-family:microsoft jhenghei,calibri,sans-serif'><span><span style='background-color:transparent;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap'>www.fwd.com.hk</span></span></span></span></a></p></div></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table></center></div></body></html>";
			String subject = "FWD Elite Term – Pending ["+policyNo+"]";
			String attachment = "";
			String from = UserRestURIConstants.getConfigs("innerMailFrom");
			boolean isHTML = true;

			String[] emailList = {to, UserRestURIConstants.getConfigs("innerMailTo")};
			for (int i=0; i<emailList.length; i++) {
				org.json.simple.JSONObject parameters = new org.json.simple.JSONObject();
				parameters.put("from", from);
				parameters.put("to", emailList[i]);
				parameters.put("message", message);
				parameters.put("subject", subject);
				parameters.put("attachment", attachment);
				parameters.put("isHtml", isHTML);
				br = connector.sendEmail(parameters,header);		
			}			

			request.getSession().setAttribute("sendEmailOrNot", "yes");
			
			request.getSession().removeAttribute("creditCaredNo");
			request.getSession().removeAttribute("expiryDate");
			request.getSession().removeAttribute("cardHolderName");
		}catch(Exception e){
			logger.info("EliteTermServiceImpl sendEliteTermMail occurs an exception!");
			logger.error(e.getMessage());
			logger.error(ExceptionUtils.getStackTrace(e));
			e.printStackTrace();
		}
		return br;
	}
	
	@Override
	public void putEtPlanOptionSession(HttpServletRequest request)throws ECOMMAPIException{
		CreateEliteTermPolicyRequest etPolicyApplication = (CreateEliteTermPolicyRequest) request.getSession().getAttribute("etPolicyApplication");
		if(etPolicyApplication == null){
			etPolicyApplication = new CreateEliteTermPolicyRequest();
		}		
		try {
			etPolicyApplication.getApplicant().setGender(request.getParameter("gender"));
			etPolicyApplication.getApplicant().setDobD(request.getParameter("dobD"));
			etPolicyApplication.getApplicant().setSmoke(request.getParameter("smoke"));
			etPolicyApplication.setAmount(request.getParameter("amount"));
			etPolicyApplication.setPromocode(request.getParameter("promocode"));
			logger.debug(etPolicyApplication.getAmount());
			logger.debug(etPolicyApplication.getApplicant().getDobD());
			logger.debug(etPolicyApplication.getApplicant().getSmoke());
			logger.debug(etPolicyApplication.getPromocode());
			request.getSession().setAttribute("etPolicyApplication", etPolicyApplication);
		}catch(Exception e){
			logger.info("EliteTermServiceImpl putEtPlanOptionSession occurs an exception!");
			logger.error(e.getMessage());
			logger.error(ExceptionUtils.getStackTrace(e));
			e.printStackTrace();
		}
	}
	
	@Override
	public void putEtPaymentSession(HttpServletRequest request)throws ECOMMAPIException{
		try {
			request.getSession().setAttribute("creditCaredNo", request.getParameter("creditCaredNo").replaceAll(" ", ""));
			request.getSession().setAttribute("expiryDate", request.getParameter("expiryDate"));
			request.getSession().setAttribute("cardHolderName", request.getParameter("cardHolderName"));
			logger.info("payment put session success");
		}catch(Exception e){
			logger.info("EliteTermServiceImpl putEtPaymentSession occurs an exception!");
			logger.error(e.getMessage());
			logger.error(ExceptionUtils.getStackTrace(e));
			e.printStackTrace();
		}
	}
	
	@Override
	public BaseResponse getPromoteCode(HttpServletRequest request)throws ECOMMAPIException{
		BaseResponse br = null;
		try {
			String promoteCode = "ELTERM";
			
			final Map<String,String> header = headerUtil.getHeader1(request);
			header.put("language", "ZH");
			String to = request.getParameter("email");
			logger.info("To Email:"+to);
			String message = "\u60A8\u597D,<p><p>\u591A\u8B1D\u60A8\u767B\u8A18\u8A02\u95B1\u5BCC\u885B\u7684\u63A8\u5EE3\u512A\u60E0\u3001"
					       + "\u5347\u7D1A\u734E\u8CDE\u53CA\u516C\u53F8\u8CC7\u8A0A*\u3002\u60A8\u53EF\u4EE5\u4F7F\u7528\u63A8\u5EE3\u7DE8"
					       + "\u865F " + promoteCode + " \u7372\u53D6\u7DB2\u4E0A\u6295\u4FDD\u512A\u60E0\u3002<p>"
					       + "\u5BCC\u885B\u6642\u523B\u4EE5\u5BA2\u6236\u79C1\u96B1\u70BA\u5148\uFF0C\u4F60\u53EF\u4EE5\u53C3\u95B1"
					       + "<a href='http://www.fwd.com.hk/zh-HK/home/pdo.html'>http://www.fwd.com.hk/zh-HK/home/pdo.html</a>\u4E86\u89E3"
					       + "\u6211\u5011\u7684\u500B\u4EBA\u8CC7\u6599\u4FDD\u8B77\u653F\u7B56\u3002<p>*\u8A3B: \u60A8\u53EF\u4EE5\u96A8"
					       + "\u6642\u81F4\u96FB3123-3123\u53D6\u6D88\u8A02\u95B1<p><p>Hi,<p><p>Thank you for registering to receive offers, "
					       + "upgrades and information from FWD*. You can use the promotion code " + promoteCode + " to get discounts from online "
					       + "purchases.<p>FWD respects your privacy. For more information, please read our Personal Data Protection Policy at "
					       + "<a href='http://www.fwd.com.hk/en-US/home/pdo.html'>http://www.fwd.com.hk/en-US/home/pdo.html</a>.<p> "
					       + "*Note: You may unsubscribe at any time.  To unsubscribe, please call us at 3123-3123.";
			String subject = "FWD Promotion Code";
			String attachment = "";
			String from = UserRestURIConstants.getConfigs("innerMailFrom");
			boolean isHTML = true;
			
			org.json.simple.JSONObject parameters = new org.json.simple.JSONObject();
			parameters.put("from", from);
			parameters.put("to", to);
			parameters.put("message", message);
			parameters.put("subject", subject);
			parameters.put("attachment", attachment);
			parameters.put("isHtml", isHTML);
			br = connector.sendEmail(parameters,header);
		}catch(Exception e){
			logger.info("EliteTermServiceImpl getPromoteCode occurs an exception!");
			logger.error(e.getMessage());
			logger.error(ExceptionUtils.getStackTrace(e));
			e.printStackTrace();
		}
		return br;
	}
	
	@Override
	@SuppressWarnings({ "unchecked"})
	public void uploadEliteTermDocuments(HttpServletRequest request)throws ECOMMAPIException{
		String uploadLaterFlage = (String) request.getSession().getAttribute("uploadLaterFlage");
		if (uploadLaterFlage != null) {
			logger.debug("uploadLaterFlage is null");
		} else {
			logger.debug(uploadLaterFlage);
		}
		
		
		
		if("false".equals(uploadLaterFlage)){
			try {
				request.getSession().setAttribute("uploadLaterFlage",null);
				UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
				String customerName = userDetails.getFullName();
				if(StringUtils.isEmpty(customerName)){
					customerName =  userDetails.getFirstName()+" "+userDetails.getLastName();
				}
				CreateEliteTermPolicyResponse eliteTermPolicy = (CreateEliteTermPolicyResponse) request.getSession().getAttribute("eliteTermPolicy");
				String policyNo = eliteTermPolicy.getPolicyNo();	
				final Map<String,String> headerEmail = headerUtil.getHeader1(request);
				headerEmail.put("language", "ZH");
				String subject = "FWD Elite Term – Complete["+policyNo+"]";
				String policyUserName = (String) request.getSession().getAttribute("policyUserName");
				if(StringUtils.isNotEmpty(policyUserName)){
					subject = "FWD Elite Term – Upload Complete["+policyNo+"]";
				}
				String attachment = "";
				String from = UserRestURIConstants.getConfigs("innerMailFrom");
				
				String serverUrl = request.getScheme()+"://"+request.getServerName()+request.getContextPath();
				if (request.getServerPort() != 80 && request.getServerPort() != 443)
				{
					serverUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
				}
				
				String imageUrl  = serverUrl +"/resources/images/ifwd_hero-banner_edm.jpg";
				boolean isHTML = true;
				String  message = " <body>  "+
						" <div marginwidth=\"0\" marginheight=\"0\" style=\"margin:0;padding:0;background-color:#f2f2f2;min-height:100%!important;width:100%!important\">  "+
						" <center>  "+
						" <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" height=\"100%\" width=\"100%\" style=\"border-collapse:collapse;margin:0;padding:0;background-color:#f2f2f2;height:100%!important;width:100%!important\">  "+
						"  <tbody>  "+
						"   <tr>  "+
						"     <td align=\"center\" valign=\"top\" style=\"margin:0;padding:20px;border-top:0;height:100%!important;width:100%!important\">  "+
						"   <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;border:0\">  "+
						"    <tbody>  "+
						"     <tr>  "+
						"    <td align=\"center\" valign=\"top\">  "+
						"    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;background-color:#ffffff;border-top:0;border-bottom:0\">  "+
						"     <tbody>  "+
						"     <tr>  "+
						"     <td valign=\"top\" style=\"padding-top:9px\">  "+
						"       <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">  "+
						"         <tbody>  "+
						"           <tr>  "+
						"             <td valign=\"top\">  "+
						"               <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"266\" style=\"border-collapse:collapse\">  "+
						"                 <tbody>  "+
						"                   <tr>  "+
						"                     <td valign=\"top\" style=\"padding-top:9px;padding-left:18px;padding-bottom:9px;padding-right:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px;line-height:125%;text-align:left\">  "+
						"                       <a href=\""+serverUrl+"\" style=\"word-wrap:break-word;color:#606060;font-weight:normal;text-decoration:underline\" target=\"_blank\"><img align=\"none\" src=\""+serverUrl+"/resources/images/fwd-email-logo.jpg\" style=\"margin:0px;border:0;outline:none;text-decoration:none;min-height:auto!important\" class=\"CToWUd\"></a>  "+
						"                     </td>  "+
						"                   </tr>  "+
						"                 </tbody>  "+
						"               </table>  "+
						"               <table align=\"right\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"297\" style=\"border-collapse:collapse\">  "+
						"                 <tbody>  "+
						"                   <tr>  "+
						"                     <td valign=\"top\" style=\"padding-top:9px;padding-right:18px;padding-bottom:9px;padding-left:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px;line-height:125%;text-align:left\">  "+
						"                       <div style=\"text-align:right\"><br>  "+
						"                       </div>  "+
						"                     </td>  "+
						"                   </tr>  "+
						"                 </tbody>  "+
						"               </table>  "+
						"             </td>  "+
						"           </tr>  "+
						"         </tbody>  "+
						"       </table>  "+
						"     </td>  "+
						"   </tr>  "+
						" </tbody>  "+
						" </table>  "+
						" </td>  "+
						" </tr>  "+
						"  <tr>  "+
						"    <td align=\"center\" valign=\"top\">  "+
						"     <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;background-color:#ffffff;border-top:0;border-bottom:0\">  "+
						" <tbody>  "+
						"   <tr>  "+
						"     <td valign=\"top\">  "+
						"       <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">  "+
						"         <tbody>  "+
						"           <tr>  "+
						"             <td valign=\"top\" style=\"padding:0px\">  "+
						"               <table align=\"left\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse\">  "+
						"                 <tbody>  "+
						"                   <tr>  "+
						"                     <td valign=\"top\" style=\"padding-right:0px;padding-left:0px;padding-top:0;padding-bottom:0;text-align:center\">  "+
						"                       <img align=\"center\" alt=\"\" src=\""+imageUrl+"\" width=\"600\" style=\"max-width:600px;padding-bottom:0;display:inline!important;vertical-align:bottom;border:0;outline:none;text-decoration:none\" class=\"CToWUd a6T\" tabindex=\"0\">  "+
						"                       <div class=\"a6S\" dir=\"ltr\" style=\"opacity: 0.01; left: 572px; top: 311px;\">  "+
						"                         <div id=\":sw\" class=\"T-I J-J5-Ji aQv T-I-ax7 L3 a5q\" role=\"button\" tabindex=\"0\" aria-label=\"Download attachment \" data-tooltip-class=\"a1V\" data-tooltip=\"Download\">  "+
						"                           <div class=\"aSK J-J5-Ji aYr\"></div>  "+
						"                         </div>  "+
						"                       </div>  "+
						"                     </td>  "+
						"                   </tr>  "+
						"                 </tbody>  "+
						"               </table>  "+
						"             </td>  "+
						"           </tr>  "+
						"         </tbody>  "+
						"       </table>  "+
						"     </td>  "+
						"   </tr>  "+
						" </tbody>  "+
						"    </table>  "+
						"  </td>  "+
						"  </tr>  "+
						"  <tr>  "+
						"   <td align=\"center\" valign=\"top\">  "+
						"    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;background-color:#ffffff;border-top:0;border-bottom:0\">  "+
						" <tbody>  "+
						"   <tr>  "+
						"     <td valign=\"top\">  "+
						"       <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">  "+
						"         <tbody>  "+
						"           <tr>  "+
						"             <td valign=\"top\">  "+
						"               <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse\">  "+
						"                 <tbody>  "+
						"                   <tr>  "+
						"                     <td valign=\"top\" style=\"padding:9px 18px;line-height:125%;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px;text-align:left\">  "+
						"                       <div style=\"text-align:center\">  "+
						"                         <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">Dear "+customerName+",</span></span></p>  "+
						"                         <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">Thank you for purchasing FWD Elite Term Insurance Plan via  our website. Your documents have been received and your application has been processed. Please note that your policy will be updated in your purchase history in 3 working days.</p>  "+
						"                         <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">多謝閣下經我們的網站購買富衛智理想定期保障計劃。我們已經收到您上載的檔案並正在處理您的投保申請。請注意您的保單將於3個工作天內更新至您的購買記錄。</p>  "+
						"                         <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">For enquiry, please contact us at <a href=\"tel:+85231233123\">(852) 3123 3123</a> or via email at cs.hk@fwd.com.</p>  "+
						"                         <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">如有任何查詢，請致電富衛客戶熱線 <a href=\"tel:+85231233123\">(852) 3123 3123</a> 或電郵至 cs.hk@fwd.com.</p>  "+
						"                         <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">We wish you a happy life!</p>  "+
						"                          <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">祝閣下生活愉快！</p>  "+
						"                         &nbsp;  "+
						"                         <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">Regards,<br>FWD Life Insurance Company (Bermuda) Limited (“FWD”)<br>富衛人壽保險(百慕達)有限公司（「富衛」）謹啟</span></span>  "+
						"                         </p>  "+
						"                       </div>  "+
						"                     </td>  "+
						"                   </tr>  "+
						"                 </tbody>  "+
						"               </table>  "+
						"             </td>  "+
						"           </tr>  "+
						"         </tbody>  "+
						"       </table>  "+
						"       <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">  "+
						"         <tbody>  "+
						"           <tr>  "+
						"             <td style=\"padding:18px\">  "+
						"               <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-top-width:1px;border-top-style:dotted;border-top-color:#999999;border-collapse:collapse\">  "+
						"                 <tbody>  "+
						"                   <tr>  "+
						"                     <td>  "+
						"                       <span></span>  "+
						"                     </td>  "+
						"                   </tr>  "+
						"                 </tbody>  "+
						"               </table>  "+
						"             </td>  "+
						"           </tr>  "+
						"         </tbody>  "+
						"       </table>  "+
						"       <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">  "+
						"         <tbody>  "+
						"           <tr>  "+
						"             <td valign=\"top\">  "+
						"               <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse\">  "+
						"                 <tbody>  "+
						"                   <tr>  "+
						"                     <td valign=\"top\" style=\"padding-top:9px;padding-right:18px;padding-bottom:9px;padding-left:18px;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px;line-height:150%;text-align:left\">  "+
						"                         <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">Remarks: In case of discrepancies between the English and Chinese versions, English version shall prevail. </p>  "+
						"                         <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">備註：中英文本如有歧異，概以英文本為準。</p>  "+
						"                      "+
						"                     </td>  "+
						"                   </tr>  "+
						"                 </tbody>  "+
						"               </table>  "+
						"             </td>  "+
						"           </tr>  "+
						"         </tbody>  "+
						"       </table>  "+
						"       <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">  "+
						"         <tbody>  "+
						"           <tr>  "+
						"             <td valign=\"top\">  "+
						"               <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse\">  "+
						"                 <tbody>  "+
						"                   <tr>  "+
						"                     <td valign=\"top\" style=\"padding-top:9px;padding-right:18px;padding-bottom:9px;padding-left:18px;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px;line-height:150%;text-align:left\">  "+
						"                       <div style=\"text-align:center\">備註：此乃電腦發出之電子郵件，請不要回覆。<br>Note: This is an automatically generated email, please do not reply.</div>  "+
						"                     </td>  "+
						"                   </tr>  "+
						"                 </tbody>  "+
						"               </table>  "+
						"             </td>  "+
						"           </tr>  "+
						"         </tbody>  "+
						"       </table>  "+
						"       <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">  "+
						"         <tbody>  "+
						"           <tr>  "+
						"             <td style=\"padding:18px\">  "+
						"               <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-top-width:1px;border-top-style:dotted;border-top-color:#999999;border-collapse:collapse\">  "+
						"                 <tbody>  "+
						"                   <tr>  "+
						"                     <td>  "+
						"                       <span></span>  "+
						"                     </td>  "+
						"                   </tr>  "+
						"                 </tbody>  "+
						"               </table>  "+
						"             </td>  "+
						"           </tr>  "+
						"         </tbody>  "+
						"       </table>  "+
						"     </td>  "+
						"   </tr>  "+
						" </tbody>  "+
						" </table>  "+
						" </td>  "+
						" </tr>  "+
						"   <tr>  "+
						"    <td align=\"center\" valign=\"top\">  "+
						"    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;background-color:#ffffff;border-top:0;border-bottom:0\">  "+
						" <tbody>  "+
						"   <tr>  "+
						"     <td valign=\"top\" style=\"padding-bottom:9px\">  "+
						"       <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">  "+
						"         <tbody>  "+
						"           <tr>  "+
						"             <td valign=\"top\">  "+
						"               <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse\">  "+
						"                 <tbody>  "+
						"                   <tr>  "+
						"                     <td valign=\"top\" style=\"padding-top:9px;padding-right:18px;padding-bottom:9px;padding-left:18px;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px;line-height:125%;text-align:left\">  "+
						"                       <div style=\"text-align:center\">  "+
						"                         <p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:10pt;text-align:center;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">富衛人壽保險(百慕達)有限公司</span></span></p>  "+
						"                         <p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:10pt;text-align:center;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px\"><a href=\"http://www.fwd.com.hk/\" style=\"word-wrap:break-word;color:#606060;font-weight:normal;text-decoration:underline\" target=\"_blank\"><span style=\"color:#ff8c00\"><span style=\"font-family:microsoft jhenghei,calibri,sans-serif\"><span><span style=\"background-color:transparent;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">www.fwd.com.hk</span></span></span></span></a></p>  "+
						"                       </div>  "+
						"                     </td>  "+
						"                   </tr>  "+
						"                 </tbody>  "+
						"               </table>  "+
						"             </td>  "+
						"           </tr>  "+
						"         </tbody>  "+
						"       </table>  "+
						"     </td>  "+ 
						"   </tr>  "+
						" </tbody>  "+
						"   </table>  "+
						"   </td>  "+
						" </tr>  "+
						"   </tbody>  "+
						"     </table>  "+
						"       </td>  "+
						"         </tr>  "+
						"          </tbody>  "+
						"         </table>  "+
						"    </center>  "+
						"    </div>  "+
						"  </body>";
				
				String[] emailList = {userDetails.getEmailAddress(), UserRestURIConstants.getConfigs("innerMailTo")};
				for (int i=0; i<emailList.length; i++) {
					org.json.simple.JSONObject parametersEmail = new org.json.simple.JSONObject();
					parametersEmail.put("to", emailList[i]);
					parametersEmail.put("message", message);
					parametersEmail.put("subject", subject);
					parametersEmail.put("attachment", attachment);
					parametersEmail.put("from", from);
					parametersEmail.put("isHtml", isHTML);
					connector.sendEmail(parametersEmail,headerEmail);
				}
				
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.error(ExceptionUtils.getStackTrace(e));
				e.printStackTrace();
			}
		}

	}
	
	@Override
	public String getPolicyUserName(HttpServletRequest request,String policyNumber){
		String userName="";
		String relationshipCode = UserRestURIConstants.GET_POLICY
				+ "?policyNo="+policyNumber;
		Map<String,String> header = headerUtil.getHeader(request);
		org.json.simple.JSONObject jsonRelationShipCode = restService.consumeApi(
				HttpMethod.GET, relationshipCode, header, null);
		if (jsonRelationShipCode.get("errMsgs") == null) {
			org.json.simple.JSONObject policy = (org.json.simple.JSONObject) jsonRelationShipCode.get("policy");
			 userName = (String) policy.get("userName");
		}
		return userName;
	}
	

	@Override
	public boolean checkIsDocumentUpload(HttpServletRequest request,String policyNumber){
		String relationshipCode = UserRestURIConstants.GET_IS_UPLOAD
				+ "?policyNo="+policyNumber;
		Map<String,String> header = headerUtil.getHeader(request);
		org.json.simple.JSONObject jsonRelationShipCode = restService.consumeApi(
				HttpMethod.GET, relationshipCode, header, null);
		org.json.simple.JSONArray errMsgs = (org.json.simple.JSONArray) jsonRelationShipCode.get("errMsgs");
		if(errMsgs != null){
			String errMessage = errMsgs.get(0).toString().replace("[", "").replace("]", "");
			request.getSession().setAttribute("errorMessageType",errMessage);
			return true;
		}
		org.json.simple.JSONArray policy = (org.json.simple.JSONArray) jsonRelationShipCode.get("uploadedDocuments");
		if (policy.size() > 0) {
			request.getSession().setAttribute("errorMessageType", "alreadyUploaded");
			return true;
		}
		long commencementDate = (long) jsonRelationShipCode.get("commencementDate");
		Date date = new Date();
		long days = (date.getTime()-commencementDate) / (1000 * 60 * 60 * 24);
		if(days > 42){
			request.getSession().setAttribute("errorMessageType", "UrlExpired");
			return true;
		}
		request.getSession().setAttribute("errorMessageType", null);
		return false;
	}
	
	@Override
	public void removeEtSession(HttpServletRequest request)throws ECOMMAPIException{
		try {
			HttpSession session = request.getSession();
			session.removeAttribute("eliteTermPolicy");
			session.removeAttribute("etPolicyApplication");
			session.removeAttribute("eliteTermPremium");
			session.removeAttribute("emailAddress");
			session.removeAttribute("eliteTermEmail");
			session.removeAttribute("creditCaredNo");
			session.removeAttribute("expiryDate");
			session.removeAttribute("cardHolderName");
			session.removeAttribute("goApp");
			session.removeAttribute("sendEmailOrNot");
			session.removeAttribute("etPageKey");
		}catch(Exception e){
			logger.info("EliteTermServiceImpl removeEtSession occurs an exception!");
			logger.error(e.getMessage());
			logger.error(ExceptionUtils.getStackTrace(e));
			e.printStackTrace();
		}
	}
	
	@Override
	public void putEtPageKeySession(HttpServletRequest request)throws ECOMMAPIException{
		try {
			request.getSession().setAttribute("etPageKey", request.getParameter("etPageKey"));
			logger.info("etPageKey:"+request.getParameter("etPageKey"));
		}catch(Exception e){
			logger.error(e.getMessage());
			logger.error(ExceptionUtils.getStackTrace(e));
			e.printStackTrace();
		}
	}
	
	public void putPersonalInfoSession(HttpServletRequest request)throws ECOMMAPIException{
			CreateEliteTermPolicyRequest etPolicyApplication = (CreateEliteTermPolicyRequest) request.getSession().getAttribute("etPolicyApplication");
			if(etPolicyApplication == null){
				etPolicyApplication = new CreateEliteTermPolicyRequest();
			}		
			etPolicyApplication.getApplicant().setFirstName(request.getParameter("savieApplicantBean.firstName"));
			etPolicyApplication.getApplicant().setLastName(request.getParameter("savieApplicantBean.lastName"));
			etPolicyApplication.getApplicant().setChineseName(request.getParameter("savieApplicantBean.chineseName"));
			etPolicyApplication.getApplicant().setDob(request.getParameter("dob"));
			etPolicyApplication.getApplicant().setGender(request.getParameter("savieApplicantBeanGender"));
			etPolicyApplication.getApplicant().setHkId(request.getParameter("savieApplicantBean.hkId"));
			etPolicyApplication.getApplicant().setPassport("");
			etPolicyApplication.getApplicant().setMaritalStatus(request.getParameter("savieApplicantBean.maritalStatus"));
			if(!"".equals(etPolicyApplication.getApplicant().getMaritalStatus())){
				for(OptionItemDesc item:InitApplicationMessage.maritalStatusesEN){
					if(etPolicyApplication.getApplicant().getMaritalStatus().split("-")[0].equals(item.getItemCode())){
						etPolicyApplication.getApplicant().setMaritalStatusEnName(item.getItemDesc());
						break;
					}
				}
				for(OptionItemDesc item:InitApplicationMessage.maritalStatusesCN){
					if(etPolicyApplication.getApplicant().getMaritalStatus().split("-")[0].equals(item.getItemCode())){
						etPolicyApplication.getApplicant().setMaritalStatusCnName(item.getItemDesc());
						break;
					}
				}
			}
			etPolicyApplication.getApplicant().setPlaceOfBirth(request.getParameter("savieApplicantBean.placeOfBirth"));
			if(!"".equals(etPolicyApplication.getApplicant().getPlaceOfBirth())){
				for(OptionItemDesc item:InitApplicationMessage.placeOfBirthEN){
					if(etPolicyApplication.getApplicant().getPlaceOfBirth().split("-")[0].equals(item.getItemCode())){
						etPolicyApplication.getApplicant().setPlaceOfBirthEnName(item.getItemDesc());
						break;
					}
				}
				for(OptionItemDesc item:InitApplicationMessage.placeOfBirthCN){
					if(etPolicyApplication.getApplicant().getPlaceOfBirth().split("-")[0].equals(item.getItemCode())){
						etPolicyApplication.getApplicant().setPlaceOfBirthCnName(item.getItemDesc());
						break;
					}
				}
			}
			etPolicyApplication.getApplicant().setNationality(request.getParameter("savieApplicantBean.nationality"));
			if(!"".equals(etPolicyApplication.getApplicant().getNationality())){
				for(OptionItemDesc item:InitApplicationMessage.nationalityEN){
					if(etPolicyApplication.getApplicant().getNationality().split("-")[0].equals(item.getItemCode())){
						etPolicyApplication.getApplicant().setNationalityEnName(item.getItemDesc());
						break;
					}
				}
				for(OptionItemDesc item:InitApplicationMessage.nationalityCN){
					if(etPolicyApplication.getApplicant().getNationality().split("-")[0].equals(item.getItemCode())){
						etPolicyApplication.getApplicant().setNationalityCnName(item.getItemDesc());
						break;
					}
				}
			}
			etPolicyApplication.getApplicant().setResidentialTelNo(request.getParameter("savieApplicantBean.residentialTelNo"));
			etPolicyApplication.getApplicant().setMobileNo(Methods.formatMobile(request.getParameter("savieApplicantBean.mobileNo")));
			etPolicyApplication.getApplicant().setEmail(request.getParameter("savieApplicantBean.emailAddress"));
			etPolicyApplication.getApplicant().setPermanentAddress1(request.getParameter("savieApplicantBean.permanentAddress1"));
			etPolicyApplication.getApplicant().setPermanentAddress2(request.getParameter("savieApplicantBean.permanentAddress2"));
			etPolicyApplication.getApplicant().setPermanentAddress3(request.getParameter("savieApplicantBean.permanentAddress3"));
			etPolicyApplication.getApplicant().setPermanentAddress4("");
			etPolicyApplication.getApplicant().setPermanentAddress(request.getParameter("savieApplicantBean.permanentAddress"));
			if(!"".equals(etPolicyApplication.getApplicant().getPermanentAddress())){
				for(OptionItemDesc item:InitApplicationMessage.savieDistrictEN){
					if(etPolicyApplication.getApplicant().getPermanentAddress().split("-")[0].equals(item.getItemCode())){
						etPolicyApplication.getApplicant().setPermanentAddressEnName(item.getItemDesc());
						break;
					}
				}
				for(OptionItemDesc item:InitApplicationMessage.savieDistrictCN){
					if(etPolicyApplication.getApplicant().getPermanentAddress().split("-")[0].equals(item.getItemCode())){
						etPolicyApplication.getApplicant().setPermanentAddressCnName(item.getItemDesc());
						break;
					}
				}
			}
			if("true".equals(request.getParameter("savieApplicantBean.isResidential"))){
				etPolicyApplication.getApplicant().setResidentialAdress1(request.getParameter("savieApplicantBean.residentialAdress1"));
				etPolicyApplication.getApplicant().setResidentialAdress2(request.getParameter("savieApplicantBean.residentialAdress2"));
				etPolicyApplication.getApplicant().setResidentialAdress3(request.getParameter("savieApplicantBean.residentialAdress3"));
				etPolicyApplication.getApplicant().setResidentialAdress4("");
				etPolicyApplication.getApplicant().setResidentialDistrict(request.getParameter("savieApplicantBean.residentialDistrict"));
				if(!"".equals(etPolicyApplication.getApplicant().getResidentialDistrict())){
					for(OptionItemDesc item:InitApplicationMessage.savieDistrictEN){
						if(etPolicyApplication.getApplicant().getResidentialDistrict().split("-")[0].equals(item.getItemCode())){
							etPolicyApplication.getApplicant().setResidentialDistrictEnName(item.getItemDesc());
							break;
						}
					}
					for(OptionItemDesc item:InitApplicationMessage.savieDistrictCN){
						if(etPolicyApplication.getApplicant().getResidentialDistrict().split("-")[0].equals(item.getItemCode())){
							etPolicyApplication.getApplicant().setResidentialDistrictCnName(item.getItemDesc());
							break;
						}
					}
				}
			}
			else{
				etPolicyApplication.getApplicant().setResidentialAdress1(etPolicyApplication.getApplicant().getPermanentAddress1());
				etPolicyApplication.getApplicant().setResidentialAdress2(etPolicyApplication.getApplicant().getPermanentAddress2());
				etPolicyApplication.getApplicant().setResidentialAdress3(etPolicyApplication.getApplicant().getPermanentAddress3());
				etPolicyApplication.getApplicant().setResidentialAdress4("");
				etPolicyApplication.getApplicant().setResidentialDistrict(etPolicyApplication.getApplicant().getPermanentAddress());
				etPolicyApplication.getApplicant().setResidentialDistrictEnName(etPolicyApplication.getApplicant().getPermanentAddressEnName());
				etPolicyApplication.getApplicant().setResidentialDistrictCnName(etPolicyApplication.getApplicant().getPermanentAddressCnName());
			}
			if("true".equals(request.getParameter("savieApplicantBean.addressIsSame"))){
				etPolicyApplication.getApplicant().setCorrespondenceAdress1(request.getParameter("savieApplicantBean.correspondenceAdress1"));
				etPolicyApplication.getApplicant().setCorrespondenceAdress2(request.getParameter("savieApplicantBean.correspondenceAdress2"));
				etPolicyApplication.getApplicant().setCorrespondenceAdress3(request.getParameter("savieApplicantBean.correspondenceAdress3"));
				etPolicyApplication.getApplicant().setCorrespondenceAdress4("");
				etPolicyApplication.getApplicant().setCorrespondenceDistrict(request.getParameter("savieApplicantBean.correspondenceDistrict"));
				if(!"".equals(etPolicyApplication.getApplicant().getCorrespondenceDistrict())){
					for(OptionItemDesc item:InitApplicationMessage.savieDistrictEN){
						if(etPolicyApplication.getApplicant().getCorrespondenceDistrict().split("-")[0].equals(item.getItemCode())){
							etPolicyApplication.getApplicant().setCorrespondenceDistrictEnName(item.getItemDesc());
							break;
						}
					}
					for(OptionItemDesc item:InitApplicationMessage.savieDistrictCN){
						if(etPolicyApplication.getApplicant().getCorrespondenceDistrict().split("-")[0].equals(item.getItemCode())){
							etPolicyApplication.getApplicant().setCorrespondenceDistrictCnName(item.getItemDesc());
							break;
						}
					}
				}
			}
			else{
				etPolicyApplication.getApplicant().setCorrespondenceAdress1(etPolicyApplication.getApplicant().getPermanentAddress1());
				etPolicyApplication.getApplicant().setCorrespondenceAdress2(etPolicyApplication.getApplicant().getPermanentAddress2());
				etPolicyApplication.getApplicant().setCorrespondenceAdress3(etPolicyApplication.getApplicant().getPermanentAddress3());
				etPolicyApplication.getApplicant().setCorrespondenceAdress4("");
				etPolicyApplication.getApplicant().setCorrespondenceDistrict(etPolicyApplication.getApplicant().getPermanentAddress());
				etPolicyApplication.getApplicant().setCorrespondenceDistrictEnName(etPolicyApplication.getApplicant().getPermanentAddressEnName());
				etPolicyApplication.getApplicant().setCorrespondenceDistrictCnName(etPolicyApplication.getApplicant().getPermanentAddressCnName());
			}
			etPolicyApplication.getApplicant().setHasTheClubMembershipNo(request.getParameter("hasTheClubMembershipNo"));
			etPolicyApplication.getApplicant().setTheClubMembershipNo(request.getParameter("theClubMembershipNo"));
			request.getSession().setAttribute("etPolicyApplication", etPolicyApplication);
			logger.info("putPersonalInfoSession success");
	}
	
	public void putEmploymentInfoSession(HttpServletRequest request)throws ECOMMAPIException{
		CreateEliteTermPolicyRequest etPolicyApplication = (CreateEliteTermPolicyRequest) request.getSession().getAttribute("etPolicyApplication");
		if(etPolicyApplication == null){
			etPolicyApplication = new CreateEliteTermPolicyRequest();
		}
		etPolicyApplication.getApplicant().setEmploymentStatus(request.getParameter("savieEmploymentBean.employmentStatus"));
		if(etPolicyApplication.getApplicant().getEmploymentStatus()!=null && !"".equals(etPolicyApplication.getApplicant().getEmploymentStatus())){
			for(OptionItemDesc item:InitApplicationMessage.employmentStatusEN){
				if(etPolicyApplication.getApplicant().getEmploymentStatus().split("-")[0].equals(item.getItemCode())){
					etPolicyApplication.getApplicant().setEmploymentStatusEnName(item.getItemDesc());
					break;
				}
			}
			for(OptionItemDesc item:InitApplicationMessage.employmentStatusCN){
				if(etPolicyApplication.getApplicant().getEmploymentStatus().split("-")[0].equals(item.getItemCode())){
					etPolicyApplication.getApplicant().setEmploymentStatusCnName(item.getItemDesc());
					break;
				}
			}
		}
		etPolicyApplication.getApplicant().setNatureOfBusiness(request.getParameter("savieEmploymentBean.natureOfBusiness"));
		if(etPolicyApplication.getApplicant().getNatureOfBusiness()!=null && !"".equals(etPolicyApplication.getApplicant().getNatureOfBusiness())){
			for(OptionItemDesc item:InitApplicationMessage.natureOfBusinessEN){
				if(etPolicyApplication.getApplicant().getNatureOfBusiness().split("-")[0].equals(item.getItemCode())){
					etPolicyApplication.getApplicant().setNatureOfBusinessEnName(item.getItemDesc());
					break;
				}
			}
			for(OptionItemDesc item:InitApplicationMessage.natureOfBusinessCN){
				if(etPolicyApplication.getApplicant().getNatureOfBusiness().split("-")[0].equals(item.getItemCode())){
					etPolicyApplication.getApplicant().setNatureOfBusinessCnName(item.getItemDesc());
					break;
				}
			}
		}
		etPolicyApplication.getApplicant().setOccupation(request.getParameter("savieEmploymentBean.occupation"));
		if(etPolicyApplication.getApplicant().getOccupation()!=null && !"".equals(etPolicyApplication.getApplicant().getOccupation())){
			for(OptionItemDesc item:InitApplicationMessage.getOccupationByNob(commonUtils, etPolicyApplication.getApplicant().getNatureOfBusiness().split("-")[0], "EN", "1", request)){
				if(etPolicyApplication.getApplicant().getOccupation().split("-")[0].equals(item.getItemCode())){
					etPolicyApplication.getApplicant().setOccupationEnName(item.getItemDesc());
					break;
				}
			}
			for(OptionItemDesc item:InitApplicationMessage.getOccupationByNob(commonUtils, etPolicyApplication.getApplicant().getNatureOfBusiness().split("-")[0], "CH", "1", request)){
				if(etPolicyApplication.getApplicant().getOccupation().split("-")[0].equals(item.getItemCode())){
					etPolicyApplication.getApplicant().setOccupationCnName(item.getItemDesc());
					break;
				}
			}
		}
		etPolicyApplication.getApplicant().setEducationLevel(request.getParameter("savieEmploymentBean.educationLevel"));
		if(etPolicyApplication.getApplicant().getEducationLevel()!=null && !"".equals(etPolicyApplication.getApplicant().getEducationLevel())){
			for(OptionItemDesc item:InitApplicationMessage.etEducationLevelEN){
				if(etPolicyApplication.getApplicant().getEducationLevel().split("-")[0].equals(item.getItemCode())){
					etPolicyApplication.getApplicant().setEducationLevelEnName(item.getItemDesc());
					break;
				}
			}
			for(OptionItemDesc item:InitApplicationMessage.etEducationLevelCN){
				if(etPolicyApplication.getApplicant().getEducationLevel().split("-")[0].equals(item.getItemCode())){
					etPolicyApplication.getApplicant().setEducationLevelCnName(item.getItemDesc());
					break;
				}
			}
		}
		etPolicyApplication.getApplicant().setMonthlyPersonalIncome(request.getParameter("savieEmploymentBean.monthlyPersonalIncome"));
		if(etPolicyApplication.getApplicant().getMonthlyPersonalIncome()!=null && !"".equals(etPolicyApplication.getApplicant().getMonthlyPersonalIncome())){
			for(OptionItemDesc item:InitApplicationMessage.monthlyPersonalIncomeEN){
				if(etPolicyApplication.getApplicant().getMonthlyPersonalIncome().split("-")[0].equals(item.getItemCode())){
					etPolicyApplication.getApplicant().setMonthlyPersonalIncomeEnName(item.getItemDesc());
					break;
				}
			}
			for(OptionItemDesc item:InitApplicationMessage.monthlyPersonalIncomeCN){
				if(etPolicyApplication.getApplicant().getMonthlyPersonalIncome().split("-")[0].equals(item.getItemCode())){
					etPolicyApplication.getApplicant().setMonthlyPersonalIncomeCnName(item.getItemDesc());
					break;
				}
			}
		}
		etPolicyApplication.getApplicant().setLiquidAsset(request.getParameter("savieEmploymentBean.liquidAssets"));
		if(etPolicyApplication.getApplicant().getLiquidAsset()!=null && !"".equals(etPolicyApplication.getApplicant().getLiquidAsset())){
			for(OptionItemDesc item:InitApplicationMessage.etLiquidAssetEN){
				if(etPolicyApplication.getApplicant().getLiquidAsset().split("-")[0].equals(item.getItemCode())){
					etPolicyApplication.getApplicant().setLiquidAssetEnName(item.getItemDesc());
					break;
				}
			}
			for(OptionItemDesc item:InitApplicationMessage.etLiquidAssetCN){
				if(etPolicyApplication.getApplicant().getLiquidAsset().split("-")[0].equals(item.getItemCode())){
					etPolicyApplication.getApplicant().setLiquidAssetCnName(item.getItemDesc());
					break;
				}
			}
		}
		etPolicyApplication.getApplicant().setSourceOfIncome(request.getParameter("savieEmploymentBean.sourceOfIncome"));
		if(etPolicyApplication.getApplicant().getLiquidAsset()!=null && !"".equals(etPolicyApplication.getApplicant().getSourceOfIncome())){
			for(OptionItemDesc item:InitApplicationMessage.etAmountOtherSourceEN){
				if(etPolicyApplication.getApplicant().getSourceOfIncome().split("-")[0].equals(item.getItemCode())){
					etPolicyApplication.getApplicant().setSourceOfIncomeEnName(item.getItemDesc());
					break;
				}
			}
			for(OptionItemDesc item:InitApplicationMessage.etAmountOtherSourceCN){
				if(etPolicyApplication.getApplicant().getSourceOfIncome().split("-")[0].equals(item.getItemCode())){
					etPolicyApplication.getApplicant().setSourceOfIncomeCnName(item.getItemDesc());
					break;
				}
			}
		}
		etPolicyApplication.getApplicant().setCurrentEmployerName(request.getParameter("savieEmploymentBean.currentEmployerName"));
		request.getSession().setAttribute("etPolicyApplication", etPolicyApplication);
		logger.info("putEmploymentInfoSession success");
    }
	
	public void putBeneficiaryInfoSession(HttpServletRequest request)throws ECOMMAPIException{
		CreateEliteTermPolicyRequest etPolicyApplication = (CreateEliteTermPolicyRequest) request.getSession().getAttribute("etPolicyApplication");
		if(etPolicyApplication == null){
			etPolicyApplication = new CreateEliteTermPolicyRequest();
		}
		etPolicyApplication.getApplicant().setBeneficiaryInfo(request.getParameter("beneficiary-info"));
		if(request.getParameter("beneficiary-info") != null && request.getParameter("beneficiary-info").equals("name-others-now")){
			etPolicyApplication.getApplicant().setFirstName1(request.getParameter("savieBeneficiaryBean[0].firstName"));
			etPolicyApplication.getApplicant().setLastName1(request.getParameter("savieBeneficiaryBean[0].lastName"));
			etPolicyApplication.getApplicant().setChineseName1(request.getParameter("savieBeneficiaryBean[0].chineseName"));
			etPolicyApplication.getApplicant().setBeneficiaryHkidPassport1(request.getParameter("beneficiaryHkidPassport[0]"));
			etPolicyApplication.getApplicant().setHkId1(request.getParameter("savieBeneficiaryBean[0].hkId"));
			etPolicyApplication.getApplicant().setPassportNo1(request.getParameter("savieBeneficiaryBean[0].passportNo"));
			etPolicyApplication.getApplicant().setGender1(request.getParameter("savieBeneficiaryBean[0].gender"));
			etPolicyApplication.getApplicant().setRelationship1(request.getParameter("savieBeneficiaryBean[0].relationship"));
			if(etPolicyApplication.getApplicant().getRelationship1()!=null && !"".equals(etPolicyApplication.getApplicant().getRelationship1())){
				for(OptionItemDesc item:InitApplicationMessage.lifeBeneficiaryRelationshipEN){
					if(etPolicyApplication.getApplicant().getRelationship1().split("-")[0].equals(item.getItemCode())){
						etPolicyApplication.getApplicant().setRelationship1EnName(item.getItemDesc());
						break;
					}
				}
				for(OptionItemDesc item:InitApplicationMessage.lifeBeneficiaryRelationshipCN){
					if(etPolicyApplication.getApplicant().getRelationship1().split("-")[0].equals(item.getItemCode())){
						etPolicyApplication.getApplicant().setRelationship1CnName(item.getItemDesc());
						break;
					}
				}
			}
			etPolicyApplication.getApplicant().setEntitlement1(request.getParameter("savieBeneficiaryBean[0].entitlement"));
			
			etPolicyApplication.getApplicant().setFirstName2(request.getParameter("savieBeneficiaryBean[1].firstName"));
			etPolicyApplication.getApplicant().setLastName2(request.getParameter("savieBeneficiaryBean[1].lastName"));
			etPolicyApplication.getApplicant().setChineseName2(request.getParameter("savieBeneficiaryBean[1].chineseName"));
			etPolicyApplication.getApplicant().setBeneficiaryHkidPassport2(request.getParameter("beneficiaryHkidPassport[1]"));
			etPolicyApplication.getApplicant().setHkId2(request.getParameter("savieBeneficiaryBean[1].hkId"));
			etPolicyApplication.getApplicant().setPassportNo2(request.getParameter("savieBeneficiaryBean[1].passportNo"));
			etPolicyApplication.getApplicant().setGender2(request.getParameter("savieBeneficiaryBean[1].gender"));
			etPolicyApplication.getApplicant().setRelationship2(request.getParameter("savieBeneficiaryBean[1].relationship"));
			if(etPolicyApplication.getApplicant().getRelationship2()!=null && !"".equals(etPolicyApplication.getApplicant().getRelationship2())){
				for(OptionItemDesc item:InitApplicationMessage.lifeBeneficiaryRelationshipEN){
					if(etPolicyApplication.getApplicant().getRelationship2().split("-")[0].equals(item.getItemCode())){
						etPolicyApplication.getApplicant().setRelationship2EnName(item.getItemDesc());
						break;
					}
				}
				for(OptionItemDesc item:InitApplicationMessage.lifeBeneficiaryRelationshipCN){
					if(etPolicyApplication.getApplicant().getRelationship2().split("-")[0].equals(item.getItemCode())){
						etPolicyApplication.getApplicant().setRelationship2CnName(item.getItemDesc());
						break;
					}
				}
			}
			etPolicyApplication.getApplicant().setEntitlement2(request.getParameter("savieBeneficiaryBean[1].entitlement"));
			
			etPolicyApplication.getApplicant().setFirstName3(request.getParameter("savieBeneficiaryBean[2].firstName"));
			etPolicyApplication.getApplicant().setLastName3(request.getParameter("savieBeneficiaryBean[2].lastName"));
			etPolicyApplication.getApplicant().setChineseName3(request.getParameter("savieBeneficiaryBean[2].chineseName"));
			etPolicyApplication.getApplicant().setBeneficiaryHkidPassport3(request.getParameter("beneficiaryHkidPassport[2]"));
			etPolicyApplication.getApplicant().setHkId3(request.getParameter("savieBeneficiaryBean[2].hkId"));
			etPolicyApplication.getApplicant().setPassportNo3(request.getParameter("savieBeneficiaryBean[2].passportNo"));
			etPolicyApplication.getApplicant().setGender3(request.getParameter("savieBeneficiaryBean[2].gender"));
			etPolicyApplication.getApplicant().setRelationship3(request.getParameter("savieBeneficiaryBean[2].relationship"));
			if(etPolicyApplication.getApplicant().getRelationship3()!=null && !"".equals(etPolicyApplication.getApplicant().getRelationship3())){
				for(OptionItemDesc item:InitApplicationMessage.lifeBeneficiaryRelationshipEN){
					if(etPolicyApplication.getApplicant().getRelationship3().split("-")[0].equals(item.getItemCode())){
						etPolicyApplication.getApplicant().setRelationship3EnName(item.getItemDesc());
						break;
					}
				}
				for(OptionItemDesc item:InitApplicationMessage.lifeBeneficiaryRelationshipCN){
					if(etPolicyApplication.getApplicant().getRelationship3().split("-")[0].equals(item.getItemCode())){
						etPolicyApplication.getApplicant().setRelationship3CnName(item.getItemDesc());
						break;
					}
				}
			}
			etPolicyApplication.getApplicant().setEntitlement3(request.getParameter("savieBeneficiaryBean[2].entitlement"));
		}
		request.getSession().setAttribute("etPolicyApplication", etPolicyApplication);
		logger.info("putBeneficiaryInfoSession success");
    }
	
	public void putDeclarationSession(HttpServletRequest request)throws ECOMMAPIException{
		CreateEliteTermPolicyRequest etPolicyApplication = (CreateEliteTermPolicyRequest) request.getSession().getAttribute("etPolicyApplication");
		if(etPolicyApplication == null){
			etPolicyApplication = new CreateEliteTermPolicyRequest();
		}
		etPolicyApplication.getApplicant().setIsPics(request.getParameter("isPics"));
		etPolicyApplication.getApplicant().setCancellation(request.getParameter("cancellation"));
		etPolicyApplication.getApplicant().setPolicyReplace(request.getParameter("policyReplace"));
		etPolicyApplication.getApplicant().setResidency(request.getParameter("residency"));
		etPolicyApplication.getApplicant().setIsResident(request.getParameter("isResident"));
		etPolicyApplication.getApplicant().setAppDeclaration(request.getParameter("appDeclaration"));
		etPolicyApplication.getApplicant().setIsMarketingInfo(request.getParameter("isMarketingInfo"));
		etPolicyApplication.getApplicant().setIsPersonalData(request.getParameter("isPersonalData"));
		
		request.getSession().setAttribute("etPolicyApplication", etPolicyApplication);
		logger.info("putDeclarationSession success");
    }
}
