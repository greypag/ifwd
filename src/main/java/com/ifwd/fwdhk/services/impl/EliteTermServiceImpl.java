package com.ifwd.fwdhk.services.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.connector.ECommWsConnector;
import com.ifwd.fwdhk.connector.request.eliteterm.CreateEliteTermPolicyRequest;
import com.ifwd.fwdhk.connector.response.BaseResponse;
import com.ifwd.fwdhk.connector.response.eliteterm.CreateEliteTermPolicyResponse;
import com.ifwd.fwdhk.connector.response.eliteterm.GetEliteTermPremiumResponse;
import com.ifwd.fwdhk.connector.response.savie.ServiceCentreResponse;
import com.ifwd.fwdhk.connector.response.savie.ServiceCentreResult;
import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.services.EliteTermService;
import com.ifwd.fwdhk.util.ClientBrowserUtil;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.FileUtil;
import com.ifwd.fwdhk.util.HeaderUtil;
import com.ifwd.fwdhk.util.InitApplicationMessage;
import com.ifwd.fwdhk.util.PolicyNoUtil;
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
		CreateEliteTermPolicyRequest etPolicyApplication = (CreateEliteTermPolicyRequest) request.getSession().getAttribute("etPolicyApplication");
		if(etPolicyApplication == null){
			etPolicyApplication = new CreateEliteTermPolicyRequest();
		}		
		CreateEliteTermPolicyResponse apiReturn = null;
		try {
			final Map<String,String> header = headerUtil.getHeader(request);
			
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
			String[] dob = request.getParameter("dob").toString().split("-");
			applicant.put("dob", dob[2]+"-"+dob[1]+"-"+dob[0]);
			etPolicyApplication.getApplicant().setDob(applicant.getString("dob"));
			applicant.put("gender", request.getParameter("savieApplicantBeanGender"));
			etPolicyApplication.getApplicant().setGender(applicant.getString("gender"));
			applicant.put("hkId", request.getParameter("savieApplicantBean.hkId"));
			etPolicyApplication.getApplicant().setHkId(applicant.getString("hkId"));
			applicant.put("passport", "");
			etPolicyApplication.getApplicant().setPassport(applicant.getString("passport"));
			applicant.put("maritalStatus", request.getParameter("savieApplicantBean.maritalStatus").split("-")[0]);
			applicant.put("placeOfBirth", request.getParameter("savieApplicantBean.placeOfBirth").split("-")[0]);
			applicant.put("nationality", request.getParameter("savieApplicantBean.nationality").split("-")[0]);
			applicant.put("residentialTelNoCountryCode", "852");
			applicant.put("residentialTelNo", request.getParameter("savieApplicantBean.residentialTelNo"));
			applicant.put("mobileNoCountryCode", "852");
			applicant.put("mobileNo", request.getParameter("savieApplicantBean.mobileNo"));
			etPolicyApplication.getApplicant().setMobileNo(applicant.getString("mobileNo"));
			applicant.put("email", request.getParameter("savieApplicantBean.emailAddress"));
			request.getSession().setAttribute("eliteTermEmail", request.getParameter("savieApplicantBean.emailAddress"));
			etPolicyApplication.getApplicant().setEmail(applicant.getString("email"));
			JSONObject permanentAddress = new JSONObject();
			permanentAddress.put("line1", request.getParameter("savieApplicantBean.permanentAddress1"));
			permanentAddress.put("line2", request.getParameter("savieApplicantBean.permanentAddress2"));
			permanentAddress.put("line3", request.getParameter("savieApplicantBean.permanentAddress3"));
			permanentAddress.put("line4", "");
			permanentAddress.put("district", request.getParameter("savieApplicantBean.permanentAddress").split("-")[0]);
			applicant.put("permanentAddress", permanentAddress);
			JSONObject residentialAddress = new JSONObject();
			if(request.getParameter("savieApplicantBean.isResidential") != null && request.getParameter("savieApplicantBean.isResidential").equals("true")){
				residentialAddress.put("line1", request.getParameter("savieApplicantBean.residentialAdress1"));
				residentialAddress.put("line2", request.getParameter("savieApplicantBean.residentialAdress2"));
				residentialAddress.put("line3", request.getParameter("savieApplicantBean.residentialAdress3"));
				residentialAddress.put("line4", "");
				residentialAddress.put("district", request.getParameter("savieApplicantBean.residentialDistrict").split("-")[0]);
			}
			else{
				residentialAddress.put("line1", permanentAddress.get("line1"));
				residentialAddress.put("line2", permanentAddress.get("line2"));
				residentialAddress.put("line3", permanentAddress.get("line3"));
				residentialAddress.put("line4", permanentAddress.get("line4"));
				residentialAddress.put("district", permanentAddress.get("district"));
			}
			applicant.put("residentialAddress", residentialAddress);
			JSONObject correspondenceAddress = new JSONObject();
			if(request.getParameter("savieApplicantBean.addressIsSame") != null && request.getParameter("savieApplicantBean.addressIsSame").equals("true")){
				correspondenceAddress.put("line1", request.getParameter("savieApplicantBean.correspondenceAdress1"));
				correspondenceAddress.put("line2", request.getParameter("savieApplicantBean.correspondenceAdress2"));
				correspondenceAddress.put("line3", request.getParameter("savieApplicantBean.correspondenceAdress3"));
				correspondenceAddress.put("line4", "");
				correspondenceAddress.put("district", request.getParameter("savieApplicantBean.correspondenceDistrict").split("-")[0]);
			}
			else{
				correspondenceAddress.put("line1", residentialAddress.get("line1"));
				correspondenceAddress.put("line2", residentialAddress.get("line2"));
				correspondenceAddress.put("line3", residentialAddress.get("line3"));
				correspondenceAddress.put("line4", residentialAddress.get("line4"));
				correspondenceAddress.put("district", residentialAddress.get("district"));
			}
			applicant.put("correspondenceAddress", correspondenceAddress);
			JSONObject employmentStatus = new JSONObject();
			employmentStatus.put("employmentStatus", request.getParameter("savieEmploymentBean.employmentStatus").split("-")[0]);
			employmentStatus.put("occupation", request.getParameter("savieEmploymentBean.occupation").split("-")[0]);
			employmentStatus.put("educationLevel", request.getParameter("savieEmploymentBean.educationLevel").split("-")[0]);
			employmentStatus.put("natureOfBusiness", request.getParameter("savieEmploymentBean.natureOfBusiness").split("-")[0]);
			employmentStatus.put("monthlyPersonalIncome", request.getParameter("savieEmploymentBean.monthlyPersonalIncome").split("-")[0]);
			employmentStatus.put("liquidAsset", request.getParameter("savieEmploymentBean.liquidAssets").split("-")[0]);
			employmentStatus.put("amountOtherSource", request.getParameter("savieEmploymentBean.sourceOfIncome").split("-")[0]);
			employmentStatus.put("employerName", request.getParameter("savieEmploymentBean.currentEmployerName"));
			applicant.put("employmentStatus", employmentStatus);
			applicant.put("smoke", request.getParameter("savieApplicantBeanSmoke"));
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
			logger.info(request.getParameter("beneficiary-info"));
			logger.debug(request.getParameter("beneficiary-info").equals("name-others-now")+"");
			logger.info(request.getParameter("savieBeneficiaryBean[0].firstName"));
			logger.info(request.getParameter("savieBeneficiaryBean[1].firstName"));
			logger.info(request.getParameter("savieBeneficiaryBean[2].firstName"));
			if(request.getParameter("beneficiary-info") != null && request.getParameter("beneficiary-info").equals("name-others-now")){
				if(request.getParameter("savieBeneficiaryBean[0].firstName")!=null && request.getParameter("savieBeneficiaryBean[0].firstName")!=""){
					beneficiarie1.put("firstName", request.getParameter("savieBeneficiaryBean[0].firstName"));
					beneficiarie1.put("lastName", request.getParameter("savieBeneficiaryBean[0].lastName"));
					beneficiarie1.put("chineseName", request.getParameter("savieBeneficiaryBean[0].chineseName"));
					beneficiarie1.put("hkId", request.getParameter("savieBeneficiaryBean[0].hkId"));
					beneficiarie1.put("passport", request.getParameter("savieBeneficiaryBean[0].passportNo"));
					beneficiarie1.put("gender", request.getParameter("savieBeneficiaryBean[0].gender"));
					beneficiarie1.put("relationship", request.getParameter("savieBeneficiaryBean[0].relationship").split("-")[0]);
					beneficiarie1.put("entitlement", request.getParameter("savieBeneficiaryBean[0].entitlement"));
				}
				if(request.getParameter("savieBeneficiaryBean[1].firstName")!=null && request.getParameter("savieBeneficiaryBean[1].firstName")!=""){
					beneficiarie2.put("firstName", request.getParameter("savieBeneficiaryBean[1].firstName"));
					beneficiarie2.put("lastName", request.getParameter("savieBeneficiaryBean[1].lastName"));
					beneficiarie2.put("chineseName", request.getParameter("savieBeneficiaryBean[1].chineseName"));
					beneficiarie2.put("hkId", request.getParameter("savieBeneficiaryBean[1].hkId"));
					beneficiarie2.put("passport", request.getParameter("savieBeneficiaryBean[1].passportNo"));
					beneficiarie2.put("gender", request.getParameter("savieBeneficiaryBean[1].gender"));
					beneficiarie2.put("relationship", request.getParameter("savieBeneficiaryBean[1].relationship").split("-")[0]);
					beneficiarie2.put("entitlement", request.getParameter("savieBeneficiaryBean[1].entitlement"));
					beneficiaries.add(beneficiarie2);
				}
				if(request.getParameter("savieBeneficiaryBean[2].firstName")!=null && request.getParameter("savieBeneficiaryBean[2].firstName")!=""){
					beneficiarie3.put("firstName", request.getParameter("savieBeneficiaryBean[2].firstName"));
					beneficiarie3.put("lastName", request.getParameter("savieBeneficiaryBean[2].lastName"));
					beneficiarie3.put("chineseName", request.getParameter("savieBeneficiaryBean[2].chineseName"));
					beneficiarie3.put("hkId", request.getParameter("savieBeneficiaryBean[2].hkId"));
					beneficiarie3.put("passport", request.getParameter("savieBeneficiaryBean[2].passportNo"));
					beneficiarie3.put("gender", request.getParameter("savieBeneficiaryBean[2].gender"));
					beneficiarie3.put("relationship", request.getParameter("savieBeneficiaryBean[2].relationship").split("-")[0]);
					beneficiarie3.put("entitlement", request.getParameter("savieBeneficiaryBean[2].entitlement"));
					beneficiaries.add(beneficiarie3);
				}
			}
			else{
				beneficiarie1.put("firstName", applicant.getString("firstName"));
				beneficiarie1.put("lastName", applicant.getString("lastName"));
				beneficiarie1.put("chineseName", applicant.getString("chineseName"));
				beneficiarie1.put("hkId", applicant.getString("hkId"));
				beneficiarie1.put("passport", applicant.getString("passport"));
				beneficiarie1.put("gender", applicant.getString("gender"));
				beneficiarie1.put("relationship", "SE");
				beneficiarie1.put("entitlement", "100");
			}
			beneficiaries.add(beneficiarie1);
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
			logger.info(parameters.toString());
			apiReturn = connector.createEliteTermPolicy(parameters, header);
			request.getSession().setAttribute("eliteTermPolicy", apiReturn);
			request.getSession().setAttribute("etPolicyApplication", etPolicyApplication);
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
			parameters.put("planCode", "ET");
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
			parameters.put("preferredDay", request.getParameter("preferredDay").split("-")[0]);
			parameters.put("preferredTimeSlot", request.getParameter("preferredTimeSlot").split("-")[0]);
			parameters.put("enquiryType", request.getParameter("enquiryType").split("-")[0]);
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
	public BaseResponse uploadSignature(HttpServletRequest request,String image,String policyNo)throws ECOMMAPIException{		
		BaseResponse br = null;
		try {
			final Map<String,String> header = headerUtil.getHeader(request);

			Map<String,Object> clientBrowserInfo = ClientBrowserUtil.getClientInfo(request);
			JSONObject parameters = new JSONObject();
			parameters.put("clientBrowserInfo", clientBrowserInfo);
			parameters.put("planCode", "ET");
			parameters.put("fileType", "png");
			parameters.put("documentType", "signature");
			parameters.put("originalFilePath", "");
			parameters.put("base64", image);
			parameters.put("policyNo", policyNo);
			br = connector.uploadSignature(parameters, header);
		} catch (ECOMMAPIException e) {
			logger.info("EliteTermServiceImpl uploadSignature occurs an exception!");
			logger.info(e.getMessage());
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
			String url = "http://" + request.getServerName() //服务器地址  
                    + ":"   
                    + request.getServerPort()           //端口号  
                    + request.getContextPath();      //项目名称 
			String language = (String) request.getSession().getAttribute("language");
			if(StringUtils.isEmpty(language)){
				language = "tc";
			}
			CreateEliteTermPolicyRequest etPolicyApplication = (CreateEliteTermPolicyRequest) request.getSession().getAttribute("etPolicyApplication");
			String customerName="";
			if(etPolicyApplication.getApplicant() != null){
				 customerName = etPolicyApplication.getApplicant().getFirstName()+" "+etPolicyApplication.getApplicant().getLastName();
				 if(StringUtils.isEmpty(etPolicyApplication.getApplicant().getFirstName())){
					 customerName =  etPolicyApplication.getApplicant().getChineseName();
				 }
			}		
			url = url + "/"+language+"/term-life-insurance/document-upload?policyNumber="+new sun.misc.BASE64Encoder().encode(policyNo.getBytes());
			
			final Map<String,String> header = headerUtil.getHeader(request);
			header.put("language", "ZH");
			String to = (String) request.getSession().getAttribute("eliteTermEmail");
			logger.info("To Email:"+to);
			String serverUrl = request.getScheme()+"://"+request.getServerName()+request.getContextPath();
			if (request.getServerPort() != 80 && request.getServerPort() != 443)
			{
				serverUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
			}
			String message =  "<p>Dear "+customerName+",</p>"
					        + "<p>Thank you for purchasing FWD Elite Term Plan Series Insurance Plan via online. Your first 2 months premium payment has been accepted.  </p>"
					        + "<p>多謝閣下經網上購買富衛智理想定期保障計劃系列 。您的首2個月保費款項已被接納。</p>"
					        + "<p>Your policy has not been officially in force, you will need upload your [ID card copy], [passport copy] and [address proof] through the following link, in order to complete your application process.  </p>"
					        + "<p>您的保單尚未正式生效，您需要通過以下的連結上載您的[身份證副本]，[護照複印件]和[住址證明]，以完成整個申請投保程序。</p> "
					        + "<p>"+url+"</p>"
					        + "<p>For enquiry, please contact us at (852) 3123 3123 or via email at cs.hk@fwd.com. </p>"
					        + "<p>如有任何查詢，請致電富衛客戶服務熱線(852) 3123 3123或電郵至cs.hk@fwd.com。</p>"
					        + "<p>We wish you a happy life! </p>"
					        + "<p>祝閣下生活愉快！</p>"
					        + "<p>Regards, FWD General Insurance Company Limited </p>"
					        + "<p>富衛保險有限公司 </p>"
					        + "<p>謹啟 </p>"
					        + "<p>www.fwd.com.hk</p>"
					        + "<p>Remarks: In case of discrepancies between the English and Chinese versions, English version shall prevail.  </p>"
					        + "<p>備註：中英文本如有歧異，概以英文本為準。</p>"
					        + "<p>This is an automatically generated email, please do not reply. </p>"
					        + "<p>此乃電腦發出之電子郵件，請不要回覆</p>";
			String subject = "FWD Elite Term – Pending ["+policyNo+"]";
			String attachment = "";
			String from = "FWD Elite Term <i-info.hk@fwd.com>";
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
			logger.info("EliteTermServiceImpl sendEliteTermMail occurs an exception!");
			logger.info(e.getMessage());
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
			logger.info(e.getMessage());
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
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	@Override
	public BaseResponse getPromoteCode(HttpServletRequest request)throws ECOMMAPIException{
		BaseResponse br = null;
		try {
			String promoteCode = "ELTERM";
			
			final Map<String,String> header = headerUtil.getHeader(request);
			header.put("language", "ZH");
			String to = request.getParameter("email");
			logger.info("To Email:"+to);
			String serverUrl = request.getScheme()+"://"+request.getServerName()+request.getContextPath();
			if (request.getServerPort() != 80 && request.getServerPort() != 443)
			{
				serverUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
			}
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
			String from = "FWD Elite Term <i-noreply.hk@fwd.com>";
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
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		return br;
	}
	
	@SuppressWarnings({ "unchecked", "deprecation", "unused", "restriction" })
	public void uploadEliteTermDocuments(HttpServletRequest request)throws ECOMMAPIException{
		String uploadLaterFlage = (String) request.getSession().getAttribute("uploadLaterFlage");
		String passportFlage = (String) request.getSession().getAttribute("passportFlage");
		CreateEliteTermPolicyResponse eliteTermPolicy = (CreateEliteTermPolicyResponse) request.getSession().getAttribute("eliteTermPolicy");
		String policyNo = eliteTermPolicy.getPolicyNo();
		FileInputStream is = null;
		BaseResponse br = null;
		if(!"true".equals(uploadLaterFlage)){	
			try {
				//String uploadDir = request.getRealPath("/")+"upload"+"/"+policyNo+"/";
				String documentPath = UserRestURIConstants.getProperties("documentPath");
				String uploadDir = documentPath + "/"+new sun.misc.BASE64Encoder().encode(policyNo.getBytes())+"/"; 
				File file = new File(uploadDir);
				byte data[];
				int i;
				final Map<String, String> header = headerUtil.getHeader(request);
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
		        FileUtil.deletFile(uploadDir);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				try {
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}  
			}
		}
		
		CreateEliteTermPolicyRequest etPolicyApplication = (CreateEliteTermPolicyRequest) request.getSession().getAttribute("etPolicyApplication");
		String customerName="";
		if(etPolicyApplication.getApplicant() != null){
			 customerName = etPolicyApplication.getApplicant().getFirstName()+" "+etPolicyApplication.getApplicant().getLastName();
			 if(StringUtils.isEmpty(etPolicyApplication.getApplicant().getFirstName())){
				 customerName =  etPolicyApplication.getApplicant().getChineseName();
			 }
		}		
		final Map<String,String> headerEmail = headerUtil.getHeader(request);
		headerEmail.put("language", "ZH");
		String subject = "FWD Elite Term – Complete[ ]";
		String attachment = "";
		String from = "Fanny at FWD HK <i-info.hk@fwd.com>";
		boolean isHTML = true;
		String  message = "<div> Dear "+customerName+",<br />"+
						 " Thank you for purchasing FWD Elite Term Plan Series Insurance Plan via online. Your documents are well received; your application has been processed. Your policy will be in force in x days. <br />"+
						 " <br />"+
						 " 多謝閣下經網上購買富衛智理想定期保障計劃系列 。我們已經收到您上載的檔案; 我們正在處理您的投保申請，您的保單於將X天內生效。<br />"+
						 " <br />"+
						 " Your policy has not been officially in force, you will need upload your [ID card copy], [passport copy] and [address proof] through the following link, in order to complete your application process. <br />"+
						 " <br />"+
						 " 您的保單尚未正式生效，您需要通過以下的連結上載您的[身份證副本]，[護照複印件]和[住址證明]，以完成整個申請投保程序。<br />"+
						 " <br />"+
						 " For enquiry, please contact us at (852) 3123 3123 or via email at cs.hk@fwd.com.<br />"+
						 " <br />"+
						 " 如有任何查詢，請致電富衛客戶服務熱線(852) 3123 3123或電郵至cs.hk@fwd.com。<br />"+
						 " <br />"+
						 " We wish you a happy life!<br />"+
						 " <br />"+
						 " 祝閣下生活愉快！<br />"+
						 " <br />"+
						 " Regards,<br />"+
						 " FWD General Insurance Company Limited<br />"+
						 " <br />"+
						 " 富衛保險有限公司 <br />"+
						 " <br />"+
						 " 謹啟<br />"+
						 " <br />"+
						 " www.fwd.com.hk<br />"+
						 " <br />"+
						 " Remarks: In case of discrepancies between the English and Chinese versions, English version shall prevail. <br />"+
						 " <br />"+
						 " 備註：中英文本如有歧異，概以英文本為準。<br />"+
						 " <br />"+
						 " This is an automatically generated email, please do not reply.<br />"+
						 " <br />"+
						 " 此乃電腦發出之電子郵件，請不要回覆<br />"+
		    			 " </div>";
		org.json.simple.JSONObject parametersEmail = new org.json.simple.JSONObject();
		parametersEmail.put("to", etPolicyApplication.getApplicant().getEmail());
		parametersEmail.put("message", message);
		parametersEmail.put("subject", subject);
		parametersEmail.put("attachment", attachment);
		parametersEmail.put("from", from);
		parametersEmail.put("isHtml", isHTML);
		connector.sendEmail(parametersEmail,headerEmail);
	}
	
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
			 String email = (String) policy.get("email");
			 org.json.simple.JSONObject client =(org.json.simple.JSONObject) policy.get("client");
			 String firstName = (String) client.get("firstName");
			 String lastName = (String) client.get("lastName");
			 String chineseName = (String) client.get("chineseName");
			 CreateEliteTermPolicyRequest etPolicyApplication = new CreateEliteTermPolicyRequest();
			 etPolicyApplication.getApplicant().setFirstName(firstName);
			 etPolicyApplication.getApplicant().setLastName(lastName);
			 etPolicyApplication.getApplicant().setChineseName(chineseName);
			 etPolicyApplication.getApplicant().setEmail(email);
			request.getSession().setAttribute("etPolicyApplication",etPolicyApplication);
		}
		return userName;
	}
	

	public boolean checkIsDocumentUpload(HttpServletRequest request,String policyNumber){
		boolean flage=false;
		String relationshipCode = UserRestURIConstants.GET_IS_UPLOAD
				+ "?policyNo="+policyNumber;
		Map<String,String> header = headerUtil.getHeader(request);
		org.json.simple.JSONObject jsonRelationShipCode = restService.consumeApi(
				HttpMethod.GET, relationshipCode, header, null);
		org.json.simple.JSONArray policy = (org.json.simple.JSONArray) jsonRelationShipCode.get("uploadedDocuments");
		if (policy.size() > 0) {
			flage = true;
		}
		return flage;
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
		}catch(Exception e){
			logger.info("EliteTermServiceImpl removeEtSession occurs an exception!");
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
}
