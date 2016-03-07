package com.ifwd.fwdhk.services.impl;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.io.File;
import java.io.FileInputStream;
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
		
		int issueAge = DateApi.getAge(DateApi.formatDate1(saviePlanDetails.getDob())) + 1;
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
	
	public void createSalesIllustrationPdf(HttpServletRequest request) throws Exception {
		SaviePlanDetailsResponse planDetailData = (SaviePlanDetailsResponse) request.getSession().getAttribute("planDetailData");
		if(planDetailData != null && !planDetailData.hasError()){
			String totalPremium = NumberFormatUtils.formatNumber(planDetailData.getPlanDetails0Rate().get(0).getTotalPremium());
			int totalYear = 100-Integer.valueOf(planDetailData.getIssueAge());
			List<PdfAttribute> attributeList = new ArrayList<PdfAttribute>();
			SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
			attributeList.add(new PdfAttribute("dateTime",format.format(new Date())));
			attributeList.add(new PdfAttribute("applicationNo", "自助息理財壽險計劃"));
			attributeList.add(new PdfAttribute("paymentMethod", "payonline"));
			attributeList.add(new PdfAttribute("chineseName", "张三"));
			attributeList.add(new PdfAttribute("Premium",totalPremium));
			attributeList.add(new PdfAttribute("age", planDetailData.getIssueAge()));
			attributeList.add(new PdfAttribute("singlePremiumAmount", totalPremium));
			attributeList.add(new PdfAttribute("gender", "MALE"));
			attributeList.add(new PdfAttribute("paymentType","paymentType"));
			attributeList.add(new PdfAttribute("versonNum","1.0"));
			//attributeList.add(new PdfAttribute("totalYear",NumberTransferUtils.transferNum(totalYear)));
			logger.info(planDetailData.getPlanDetails0Rate().size()+"");
			NumberFormat nt = NumberFormat.getPercentInstance();
			nt.setMinimumFractionDigits(0);
			for(int i=0;i<planDetailData.getPlanDetails0Rate().size();i++){
				int policyYear = Integer.valueOf(planDetailData.getPlanDetails0Rate().get(i).getPolicyYear())+1;
				int age = Integer.valueOf(planDetailData.getPlanDetails0Rate().get(i).getAge());
				int issueAge = Integer.valueOf(planDetailData.getIssueAge());
				if(policyYear<4){
					attributeList.add(new PdfAttribute("endYear"+policyYear,policyYear+""));
					attributeList.add(new PdfAttribute("totalPremium"+policyYear,totalPremium));
					attributeList.add(new PdfAttribute("interestedRate"+policyYear,nt.format(Float.valueOf(planDetailData.getPlanDetails0Rate().get(i).getInterestedRate()))));
					attributeList.add(new PdfAttribute("accountEOP"+policyYear,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails0Rate().get(i).getAccountEOP())));
					attributeList.add(new PdfAttribute("guranteedSurrenderBenefit"+policyYear,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails0Rate().get(i).getGuranteedSurrenderBenefit()))); 
				    attributeList.add(new PdfAttribute("guranteedDeathBenefit"+policyYear,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails0Rate().get(i).getGuranteedDeathBenefit()))); 
				}
				else if(policyYear==4){
					attributeList.add(new PdfAttribute("endYear"+4,"4"));
					attributeList.add(new PdfAttribute("totalPremium"+4,totalPremium));
					attributeList.add(new PdfAttribute("guranteedSurrenderBenefit1_4",NumberFormatUtils.formatNumber(planDetailData.getPlanDetails0Rate().get(i).getGuranteedSurrenderBenefit()))); 
					attributeList.add(new PdfAttribute("guranteedDeathBenefit1_4",NumberFormatUtils.formatNumber(planDetailData.getPlanDetails0Rate().get(i).getGuranteedDeathBenefit())));
					attributeList.add(new PdfAttribute("guranteedSurrenderBenefit2_4",NumberFormatUtils.formatNumber(planDetailData.getPlanDetails2Rate().get(i).getGuranteedSurrenderBenefit()))); 
					attributeList.add(new PdfAttribute("guranteedDeathBenefit2_4",NumberFormatUtils.formatNumber(planDetailData.getPlanDetails2Rate().get(i).getGuranteedDeathBenefit()))); 
					attributeList.add(new PdfAttribute("guranteedSurrenderBenefit3_4",NumberFormatUtils.formatNumber(planDetailData.getPlanDetails3Rate().get(i).getGuranteedSurrenderBenefit()))); 
					attributeList.add(new PdfAttribute("guranteedDeathBenefit3_4",NumberFormatUtils.formatNumber(planDetailData.getPlanDetails3Rate().get(i).getGuranteedDeathBenefit()))); 
					attributeList.add(new PdfAttribute("guranteedSurrenderBenefit4_4",NumberFormatUtils.formatNumber(planDetailData.getPlanDetails4Rate().get(i).getGuranteedSurrenderBenefit()))); 
					attributeList.add(new PdfAttribute("guranteedDeathBenefit4_4",NumberFormatUtils.formatNumber(planDetailData.getPlanDetails4Rate().get(i).getGuranteedDeathBenefit()))); 
				}
				else if(policyYear%5==0 && policyYear/5<7){
					attributeList.add(new PdfAttribute("endYear"+(4+policyYear/5),policyYear+""));
					attributeList.add(new PdfAttribute("totalPremium"+(4+policyYear/5),totalPremium));
					attributeList.add(new PdfAttribute("guranteedSurrenderBenefit1_"+(4+policyYear/5),NumberFormatUtils.formatNumber(planDetailData.getPlanDetails0Rate().get(i).getGuranteedSurrenderBenefit()))); 
					attributeList.add(new PdfAttribute("guranteedDeathBenefit1_"+(4+policyYear/5),NumberFormatUtils.formatNumber(planDetailData.getPlanDetails0Rate().get(i).getGuranteedDeathBenefit())));
					attributeList.add(new PdfAttribute("guranteedSurrenderBenefit2_"+(4+policyYear/5),NumberFormatUtils.formatNumber(planDetailData.getPlanDetails2Rate().get(i).getGuranteedSurrenderBenefit()))); 
					attributeList.add(new PdfAttribute("guranteedDeathBenefit2_"+(4+policyYear/5),NumberFormatUtils.formatNumber(planDetailData.getPlanDetails2Rate().get(i).getGuranteedDeathBenefit()))); 
					attributeList.add(new PdfAttribute("guranteedSurrenderBenefit3_"+(4+policyYear/5),NumberFormatUtils.formatNumber(planDetailData.getPlanDetails3Rate().get(i).getGuranteedSurrenderBenefit()))); 
					attributeList.add(new PdfAttribute("guranteedDeathBenefit3_"+(4+policyYear/5),NumberFormatUtils.formatNumber(planDetailData.getPlanDetails3Rate().get(i).getGuranteedDeathBenefit()))); 
					attributeList.add(new PdfAttribute("guranteedSurrenderBenefit4_"+(4+policyYear/5),NumberFormatUtils.formatNumber(planDetailData.getPlanDetails4Rate().get(i).getGuranteedSurrenderBenefit()))); 
					attributeList.add(new PdfAttribute("guranteedDeathBenefit4_"+(4+policyYear/5),NumberFormatUtils.formatNumber(planDetailData.getPlanDetails4Rate().get(i).getGuranteedDeathBenefit()))); 
				}
				else if(issueAge>66){
					if(age==100){
						attributeList.add(new PdfAttribute("endYear"+11,"岁数"+100));
						attributeList.add(new PdfAttribute("totalPremium"+11,totalPremium));
						attributeList.add(new PdfAttribute("guranteedSurrenderBenefit1_"+11,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails0Rate().get(i).getGuranteedSurrenderBenefit()))); 
						attributeList.add(new PdfAttribute("guranteedDeathBenefit1_"+11,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails0Rate().get(i).getGuranteedDeathBenefit())));
						attributeList.add(new PdfAttribute("guranteedSurrenderBenefit2_"+11,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails2Rate().get(i).getGuranteedSurrenderBenefit()))); 
						attributeList.add(new PdfAttribute("guranteedDeathBenefit2_"+11,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails2Rate().get(i).getGuranteedDeathBenefit()))); 
						attributeList.add(new PdfAttribute("guranteedSurrenderBenefit3_"+11,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails3Rate().get(i).getGuranteedSurrenderBenefit()))); 
						attributeList.add(new PdfAttribute("guranteedDeathBenefit3_"+11,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails3Rate().get(i).getGuranteedDeathBenefit()))); 
						attributeList.add(new PdfAttribute("guranteedSurrenderBenefit4_"+11,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails4Rate().get(i).getGuranteedSurrenderBenefit()))); 
						attributeList.add(new PdfAttribute("guranteedDeathBenefit4_"+11,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails4Rate().get(i).getGuranteedDeathBenefit()))); 
					}
					attributeList.add(new PdfAttribute("endYear"+12,"-"));
					attributeList.add(new PdfAttribute("totalPremium"+12,"-"));
					attributeList.add(new PdfAttribute("guranteedSurrenderBenefit1_"+12,"-")); 
					attributeList.add(new PdfAttribute("guranteedDeathBenefit1_"+12,"-"));
					attributeList.add(new PdfAttribute("guranteedSurrenderBenefit2_"+12,"-")); 
					attributeList.add(new PdfAttribute("guranteedDeathBenefit2_"+12,"-")); 
					attributeList.add(new PdfAttribute("guranteedSurrenderBenefit3_"+12,"-")); 
					attributeList.add(new PdfAttribute("guranteedDeathBenefit3_"+12,"-")); 
					attributeList.add(new PdfAttribute("guranteedSurrenderBenefit4_"+12,"-")); 
					attributeList.add(new PdfAttribute("guranteedDeathBenefit4_"+12,"-")); 
				}
				else if(issueAge<67){
					if(age==66){
						attributeList.add(new PdfAttribute("endYear"+11,"歲數"+66));
						attributeList.add(new PdfAttribute("totalPremium"+11,totalPremium));
						attributeList.add(new PdfAttribute("guranteedSurrenderBenefit1_"+11,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails0Rate().get(i).getGuranteedSurrenderBenefit()))); 
						attributeList.add(new PdfAttribute("guranteedDeathBenefit1_"+11,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails0Rate().get(i).getGuranteedDeathBenefit())));
						attributeList.add(new PdfAttribute("guranteedSurrenderBenefit2_"+11,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails2Rate().get(i).getGuranteedSurrenderBenefit()))); 
						attributeList.add(new PdfAttribute("guranteedDeathBenefit2_"+11,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails2Rate().get(i).getGuranteedDeathBenefit()))); 
						attributeList.add(new PdfAttribute("guranteedSurrenderBenefit3_"+11,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails3Rate().get(i).getGuranteedSurrenderBenefit()))); 
						attributeList.add(new PdfAttribute("guranteedDeathBenefit3_"+11,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails3Rate().get(i).getGuranteedDeathBenefit()))); 
						attributeList.add(new PdfAttribute("guranteedSurrenderBenefit4_"+11,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails4Rate().get(i).getGuranteedSurrenderBenefit()))); 
						attributeList.add(new PdfAttribute("guranteedDeathBenefit4_"+11,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails4Rate().get(i).getGuranteedDeathBenefit()))); 
					}
					else if(age==100){
						attributeList.add(new PdfAttribute("endYear"+12,"歲數"+100));
						attributeList.add(new PdfAttribute("totalPremium"+12,totalPremium));
						attributeList.add(new PdfAttribute("guranteedSurrenderBenefit1_"+12,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails0Rate().get(i).getGuranteedSurrenderBenefit()))); 
						attributeList.add(new PdfAttribute("guranteedDeathBenefit1_"+12,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails0Rate().get(i).getGuranteedDeathBenefit())));
						attributeList.add(new PdfAttribute("guranteedSurrenderBenefit2_"+12,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails2Rate().get(i).getGuranteedSurrenderBenefit()))); 
						attributeList.add(new PdfAttribute("guranteedDeathBenefit2_"+12,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails2Rate().get(i).getGuranteedDeathBenefit()))); 
						attributeList.add(new PdfAttribute("guranteedSurrenderBenefit3_"+12,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails3Rate().get(i).getGuranteedSurrenderBenefit()))); 
						attributeList.add(new PdfAttribute("guranteedDeathBenefit3_"+12,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails3Rate().get(i).getGuranteedDeathBenefit()))); 
						attributeList.add(new PdfAttribute("guranteedSurrenderBenefit4_"+12,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails4Rate().get(i).getGuranteedSurrenderBenefit()))); 
						attributeList.add(new PdfAttribute("guranteedDeathBenefit4_"+12,NumberFormatUtils.formatNumber(planDetailData.getPlanDetails4Rate().get(i).getGuranteedDeathBenefit()))); 
					}
				}
			}
			
			String pdfTemplatePath = request.getRealPath("/").replace("\\", "/")+"resources/pdf/"+"SavieProposalTemplateEngA.pdf";
			String pdfGeneratePath = request.getRealPath("/").replace("\\", "\\\\")+"resources\\\\pdf\\\\";
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
	
	public void createApplicationFormPdf(String type,HttpServletRequest request,HttpSession session) throws Exception {
		LifePersonalDetailsBean lifePersonalDetails = (LifePersonalDetailsBean) session.getAttribute("lifePersonalDetails");
		LifeEmploymentInfoBean lifeEmploymentInfo = (LifeEmploymentInfoBean) session.getAttribute("lifeEmploymentInfo");
		LifeBeneficaryInfoBean lifeBeneficaryInfo = (LifeBeneficaryInfoBean) session.getAttribute("lifeBeneficaryInfo");
		LifePaymentBean lifePayment = (LifePaymentBean) session.getAttribute("lifePayment");
		
	    List<PdfAttribute> attributeList = new ArrayList<PdfAttribute>();
	    
	    attributeList.add(new PdfAttribute("applicationNo", "applicationNo"));
	    attributeList.add(new PdfAttribute("applicationEnglishName", lifePersonalDetails.getFirstname()+" "+lifePersonalDetails.getLastname()));
	    attributeList.add(new PdfAttribute("applicationChineseName", lifePersonalDetails.getChineseName()));
	    attributeList.add(new PdfAttribute("applicationHKID", lifePersonalDetails.getHkid()));
	    attributeList.add(new PdfAttribute("applicationSex", lifePersonalDetails.getGender()));
	    attributeList.add(new PdfAttribute("applicationDB", lifePersonalDetails.getDob()));
	    attributeList.add(new PdfAttribute("applicationMaritalStatus", lifePersonalDetails.getMartialStatus()));
	    attributeList.add(new PdfAttribute("applicationBirthPlace", lifePersonalDetails.getPlaceOfBirth()));
	    attributeList.add(new PdfAttribute("applicationNationality", lifePersonalDetails.getNationalty()));
	    attributeList.add(new PdfAttribute("applicationResidentialPhone", lifePersonalDetails.getMobileNumber()));
	    attributeList.add(new PdfAttribute("applicationMobile", lifePersonalDetails.getMobileNumber()));
	    attributeList.add(new PdfAttribute("applicationEmail", lifePersonalDetails.getEmailAddress()));
	    attributeList.add(new PdfAttribute("applicationResAddress", lifePersonalDetails.getResidentialAddress1()+","+lifePersonalDetails.getResidentialAddress2()+","+lifePersonalDetails.getResidentialAddress3()));
	    attributeList.add(new PdfAttribute("applicationResDistrict", lifePersonalDetails.getResidentialAddressDistrict()));
	    attributeList.add(new PdfAttribute("applicationPerAddress", lifePersonalDetails.getPermanetAddress1()+","+lifePersonalDetails.getCorrespondenceAddress2()+","+lifePersonalDetails.getCorrespondenceAddress3()));
	    attributeList.add(new PdfAttribute("applicationPerDistrict", lifePersonalDetails.getPermanetAddressDistrict()));
	    attributeList.add(new PdfAttribute("applicationCorrAddress", lifePersonalDetails.getCorrespondenceAddress1()+","+lifePersonalDetails.getCorrespondenceAddress2()+","+lifePersonalDetails.getCorrespondenceAddress3()));
	    attributeList.add(new PdfAttribute("applicationCorrDistrict", lifePersonalDetails.getCorrespondenceAddressDistrict()));
	    
	    attributeList.add(new PdfAttribute("educationLevel", lifeEmploymentInfo.getEducation()));
	    attributeList.add(new PdfAttribute("applicationEmploymentStatusKey", "applicationEmploymentStatusKey"));
	    attributeList.add(new PdfAttribute("applicationEmploymentStatus", lifeEmploymentInfo.getEmploymentStatus()));
	    attributeList.add(new PdfAttribute("currentEmployNameKey/otherIncomKey", "currentEmployNameKey/otherIncomKey"));
	    attributeList.add(new PdfAttribute("currentEmployName/otherIncome", lifeEmploymentInfo.getAmountOfOtherSourceOfIncome()));
	    attributeList.add(new PdfAttribute("natureOfBusinessKey/liquidAssetKey", "natureOfBusinessKey/liquidAssetKey"));
	    attributeList.add(new PdfAttribute("natureOfBusiness/liquidAsset", lifeEmploymentInfo.getNatureOfBusiness()));
	    attributeList.add(new PdfAttribute("occupationKey", "occupationKey"));
	    attributeList.add(new PdfAttribute("occupation", lifeEmploymentInfo.getOccupation()));
	    attributeList.add(new PdfAttribute("personalIncomeKey", "personalIncomeKey"));
	    attributeList.add(new PdfAttribute("personalIncome", lifeEmploymentInfo.getMonthlyPersonalIncome()));
	    
	    attributeList.add(new PdfAttribute("sumInsured", "sumInsured"));
	    attributeList.add(new PdfAttribute("firstYearPremium", "firstYearPremium"));
	    attributeList.add(new PdfAttribute("perMonOnethHKD", "perMonOnethHKD"));
	    attributeList.add(new PdfAttribute("subsequantPremium", "subsequantPremium"));
	    attributeList.add(new PdfAttribute("perMonthTwoHKD", "perMonthTwoHKD"));
	    
	    attributeList.add(new PdfAttribute("beneficiaryEnglishName1", lifeBeneficaryInfo.getBeneficaryFirstName1()+" "+lifeBeneficaryInfo.getBeneficaryLastName1()));
	    attributeList.add(new PdfAttribute("beneficiaryChineseName1", lifeBeneficaryInfo.getBeneficaryChineseName1()));
	    attributeList.add(new PdfAttribute("beneficiaryGender1", lifeBeneficaryInfo.getBeneficaryGender1()));
	    attributeList.add(new PdfAttribute("beneficiaryHKID1", lifeBeneficaryInfo.getBeneficaryID1()));
	    attributeList.add(new PdfAttribute("relationship1", lifeBeneficaryInfo.getBeneficaryRelation1()));
	    attributeList.add(new PdfAttribute("entitlement1", lifeBeneficaryInfo.getBeneficaryWeight1()));
	    attributeList.add(new PdfAttribute("beneficiaryEnglishName2", lifeBeneficaryInfo.getBeneficaryFirstName2()+" "+lifeBeneficaryInfo.getBeneficaryLastName2()));
	    attributeList.add(new PdfAttribute("beneficiaryChineseName2", lifeBeneficaryInfo.getBeneficaryChineseName2()));
	    attributeList.add(new PdfAttribute("beneficiaryGender2", lifeBeneficaryInfo.getBeneficaryGender2()));
	    attributeList.add(new PdfAttribute("beneficiaryHKID2", lifeBeneficaryInfo.getBeneficaryID2()));
	    attributeList.add(new PdfAttribute("relationship2", lifeBeneficaryInfo.getBeneficaryRelation2()));
	    attributeList.add(new PdfAttribute("entitlement2", lifeBeneficaryInfo.getBeneficaryWeight2()));
	    attributeList.add(new PdfAttribute("beneficiaryEnglishName3", lifeBeneficaryInfo.getBeneficaryFirstName3()+" "+lifeBeneficaryInfo.getBeneficaryLastName3()));
	    attributeList.add(new PdfAttribute("beneficiaryChineseName3", lifeBeneficaryInfo.getBeneficaryChineseName3()));
	    attributeList.add(new PdfAttribute("beneficiaryGender3", lifeBeneficaryInfo.getBeneficaryGender3()));
	    attributeList.add(new PdfAttribute("beneficiaryHKID3", lifeBeneficaryInfo.getBeneficaryID3()));
	    attributeList.add(new PdfAttribute("relationship3", lifeBeneficaryInfo.getBeneficaryRelation3()));
	    attributeList.add(new PdfAttribute("entitlement3", lifeBeneficaryInfo.getBeneficaryWeight3()));
	    
	    attributeList.add(new PdfAttribute("creditCardValue", lifePayment.getAccountNumber()));
	    attributeList.add(new PdfAttribute("cardExpireDate", "cardExpireDate"));
	    attributeList.add(new PdfAttribute("creditCardAuthEnglish", lifePayment.getAccountHolderName()));
	    
	    SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
	    attributeList.add(new PdfAttribute("authDate", format.format(new Date())));
	    
	    if("2".equals(type)){
	    	attributeList.add(new PdfAttribute("authSign", request.getRealPath("/")+"resources\\pdf\\signature.png","imagepath"));
	    }
			
		String pdfTemplatePath = request.getRealPath("/").replace("\\", "/")+"resources/pdf/"+"SavieOnlineApplicationForm.pdf";
		String pdfGeneratePath = request.getRealPath("/").replace("\\", "\\\\")+"resources\\\\pdf\\\\";
		String name = PDFGeneration.generatePdf2(pdfTemplatePath,pdfGeneratePath,attributeList,false,"All rights reserved, copy");
		
		request.getSession().setAttribute("applicationFormPdf", name);
		logger.info("applicationFormPdf create successfully");
	}
	
	public void createFnaFormPdf(String type,HttpServletRequest request,HttpSession session) throws Exception {
		SavieFnaBean savieFna = (SavieFnaBean) session.getAttribute("savieFna");
		CreateEliteTermPolicyResponse lifePolicy = (CreateEliteTermPolicyResponse) session.getAttribute("lifePolicy");
		LifePersonalDetailsBean lifePersonalDetails = (LifePersonalDetailsBean) session.getAttribute("lifePersonalDetails");
		LifeBeneficaryInfoBean lifeBeneficaryInfo = (LifeBeneficaryInfoBean) session.getAttribute("lifeBeneficaryInfo");
		
		List<PdfAttribute> attributeList = new ArrayList<PdfAttribute>();
		attributeList.add(new PdfAttribute("PolicyNo", lifePolicy.getPolicyNo()));
		String LifeInsuredName = "";
		if(lifeBeneficaryInfo.getIsOwnEstate()){
			LifeInsuredName = lifePersonalDetails.getFirstname()+" "+
		                      lifePersonalDetails.getLastname()+" "+
					          lifePersonalDetails.getChineseName();
		}
		else{
			LifeInsuredName = lifeBeneficaryInfo.getBeneficaryFirstName1()+" "+lifeBeneficaryInfo.getBeneficaryLastName1()+
	                          lifeBeneficaryInfo.getBeneficaryFirstName2()+" "+lifeBeneficaryInfo.getBeneficaryLastName2()+
	                          lifeBeneficaryInfo.getBeneficaryFirstName3()+" "+lifeBeneficaryInfo.getBeneficaryLastName3();
		}
		attributeList.add(new PdfAttribute("LifeInsuredName", LifeInsuredName));
		
		attributeList.add(new PdfAttribute("ApplicantName", lifePersonalDetails.getFirstname()+" "+lifePersonalDetails.getLastname()));
		
		int AOB = DateApi.getAge(DateApi.formatDate1(savieFna.getDob()))+1;
		attributeList.add(new PdfAttribute("AOB", savieFna.getDob()));
		
		attributeList.add(new PdfAttribute("TelephoneNo", lifePersonalDetails.getMobileNumber()));
		
		String group_1 = "";
		if("0".equals(savieFna.getMarital_status())){
			group_1 = "Single";
		}
		else if("1".equals(savieFna.getMarital_status())){
			group_1 = "Married";
		}
		else if("2".equals(savieFna.getMarital_status())){
			group_1 = "Married";
		}
		else if("3".equals(savieFna.getMarital_status())){
			group_1 = "Divorced";
		}
		else if("4".equals(savieFna.getMarital_status())){
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
		if("NoBD1".equals(savieFna.getOccupation())){
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
		}
		attributeList.add(new PdfAttribute("Applicant Occupation", occupation));
		
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
				attributeList.add(new PdfAttribute("1a)chi", "On"));
				attributeList.add(new PdfAttribute("1aeng", "On"));
			}
			if("1".equals(i)){
				attributeList.add(new PdfAttribute("1b)chi", "On"));
				attributeList.add(new PdfAttribute("1b)eng", "On"));
			}
			if("2".equals(i)){
				attributeList.add(new PdfAttribute("1c)chi", "On"));
				attributeList.add(new PdfAttribute("1c)eng", "On"));
			}
			if("3".equals(i)){
				attributeList.add(new PdfAttribute("1d)chi", "On"));
				attributeList.add(new PdfAttribute("1d)eng", "On"));
			}
			if("4".equals(i)){
				attributeList.add(new PdfAttribute("1e)chi", "On"));
				attributeList.add(new PdfAttribute("1e)eng", "On"));
			}
			if("5".equals(i)){
				attributeList.add(new PdfAttribute("1f)chi", "On"));
				attributeList.add(new PdfAttribute("1others)chi", savieFna.getQ1_others()));
				attributeList.add(new PdfAttribute("1f)eng", "On"));
				attributeList.add(new PdfAttribute("1others)eng", savieFna.getQ1_others()));
			}
		}
		
		String[] q2= savieFna.getQ2().split(",");
		for(String i :q2){
			if("0".equals(i)){
				attributeList.add(new PdfAttribute("2a)chi", "On"));
				attributeList.add(new PdfAttribute("2aeng", "On"));
			}
			if("1".equals(i)){
				attributeList.add(new PdfAttribute("2b)chi", "On"));
				attributeList.add(new PdfAttribute("2b)eng", "On"));
				
			}
			if("2".equals(i)){
				attributeList.add(new PdfAttribute("2c)chi", "On"));
				attributeList.add(new PdfAttribute("2c)eng", "On"));
			}
			if("3".equals(i)){
				attributeList.add(new PdfAttribute("2d)chi", "On"));
				attributeList.add(new PdfAttribute("2d)eng", "On"));
			}
			if("4".equals(i)){
				attributeList.add(new PdfAttribute("2e)chi", "On"));
				attributeList.add(new PdfAttribute("2others)chi", savieFna.getQ2_others()));
				attributeList.add(new PdfAttribute("2e)eng", "On"));
				attributeList.add(new PdfAttribute("2otherseng", savieFna.getQ2_others()));
			}
		}
		
		String group_3a_chi = "";
		String group_3a_eng = "";
		if("0".equals(savieFna.getQ3())){
			group_3a_chi = "3a)chi";
			group_3a_eng = "3a)eng";
		}
		else if("1".equals(savieFna.getQ3())){
			group_3a_chi = "3b)chi";
			group_3a_eng = "3b)eng";
		}
		else if("2".equals(savieFna.getQ3())){
			group_3a_chi = "3c)chi";
			group_3a_eng = "3c)eng";
		}
		else if("3".equals(savieFna.getQ3())){
			group_3a_chi = "3d)chi";
			group_3a_eng = "3d)eng";
		}
		else if("4".equals(savieFna.getQ3())){
			group_3a_chi = "3e)chi";
			group_3a_eng = "3e)eng";
		}
		else if("5".equals(savieFna.getQ3())){
			group_3a_chi = "3f)chi";
			group_3a_eng = "3f)eng";
		}
		attributeList.add(new PdfAttribute("group_3a_chi", group_3a_chi));
		attributeList.add(new PdfAttribute("group_3a_eng", group_3a_eng));
		
		if("1".equals(savieFna.getQ4())){
			attributeList.add(new PdfAttribute("group_4", "Yes"));
		}
		else{
			attributeList.add(new PdfAttribute("group_4", "No"));
		}
		
		attributeList.add(new PdfAttribute("group_4a_chi", "4ai)chi"));
		attributeList.add(new PdfAttribute("group_4a_eng", "4ai)eng"));
		attributeList.add(new PdfAttribute("AverageMonthlyIncome(chi)", savieFna.getQ4_a_others()));
		attributeList.add(new PdfAttribute("AverageMonthlyIncome(eng)", savieFna.getQ4_a_others()));

		String[] q4_b= savieFna.getQ4_b().split(",");
		for(String i :q4_b){
			if("0".equals(i)){
				attributeList.add(new PdfAttribute("Cash1", "On"));
				attributeList.add(new PdfAttribute("Cash2", "On"));
			}
			if("1".equals(i)){
				attributeList.add(new PdfAttribute("Moneyinbankaccounts1", "On"));
				attributeList.add(new PdfAttribute("Moneyinbankaccounts2", "On"));
			}
			if("2".equals(i)){
				attributeList.add(new PdfAttribute("Moneymarketaccounts1", "On"));
				attributeList.add(new PdfAttribute("Moneymarketaccounts2", "On"));
			}
			if("3".equals(i)){
				attributeList.add(new PdfAttribute("Activelytradedstocks1", "On"));
				attributeList.add(new PdfAttribute("Activelytradedstocks2", "On"));
			}
			if("4".equals(i)){
				attributeList.add(new PdfAttribute("Bondsandmutualfunds1", "On"));
				attributeList.add(new PdfAttribute("Bondsandmutualfunds2", "On"));
			}
			if("5".equals(i)){
				attributeList.add(new PdfAttribute("USTreasurybills1", "On"));
				attributeList.add(new PdfAttribute("USTreasurybills2", "On"));
			}
			if("6".equals(i)){
				attributeList.add(new PdfAttribute("4biio)chi", "On"));
				attributeList.add(new PdfAttribute("4biiothers)chi", savieFna.getQ4_b_others()));
				attributeList.add(new PdfAttribute("4biio)eng", "On"));
				attributeList.add(new PdfAttribute("4biiothers)eng", savieFna.getQ4_b_others()));
			}
		}
		attributeList.add(new PdfAttribute("LiquidAssets", savieFna.getQ4_b_amount()));
		
		//attributeList.add(new PdfAttribute("Personalreason", "p"));
		
		attributeList.add(new PdfAttribute("TotalExpensespermonth(chi)", savieFna.getQ4_c()));
		attributeList.add(new PdfAttribute("TotalExpensespermonth(eng)", savieFna.getQ4_c()));
		
		attributeList.add(new PdfAttribute("Liabilityandfinalexpense1", savieFna.getQ4_d_1()));
		attributeList.add(new PdfAttribute("Liabilityandfinalexpense2", savieFna.getQ4_d_1()));
		
		attributeList.add(new PdfAttribute("Fintarget1", savieFna.getQ4_d_2()));
		attributeList.add(new PdfAttribute("Fintarget2", savieFna.getQ4_d_2()));
		
		String group_4e_chi = "";
		String group_4e_eng = "";
		if("0".equals(savieFna.getQ4_e())){
			group_4e_chi = "4ea)chi";
			group_4e_eng = "4ea)eng";
		}
		else if("1".equals(savieFna.getQ4_e())){
			group_4e_chi = "4eb)chi";
			group_4e_eng = "4eb)eng";
		}
		else if("2".equals(savieFna.getQ4_e())){
			group_4e_chi = "4ec)chi";
			group_4e_eng = "4ec)eng";
		}
		else if("3".equals(savieFna.getQ4_e())){
			group_4e_chi = "4ed)chi";
			group_4e_eng = "4ed)eng";
		}
		else if("4".equals(savieFna.getQ4_e())){
			group_4e_chi = "4ee)chi";
			group_4e_eng = "4ee)eng";
		}
		else if("5".equals(savieFna.getQ4_e())){
			group_4e_chi = "4ef)chi";
			group_4e_eng = "4ef)eng";
		}
		attributeList.add(new PdfAttribute("group_4e_chi", group_4e_chi));
		attributeList.add(new PdfAttribute("group_4e_eng", group_4e_eng));
		
		String group_4f_chi = "";
		String group_4f_eng = "";
		if("0".equals(savieFna.getQ4_f())){
			group_4f_chi = "4fa)chi";
			group_4f_eng = "4fa)eng";
		}
		else if("1".equals(savieFna.getQ4_f())){
			group_4f_chi = "4fb)chi";
			group_4f_eng = "4fb)eng";
		}
		else if("2".equals(savieFna.getQ4_f())){
			group_4f_chi = "4fc)chi";
			group_4f_eng = "4fc)eng";
		}
		else if("3".equals(savieFna.getQ4_f())){
			group_4f_chi = "4fd)chi";
			group_4f_eng = "4fd)eng";
		}
		else if("4".equals(savieFna.getQ4_f())){
			group_4f_chi = "4fe)chi";
			group_4f_eng = "4fe)eng";
		}
		else if("5".equals(savieFna.getQ4_f())){
			group_4f_chi = "4ff)chi";
			group_4f_eng = "4ff)eng";
		}
		attributeList.add(new PdfAttribute("group_4f_chi", group_4f_chi));
		attributeList.add(new PdfAttribute("group_4f_eng", group_4f_eng));
		
		String[] q4_g= savieFna.getQ4_g().split(",");
		for(String i :q4_g){
			if("0".equals(i)){
				attributeList.add(new PdfAttribute("Salary1", "On"));
				attributeList.add(new PdfAttribute("Salary2", "On"));
			}
			if("1".equals(i)){
				attributeList.add(new PdfAttribute("Income1", "On"));
				attributeList.add(new PdfAttribute("Income2", "On"));
			}
			if("2".equals(i)){
				attributeList.add(new PdfAttribute("Savings1", "On"));
				attributeList.add(new PdfAttribute("Savings2", "On"));
			}
			if("3".equals(i)){
				attributeList.add(new PdfAttribute("Investements1", "On"));
				attributeList.add(new PdfAttribute("Investements2", "On"));
			}
			if("4".equals(i)){
				attributeList.add(new PdfAttribute("4go)chi", "On"));
				attributeList.add(new PdfAttribute("4gothers)chi", savieFna.getQ4_g_others()));
				attributeList.add(new PdfAttribute("4go)eng", "On"));
				attributeList.add(new PdfAttribute("4gothers)eng", savieFna.getQ4_g_others()));
			}
		}
		
		ProductRecommendation productRecommendation = (ProductRecommendation) session.getAttribute("productRecommendation");
		String selectProductName = "AeconoSmart";//session.getAttribute("selectProductName").toString();
		if(productRecommendation!=null&&productRecommendation.getProduct_list()!=null&productRecommendation.getProduct_list().size()>0){
			int i = 1;
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
			logger.info("产品数："+i);
		}
		
		
		attributeList.add(new PdfAttribute("Date1", DateApi.formatString2(new Date())));
		attributeList.add(new PdfAttribute("Date2", DateApi.formatString2(new Date())));
		
		if("2".equals(type)){
			attributeList.add(new PdfAttribute("SignatureofApplicant", request.getRealPath("/")+"resources\\pdf\\signature.png","imagepath"));
		}
		String pdfTemplatePath = request.getRealPath("/").replace("\\", "/")+"resources/pdf/"+"FinancialNeedsAndInvestorProfileAnalysisForm.pdf";
		String pdfGeneratePath = request.getRealPath("/").replace("\\", "\\\\")+"resources\\\\pdf\\\\";
		String name = PDFGeneration.generatePdf2(pdfTemplatePath,pdfGeneratePath,attributeList,false,"All rights reserved, copy");
		
		request.getSession().setAttribute("fnaPdfName", name);
		logger.info("fnaFormPdf create successfully");
	}
	
	public JSONObject saveProductFna(SavieFnaBean savieFna,HttpServletRequest request) throws ECOMMAPIException{
//		String Url = UserRestURIConstants.getConfigs("Url_SZWS") + "fna";
		String Url = UserRestURIConstants.SAVE_FNA;
		HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc")){
			lang = "CH";
		}
		else{
			lang = "EN";
		}
		
		header.put("userName", savieFna.getUser_name());
		header.put("language", WebServiceUtils.transformLanaguage(lang));
		JSONObject jsonObject = new JSONObject();
//		jsonObject.put("user_name", savieFna.getUser_name());
		jsonObject.put("name", savieFna.getName());
		jsonObject.put("gender", savieFna.getGender());
		jsonObject.put("dob", savieFna.getDob());
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
		//String Url = UserRestURIConstants.getConfigs("Url_SZWS") + "fna/getProductRecommendation";
		String Url = UserRestURIConstants.GET_PRODUCTRECOMMENDATION;
		HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
		String lang = UserRestURIConstants.getLanaguage(request);
		String sort_by = StringHelper.emptyIfNull(request.getParameter("sort_by"));
		
		if (lang.equals("tc")){
			lang = "CH";
		}
		else{
			lang = "EN";
		}
		
		header.put("language", WebServiceUtils.transformLanaguage(lang));
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("name", savieFna.getName());
		jsonObject.put("gender", savieFna.getGender());
		jsonObject.put("dob", savieFna.getDob());
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
		jsonObject.put("lang", lang);
		logger.info(jsonObject.toString());
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.POST,Url, header, jsonObject);
		
		if(responseJsonObj.get("errMsgs") == null) {
			net.sf.json.JSONObject json = net.sf.json.JSONObject.fromObject(responseJsonObj.toString());
			ProductRecommendation productRecommendation = (ProductRecommendation) net.sf.json.JSONObject.toBean(json, ProductRecommendation.class);
			request.getSession().setAttribute("productRecommendation", productRecommendation);
			JSONArray productArr = (JSONArray)responseJsonObj.get("product_list");
			JSONArray sortProductArr = new JSONArray();
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
						sort = CompareUtil.compareIntAsc(sort, "getMin_issue_age");
						break;
					case "2":
						sort = CompareUtil.compareIntAsc(sort, "getMax_issue_age");
						break;
					case "3":
						sort = CompareUtil.compareIntAsc(sort, "getProtection_period");
						break;
					case "4":
						sort = CompareUtil.comparePeriodDesc(sort);
						break;
					case "5":
						sort = CompareUtil.compareIntDesc(sort, "getMin_issue_age");
						break;
					case "6":
						sort = CompareUtil.compareIntDesc(sort, "getMax_issue_age");
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
			}
			responseJsonObj.put("product_list", sortProductArr);
		}
		return responseJsonObj;
	}
	
	public JSONObject getFna(HttpServletRequest request) throws ECOMMAPIException{
//		String Url = UserRestURIConstants.getConfigs("Url_SZWS") + "fna";
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
				savieFna.setName(userDetails.getUserName());
				savieFna.setUser_name(userDetails.getUserName());
				savieFna.setGender(jobject.get("gender").toString());
				savieFna.setDob(jobject.get("dob").toString());
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
				savieFna.setLast_update(jobject.get("last_update")!=null?DateApi.formatTime(Long.valueOf(jobject.get("last_update").toString())):"");
				request.getSession().setAttribute("savieFna", savieFna);
				
				jobject.put("q4_a_others", jobject.get("q4_a_others")!=null?NumberFormatUtils.formatNumber(jobject.get("q4_a_others").toString()):"");
				jobject.put("q4_b_amount", jobject.get("q4_b_amount")!=null?NumberFormatUtils.formatNumber(jobject.get("q4_b_amount").toString()):"");
				jobject.put("q4_c", jobject.get("q4_c")!=null?NumberFormatUtils.formatNumber(jobject.get("q4_c").toString()):"");
				jobject.put("q4_d_1", jobject.get("q4_d_1")!=null?NumberFormatUtils.formatNumber(jobject.get("q4_d_1").toString()):"");
				jobject.put("q4_d_2", jobject.get("q4_d_2")!=null?NumberFormatUtils.formatNumber(jobject.get("q4_d_2").toString()):"");
				jobject.put("last_update", jobject.get("last_update")!=null?DateApi.formatTime(Long.valueOf(jobject.get("last_update").toString())):"");
			}
		}
		return jobject;
	}
	
	public JSONObject getPurchaseHistoryByPlanCode(HttpServletRequest request) throws ECOMMAPIException{
		String Url = UserRestURIConstants.GET_PURCHASE_HISTORY_BY_PLANCODE+"?planCode=sv";
		final Map<String,String> header = headerUtil.getHeader(request);
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,Url, header, null);
		return responseJsonObj;
	}
	
	public CreateEliteTermPolicyResponse createLifePolicy(HttpServletRequest request,HttpSession session)throws ECOMMAPIException{
		SaviePlanDetailsBean saviePlanDetails = (SaviePlanDetailsBean) session.getAttribute("saviePlanDetails");
		LifePersonalDetailsBean lifePersonalDetails = (LifePersonalDetailsBean) session.getAttribute("lifePersonalDetails");
		LifeEmploymentInfoBean lifeEmploymentInfo = (LifeEmploymentInfoBean) session.getAttribute("lifeEmploymentInfo");
		LifeBeneficaryInfoBean lifeBeneficaryInfo = (LifeBeneficaryInfoBean) session.getAttribute("lifeBeneficaryInfo");
		LifePaymentBean lifePayment = (LifePaymentBean) session.getAttribute("lifePayment");
		LifeDeclarationBean lifeDeclaration = (LifeDeclarationBean) session.getAttribute("lifeDeclaration");
		
		JSONObject parameters = new JSONObject();
		parameters.put("planCode", "SAVIE");
			JSONObject applicant = new JSONObject();
			applicant.put("firstName", lifePersonalDetails.getFirstname());
			applicant.put("lastName", lifePersonalDetails.getLastname());
			applicant.put("chineseName", lifePersonalDetails.getChineseName());
			//String[] dob = lifePersonalDetails.getDob().split("/");
			applicant.put("dob", lifePersonalDetails.getDob());
			applicant.put("gender", lifePersonalDetails.getGender());
			applicant.put("hkId", lifePersonalDetails.getHkid());
			applicant.put("passport", "");
			applicant.put("maritalStatus", lifePersonalDetails.getMartialStatus()!=null?lifePersonalDetails.getMartialStatus().split("-")[0]:"");
			applicant.put("placeOfBirth", lifePersonalDetails.getPlaceOfBirth()!=null?lifePersonalDetails.getPlaceOfBirth().split("-")[0]:"");
			applicant.put("nationality", lifePersonalDetails.getNationalty()!=null?lifePersonalDetails.getNationalty().split("-")[0]:"");
			applicant.put("residentialTelNoCountryCode", "852");
			applicant.put("residentialTelNo", "23886166");
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
				employmentStatus.put("monthlyPersonalIncome", lifeEmploymentInfo.getMonthlyPersonalIncome()!=null?lifeEmploymentInfo.getMonthlyPersonalIncome().split("-")[0]:"");
				employmentStatus.put("liquidAsset", lifeEmploymentInfo.getAmountOfLiquidAssets()!=null?lifeEmploymentInfo.getAmountOfLiquidAssets().split("-")[0]:"");
				employmentStatus.put("amountOtherSource", lifeEmploymentInfo.getAmountOfOtherSourceOfIncome()!=null?lifeEmploymentInfo.getAmountOfOtherSourceOfIncome().split("-")[0]:"");
				employmentStatus.put("employerName", lifeEmploymentInfo.getEmployerName());
			applicant.put("employmentStatus", employmentStatus);
			applicant.put("smoke", false);
			applicant.put("optOut1", lifeDeclaration.getChkboxDoNotSendMarketingInfo()!=null?lifeDeclaration.getChkboxDoNotSendMarketingInfo():"false");
			applicant.put("optOut2", lifeDeclaration.getChkboxDoNotProvidePersonalData()!=null?lifeDeclaration.getChkboxDoNotProvidePersonalData():"false");
		parameters.put("applicant", applicant);
			JSONObject insured = new JSONObject();
			insured.put("name", applicant.get("firstName")+" "+applicant.get("lastName"));
			insured.put("hkId", applicant.get("hkId"));
			insured.put("passport", "");
			insured.put("relationship", "SE");
				JSONArray beneficiaries = new JSONArray();
					JSONObject beneficiarie1 = new JSONObject();
					JSONObject beneficiarie2 = new JSONObject();
					JSONObject beneficiarie3 = new JSONObject();
					if(!"".equals(lifeBeneficaryInfo.getBeneficaryFirstName1())){
						beneficiarie1.put("firstName", lifeBeneficaryInfo.getBeneficaryFirstName1());
						beneficiarie1.put("lastName", lifeBeneficaryInfo.getBeneficaryLastName1());
						beneficiarie1.put("chineseName", lifeBeneficaryInfo.getBeneficaryChineseName1());
						beneficiarie1.put("hkId", lifeBeneficaryInfo.getBeneficaryID1());
						beneficiarie1.put("passport", lifeBeneficaryInfo.getBeneficaryID1());
						beneficiarie1.put("gender", lifeBeneficaryInfo.getBeneficaryGender1());
						beneficiarie1.put("relationship", lifeBeneficaryInfo.getBeneficaryRelation1()!=null?lifeBeneficaryInfo.getBeneficaryRelation1().split("-")[0]:"");
						beneficiarie1.put("entitlement", lifeBeneficaryInfo.getBeneficaryWeight1());
					beneficiaries.add(beneficiarie1);
					}
					if(!"".equals(lifeBeneficaryInfo.getBeneficaryFirstName2())){
						beneficiarie2.put("firstName", lifeBeneficaryInfo.getBeneficaryFirstName2());
						beneficiarie2.put("lastName", lifeBeneficaryInfo.getBeneficaryLastName2());
						beneficiarie2.put("chineseName", lifeBeneficaryInfo.getBeneficaryChineseName2());
						beneficiarie2.put("hkId", lifeBeneficaryInfo.getBeneficaryID2());
						beneficiarie2.put("passport", lifeBeneficaryInfo.getBeneficaryID2());
						beneficiarie2.put("gender", lifeBeneficaryInfo.getBeneficaryGender2());
						beneficiarie2.put("relationship", lifeBeneficaryInfo.getBeneficaryRelation2()!=null?lifeBeneficaryInfo.getBeneficaryRelation2().split("-")[0]:"");
						beneficiarie2.put("entitlement", lifeBeneficaryInfo.getBeneficaryWeight2());
					beneficiaries.add(beneficiarie2);
					}
					if(!"".equals(lifeBeneficaryInfo.getBeneficaryFirstName3())){
						beneficiarie3.put("firstName", lifeBeneficaryInfo.getBeneficaryFirstName3());
						beneficiarie3.put("lastName", lifeBeneficaryInfo.getBeneficaryLastName3());
						beneficiarie3.put("chineseName", lifeBeneficaryInfo.getBeneficaryChineseName3());
						beneficiarie3.put("hkId", lifeBeneficaryInfo.getBeneficaryID3());
						beneficiarie3.put("passport", lifeBeneficaryInfo.getBeneficaryID3());
						beneficiarie3.put("gender", lifeBeneficaryInfo.getBeneficaryGender3());
						beneficiarie3.put("relationship", lifeBeneficaryInfo.getBeneficaryRelation3()!=null?lifeBeneficaryInfo.getBeneficaryRelation3().split("-")[0]:"");
						beneficiarie3.put("entitlement", lifeBeneficaryInfo.getBeneficaryWeight3());
					beneficiaries.add(beneficiarie3);
					}
					
			insured.put("beneficiaries", beneficiaries);
		parameters.put("insured", insured);
			JSONObject payment = new JSONObject();
			payment.put("amount", saviePlanDetails.getInsuredAmount());
			payment.put("paymentMethod", lifePayment.getPaymentMethod());
			payment.put("bankName", lifePayment.getBankCode()!=null?lifePayment.getBankCode().split("-")[0]:"");
			payment.put("branchName", lifePayment.getBranchCode()!=null?lifePayment.getBranchCode().split("-")[0]:"");
			payment.put("accountNo", lifePayment.getAccountNumber());
			payment.put("expiryDate", "");
		parameters.put("payment", payment);
		parameters.put("insuredAmount", saviePlanDetails.getInsuredAmount());
		parameters.put("referralCode", saviePlanDetails.getPromoCode());
		logger.info(parameters.toString());
		
		final Map<String,String> header = headerUtil.getHeader(request);
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
		parameters.put("planCode", "SAVIE");
		logger.info(parameters.toString());
		
		BaseResponse apiReturn = null;
		final Map<String,String> header = headerUtil.getHeader(request);
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
		final Map<String,String> header = headerUtil.getHeader(request);
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
		final Map<String,String> header = headerUtil.getHeader(request);
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
		final Map<String,String> header = headerUtil.getHeader(request);
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
		final Map<String,String> header = headerUtil.getHeader(request);
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
	
	public void lifeDeclarationSaveforLater(LifeDeclarationBean lifeDeclaration,HttpServletRequest request) throws ECOMMAPIException{
		final Map<String,String> header = headerUtil.getHeader(request);
		net.sf.json.JSONObject parameters = new net.sf.json.JSONObject();
		parameters.accumulate("planCode", "SAVIE-SP");
		parameters.accumulate("declaration1", lifeDeclaration.getHasReadAndAcceptFATC()!=null?lifeDeclaration.getHasReadAndAcceptFATC():"false");
		parameters.accumulate("declaration2", lifeDeclaration.getHasReadAndAcceptFATC2()!=null?lifeDeclaration.getHasReadAndAcceptFATC2():"false");
		parameters.accumulate("declaration3", lifeDeclaration.getHasReadAndAcceptPICS()!=null?lifeDeclaration.getHasReadAndAcceptPICS():"false");
		parameters.accumulate("declaration4", lifeDeclaration.getHasReadAndAcceptCancellation()!=null?lifeDeclaration.getHasReadAndAcceptCancellation():"false");
		parameters.accumulate("declaration5", lifeDeclaration.getHasReadAndAgreeApplication()!=null?lifeDeclaration.getHasReadAndAgreeApplication():"false");
		parameters.accumulate("lastViewPage", "life-declaration");
		
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
	
	public JSONObject uploadSavieOnlineDocument(HttpServletRequest request)throws ECOMMAPIException, Exception{
		//fna pdf
		this.createFnaFormPdf("2", request, request.getSession());
		
		//application pdf
		this.createApplicationFormPdf("2", request, request.getSession());
		
		//upload signature
		CreateEliteTermPolicyResponse lifePolicy = (CreateEliteTermPolicyResponse) request.getSession().getAttribute("lifePolicy");
        File uploadedFile = new File(request.getRealPath("/")+"resources\\pdf\\signature.png");
        
        byte[] toFileBytes= FileCopyUtils.copyToByteArray(uploadedFile);
        String image = new sun.misc.BASE64Encoder().encode(toFileBytes);
        
		final Map<String,String> header = headerUtil.getHeader(request);
		Map<String,Object> clientBrowserInfo = ClientBrowserUtil.getClientInfo(request);
		net.sf.json.JSONObject parameters = new net.sf.json.JSONObject();
		parameters.accumulate("clientBrowserInfo", clientBrowserInfo);
		parameters.accumulate("planCode", "ET");
		parameters.accumulate("fileType", "jpg");
		parameters.accumulate("documentType", "signature");
		parameters.accumulate("originalFilePath", "");
		parameters.accumulate("base64", image);
		parameters.accumulate("policyNo", lifePolicy.getPolicyNo());
		connector.uploadSignature(parameters, header);
		return null;
	}
	
	public void getPolicyApplicationSaveforLater(HttpServletRequest request) throws ECOMMAPIException{
		final Map<String,String> header = headerUtil.getHeader(request);
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
			final Map<String, String> header = headerUtil.getHeader(request);
			Map<String,Object> clientBrowserInfo = ClientBrowserUtil.getClientInfo(request);
			org.json.simple.JSONObject parameters = new org.json.simple.JSONObject();
			parameters.put("clientBrowserInfo", clientBrowserInfo);
			parameters.put("policyNo", policyNo);
			parameters.put("planCode", "ET");
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

	        FileUtil.deletFile(uploadDir);
	        
			final Map<String,String> header = headerUtil.getHeader(request);
			Map<String,Object> clientBrowserInfo = ClientBrowserUtil.getClientInfo(request);
			net.sf.json.JSONObject parameters = new net.sf.json.JSONObject();
			parameters.put("clientBrowserInfo", clientBrowserInfo);
			parameters.put("planCode", "ET");
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
		String planCode = "savie";
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
}
