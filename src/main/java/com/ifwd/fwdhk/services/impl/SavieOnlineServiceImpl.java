package com.ifwd.fwdhk.services.impl;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.ezmorph.bean.MorphDynaBean;

import org.apache.commons.lang.StringUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.common.document.PDFGeneration;
import com.ifwd.fwdhk.common.document.PdfAttribute;
import com.ifwd.fwdhk.connector.ECommWsConnector;
import com.ifwd.fwdhk.connector.response.BaseResponse;
import com.ifwd.fwdhk.connector.response.eliteterm.CreateEliteTermPolicyResponse;
import com.ifwd.fwdhk.connector.response.savie.SaviePlanDetailsRate;
import com.ifwd.fwdhk.connector.response.savie.SaviePlanDetailsResponse;
import com.ifwd.fwdhk.connector.response.savie.ServiceCentreResponse;
import com.ifwd.fwdhk.connector.response.savie.ServiceCentreResult;
import com.ifwd.fwdhk.connector.response.savieonline.GetPolicyApplicationResponse;
import com.ifwd.fwdhk.connector.response.savieonline.PolicyApplication;
import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.OptionItemDesc;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.model.savieOnline.LifeBeneficaryInfoBean;
import com.ifwd.fwdhk.model.savieOnline.LifeDeclarationBean;
import com.ifwd.fwdhk.model.savieOnline.LifeEmploymentInfoBean;
import com.ifwd.fwdhk.model.savieOnline.LifePaymentBean;
import com.ifwd.fwdhk.model.savieOnline.LifePersonalDetailsBean;
import com.ifwd.fwdhk.model.savieOnline.ProductRecommendation;
import com.ifwd.fwdhk.model.savieOnline.SavieFnaBean;
import com.ifwd.fwdhk.model.savieOnline.SaviePlanDetailsBean;
import com.ifwd.fwdhk.services.SavieOnlineService;
import com.ifwd.fwdhk.util.ClientBrowserUtil;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.CompareUtil;
import com.ifwd.fwdhk.util.DateApi;
import com.ifwd.fwdhk.util.FileUtil;
import com.ifwd.fwdhk.util.HeaderUtil;
import com.ifwd.fwdhk.util.ImgUtil;
import com.ifwd.fwdhk.util.InitApplicationMessage;
import com.ifwd.fwdhk.util.NumberFormatUtils;
import com.ifwd.fwdhk.util.PolicyNoUtil;
import com.ifwd.fwdhk.util.StringHelper;
import com.ifwd.fwdhk.util.WebServiceUtils;
@Service
public class SavieOnlineServiceImpl implements SavieOnlineService {
	private final static Logger logger = LoggerFactory.getLogger(SavieOnlineServiceImpl.class);
	
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
	public net.sf.json.JSONObject getSavieOnlinePlandetails(SaviePlanDetailsBean saviePlanDetails, 
			HttpServletRequest request, HttpSession session) throws ECOMMAPIException{
		
		int issueAge = DateApi.getAge(DateApi.formatDate(saviePlanDetails.getDob())) + 1;
		int paymentTerm = 0;
		if("SP".equals(saviePlanDetails.getPaymentType())) {
			session.setAttribute("savieType", "SP");
			paymentTerm = 100-issueAge;
		}else if("RP".equals(saviePlanDetails.getPaymentType())) {
			session.setAttribute("savieType", "RP");
			String paymentYear = request.getParameter("paymentYear");
			paymentTerm = paymentYear == null ? 3 : Integer.valueOf(paymentYear);
		}
		
		SaviePlanDetailsResponse apiResponse = connector.saviePlanDetails("savie", issueAge, paymentTerm,
				saviePlanDetails.getInsuredAmount(), saviePlanDetails.getPromoCode(), saviePlanDetails.getPaymentType(), null);
		
		request.getSession().setAttribute("planDetailData", apiResponse);
		
		if(apiResponse.hasError()){
			throw new ECOMMAPIException(apiResponse.getErrMsgs()[0]);
		}else{
			//jsonObject.put("planDetails0Rate", apiResponse.getPlanDetails0Rate());
			
			net.sf.json.JSONObject resultJsonObject = new net.sf.json.JSONObject();
			if(!apiResponse.hasError()){
				List<SaviePlanDetailsRate> planDetails0Rate = apiResponse.getPlanDetails0Rate();
				List<SaviePlanDetailsRate> planDetails2Rate = apiResponse.getPlanDetails2Rate();
				List<SaviePlanDetailsRate> planDetails3Rate = apiResponse.getPlanDetails3Rate();
				List<SaviePlanDetailsRate> planDetails4Rate = apiResponse.getPlanDetails4Rate();
				
				if(planDetails0Rate !=null && planDetails0Rate.size()>0){
					List<net.sf.json.JSONObject> inputTableList = new ArrayList<net.sf.json.JSONObject>();
					net.sf.json.JSONObject inputTable = new net.sf.json.JSONObject();
					
					inputTable.accumulate("type", "savie");
					inputTable.accumulate("issueAge", issueAge);
					inputTable.accumulate("paymode", "monthly");
					inputTable.accumulate("premium", saviePlanDetails.getInsuredAmount());
					inputTable.accumulate("paymentMode", "Single");
					inputTable.accumulate("paymentTerm", paymentTerm);
					inputTable.accumulate("promoCode", saviePlanDetails.getPromoCode());
					inputTable.accumulate("guaranteeRate", apiResponse.getGuaranteeRate());
					inputTableList.add(inputTable);
					
					net.sf.json.JSONObject planDetailJsonObject = new net.sf.json.JSONObject();
					planDetailJsonObject.accumulate("inputTable", inputTableList);
					
					List<net.sf.json.JSONObject> yearPlansList = new ArrayList<net.sf.json.JSONObject>();
					List<net.sf.json.JSONObject> plansList;
					net.sf.json.JSONObject yesrPlan;
					net.sf.json.JSONObject plan0;
					net.sf.json.JSONObject plan2;
					net.sf.json.JSONObject plan3;
					net.sf.json.JSONObject plan4;
					for(int i =0;i<planDetails0Rate.size();i++){
						yesrPlan = new net.sf.json.JSONObject();
						yesrPlan.accumulate("year", Integer.valueOf(planDetails0Rate.get(i).getType().substring(1)));
						
						plansList = new ArrayList<net.sf.json.JSONObject>();
						
						plan0 = new net.sf.json.JSONObject();
						plan0.accumulate("accountBalance", formartNumber(planDetails0Rate.get(i).getAccountEOP()));
						plan0.accumulate("totalPremium", saviePlanDetails.getInsuredAmount());
						plan0.accumulate("guaranteedSurrenderBenefit", formartNumber(planDetails0Rate.get(i).getGuranteedSurrenderBenefit()));
						plan0.accumulate("guaranteedDeathBenefit", formartNumber(planDetails0Rate.get(i).getGuranteedDeathBenefit()));
						plan0.accumulate("rate","zero");
						plansList.add(plan0);
						
						plan2 = new net.sf.json.JSONObject();
						plan2.accumulate("accountBalance", formartNumber(planDetails2Rate.get(i).getAccountEOP()));
						plan2.accumulate("totalPremium", saviePlanDetails.getInsuredAmount());
						plan2.accumulate("guaranteedSurrenderBenefit", formartNumber(planDetails2Rate.get(i).getGuranteedSurrenderBenefit()));
						plan2.accumulate("guaranteedDeathBenefit", formartNumber(planDetails2Rate.get(i).getGuranteedDeathBenefit()));
						plan2.accumulate("rate","two");
						plansList.add(plan2);
						
						plan3 = new net.sf.json.JSONObject();
						plan3.accumulate("accountBalance", formartNumber(planDetails3Rate.get(i).getAccountEOP()));
						plan3.accumulate("totalPremium", saviePlanDetails.getInsuredAmount());
						plan3.accumulate("guaranteedSurrenderBenefit", formartNumber(planDetails3Rate.get(i).getGuranteedSurrenderBenefit()));
						plan3.accumulate("guaranteedDeathBenefit", formartNumber(planDetails3Rate.get(i).getGuranteedDeathBenefit()));
						plan3.accumulate("rate","three");
						plansList.add(plan3);
						
						plan4 = new net.sf.json.JSONObject();
						plan4.accumulate("accountBalance", formartNumber(planDetails4Rate.get(i).getAccountEOP()));
						plan4.accumulate("totalPremium", saviePlanDetails.getInsuredAmount());
						plan4.accumulate("guaranteedSurrenderBenefit", formartNumber(planDetails4Rate.get(i).getGuranteedSurrenderBenefit()));
						plan4.accumulate("guaranteedDeathBenefit", formartNumber(planDetails4Rate.get(i).getGuranteedDeathBenefit()));
						plan4.accumulate("rate","four");
						plansList.add(plan4);
						
						yesrPlan.accumulate("plans", plansList);
						yearPlansList.add(yesrPlan);
					}
					planDetailJsonObject.accumulate("yearPlans", yearPlansList);
					resultJsonObject.accumulate("result", "success");
					resultJsonObject.accumulate("errMsgs", "");
					resultJsonObject.accumulate("salesIllustration", planDetailJsonObject);
				}
				else{
					resultJsonObject.accumulate("result", "fail");
					resultJsonObject.accumulate("errMsgs", "Data exception");
					throw new ECOMMAPIException("Data exception!");
				}
			}
			else{
				resultJsonObject.accumulate("result", "fail");
				resultJsonObject.accumulate("errMsgs", apiResponse.getErrMsgs());
			}
			return resultJsonObject;
		}
	}
	
	@SuppressWarnings("deprecation")
	public void createSalesIllustrationPdf(String type,HttpServletRequest request) throws Exception {
		SaviePlanDetailsResponse planDetailData = (SaviePlanDetailsResponse) request.getSession().getAttribute("planDetailData");
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		SavieFnaBean savieFna = (SavieFnaBean) request.getSession().getAttribute("savieFna");
		String lang = UserRestURIConstants.getLanaguage(request);
		
		
		if(planDetailData != null && !planDetailData.hasError()){
			String totalPremium = NumberFormatUtils.formatNumber(planDetailData.getPremium());
			List<PdfAttribute> attributeList = new ArrayList<PdfAttribute>();
			SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
			NumberFormat nt = NumberFormat.getPercentInstance();
			nt.setMinimumFractionDigits(0);
			
			attributeList.add(new PdfAttribute("Nameofinsured", userDetails.getFullName()));
			attributeList.add(new PdfAttribute("Age", planDetailData.getIssueAge()));
			attributeList.add(new PdfAttribute("Gender", "0".equals(savieFna.getGender())?"M":"F"));
			
			attributeList.add(new PdfAttribute("Premiumamount", totalPremium));
			
			
			String guaranteeRate = planDetailData.getGuaranteeRate();
			String[] rates;
			if(guaranteeRate != null ){
				rates = guaranteeRate.split(",");
				double rate;
				if(rates !=null && rates.length>0){
					for(int i=0;i<rates.length;i++){
						rate = Double.valueOf(rates[i]);
						attributeList.add(new PdfAttribute("CreditingRate_"+(i+1),rate*100+"%"));
					}
				}
			}
			
			int issueAge = Integer.valueOf(planDetailData.getIssueAge());
			for(int i=0;i<planDetailData.getPlanDetails3Rate().size();i++){
				int policyYear = Integer.valueOf(planDetailData.getPlanDetails0Rate().get(i).getPolicyYear())+1;
				int age = Integer.valueOf(planDetailData.getPlanDetails0Rate().get(i).getAge());
				if(policyYear < 5){
					attributeList.add(new PdfAttribute("TotalPermiumsPaid_"+policyYear,totalPremium));
					if(policyYear < 4){
						attributeList.add(new PdfAttribute("Accountvalue_"+policyYear,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails0Rate().get(i).getAccountEOP())));
						attributeList.add(new PdfAttribute("SurrenderBenefit_"+policyYear,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails0Rate().get(i).getGuranteedSurrenderBenefit())));
						attributeList.add(new PdfAttribute("DeathBenefit_"+policyYear,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails0Rate().get(i).getGuranteedDeathBenefit())));
					}else{
						attributeList.add(new PdfAttribute("Accountvalue_"+policyYear,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails0Rate().get(i).getAccountEOP())));
						attributeList.add(new PdfAttribute("SurrenderBenefit_"+policyYear,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails0Rate().get(i).getGuranteedSurrenderBenefit())));
						attributeList.add(new PdfAttribute("DeathBenefit_"+policyYear,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails0Rate().get(i).getGuranteedDeathBenefit())));
						
					}
					
					attributeList.add(new PdfAttribute("Accountvalue_a"+policyYear,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails2Rate().get(i).getAccountEOP())));
					attributeList.add(new PdfAttribute("SurrenderBenefit_a"+policyYear,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails2Rate().get(i).getGuranteedSurrenderBenefit())));
					attributeList.add(new PdfAttribute("DeathBenefit_a"+policyYear,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails2Rate().get(i).getGuranteedDeathBenefit())));
				}
				
				if(policyYear%5==0 && policyYear/5<7){
					attributeList.add(new PdfAttribute("TotalPermiumsPaid_"+policyYear,totalPremium));
					attributeList.add(new PdfAttribute("Accountvalue_"+policyYear,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails0Rate().get(i).getAccountEOP())));
					attributeList.add(new PdfAttribute("SurrenderBenefit_"+policyYear,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails0Rate().get(i).getGuranteedSurrenderBenefit())));
					attributeList.add(new PdfAttribute("DeathBenefit_"+policyYear,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails0Rate().get(i).getGuranteedDeathBenefit())));
					
					attributeList.add(new PdfAttribute("Accountvalue_a"+policyYear,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails2Rate().get(i).getAccountEOP())));
					attributeList.add(new PdfAttribute("SurrenderBenefit_a"+policyYear,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails2Rate().get(i).getGuranteedSurrenderBenefit())));
					attributeList.add(new PdfAttribute("DeathBenefit_a"+policyYear,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails2Rate().get(i).getGuranteedDeathBenefit())));
				
				}
				
				if(issueAge > 66){
					if(age == 99){
						attributeList.add(new PdfAttribute("EndofPolicyYear_100","100"));
						attributeList.add(new PdfAttribute("TotalPermiumsPaid_100",totalPremium));
						attributeList.add(new PdfAttribute("Accountvalue_100",NumberFormatUtils.formatNumber(planDetailData.getPlanDetails0Rate().get(i).getAccountEOP())));
						attributeList.add(new PdfAttribute("SurrenderBenefit_100",NumberFormatUtils.formatNumber(planDetailData.getPlanDetails0Rate().get(i).getGuranteedSurrenderBenefit())));
						attributeList.add(new PdfAttribute("DeathBenefit_100",NumberFormatUtils.formatNumber(planDetailData.getPlanDetails0Rate().get(i).getGuranteedDeathBenefit())));
						
						attributeList.add(new PdfAttribute("Accountvalue_a100",NumberFormatUtils.formatNumber(planDetailData.getPlanDetails2Rate().get(i).getAccountEOP())));
						attributeList.add(new PdfAttribute("SurrenderBenefit_a100",NumberFormatUtils.formatNumber(planDetailData.getPlanDetails2Rate().get(i).getGuranteedSurrenderBenefit())));
						attributeList.add(new PdfAttribute("DeathBenefit_a100",NumberFormatUtils.formatNumber(planDetailData.getPlanDetails2Rate().get(i).getGuranteedDeathBenefit())));
					}
				}
				else if(issueAge < 67){
					if(age == 66){
						attributeList.add(new PdfAttribute("EndofPolicyYear_"+age,"66"));
						attributeList.add(new PdfAttribute("TotalPermiumsPaid_"+age,totalPremium));
						attributeList.add(new PdfAttribute("Accountvalue_"+age,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails0Rate().get(i).getAccountEOP())));
						attributeList.add(new PdfAttribute("SurrenderBenefit_"+age,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails0Rate().get(i).getGuranteedSurrenderBenefit())));
						attributeList.add(new PdfAttribute("DeathBenefit_"+age,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails0Rate().get(i).getGuranteedDeathBenefit())));
						
						attributeList.add(new PdfAttribute("Accountvalue_a"+age,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails2Rate().get(i).getAccountEOP())));
						attributeList.add(new PdfAttribute("SurrenderBenefit_a"+age,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails2Rate().get(i).getGuranteedSurrenderBenefit())));
						attributeList.add(new PdfAttribute("DeathBenefit_a"+age,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails2Rate().get(i).getGuranteedDeathBenefit())));
					}
					else if(age == 99){
						attributeList.add(new PdfAttribute("EndofPolicyYear_100","100"));
						attributeList.add(new PdfAttribute("TotalPermiumsPaid_100",totalPremium));
						attributeList.add(new PdfAttribute("Accountvalue_100",NumberFormatUtils.formatNumber(planDetailData.getPlanDetails0Rate().get(i).getAccountEOP())));
						attributeList.add(new PdfAttribute("SurrenderBenefit_100",NumberFormatUtils.formatNumber(planDetailData.getPlanDetails0Rate().get(i).getGuranteedSurrenderBenefit())));
						attributeList.add(new PdfAttribute("DeathBenefit_100",NumberFormatUtils.formatNumber(planDetailData.getPlanDetails0Rate().get(i).getGuranteedDeathBenefit())));
						
						attributeList.add(new PdfAttribute("Accountvalue_a100",NumberFormatUtils.formatNumber(planDetailData.getPlanDetails2Rate().get(i).getAccountEOP())));
						attributeList.add(new PdfAttribute("SurrenderBenefit_a100",NumberFormatUtils.formatNumber(planDetailData.getPlanDetails2Rate().get(i).getGuranteedSurrenderBenefit())));
						attributeList.add(new PdfAttribute("DeathBenefit_a100",NumberFormatUtils.formatNumber(planDetailData.getPlanDetails2Rate().get(i).getGuranteedDeathBenefit())));
					}
					
				}
				
				
			}
			
			
			
			attributeList.add(new PdfAttribute("EndofContractTerm",(100-issueAge)+""));
			
			attributeList.add(new PdfAttribute("Date",format.format(new Date())));
			attributeList.add(new PdfAttribute("Printdate",format.format(new Date())));
			
			if("2".equals(type)){
				CreateEliteTermPolicyResponse lifePolicy = (CreateEliteTermPolicyResponse) request.getSession().getAttribute("lifePolicy");
				String documentPath = UserRestURIConstants.getConfigs("documentPath");
				String uploadDir = documentPath + "/"+new sun.misc.BASE64Encoder().encode(lifePolicy.getPolicyNo().getBytes()); 
		        String path = uploadDir + "/JSignature.png";
		        path = path.replace("/", "\\");
				attributeList.add(new PdfAttribute("Signature",path,"imagepath"));
			}
			
			String pdfTemplateName = "";
			if("tc".equals(lang)){
				pdfTemplateName = "SavieProposalTemplateChiA.pdf";
			}else{
				pdfTemplateName = "SavieProposalTemplateEngA.pdf";
			}
			
			String pdfTemplatePath = request.getRealPath("/").replace("\\", "/")+"/resources/pdf/"+pdfTemplateName;
			String pdfGeneratePath = request.getRealPath("/").replace("\\", "\\\\")+"\\\\resources\\\\pdf\\\\";
			logger.info("file path:"+pdfTemplatePath);
			logger.info("data:"+attributeList);
			String name = PDFGeneration.generatePdf2(pdfTemplatePath,pdfGeneratePath,attributeList,false,"All rights reserved, copy");
			logger.info("file name:"+name);
			
			request.getSession().setAttribute("pdfName", name);
			logger.info("pdf create successfully");
		}
		else{
			throw new Exception("errorMsg: api data error");
		}
	}
	
	@SuppressWarnings("deprecation")
	public void createApplicationFormPdf(String type,HttpServletRequest request,HttpSession session) throws Exception {
		LifePersonalDetailsBean lifePersonalDetails = (LifePersonalDetailsBean) session.getAttribute("lifePersonalDetails");
		LifeEmploymentInfoBean lifeEmploymentInfo = (LifeEmploymentInfoBean) session.getAttribute("lifeEmploymentInfo");
		LifeBeneficaryInfoBean lifeBeneficaryInfo = (LifeBeneficaryInfoBean) session.getAttribute("lifeBeneficaryInfo");
		LifePaymentBean lifePayment = (LifePaymentBean) session.getAttribute("lifePayment");
		
		String bankName = lifePayment.getBankName();
		String branchName = lifePayment.getBranchName();
		
		/*String Url = UserRestURIConstants.GET_BANK_INFO+"?bankName="+java.net.URLEncoder.encode(bankName)+"&branchName="+java.net.URLEncoder.encode(branchName);
		final Map<String,String> header = headerUtil.getHeader(request);
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,Url, header, null);
		JSONObject json = (JSONObject)responseJsonObj.get("ddaBank");*/
		
	    List<PdfAttribute> attributeList = new ArrayList<PdfAttribute>();
	    SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");

	    
	    attributeList.add(new PdfAttribute("applicationNo", "applicationNo"));
	    attributeList.add(new PdfAttribute("applicationEnglishName", lifePersonalDetails.getLastname()+" "+lifePersonalDetails.getFirstname()));
	    attributeList.add(new PdfAttribute("applicationChineseName", lifePersonalDetails.getChineseName()));
	    attributeList.add(new PdfAttribute("applicationHKID", lifePersonalDetails.getHkid()));
	    attributeList.add(new PdfAttribute("applicationSex", lifePersonalDetails.getGender()));
	    attributeList.add(new PdfAttribute("applicationDB", lifePersonalDetails.getDob()));
	    attributeList.add(new PdfAttribute("applicationMaritalStatus", lifePersonalDetails.getMartialStatusName()));
	    attributeList.add(new PdfAttribute("applicationBirthPlace", lifePersonalDetails.getPlaceOfBirthName()));
	    attributeList.add(new PdfAttribute("applicationNationality", lifePersonalDetails.getNationaltyName()));
	    attributeList.add(new PdfAttribute("applicationResidentialPhone", lifePersonalDetails.getResidentialTelNo()));
	    attributeList.add(new PdfAttribute("applicationMobile", lifePersonalDetails.getMobileNumber()));
	    attributeList.add(new PdfAttribute("applicationEmail", lifePersonalDetails.getEmailAddress()));
	    attributeList.add(new PdfAttribute("applicationResAddress", lifePersonalDetails.getResidentialAddress1()+","+lifePersonalDetails.getResidentialAddress2()+","+lifePersonalDetails.getResidentialAddress3()));
	    attributeList.add(new PdfAttribute("applicationResDistrict", lifePersonalDetails.getResidentialAddressDistrictName()));
	    attributeList.add(new PdfAttribute("applicationPerAddress", lifePersonalDetails.getPermanetAddress1()+","+lifePersonalDetails.getCorrespondenceAddress2()+","+lifePersonalDetails.getCorrespondenceAddress3()));
	    attributeList.add(new PdfAttribute("applicationPerDistrict", lifePersonalDetails.getPermanetAddressDistrictName()));
	    attributeList.add(new PdfAttribute("applicationCorrAddress", lifePersonalDetails.getCorrespondenceAddress1()+","+lifePersonalDetails.getCorrespondenceAddress2()+","+lifePersonalDetails.getCorrespondenceAddress3()));
	    attributeList.add(new PdfAttribute("applicationCorrDistrict", lifePersonalDetails.getCorrespondenceAddressDistrictName()));
	    
	    attributeList.add(new PdfAttribute("EducationlevelKey", "Education Level 教育水平"));
	    attributeList.add(new PdfAttribute("educationLevel", lifeEmploymentInfo.getEducationName()));
	    attributeList.add(new PdfAttribute("applicationEmploymentStatusKey", "Employment Status 就業狀況"));
	    attributeList.add(new PdfAttribute("applicationEmploymentStatus", lifeEmploymentInfo.getEmploymentStatusName()));
	    attributeList.add(new PdfAttribute("currentEmployNameKey/otherIncomKey", "Current Employer's Name 現時僱主"));
	    attributeList.add(new PdfAttribute("currentEmployName/otherIncome", lifeEmploymentInfo.getEmployerName()));
	    attributeList.add(new PdfAttribute("natureOfBusinessKey/liquidAssetKey", "Nature Of Business 行業"));
	    attributeList.add(new PdfAttribute("natureOfBusiness/liquidAsset", lifeEmploymentInfo.getNatureOfBusinessName()));
	    attributeList.add(new PdfAttribute("occupationKey", "Occupation 職業"));
	    attributeList.add(new PdfAttribute("occupation", lifeEmploymentInfo.getOccupationName()));
	    attributeList.add(new PdfAttribute("personalIncomeKey", "Monthly Personal Income(applicable to full-time and part-time job) 個人每月收入（港幣）（全職及兼職適用）"));
	    attributeList.add(new PdfAttribute("personalIncome", lifeEmploymentInfo.getMonthlyPersonalIncomeName()));
	    
	    attributeList.add(new PdfAttribute("SinglePremium", NumberFormatUtils.formatNumber(lifePayment.getPaymentAmount())));
	    
	    attributeList.add(new PdfAttribute("beneficiaryEnglishName1", lifeBeneficaryInfo.getBeneficaryFirstName1()+" "+lifeBeneficaryInfo.getBeneficaryLastName1()));
	    attributeList.add(new PdfAttribute("beneficiaryChineseName1", lifeBeneficaryInfo.getBeneficaryChineseName1()));
	    attributeList.add(new PdfAttribute("beneficiaryGender1", lifeBeneficaryInfo.getBeneficaryGender1()));
	    attributeList.add(new PdfAttribute("beneficiaryHKID1", lifeBeneficaryInfo.getBeneficaryID1()));
	    attributeList.add(new PdfAttribute("relationship1", StringUtils.isNotBlank(lifeBeneficaryInfo.getBeneficaryRelation1())?lifeBeneficaryInfo.getBeneficaryRelation1().split("-")[1]:""));
	    attributeList.add(new PdfAttribute("entitlement1", lifeBeneficaryInfo.getBeneficaryWeight1()));
	    
	    attributeList.add(new PdfAttribute("beneficiaryEnglishName2", lifeBeneficaryInfo.getBeneficaryFirstName2()+" "+lifeBeneficaryInfo.getBeneficaryLastName2()));
	    attributeList.add(new PdfAttribute("beneficiaryChineseName2", lifeBeneficaryInfo.getBeneficaryChineseName2()));
	    attributeList.add(new PdfAttribute("beneficiaryGender2", lifeBeneficaryInfo.getBeneficaryGender2()));
	    attributeList.add(new PdfAttribute("beneficiaryHKID2", lifeBeneficaryInfo.getBeneficaryID2()));
	    attributeList.add(new PdfAttribute("relationship2", StringUtils.isNotBlank(lifeBeneficaryInfo.getBeneficaryRelation2())?lifeBeneficaryInfo.getBeneficaryRelation2().split("-")[1]:""));
	    attributeList.add(new PdfAttribute("entitlement2", lifeBeneficaryInfo.getBeneficaryWeight2()));
	    
	    attributeList.add(new PdfAttribute("beneficiaryEnglishName3", lifeBeneficaryInfo.getBeneficaryFirstName3()+" "+lifeBeneficaryInfo.getBeneficaryLastName3()));
	    attributeList.add(new PdfAttribute("beneficiaryChineseName3", lifeBeneficaryInfo.getBeneficaryChineseName3()));
	    attributeList.add(new PdfAttribute("beneficiaryGender3", lifeBeneficaryInfo.getBeneficaryGender3()));
	    attributeList.add(new PdfAttribute("beneficiaryHKID3", lifeBeneficaryInfo.getBeneficaryID3()));
	    attributeList.add(new PdfAttribute("relationship3", StringUtils.isNotBlank(lifeBeneficaryInfo.getBeneficaryRelation3())?lifeBeneficaryInfo.getBeneficaryRelation3().split("-")[1]:""));
	    attributeList.add(new PdfAttribute("entitlement3", lifeBeneficaryInfo.getBeneficaryWeight3()));
	    
	    attributeList.add(new PdfAttribute("Bank/BranchName", lifePayment.getBankName()+"-"+lifePayment.getBranchName()));
	    
	    attributeList.add(new PdfAttribute("Oneoffpamentamount", "Yes"));
	    
	   // String bankCode = json.get("bankCode")+"";
	    String bankCode = bankName.substring(bankName.length()-4, bankName.length()-1);
	    if(StringUtils.isNotBlank(bankCode) && !"null".equals(bankCode)){
	    	for(int i=0;i<bankCode.length();i++){
	    		String c = bankCode.charAt(i)+"";
	    		attributeList.add(new PdfAttribute("BankNo."+(i+1), c));
	    	}
	    }
	    
	    
	    //String branchCode = json.get("branchCode")+"";
	    String branchCode = branchName.substring(branchName.length()-4, branchName.length()-1);
	    if(StringUtils.isNotBlank(branchCode) && !"null".equals(branchCode)){
	    	for(int i=0;i<branchCode.length();i++){
	    		String c = branchCode.charAt(i)+"";
	    		attributeList.add(new PdfAttribute("BranchNo."+(i+1), c));
	    	}
	    }
	    
	    
	    String accountNumber = lifePayment.getAccountNumber();
	    for(int i=0;i<accountNumber.length();i++){
	    	String c = accountNumber.charAt(i)+"";
	    	attributeList.add(new PdfAttribute("AccountNo."+(i+1), c));
	    }
	    
	    attributeList.add(new PdfAttribute("LimitForEachPayment", NumberFormatUtils.formatNumber(lifePayment.getPaymentAmount())));
	    attributeList.add(new PdfAttribute("ExpiryDate", format.format(new Date())));
	    attributeList.add(new PdfAttribute("NameofAccountHolder", lifePersonalDetails.getFirstname()+" "+lifePersonalDetails.getLastname()));
	    attributeList.add(new PdfAttribute("HKIDNo", lifePersonalDetails.getHkid()));
	    
	    attributeList.add(new PdfAttribute("DirectMarketingInfo", "Yes"));
	    attributeList.add(new PdfAttribute("ThirdParty", "Yes"));
	    attributeList.add(new PdfAttribute("ForeignAccountTaxComplianceAct", "On"));
	    attributeList.add(new PdfAttribute("applicationNote", "On"));
	    attributeList.add(new PdfAttribute("authDate", format.format(new Date())));
	    
	    if("2".equals(type)){
	    	CreateEliteTermPolicyResponse lifePolicy = (CreateEliteTermPolicyResponse) session.getAttribute("lifePolicy");
			String documentPath = UserRestURIConstants.getConfigs("documentPath");
			String uploadDir = documentPath + "/"+new sun.misc.BASE64Encoder().encode(lifePolicy.getPolicyNo().getBytes()); 
	        String path = uploadDir + "/JSignature.png";
	        path = path.replace("/", "\\");
			attributeList.add(new PdfAttribute("authSign", path,"imagepath"));
		}
			
		String pdfTemplatePath = request.getRealPath("/").replace("\\", "/")+"/resources/pdf/"+"SavieOnlineApplicationForm.pdf";
		String pdfGeneratePath = request.getRealPath("/").replace("\\", "\\\\")+"\\\\resources\\\\pdf\\\\";
		String name = PDFGeneration.generatePdf2(pdfTemplatePath,pdfGeneratePath,attributeList,false,"All rights reserved, copy");
		
		request.getSession().setAttribute("applicationFormPdf", name);
		logger.info("applicationFormPdf create successfully");
	}
	
	@SuppressWarnings({ "deprecation", "unchecked" })
	public void createFnaFormPdf(String type,HttpServletRequest request,HttpSession session) throws Exception {
		SavieFnaBean savieFna = (SavieFnaBean) session.getAttribute("savieFna");
		CreateEliteTermPolicyResponse lifePolicy = (CreateEliteTermPolicyResponse) session.getAttribute("lifePolicy");
		LifePersonalDetailsBean lifePersonalDetails = (LifePersonalDetailsBean) session.getAttribute("lifePersonalDetails");
		LifeBeneficaryInfoBean lifeBeneficaryInfo = (LifeBeneficaryInfoBean) session.getAttribute("lifeBeneficaryInfo");
		
		List<PdfAttribute> attributeList = new ArrayList<PdfAttribute>();
		attributeList.add(new PdfAttribute("PolicyNo", lifePolicy.getPolicyNo()));
		/*String LifeInsuredName = "";
		if(lifeBeneficaryInfo.getIsOwnEstate()){
			LifeInsuredName = lifePersonalDetails.getFirstname()+" "+
		                      lifePersonalDetails.getLastname()+" "+
					          lifePersonalDetails.getChineseName();
		}
		else{
			LifeInsuredName = lifeBeneficaryInfo.getBeneficaryFirstName1()+" "+lifeBeneficaryInfo.getBeneficaryLastName1() + "\r\n" +
	                          lifeBeneficaryInfo.getBeneficaryFirstName2()+" "+lifeBeneficaryInfo.getBeneficaryLastName2() + "\r\n" +
	                          lifeBeneficaryInfo.getBeneficaryFirstName3()+" "+lifeBeneficaryInfo.getBeneficaryLastName3();
		}*/
		attributeList.add(new PdfAttribute("LifeInsuredName", lifePersonalDetails.getLastname()+" "+lifePersonalDetails.getFirstname()));
		
		attributeList.add(new PdfAttribute("ApplicantName", lifePersonalDetails.getLastname()+" "+lifePersonalDetails.getFirstname()));
		
		int AOB = DateApi.getAge(DateApi.formatDate(savieFna.getDob()))+1;
		attributeList.add(new PdfAttribute("AOB", AOB+""));
		
		attributeList.add(new PdfAttribute("TelephoneNo", lifePersonalDetails.getResidentialTelNo()+" / "+lifePersonalDetails.getMobileNumber()));
		
		String group_1 = "";
		if("0".equals(savieFna.getMarital_status())){
			group_1 = "Single";
		}
		else if("1".equals(savieFna.getMarital_status())){
			group_1 = "Married";
		}
		else if("2".equals(savieFna.getMarital_status())){
			group_1 = "Divorced";
		}
		else if("3".equals(savieFna.getMarital_status())){
			group_1 = "Widowed";
		}
		attributeList.add(new PdfAttribute("group_1", group_1));
		
		String group_2 = "";
		if("0".equals(savieFna.getDependents())){
			group_2 = "Nil";
		}
		else if("1".equals(savieFna.getDependents())){
			group_2 = "1-3";
		}
		else if("2".equals(savieFna.getDependents())){
			group_2 = "4-6";
		}
		else if("3".equals(savieFna.getDependents())){
			group_2 = ">=7";
		}
		attributeList.add(new PdfAttribute("group_2", group_2));
		
		String occupation = "";
		List<OptionItemDesc> optionItemDescENList = InitApplicationMessage.occupationEN;
		for(OptionItemDesc optionItemDescEN : optionItemDescENList){
			if(optionItemDescEN.getItemCode().equals(savieFna.getOccupation())){
				occupation = optionItemDescEN.getItemDesc();
			}
		}
		/*List<OptionItemDesc> optionItemDescCNList = InitApplicationMessage.occupationCN;
		for(OptionItemDesc optionItemDescCN : optionItemDescCNList){
			if(optionItemDescCN.getItemCode().equals(savieFna.getOccupation())){
				occupation = occupation + "\r\n" + optionItemDescCN.getItemDesc();
			}
		}*/
		
		/*if("NoBD1".equals(savieFna.getOccupation())){
			occupation = "Farmer -- General Farming";
		}
		else if("NoBD2".equals(savieFna.getOccupation())){
			occupation = "Farmer -- Poultry";
		}
		else if("NoBD3".equals(savieFna.getOccupation())){
			occupation = "Fisherman -- Pond, Lake & River";
		}
		else if("NoBD4".equals(savieFna.getOccupation())){
			occupation = "Fisherman -- Coming Ashore Daily";
		}
		else if("NoBD5".equals(savieFna.getOccupation())){
			occupation = "Fisherman -- Not Coming Ashore Daily";
		}
		else if("NoBD6".equals(savieFna.getOccupation())){
			occupation = "Gardener";
		}
		else if("NoBD7".equals(savieFna.getOccupation())){
			occupation = "Labourer -- Farm";
		}
		else if("NoBD8".equals(savieFna.getOccupation())){
			occupation = "Proprietor -- Farm";
		}*/
		attributeList.add(new PdfAttribute("ApplicantOccupation", occupation));
		
		String group_3 = "";
		if("0".equals(savieFna.getEducation())){
			group_3 = "Primary";
		}
		else if("1".equals(savieFna.getEducation())){
			group_3 = "Secondary";
		}
		else if("2".equals(savieFna.getEducation())){
			group_3 = "Vocational";
		}
		else if("3".equals(savieFna.getEducation())){
			group_3 = "University";
		}
		attributeList.add(new PdfAttribute("group_3", group_3));
		
		String[] q1= savieFna.getQ1().split(",");
		for(String i :q1){
			if("0".equals(i)){
				attributeList.add(new PdfAttribute("1a", "On"));
			}
			if("1".equals(i)){
				attributeList.add(new PdfAttribute("1b", "On"));
			}
			if("2".equals(i)){
				attributeList.add(new PdfAttribute("1c", "On"));
			}
			if("3".equals(i)){
				attributeList.add(new PdfAttribute("1d", "On"));
			}
			if("4".equals(i)){
				attributeList.add(new PdfAttribute("1e", "On"));
			}
			if("5".equals(i)){
				attributeList.add(new PdfAttribute("1f", "On"));
				attributeList.add(new PdfAttribute("1others", savieFna.getQ1_others()));
			}
		}
		
		String[] q2= savieFna.getQ2().split(",");
		for(String i :q2){
			if("0".equals(i)){
				attributeList.add(new PdfAttribute("2a", "On"));
			}
			if("1".equals(i)){
				attributeList.add(new PdfAttribute("2b", "On"));
			}
			if("2".equals(i)){
				attributeList.add(new PdfAttribute("2c", "On"));
			}
			if("3".equals(i)){
				attributeList.add(new PdfAttribute("2d", "On"));
			}
			if("4".equals(i)){
				attributeList.add(new PdfAttribute("2e", "On"));
				attributeList.add(new PdfAttribute("2others", savieFna.getQ2_others()));
			}
		}
		
		String group_3a = "";
		if("0".equals(savieFna.getQ3())){
			group_3a = "3a";
		}
		else if("1".equals(savieFna.getQ3())){
			group_3a = "3b";
		}
		else if("2".equals(savieFna.getQ3())){
			group_3a = "3c";
		}
		else if("3".equals(savieFna.getQ3())){
			group_3a = "3d";
		}
		else if("4".equals(savieFna.getQ3())){
			group_3a = "3e";
		}
		else if("5".equals(savieFna.getQ3())){
			group_3a = "3f";
		}
		attributeList.add(new PdfAttribute("group_3a", group_3a));
		
		if("1".equals(savieFna.getQ4())){
			attributeList.add(new PdfAttribute("group_4", "Yes"));
		}
		else{
			attributeList.add(new PdfAttribute("group_4", "No"));
		}
		
		String group_4a = "";
		if("0".equals(savieFna.getQ4_a())){
			group_4a = "4ai";
			attributeList.add(new PdfAttribute("AverageMonthlyIncome", NumberFormatUtils.formatNumber(savieFna.getQ4_a_others())));
		}
		else if("1".equals(savieFna.getQ4_a())){
			group_4a = "4aa";
			attributeList.add(new PdfAttribute("group_4aii", "4aii"));
			
		}
		else if("2".equals(savieFna.getQ4_a())){
			group_4a = "4ab";
			attributeList.add(new PdfAttribute("group_4aii", "4aii"));
			
		}
		else if("3".equals(savieFna.getQ4_a())){
			group_4a = "4ac";
			attributeList.add(new PdfAttribute("group_4aii", "4aii"));
			
		}
		else if("4".equals(savieFna.getQ4_a())){
			group_4a = "4ad";
			attributeList.add(new PdfAttribute("group_4aii", "4aii"));	
		}
		else if("5".equals(savieFna.getQ4_a())){
			group_4a = "4ae";
			attributeList.add(new PdfAttribute("group_4aii", "4aii"));	
		}
		
		attributeList.add(new PdfAttribute("group_4a", group_4a));

		String[] q4_b= savieFna.getQ4_b().split(",");
		for(String i :q4_b){
			if("0".equals(i)){
				attributeList.add(new PdfAttribute("Cash", "On"));
			}
			if("1".equals(i)){
				attributeList.add(new PdfAttribute("Moneyinbankaccounts", "On"));
			}
			if("2".equals(i)){
				attributeList.add(new PdfAttribute("Moneymarketaccounts", "On"));
			}
			if("3".equals(i)){
				attributeList.add(new PdfAttribute("Activelytradedstocks", "On"));
			}
			if("4".equals(i)){
				attributeList.add(new PdfAttribute("Bondsandmutualfunds", "On"));
			}
			if("5".equals(i)){
				attributeList.add(new PdfAttribute("USTreasurybills", "On"));
			}
			if("6".equals(i)){
				attributeList.add(new PdfAttribute("other", "On"));
				attributeList.add(new PdfAttribute("4bothers", savieFna.getQ4_b_others()));
			}
		}
		attributeList.add(new PdfAttribute("LiquidAssets", NumberFormatUtils.formatNumber(savieFna.getQ4_b_amount())));
		
		
		attributeList.add(new PdfAttribute("TotalExpensespermonth", NumberFormatUtils.formatNumber(savieFna.getQ4_c())));
		
		attributeList.add(new PdfAttribute("Liabilityandfinalexpense", NumberFormatUtils.formatNumber(savieFna.getQ4_d_1())));
		
		attributeList.add(new PdfAttribute("Fintarget", NumberFormatUtils.formatNumber(savieFna.getQ4_d_2())));
		
		String group_4e = "";
		if("0".equals(savieFna.getQ4_e())){
			group_4e = "4ea";
		}
		else if("1".equals(savieFna.getQ4_e())){
			group_4e = "4eb";
		}
		else if("2".equals(savieFna.getQ4_e())){
			group_4e = "4ec";
		}
		else if("3".equals(savieFna.getQ4_e())){
			group_4e = "4ed";
		}
		else if("4".equals(savieFna.getQ4_e())){
			group_4e = "4ee";
		}
		else if("5".equals(savieFna.getQ4_e())){
			group_4e = "4ef";
		}
		attributeList.add(new PdfAttribute("group_4e", group_4e));
		
		String group_4f = "";
		if("0".equals(savieFna.getQ4_f())){
			group_4f = "4fa";
		}
		else if("1".equals(savieFna.getQ4_f())){
			group_4f = "4fb";
		}
		else if("2".equals(savieFna.getQ4_f())){
			group_4f = "4fc";
		}
		else if("3".equals(savieFna.getQ4_f())){
			group_4f = "4fd";
		}
		else if("4".equals(savieFna.getQ4_f())){
			group_4f = "4fe";
		}
		else if("5".equals(savieFna.getQ4_f())){
			group_4f = "4ff";
		}
		attributeList.add(new PdfAttribute("group_4f", group_4f));
		
		String[] q4_g= savieFna.getQ4_g().split(",");
		for(String i :q4_g){
			if("0".equals(i)){
				attributeList.add(new PdfAttribute("Salary", "On"));
			}
			if("1".equals(i)){
				attributeList.add(new PdfAttribute("Income", "On"));
			}
			if("2".equals(i)){
				attributeList.add(new PdfAttribute("Savings", "On"));
			}
			if("3".equals(i)){
				attributeList.add(new PdfAttribute("Investements", "On"));
			}
			if("4".equals(i)){
				attributeList.add(new PdfAttribute("other", "On"));
				attributeList.add(new PdfAttribute("4gothers", savieFna.getQ4_g_others()));
			}
		}
		
		ProductRecommendation productRecommendation = (ProductRecommendation) session.getAttribute("productRecommendation");
		String selectProductName = "AeconoSmart";//session.getAttribute("selectProductName").toString();
		if(productRecommendation!=null&&productRecommendation.getProduct_list()!=null&productRecommendation.getProduct_list().size()>0){
			for(String l :q1){
				if("0".equals(l)){
					attributeList.add(new PdfAttribute("Q1a1", "On"));
				}
				if("1".equals(l)){
					attributeList.add(new PdfAttribute("Q1b1", "On"));
				}
				if("2".equals(l)){
					attributeList.add(new PdfAttribute("Q1c1", "On"));
				}
				if("3".equals(l)){
					attributeList.add(new PdfAttribute("Q1d1", "On"));
				}
				if("4".equals(l)){
					attributeList.add(new PdfAttribute("Q1e1", "On"));
				}
				if("5".equals(l)){
					attributeList.add(new PdfAttribute("Q1f1", "On"));
					attributeList.add(new PdfAttribute("Q1others1", savieFna.getQ1_others()));
				}
			}
			for(String m :q2){
				if("0".equals(m)){
					attributeList.add(new PdfAttribute("Q2a1", "On"));
				}
				if("1".equals(m)){
					attributeList.add(new PdfAttribute("Q2b1", "On"));
					
				}
				if("2".equals(m)){
					attributeList.add(new PdfAttribute("Q2c1", "On"));
				}
				if("3".equals(m)){
					attributeList.add(new PdfAttribute("Q2d1", "On"));
				}
				if("4".equals(m)){
					attributeList.add(new PdfAttribute("Q2e1", "On"));
					attributeList.add(new PdfAttribute("Q2others1", savieFna.getQ2_others()));
				}
			}
			attributeList.add(new PdfAttribute("NameofInsuranceProduct(s)Introduced1", "SAVIE"));
			attributeList.add(new PdfAttribute("Product(s)Selected1", "Yes"));
			
			
			int i = 2;
			for(int a=0;a<productRecommendation.getProduct_list().size();a++){
				List<MorphDynaBean> productLists = productRecommendation.getProduct_list();
				List<MorphDynaBean> products = (List<MorphDynaBean>) productLists.get(a).get("products");
				for(int b=0;b<products.size();b++){
					for(String j :q1){
						if("0".equals(j)){
							attributeList.add(new PdfAttribute("Q1a"+i, "On"));
						}
						if("1".equals(j)){
							attributeList.add(new PdfAttribute("Q1b"+i, "On"));
						}
						if("2".equals(j)){
							attributeList.add(new PdfAttribute("Q1c"+i, "On"));
						}
						if("3".equals(j)){
							attributeList.add(new PdfAttribute("Q1d"+i, "On"));
						}
						if("4".equals(j)){
							attributeList.add(new PdfAttribute("Q1e"+i, "On"));
						}
						if("5".equals(j)){
							attributeList.add(new PdfAttribute("Q1f"+i, "On"));
							attributeList.add(new PdfAttribute("Q1others"+i, savieFna.getQ1_others()));
						}
					}
					
					for(String k :q2){
						if("0".equals(k)){
							attributeList.add(new PdfAttribute("Q2a"+i, "On"));
						}
						if("1".equals(k)){
							attributeList.add(new PdfAttribute("Q2b"+i, "On"));
							
						}
						if("2".equals(k)){
							attributeList.add(new PdfAttribute("Q2c"+i, "On"));
						}
						if("3".equals(k)){
							attributeList.add(new PdfAttribute("Q2d"+i, "On"));
						}
						if("4".equals(k)){
							attributeList.add(new PdfAttribute("Q2e"+i, "On"));
							attributeList.add(new PdfAttribute("Q2others"+i, savieFna.getQ2_others()));
						}
					}
					
					String productName = products.get(b).get("name").toString();
					attributeList.add(new PdfAttribute("NameofInsuranceProduct(s)Introduced"+i, productName));
					if(selectProductName!=null&&selectProductName.equals(productName)){
						attributeList.add(new PdfAttribute("Product(s)Selected"+i, "Yes"));
					}
					i = i+1;
				}
			}
			
			if(i < 2){
				attributeList.add(new PdfAttribute("Nooption", "根據以上選項,本公司未能提供其他一筆過付款產品以作比較\r\nAccording to the above choices,"
						+ "\r\nour company do not have other products\r\nproviding single premium options for comparison."));
			}
			else{
				attributeList.add(new PdfAttribute("Nooption", ""));
			}
			logger.info("产品数："+i);
		}
		
		
		attributeList.add(new PdfAttribute("Date1", DateApi.formatString(new Date(), "dd/MM/yyyy")));
		
		if("2".equals(type)){
			String documentPath = UserRestURIConstants.getConfigs("documentPath");
			String uploadDir = documentPath + "/"+new sun.misc.BASE64Encoder().encode(lifePolicy.getPolicyNo().getBytes()); 
	        String path = uploadDir + "/JSignature.png";
	        path = path.replace("/", "\\");
			attributeList.add(new PdfAttribute("SignatureofApplicant", path,"imagepath"));
		}
		String pdfTemplatePath = request.getRealPath("/").replace("\\", "/")+"/resources/pdf/"+"FinancialNeedsAndInvestorProfileAnalysisForm.pdf";
		String pdfGeneratePath = request.getRealPath("/").replace("\\", "\\\\")+"\\\\resources\\\\pdf\\\\";
		String name = PDFGeneration.generatePdf2(pdfTemplatePath,pdfGeneratePath,attributeList,false,"All rights reserved, copy");
		
		request.getSession().setAttribute("fnaPdfName", name);
		logger.info("fnaFormPdf create successfully");
	}
	
	public JSONObject saveProductFna(SavieFnaBean savieFna,HttpServletRequest request) throws ECOMMAPIException{
		String Url = UserRestURIConstants.SAVE_FNA;
		final Map<String,String> header = headerUtil.getHeader(request);
		JSONObject jsonObject = new JSONObject();
		
		String language = (String) request.getSession().getAttribute("language");
		if (language.equalsIgnoreCase("EN")) {
			jsonObject.put("lang", "EN");
		
		} else {
			jsonObject.put("lang", "CH");
		}
		jsonObject.put("name", savieFna.getName());
		jsonObject.put("gender", savieFna.getGender());
		String[] dob = savieFna.getDob().split("-");
		jsonObject.put("dob", dob[2]+"-"+dob[1]+"-"+dob[0]);
		jsonObject.put("marital_status", savieFna.getMarital_status());
		jsonObject.put("dependents", savieFna.getDependents());
		jsonObject.put("education", savieFna.getEducation());
		jsonObject.put("employment_status", savieFna.getEmployment_status());
		jsonObject.put("nature_of_business", savieFna.getNature_of_business());
		jsonObject.put("occupation", savieFna.getOccupation());
		jsonObject.put("occupation_others", savieFna.getOccupation_others());
		jsonObject.put("q1", savieFna.getQ1());
		jsonObject.put("q1_others", savieFna.getQ1_others());
		jsonObject.put("q2", savieFna.getQ2());
		jsonObject.put("q2_others", savieFna.getQ2_others());
		jsonObject.put("q3", savieFna.getQ3());
		jsonObject.put("q4", savieFna.getQ4());
		jsonObject.put("q4_a", savieFna.getQ4_a());
		jsonObject.put("q4_a_others", savieFna.getQ4_a_others()!=null?savieFna.getQ4_a_others().replace(",", ""):"");
		jsonObject.put("q4_b", savieFna.getQ4_b());
		jsonObject.put("q4_b_amount", savieFna.getQ4_b_amount()!=null?savieFna.getQ4_b_amount().replace(",", ""):"");
		jsonObject.put("q4_b_others", savieFna.getQ4_b_others());
		jsonObject.put("q4_c", savieFna.getQ4_c()!=null?savieFna.getQ4_c().replace(",", ""):"");
		jsonObject.put("q4_d_1", savieFna.getQ4_d_1()!=null?savieFna.getQ4_d_1().replace(",", ""):"");
		jsonObject.put("q4_d_2", savieFna.getQ4_d_2()!=null?savieFna.getQ4_d_2().replace(",", ""):"");
		jsonObject.put("q4_e", savieFna.getQ4_e());
		jsonObject.put("q4_f", savieFna.getQ4_f());
		jsonObject.put("q4_g", savieFna.getQ4_g());
		jsonObject.put("q4_g_others", savieFna.getQ4_g_others());
		jsonObject.put("hash_key", request.getSession().getAttribute("hashKey")!=null?request.getSession().getAttribute("hashKey"):"");
		logger.info(jsonObject.toString());
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.POST,Url, header, jsonObject);
		return responseJsonObj;
	}
	
	@SuppressWarnings("unchecked")
	public JSONObject getProductrRecommend(SavieFnaBean savieFna,HttpServletRequest request) throws ECOMMAPIException{
		String Url = UserRestURIConstants.GET_PRODUCTRECOMMENDATION;
		String sort_by = StringHelper.emptyIfNull(request.getParameter("sort_by"));
		final Map<String,String> header = headerUtil.getHeader(request);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("name", savieFna.getName());
		jsonObject.put("gender", savieFna.getGender());
		//jsonObject.put("dob", savieFna.getDob());
		String[] dob = savieFna.getDob().split("-");
		jsonObject.put("dob", dob[2]+"-"+dob[1]+"-"+dob[0]);
		jsonObject.put("marital_status", savieFna.getMarital_status());
		jsonObject.put("dependents", savieFna.getDependents());
		jsonObject.put("education", savieFna.getEducation());
		jsonObject.put("employment_status", savieFna.getEmployment_status());
		jsonObject.put("nature_of_business", savieFna.getNature_of_business());
		jsonObject.put("occupation", savieFna.getOccupation());
		jsonObject.put("occupation_others", savieFna.getOccupation_others());
		jsonObject.put("q1", savieFna.getQ1());
		jsonObject.put("q1_others", savieFna.getQ1_others());
		jsonObject.put("q2", savieFna.getQ2());
		jsonObject.put("q2_others", savieFna.getQ2_others());
		jsonObject.put("q3", savieFna.getQ3());
		jsonObject.put("q4", savieFna.getQ4());
		jsonObject.put("q4_a", (savieFna.getQ4_a() != null)?savieFna.getQ4_a():0 );
		jsonObject.put("q4_a_others", savieFna.getQ4_a_others()!=null?savieFna.getQ4_a_others().replace(",", ""):"");
		jsonObject.put("q4_b", savieFna.getQ4_b());
		jsonObject.put("q4_b_amount", savieFna.getQ4_b_amount()!=null?savieFna.getQ4_b_amount().replace(",", ""):"");
		jsonObject.put("q4_b_others", savieFna.getQ4_b_others());
		jsonObject.put("q4_c", savieFna.getQ4_c()!=null?savieFna.getQ4_c().replace(",", ""):"");
		jsonObject.put("q4_d_1", savieFna.getQ4_d_1()!=null?savieFna.getQ4_d_1().replace(",", ""):"");
		jsonObject.put("q4_d_2", savieFna.getQ4_d_2()!=null?savieFna.getQ4_d_2().replace(",", ""):"");
		jsonObject.put("q4_e", savieFna.getQ4_e());
		jsonObject.put("q4_f", savieFna.getQ4_f());
		jsonObject.put("q4_g", savieFna.getQ4_g());
		jsonObject.put("q4_g_others", savieFna.getQ4_g_others());
		logger.info(jsonObject.toString());
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.POST,Url, header, jsonObject);
		logger.info("GET_PRODUCTRECOMMENDATION : " + responseJsonObj.toString());
		if(responseJsonObj.get("errMsgs") == null) {
			
			JSONArray productArr = (JSONArray)responseJsonObj.get("product_list");
			JSONArray sortProductArr = new JSONArray();
			String sortGroupArr = "";
			String sort;
			JSONObject products;
			if(productArr != null) {
				for(int i = 0; i < productArr.size(); i++) {
					products = (JSONObject) productArr.get(i);
					sort = products.get("products").toString();
					switch (sort_by) {
					case "0":
						sort = CompareUtil.comparePeriodAsc(sort);
						break;
					case "1":
						sort = CompareUtil.compareArrAsc(sort, "getMin_issue_age", false);
						break;
					case "2":
						sort = CompareUtil.compareArrAsc(sort, "getMax_issue_age", true);
						break;
					case "3":
						sort = CompareUtil.compareIntAsc(sort, "getProtection_period");
						break;
					case "4":
						sort = CompareUtil.comparePeriodDesc(sort);
						break;
					case "5":
						sort = CompareUtil.compareArrDesc(sort, "getMin_issue_age", false);
						break;
					case "6":
						sort = CompareUtil.compareArrDesc(sort, "getMax_issue_age", true);
						break;
					case "7":
						sort = CompareUtil.compareIntDesc(sort, "getProtection_period");
						break;
					default :
						sort = CompareUtil.compareCodeDesc(sort);
						break;
					}
					products.put("products", JSONValue.parse(sort));
					sortProductArr.add(products);
				}
				sortGroupArr = CompareUtil.compareGroup(sortProductArr.toString());
			}
			responseJsonObj.put("product_list", JSONValue.parse(sortGroupArr));
			logger.info("product_list : " + JSONValue.parse(responseJsonObj.toString()));
			net.sf.json.JSONObject json = net.sf.json.JSONObject.fromObject(responseJsonObj.toString());
			ProductRecommendation productRecommendation = (ProductRecommendation) net.sf.json.JSONObject.toBean(json, ProductRecommendation.class);
			request.getSession().setAttribute("productRecommendation", productRecommendation);
		}
		return responseJsonObj;
	}
	
	@SuppressWarnings("unchecked")
	public JSONObject getFna(HttpServletRequest request) throws ECOMMAPIException{
		String Url = UserRestURIConstants.GET_FNA;
		final Map<String,String> header = headerUtil.getHeader(request);
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,Url, header, null);
		JSONObject jobject = new JSONObject();
		HttpSession hashSession = request.getSession();
		if (responseJsonObj.get("result") != null){
			jobject = (JSONObject)responseJsonObj.get("result");
			hashSession.setAttribute("hashKey", jobject.get("hash_key"));
			
			if(jobject.get("name")!=null&&jobject.get("gender")!=null){
				SavieFnaBean savieFna = new SavieFnaBean();
				UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
				savieFna.setName(userDetails.getFullName());
				savieFna.setUser_name(userDetails.getFullName());
				savieFna.setGender(jobject.get("gender").toString());
				String[] dob = jobject.get("dob").toString().split("-");
				savieFna.setDob(dob[2]+"-"+dob[1]+"-"+dob[0]);
				savieFna.setMarital_status(jobject.get("marital_status").toString());
				savieFna.setDependents(jobject.get("dependents").toString());
				savieFna.setEducation(jobject.get("education").toString());
				savieFna.setEmployment_status(jobject.get("employment_status").toString());
				savieFna.setNature_of_business(jobject.get("nature_of_business").toString());
				savieFna.setOccupation(jobject.get("occupation").toString());
				savieFna.setOccupation_others(jobject.get("occupation_others")!=null?jobject.get("occupation_others").toString():"");
				savieFna.setQ1(jobject.get("q1")!=null?jobject.get("q1").toString():"");
				savieFna.setQ1_others(jobject.get("q1_others")!=null?jobject.get("q1_others").toString():"");
				savieFna.setQ2(jobject.get("q2")!=null?jobject.get("q2").toString():"");
				savieFna.setQ2_others(jobject.get("q2_others")!=null?jobject.get("q2_others").toString():"");
				savieFna.setQ3(jobject.get("q3")!=null?jobject.get("q3").toString():"");
				savieFna.setQ4(jobject.get("q4")!=null?jobject.get("q4").toString():"");
				savieFna.setQ4_a(jobject.get("q4_a")!=null?jobject.get("q4_a").toString():"");
				savieFna.setQ4_a_others(jobject.get("q4_a_others")!=null?jobject.get("q4_a_others").toString():"");
				savieFna.setQ4_b(jobject.get("q4_b")!=null?jobject.get("q4_b").toString():"");
				savieFna.setQ4_b_amount(jobject.get("q4_b_amount")!=null?jobject.get("q4_b_amount").toString():"");
				savieFna.setQ4_b_others(jobject.get("q4_b_others")!=null?jobject.get("q4_b_others").toString():"");
				savieFna.setQ4_c(jobject.get("q4_c")!=null?jobject.get("q4_c").toString():"");
				savieFna.setQ4_d_1(jobject.get("q4_d_1")!=null?jobject.get("q4_d_1").toString():"");
				savieFna.setQ4_d_2(jobject.get("q4_d_2")!=null?jobject.get("q4_d_2").toString():"");
				savieFna.setQ4_e(jobject.get("q4_e")!=null?jobject.get("q4_e").toString():"");
				savieFna.setQ4_f(jobject.get("q4_f")!=null?jobject.get("q4_f").toString():"");
				savieFna.setQ4_g(jobject.get("q4_g")!=null?jobject.get("q4_g").toString():"");
				savieFna.setQ4_g_others(jobject.get("q4_g_others")!=null?jobject.get("q4_g_others").toString():"");
				savieFna.setLast_update(jobject.get("last_update")!=null?DateApi.formatTime1(Long.valueOf(jobject.get("last_update").toString())):"");
				request.getSession().setAttribute("savieFna", savieFna);
				
				jobject.put("name", userDetails.getFullName());
				jobject.put("dob", dob[2]+"-"+dob[1]+"-"+dob[0]);
				jobject.put("q4_a_others", jobject.get("q4_a_others")!=null?NumberFormatUtils.formatNumber(jobject.get("q4_a_others").toString()):"");
				jobject.put("q4_b_amount", jobject.get("q4_b_amount")!=null?NumberFormatUtils.formatNumber(jobject.get("q4_b_amount").toString()):"");
				jobject.put("q4_c", jobject.get("q4_c")!=null?NumberFormatUtils.formatNumber(jobject.get("q4_c").toString()):"");
				jobject.put("q4_d_1", jobject.get("q4_d_1")!=null?NumberFormatUtils.formatNumber(jobject.get("q4_d_1").toString()):"");
				jobject.put("q4_d_2", jobject.get("q4_d_2")!=null?NumberFormatUtils.formatNumber(jobject.get("q4_d_2").toString()):"");
				jobject.put("last_update", jobject.get("last_update")!=null?DateApi.formatTime1(Long.valueOf(jobject.get("last_update").toString())):"");
			}
		}
		return jobject;
	}
	
	public JSONObject getPurchaseHistoryByPlanCode(HttpServletRequest request) throws ECOMMAPIException{
		String planCode = request.getParameter("planCode");
		String Url = UserRestURIConstants.GET_PURCHASE_HISTORY_BY_PLANCODE+"?planCode="+planCode;
		final Map<String,String> header = headerUtil.getHeader(request);
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,Url, header, null);
		return responseJsonObj;
	}
	
	public void contactCs(HttpServletRequest request) throws ECOMMAPIException{
		String Url = UserRestURIConstants.SAVIE_CONTACT_CS;
		final Map<String,String> header = headerUtil.getHeader(request);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("name", request.getParameter("name"));
		jsonObject.put("email", request.getParameter("email"));
		jsonObject.put("mobile", request.getParameter("mobile"));
		jsonObject.put("preferredDay", request.getParameter("preferredDay").split("-")[0]);
		jsonObject.put("preferredTimeSlot", request.getParameter("preferredTimeSlot").split("-")[0]);
		jsonObject.put("enquiryType", request.getParameter("enquiryType").split("-")[0]);
		jsonObject.put("channel", "fna-recommendation");
		jsonObject.put("product", "savie-sp");
		logger.info(jsonObject.toString());
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.POST,Url, header, jsonObject);
		if(responseJsonObj==null){
			logger.info("api error");
			throw new ECOMMAPIException("api error");
		}
		else if(responseJsonObj.get("errMsgs")!=null && responseJsonObj.get("errMsgs")!="") {
			throw new ECOMMAPIException(responseJsonObj.get("errMsgs").toString());
		}
		else{
			List<OptionItemDesc> etCsContactPreferredDayEN = InitApplicationMessage.etCsContactPreferredDayEN;
			String contactWeekdayEn = null;
			for(int i=0;i<etCsContactPreferredDayEN.size();i++){
				if(etCsContactPreferredDayEN.get(i).getItemCode().equals(request.getParameter("preferredDay").split("-")[0])){
					contactWeekdayEn = etCsContactPreferredDayEN.get(i).getItemDesc();
				}
			}
			List<OptionItemDesc> etCsContactPreferredDayCN = InitApplicationMessage.etCsContactPreferredDayCN;
			String contactWeekdayCh = null;
			for(int i=0;i<etCsContactPreferredDayCN.size();i++){
				if(etCsContactPreferredDayCN.get(i).getItemCode().equals(request.getParameter("preferredDay").split("-")[0])){
					contactWeekdayCh = etCsContactPreferredDayCN.get(i).getItemDesc();
				}
			}
			
			List<OptionItemDesc> etCsContactPreferredTimeSlotEN = InitApplicationMessage.etCsContactPreferredTimeSlotEN;
			String contactTimeEn = null;
			for(int i=0;i<etCsContactPreferredTimeSlotEN.size();i++){
				if(etCsContactPreferredTimeSlotEN.get(i).getItemCode().equals(request.getParameter("preferredTimeSlot").split("-")[0])){
					contactTimeEn = etCsContactPreferredTimeSlotEN.get(i).getItemDesc();
				}
			}
			List<OptionItemDesc> etCsContactPreferredTimeSlotCN = InitApplicationMessage.etCsContactPreferredTimeSlotCN;
			String contactTimeCh = null;
			for(int i=0;i<etCsContactPreferredTimeSlotCN.size();i++){
				if(etCsContactPreferredTimeSlotCN.get(i).getItemCode().equals(request.getParameter("preferredTimeSlot").split("-")[0])){
					contactTimeCh = etCsContactPreferredTimeSlotCN.get(i).getItemDesc();
				}
			}
			
			
			JSONObject parameters = new JSONObject();
			parameters.put("to", request.getParameter("email"));
			parameters.put("subject", "FWD will contact you shortly | 富衛將會聯繫您");
			JSONObject model = new JSONObject();
			   model.put("name", request.getParameter("name"));
			   model.put("contactPhoneNo", request.getParameter("mobile"));
			   model.put("contactWeekdayEn", contactWeekdayEn);
			   model.put("contactTimeEn", contactTimeEn);
			   model.put("contactWeekdayCh", contactWeekdayCh);
			   model.put("contactTimeCh", contactTimeCh);
			parameters.put("model", model); 
			parameters.put("template", "savie\\leaveContact.html");
			logger.info(parameters.toString());
			
			BaseResponse apiReturn = null;
			final Map<String,String> header1 = headerUtil.getHeader1(request);
			apiReturn = connector.sendTemplateEmail(parameters, header1);
			if(apiReturn==null){
				logger.info("api error");
				throw new ECOMMAPIException("api error");
			}
			else if(apiReturn.hasError()) {
				logger.info(apiReturn.getErrMsgs()[0]);
				throw new ECOMMAPIException(apiReturn.getErrMsgs()[0]);
			}
		}
	}
	
	@SuppressWarnings("unchecked")
	public CreateEliteTermPolicyResponse createLifePolicy(HttpServletRequest request,HttpSession session)throws ECOMMAPIException{
		SaviePlanDetailsBean saviePlanDetails = (SaviePlanDetailsBean) session.getAttribute("saviePlanDetails");
		LifePersonalDetailsBean lifePersonalDetails = (LifePersonalDetailsBean) session.getAttribute("lifePersonalDetails");
		LifeEmploymentInfoBean lifeEmploymentInfo = (LifeEmploymentInfoBean) session.getAttribute("lifeEmploymentInfo");
		LifeBeneficaryInfoBean lifeBeneficaryInfo = (LifeBeneficaryInfoBean) session.getAttribute("lifeBeneficaryInfo");
		LifePaymentBean lifePayment = (LifePaymentBean) session.getAttribute("lifePayment");
		LifeDeclarationBean lifeDeclaration = (LifeDeclarationBean) session.getAttribute("lifeDeclaration");
		
		JSONObject parameters = new JSONObject();
		parameters.put("planCode", "SAVIE-SP");
			JSONObject applicant = new JSONObject();
			applicant.put("firstName", lifePersonalDetails.getFirstname());
			applicant.put("lastName", lifePersonalDetails.getLastname());
			applicant.put("chineseName", lifePersonalDetails.getChineseName());
			String[] dob = lifePersonalDetails.getDob().split("-");
			applicant.put("dob", dob[2]+"-"+dob[1]+"-"+dob[0]);
			applicant.put("gender", lifePersonalDetails.getGender().substring(0, 1));
			applicant.put("hkId", lifePersonalDetails.getHkid().toUpperCase());
			applicant.put("passport", "");
			applicant.put("maritalStatus", lifePersonalDetails.getMartialStatus()!=null?lifePersonalDetails.getMartialStatus().split("-")[0]:"");
			applicant.put("placeOfBirth", lifePersonalDetails.getPlaceOfBirth()!=null?lifePersonalDetails.getPlaceOfBirth().split("-")[0]:"");
			applicant.put("nationality", lifePersonalDetails.getNationalty()!=null?lifePersonalDetails.getNationalty().split("-")[0]:"");
			applicant.put("residentialTelNoCountryCode", "852");
			applicant.put("residentialTelNo", lifePersonalDetails.getResidentialTelNo());
			applicant.put("mobileNoCountryCode", "852");
			applicant.put("mobileNo", lifePersonalDetails.getMobileNumber());
			applicant.put("email", lifePersonalDetails.getEmailAddress());
				JSONObject permanentAddress = new JSONObject();
				permanentAddress.put("line1", lifePersonalDetails.getPermanetAddress1());
				permanentAddress.put("line2", lifePersonalDetails.getPermanetAddress2());
				permanentAddress.put("line3", lifePersonalDetails.getPermanetAddress3());
				permanentAddress.put("line4", lifePersonalDetails.getPermanetAddress4());
				permanentAddress.put("district", lifePersonalDetails.getPermanetAddressDistrict()!=null?lifePersonalDetails.getPermanetAddressDistrict().split("-")[0]:"");
			applicant.put("permanentAddress", permanentAddress);
				
				JSONObject residentialAddress = new JSONObject();
				residentialAddress.put("line1", lifePersonalDetails.getResidentialAddress1());
				residentialAddress.put("line2", lifePersonalDetails.getResidentialAddress2());
				residentialAddress.put("line3", lifePersonalDetails.getResidentialAddress3());
				residentialAddress.put("line4", lifePersonalDetails.getResidentialAddress4());
				residentialAddress.put("district", lifePersonalDetails.getResidentialAddressDistrict()!=null?lifePersonalDetails.getResidentialAddressDistrict().split("-")[0]:"");
			applicant.put("residentialAddress", residentialAddress);
				
				JSONObject correspondenceAddress = new JSONObject();
				correspondenceAddress.put("line1", lifePersonalDetails.getCorrespondenceAddress1());
				correspondenceAddress.put("line2", lifePersonalDetails.getCorrespondenceAddress2());
				correspondenceAddress.put("line3", lifePersonalDetails.getCorrespondenceAddress3());
				correspondenceAddress.put("line4", lifePersonalDetails.getCorrespondenceAddress4());
				correspondenceAddress.put("district", lifePersonalDetails.getCorrespondenceAddressDistrict()!=null?lifePersonalDetails.getCorrespondenceAddressDistrict().split("-")[0]:"");
			applicant.put("correspondenceAddress", correspondenceAddress);
				
				JSONObject employmentStatus = new JSONObject();
				employmentStatus.put("employmentStatus", lifeEmploymentInfo.getEmploymentStatus()!=null?lifeEmploymentInfo.getEmploymentStatus().split("-")[0]:"");
				employmentStatus.put("occupation", lifeEmploymentInfo.getOccupation()!=null?lifeEmploymentInfo.getOccupation().split("-")[0]:"");
				employmentStatus.put("educationLevel", lifeEmploymentInfo.getEducation()!=null?lifeEmploymentInfo.getEducation().split("-")[0]:"");
				employmentStatus.put("natureOfBusiness", lifeEmploymentInfo.getNatureOfBusiness()!=null?lifeEmploymentInfo.getNatureOfBusiness().split("-")[0]:"");
				employmentStatus.put("monthlyPersonalIncome", lifeEmploymentInfo.getMonthlyPersonalIncome()!=null?lifeEmploymentInfo.getMonthlyPersonalIncome().split("-")[0].toUpperCase():"");
				employmentStatus.put("liquidAsset", lifeEmploymentInfo.getAmountOfLiquidAssets()!=null?lifeEmploymentInfo.getAmountOfLiquidAssets().split("-")[0]:"");
				employmentStatus.put("amountOtherSource", lifeEmploymentInfo.getAmountOfOtherSourceOfIncome()!=null?lifeEmploymentInfo.getAmountOfOtherSourceOfIncome().split("-")[0]:"");
				employmentStatus.put("employerName", lifeEmploymentInfo.getEmployerName());
			applicant.put("employmentStatus", employmentStatus);
			applicant.put("smoke", false);
			applicant.put("optOut1", lifeDeclaration.getChkboxDoNotSendMarketingInfo()!=null?lifeDeclaration.getChkboxDoNotSendMarketingInfo():"false");
			applicant.put("optOut2", lifeDeclaration.getChkboxDoNotProvidePersonalData()!=null?lifeDeclaration.getChkboxDoNotProvidePersonalData():"false");
		parameters.put("applicant", applicant);
			JSONObject insured = new JSONObject();
			insured.put("name", applicant.get("lastName")+" "+applicant.get("firstName"));
			insured.put("hkId", applicant.get("hkId"));
			insured.put("passport", "");
			insured.put("relationship", "SE");
				JSONArray beneficiaries = new JSONArray();
					JSONObject beneficiarie1 = new JSONObject();
					JSONObject beneficiarie2 = new JSONObject();
					JSONObject beneficiarie3 = new JSONObject();
					if(lifeBeneficaryInfo.getIsOwnEstate()){
						beneficiarie1.put("firstName", applicant.get("firstName"));
						beneficiarie1.put("lastName", applicant.get("lastName"));
						beneficiarie1.put("chineseName", applicant.get("chineseName"));
						beneficiarie1.put("hkId", applicant.get("hkId"));
						beneficiarie1.put("passport", applicant.get("passport"));
						beneficiarie1.put("gender", applicant.get("gender"));
						beneficiarie1.put("relationship", "SE");
						beneficiarie1.put("entitlement", "100");
					beneficiaries.add(beneficiarie1);
					}
					else{
						if(!"".equals(lifeBeneficaryInfo.getBeneficaryFirstName1())){
							beneficiarie1.put("firstName", lifeBeneficaryInfo.getBeneficaryFirstName1());
							beneficiarie1.put("lastName", lifeBeneficaryInfo.getBeneficaryLastName1());
							beneficiarie1.put("chineseName", lifeBeneficaryInfo.getBeneficaryChineseName1());
							if("hkid".equals(lifeBeneficaryInfo.getBeneficiaryHkidPassport1())){
								beneficiarie1.put("hkId", lifeBeneficaryInfo.getBeneficaryID1().toUpperCase());
								beneficiarie1.put("passport", "");
							}
							else{
								beneficiarie1.put("hkId", "");
								beneficiarie1.put("passport", lifeBeneficaryInfo.getBeneficiaryPassport1());
							}
							beneficiarie1.put("gender", lifeBeneficaryInfo.getBeneficaryGender1());
							beneficiarie1.put("relationship", lifeBeneficaryInfo.getBeneficaryRelation1()!=null?lifeBeneficaryInfo.getBeneficaryRelation1().split("-")[0]:"");
							beneficiarie1.put("entitlement", lifeBeneficaryInfo.getBeneficaryWeight1());
						beneficiaries.add(beneficiarie1);
						}
						if(!"".equals(lifeBeneficaryInfo.getBeneficaryFirstName2())){
							beneficiarie2.put("firstName", lifeBeneficaryInfo.getBeneficaryFirstName2());
							beneficiarie2.put("lastName", lifeBeneficaryInfo.getBeneficaryLastName2());
							beneficiarie2.put("chineseName", lifeBeneficaryInfo.getBeneficaryChineseName2());
							if("hkid".equals(lifeBeneficaryInfo.getBeneficiaryHkidPassport2())){
								beneficiarie1.put("hkId", lifeBeneficaryInfo.getBeneficaryID2().toUpperCase());
								beneficiarie1.put("passport", "");
							}
							else{
								beneficiarie1.put("hkId", "");
								beneficiarie1.put("passport", lifeBeneficaryInfo.getBeneficiaryPassport2());
							}
							beneficiarie2.put("gender", lifeBeneficaryInfo.getBeneficaryGender2());
							beneficiarie2.put("relationship", lifeBeneficaryInfo.getBeneficaryRelation2()!=null?lifeBeneficaryInfo.getBeneficaryRelation2().split("-")[0]:"");
							beneficiarie2.put("entitlement", lifeBeneficaryInfo.getBeneficaryWeight2());
						beneficiaries.add(beneficiarie2);
						}
						if(!"".equals(lifeBeneficaryInfo.getBeneficaryFirstName3())){
							beneficiarie3.put("firstName", lifeBeneficaryInfo.getBeneficaryFirstName3());
							beneficiarie3.put("lastName", lifeBeneficaryInfo.getBeneficaryLastName3());
							beneficiarie3.put("chineseName", lifeBeneficaryInfo.getBeneficaryChineseName3());
							if("hkid".equals(lifeBeneficaryInfo.getBeneficiaryHkidPassport3())){
								beneficiarie1.put("hkId", lifeBeneficaryInfo.getBeneficaryID3().toUpperCase());
								beneficiarie1.put("passport", "");
							}
							else{
								beneficiarie1.put("hkId", "");
								beneficiarie1.put("passport", lifeBeneficaryInfo.getBeneficiaryPassport3());
							}
							beneficiarie3.put("gender", lifeBeneficaryInfo.getBeneficaryGender3());
							beneficiarie3.put("relationship", lifeBeneficaryInfo.getBeneficaryRelation3()!=null?lifeBeneficaryInfo.getBeneficaryRelation3().split("-")[0]:"");
							beneficiarie3.put("entitlement", lifeBeneficaryInfo.getBeneficaryWeight3());
						beneficiaries.add(beneficiarie3);
						}
					}
			insured.put("beneficiaries", beneficiaries);
		parameters.put("insured", insured);
			JSONObject payment = new JSONObject();
			payment.put("amount", saviePlanDetails.getInsuredAmount());
			payment.put("paymentMethod", lifePayment.getPaymentMethod());
			payment.put("bankCode", lifePayment.getBankCode()!=null?lifePayment.getBankCode().substring(lifePayment.getBankCode().length()-4, lifePayment.getBankCode().length()-1):"");
			payment.put("branchCode", lifePayment.getBranchName()!=null?lifePayment.getBranchName().substring(lifePayment.getBranchName().length()-4, lifePayment.getBranchName().length()-1):"");
			payment.put("accountNo", lifePayment.getAccountNumber());
			payment.put("expiryDate", "");
		parameters.put("payment", payment);
		parameters.put("insuredAmount", saviePlanDetails.getInsuredAmount());
		parameters.put("referralCode", saviePlanDetails.getPromoCode());
		logger.info(parameters.toString());
		
		final Map<String,String> header = headerUtil.getHeader1(request);
		CreateEliteTermPolicyResponse lifePolicy = new CreateEliteTermPolicyResponse();
		lifePolicy = connector.createLifePolicy(parameters, header);
		if(!lifePolicy.hasError()){
			request.getSession().setAttribute("lifePolicy", lifePolicy);
		}
		else{
			throw new ECOMMAPIException(lifePolicy.getErrMsgs()[0]);
		}
		return lifePolicy;
	}
	
	public BaseResponse finalizeLifePolicy(HttpServletRequest request,HttpSession session)throws ECOMMAPIException{
		CreateEliteTermPolicyResponse lifePolicy = (CreateEliteTermPolicyResponse) request.getSession().getAttribute("lifePolicy");
		JSONObject parameters = new JSONObject();
		parameters.put("creditCaredNo", "");
		parameters.put("expiryDate", "");
		parameters.put("cardHolderName", "");
		parameters.put("policyNo", lifePolicy.getPolicyNo());
		parameters.put("planCode", "SAVIE-SP");
		logger.info(parameters.toString());
		
		BaseResponse apiReturn = null;
		final Map<String,String> header = headerUtil.getHeader1(request);
		apiReturn = connector.finalizeLifePolicy(parameters, header);
		if(apiReturn.hasError()){
			throw new ECOMMAPIException(apiReturn.getErrMsgs()[0]);
		}
		return apiReturn;
	}
	
	public List<OptionItemDesc> getBranchCode(String value,HttpServletRequest request) throws ECOMMAPIException {
        List<OptionItemDesc> OptionItemDescList = new ArrayList<OptionItemDesc>();
        JSONArray jsonOptionItemDescs = null;
        
        String Url = UserRestURIConstants.SERVICE_URL + "/option/itemDesc?itemTable="+value.split("-")[0];
		final Map<String,String> header = headerUtil.getHeader(request);
		
		org.json.simple.JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,Url, header, null);
		
		logger.info("***********responseJsonObj****************:"+responseJsonObj);
		
		if(responseJsonObj==null){
			throw new ECOMMAPIException("data error");
		}
		else{
			if (responseJsonObj.get("errMsgs") == null) {
				jsonOptionItemDescs = (JSONArray)responseJsonObj.get("optionItemDesc");
				if(jsonOptionItemDescs.size()>0){
					for(int i = 0; i<jsonOptionItemDescs.size(); i++){
						
						org.json.simple.JSONObject maritalStatusObj=(org.json.simple.JSONObject)jsonOptionItemDescs.get(i);
						
						OptionItemDesc optionItemDesc = new OptionItemDesc();				
						
						optionItemDesc.setItemTable((String)maritalStatusObj.get("itemTable"));
						optionItemDesc.setItemDesc((String)maritalStatusObj.get("itemDesc"));
						optionItemDesc.setItemCode((String)maritalStatusObj.get("itemCode"));
						optionItemDesc.setItemLang((String)maritalStatusObj.get("itemLang"));
						OptionItemDescList.add(optionItemDesc);
					}
				}
				
			}
			else{
				throw new ECOMMAPIException(responseJsonObj.get("errMsgs").toString());
			}
		}
	return OptionItemDescList;
	}
	
	public net.sf.json.JSONObject lifePersonalDetailsPutData(LifePersonalDetailsBean lifePersonalDetails,net.sf.json.JSONObject parameters){
		parameters.accumulate("applicantFirstName", lifePersonalDetails.getFirstname()!=null?lifePersonalDetails.getFirstname():"");
		parameters.accumulate("applicantLastName", lifePersonalDetails.getLastname()!=null?lifePersonalDetails.getLastname():"");
		parameters.accumulate("applicantChineseName", lifePersonalDetails.getChineseName()!=null?lifePersonalDetails.getChineseName():"");
		parameters.accumulate("applicantDob", lifePersonalDetails.getDob()!=null?lifePersonalDetails.getDob():"");
		parameters.accumulate("applicantGender", lifePersonalDetails.getGender()!=null?lifePersonalDetails.getGender():"");
		parameters.accumulate("applicantHkId", lifePersonalDetails.getHkid()!=null?lifePersonalDetails.getHkid():"");
		parameters.accumulate("applicantPassport", lifePersonalDetails.getPassport()!=null?lifePersonalDetails.getPassport():"");
		parameters.accumulate("applicantMaritalStatus", lifePersonalDetails.getMartialStatus()!=null?lifePersonalDetails.getMartialStatus():"");
		parameters.accumulate("applicantPlaceOfBirth", lifePersonalDetails.getPlaceOfBirth()!=null?lifePersonalDetails.getPlaceOfBirth():"");
		parameters.accumulate("applicantNationality", lifePersonalDetails.getNationalty()!=null?lifePersonalDetails.getNationalty():"");
		parameters.accumulate("applicantResidentialTelNoCountryCode", lifePersonalDetails.getResidentialTelNoCountryCode()!=null?lifePersonalDetails.getResidentialTelNoCountryCode():"");
		parameters.accumulate("applicantResidentialTelNo", lifePersonalDetails.getResidentialTelNo()!=null?lifePersonalDetails.getResidentialTelNo():"");
		parameters.accumulate("applicantMobileNoCountryCode", lifePersonalDetails.getMobileNoCountryCode()!=null?lifePersonalDetails.getMobileNoCountryCode():"");
		parameters.accumulate("applicantMobileNo", lifePersonalDetails.getMobileNumber()!=null?lifePersonalDetails.getMobileNumber():"");
		parameters.accumulate("applicantEmail", lifePersonalDetails.getEmailAddress()!=null?lifePersonalDetails.getEmailAddress():"");
		parameters.accumulate("residentialAddress1", lifePersonalDetails.getResidentialAddress1()!=null?lifePersonalDetails.getResidentialAddress1():"");
		parameters.accumulate("residentialAddress2", lifePersonalDetails.getResidentialAddress2()!=null?lifePersonalDetails.getResidentialAddress2():"");
		parameters.accumulate("residentialAddress3", lifePersonalDetails.getResidentialAddress3()!=null?lifePersonalDetails.getResidentialAddress3():"");
		parameters.accumulate("residentialAddress4", lifePersonalDetails.getResidentialAddress4()!=null?lifePersonalDetails.getResidentialAddress4():"");
		parameters.accumulate("residentialDistrict", lifePersonalDetails.getResidentialAddressDistrict()!=null?lifePersonalDetails.getResidentialAddressDistrict():"");
		parameters.accumulate("correspondenceAddress1", lifePersonalDetails.getCorrespondenceAddress1()!=null?lifePersonalDetails.getCorrespondenceAddress1():"");
		parameters.accumulate("correspondenceAddress2", lifePersonalDetails.getCorrespondenceAddress2()!=null?lifePersonalDetails.getCorrespondenceAddress2():"");
		parameters.accumulate("correspondenceAddress3", lifePersonalDetails.getCorrespondenceAddress3()!=null?lifePersonalDetails.getCorrespondenceAddress3():"");
		parameters.accumulate("correspondenceAddress4", lifePersonalDetails.getCorrespondenceAddress4()!=null?lifePersonalDetails.getCorrespondenceAddress4():"");
		parameters.accumulate("correspondenceDistrict", lifePersonalDetails.getCorrespondenceAddressDistrict()!=null?lifePersonalDetails.getCorrespondenceAddressDistrict():"");
		parameters.accumulate("permanentAddress1", lifePersonalDetails.getPermanetAddress1()!=null?lifePersonalDetails.getPermanetAddress1():"");
		parameters.accumulate("permanentAddress2", lifePersonalDetails.getPermanetAddress2()!=null?lifePersonalDetails.getPermanetAddress2():"");
		parameters.accumulate("permanentAddress3", lifePersonalDetails.getPermanetAddress3()!=null?lifePersonalDetails.getPermanetAddress3():"");
		parameters.accumulate("permanentAddress4", lifePersonalDetails.getPermanetAddress4()!=null?lifePersonalDetails.getPermanetAddress4():"");
		parameters.accumulate("permanentDistrict", lifePersonalDetails.getPermanetAddressDistrict()!=null?lifePersonalDetails.getPermanetAddressDistrict():"");
		return parameters;
	}
	
	public void lifePersonalDetailsSaveforLater(LifePersonalDetailsBean lifePersonalDetails,HttpServletRequest request) throws ECOMMAPIException{
		String language = (String) request.getSession().getAttribute("language");
		final Map<String,String> header = headerUtil.getHeader1(request);
		net.sf.json.JSONObject parameters = new net.sf.json.JSONObject();
		parameters.accumulate("planCode", "SAVIE-SP");
		parameters = this.lifePersonalDetailsPutData(lifePersonalDetails, parameters);
		parameters.accumulate("resumeViewPage", language+"/savings-insurance/employment-info");
		
		BaseResponse apiResponse = connector.createPolicyApplication(parameters, header);
		if(apiResponse==null){
			logger.info("api error");
			throw new ECOMMAPIException("api error");
		}
		else if(apiResponse.hasError()) {
			logger.info(apiResponse.getErrMsgs()[0]);
			throw new ECOMMAPIException(apiResponse.getErrMsgs()[0]);
		}
	}
	
	public net.sf.json.JSONObject lifeEmploymentInfoPutData(LifeEmploymentInfoBean lifeEmploymentInfo,net.sf.json.JSONObject parameters){
		parameters.accumulate("employmentStatus", lifeEmploymentInfo.getEmploymentStatus()!=null?lifeEmploymentInfo.getEmploymentStatus():"");
		parameters.accumulate("occupation", lifeEmploymentInfo.getOccupation()!=null?lifeEmploymentInfo.getOccupation():"");
		parameters.accumulate("educationLevel", lifeEmploymentInfo.getEducation()!=null?lifeEmploymentInfo.getEducation():"");
		parameters.accumulate("natureOfBusiness", lifeEmploymentInfo.getNatureOfBusiness()!=null?lifeEmploymentInfo.getNatureOfBusiness():"");
		parameters.accumulate("monthlyPersonalIncome", lifeEmploymentInfo.getMonthlyPersonalIncome()!=null?lifeEmploymentInfo.getMonthlyPersonalIncome():"");
		parameters.accumulate("liquidAssest", lifeEmploymentInfo.getAmountOfLiquidAssets()!=null?lifeEmploymentInfo.getAmountOfLiquidAssets():"");
		parameters.accumulate("amountOtherSource", lifeEmploymentInfo.getAmountOfOtherSourceOfIncome()!=null?lifeEmploymentInfo.getAmountOfOtherSourceOfIncome():"");
		parameters.accumulate("employerName", lifeEmploymentInfo.getEmployerName()!=null?lifeEmploymentInfo.getEmployerName():"");
		return parameters;
	}
	
	public void lifeEmploymentInfoSaveforLater(LifeEmploymentInfoBean lifeEmploymentInfo,HttpServletRequest request) throws ECOMMAPIException{
		LifePersonalDetailsBean lifePersonalDetails = (LifePersonalDetailsBean) request.getSession().getAttribute("lifePersonalDetails");
		
		String language = (String) request.getSession().getAttribute("language");
		final Map<String,String> header = headerUtil.getHeader1(request);
		net.sf.json.JSONObject parameters = new net.sf.json.JSONObject();
		parameters.accumulate("planCode", "SAVIE-SP");
		parameters = this.lifePersonalDetailsPutData(lifePersonalDetails, parameters);
		parameters = this.lifeEmploymentInfoPutData(lifeEmploymentInfo, parameters);
		parameters.accumulate("resumeViewPage", language+"/savings-insurance/beneficiary-info");
		
		BaseResponse apiResponse = connector.createPolicyApplication(parameters, header);
		if(apiResponse==null){
			logger.info("api error");
			throw new ECOMMAPIException("api error");
		}
		else if(apiResponse.hasError()) {
			logger.info(apiResponse.getErrMsgs()[0]);
			throw new ECOMMAPIException(apiResponse.getErrMsgs()[0]);
		}
	}
	
	public net.sf.json.JSONObject lifeBeneficaryInfoPutData(LifeBeneficaryInfoBean lifeBeneficaryInfo,net.sf.json.JSONObject parameters){
		parameters.accumulate("beneficiaryFirstName1", lifeBeneficaryInfo.getBeneficaryFirstName1()!=null?lifeBeneficaryInfo.getBeneficaryFirstName1():"");
		parameters.accumulate("beneficiaryLastName1", lifeBeneficaryInfo.getBeneficaryLastName1()!=null?lifeBeneficaryInfo.getBeneficaryLastName1():"");
		parameters.accumulate("beneficiaryChineseName1", lifeBeneficaryInfo.getBeneficaryChineseName1()!=null?lifeBeneficaryInfo.getBeneficaryChineseName1():"");
		parameters.accumulate("beneficiaryHkId1", lifeBeneficaryInfo.getBeneficaryID1()!=null?lifeBeneficaryInfo.getBeneficaryID1():"");
		parameters.accumulate("beneficiaryPassport1", lifeBeneficaryInfo.getBeneficiaryPassport1()!=null?lifeBeneficaryInfo.getBeneficiaryPassport1():"");
		parameters.accumulate("beneficiaryGender1", lifeBeneficaryInfo.getBeneficaryGender1()!=null?lifeBeneficaryInfo.getBeneficaryGender1():"");
		parameters.accumulate("beneficiaryRelationship1", lifeBeneficaryInfo.getBeneficaryRelation1()!=null?lifeBeneficaryInfo.getBeneficaryRelation1():"");
		parameters.accumulate("beneficiaryEntitlement1", lifeBeneficaryInfo.getBeneficaryWeight1()!=null?lifeBeneficaryInfo.getBeneficaryWeight1():"");
		parameters.accumulate("beneficiaryFirstName2", lifeBeneficaryInfo.getBeneficaryFirstName2()!=null?lifeBeneficaryInfo.getBeneficaryFirstName2():"");
		parameters.accumulate("beneficiaryLastName2", lifeBeneficaryInfo.getBeneficaryLastName2()!=null?lifeBeneficaryInfo.getBeneficaryLastName2():"");
		parameters.accumulate("beneficiaryChineseName2", lifeBeneficaryInfo.getBeneficaryChineseName2()!=null?lifeBeneficaryInfo.getBeneficaryChineseName2():"");
		parameters.accumulate("beneficiaryHkId2", lifeBeneficaryInfo.getBeneficaryID2()!=null?lifeBeneficaryInfo.getBeneficaryID2():"");
		parameters.accumulate("beneficiaryPassport2", lifeBeneficaryInfo.getBeneficiaryPassport2()!=null?lifeBeneficaryInfo.getBeneficiaryPassport2():"");
		parameters.accumulate("beneficiaryGender2", lifeBeneficaryInfo.getBeneficaryGender2()!=null?lifeBeneficaryInfo.getBeneficaryGender2():"");
		parameters.accumulate("beneficiaryRelationship2", lifeBeneficaryInfo.getBeneficaryRelation2()!=null?lifeBeneficaryInfo.getBeneficaryRelation2():"");
		parameters.accumulate("beneficiaryEntitlement2", lifeBeneficaryInfo.getBeneficaryWeight2()!=null?lifeBeneficaryInfo.getBeneficaryWeight2():"");
		parameters.accumulate("beneficiaryFirstName3", lifeBeneficaryInfo.getBeneficaryFirstName3()!=null?lifeBeneficaryInfo.getBeneficaryFirstName3():"");
		parameters.accumulate("beneficiaryLastName3", lifeBeneficaryInfo.getBeneficaryLastName3()!=null?lifeBeneficaryInfo.getBeneficaryLastName3():"");
		parameters.accumulate("beneficiaryChineseName3", lifeBeneficaryInfo.getBeneficaryChineseName3()!=null?lifeBeneficaryInfo.getBeneficaryChineseName3():"");
		parameters.accumulate("beneficiaryHkId3", lifeBeneficaryInfo.getBeneficaryID3()!=null?lifeBeneficaryInfo.getBeneficaryID3():"");
		parameters.accumulate("beneficiaryPassport3", lifeBeneficaryInfo.getBeneficiaryPassport3()!=null?lifeBeneficaryInfo.getBeneficiaryPassport3():"");
		parameters.accumulate("beneficiaryGender3", lifeBeneficaryInfo.getBeneficaryGender3()!=null?lifeBeneficaryInfo.getBeneficaryGender3():"");
		parameters.accumulate("beneficiaryRelationship3", lifeBeneficaryInfo.getBeneficaryRelation3()!=null?lifeBeneficaryInfo.getBeneficaryRelation3():"");
		parameters.accumulate("beneficiaryEntitlement3", lifeBeneficaryInfo.getBeneficaryWeight3()!=null?lifeBeneficaryInfo.getBeneficaryWeight3():"");
		return parameters;
	}
	
	public void lifeBeneficaryInfoSaveforLater(LifeBeneficaryInfoBean lifeBeneficaryInfo,HttpServletRequest request) throws ECOMMAPIException{
		LifePersonalDetailsBean lifePersonalDetails = (LifePersonalDetailsBean) request.getSession().getAttribute("lifePersonalDetails");
		LifeEmploymentInfoBean lifeEmploymentInfo = (LifeEmploymentInfoBean) request.getSession().getAttribute("lifeEmploymentInfo");
		
		String language = (String) request.getSession().getAttribute("language");
		final Map<String,String> header = headerUtil.getHeader1(request);
		net.sf.json.JSONObject parameters = new net.sf.json.JSONObject();
		parameters.accumulate("planCode", "SAVIE-SP");
		parameters = this.lifePersonalDetailsPutData(lifePersonalDetails, parameters);
		parameters = this.lifeEmploymentInfoPutData(lifeEmploymentInfo, parameters);
		parameters = this.lifeBeneficaryInfoPutData(lifeBeneficaryInfo, parameters);
		parameters.accumulate("resumeViewPage", language+"/savings-insurance/payment");
		BaseResponse apiResponse = connector.createPolicyApplication(parameters, header);
		if(apiResponse==null){
			logger.info("api error");
			throw new ECOMMAPIException("api error");
		}
		else if(apiResponse.hasError()) {
			logger.info(apiResponse.getErrMsgs()[0]);
			throw new ECOMMAPIException(apiResponse.getErrMsgs()[0]);
		}
	}
	
	public net.sf.json.JSONObject lifePaymentPutData(LifePaymentBean lifePayment,net.sf.json.JSONObject parameters){
		parameters.accumulate("paymentMethod", lifePayment.getPaymentMethod()!=null?lifePayment.getPaymentMethod():"");
		parameters.accumulate("bankName", lifePayment.getBankCode()!=null?lifePayment.getBankCode():"");
		parameters.accumulate("branchName", lifePayment.getBranchCode()!=null?lifePayment.getBranchCode():"");
		parameters.accumulate("accountNo", lifePayment.getAccountNumber()!=null?lifePayment.getAccountNumber():"");
		return parameters;
	}
	
	public void lifePaymentSaveforLater(LifePaymentBean lifePayment,HttpServletRequest request) throws ECOMMAPIException{
		LifePersonalDetailsBean lifePersonalDetails = (LifePersonalDetailsBean) request.getSession().getAttribute("lifePersonalDetails");
		LifeEmploymentInfoBean lifeEmploymentInfo = (LifeEmploymentInfoBean) request.getSession().getAttribute("lifeEmploymentInfo");
		LifeBeneficaryInfoBean lifeBeneficaryInfo = (LifeBeneficaryInfoBean) request.getSession().getAttribute("lifeBeneficaryInfo");
		
		String language = (String) request.getSession().getAttribute("language");
		final Map<String,String> header = headerUtil.getHeader1(request);
		net.sf.json.JSONObject parameters = new net.sf.json.JSONObject();
		parameters.accumulate("planCode", "SAVIE-SP");
		parameters = this.lifePersonalDetailsPutData(lifePersonalDetails, parameters);
		parameters = this.lifeEmploymentInfoPutData(lifeEmploymentInfo, parameters);
		parameters = this.lifeBeneficaryInfoPutData(lifeBeneficaryInfo, parameters);
		parameters = this.lifePaymentPutData(lifePayment, parameters);
		parameters.accumulate("resumeViewPage", language+"/savings-insurance/application-summary");
		BaseResponse apiResponse = connector.createPolicyApplication(parameters, header);
		if(apiResponse==null){
			logger.info("api error");
			throw new ECOMMAPIException("api error");
		}
		else if(apiResponse.hasError()) {
			logger.info(apiResponse.getErrMsgs()[0]);
			throw new ECOMMAPIException(apiResponse.getErrMsgs()[0]);
		}
	}
	
	public net.sf.json.JSONObject lifeDeclarationPutData(LifeDeclarationBean lifeDeclaration,net.sf.json.JSONObject parameters){
		parameters.accumulate("declaration1", lifeDeclaration.getHasReadAndAcceptFATC()!=null?lifeDeclaration.getHasReadAndAcceptFATC():"false");
		parameters.accumulate("declaration2", lifeDeclaration.getHasReadAndAcceptFATC2()!=null?lifeDeclaration.getHasReadAndAcceptFATC2():"false");
		parameters.accumulate("declaration3", lifeDeclaration.getHasReadAndAcceptPICS()!=null?lifeDeclaration.getHasReadAndAcceptPICS():"false");
		parameters.accumulate("declaration4", lifeDeclaration.getHaveReplaced());
		parameters.accumulate("declaration5", lifeDeclaration.getIntentToReplaced());
		parameters.accumulate("declaration6", lifeDeclaration.getHasReadAndAcceptCancellation()!=null?lifeDeclaration.getHasReadAndAcceptCancellation():"false");
		parameters.accumulate("declaration7", lifeDeclaration.getIntentToLiveOutside());
		parameters.accumulate("declaration8", lifeDeclaration.getHasReadAndAgreeApplication()!=null?lifeDeclaration.getHasReadAndAgreeApplication():"false");
		parameters.accumulate("declaration9", lifeDeclaration.getChkboxDoNotSendMarketingInfo()!=null?lifeDeclaration.getChkboxDoNotSendMarketingInfo():"false");
		parameters.accumulate("declaration10", lifeDeclaration.getChkboxDoNotProvidePersonalData()!=null?lifeDeclaration.getChkboxDoNotProvidePersonalData():"false");
		return parameters;
	}
	
	public void lifeDeclarationSaveforLater(LifeDeclarationBean lifeDeclaration,HttpServletRequest request) throws ECOMMAPIException{
		LifePersonalDetailsBean lifePersonalDetails = (LifePersonalDetailsBean) request.getSession().getAttribute("lifePersonalDetails");
		LifeEmploymentInfoBean lifeEmploymentInfo = (LifeEmploymentInfoBean) request.getSession().getAttribute("lifeEmploymentInfo");
		LifeBeneficaryInfoBean lifeBeneficaryInfo = (LifeBeneficaryInfoBean) request.getSession().getAttribute("lifeBeneficaryInfo");
		LifePaymentBean lifePayment = (LifePaymentBean) request.getSession().getAttribute("lifePayment");
		
		String language = (String) request.getSession().getAttribute("language");
		final Map<String,String> header = headerUtil.getHeader1(request);
		net.sf.json.JSONObject parameters = new net.sf.json.JSONObject();
		parameters.accumulate("planCode", "SAVIE-SP");
		parameters = this.lifePersonalDetailsPutData(lifePersonalDetails, parameters);
		parameters = this.lifeEmploymentInfoPutData(lifeEmploymentInfo, parameters);
		parameters = this.lifeBeneficaryInfoPutData(lifeBeneficaryInfo, parameters);
		parameters = this.lifePaymentPutData(lifePayment, parameters);
		parameters = this.lifeDeclarationPutData(lifeDeclaration, parameters);
		parameters.accumulate("resumeViewPage", language+"/savings-insurance/signature");
		BaseResponse apiResponse = connector.createPolicyApplication(parameters, header);
		if(apiResponse==null){
			logger.info("api error");
			throw new ECOMMAPIException("api error");
		}
		else if(apiResponse.hasError()) {
			logger.info(apiResponse.getErrMsgs()[0]);
			throw new ECOMMAPIException(apiResponse.getErrMsgs()[0]);
		}
	}
	
	public void uploadSavieOnlineDocument(HttpServletRequest request)throws ECOMMAPIException, Exception{
		//sales pdf
	    this.createSalesIllustrationPdf("2", request);
	    this.uploadPdf("pdfName","salesIllustration", request);
		
		//fna pdf
		this.createFnaFormPdf("2", request, request.getSession());
		this.uploadPdf("fnaPdfName","fna", request);
		
		//application pdf
		this.createApplicationFormPdf("2", request, request.getSession());
		this.uploadPdf("applicationFormPdf","applicationForm", request);
	}
	
	public void uploadPdf(String fileName, String docType, HttpServletRequest request)throws ECOMMAPIException, IOException{
		byte data[];
		int i;
		CreateEliteTermPolicyResponse lifePolicy = (CreateEliteTermPolicyResponse) request.getSession().getAttribute("lifePolicy");
		String pdfPath = request.getRealPath("/").replace("\\", "/")+"/resources/pdf/"+request.getSession().getAttribute(fileName);
		
		final Map<String, String> header = headerUtil.getHeader1(request);
		org.json.simple.JSONObject parameters = new org.json.simple.JSONObject();
		Map<String,Object> clientBrowserInfo = ClientBrowserUtil.getClientInfo(request);
		parameters.put("clientBrowserInfo", clientBrowserInfo);
		parameters.put("planCode", "SAVIE-SP");
		parameters.put("fileType", "pdf");
		parameters.put("documentType", docType);
		parameters.put("originalFilePath", "");
		
		File f = new File(pdfPath);
		FileInputStream is = null;
		is = new FileInputStream(f);
		i = is.available(); // 得到文件大小  
		data = new byte[i];  
		is.read(data); // 读数据  
		is.close();  
		String file64 =new sun.misc.BASE64Encoder().encode(data);
		parameters.put("base64", file64);
		parameters.put("policyNo", lifePolicy.getPolicyNo());
		BaseResponse br = connector.uploadDocuments(parameters, header);
		if(br.getErrMsgs()!=null){
			throw new ECOMMAPIException(br.getErrMsgs()[0]);
		}
	}
	
	public GetPolicyApplicationResponse getPolicyApplicationSaveforLater(HttpServletRequest request) throws ECOMMAPIException{
		final Map<String,String> header = headerUtil.getHeader1(request);
		GetPolicyApplicationResponse apiResponse = connector.getPolicyApplication(header);
		
		if(apiResponse!=null&&apiResponse.hasError()) {
			throw new ECOMMAPIException(apiResponse.getErrMsgs()[0]);
		}
		else if(apiResponse!=null&&apiResponse.getPolicyApplication()!=null){
			PolicyApplication policyApplication = apiResponse.getPolicyApplication();
			
			LifePersonalDetailsBean lifePersonalDetails = (LifePersonalDetailsBean) request.getSession().getAttribute("lifePersonalDetails");
			if(lifePersonalDetails==null){
				lifePersonalDetails = new LifePersonalDetailsBean();
			}
			lifePersonalDetails.setFirstname(policyApplication.getApplicantFirstName()!=null?policyApplication.getApplicantFirstName():"");
			lifePersonalDetails.setLastname(policyApplication.getApplicantLastName()!=null?policyApplication.getApplicantLastName():"");
			lifePersonalDetails.setChineseName(policyApplication.getApplicantChineseName()!=null?policyApplication.getApplicantChineseName():"");
			lifePersonalDetails.setDob(policyApplication.getApplicantDob()!=null?policyApplication.getApplicantDob():"");
			lifePersonalDetails.setGender(policyApplication.getApplicantGender()!=null?policyApplication.getApplicantGender():"");
			lifePersonalDetails.setHkid(policyApplication.getApplicantHkId()!=null?policyApplication.getApplicantHkId():"");
			lifePersonalDetails.setPassport(policyApplication.getApplicantPassport()!=null?policyApplication.getApplicantPassport():"");
			lifePersonalDetails.setMartialStatus(policyApplication.getApplicantMaritalStatus()!=null?policyApplication.getApplicantMaritalStatus():"");
			lifePersonalDetails.setPlaceOfBirth(policyApplication.getApplicantPlaceOfBirth()!=null?policyApplication.getApplicantPlaceOfBirth():"");
			lifePersonalDetails.setNationalty(policyApplication.getApplicantNationality()!=null?policyApplication.getApplicantNationality():"");
			lifePersonalDetails.setResidentialTelNoCountryCode(policyApplication.getApplicantResidentialTelNoCountryCode()!=null?policyApplication.getApplicantResidentialTelNoCountryCode():"");
			lifePersonalDetails.setResidentialTelNo(policyApplication.getApplicantResidentialTelNo()!=null?policyApplication.getApplicantResidentialTelNo():"");
			lifePersonalDetails.setMobileNoCountryCode(policyApplication.getApplicantMobileNoCountryCode()!=null?policyApplication.getApplicantMobileNoCountryCode():"");
			lifePersonalDetails.setMobileNumber(policyApplication.getApplicantMobileNo()!=null?policyApplication.getApplicantMobileNo():"");
			lifePersonalDetails.setEmailAddress(policyApplication.getApplicantEmail()!=null?policyApplication.getApplicantEmail():"");
			lifePersonalDetails.setResidentialAddress1(policyApplication.getResidentialAddress1()!=null?policyApplication.getResidentialAddress1():"");
			lifePersonalDetails.setResidentialAddress2(policyApplication.getResidentialAddress2()!=null?policyApplication.getResidentialAddress2():"");
			lifePersonalDetails.setResidentialAddress3(policyApplication.getResidentialAddress3()!=null?policyApplication.getResidentialAddress3():"");
			lifePersonalDetails.setResidentialAddress4(policyApplication.getResidentialAddress4()!=null?policyApplication.getResidentialAddress4():"");
			lifePersonalDetails.setResidentialAddressDistrict(policyApplication.getResidentialDistrict()!=null?policyApplication.getResidentialDistrict():"");
			lifePersonalDetails.setCorrespondenceAddress1(policyApplication.getCorrespondenceAddress1()!=null?policyApplication.getCorrespondenceAddress1():"");
			lifePersonalDetails.setCorrespondenceAddress2(policyApplication.getCorrespondenceAddress2()!=null?policyApplication.getCorrespondenceAddress2():"");
			lifePersonalDetails.setCorrespondenceAddress3(policyApplication.getCorrespondenceAddress3()!=null?policyApplication.getCorrespondenceAddress3():"");
			lifePersonalDetails.setCorrespondenceAddress4(policyApplication.getCorrespondenceAddress4()!=null?policyApplication.getCorrespondenceAddress4():"");
			lifePersonalDetails.setCorrespondenceAddressDistrict(policyApplication.getCorrespondenceDistrict()!=null?policyApplication.getCorrespondenceDistrict():"");
			lifePersonalDetails.setPermanetAddress1(policyApplication.getPermanentAddress1()!=null?policyApplication.getPermanentAddress1():"");
			lifePersonalDetails.setPermanetAddress2(policyApplication.getPermanentAddress2()!=null?policyApplication.getPermanentAddress2():"");
			lifePersonalDetails.setPermanetAddress3(policyApplication.getPermanentAddress3()!=null?policyApplication.getPermanentAddress3():"");
			lifePersonalDetails.setPermanetAddress4(policyApplication.getPermanentAddress4()!=null?policyApplication.getPermanentAddress4():"");
			lifePersonalDetails.setPermanetAddressDistrict(policyApplication.getPermanentDistrict()!=null?policyApplication.getPermanentDistrict():"");
			request.getSession().setAttribute("lifePersonalDetails", lifePersonalDetails);
			
			LifeEmploymentInfoBean lifeEmploymentInfo = (LifeEmploymentInfoBean) request.getSession().getAttribute("lifeEmploymentInfo");
			if(lifeEmploymentInfo==null){
				lifeEmploymentInfo = new LifeEmploymentInfoBean();
			}
			lifeEmploymentInfo.setEmploymentStatus(policyApplication.getEmploymentStatus()!=null?policyApplication.getEmploymentStatus():"");
			lifeEmploymentInfo.setOccupation(policyApplication.getOccupation()!=null?policyApplication.getOccupation():"");
			lifeEmploymentInfo.setEducation(policyApplication.getEducationLevel()!=null?policyApplication.getEducationLevel():"");
			lifeEmploymentInfo.setNatureOfBusiness(policyApplication.getNatureOfBusiness()!=null?policyApplication.getNatureOfBusiness():"");
			lifeEmploymentInfo.setMonthlyPersonalIncome(policyApplication.getMonthlyPersonalIncome()!=null?policyApplication.getMonthlyPersonalIncome():"");
			lifeEmploymentInfo.setAmountOfLiquidAssets(policyApplication.getLiquidAssest()!=null?policyApplication.getLiquidAssest():"");
			lifeEmploymentInfo.setAmountOfOtherSourceOfIncome(policyApplication.getAmountOtherSource()!=null?policyApplication.getAmountOtherSource():"");
			lifeEmploymentInfo.setEmployerName(policyApplication.getEmployerName()!=null?policyApplication.getEmployerName():"");
			request.getSession().setAttribute("lifeEmploymentInfo", lifeEmploymentInfo);
			
			LifeBeneficaryInfoBean lifeBeneficaryInfo = (LifeBeneficaryInfoBean) request.getSession().getAttribute("lifeBeneficaryInfo");
			if(lifeBeneficaryInfo==null){
				lifeBeneficaryInfo = new LifeBeneficaryInfoBean();
			}
			lifeBeneficaryInfo.setBeneficaryFirstName1(policyApplication.getBeneficiaryFirstName1()!=null?policyApplication.getBeneficiaryFirstName1():"");
			lifeBeneficaryInfo.setBeneficaryLastName1(policyApplication.getBeneficiaryLastName1()!=null?policyApplication.getBeneficiaryLastName1():"");
			lifeBeneficaryInfo.setBeneficaryChineseName1(policyApplication.getBeneficiaryChineseName1()!=null?policyApplication.getBeneficiaryChineseName1():"");
			lifeBeneficaryInfo.setBeneficaryID1(policyApplication.getBeneficiaryHkId1()!=null?policyApplication.getBeneficiaryHkId1():"");
			lifeBeneficaryInfo.setBeneficiaryPassport1(policyApplication.getBeneficiaryPassport1()!=null?policyApplication.getBeneficiaryPassport1():"");
			lifeBeneficaryInfo.setBeneficaryGender1(policyApplication.getBeneficiaryGender1()!=null?policyApplication.getBeneficiaryGender1():"");
			lifeBeneficaryInfo.setBeneficaryRelation1(policyApplication.getBeneficiaryRelationship1()!=null?policyApplication.getBeneficiaryRelationship1():"");
			lifeBeneficaryInfo.setBeneficaryWeight1(policyApplication.getBeneficiaryEntitlement1()!=null?policyApplication.getBeneficiaryEntitlement1():"");
			lifeBeneficaryInfo.setBeneficaryFirstName2(policyApplication.getBeneficiaryFirstName2()!=null?policyApplication.getBeneficiaryFirstName2():"");
			lifeBeneficaryInfo.setBeneficaryLastName2(policyApplication.getBeneficiaryLastName2()!=null?policyApplication.getBeneficiaryLastName2():"");
			lifeBeneficaryInfo.setBeneficaryChineseName2(policyApplication.getBeneficiaryChineseName2()!=null?policyApplication.getBeneficiaryChineseName2():"");
			lifeBeneficaryInfo.setBeneficaryID2(policyApplication.getBeneficiaryHkId2()!=null?policyApplication.getBeneficiaryHkId2():"");
			lifeBeneficaryInfo.setBeneficiaryPassport2(policyApplication.getBeneficiaryPassport2()!=null?policyApplication.getBeneficiaryPassport2():"");
			lifeBeneficaryInfo.setBeneficaryGender2(policyApplication.getBeneficiaryGender2()!=null?policyApplication.getBeneficiaryGender2():"");
			lifeBeneficaryInfo.setBeneficaryRelation2(policyApplication.getBeneficiaryRelationship2()!=null?policyApplication.getBeneficiaryRelationship2():"");
			lifeBeneficaryInfo.setBeneficaryWeight2(policyApplication.getBeneficiaryEntitlement2()!=null?policyApplication.getBeneficiaryEntitlement2():"");
			lifeBeneficaryInfo.setBeneficaryFirstName3(policyApplication.getBeneficiaryFirstName3()!=null?policyApplication.getBeneficiaryFirstName3():"");
			lifeBeneficaryInfo.setBeneficaryLastName3(policyApplication.getBeneficiaryLastName3()!=null?policyApplication.getBeneficiaryLastName3():"");
			lifeBeneficaryInfo.setBeneficaryChineseName3(policyApplication.getBeneficiaryChineseName3()!=null?policyApplication.getBeneficiaryChineseName3():"");
			lifeBeneficaryInfo.setBeneficaryID3(policyApplication.getBeneficiaryHkId3()!=null?policyApplication.getBeneficiaryHkId3():"");
			lifeBeneficaryInfo.setBeneficiaryPassport3(policyApplication.getBeneficiaryPassport3()!=null?policyApplication.getBeneficiaryPassport3():"");
			lifeBeneficaryInfo.setBeneficaryGender3(policyApplication.getBeneficiaryGender3()!=null?policyApplication.getBeneficiaryGender3():"");
			lifeBeneficaryInfo.setBeneficaryRelation3(policyApplication.getBeneficiaryRelationship3()!=null?policyApplication.getBeneficiaryRelationship3():"");
			lifeBeneficaryInfo.setBeneficaryWeight3(policyApplication.getBeneficiaryEntitlement3()!=null?policyApplication.getBeneficiaryEntitlement3():"");
			request.getSession().setAttribute("lifeBeneficaryInfo", lifeBeneficaryInfo);
			
			LifePaymentBean lifePayment = (LifePaymentBean) request.getSession().getAttribute("lifePayment");
			if(lifePayment==null){
				lifePayment = new LifePaymentBean();
			}
			lifePayment.setPaymentMethod(policyApplication.getPaymentMethod()!=null?policyApplication.getPaymentMethod():"");
			lifePayment.setBankCode(policyApplication.getBankName()!=null?policyApplication.getBankName():"");
			lifePayment.setBranchCode(policyApplication.getBranchName()!=null?policyApplication.getBranchName():"");
			lifePayment.setAccountNumber(policyApplication.getAccountNo()!=null?policyApplication.getAccountNo():"");
			request.getSession().setAttribute("lifePayment", lifePayment);
		}
		return apiResponse;
	}
	
	private String formartNumber(String num){
		if(num.contains(".")){
			num = num.split("\\.")[0];
		}
		return num;
	}
	
	public BaseResponse sendImage(HttpServletRequest request,String passportFlage) throws ECOMMAPIException{
		BaseResponse apiReturn = new BaseResponse();
		FileInputStream is = null;
		BaseResponse br = null;
		try {
			CreateEliteTermPolicyResponse lifePolicy = (CreateEliteTermPolicyResponse) request.getSession().getAttribute("lifePolicy");
			String policyNo = lifePolicy.getPolicyNo();
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
			parameters.put("planCode", "SAVIE-SP");
			String fileToUpload = (String) request.getSession().getAttribute("fileToUploadProofAdd");
			if(fileToUpload==null){
				fileToUpload = (String) request.getSession().getAttribute("fileToUpload-addr-dragAndDrop");
			}
			String hkidFileToUpload = (String) request.getSession().getAttribute("hkidFileToUpload");
			if(hkidFileToUpload==null){
				hkidFileToUpload = (String) request.getSession().getAttribute("fileToUpload-hkid-dragAndDrop");
			}
			File hkidFileToUploadImage = new File(uploadDir+hkidFileToUpload);
			File fileToUploadImage = new File(uploadDir+fileToUpload);
			is = new FileInputStream(fileToUploadImage);
			i = is.available(); // 得到文件大小  
			data = new byte[i];  
			is.read(data); // 读数据  
			is.close();  
			String fileToUploadImageBase64 =new sun.misc.BASE64Encoder().encode(data);
			String fileToUploadProofAddType = (String) request.getSession().getAttribute("fileToUploadProofAddType");
			if(fileToUploadProofAddType==null){
				fileToUploadProofAddType = (String) request.getSession().getAttribute("fileToUpload-addr-dragAndDropType");
			}
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
				if(passportFileToUpload==null){
					passportFileToUpload = (String) request.getSession().getAttribute("fileToUpload-passport-dragAndDrop");
				}
				File passportFileToUploadImage = new File(uploadDir+passportFileToUpload);
				is = new FileInputStream(passportFileToUploadImage);
				i = is.available(); // 得到文件大小  
				data = new byte[i];  
				is.read(data); // 读数据  
				is.close();  
				String passportFileToUploadImageBase64 =new sun.misc.BASE64Encoder().encode(data);
				String passportFileToUploadType = (String) request.getSession().getAttribute("passportFileToUploadType");
				if(passportFileToUploadType==null){
					passportFileToUploadType = (String) request.getSession().getAttribute("fileToUpload-passport-dragAndDropType");
				}
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
			if(hkidFileToUploadType==null){
				hkidFileToUploadType = (String) request.getSession().getAttribute("fileToUpload-hkid-dragAndDropType");
			}
			parameters.put("fileType", hkidFileToUploadType);
			parameters.put("documentType", "hkid");
			parameters.put("originalFilePath", policyNo+PolicyNoUtil.getRandomString()+"."+hkidFileToUploadType);
			parameters.put("base64", hkidFileToUploadImageBase64);
			br = connector.uploadDocuments(parameters, header);
			if(br.getErrMsgs()!=null){
				throw new ECOMMAPIException("system error");
			}
	        FileUtil.deletFile(uploadDir);
		}catch(ECOMMAPIException e){
			logger.info("EliteTermServiceImpl sendImage occurs an exception!");
			logger.info(e.getMessage());
			e.printStackTrace();
			apiReturn.setErrMsg(e.getMessage());
			return apiReturn;
		}catch(Exception e){
			logger.info("EliteTermServiceImpl sendImage occurs an exception!");
			logger.info(e.getMessage());
			e.printStackTrace();
			apiReturn.setErrMsg("system error");
			return apiReturn;
		}finally{
			try {
				is.close();
			} catch (IOException e) {
				e.printStackTrace();
			}  
		}
		return apiReturn;
	}
	
	public BaseResponse uploadSignature(HttpServletRequest request,String image)throws ECOMMAPIException{		
		BaseResponse br = null;
		try {
			CreateEliteTermPolicyResponse lifePolicy = (CreateEliteTermPolicyResponse) request.getSession().getAttribute("lifePolicy");
			String documentPath = UserRestURIConstants.getConfigs("documentPath");
			String uploadDir = documentPath + "/"+new sun.misc.BASE64Encoder().encode(lifePolicy.getPolicyNo().getBytes()); 
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

	        //FileUtil.deletFile(uploadDir);
	        
			final Map<String,String> header = headerUtil.getHeader1(request);
			Map<String,Object> clientBrowserInfo = ClientBrowserUtil.getClientInfo(request);
			net.sf.json.JSONObject parameters = new net.sf.json.JSONObject();
			parameters.put("clientBrowserInfo", clientBrowserInfo);
			parameters.put("planCode", "SAVIE-SP");
			parameters.put("fileType", "jpg");
			parameters.put("documentType", "signature");
			parameters.put("originalFilePath", "");
			parameters.put("base64", image);
			parameters.put("policyNo", lifePolicy.getPolicyNo());
			br = connector.uploadSignature(parameters, header);
		} catch (ECOMMAPIException e) {
			logger.info("EliteTermServiceImpl uploadSignature occurs an exception!");
			logger.info(e.getMessage());
			e.printStackTrace();
		} catch (Exception e) {
			logger.info("EliteTermServiceImpl uploadSignature occurs an exception!");
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		return br;
	}
	
	public void removeSavieOnlineSession(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.removeAttribute("saviePlanDetails");
		session.removeAttribute("planDetailData");
		session.removeAttribute("savieFna");
		session.removeAttribute("productRecommendation");
		session.removeAttribute("lifePersonalDetails");
		session.removeAttribute("lifeEmploymentInfo");
		session.removeAttribute("lifeBeneficaryInfo");
		session.removeAttribute("lifePayment");
		session.removeAttribute("lifeDeclaration");
		session.removeAttribute("lifePolicy");
		logger.info("remove savie online session");
	}
/**
	 * 通过ajax获取时间段
	 */
	@Override
	public void getTimeSlot(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		org.json.simple.JSONObject responseJsonObj = new org.json.simple.JSONObject();
		//if(org.apache.commons.lang.StringUtils.isNotBlank((String)session.getAttribute("savingAmount")) && org.apache.commons.lang.StringUtils.isNotBlank((String)session.getAttribute("username")) && org.apache.commons.lang.StringUtils.isNotBlank((String)session.getAttribute("accessCode"))) {
		if(StringUtils.isNotBlank((String)session.getAttribute("username"))) {
			String csCenter = request.getParameter("csCenter");
			String perferredDate = request.getParameter("perferredDate");
			request.getSession().setAttribute("csCenter", csCenter);
			request.getSession().setAttribute("perferredDate", perferredDate);
			String Url = UserRestURIConstants.SERVICE_URL + "/appointment/timeSlot?date=" + perferredDate + "&serviceCentreCode=" + csCenter;
			String lang = UserRestURIConstants.getLanaguage(request);
			if (lang.equals("tc")) {
				lang = "CN";
			}
			
			HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
			header.put("userName", "*DIRECTGI");
			header.put("token", commonUtils.getToken("reload"));
			header.put("language", WebServiceUtils.transformLanaguage(lang));
			
			responseJsonObj = restService.consumeApi(HttpMethod.GET,Url, header, null);
			if(responseJsonObj.get("timeSlots") == null || responseJsonObj.get("timeSlots") == ""){
				logger.info(responseJsonObj.toString());
			}
		}
		else{
			responseJsonObj.put("sessionError", "sessionError");
		}
		response.setContentType("text/json;charset=utf-8");
		try {
			logger.info(responseJsonObj.toString());
			response.getWriter().print(responseJsonObj.toString());
		}catch(Exception e) {  
			e.printStackTrace();
		}
	}
	
	/**
	 * 服务中心提交
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void upsertAppointment(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/json;charset=utf-8");
		HttpSession session = request.getSession();
		String csCenter = request.getParameter("csCenter");
		String perferredDate = request.getParameter("perferredDate");
		String perferredTime = request.getParameter("perferredTime");
		String planCode = "SAVIE-SP";
		String policyNumber = "";
		String applicationNumber = "";
		String userName = (String)session.getAttribute("username");
		String status = "Active";
		String remarks = "";
		String accessCode = (String)request.getSession().getAttribute("accessCode");
		String servicingAgent = "";
		
		String applicationUrl = UserRestURIConstants.SERVICE_URL + "/savie/application";
		String makeUrl = UserRestURIConstants.SERVICE_URL + "/appointment/make";
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc")) {
			lang = "CN";
		}
		
		
		HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
		header.put("userName", "*DIRECTGI");
		header.put("token", commonUtils.getToken("reload"));
		header.put("language", WebServiceUtils.transformLanaguage(lang));
		
		org.json.simple.JSONObject parameters = new org.json.simple.JSONObject();
		parameters.put("planCode", planCode);
		parameters.put("accessCode", accessCode);
		org.json.simple.JSONObject appJsonObj = restService.consumeApi(HttpMethod.PUT, applicationUrl, header, parameters);
		applicationNumber = (String)appJsonObj.get("applicationNumber");
		session.setAttribute("applicationNumber", applicationNumber);
		
		if(appJsonObj != null) {
			parameters = new org.json.simple.JSONObject();
			parameters.put("serviceCentreCode", csCenter);
			parameters.put("date", perferredDate);
			parameters.put("timeSlot", perferredTime);
			parameters.put("planCode", planCode);
			parameters.put("policyNumber", policyNumber);
			parameters.put("applicationNumber", applicationNumber);
			parameters.put("userName", userName);
			parameters.put("status", status);
			parameters.put("remarks", remarks);
			parameters.put("accessCode", accessCode);
			parameters.put("servicingAgent", servicingAgent);
			
			org.json.simple.JSONObject makeJsonObj = restService.consumeApi(HttpMethod.POST, makeUrl, header, parameters);
			
			response.setContentType("text/json;charset=utf-8");
			try {
				logger.info(makeJsonObj.toString());
				response.getWriter().print(makeJsonObj.toString());
			}catch(Exception e) {  
				e.printStackTrace();
				response.getWriter().print("application error!");
			}
		}else {
			response.getWriter().print("application error!");
		}
	}
	
	/**
	 * 获取accessCode
	 * @param request
	 * @return
	 */
	public org.json.simple.JSONObject getAccessCode(HttpServletRequest request) {
		String Url = UserRestURIConstants.SERVICE_URL + "/appointment/accessCode";
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc")) {
			lang = "CN";
		}
		final Map<String,String> header = headerUtil.getHeader(request);
		org.json.simple.JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,Url, header, null);
		if(responseJsonObj.get("errMsgs")==null){
			request.getSession().setAttribute("accessCode", responseJsonObj.get("accessCode"));
		}
		return responseJsonObj;
	}
	
	/**
	 * 获取服务中心页面的数据
	 * @param model request session
	 * @return
	 */
	public void getCustomerServiceCentre(Model model, HttpServletRequest request, HttpSession session) {
		String lang = UserRestURIConstants.getLanaguage(request);
		String Url = UserRestURIConstants.SERVICE_URL + "/appointment/timeSlot/all";
		if (lang.equals("tc")) {
			lang = "CN";
		}
		Map<String,String> header = new HashMap<String, String>(COMMON_HEADERS);
		if(session.getAttribute("authenticate") !=null && session.getAttribute("authenticate").equals("true")){
			HeaderUtil hu = new HeaderUtil();
			header = hu.getHeader(request);
		}
		else{
			header.put("userName", "*DIRECTGI");
			header.put("token", commonUtils.getToken("reload"));
		}
		header.put("language", WebServiceUtils.transformLanaguage(lang));
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,Url, header, null);
		JSONArray serviceCentresArr = (JSONArray) responseJsonObj.get("serviceCentres");
		JSONObject serviceCentreObj = new JSONObject();
		ServiceCentreResponse serviceCentreResponse;
		if (lang.equals("CN")) {
			serviceCentreResponse = InitApplicationMessage.serviceCentreCN;
		}else {
			serviceCentreResponse =InitApplicationMessage.serviceCentreEN;
		}
		List<ServiceCentreResult> serviceCentreResultList = serviceCentreResponse.getServiceCentres();
		
		Map<String, ServiceCentreResult> entityMap = new HashMap<String, ServiceCentreResult>();
		Map<String, List<String>> datesMap = new HashMap<String, List<String>>();
		JSONArray datesArray;
		JSONObject datesObj;
		List<String> datesList;
		List<String> calendarList;
		long beforeDay = 86400000;
		
		if(serviceCentresArr!=null && serviceCentresArr.size()>0){
			serviceCentreObj = (JSONObject) serviceCentresArr.get(0);
			calendarList = DateApi.timeslot(2, 24);
			
			datesList = new ArrayList<String>();
			for(ServiceCentreResult entity :serviceCentreResultList) {
				if(entity.getServiceCentreCode().equals(serviceCentreObj.get("serviceCentreCode"))) {
					entityMap.put(entity.getServiceCentreCode(), entity);
					
					datesArray = (JSONArray) serviceCentreObj.get("dates");
					for(int j = 0; j< datesArray.size(); j++) {
						datesObj = (JSONObject)datesArray.get(j);
						datesList.add(DateApi.formatTime((long)datesObj.get("date") - beforeDay));
					}
					calendarList.removeAll(datesList);
					datesMap.put(entity.getServiceCentreCode(), calendarList);
					break;
				}
			}
		}
		
		if(serviceCentresArr!=null && serviceCentresArr.size()>1){
			for(int i=1;i<serviceCentresArr.size();i++){
				JSONArray datesArr = (JSONArray) serviceCentreObj.get("dates");
				JSONObject dateObj = (JSONObject) datesArr.get(0);
				long date = (long) dateObj.get("date");
				
				JSONObject serviceCentreObjB = (JSONObject) serviceCentresArr.get(i);
				JSONArray datesArrB = (JSONArray) serviceCentreObjB.get("dates");
				JSONObject dateObjB = (JSONObject) datesArrB.get(0);
				long dateB = (long) dateObjB.get("date");
				if(date>dateB){
					serviceCentreObj = serviceCentreObjB;
				}
				
				calendarList = DateApi.timeslot(2, 24);
				datesList = new ArrayList<String>();
				for(ServiceCentreResult entity : serviceCentreResultList) {
					if(entity.getServiceCentreCode().equals(serviceCentreObjB.get("serviceCentreCode"))) {
						entityMap.put(entity.getServiceCentreCode(), entity);
						
						datesArray = (JSONArray) serviceCentreObjB.get("dates");
						for(int j = 0; j< datesArray.size(); j++) {
							datesObj = (JSONObject)datesArray.get(j);
							datesList.add(DateApi.formatTime((Long)datesObj.get("date") - beforeDay));
						}
						calendarList.removeAll(datesList);
						datesMap.put(entity.getServiceCentreCode(), calendarList);
						break;
					}
				}
			}
		}
		List<ServiceCentreResult> results = new ArrayList<ServiceCentreResult>();
		for(ServiceCentreResult result : entityMap.values()) {
			results.add(result);
		}
		logger.info("entityMap: " + entityMap);
		logger.info("datesMap: " + datesMap);
		serviceCentreResponse.setServiceCentres(results);
		model.addAttribute("serviceCentre", serviceCentreResponse);
		model.addAttribute("datesMap", datesMap);
		model.addAttribute("results", results);
		if(serviceCentreObj != null){
			session.setAttribute("csCenter", serviceCentreObj.get("serviceCentreCode"));
			JSONArray datesArr = (JSONArray) serviceCentreObj.get("dates");
			if(datesArr != null) {
				org.json.simple.JSONObject dateObj = (JSONObject) datesArr.get(0);
				Date date= new Date(Long.parseLong(dateObj.get("date").toString()));  
				SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy"); 
				logger.info(formatter.format(date));
				session.setAttribute("perferredDate", formatter.format(date));
			}
		}
	}
	
	/**
	 * 服务中心确认页面并发送邮件
	 * @param model request session
	 * @return
	 */
	public void CustomerServiceCentreConfirmation(String action, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String centre = request.getParameter("centre");
		String preferredDate = request.getParameter("preferred-date");
		String preferredTime = request.getParameter("preferred-time");
		Map<String, String> confirmation = new HashMap<String, String>();
		if(StringUtils.isBlank(centre)) {
			confirmation = (Map<String, String>)session.getAttribute("confirmationLater");
			centre = confirmation.get("centre");
			preferredDate = confirmation.get("preferredDate");
			preferredTime = confirmation.get("preferredTime");
		}else {
			confirmation.put("centre", centre);
			confirmation.put("preferredDate", preferredDate);
			confirmation.put("preferredTime", preferredTime);
			session.setAttribute("confirmationLater", confirmation);
		}
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc")) {
			lang = "CN";
		}
		
		String centerEn = "";
		String centerCh = "";
		String centerAddEn = "";
		String centerAddCh = "";
		ServiceCentreResult entityEn = null;
		ServiceCentreResult entityCh = null;
		for(ServiceCentreResult entity :InitApplicationMessage.serviceCentreEN.getServiceCentres()) {
			if(entity.getServiceCentreCode().equals(centre)) {
				centerEn = entity.getServiceCentreName();
				centerAddEn = entity.getAddress();
				entityEn = entity;
				break;
			}
		}
		for(ServiceCentreResult entity :InitApplicationMessage.serviceCentreCN.getServiceCentres()) {
			if(entity.getServiceCentreCode().equals(centre)) {
				centerCh = entity.getServiceCentreName();
				centerAddCh = entity.getAddress();
				entityCh = entity;
				break;
			}
		}
		
		JSONObject models = new JSONObject();
		models.put("name", session.getAttribute("username"));
		models.put("accessCode", session.getAttribute("accessCode"));
		models.put("dateEn", preferredDate);
		models.put("timeSlotEn", preferredTime);
		models.put("centerEn", centerEn);
		models.put("centerAddEn", centerAddEn);
		
		models.put("dateCh", preferredDate);
		models.put("timeSlotCh", preferredTime);
		models.put("centerCh", centerCh);
		models.put("centerAddCh", centerAddCh);
		sendEmails(request, action, models);
		
		if (lang.equals("CN")) {
			model.addAttribute("serviceCentre", entityCh);
		}else {
			model.addAttribute("serviceCentre", entityEn);
		}
		model.addAttribute("preferredDate", preferredDate);
		model.addAttribute("preferredTime", preferredTime);
	}
	
	public JSONObject validateSession(HttpServletRequest request) throws ECOMMAPIException{
		String Url = UserRestURIConstants.VALIDATE_SESSION;
		final Map<String,String> header = headerUtil.getHeader(request);
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.POST,Url, header, new JSONObject());
		return responseJsonObj;
	}
	
	public void clearFna(HttpServletRequest request) throws ECOMMAPIException{
		JSONObject parameters = new JSONObject();
		logger.info(parameters.toString());
		
		BaseResponse apiReturn = null;
		final Map<String,String> header = headerUtil.getHeader1(request);
		apiReturn = connector.clearFna(parameters, header);
		if(apiReturn==null){
			logger.info("api error");
			throw new ECOMMAPIException("api error");
		}
		else if(apiReturn.hasError()) {
			logger.info(apiReturn.getErrMsgs()[0]);
			throw new ECOMMAPIException(apiReturn.getErrMsgs()[0]);
		}
	}
	
	public void sendEmailForSaveLater(HttpServletRequest request) throws ECOMMAPIException{
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		String language = (String) request.getSession().getAttribute("language");
		
		JSONObject parameters = new JSONObject();
		parameters.put("to", userDetails.getEmailAddress());
		parameters.put("subject", "Your Savie application is incomplete | 您的Savie自助息申請尚未完成");
		JSONObject model = new JSONObject();
		   model.put("name", userDetails.getFullName());
		   model.put("resumeLink", language+"/savings-insurance/"+request.getParameter("key"));
		parameters.put("model", model);
		parameters.put("template", "savie\\saveLater.html");
		logger.info(parameters.toString());
		
		BaseResponse apiReturn = null;
		final Map<String,String> header = headerUtil.getHeader1(request);
		apiReturn = connector.sendTemplateEmail(parameters, header);
		if(apiReturn==null){
			logger.info("api error");
			throw new ECOMMAPIException("api error");
		}
		else if(apiReturn.hasError()) {
			logger.info(apiReturn.getErrMsgs()[0]);
			throw new ECOMMAPIException(apiReturn.getErrMsgs()[0]);
		}
	}
	
	public JSONObject sendEmails(HttpServletRequest request, String action, JSONObject model) {
		HttpSession session = request.getSession();
		String Url = UserRestURIConstants.SEND_EMAILS;
		String email = (String)session.getAttribute("emailAddress");
		String template = "";
		String subject = ""; 
		if("paylater".equals(action)) {
			subject = "Savie Appointment Acknowledgement from FWD | 自助息理財預約申請確認";
			template = "savie\\payLater.html";
		}else if("uploadDocument".equals(action)) {
			subject = "FWD Savie Insurance Plan – Document Upload | 富衛Savie自助息 – 上載檔案";
			template = "savie\\uploadDocument.html";
		}else if("savieComplete".equals(action)) {
			subject = "FWD Savie Insurance Plan - Complete | 您的網上富衛自助息申請已完成！";
			template = "savie\\savieComplete.html";
		}else if("signLater".equals(action)) {
			subject = "FWD Savie Insurance Plan Appointment Acknowledgement | 自助息理財預約申請確認";
			template = "savie\\signLater.html";
		}else if("offlineApplication".equals(action)) {
			subject = "Savie Appointment Acknowledgement from FWD | 自助息理財預約申請確認";
			template = "savie\\offlineApplication.html";
		}else if("saveLater".equals(action)) {
			subject = "Your Savie application is incomplete | 您的Savie自助息申請尚未完成";
			template = "savie\\saveLater.html";
		}
		
		JSONObject parameters = new JSONObject();
		parameters.put("to", email);
		parameters.put("subject", subject);
		parameters.put("model", model);
		parameters.put("template", template);
		
		//final Map<String,String> header = headerUtil.getHeader(request);
		HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc")){
			lang = "CH";
		}
		else{
			lang = "EN";
		}
		header.put("userName", "*DIRECTGI");
		header.put("token", commonUtils.getToken("reload"));
		header.put("language", WebServiceUtils.transformLanaguage(lang));
		logger.info("sendEmails : " + parameters.toString());
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.POST, Url, header, parameters);
		return responseJsonObj;
	}
}
