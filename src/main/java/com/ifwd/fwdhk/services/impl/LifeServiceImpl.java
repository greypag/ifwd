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

import com.ifwd.ecomm.chinese.ZHConverter;
import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.common.document.PDFGeneration;
import com.ifwd.fwdhk.common.document.PdfAttribute;
import com.ifwd.fwdhk.connector.ECommWsConnector;
import com.ifwd.fwdhk.connector.response.BaseResponse;
import com.ifwd.fwdhk.connector.response.eliteterm.CreateEliteTermPolicyResponse;
import com.ifwd.fwdhk.connector.response.life.GetPolicyApplicationResponse;
import com.ifwd.fwdhk.connector.response.life.GetVulnerableCustomerResponse;
import com.ifwd.fwdhk.connector.response.life.PolicyApplication;
import com.ifwd.fwdhk.connector.response.savie.ProviePlanDetailsResponse;
import com.ifwd.fwdhk.connector.response.savie.SaviePlanDetailsRate;
import com.ifwd.fwdhk.connector.response.savie.SaviePlanDetailsResponse;
import com.ifwd.fwdhk.connector.response.savie.ServiceCentreResponse;
import com.ifwd.fwdhk.connector.response.savie.ServiceCentreResult;
import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.OptionItemDesc;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.model.life.LifeBeneficaryInfoBean;
import com.ifwd.fwdhk.model.life.LifeDeclarationBean;
import com.ifwd.fwdhk.model.life.LifeEmploymentInfoBean;
import com.ifwd.fwdhk.model.life.LifePaymentBean;
import com.ifwd.fwdhk.model.life.LifePersonalDetailsBean;
import com.ifwd.fwdhk.model.life.PartnerRegisterBean;
import com.ifwd.fwdhk.model.life.ProductRecommendation;
import com.ifwd.fwdhk.model.life.SavieFnaBean;
import com.ifwd.fwdhk.model.life.SaviePlanDetailsBean;
import com.ifwd.fwdhk.model.passkit.PassPolicyNoBean;
import com.ifwd.fwdhk.model.provie.ProviePlanDetailsBean;
import com.ifwd.fwdhk.services.LifeService;
import com.ifwd.fwdhk.util.ClientBrowserUtil;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.CompareUtil;
import com.ifwd.fwdhk.util.DateApi;
import com.ifwd.fwdhk.util.FileUtil;
import com.ifwd.fwdhk.util.HeaderUtil;
import com.ifwd.fwdhk.util.ImgUtil;
import com.ifwd.fwdhk.util.InitApplicationMessage;
import com.ifwd.fwdhk.util.Methods;
import com.ifwd.fwdhk.util.NumberFormatUtils;
import com.ifwd.fwdhk.util.PDFToImages;
import com.ifwd.fwdhk.util.PolicyNoUtil;
import com.ifwd.fwdhk.util.StringHelper;
import com.ifwd.fwdhk.util.WebServiceUtils;
import com.ifwd.fwdhk.util.ValidationUtils;

@Service
public class LifeServiceImpl implements LifeService {
	private final static Logger logger = LoggerFactory.getLogger(LifeServiceImpl.class);
	
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
			String[] errMsgs=apiResponse.getErrMsgs();
			for(int l=0;l<errMsgs.length;l++)
			{
				logger.error(errMsgs[l].toString());
			}
			//logger.info(apiResponse.getErrMsgs()[0]);
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
						plan0.accumulate("accountBalance", formatNumber(planDetails0Rate.get(i).getAccountEOP()));
						plan0.accumulate("totalPremium", formatNumber(planDetails0Rate.get(i).getTotalPremium()));
						plan0.accumulate("guaranteedSurrenderBenefit", formatNumber(planDetails0Rate.get(i).getGuranteedSurrenderBenefit()));
						plan0.accumulate("guaranteedDeathBenefit", formatNumber(planDetails0Rate.get(i).getGuranteedDeathBenefit()));
						plan0.accumulate("accidentalDeathBenefit", formatNumber(planDetails0Rate.get(i).getAccidentalDeathBenefit()));
						plan0.accumulate("rate","zero");
						plansList.add(plan0);
						
						plan2 = new net.sf.json.JSONObject();
						plan2.accumulate("accountBalance", formatNumber(planDetails2Rate.get(i).getAccountEOP()));
						plan2.accumulate("totalPremium", formatNumber(planDetails2Rate.get(i).getTotalPremium()));
						plan2.accumulate("guaranteedSurrenderBenefit", formatNumber(planDetails2Rate.get(i).getGuranteedSurrenderBenefit()));
						plan2.accumulate("guaranteedDeathBenefit", formatNumber(planDetails2Rate.get(i).getGuranteedDeathBenefit()));
						plan2.accumulate("accidentalDeathBenefit", formatNumber(planDetails2Rate.get(i).getAccidentalDeathBenefit()));
						plan2.accumulate("rate","two");
						plansList.add(plan2);
						
						plan3 = new net.sf.json.JSONObject();
						plan3.accumulate("accountBalance", formatNumber(planDetails3Rate.get(i).getAccountEOP()));
						plan3.accumulate("totalPremium", formatNumber(planDetails3Rate.get(i).getTotalPremium()));
						plan3.accumulate("guaranteedSurrenderBenefit", formatNumber(planDetails3Rate.get(i).getGuranteedSurrenderBenefit()));
						plan3.accumulate("guaranteedDeathBenefit", formatNumber(planDetails3Rate.get(i).getGuranteedDeathBenefit()));
						plan3.accumulate("accidentalDeathBenefit", formatNumber(planDetails3Rate.get(i).getAccidentalDeathBenefit()));
						plan3.accumulate("rate","three");
						plansList.add(plan3);
						
						plan4 = new net.sf.json.JSONObject();
						plan4.accumulate("accountBalance", formatNumber(planDetails4Rate.get(i).getAccountEOP()));
						plan4.accumulate("totalPremium", formatNumber(planDetails4Rate.get(i).getTotalPremium()));
						plan4.accumulate("guaranteedSurrenderBenefit", formatNumber(planDetails4Rate.get(i).getGuranteedSurrenderBenefit()));
						plan4.accumulate("guaranteedDeathBenefit", formatNumber(planDetails4Rate.get(i).getGuranteedDeathBenefit()));
						plan4.accumulate("accidentalDeathBenefit", formatNumber(planDetails4Rate.get(i).getAccidentalDeathBenefit()));
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
					logger.error("getSavieOnlinePlandetails Data exception!");
					throw new ECOMMAPIException("Data exception!");
				}
			}
			else{
				String[] errMsgs=apiResponse.getErrMsgs();
				for(int l=0;l<errMsgs.length;l++)
				{
					logger.error(errMsgs[l].toString());
				}
				resultJsonObject.accumulate("result", "fail");
				resultJsonObject.accumulate("errMsgs", apiResponse.getErrMsgs());
			}
			//logger.info(resultJsonObject.toString());
			return resultJsonObject;
		}
	}
	
	
	private String getIntAmount(String amount){
		
		return String.valueOf(Math.floor(Double.valueOf(amount)));
	}


	
	public JSONObject getProvieRiderEligibility(HttpServletRequest request) throws ECOMMAPIException{
		String Url = UserRestURIConstants.GET_PROVIE_RIDER_ELIGIBILITY;
		final Map<String,String> header = headerUtil.getHeader(request);
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,Url, header, null);
		return responseJsonObj;
	}
	
	
	@Override
	public net.sf.json.JSONObject getProvieRiderPlan(ProviePlanDetailsBean proviePlanDetails, 
			HttpServletRequest request, HttpSession session) throws ECOMMAPIException{
		
		int issueAge = DateApi.getAge(DateApi.formatDate(proviePlanDetails.getDob())) + 1;
		
		int paymentTerm = 0;
		int yearNum=0;
		if("PROVIE-SP".equals(proviePlanDetails.getPaymentType())) {
			session.setAttribute("provieType", "SP");
			paymentTerm = 100-issueAge;
		}else if("PROVIE-RP".equals(proviePlanDetails.getPaymentType())) {
			session.setAttribute("provieType", "RP");
			//String paymentYear = request.getParameter("paymentYear");
			String paymentYear = proviePlanDetails.getPaymentYear();
			paymentTerm = paymentYear == null ? 3 : Integer.valueOf(paymentYear);
		}
		
		ProviePlanDetailsResponse apiResponse = connector.proviePlanDetails(proviePlanDetails.getPaymentType() + "-" + proviePlanDetails.getCurrency().toUpperCase(), issueAge, paymentTerm,
				proviePlanDetails.getInsuredAmount(), proviePlanDetails.getPromoCode(), proviePlanDetails.getPaymentType(), proviePlanDetails.getCurrency());
		
		if(apiResponse.hasError()){
			String[] errMsgs=apiResponse.getErrMsgs();
			for(int l=0;l<errMsgs.length;l++)
			{
				logger.error(errMsgs[l].toString());
			}
			//logger.info(apiResponse.getErrMsgs()[0]);
			throw new ECOMMAPIException(apiResponse.getErrMsgs()[0]);
		} else{
			net.sf.json.JSONObject resultJsonObject = new net.sf.json.JSONObject();
			if(!apiResponse.hasError()){
				List<SaviePlanDetailsRate> planDetails0Rate = apiResponse.getPlanDetails0Rate(); 
				List<SaviePlanDetailsRate> planDetails1Rate = apiResponse.getPlanDetails1Rate(); 
				List<SaviePlanDetailsRate> planDetails2Rate = apiResponse.getPlanDetails2Rate();
				if(planDetails0Rate !=null && planDetails0Rate.size()>0){
					//net.sf.json.JSONObject plansWithRider = new net.sf.json.JSONObject();
					resultJsonObject.put("planCode", proviePlanDetails.getPaymentType() + "-" + proviePlanDetails.getCurrency());
					resultJsonObject.put("currency", proviePlanDetails.getCurrency());
					resultJsonObject.put("rider", proviePlanDetails.getRider());
					
					net.sf.json.JSONObject credit0Rates = new net.sf.json.JSONObject();
					net.sf.json.JSONObject credit1Rates = new net.sf.json.JSONObject();					
					net.sf.json.JSONObject credit2Rates = new net.sf.json.JSONObject();
					net.sf.json.JSONObject planRider;
					net.sf.json.JSONObject plan0 = new net.sf.json.JSONObject();
					net.sf.json.JSONObject plan1 = new net.sf.json.JSONObject();
					net.sf.json.JSONObject plan2 = new net.sf.json.JSONObject();
					for(int i =0;i<planDetails0Rate.size();i++){
						planRider = new net.sf.json.JSONObject();
						yearNum=Integer.valueOf(planDetails0Rate.get(i).getType().substring(1));
						//only retrieve 5 years data from 0 Rate
						if (yearNum <= 5) {
							planRider.put("premiumYear", yearNum);
							
							Double drate0 = Double.parseDouble(planDetails0Rate.get(i).getInterestedRate())*100;
							double rate0= 0.0;
							if(drate0.compareTo(new Double("0.00"))==0) {
								rate0=0.0;
							} else {
								rate0=Double.parseDouble(new java.text.DecimalFormat("#.0").format(drate0));
							}
							planRider.put("rate", rate0);
							planRider.put("accountValue", Integer.valueOf(formatNumber(planDetails0Rate.get(i).getAccountEOP())));
							planRider.put("deathBenefit", Integer.valueOf(formatNumber(planDetails0Rate.get(i).getGuranteedDeathBenefit())));
							if ("p100".equals(proviePlanDetails.getRider())) {
								planRider.put("riderValue", Integer.valueOf(formatNumber(planDetails0Rate.get(i).getAccountEOP())));
							} else if ("p50".equals(proviePlanDetails.getRider())){
								planRider.put("riderValue", Integer.valueOf(formatNumber(String.valueOf(Math.floor(Double.parseDouble(planDetails0Rate.get(i).getAccountEOP())/2)))));
							} else if ("p500".equals(proviePlanDetails.getRider())) {
								planRider.put("riderValue", Integer.valueOf(formatNumber(String.valueOf(Math.floor(Double.parseDouble(planDetails0Rate.get(i).getGuranteedDeathBenefit())*5)))));
							}
							planRider.put("totalPaid", Integer.valueOf(formatNumber(planDetails0Rate.get(i).getTotalPremium())));
							resultJsonObject.accumulate("plans", planRider);
						}
					}
					
					for(int i =0;i<planDetails0Rate.size();i++){
						yearNum=Integer.valueOf(planDetails0Rate.get(i).getType().substring(1));
						if (yearNum==10||yearNum==15||yearNum==100) {
							plan0.put("premiumYear", yearNum);
							plan0.put("rate", 0);
							plan0.put("accountValue", Integer.valueOf(formatNumber(planDetails0Rate.get(i).getAccountEOP())));
							plan0.put("deathBenefit", Integer.valueOf(formatNumber(planDetails0Rate.get(i).getGuranteedDeathBenefit())));
							plan0.put("totalPaid", Integer.valueOf(formatNumber(planDetails0Rate.get(i).getTotalPremium())));
							
							if ((yearNum + issueAge) >= 66) {
								plan0.put("riderEligible", 0);
							} else {
								plan0.put("riderEligible", 1);
							}
							
							credit0Rates.accumulate("plans", plan0);
						}
					}
					
					for(int i =0;i<planDetails1Rate.size();i++){
						yearNum=Integer.valueOf(planDetails1Rate.get(i).getType().substring(1));
						if (yearNum==10||yearNum==15||yearNum==100) {							
							plan1 = new net.sf.json.JSONObject();
							plan1.put("premiumYear", yearNum);
							plan1.put("rate", 1);
							plan1.put("accountValue", Integer.valueOf(formatNumber(planDetails1Rate.get(i).getAccountEOP())));
							plan1.put("deathBenefit", Integer.valueOf(formatNumber(planDetails1Rate.get(i).getGuranteedDeathBenefit())));							
							plan1.put("totalPaid", Integer.valueOf(formatNumber(planDetails1Rate.get(i).getTotalPremium())));
							if ((yearNum + issueAge) >= 66) {
								plan1.put("riderEligible", 0);
							} else {
								plan1.put("riderEligible", 1);
							}
							
							credit1Rates.accumulate("plans", plan1);
							
						}
					}
					for(int i =0;i<planDetails2Rate.size();i++){
						yearNum=Integer.valueOf(planDetails2Rate.get(i).getType().substring(1));
						if (yearNum==10||yearNum==15||yearNum==100) {
							plan2 = new net.sf.json.JSONObject();
							plan2.put("premiumYear", yearNum);
							plan2.put("rate", 2);
							plan2.put("accountValue", Integer.valueOf(formatNumber(planDetails2Rate.get(i).getAccountEOP())));
							plan2.put("deathBenefit", Integer.valueOf(formatNumber(planDetails2Rate.get(i).getGuranteedDeathBenefit())));							
							plan2.put("totalPaid", Integer.valueOf(formatNumber(planDetails2Rate.get(i).getTotalPremium())));
							if ((yearNum + issueAge) >= 66) {
								plan2.put("riderEligible", 0);
							} else {
								plan2.put("riderEligible", 1);
							}
							
							credit2Rates.accumulate("plans", plan2);
						}
						
					}
					credit0Rates.accumulate("rate", 0);
					credit1Rates.accumulate("rate", 1);
					credit2Rates.accumulate("rate", 2);
					
					resultJsonObject.accumulate("creditRates", credit0Rates);					
					resultJsonObject.accumulate("creditRates", credit1Rates);					
					resultJsonObject.accumulate("creditRates", credit2Rates);
					resultJsonObject.accumulate("errMsgs", "");
					resultJsonObject.accumulate("result", "success");
					request.getSession().setAttribute("provieRiderPlan", resultJsonObject);
				}
				else{
					resultJsonObject.accumulate("result", "fail");
					resultJsonObject.accumulate("errMsgs", "Data exception");
					logger.error("getProvieRiderPlan Data exception!");
					throw new ECOMMAPIException("Data exception!");
				}
			}
			else{
				String[] errMsgs=apiResponse.getErrMsgs();
				for(int l=0;l<errMsgs.length;l++)
				{
					logger.error(errMsgs[l].toString());
				}
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
			if("tc".equals(lang)){
				attributeList.add(new PdfAttribute("Gender", "0".equals(savieFna.getGender())?"男":"女"));
			}else{
				attributeList.add(new PdfAttribute("Gender", "0".equals(savieFna.getGender())?"M":"F"));
			}
			
			attributeList.add(new PdfAttribute("Premiumamount", totalPremium));
			
			
			
			String guaranteeRate = planDetailData.getGuaranteeRate();
			String[] rates;
			if(guaranteeRate != null ){
				rates = guaranteeRate.split(",");
				double rate;
				if(rates !=null && rates.length>0){
					for(int i=0;i<rates.length;i++){
						rate = Double.valueOf(rates[i]);
						attributeList.add(new PdfAttribute("CreditingRate_"+(i+1),String.valueOf(rate*100).substring(0,1)+"%"));
					}
				}
			}
			
			int issueAge = Integer.valueOf(planDetailData.getIssueAge());
			net.sf.json.JSONObject json = net.sf.json.JSONObject.fromObject( planDetailData );  
			logger.info(json.toString());
			for(int i=0;i<planDetailData.getPlanDetails0Rate().size();i++){
				int policyYear = Integer.valueOf(planDetailData.getPlanDetails0Rate().get(i).getType().substring(1));
				int age = Integer.valueOf(planDetailData.getPlanDetails0Rate().get(i).getAge());
				if(policyYear == 4){
					attributeList.add(new PdfAttribute("TotalPermiumsPaid_"+policyYear,totalPremium));
					attributeList.add(new PdfAttribute("Accountvalue_"+policyYear,NumberFormatUtils.formatNumber(
							getIntAmount(planDetailData.getPlanDetails0Rate().get(i).getAccountEOP()))));
					attributeList.add(new PdfAttribute("SurrenderBenefit_"+policyYear,NumberFormatUtils.formatNumber(
							getIntAmount(planDetailData.getPlanDetails0Rate().get(i).getGuranteedSurrenderBenefit()))));
					attributeList.add(new PdfAttribute("DeathBenefit_"+policyYear,NumberFormatUtils.formatNumber(
							getIntAmount(planDetailData.getPlanDetails0Rate().get(i).getGuranteedDeathBenefit()))));
				}
				
				if(policyYear%5==0 && policyYear/5<7){
					attributeList.add(new PdfAttribute("TotalPermiumsPaid_"+policyYear,totalPremium));
					attributeList.add(new PdfAttribute("Accountvalue_"+policyYear,NumberFormatUtils.formatNumber(
							getIntAmount(planDetailData.getPlanDetails0Rate().get(i).getAccountEOP()))));
					attributeList.add(new PdfAttribute("SurrenderBenefit_"+policyYear,NumberFormatUtils.formatNumber(
							getIntAmount(planDetailData.getPlanDetails0Rate().get(i).getGuranteedSurrenderBenefit()))));
					attributeList.add(new PdfAttribute("DeathBenefit_"+policyYear,NumberFormatUtils.formatNumber(
							getIntAmount(planDetailData.getPlanDetails0Rate().get(i).getGuranteedDeathBenefit()))));
				}
				String showAge = "";
				if(issueAge > 66){
					if(policyYear == 100){
						if("tc".equals(lang)){
							showAge = "100歲";
						}else{
							showAge = "Age 100";
						}
						attributeList.add(new PdfAttribute("TotalPermiumsPaid_66",totalPremium));
						attributeList.add(new PdfAttribute("EndofPolicyYear_66",showAge));
						attributeList.add(new PdfAttribute("TotalPermiumsPaid_66",totalPremium));
						attributeList.add(new PdfAttribute("Accountvalue_66",NumberFormatUtils.formatNumber(
								getIntAmount(planDetailData.getPlanDetails0Rate().get(i).getAccountEOP()))));
						attributeList.add(new PdfAttribute("SurrenderBenefit_66",NumberFormatUtils.formatNumber(
								getIntAmount(planDetailData.getPlanDetails0Rate().get(i).getGuranteedSurrenderBenefit()))));
						attributeList.add(new PdfAttribute("DeathBenefit_66",NumberFormatUtils.formatNumber(
								getIntAmount(planDetailData.getPlanDetails0Rate().get(i).getGuranteedDeathBenefit()))));
					}
				}
				else if(issueAge < 67){
					if(age>=65&&age%5==0){
						if("tc".equals(lang)){
							showAge = (age+1)+"歲";
						}else{
							showAge = "Age "+(age+1);
						}
						attributeList.add(new PdfAttribute("TotalPermiumsPaid_"+(age+1),totalPremium));
						attributeList.add(new PdfAttribute("EndofPolicyYear_"+(age+1),showAge));
						attributeList.add(new PdfAttribute("TotalPermiumsPaid_"+(age+1),totalPremium));
						attributeList.add(new PdfAttribute("Accountvalue_"+(age+1),NumberFormatUtils.formatNumber(
								getIntAmount(planDetailData.getPlanDetails0Rate().get(i).getAccountEOP()))));
						attributeList.add(new PdfAttribute("SurrenderBenefit_"+(age+1),NumberFormatUtils.formatNumber(
								getIntAmount(planDetailData.getPlanDetails0Rate().get(i).getGuranteedSurrenderBenefit()))));
						attributeList.add(new PdfAttribute("DeathBenefit_"+(age+1),NumberFormatUtils.formatNumber(
								getIntAmount(planDetailData.getPlanDetails0Rate().get(i).getGuranteedDeathBenefit()))));
					}
					/*if(age == 65){
						if("tc".equals(lang)){
							showAge = "66歲";
						}else{
							showAge = "Age 66";
						}
						attributeList.add(new PdfAttribute("TotalPermiumsPaid_66",totalPremium));
						attributeList.add(new PdfAttribute("EndofPolicyYear_66",showAge));
						attributeList.add(new PdfAttribute("TotalPermiumsPaid_66",totalPremium));
						attributeList.add(new PdfAttribute("Accountvalue_66",NumberFormatUtils.formatNumber(
								getIntAmount(planDetailData.getPlanDetails0Rate().get(i).getAccountEOP()))));
						attributeList.add(new PdfAttribute("SurrenderBenefit_66",NumberFormatUtils.formatNumber(
								getIntAmount(planDetailData.getPlanDetails0Rate().get(i).getGuranteedSurrenderBenefit()))));
						attributeList.add(new PdfAttribute("DeathBenefit_66",NumberFormatUtils.formatNumber(
								getIntAmount(planDetailData.getPlanDetails0Rate().get(i).getGuranteedDeathBenefit()))));
					}*/
					
					if(policyYear == 100){
						if("tc".equals(lang)){
							showAge = "100歲";
						}else{
							showAge = "Age 100";
						}
						attributeList.add(new PdfAttribute("TotalPermiumsPaid_100",totalPremium));
						attributeList.add(new PdfAttribute("EndofPolicyYear_100",showAge));
						attributeList.add(new PdfAttribute("TotalPermiumsPaid_100",totalPremium));
						attributeList.add(new PdfAttribute("Accountvalue_100",NumberFormatUtils.formatNumber(
								getIntAmount(planDetailData.getPlanDetails0Rate().get(i).getAccountEOP()))));
						attributeList.add(new PdfAttribute("SurrenderBenefit_100",NumberFormatUtils.formatNumber(
								getIntAmount(planDetailData.getPlanDetails0Rate().get(i).getGuranteedSurrenderBenefit()))));
						attributeList.add(new PdfAttribute("DeathBenefit_100",NumberFormatUtils.formatNumber(
								getIntAmount(planDetailData.getPlanDetails0Rate().get(i).getGuranteedDeathBenefit()))));
					}
					
				}
			}
			
			for(int i=0;i<planDetailData.getPlanDetails2Rate().size();i++){
				int policyYear = Integer.valueOf(planDetailData.getPlanDetails2Rate().get(i).getType().substring(1));
				int age = Integer.valueOf(planDetailData.getPlanDetails2Rate().get(i).getAge());
				
				
				if(policyYear < 4){
					attributeList.add(new PdfAttribute("TotalPermiumsPaid_"+policyYear,totalPremium));
					attributeList.add(new PdfAttribute("Accountvalue_"+policyYear,NumberFormatUtils.formatNumber(
							getIntAmount(planDetailData.getPlanDetails2Rate().get(i).getAccountEOP()))));
					attributeList.add(new PdfAttribute("SurrenderBenefit_"+policyYear,NumberFormatUtils.formatNumber(
							getIntAmount(planDetailData.getPlanDetails2Rate().get(i).getGuranteedSurrenderBenefit()))));
					attributeList.add(new PdfAttribute("DeathBenefit_"+policyYear,NumberFormatUtils.formatNumber(
							getIntAmount(planDetailData.getPlanDetails2Rate().get(i).getGuranteedDeathBenefit()))));
					
					attributeList.add(new PdfAttribute("Accountvalue_a"+policyYear,NumberFormatUtils.formatNumber(
							getIntAmount(planDetailData.getPlanDetails2Rate().get(i).getAccountEOP()))));
					attributeList.add(new PdfAttribute("SurrenderBenefit_a"+policyYear,NumberFormatUtils.formatNumber(
							getIntAmount(planDetailData.getPlanDetails2Rate().get(i).getGuranteedSurrenderBenefit()))));
					attributeList.add(new PdfAttribute("DeathBenefit_a"+policyYear,NumberFormatUtils.formatNumber(
							getIntAmount(planDetailData.getPlanDetails2Rate().get(i).getGuranteedDeathBenefit()))));
				}
				
				if(policyYear == 4){
					attributeList.add(new PdfAttribute("Accountvalue_a"+policyYear,NumberFormatUtils.formatNumber(
							getIntAmount(planDetailData.getPlanDetails2Rate().get(i).getAccountEOP()))));
					attributeList.add(new PdfAttribute("SurrenderBenefit_a"+policyYear,NumberFormatUtils.formatNumber(
							getIntAmount(planDetailData.getPlanDetails2Rate().get(i).getGuranteedSurrenderBenefit()))));
					attributeList.add(new PdfAttribute("DeathBenefit_a"+policyYear,NumberFormatUtils.formatNumber(
							getIntAmount(planDetailData.getPlanDetails2Rate().get(i).getGuranteedDeathBenefit()))));
				}
				
				if(policyYear%5==0 && policyYear/5<7){
					attributeList.add(new PdfAttribute("TotalPermiumsPaid_"+policyYear,totalPremium));
					attributeList.add(new PdfAttribute("Accountvalue_a"+policyYear,NumberFormatUtils.formatNumber(
							getIntAmount(planDetailData.getPlanDetails2Rate().get(i).getAccountEOP()))));
					attributeList.add(new PdfAttribute("SurrenderBenefit_a"+policyYear,NumberFormatUtils.formatNumber(
							getIntAmount(planDetailData.getPlanDetails2Rate().get(i).getGuranteedSurrenderBenefit()))));
					attributeList.add(new PdfAttribute("DeathBenefit_a"+policyYear,NumberFormatUtils.formatNumber(
							getIntAmount(planDetailData.getPlanDetails2Rate().get(i).getGuranteedDeathBenefit()))));
				
				}
				
				String showAge = "";
				if(issueAge > 66){
					if(policyYear == 100){
						if("tc".equals(lang)){
							showAge = "100歲";
						}else{
							showAge = "Age 100";
						}
						attributeList.add(new PdfAttribute("TotalPermiumsPaid_66",totalPremium));
						attributeList.add(new PdfAttribute("EndofPolicyYear_66",showAge));
						attributeList.add(new PdfAttribute("Accountvalue_a66",NumberFormatUtils.formatNumber(
								getIntAmount(planDetailData.getPlanDetails2Rate().get(i).getAccountEOP()))));
						attributeList.add(new PdfAttribute("SurrenderBenefit_a66",NumberFormatUtils.formatNumber(
								getIntAmount(planDetailData.getPlanDetails2Rate().get(i).getGuranteedSurrenderBenefit()))));
						attributeList.add(new PdfAttribute("DeathBenefit_a66",NumberFormatUtils.formatNumber(
								getIntAmount(planDetailData.getPlanDetails2Rate().get(i).getGuranteedDeathBenefit()))));
					}
				}
				else if(issueAge < 67){
					if(age>=65&&age%5==0){
						if("tc".equals(lang)){
							showAge = (age+1)+"歲";
						}else{
							showAge = "Age "+(age+1);
						}
						
						attributeList.add(new PdfAttribute("TotalPermiumsPaid_"+(age+1),totalPremium));
						attributeList.add(new PdfAttribute("EndofPolicyYear_"+(age+1),showAge));
						attributeList.add(new PdfAttribute("Accountvalue_a"+(age+1),NumberFormatUtils.formatNumber(
								getIntAmount(planDetailData.getPlanDetails2Rate().get(i).getAccountEOP()))));
						attributeList.add(new PdfAttribute("SurrenderBenefit_a"+(age+1),NumberFormatUtils.formatNumber(
								getIntAmount(planDetailData.getPlanDetails2Rate().get(i).getGuranteedSurrenderBenefit()))));
						attributeList.add(new PdfAttribute("DeathBenefit_a"+(age+1),NumberFormatUtils.formatNumber(
								getIntAmount(planDetailData.getPlanDetails2Rate().get(i).getGuranteedDeathBenefit()))));
					}
					/*if(age == 65){
						if("tc".equals(lang)){
							showAge = "66歲";
						}else{
							showAge = "Age 66";
						}
						attributeList.add(new PdfAttribute("TotalPermiumsPaid_66",totalPremium));
						attributeList.add(new PdfAttribute("EndofPolicyYear_66",showAge));
						attributeList.add(new PdfAttribute("Accountvalue_a66",NumberFormatUtils.formatNumber(
								getIntAmount(planDetailData.getPlanDetails2Rate().get(i).getAccountEOP()))));
						attributeList.add(new PdfAttribute("SurrenderBenefit_a66",NumberFormatUtils.formatNumber(
								getIntAmount(planDetailData.getPlanDetails2Rate().get(i).getGuranteedSurrenderBenefit()))));
						attributeList.add(new PdfAttribute("DeathBenefit_a66",NumberFormatUtils.formatNumber(
								getIntAmount(planDetailData.getPlanDetails2Rate().get(i).getGuranteedDeathBenefit()))));
					}*/
					if(policyYear == 100){
						if("tc".equals(lang)){
							showAge = "100歲";
						}else{
							showAge = "Age 100";
						}
						attributeList.add(new PdfAttribute("TotalPermiumsPaid_100",totalPremium));
						attributeList.add(new PdfAttribute("EndofPolicyYear_100",showAge));
						attributeList.add(new PdfAttribute("Accountvalue_a100",NumberFormatUtils.formatNumber(
								getIntAmount(planDetailData.getPlanDetails2Rate().get(i).getAccountEOP()))));
						attributeList.add(new PdfAttribute("SurrenderBenefit_a100",NumberFormatUtils.formatNumber(
								getIntAmount(planDetailData.getPlanDetails2Rate().get(i).getGuranteedSurrenderBenefit()))));
						attributeList.add(new PdfAttribute("DeathBenefit_a100",NumberFormatUtils.formatNumber(
								getIntAmount(planDetailData.getPlanDetails2Rate().get(i).getGuranteedDeathBenefit()))));
					}
					
				}
				
				
			}
			
			attributeList.add(new PdfAttribute("EndofContractTerm","4 - "+(100-issueAge)));
			if("tc".equals(lang)){
				attributeList.add(new PdfAttribute("Benefitterm", String.valueOf(100-issueAge)+"年"));
			}else{
				attributeList.add(new PdfAttribute("Benefitterm", String.valueOf(100-issueAge)+" Years"));
			}
			
			
			attributeList.add(new PdfAttribute("Date",format.format(new Date())));
			attributeList.add(new PdfAttribute("Printdate",format.format(new Date())));
			
			if("2".equals(type)){
				CreateEliteTermPolicyResponse lifePolicy = (CreateEliteTermPolicyResponse) request.getSession().getAttribute("lifePolicy");
				String documentPath = UserRestURIConstants.getConfigs("documentPath");
				String uploadDir = documentPath + "/"+new sun.misc.BASE64Encoder().encode(lifePolicy.getPolicyNo().getBytes()); 
		        String path = uploadDir + "/JSignature.png";
		        path = path.replace("/", "\\");
//				attributeList.add(new PdfAttribute("Signature1",path,"imagepath"));
//				attributeList.add(new PdfAttribute("Signature2",path,"imagepath"));
//				attributeList.add(new PdfAttribute("Signature3",path,"imagepath"));
//				attributeList.add(new PdfAttribute("Signature4",path,"imagepath"));
			}
			
			String pdfTemplateName = "";
			if("tc".equals(lang)){
				pdfTemplateName = "SavieProposalTemplateChiA.pdf";
			}else{
				pdfTemplateName = "SavieProposalTemplateEngA.pdf";
			}
			
			String pdfTemplatePath = request.getRealPath("/").replace("\\", "/")+"/resources/pdf/template/"+pdfTemplateName;
			String pdfGeneratePath = request.getRealPath("/").replace("\\", "\\\\")+"\\\\resources\\\\pdf\\\\";
			logger.info("file path:"+pdfTemplatePath);
			logger.info("data:"+attributeList);
			String name="";
			try {
				name = PDFGeneration.generatePdf2(pdfTemplatePath,pdfGeneratePath,attributeList,false,"All rights reserved, copy");
			} catch (Exception e) {
				logger.error(e.getMessage());
				e.printStackTrace();
			}
			logger.info("file name:"+name);
			
			request.getSession().setAttribute("pdfName", name);
			logger.info("pdf create successfully");
			
			String salesIllustrationJpgName = name.split("\\.")[0]+".jpg";
			logger.info("salesIllustrationJpgName:"+salesIllustrationJpgName);
			try {
				PDFToImages.saveAsJpg(request.getRealPath("/").replace("\\", "/")+"/resources/pdf/", name, salesIllustrationJpgName);
			} catch (Exception e) {
				logger.error(e.getMessage());
				e.printStackTrace();
			}
			String userName = (String)request.getSession().getAttribute("username");
			request.getSession().setAttribute("salesIllustrationJpgName", name.split("\\.")[0]+"-"+userName);
			logger.info("salesIllustrationPdf to Jpg successfully");
		}
		else{
			logger.error("createSalesIllustrationPdf api data error");
			throw new Exception("errorMsg: api data error");
		}
	}
	
	@SuppressWarnings("deprecation")
	public void createApplicationFormPdf(String type,HttpServletRequest request,HttpSession session) throws Exception {
		LifePersonalDetailsBean lifePersonalDetails = (LifePersonalDetailsBean) session.getAttribute("lifePersonalDetails");
		LifeEmploymentInfoBean lifeEmploymentInfo = (LifeEmploymentInfoBean) session.getAttribute("lifeEmploymentInfo");
		LifeBeneficaryInfoBean lifeBeneficaryInfo = (LifeBeneficaryInfoBean) session.getAttribute("lifeBeneficaryInfo");
		LifePaymentBean lifePayment = (LifePaymentBean) session.getAttribute("lifePayment");
		CreateEliteTermPolicyResponse lifePolicy = (CreateEliteTermPolicyResponse) session.getAttribute("lifePolicy");
		LifeDeclarationBean lifeDeclaration = (LifeDeclarationBean) session.getAttribute("lifeDeclaration");
		SaviePlanDetailsBean saviePlanDetails = (SaviePlanDetailsBean) session.getAttribute("saviePlanDetails");
		String lang = UserRestURIConstants.getLanaguage(request);
		
		String bankName = "";
		String branchName = "";
		String gender = lifePersonalDetails.getGender();
		if("tc".equals(lang)){
			bankName = lifePayment.getBankCnName();
			branchName = lifePayment.getBranchCnName();
			gender = gender.equalsIgnoreCase("male")?"男":"女";
		}else{
			bankName = lifePayment.getBankEnName();
			branchName = lifePayment.getBranchEnName();
		}
		
		/*String Url = UserRestURIConstants.GET_BANK_INFO+"?bankName="+java.net.URLEncoder.encode(bankName)+"&branchName="+java.net.URLEncoder.encode(branchName);
		final Map<String,String> header = headerUtil.getHeader(request);
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,Url, header, null);
		JSONObject json = (JSONObject)responseJsonObj.get("ddaBank");*/
		
	    List<PdfAttribute> attributeList = new ArrayList<PdfAttribute>();
	    SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
	    attributeList.add(new PdfAttribute("CampaignCode", "KSS017"));
	    attributeList.add(new PdfAttribute("applicationEmploymentStatusKey", "15.Employment Status 就業狀況"));
	    
	    if("tc".equals(lang)){
	    	attributeList.add(new PdfAttribute("applicationMaritalStatus", lifePersonalDetails.getMartialStatusCnName()));
	    	attributeList.add(new PdfAttribute("applicationBirthPlace", lifePersonalDetails.getPlaceOfBirthCnName()));
	    	attributeList.add(new PdfAttribute("applicationNationality", lifePersonalDetails.getNationaltyCnName()));
	    	attributeList.add(new PdfAttribute("applicationResDistrict", lifePersonalDetails.getResidentialAddressDistrictCnName()));
	    	attributeList.add(new PdfAttribute("applicationPerDistrict", lifePersonalDetails.getPermanetAddressDistrictCnName()));
	    	attributeList.add(new PdfAttribute("applicationCorrDistrict", lifePersonalDetails.getCorrespondenceAddressDistrictCnName()));
	    	attributeList.add(new PdfAttribute("applicationEmploymentStatus", lifeEmploymentInfo.getEmploymentStatusCnName()));
	    }else{
	    	attributeList.add(new PdfAttribute("applicationMaritalStatus", lifePersonalDetails.getMartialStatusEnName()));
	    	attributeList.add(new PdfAttribute("applicationBirthPlace", lifePersonalDetails.getPlaceOfBirthEnName()));
	    	attributeList.add(new PdfAttribute("applicationNationality", lifePersonalDetails.getNationaltyEnName()));
	    	attributeList.add(new PdfAttribute("applicationResDistrict", lifePersonalDetails.getResidentialAddressDistrictEnName()));
	    	attributeList.add(new PdfAttribute("applicationPerDistrict", lifePersonalDetails.getPermanetAddressDistrictEnName()));
	    	attributeList.add(new PdfAttribute("applicationCorrDistrict", lifePersonalDetails.getCorrespondenceAddressDistrictEnName()));
	    	attributeList.add(new PdfAttribute("applicationEmploymentStatus", lifeEmploymentInfo.getEmploymentStatusEnName()));
	    }
	    
	    attributeList.add(new PdfAttribute("applicationNo", lifePolicy.getPolicyNo()));
	    attributeList.add(new PdfAttribute("applicationEnglishName", lifePersonalDetails.getLastname()+" "+lifePersonalDetails.getFirstname()));
	    attributeList.add(new PdfAttribute("applicationChineseName", lifePersonalDetails.getChineseName()));
	    attributeList.add(new PdfAttribute("applicationHKID", lifePersonalDetails.getHkid().toUpperCase()));
	    attributeList.add(new PdfAttribute("applicationSex", gender));
	    attributeList.add(new PdfAttribute("applicationDB", lifePersonalDetails.getDob()));
	    attributeList.add(new PdfAttribute("applicationResidentialPhone", lifePersonalDetails.getResidentialTelNo()));
	    attributeList.add(new PdfAttribute("applicationMobile", Methods.formatMobile(lifePersonalDetails.getMobileNumber())));
	    attributeList.add(new PdfAttribute("applicationEmail", lifePersonalDetails.getEmailAddress()));
	    
	    String residentialAddress = (StringUtils.isNotBlank(lifePersonalDetails.getResidentialAddress1())?lifePersonalDetails.getResidentialAddress1()+"," : "")
	    		+(StringUtils.isNotBlank(lifePersonalDetails.getResidentialAddress2())?lifePersonalDetails.getResidentialAddress2()+"," : "")
	    		+(StringUtils.isNotBlank(lifePersonalDetails.getResidentialAddress3())?lifePersonalDetails.getResidentialAddress3()+"," : "")
	    		+(StringUtils.isNotBlank(lifePersonalDetails.getResidentialAddress4())?lifePersonalDetails.getResidentialAddress4() : "");
	    if(",".equals(residentialAddress.substring(residentialAddress.length() - 1))){
	    	residentialAddress = residentialAddress.substring(0, residentialAddress.length()-1);
	    }
	    attributeList.add(new PdfAttribute("applicationResAddress", residentialAddress));
	    
	    String permanetAddress = (StringUtils.isNotBlank(lifePersonalDetails.getPermanetAddress1())?lifePersonalDetails.getPermanetAddress1()+"," : "")
	    		+(StringUtils.isNotBlank(lifePersonalDetails.getPermanetAddress2())?lifePersonalDetails.getPermanetAddress2()+"," : "")
	    		+(StringUtils.isNotBlank(lifePersonalDetails.getPermanetAddress3())?lifePersonalDetails.getPermanetAddress3()+"," : "")
	    		+(StringUtils.isNotBlank(lifePersonalDetails.getPermanetAddress4())?lifePersonalDetails.getPermanetAddress4() : "");
	    if(",".equals(permanetAddress.substring(permanetAddress.length() - 1))){
	    	permanetAddress = permanetAddress.substring(0, permanetAddress.length()-1);
	    }
	    attributeList.add(new PdfAttribute("applicationPerAddress", permanetAddress));
	    
	    String correspondenceAddress = (StringUtils.isNotBlank(lifePersonalDetails.getCorrespondenceAddress1())?lifePersonalDetails.getCorrespondenceAddress1()+"," : "")
	    		+(StringUtils.isNotBlank(lifePersonalDetails.getCorrespondenceAddress2())?lifePersonalDetails.getCorrespondenceAddress2()+"," : "")
	    		+(StringUtils.isNotBlank(lifePersonalDetails.getCorrespondenceAddress3())?lifePersonalDetails.getCorrespondenceAddress3()+"," : "")
	    		+(StringUtils.isNotBlank(lifePersonalDetails.getCorrespondenceAddress4())?lifePersonalDetails.getCorrespondenceAddress4() : "");
	    if(",".equals(correspondenceAddress.substring(correspondenceAddress.length() - 1))){
	    	correspondenceAddress = correspondenceAddress.substring(0, correspondenceAddress.length()-1);
	    }
	    attributeList.add(new PdfAttribute("applicationCorrAddress", correspondenceAddress));
	    
	    String status = lifeEmploymentInfo.getEmploymentStatus();
	    status = status.split("-")[0];
	    if("ES1".equals(status)||"ES2".equals(status)||"ES3".equals(status)){
	    	attributeList.add(new PdfAttribute("currentEmployName/otherIncomeKey1", "16.Current Employer's Name 現時僱主名稱"));
		    attributeList.add(new PdfAttribute("natureOfBusiness/liquidAssetsKey2", "17.Nature Of Business 行業"));
		    attributeList.add(new PdfAttribute("occupationKey", "18.Occupation 職業"));
		    attributeList.add(new PdfAttribute("personalIncomeKey1", "19.Monthly Personal Income"));
		    attributeList.add(new PdfAttribute("personalIncomeKey2", "(applicable to full-time and part-time job)"));
		    attributeList.add(new PdfAttribute("personalIncomeKey3", "個人每月收入（港幣）（全職及兼職適用）"));
		    
		    attributeList.add(new PdfAttribute("currentEmployName/otherIncomeValue", lifeEmploymentInfo.getEmployerName()));
		    if("tc".equals(lang)){
		    	attributeList.add(new PdfAttribute("natureOfBusiness/liquidAssetsValue", lifeEmploymentInfo.getNatureOfBusinessCnName()));
		    	attributeList.add(new PdfAttribute("occupation", lifeEmploymentInfo.getOccupationCnName()));
		    	attributeList.add(new PdfAttribute("personalIncome", lifeEmploymentInfo.getMonthlyPersonalIncomeCnName()));
		    }else{
		    	attributeList.add(new PdfAttribute("natureOfBusiness/liquidAssetsValue", lifeEmploymentInfo.getNatureOfBusinessEnName()));
		    	attributeList.add(new PdfAttribute("occupation", lifeEmploymentInfo.getOccupationEnName()));
		    	attributeList.add(new PdfAttribute("personalIncome", lifeEmploymentInfo.getMonthlyPersonalIncomeEnName()));
		    }
	    }else{
		    attributeList.add(new PdfAttribute("currentEmployName/otherIncomeKey1", "16.Amount of other source of income"));
		    attributeList.add(new PdfAttribute("currentEmployName/otherIncomeKey2", "其他收入來源"));
		    attributeList.add(new PdfAttribute("natureOfBusiness/liquidAssetsKey1", "17.The cumulative amount"));
		    attributeList.add(new PdfAttribute("natureOfBusiness/liquidAssetsKey2", "of your current liquid assets"));
		    attributeList.add(new PdfAttribute("natureOfBusiness/liquidAssetsKey3", "閣下現實累積的流動資產總值"));
		    if("tc".equals(lang)){
		    	attributeList.add(new PdfAttribute("currentEmployName/otherIncomeValue", lifeEmploymentInfo.getAmountOfOtherSourceOfIncomeCnName()));
		    	attributeList.add(new PdfAttribute("natureOfBusiness/liquidAssetsValue", lifeEmploymentInfo.getAmountOfLiquidAssetsCnName()));
		    }else{
		    	attributeList.add(new PdfAttribute("currentEmployName/otherIncomeValue", lifeEmploymentInfo.getAmountOfOtherSourceOfIncomeEnName()));
		    	attributeList.add(new PdfAttribute("natureOfBusiness/liquidAssetsValue", lifeEmploymentInfo.getAmountOfLiquidAssetsEnName()));
		    }
	    }
	    
	    attributeList.add(new PdfAttribute("SinglePremium", NumberFormatUtils.formatNumber(lifePayment.getPaymentAmount())));
	    
	    if(!lifeBeneficaryInfo.getIsOwnEstate()){
	    	if(!"".equals(lifeBeneficaryInfo.getBeneficaryFirstName1())){
	    		attributeList.add(new PdfAttribute("beneficiaryEnglishName1", lifeBeneficaryInfo.getBeneficaryLastName1()+" "+lifeBeneficaryInfo.getBeneficaryFirstName1()));
	    	    attributeList.add(new PdfAttribute("beneficiaryChineseName1", lifeBeneficaryInfo.getBeneficaryChineseName1()));
	    	    if("tc".equals(lang)){
	    	    	attributeList.add(new PdfAttribute("beneficiaryGender1", "male".equalsIgnoreCase(lifeBeneficaryInfo.getBeneficaryGender1())?"男":"女"));
	    	    	attributeList.add(new PdfAttribute("relationship1", lifeBeneficaryInfo.getBeneficaryRelationCnName1()));
	    	    }else{
	    	    	attributeList.add(new PdfAttribute("beneficiaryGender1", lifeBeneficaryInfo.getBeneficaryGender1().toUpperCase()));
	    	    	attributeList.add(new PdfAttribute("relationship1", lifeBeneficaryInfo.getBeneficaryRelationEnName1()));
	    	    }
	    	    
	    	    attributeList.add(new PdfAttribute("beneficiaryHKID1", StringUtils.isNotBlank(lifeBeneficaryInfo.getBeneficaryID1())?lifeBeneficaryInfo.getBeneficaryID1().toUpperCase():lifeBeneficaryInfo.getBeneficiaryPassport1().toUpperCase()));
	    	    attributeList.add(new PdfAttribute("entitlement1", lifeBeneficaryInfo.getBeneficaryWeight1()));
	    	}
	    	if(!"".equals(lifeBeneficaryInfo.getBeneficaryFirstName2())){
	    		attributeList.add(new PdfAttribute("beneficiaryEnglishName2", lifeBeneficaryInfo.getBeneficaryLastName2()+" "+lifeBeneficaryInfo.getBeneficaryFirstName2()));
	    	    attributeList.add(new PdfAttribute("beneficiaryChineseName2", lifeBeneficaryInfo.getBeneficaryChineseName2()));
	    	    if("tc".equals(lang)){
	    	    	attributeList.add(new PdfAttribute("beneficiaryGender2", "male".equalsIgnoreCase(lifeBeneficaryInfo.getBeneficaryGender2())?"男":"女"));
	    	    	attributeList.add(new PdfAttribute("relationship2", lifeBeneficaryInfo.getBeneficaryRelationCnName2()));
	    	    }else{
	    	    	attributeList.add(new PdfAttribute("beneficiaryGender2", lifeBeneficaryInfo.getBeneficaryGender2().toUpperCase()));
	    	    	attributeList.add(new PdfAttribute("relationship2", lifeBeneficaryInfo.getBeneficaryRelationEnName2()));
	    	    }
	    	    
	    	    attributeList.add(new PdfAttribute("beneficiaryHKID2", StringUtils.isNotBlank(lifeBeneficaryInfo.getBeneficaryID2())?lifeBeneficaryInfo.getBeneficaryID2().toUpperCase():lifeBeneficaryInfo.getBeneficiaryPassport2().toUpperCase()));
	    	    attributeList.add(new PdfAttribute("entitlement2", lifeBeneficaryInfo.getBeneficaryWeight2()));
	    	}
	    	if(!"".equals(lifeBeneficaryInfo.getBeneficaryFirstName3())){
	    		attributeList.add(new PdfAttribute("beneficiaryEnglishName3", lifeBeneficaryInfo.getBeneficaryLastName3()+" "+lifeBeneficaryInfo.getBeneficaryFirstName3()));
	    		attributeList.add(new PdfAttribute("beneficiaryChineseName3", lifeBeneficaryInfo.getBeneficaryChineseName3()));
	    		if("tc".equals(lang)){
	    	    	attributeList.add(new PdfAttribute("beneficiaryGender3", "male".equalsIgnoreCase(lifeBeneficaryInfo.getBeneficaryGender3())?"男":"女"));
	    	    	attributeList.add(new PdfAttribute("relationship3", lifeBeneficaryInfo.getBeneficaryRelationCnName3()));
	    	    }else{
	    	    	attributeList.add(new PdfAttribute("beneficiaryGender3", lifeBeneficaryInfo.getBeneficaryGender3().toUpperCase()));
	    	    	attributeList.add(new PdfAttribute("relationship3", lifeBeneficaryInfo.getBeneficaryRelationEnName3()));
	    	    }
	    		
	    	    attributeList.add(new PdfAttribute("beneficiaryHKID3", StringUtils.isNotBlank(lifeBeneficaryInfo.getBeneficaryID3())?lifeBeneficaryInfo.getBeneficaryID3().toUpperCase():lifeBeneficaryInfo.getBeneficiaryPassport3().toUpperCase()));
	       	    attributeList.add(new PdfAttribute("entitlement3", lifeBeneficaryInfo.getBeneficaryWeight3()));
	    	}
	    }else{
	    	//attributeList.add(new PdfAttribute("beneficiaryEnglishName1", lifePersonalDetails.getLastname()+" "+lifePersonalDetails.getFirstname()));
    	    //attributeList.add(new PdfAttribute("beneficiaryChineseName1", lifePersonalDetails.getChineseName()));
    	    //attributeList.add(new PdfAttribute("beneficiaryGender1", gender));
    	    //attributeList.add(new PdfAttribute("beneficiaryHKID1", StringUtils.isNotBlank(lifePersonalDetails.getHkid())?lifePersonalDetails.getHkid():lifePersonalDetails.getPassport()));
    	    if("tc".equals(lang)){
    	    	attributeList.add(new PdfAttribute("beneficiaryEnglishName1", "個人遺產"));
    	    }else{
    	    	attributeList.add(new PdfAttribute("beneficiaryEnglishName1", "Own Estate"));
    	    }
    	    
    	    attributeList.add(new PdfAttribute("entitlement1", "100"));
	    }
	    
	    attributeList.add(new PdfAttribute("Bank/BranchName", bankName+"-"+branchName));
	    
	    attributeList.add(new PdfAttribute("Oneoffpamentamount", "Yes"));
	    
	   // String bankCode = json.get("bankCode")+"";
	    if(bankName!=null && bankName.length()>4){
	    	String bankCode = bankName.substring(bankName.length()-4, bankName.length()-1);
		    if(StringUtils.isNotBlank(bankCode) && !"null".equals(bankCode)){
		    	for(int i=0;i<bankCode.length();i++){
		    		String c = bankCode.charAt(i)+"";
		    		attributeList.add(new PdfAttribute("BankNo."+(i+1), c));
		    	}
		    }
	    }
	    
	    
	    
	    //String branchCode = json.get("branchCode")+"";
	    if(branchName!=null && branchName.length()>4){
	    	String branchCode = branchName.substring(branchName.length()-4, branchName.length()-1);
		    if(StringUtils.isNotBlank(branchCode) && !"null".equals(branchCode)){
		    	for(int i=0;i<branchCode.length();i++){
		    		String c = branchCode.charAt(i)+"";
		    		attributeList.add(new PdfAttribute("BranchNo."+(i+1), c));
		    	}
		    }
	    }
	    
	    String accountNumber = lifePayment.getAccountNumber();
	    for(int i=0;i<accountNumber.length();i++){
	    	String c = accountNumber.charAt(i)+"";
	    	attributeList.add(new PdfAttribute("AccountNo."+(i+1), c));
	    }
	    
	    String limitForEachPayment = "";
	    String pdfName = "SavieOnlineApplicationForm";
	    if(StringUtils.isNotBlank(saviePlanDetails.getInsuredAmountDiscount()) && Integer.valueOf(saviePlanDetails.getInsuredAmountDiscount()) > 0){
	    	limitForEachPayment = NumberFormatUtils.formatNumber(saviePlanDetails.getInsuredAmountDue()) + " (Discounted 已扣減 " + 
	    						NumberFormatUtils.formatNumber(saviePlanDetails.getInsuredAmountDiscount()) + " )";
	    	JSONObject jsonObject=getSavieReferralDiscountParams("SAVIE-SP",saviePlanDetails.getPromoCode(),saviePlanDetails.getInsuredAmount(), lifePersonalDetails.getHkid(),request);
	    	JSONArray jsonArray=(JSONArray) jsonObject.get("referralPlan");
	    	if(jsonArray.get(0).equals("SAVIE PREMIUM DISCOUNT")){
	    		if(jsonArray.size()==1){
	    			pdfName="SavieOnlineApplicationFormPremiumDiscount";
	    		}else{
	    		switch ((String) jsonArray.get(1)) {
				case "SAVIE REFERRAL AGENT EMAIL":
					attributeList.add(new PdfAttribute("PromoCode",saviePlanDetails.getPromoCode()));
					pdfName="SavieOnlineApplicationFormPremiumDiscountAgentEmail";
					break;
				case "SAVIE REFERRAL POLICY NUMBER":
					attributeList.add(new PdfAttribute("PromoCode",saviePlanDetails.getPromoCode()));
					pdfName="SavieOnlineApplicationFormPremiumDiscountSavieReferral";
					break;
				case "FWD 1111 CAMPAIGN":
					attributeList.add(new PdfAttribute("PromoCode",saviePlanDetails.getPromoCode()));
					pdfName="SavieOnlineApplicationFormPremiumDiscountCampaign1111";
					break;
					
				case "2017 CNY Campaign Savie $2,888":
					attributeList.add(new PdfAttribute("PromoCode",saviePlanDetails.getPromoCode()));
					pdfName="SavieOnlineApplicationFormPremiumDiscountCny2017LuckyDraw";
					break;
				case "2017 CNY Campaign Savie $888":
					attributeList.add(new PdfAttribute("PromoCode",saviePlanDetails.getPromoCode()));
					pdfName="SavieOnlineApplicationFormPremiumDiscountCny2017LuckyDraw";
					break;
				case "2017 CNY Campaign Savie $300":
					attributeList.add(new PdfAttribute("PromoCode",saviePlanDetails.getPromoCode()));
					pdfName="SavieOnlineApplicationFormPremiumDiscountCny2017Promotion";
					break;
				default:
					pdfName = "SavieOnlineApplicationFormDiscount";
					break;
				}
	    		}
	    	}else{
	    		pdfName = "SavieOnlineApplicationFormDiscount";
	    	}
	    	//pdfName = "SavieOnlineApplicationFormDiscount";
	    }else{
	    	limitForEachPayment = NumberFormatUtils.formatNumber(saviePlanDetails.getInsuredAmount());
	    }
	    
	    //attributeList.add(new PdfAttribute("LimitForEachPayment", NumberFormatUtils.formatNumber(lifePayment.getPaymentAmount())));
	    attributeList.add(new PdfAttribute("LimitForEachPayment", limitForEachPayment));
	    attributeList.add(new PdfAttribute("ExpiryDate", "N/A"));
	    attributeList.add(new PdfAttribute("NameofAccountHolder", lifePersonalDetails.getLastname()+" "+lifePersonalDetails.getFirstname()));
	    attributeList.add(new PdfAttribute("HKIDNo", lifePersonalDetails.getHkid().toUpperCase()));
	    
	    if(lifeDeclaration.getChkboxDoNotSendMarketingInfo() != null && lifeDeclaration.getChkboxDoNotSendMarketingInfo()){
	    	attributeList.add(new PdfAttribute("DirectMarketingInfo", "Yes"));
	    }
	    if(lifeDeclaration.getChkboxDoNotProvidePersonalData() != null && lifeDeclaration.getChkboxDoNotProvidePersonalData()){
	    	attributeList.add(new PdfAttribute("ThirdParty", "Yes"));
	    }
	    attributeList.add(new PdfAttribute("ForeignAccountTaxComplianceAct", "On"));
	    attributeList.add(new PdfAttribute("applicationNote", "On"));
	    attributeList.add(new PdfAttribute("authDate", format.format(new Date())));
	    
	    if("2".equals(type)){
			String documentPath = UserRestURIConstants.getConfigs("documentPath");
			String uploadDir = documentPath + "/"+new sun.misc.BASE64Encoder().encode(lifePolicy.getPolicyNo().getBytes()); 
	        String path = uploadDir + "/JSignature.png";
	        path = path.replace("/", "\\");
			attributeList.add(new PdfAttribute("authSign", path,"imagepath"));
		}
			
		String pdfTemplatePath = request.getRealPath("/").replace("\\", "/")+"/resources/pdf/template/"+ pdfName +".pdf";
		String pdfGeneratePath = request.getRealPath("/").replace("\\", "\\\\")+"\\\\resources\\\\pdf\\\\";
		String name ="";
		try {
			  name = PDFGeneration.generatePdf2(pdfTemplatePath,pdfGeneratePath,attributeList,false,"All rights reserved, copy");
		} catch (Exception e) {
			logger.error(e.getMessage());
			e.printStackTrace();
		}
		request.getSession().setAttribute("applicationFormPdf", name);
		logger.info("applicationFormPdf create successfully");
		
		String applicationFormJpgName = name.split("\\.")[0]+".jpg";
		logger.info("applicationFormJpgName:"+applicationFormJpgName);
		try {
			PDFToImages.saveAsJpg(request.getRealPath("/").replace("\\", "/")+"/resources/pdf/", name, applicationFormJpgName);
		} catch (Exception e) {
			logger.error(e.getMessage());
			e.printStackTrace();
		}
		String userName = (String)request.getSession().getAttribute("username");
		request.getSession().setAttribute("applicationFormJpgName", name.split("\\.")[0]+"-"+userName);
		logger.info("applicationFormPdf to Jpg successfully");
	}
	
	@SuppressWarnings({ "deprecation", "unchecked" })
	public void createFnaFormPdf(String type,HttpServletRequest request,HttpSession session) throws Exception {
		String lang = UserRestURIConstants.getLanaguage(request);

		Map<String, String> objectiveNames = new HashMap();
		objectiveNames.put("0", WebServiceUtils.getMessage("fna.objective0.name", lang));
		objectiveNames.put("1", WebServiceUtils.getMessage("fna.objective1.name", lang));
		objectiveNames.put("2", WebServiceUtils.getMessage("fna.objective2.name", lang));
		objectiveNames.put("3", WebServiceUtils.getMessage("fna.objective3.name", lang));
		objectiveNames.put("4", WebServiceUtils.getMessage("fna.objective4.name", lang));		
		
		Map<String, String> groupNames = new HashMap();
		groupNames.put("0", WebServiceUtils.getMessage("fna.group0.name", lang));
		groupNames.put("1", WebServiceUtils.getMessage("fna.group1.name", lang));
		groupNames.put("2", WebServiceUtils.getMessage("fna.group2.name", lang));
		groupNames.put("3", WebServiceUtils.getMessage("fna.group3.name", lang));

		Map<String, String> contributeNames = new HashMap();
		contributeNames.put("0", WebServiceUtils.getMessage("fna.contribute0.name", lang));
		contributeNames.put("1", WebServiceUtils.getMessage("fna.contribute1.name", lang));
		contributeNames.put("2", WebServiceUtils.getMessage("fna.contribute2.name", lang));
		contributeNames.put("3", WebServiceUtils.getMessage("fna.contribute3.name", lang));
		contributeNames.put("4", WebServiceUtils.getMessage("fna.contribute4.name", lang));
		contributeNames.put("5", WebServiceUtils.getMessage("fna.contribute5.name", lang));

		SavieFnaBean savieFna = (SavieFnaBean) session.getAttribute("savieFna");
		CreateEliteTermPolicyResponse lifePolicy = (CreateEliteTermPolicyResponse) session.getAttribute("lifePolicy");
		LifePersonalDetailsBean lifePersonalDetails = (LifePersonalDetailsBean) session.getAttribute("lifePersonalDetails");
		LifeEmploymentInfoBean lifeEmploymentInfo = (LifeEmploymentInfoBean) session.getAttribute("lifeEmploymentInfo");
		
		String showOnly1Product = (String) session.getAttribute("showOnly1Product");
		String showILASsDescription = (String) session.getAttribute("showILASsDescription");
		String showNoAvailableProduct = (String) session.getAttribute("showNoAvailableProduct");
		
		List<PdfAttribute> attributeList = new ArrayList<PdfAttribute>();
		attributeList.add(new PdfAttribute("PolicyNo", lifePolicy.getPolicyNo()));
		attributeList.add(new PdfAttribute("LifeInsuredName", lifePersonalDetails.getLastname()+" "+lifePersonalDetails.getFirstname()));
		
		attributeList.add(new PdfAttribute("ApplicantName", lifePersonalDetails.getLastname()+" "+lifePersonalDetails.getFirstname()));
		
		int AOB = DateApi.getAge(DateApi.formatDate(savieFna.getDob()))+1;
		attributeList.add(new PdfAttribute("AOB", AOB+""));
		
		attributeList.add(new PdfAttribute("TelephoneNo", (StringUtils.isNotBlank(lifePersonalDetails.getResidentialTelNo())?
						lifePersonalDetails.getResidentialTelNo()+" / ":"") + lifePersonalDetails.getMobileNumber()));
		
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
	    String status = lifeEmploymentInfo.getEmploymentStatus();
	    status = status.split("-")[0];
	    if("ES1".equals(status)||"ES2".equals(status)||"ES3".equals(status)){
			if(StringUtils.isNotBlank(lifeEmploymentInfo.getOtherOccupation())){
				occupation = lifeEmploymentInfo.getOtherOccupation();
			}else{
				if("tc".equals(lang)){
					occupation = lifeEmploymentInfo.getNatureOfBusinessCnName() + " - " + lifeEmploymentInfo.getOccupationCnName();
				}else{
					occupation = lifeEmploymentInfo.getNatureOfBusinessEnName() + " - " + lifeEmploymentInfo.getOccupationEnName();
				}
			}
	    } else {
			if("tc".equals(lang)){
		    	occupation = lifeEmploymentInfo.getEmploymentStatusCnName();
			}else{
		    	occupation = lifeEmploymentInfo.getEmploymentStatusEnName();
			}
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
		
		if("0".equals(savieFna.getQ4())){
			attributeList.add(new PdfAttribute("group_4", "Yes"));
		}
		else{
			attributeList.add(new PdfAttribute("group_4", "No"));
		}
		
		String group_4a = "";
		if(StringUtils.isBlank(savieFna.getQ4_a())){
			group_4a = "4ai";
			attributeList.add(new PdfAttribute("AverageMonthlyIncome", NumberFormatUtils.formatNumber(savieFna.getQ4_a_others())));
		}
		else if("0".equals(savieFna.getQ4_a())){
			group_4a = "4aa";
			attributeList.add(new PdfAttribute("group_4aii", "4aii"));
			
		}
		else if("1".equals(savieFna.getQ4_a())){
			group_4a = "4ab";
			attributeList.add(new PdfAttribute("group_4aii", "4aii"));
			
		}
		else if("2".equals(savieFna.getQ4_a())){
			group_4a = "4ac";
			attributeList.add(new PdfAttribute("group_4aii", "4aii"));
			
		}
		else if("3".equals(savieFna.getQ4_a())){
			group_4a = "4ad";
			attributeList.add(new PdfAttribute("group_4aii", "4aii"));	
		}
		else if("4".equals(savieFna.getQ4_a())){
			group_4a = "4ae";
			attributeList.add(new PdfAttribute("group_4aii", "4aii"));	
		}
		
		attributeList.add(new PdfAttribute("group_4a", group_4a));

		String[] q4_b= savieFna.getQ4_b().split(",");
		for(String i :q4_b){
			if("0".equals(i)){
				attributeList.add(new PdfAttribute("Cash", "On"));
			}
			if("2".equals(i)){
				attributeList.add(new PdfAttribute("Moneyinbankaccounts", "On"));
			}
			if("1".equals(i)){
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
				attributeList.add(new PdfAttribute("4bother", "Off"));
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
				attributeList.add(new PdfAttribute("4gother", "On"));
				attributeList.add(new PdfAttribute("4gothers", savieFna.getQ4_g_others()));
			}
		}
		
		ProductRecommendation productRecommendation = (ProductRecommendation) session.getAttribute("productRecommendation");
		String selectProductCode = "KSTS";//session.getAttribute("selectProductName").toString();
		if(productRecommendation!=null&&productRecommendation.getProduct_list()!=null&productRecommendation.getProduct_list().size()>0){
			int i = 1;
			for(int a=0;a<productRecommendation.getProduct_list().size();a++){
				List<MorphDynaBean> productLists = productRecommendation.getProduct_list();
				List<MorphDynaBean> products = (List<MorphDynaBean>) productLists.get(a).get("products");
				if(products != null && products.size() > 0){
					for(int b=0;b<products.size();b++){
						q1 = ((String)products.get(b).get("q1")).split(",");
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
						q2 = ((String)products.get(b).get("q2")).split(",");
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
						
						String productName = "";
						String productCode = "";
						try {
							productName = products.get(b).get("name").toString();
							productCode = products.get(b).get("product_code").toString();
						} catch (Exception e) {
							logger.info(e.getMessage());
							e.printStackTrace();
						}
						attributeList.add(new PdfAttribute("NameofInsuranceProduct(s)Introduced"+i, productName));
						if(selectProductCode!=null&&selectProductCode.equals(productCode)){
							attributeList.add(new PdfAttribute("Product(s)Selected"+i, "Yes"));
						}
						i = i+1;
					}
				}
			}
			logger.info("产品数："+i);
		}
		
		/*
		attributeList.add(new PdfAttribute("Noresult", (StringUtils.isNotBlank(showOnly1Product)?showOnly1Product:"") + "\r\n" + 
				   (StringUtils.isNotBlank(showILASsDescription)?showILASsDescription:"") + "\r\n" + 
				   (StringUtils.isNotBlank(showNoAvailableProduct)?showNoAvailableProduct:"")));
		*/		
		String fnaMsg = "";
        String matchProductGroup = "";
        List<MorphDynaBean> productLists = productRecommendation.getProduct_list();
        int productCount = 0;
        Map<String, String> unaffortableTypes = new HashMap();
        Map<String, String> affortableTypes = new HashMap();
        boolean hasUlife = false;
        boolean hasIlas = false;
//        boolean isIlasAffordable = true;
        String objectives = savieFna.getQ1();
        String productGroups = savieFna.getQ2();
        for(int a=0;a<productRecommendation.getProduct_list().size();a++){       		
            List<MorphDynaBean> products = (List<MorphDynaBean>) productLists.get(a).get("products");
            List<MorphDynaBean> otherTypes = (List<MorphDynaBean>) productLists.get(a).get("other_types");
            
            boolean isIlasGroup = false;
        	if (productLists.get(a).get("groupCode") != null && productLists.get(a).get("groupCode").equals("ILAS")) {
        		hasIlas = true;
        		isIlasGroup = true;
        	}

            for (int b=0;b<otherTypes.size();b++){
            	if (!isIlasGroup && !unaffortableTypes.containsKey(otherTypes.get(b).get("type"))){
            		unaffortableTypes.put(otherTypes.get(b).get("type").toString(), otherTypes.get(b).get("type").toString());
            	}
            		
                if (!hasUlife){
	            	if (otherTypes.get(b).get("type").equals("Universal Life")
	            			|| otherTypes.get(b).get("type").equals("萬用壽險")){
	            		hasUlife = true;
	            	}
                }
            }
            
            for (int b=0;b<products.size();b++){            	
                String[] ans = products.get(b).get("q1").toString().split(",");
            	if (!affortableTypes.containsKey(products.get(b).get("type"))){
            		affortableTypes.put(products.get(b).get("type").toString(), products.get(b).get("type").toString());
            	}
                matchProductGroup = products.get(b).get("q2").toString();
            }
            productCount += products.size();
        }
    
        for (Map.Entry<String, String> entry : affortableTypes.entrySet())
        {
            if (unaffortableTypes.containsKey(entry.getKey())){
            	unaffortableTypes.remove(entry.getKey());
            }
        }
        if (productCount==1) // case 1
        {
            fnaMsg += String.format(WebServiceUtils.getMessage("fna.case1", lang), groupNames.get(matchProductGroup), contributeNames.get(savieFna.getQ4_e())).toString() + "\r\n";
        }
        if (hasIlas) {
            fnaMsg += WebServiceUtils.getMessage("fna.case5", lang) + "\r\n";
        }
        String[] matchObj = productRecommendation.getQ1().split(",");
        String[] matchPdg = productRecommendation.getQ2().split(",");
        for (int i=0;i<matchObj.length;i++){
        	objectives = objectives.replace(matchObj[i],"9");
        }
        for (int i=0;i<matchPdg.length;i++){
        	productGroups = productGroups.replace(matchPdg[i],"9");
        }
        
        if (productCount==1 && hasUlife && savieFna.getQ4_e().equals("0")) {
        	fnaMsg += WebServiceUtils.getMessage("fna.case7", lang) + "\r\n";
        } else {
	        if (unaffortableTypes.size()>0 && productCount<=1){
	        	String unaffortableTypesName = "";
	            for (Map.Entry<String, String> entry : unaffortableTypes.entrySet())
	            {
	            	if (unaffortableTypesName.length()>0){
	            		unaffortableTypesName += ",";
	            	}
	            	unaffortableTypesName += entry.getKey();
	            }
	            fnaMsg += WebServiceUtils.getMessage("fna.case4", lang) + "\r\n" + unaffortableTypesName + "\r\n";
	        }
	        String case3aMsg = "";
	        String case3bMsg = "";
	        String[] obj = objectives.split(",");
	        String notMatchObj = "";
	        for (int a=0;a<obj.length;a++){
	        	if (!obj[a].equals("9"))
	        	{
	        		if (notMatchObj.length()>0){
	        			notMatchObj += ",";
	        		}
	        		notMatchObj += objectiveNames.get(obj[a]);
	        	}
	        }
	        if (notMatchObj.length()>0){
	        	String allGroupName = "";
	        	String[] allGroups = savieFna.getQ2().split(",");
	            for (int a=0;a<allGroups.length;a++){
	        		if (allGroupName.length()>0){
	        			allGroupName += ",";
	        		}
	        		allGroupName += groupNames.get(allGroups[a]);
	            }
	        	case3aMsg += String.format(WebServiceUtils.getMessage("fna.case3a", lang), allGroupName, contributeNames.get(savieFna.getQ4_e()), notMatchObj ).toString() + "\r\n";
	        }
	        String[] group = productGroups.split(",");
	        String notMatchGrp = "";
	        for (int a=0;a<group.length;a++){
	        	if (!group[a].equals("9"))
	        	{
	        		if (notMatchGrp.length()>0){
	        			notMatchGrp += ",";
	        		}
	        		notMatchGrp += groupNames.get(group[a]);
	        	}
	        }
	        if (notMatchGrp.length()>0){
	        	String allObjName = "";
	        	String[] allObj = savieFna.getQ1().split(",");
	            for (int a=0;a<allObj.length;a++){
	        		if (allObjName.length()>0){
	        			allObjName += ",";
	        		}
	            	allObjName += objectiveNames.get(allObj[a]);
	            }
	            case3bMsg += String.format(WebServiceUtils.getMessage("fna.case3b", lang), notMatchGrp, contributeNames.get(savieFna.getQ4_e()), allObjName).toString() + "\r\n";
	        }
	        if (case3aMsg.length() > 0 || case3bMsg.length() > 0){
	        	if (case3aMsg.equals(case3bMsg)){
	        		fnaMsg += case3aMsg;
	        	} else {
	        		if (case3aMsg.length() > 0){
	        			fnaMsg += case3aMsg;
	        		}
	        		if (case3bMsg.length() > 0){
	        			fnaMsg += case3bMsg;
	        		}
	        	}
	        }
        }
                
        attributeList.add(new PdfAttribute("Noresult", fnaMsg));
		
		attributeList.add(new PdfAttribute("Date1", "Date (DD-MM-YYYY)"));
		attributeList.add(new PdfAttribute("Date2", "日期 (日-月-年)"));
		attributeList.add(new PdfAttribute("Date3", DateApi.formatString(new Date(), "dd-MM-yyyy")));
		
		/*if("2".equals(type)){
			String documentPath = UserRestURIConstants.getConfigs("documentPath");
			String uploadDir = documentPath + "/"+new sun.misc.BASE64Encoder().encode(lifePolicy.getPolicyNo().getBytes()); 
	        String path = uploadDir + "/JSignature.png";
	        path = path.replace("/", "\\");
			attributeList.add(new PdfAttribute("SignatureofApplicant", path,"imagepath"));
		}*/
		String pdfTemplatePath = request.getRealPath("/").replace("\\", "/")+"/resources/pdf/template/"+"FinancialNeedsAndInvestorProfileAnalysisForm.pdf";
		String pdfGeneratePath = request.getRealPath("/").replace("\\", "\\\\")+"\\\\resources\\\\pdf\\\\";
		
		String name = "";
		try {
			name = PDFGeneration.generatePdf2(pdfTemplatePath,pdfGeneratePath,attributeList,false,"All rights reserved, copy");
		} catch (Exception e) {
			logger.error(e.getMessage());
			e.printStackTrace();
		}
		
		request.getSession().setAttribute("fnaPdfName", name);
		logger.info("fnaFormPdf create successfully");
		
		String fnaFormJpgName = name.split("\\.")[0]+".jpg";
		logger.info("fnaFormJpgName:"+fnaFormJpgName);
		try {
			PDFToImages.saveAsJpg(request.getRealPath("/").replace("\\", "/")+"/resources/pdf/", name, fnaFormJpgName);
		} catch (Exception e) {
			logger.error(e.getMessage());
			e.printStackTrace();
		}
		String userName = (String)request.getSession().getAttribute("username");
		request.getSession().setAttribute("fnaFormJpgName", name.split("\\.")[0]+"-"+userName);
		logger.info("fnaFormPdf to Jpg successfully");
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
						sort = CompareUtil.compareArrAsc(sort, "getProtection_period", true);
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
						sort = CompareUtil.compareArrDesc(sort, "getProtection_period", true);
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
			Float affordabilityPremium = productRecommendation.getAffordabilityPremium()/1000;
			request.getSession().setAttribute("affordabilityPremium", affordabilityPremium.intValue()*1000);
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
			} else {
				request.getSession().removeAttribute("savieFna");
			}			
		} else {
			request.getSession().removeAttribute("savieFna");
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
	
	public JSONObject getSavieHkidDiscount(HttpServletRequest request) throws ECOMMAPIException{
		String Url = UserRestURIConstants.GET_SAVIE_HKID_DISCOUNT;
		final Map<String,String> header = headerUtil.getHeader(request);
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,Url, header, null);
		return responseJsonObj;
	}

	
	public void contactCs(HttpServletRequest request) throws ECOMMAPIException{
		String Url = UserRestURIConstants.SAVIE_CONTACT_CS;
		final Map<String,String> header = headerUtil.getHeader(request);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("product", request.getParameter("product_code"));
		jsonObject.put("channel", "productRecommendation");
		jsonObject.put("name", request.getParameter("customer_name"));
		jsonObject.put("email", request.getParameter("email"));
		jsonObject.put("mobile", Methods.formatMobile(request.getParameter("telephone")));
		jsonObject.put("preferredDay", request.getParameter("preferred_date").split("-")[0]);
		jsonObject.put("preferredTimeSlot", request.getParameter("preferred_time").split("-")[0]);
		jsonObject.put("enquiryType", request.getParameter("enquiry_type").split("-")[0]);
		logger.info(jsonObject.toString());
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.POST,Url, header, jsonObject);
		if(responseJsonObj==null){
			logger.error("contactCs api error:responseJsonObj=null");
			throw new ECOMMAPIException("api error");
		}
		else if(responseJsonObj.get("errMsgs")!=null && responseJsonObj.get("errMsgs")!="") {
			logger.error(responseJsonObj.get("errMsgs").toString());
			throw new ECOMMAPIException(responseJsonObj.get("errMsgs").toString());
		}
		else{
			List<OptionItemDesc> etCsContactPreferredDayEN = InitApplicationMessage.etCsContactPreferredDayEN;
			String contactWeekdayEn = null;
			for(int i=0;i<etCsContactPreferredDayEN.size();i++){
				if(etCsContactPreferredDayEN.get(i).getItemCode().equals(request.getParameter("preferred_date").split("-")[0])){
					contactWeekdayEn = etCsContactPreferredDayEN.get(i).getItemDesc();
				}
			}
			List<OptionItemDesc> etCsContactPreferredDayCN = InitApplicationMessage.etCsContactPreferredDayCN;
			String contactWeekdayCh = null;
			for(int i=0;i<etCsContactPreferredDayCN.size();i++){
				if(etCsContactPreferredDayCN.get(i).getItemCode().equals(request.getParameter("preferred_date").split("-")[0])){
					contactWeekdayCh = etCsContactPreferredDayCN.get(i).getItemDesc();
				}
			}
			
			List<OptionItemDesc> etCsContactPreferredTimeSlotEN = InitApplicationMessage.etCsContactPreferredTimeSlotEN;
			String contactTimeEn = null;
			for(int i=0;i<etCsContactPreferredTimeSlotEN.size();i++){
				if(etCsContactPreferredTimeSlotEN.get(i).getItemCode().equals(request.getParameter("preferred_time").split("-")[0])){
					contactTimeEn = etCsContactPreferredTimeSlotEN.get(i).getItemDesc();
				}
			}
			List<OptionItemDesc> etCsContactPreferredTimeSlotCN = InitApplicationMessage.etCsContactPreferredTimeSlotCN;
			String contactTimeCh = null;
			for(int i=0;i<etCsContactPreferredTimeSlotCN.size();i++){
				if(etCsContactPreferredTimeSlotCN.get(i).getItemCode().equals(request.getParameter("preferred_time").split("-")[0])){
					contactTimeCh = etCsContactPreferredTimeSlotCN.get(i).getItemDesc();
				}
			}
			
			
			JSONObject parameters = new JSONObject();
			parameters.put("to", request.getParameter("email"));
			parameters.put("subject", "FWD will contact you shortly | 富衛將會聯繫您");
			JSONObject model = new JSONObject();
			   model.put("name", request.getParameter("customer_name"));
			   model.put("contactPhoneNo", request.getParameter("telephone"));
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
				logger.error("contactCs api error: aipReturn=null");
				throw new ECOMMAPIException("api error");
			}
			else if(apiReturn.hasError()) {
				String[] errMsgs=apiReturn.getErrMsgs();
				for(int l=0;l<errMsgs.length;l++)
				{
					logger.error(errMsgs[l].toString());
				}
				//logger.info(apiReturn.getErrMsgs()[0]);
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
		
		StringBuffer inputMsg = new StringBuffer();
		
		JSONObject parameters = new JSONObject();
		parameters.put("planCode", "SAVIE-SP");
			JSONObject applicant = new JSONObject();
			applicant.put("firstName", lifePersonalDetails.getFirstname());
			applicant.put("lastName", lifePersonalDetails.getLastname());
			applicant.put("chineseName", lifePersonalDetails.getChineseName());
			inputMsg.append(lifePersonalDetails.getChineseName());
			String[] dob = lifePersonalDetails.getDob().split("-");
			//applicant.put("dob", dob[2]+"-"+dob[1]+"-"+dob[0]);
			applicant.put("dob", "1990-01-30");
			
			applicant.put("gender", lifePersonalDetails.getGender().substring(0, 1));
			applicant.put("hkId", lifePersonalDetails.getHkid().toUpperCase());
			applicant.put("passport", "");
			applicant.put("maritalStatus", lifePersonalDetails.getMartialStatus()!=null?lifePersonalDetails.getMartialStatus().split("-")[0]:"");
			applicant.put("placeOfBirth", lifePersonalDetails.getPlaceOfBirth()!=null?lifePersonalDetails.getPlaceOfBirth().split("-")[0]:"");
			applicant.put("nationality", lifePersonalDetails.getNationalty()!=null?lifePersonalDetails.getNationalty().split("-")[0]:"");
			applicant.put("residentialTelNoCountryCode", "852");
			applicant.put("residentialTelNo", lifePersonalDetails.getResidentialTelNo());
			applicant.put("mobileNoCountryCode", "852");
			applicant.put("mobileNo", Methods.formatMobile(lifePersonalDetails.getMobileNumber()));
			applicant.put("email", lifePersonalDetails.getEmailAddress());
				JSONObject permanentAddress = new JSONObject();
				permanentAddress.put("line1", lifePersonalDetails.getPermanetAddress1());
				permanentAddress.put("line2", lifePersonalDetails.getPermanetAddress2());
				permanentAddress.put("line3", lifePersonalDetails.getPermanetAddress3());
				permanentAddress.put("line4", lifePersonalDetails.getPermanetAddress4());
				
				inputMsg.append(lifePersonalDetails.getPermanetAddress1());
				inputMsg.append(lifePersonalDetails.getPermanetAddress2());
				inputMsg.append(lifePersonalDetails.getPermanetAddress3());
				inputMsg.append(lifePersonalDetails.getPermanetAddress4());
				
				permanentAddress.put("district", lifePersonalDetails.getPermanetAddressDistrict()!=null?lifePersonalDetails.getPermanetAddressDistrict().split("-")[0]:"");
			applicant.put("permanentAddress", permanentAddress);
				
				JSONObject residentialAddress = new JSONObject();
				residentialAddress.put("line1", lifePersonalDetails.getResidentialAddress1());
				residentialAddress.put("line2", lifePersonalDetails.getResidentialAddress2());
				residentialAddress.put("line3", lifePersonalDetails.getResidentialAddress3());
				residentialAddress.put("line4", lifePersonalDetails.getResidentialAddress4());
				
				inputMsg.append(lifePersonalDetails.getResidentialAddress1());
				inputMsg.append(lifePersonalDetails.getResidentialAddress2());
				inputMsg.append(lifePersonalDetails.getResidentialAddress3());
				inputMsg.append(lifePersonalDetails.getResidentialAddress4());
				
				
				residentialAddress.put("district", lifePersonalDetails.getResidentialAddressDistrict()!=null?lifePersonalDetails.getResidentialAddressDistrict().split("-")[0]:"");
			applicant.put("residentialAddress", residentialAddress);
				
				JSONObject correspondenceAddress = new JSONObject();
				correspondenceAddress.put("line1", lifePersonalDetails.getCorrespondenceAddress1());
				correspondenceAddress.put("line2", lifePersonalDetails.getCorrespondenceAddress2());
				correspondenceAddress.put("line3", lifePersonalDetails.getCorrespondenceAddress3());
				correspondenceAddress.put("line4", lifePersonalDetails.getCorrespondenceAddress4());
				
				inputMsg.append(lifePersonalDetails.getCorrespondenceAddress1());
				inputMsg.append(lifePersonalDetails.getCorrespondenceAddress2());
				inputMsg.append(lifePersonalDetails.getCorrespondenceAddress3());
				inputMsg.append(lifePersonalDetails.getCorrespondenceAddress4());
				
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
					if(lifeBeneficaryInfo.getIsOwnEstate()!=null && lifeBeneficaryInfo.getIsOwnEstate()){
						beneficiarie1.put("firstName", applicant.get("firstName"));
						beneficiarie1.put("lastName", applicant.get("lastName"));
						beneficiarie1.put("chineseName", applicant.get("chineseName"));
						inputMsg.append(applicant.get("chineseName"));
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
							inputMsg.append(lifeBeneficaryInfo.getBeneficaryChineseName1());
							if("hkid".equals(lifeBeneficaryInfo.getBeneficiaryHkidPassport1())){
								beneficiarie1.put("hkId", lifeBeneficaryInfo.getBeneficaryID1().toUpperCase());
								beneficiarie1.put("passport", "");
							}
							else{
								beneficiarie1.put("hkId", "");
								beneficiarie1.put("passport", lifeBeneficaryInfo.getBeneficiaryPassport1().toUpperCase());
							}
							beneficiarie1.put("gender", "male".equals(lifeBeneficaryInfo.getBeneficaryGender1())?"M":"F");
							beneficiarie1.put("relationship", lifeBeneficaryInfo.getBeneficaryRelation1()!=null?lifeBeneficaryInfo.getBeneficaryRelation1().split("-")[0]:"");
							beneficiarie1.put("entitlement", lifeBeneficaryInfo.getBeneficaryWeight1());
						beneficiaries.add(beneficiarie1);
						}
						if(!"".equals(lifeBeneficaryInfo.getBeneficaryFirstName2())){
							beneficiarie2.put("firstName", lifeBeneficaryInfo.getBeneficaryFirstName2());
							beneficiarie2.put("lastName", lifeBeneficaryInfo.getBeneficaryLastName2());
							beneficiarie2.put("chineseName", lifeBeneficaryInfo.getBeneficaryChineseName2());
							inputMsg.append(lifeBeneficaryInfo.getBeneficaryChineseName2());
							if("hkid".equals(lifeBeneficaryInfo.getBeneficiaryHkidPassport2())){
								beneficiarie2.put("hkId", lifeBeneficaryInfo.getBeneficaryID2().toUpperCase());
								beneficiarie2.put("passport", "");
							}
							else{
								beneficiarie2.put("hkId", "");
								beneficiarie2.put("passport", lifeBeneficaryInfo.getBeneficiaryPassport2().toUpperCase());
							}
							beneficiarie2.put("gender", "male".equals(lifeBeneficaryInfo.getBeneficaryGender2())?"M":"F");
							beneficiarie2.put("relationship", lifeBeneficaryInfo.getBeneficaryRelation2()!=null?lifeBeneficaryInfo.getBeneficaryRelation2().split("-")[0]:"");
							beneficiarie2.put("entitlement", lifeBeneficaryInfo.getBeneficaryWeight2());
						beneficiaries.add(beneficiarie2);
						}
						if(!"".equals(lifeBeneficaryInfo.getBeneficaryFirstName3())){
							beneficiarie3.put("firstName", lifeBeneficaryInfo.getBeneficaryFirstName3());
							beneficiarie3.put("lastName", lifeBeneficaryInfo.getBeneficaryLastName3());
							beneficiarie3.put("chineseName", lifeBeneficaryInfo.getBeneficaryChineseName3());
							inputMsg.append(lifeBeneficaryInfo.getBeneficaryChineseName3());
							if("hkid".equals(lifeBeneficaryInfo.getBeneficiaryHkidPassport3())){
								beneficiarie3.put("hkId", lifeBeneficaryInfo.getBeneficaryID3().toUpperCase());
								beneficiarie3.put("passport", "");
							}
							else{
								beneficiarie3.put("hkId", "");
								beneficiarie3.put("passport", lifeBeneficaryInfo.getBeneficiaryPassport3().toUpperCase());
							}
							beneficiarie3.put("gender", "male".equals(lifeBeneficaryInfo.getBeneficaryGender3())?"M":"F");
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
			payment.put("bankCode", lifePayment.getBankCode()!=null?lifePayment.getBankCode().split("-")[0]:"");
			payment.put("branchCode", lifePayment.getBranchCode());
			payment.put("accountNo", lifePayment.getAccountNumber());
			payment.put("expiryDate", "");
		parameters.put("payment", payment);
		parameters.put("insuredAmount", saviePlanDetails.getInsuredAmount());
		parameters.put("referralCode", saviePlanDetails.getPromoCode());
		
		if(!"None".equals(lifePersonalDetails.getHasTheClubMembershipNo())){
			parameters.put("externalParty", "THE CLUB");
			parameters.put("externalPartyCode", lifePersonalDetails.getTheClubMembershipNo());
		}
		else{
			parameters.put("externalParty", "");
			parameters.put("externalPartyCode", "");
		}
		logger.info(parameters.toString());
		
		final Map<String,String> header = headerUtil.getHeader1(request);
		CreateEliteTermPolicyResponse lifePolicy = new CreateEliteTermPolicyResponse();
		
		/*if(ZHConverter.hasSimpleChinese(inputMsg.toString())){
			logger.info("Some input information contains simplified Chinese");
			throw new ECOMMAPIException("Some input information contains simplified Chinese");
		}
		else{*/
		GetVulnerableCustomerResponse vulnerableCustomerResponse=new GetVulnerableCustomerResponse();
		
			lifePolicy = connector.createLifePolicy(parameters, header);
			if(!lifePolicy.hasError()){
				request.getSession().setAttribute("lifePolicy", lifePolicy);
				/*JSONObject parameters1 = new JSONObject();
				parameters1.put("policyNo", lifePolicy.getPolicyNo());*/
				//String policyNo=lifePolicy.getPolicyNo();
				//vulnerableCustomerResponse=connector.isVulnerable(policyNo,header);
				//if(vulnerableCustomerResponse.hasError()){
				//	request.getSession().setAttribute("isVulnerable", false);
				//	throw new ECOMMAPIException(vulnerableCustomerResponse.getErrMsgs()[0]);
				//}
				/*if(vulnerableCustomerResponse.getVulnerableCustomer().equals("true")){
					request.getSession().setAttribute("isVulnerable", true);
				}else{
					request.getSession().setAttribute("isVulnerable", false);
				}*/
				//request.getSession().setAttribute("isVulnerable", vulnerableCustomerResponse.getVulnerableCustomer());
				if (ValidationUtils.isEmail(saviePlanDetails.getPromoCode())) {
						BaseResponse apiReturn = null;
						try {
							net.sf.json.JSONObject params = new net.sf.json.JSONObject();
							params.put("policyNo", lifePolicy.getPolicyNo());
							params.put("agentEmail", saviePlanDetails.getPromoCode());
							apiReturn = connector.setEliteTermPolicyAgentEmail(params, header);
						}catch(Exception e){
							logger.error("EliteTermServiceImpl setEliteTermPolicyAgentEmail occurs an exception!");
							logger.error(e.getMessage());
							e.printStackTrace();
						}
				}
			}
			else{
				String[] errMsgs=lifePolicy.getErrMsgs();
				for(int l=0;l<errMsgs.length;l++)
				{
					logger.error(errMsgs[l].toString());
				}
				//logger.info(lifePolicy.getErrMsgs()[0]);
				throw new ECOMMAPIException(lifePolicy.getErrMsgs()[0]);
			}
		//}
		return lifePolicy;
	}
	
	public BaseResponse finalizeLifePolicy(String plan,HttpServletRequest request,HttpSession session)throws ECOMMAPIException{
		CreateEliteTermPolicyResponse lifePolicy = (CreateEliteTermPolicyResponse) request.getSession().getAttribute("lifePolicy");
		LifePaymentBean lifePayment = (LifePaymentBean) request.getSession().getAttribute("lifePayment");
		String creditCaredNo = "";
		String expiryDate = "";
		String cardHolderName = "";
		String planCode = "";
		if("savings-insurance".equals(plan)){
			cardHolderName = lifePayment.getAccountHolderName();
			planCode = "SAVIE-SP";
		}
		else if("cansurance".equals(plan)){
			creditCaredNo = (String) session.getAttribute("creditCaredNo");
			expiryDate = (String) session.getAttribute("expiryDate");
			cardHolderName = (String) session.getAttribute("cardHolderName");
			planCode = "HCP1";
		}
		else{
			creditCaredNo = (String) session.getAttribute("creditCaredNo");
			expiryDate = (String) session.getAttribute("expiryDate");
			cardHolderName = (String) session.getAttribute("cardHolderName");
			planCode = "ROPHI1";
		}
		
		JSONObject parameters = new JSONObject();
		parameters.put("creditCaredNo", creditCaredNo);
		parameters.put("expiryDate", expiryDate);
		parameters.put("cardHolderName", cardHolderName);
		parameters.put("policyNo", lifePolicy.getPolicyNo());
		parameters.put("planCode", planCode);
		logger.info(parameters.toString());
		
		BaseResponse apiReturn = null;
		final Map<String,String> header = headerUtil.getHeader1(request);
		apiReturn = connector.finalizeLifePolicy(parameters, header);
		if(apiReturn.hasError()){
			String[] errMsgs=apiReturn.getErrMsgs();
			for(int l=0;l<errMsgs.length;l++)
			{
				logger.error(errMsgs[l].toString());
			}
			//logger.info(apiReturn.getErrMsgs()[0]);
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
			logger.error("getBranchCode data error: responseJsonObj=null");
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
				logger.error(responseJsonObj.get("errMsgs").toString());
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
		parameters.accumulate("applicantHkId", lifePersonalDetails.getHkid()!=null?lifePersonalDetails.getHkid().toUpperCase():"");
		parameters.accumulate("applicantPassport", lifePersonalDetails.getPassport()!=null?lifePersonalDetails.getPassport().toUpperCase():"");
		parameters.accumulate("applicantMaritalStatus", lifePersonalDetails.getMartialStatus()!=null?lifePersonalDetails.getMartialStatus():"");
		parameters.accumulate("applicantPlaceOfBirth", lifePersonalDetails.getPlaceOfBirth()!=null?lifePersonalDetails.getPlaceOfBirth():"");
		parameters.accumulate("applicantNationality", lifePersonalDetails.getNationalty()!=null?lifePersonalDetails.getNationalty():"");
		parameters.accumulate("applicantResidentialTelNoCountryCode", lifePersonalDetails.getResidentialTelNoCountryCode()!=null?lifePersonalDetails.getResidentialTelNoCountryCode():"");
		parameters.accumulate("applicantResidentialTelNo", lifePersonalDetails.getResidentialTelNo()!=null?lifePersonalDetails.getResidentialTelNo():"");
		parameters.accumulate("applicantMobileNoCountryCode", lifePersonalDetails.getMobileNoCountryCode()!=null?lifePersonalDetails.getMobileNoCountryCode():"");
		parameters.accumulate("applicantMobileNo", Methods.formatMobile(lifePersonalDetails.getMobileNumber()!=null?lifePersonalDetails.getMobileNumber():""));
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
		parameters.accumulate("addressDiffToPermanent", lifePersonalDetails.getDiffToPermanent()!=null?lifePersonalDetails.getDiffToPermanent():"");
		parameters.accumulate("addressDiffToResidential", lifePersonalDetails.getDiffToResidential()!=null?lifePersonalDetails.getDiffToResidential():"");
		return parameters;
	}
	
	public void lifePersonalDetailsSaveforLater(LifePersonalDetailsBean lifePersonalDetails,HttpServletRequest request) throws ECOMMAPIException{
		if ("2".equals(lifePersonalDetails.getType())
				&& (lifePersonalDetails.getFirstname().length()==0
					|| lifePersonalDetails.getLastname().length()==0
					|| lifePersonalDetails.getGender().length()==0
					|| lifePersonalDetails.getHkid().length()==0
					|| lifePersonalDetails.getNationalty().length()==0
					|| lifePersonalDetails.getPlaceOfBirth().length()==0
					|| lifePersonalDetails.getDob().length()==0
					|| lifePersonalDetails.getNationalty().length()==0
					|| lifePersonalDetails.getMobileNumber().length()==0
					|| lifePersonalDetails.getMartialStatus().length()==0
					|| lifePersonalDetails.getEmailAddress().length()==0
					|| lifePersonalDetails.getPermanetAddress1().length()==0
					|| lifePersonalDetails.getPermanetAddressDistrict().length()==0
					|| lifePersonalDetails.getResidentialAddress1().length()==0
					|| lifePersonalDetails.getResidentialAddressDistrict().length()==0				
					|| lifePersonalDetails.getCorrespondenceAddress1().length()==0
					|| lifePersonalDetails.getCorrespondenceAddressDistrict().length()==0)) {
			logger.error("lifePersonalDetailsSaveforLater Not enough data for save_for_later (personal details)");
			throw new ECOMMAPIException("Not enough data for save_for_later (personal details)");
		}		
		
		String language = (String) request.getSession().getAttribute("language");
		final Map<String,String> header = headerUtil.getHeader1(request);
		net.sf.json.JSONObject parameters = new net.sf.json.JSONObject();
		parameters.accumulate("planCode", "SAVIE-SP");
		
		String resumeViewPage = null;
		if("1".equals(lifePersonalDetails.getType())){
			resumeViewPage = language+"/savings-insurance/personal-details";
		}
		else if("2".equals(lifePersonalDetails.getType())){
			parameters = this.lifePersonalDetailsPutData(lifePersonalDetails, parameters);
			resumeViewPage = language+"/savings-insurance/employment-info";
		}
		parameters.accumulate("resumeViewPage", resumeViewPage);
		SaviePlanDetailsBean saviePlanDetails = (SaviePlanDetailsBean) request.getSession().getAttribute("saviePlanDetails");
		parameters.accumulate("amount", saviePlanDetails.getInsuredAmount());
		parameters.accumulate("referralCode", saviePlanDetails.getPromoCode());
		parameters.accumulate("chequeNo", "");
		
		BaseResponse apiResponse = connector.createPolicyApplication(parameters, header);
		if(apiResponse==null){
			logger.error("lifePersonalDetailsSaveforLater api error: apiResponse=null");
			throw new ECOMMAPIException("api error");
		}
		else if(apiResponse.hasError()) {
			String[] errMsgs=apiResponse.getErrMsgs();
			for(int l=0;l<errMsgs.length;l++)
			{
				logger.error(errMsgs[l].toString());
			}
			//logger.info(apiResponse.getErrMsgs()[0]);
			throw new ECOMMAPIException(apiResponse.getErrMsgs()[0]);
		}
	}
	
	public net.sf.json.JSONObject lifeEmploymentInfoPutData(LifeEmploymentInfoBean lifeEmploymentInfo,net.sf.json.JSONObject parameters){
		parameters.accumulate("employmentStatus", lifeEmploymentInfo.getEmploymentStatus()!=null?lifeEmploymentInfo.getEmploymentStatus():"");
		parameters.accumulate("occupation", lifeEmploymentInfo.getOccupation()!=null?lifeEmploymentInfo.getOccupation():"");
		parameters.accumulate("otherOccupation", lifeEmploymentInfo.getOtherOccupation()!=null?lifeEmploymentInfo.getOtherOccupation():"");
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
		if ("2".equals(lifeEmploymentInfo.getType()) 
				&& (lifeEmploymentInfo.getEmploymentStatus().length()==0
					|| ((lifeEmploymentInfo.getEmploymentStatus().equals("ES1")
							|| lifeEmploymentInfo.getEmploymentStatus().equals("ES2")
							|| lifeEmploymentInfo.getEmploymentStatus().equals("ES3")
						)
						&& (lifeEmploymentInfo.getNatureOfBusiness().length()==0
							|| lifeEmploymentInfo.getOccupation().length()==0
							|| lifeEmploymentInfo.getEmployerName().length()==0
							|| lifeEmploymentInfo.getMonthlyPersonalIncome().length()==0
							)
						)
					|| (lifeEmploymentInfo.getOccupation().equals("NoBD16")
						&& lifeEmploymentInfo.getOtherOccupation().length() == 0)	
					|| ((lifeEmploymentInfo.getEmploymentStatus().equals("ES4")
							|| lifeEmploymentInfo.getEmploymentStatus().equals("ES5")
							|| lifeEmploymentInfo.getEmploymentStatus().equals("ES6")
							|| lifeEmploymentInfo.getEmploymentStatus().equals("ES7")
						)
						&& (lifeEmploymentInfo.getAmountOfOtherSourceOfIncome().length()==0
							|| lifeEmploymentInfo.getAmountOfLiquidAssets().length()==0)
						)
					|| lifeEmploymentInfo.getEducation().length()==0)) {
			logger.error("lifeEmploymentInfoSaveforLater Not enough data for save_for_later (employment info)");
			throw new ECOMMAPIException("Not enough data for save_for_later (employment info)");
		}		
		
		String language = (String) request.getSession().getAttribute("language");
		final Map<String,String> header = headerUtil.getHeader1(request);
		net.sf.json.JSONObject parameters = new net.sf.json.JSONObject();
		
		parameters.accumulate("planCode", "SAVIE-SP");
		parameters = this.lifePersonalDetailsPutData(lifePersonalDetails, parameters);
		String resumeViewPage = null;
		if("1".equals(lifeEmploymentInfo.getType())){
			resumeViewPage = language+"/savings-insurance/employment-info";
		}
		else if("2".equals(lifeEmploymentInfo.getType())){
			parameters = this.lifeEmploymentInfoPutData(lifeEmploymentInfo, parameters);
			resumeViewPage = language+"/savings-insurance/beneficiary-info";
		}
		parameters.accumulate("resumeViewPage", resumeViewPage);
		SaviePlanDetailsBean saviePlanDetails = (SaviePlanDetailsBean) request.getSession().getAttribute("saviePlanDetails");
		parameters.accumulate("amount", saviePlanDetails.getInsuredAmount());
		parameters.accumulate("referralCode", saviePlanDetails.getPromoCode());
		parameters.accumulate("chequeNo", "");
		
		BaseResponse apiResponse = connector.createPolicyApplication(parameters, header);
		if(apiResponse==null){
			logger.info("lifeEmploymentInfoSaveforLater api error: apiResponse=null");
			throw new ECOMMAPIException("api error");
		}
		else if(apiResponse.hasError()) {
			String[] errMsgs=apiResponse.getErrMsgs();
			for(int l=0;l<errMsgs.length;l++)
			{
				logger.error(errMsgs[l].toString());
			}
			//logger.info(apiResponse.getErrMsgs()[0]);
			throw new ECOMMAPIException(apiResponse.getErrMsgs()[0]);
		}
	}
	
	public net.sf.json.JSONObject lifeBeneficaryInfoPutData(LifeBeneficaryInfoBean lifeBeneficaryInfo,net.sf.json.JSONObject parameters){
		parameters.accumulate("isOwnEstate", lifeBeneficaryInfo.getIsOwnEstate()!=null?lifeBeneficaryInfo.getIsOwnEstate():"false");
		parameters.accumulate("beneficiaryFirstName1", lifeBeneficaryInfo.getBeneficaryFirstName1()!=null?lifeBeneficaryInfo.getBeneficaryFirstName1():"");
		parameters.accumulate("beneficiaryLastName1", lifeBeneficaryInfo.getBeneficaryLastName1()!=null?lifeBeneficaryInfo.getBeneficaryLastName1():"");
		parameters.accumulate("beneficiaryChineseName1", lifeBeneficaryInfo.getBeneficaryChineseName1()!=null?lifeBeneficaryInfo.getBeneficaryChineseName1():"");
		parameters.accumulate("beneficiaryHkidPassport1", lifeBeneficaryInfo.getBeneficiaryHkidPassport1()!=null?lifeBeneficaryInfo.getBeneficiaryHkidPassport1():"");
		parameters.accumulate("beneficiaryHkId1", lifeBeneficaryInfo.getBeneficaryID1()!=null?lifeBeneficaryInfo.getBeneficaryID1().toUpperCase():"");
		parameters.accumulate("beneficiaryPassport1", lifeBeneficaryInfo.getBeneficiaryPassport1()!=null?lifeBeneficaryInfo.getBeneficiaryPassport1().toUpperCase():"");
		parameters.accumulate("beneficiaryGender1", lifeBeneficaryInfo.getBeneficaryGender1()!=null?lifeBeneficaryInfo.getBeneficaryGender1():"");
		parameters.accumulate("beneficiaryRelationship1", lifeBeneficaryInfo.getBeneficaryRelation1()!=null?lifeBeneficaryInfo.getBeneficaryRelation1():"");
		parameters.accumulate("beneficiaryEntitlement1", lifeBeneficaryInfo.getBeneficaryWeight1()!=null?lifeBeneficaryInfo.getBeneficaryWeight1():"");
		parameters.accumulate("beneficiaryFirstName2", lifeBeneficaryInfo.getBeneficaryFirstName2()!=null?lifeBeneficaryInfo.getBeneficaryFirstName2():"");
		parameters.accumulate("beneficiaryLastName2", lifeBeneficaryInfo.getBeneficaryLastName2()!=null?lifeBeneficaryInfo.getBeneficaryLastName2():"");
		parameters.accumulate("beneficiaryChineseName2", lifeBeneficaryInfo.getBeneficaryChineseName2()!=null?lifeBeneficaryInfo.getBeneficaryChineseName2():"");
		parameters.accumulate("beneficiaryHkidPassport2", lifeBeneficaryInfo.getBeneficiaryHkidPassport2()!=null?lifeBeneficaryInfo.getBeneficiaryHkidPassport2():"");
		parameters.accumulate("beneficiaryHkId2", lifeBeneficaryInfo.getBeneficaryID2()!=null?lifeBeneficaryInfo.getBeneficaryID2().toUpperCase():"");
		parameters.accumulate("beneficiaryPassport2", lifeBeneficaryInfo.getBeneficiaryPassport2()!=null?lifeBeneficaryInfo.getBeneficiaryPassport2().toUpperCase():"");
		parameters.accumulate("beneficiaryGender2", lifeBeneficaryInfo.getBeneficaryGender2()!=null?lifeBeneficaryInfo.getBeneficaryGender2():"");
		parameters.accumulate("beneficiaryRelationship2", lifeBeneficaryInfo.getBeneficaryRelation2()!=null?lifeBeneficaryInfo.getBeneficaryRelation2():"");
		parameters.accumulate("beneficiaryEntitlement2", lifeBeneficaryInfo.getBeneficaryWeight2()!=null?lifeBeneficaryInfo.getBeneficaryWeight2():"");
		parameters.accumulate("beneficiaryFirstName3", lifeBeneficaryInfo.getBeneficaryFirstName3()!=null?lifeBeneficaryInfo.getBeneficaryFirstName3():"");
		parameters.accumulate("beneficiaryLastName3", lifeBeneficaryInfo.getBeneficaryLastName3()!=null?lifeBeneficaryInfo.getBeneficaryLastName3():"");
		parameters.accumulate("beneficiaryChineseName3", lifeBeneficaryInfo.getBeneficaryChineseName3()!=null?lifeBeneficaryInfo.getBeneficaryChineseName3():"");
		parameters.accumulate("beneficiaryHkidPassport3", lifeBeneficaryInfo.getBeneficiaryHkidPassport3()!=null?lifeBeneficaryInfo.getBeneficiaryHkidPassport3():"");
		parameters.accumulate("beneficiaryHkId3", lifeBeneficaryInfo.getBeneficaryID3()!=null?lifeBeneficaryInfo.getBeneficaryID3().toUpperCase():"");
		parameters.accumulate("beneficiaryPassport3", lifeBeneficaryInfo.getBeneficiaryPassport3()!=null?lifeBeneficaryInfo.getBeneficiaryPassport3().toUpperCase():"");
		parameters.accumulate("beneficiaryGender3", lifeBeneficaryInfo.getBeneficaryGender3()!=null?lifeBeneficaryInfo.getBeneficaryGender3():"");
		parameters.accumulate("beneficiaryRelationship3", lifeBeneficaryInfo.getBeneficaryRelation3()!=null?lifeBeneficaryInfo.getBeneficaryRelation3():"");
		parameters.accumulate("beneficiaryEntitlement3", lifeBeneficaryInfo.getBeneficaryWeight3()!=null?lifeBeneficaryInfo.getBeneficaryWeight3():"");
		return parameters;
	}
	
	public void lifeBeneficaryInfoSaveforLater(LifeBeneficaryInfoBean lifeBeneficaryInfo,HttpServletRequest request) throws ECOMMAPIException{
		if ("2".equals(lifeBeneficaryInfo.getType()) 
				&& !lifeBeneficaryInfo.getIsOwnEstate()) {

				int hasBene1 = 0;
				int hasBene2 = 0;
				int hasBene3 = 0;
				
				hasBene1 = lifeBeneficaryInfo.getBeneficaryFirstName1().length()
						+ lifeBeneficaryInfo.getBeneficaryLastName1().length()
						+ lifeBeneficaryInfo.getBeneficaryID1().length()
						+ lifeBeneficaryInfo.getBeneficiaryHkidPassport1().length()
						+ lifeBeneficaryInfo.getBeneficaryGender1().length()
						+ lifeBeneficaryInfo.getBeneficaryRelation1().length()
						+ lifeBeneficaryInfo.getBeneficaryWeight1().length();

				hasBene2 = lifeBeneficaryInfo.getBeneficaryFirstName2().length()
						+ lifeBeneficaryInfo.getBeneficaryLastName2().length()
						+ lifeBeneficaryInfo.getBeneficaryID2().length()
						+ lifeBeneficaryInfo.getBeneficiaryHkidPassport2().length()
						+ lifeBeneficaryInfo.getBeneficaryGender2().length()
						+ lifeBeneficaryInfo.getBeneficaryRelation2().length()
						+ lifeBeneficaryInfo.getBeneficaryWeight2().length();

				hasBene3 = lifeBeneficaryInfo.getBeneficaryFirstName3().length()
						+ lifeBeneficaryInfo.getBeneficaryLastName3().length()
						+ lifeBeneficaryInfo.getBeneficaryID3().length()
						+ lifeBeneficaryInfo.getBeneficiaryHkidPassport3().length()
						+ lifeBeneficaryInfo.getBeneficaryGender3().length()
						+ lifeBeneficaryInfo.getBeneficaryRelation3().length()
						+ lifeBeneficaryInfo.getBeneficaryWeight3().length();
				
				if (hasBene1 > 0 && (lifeBeneficaryInfo.getBeneficaryFirstName1().length()==0
							|| lifeBeneficaryInfo.getBeneficaryLastName1().length()==0
							|| lifeBeneficaryInfo.getBeneficaryID1().length()==0
							|| lifeBeneficaryInfo.getBeneficiaryHkidPassport1().length()==0
							|| lifeBeneficaryInfo.getBeneficaryGender1().length()==0
							|| lifeBeneficaryInfo.getBeneficaryRelation1().length()==0
							|| lifeBeneficaryInfo.getBeneficaryWeight1().length()==0)) {
					logger.error("lifeBeneficaryInfoSaveforLater Not enough data for save_for_later (beneficiary info 1)");
					throw new ECOMMAPIException("Not enough data for save_for_later (beneficiary info 1)");
				}

				if (hasBene2 > 0 && (lifeBeneficaryInfo.getBeneficaryFirstName2().length()==0
						|| lifeBeneficaryInfo.getBeneficaryLastName2().length()==0
						|| lifeBeneficaryInfo.getBeneficaryID2().length()==0
						|| lifeBeneficaryInfo.getBeneficiaryHkidPassport2().length()==0
						|| lifeBeneficaryInfo.getBeneficaryGender2().length()==0
						|| lifeBeneficaryInfo.getBeneficaryRelation2().length()==0
						|| lifeBeneficaryInfo.getBeneficaryWeight2().length()==0)) {
					logger.error("lifeBeneficaryInfoSaveforLater Not enough data for save_for_later (beneficiary info 2)");
					throw new ECOMMAPIException("Not enough data for save_for_later (beneficiary info 2)");
				}

				if (hasBene3 > 0 && (lifeBeneficaryInfo.getBeneficaryFirstName3().length()==0
						|| lifeBeneficaryInfo.getBeneficaryLastName3().length()==0
						|| lifeBeneficaryInfo.getBeneficaryID3().length()==0
						|| lifeBeneficaryInfo.getBeneficiaryHkidPassport3().length()==0
						|| lifeBeneficaryInfo.getBeneficaryGender3().length()==0
						|| lifeBeneficaryInfo.getBeneficaryRelation3().length()==0
						|| lifeBeneficaryInfo.getBeneficaryWeight3().length()==0)) {
					logger.error("lifeBeneficaryInfoSaveforLater Not enough data for save_for_later (beneficiary info 3)");
					throw new ECOMMAPIException("Not enough data for save_for_later (beneficiary info 3)");
				}
		}
		
		LifePersonalDetailsBean lifePersonalDetails = (LifePersonalDetailsBean) request.getSession().getAttribute("lifePersonalDetails");
		LifeEmploymentInfoBean lifeEmploymentInfo = (LifeEmploymentInfoBean) request.getSession().getAttribute("lifeEmploymentInfo");
		
		String language = (String) request.getSession().getAttribute("language");
		final Map<String,String> header = headerUtil.getHeader1(request);
		net.sf.json.JSONObject parameters = new net.sf.json.JSONObject();
		parameters.accumulate("planCode", "SAVIE-SP");
		parameters = this.lifePersonalDetailsPutData(lifePersonalDetails, parameters);
		parameters = this.lifeEmploymentInfoPutData(lifeEmploymentInfo, parameters);
		String resumeViewPage = null;
		if("1".equals(lifeBeneficaryInfo.getType())){
			resumeViewPage = language+"/savings-insurance/beneficiary-info";
		}
		else if("2".equals(lifeBeneficaryInfo.getType())){
			parameters = this.lifeBeneficaryInfoPutData(lifeBeneficaryInfo, parameters);
			resumeViewPage = language+"/savings-insurance/payment";
		}
		parameters.accumulate("resumeViewPage", resumeViewPage);
		SaviePlanDetailsBean saviePlanDetails = (SaviePlanDetailsBean) request.getSession().getAttribute("saviePlanDetails");
		parameters.accumulate("amount", saviePlanDetails.getInsuredAmount());
		parameters.accumulate("referralCode", saviePlanDetails.getPromoCode());
		parameters.accumulate("chequeNo", "");
		
		BaseResponse apiResponse = connector.createPolicyApplication(parameters, header);
		if(apiResponse==null){
			logger.error("lifeBeneficaryInfoSaveforLater api error:apiResponse=null");
			throw new ECOMMAPIException("api error");
		}
		else if(apiResponse.hasError()) {
			String[] errMsgs=apiResponse.getErrMsgs();
			for(int l=0;l<errMsgs.length;l++)
			{
				logger.error(errMsgs[l].toString());
			}
			//logger.info(apiResponse.getErrMsgs()[0]);
			throw new ECOMMAPIException(apiResponse.getErrMsgs()[0]);
		}
	}
	
	public net.sf.json.JSONObject lifePaymentPutData(LifePaymentBean lifePayment,net.sf.json.JSONObject parameters){
		parameters.accumulate("paymentMethod", lifePayment.getPaymentMethod()!=null?lifePayment.getPaymentMethod():"");
		parameters.accumulate("bankName", lifePayment.getBankCode()!=null?lifePayment.getBankCode():"");
		parameters.accumulate("branchName", lifePayment.getBranchCode()!=null?lifePayment.getBranchCode():"");
		parameters.accumulate("accountNo", lifePayment.getAccountNumber()!=null?lifePayment.getAccountNumber():"");
		parameters.accumulate("accountHolderName", lifePayment.getAccountHolderName()!=null?lifePayment.getAccountHolderName():"");
		return parameters;
	}
	
	public void lifePaymentSaveforLater(LifePaymentBean lifePayment, HttpServletRequest request) throws ECOMMAPIException{
		if ("2".equals(lifePayment.getType()) 
				&& (lifePayment.getBankCode().length()==0
					|| lifePayment.getAccountNumber().length()==0
					|| lifePayment.getBranchCode().length()==0
				)
			) {
			logger.error("lifePaymentSaveforLater Not enough data for save_for_later (payment info)");
			throw new ECOMMAPIException("Not enough data for save_for_later (payment info)");
		}		
		
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
		String resumeViewPage = null;
		if("1".equals(lifePayment.getType())){
			resumeViewPage = language+"/savings-insurance/payment";
		}
		else if("2".equals(lifePayment.getType())){
			parameters = this.lifePaymentPutData(lifePayment, parameters);
			resumeViewPage = language+"/savings-insurance/application-summary";
		}
		parameters.accumulate("resumeViewPage", resumeViewPage);
		SaviePlanDetailsBean saviePlanDetails = (SaviePlanDetailsBean) request.getSession().getAttribute("saviePlanDetails");
		parameters.accumulate("amount", saviePlanDetails.getInsuredAmount());
		parameters.accumulate("referralCode", saviePlanDetails.getPromoCode());
		parameters.accumulate("chequeNo", "");
		
		BaseResponse apiResponse = connector.createPolicyApplication(parameters, header);
		if(apiResponse==null){
			logger.error("lifePaymentSaveforLater api error: apiResponse=null");
			throw new ECOMMAPIException("api error");
		}
		else if(apiResponse.hasError()) {
			String[] errMsgs=apiResponse.getErrMsgs();
			for(int l=0;l<errMsgs.length;l++)
			{
				logger.error(errMsgs[l].toString());
			}
			//logger.info(apiResponse.getErrMsgs()[0]);
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
		String resumeViewPage = null;
		if("1".equals(lifeDeclaration.getType())){
			resumeViewPage = language+"/savings-insurance/declaration";
		}
		else if("2".equals(lifeDeclaration.getType())){
			parameters = this.lifeDeclarationPutData(lifeDeclaration, parameters);
			resumeViewPage = language+"/savings-insurance/signature";
		}
		else if("3".equals(lifeDeclaration.getType())){
			parameters = this.lifeDeclarationPutData(lifeDeclaration, parameters);
			resumeViewPage = language+"/savings-insurance/signature";
			
			CreateEliteTermPolicyResponse lifePolicy = (CreateEliteTermPolicyResponse) request.getSession().getAttribute("lifePolicy");
			parameters.accumulate("policyNo", lifePolicy.getPolicyNo());
		}
		parameters.accumulate("resumeViewPage", resumeViewPage);
		SaviePlanDetailsBean saviePlanDetails = (SaviePlanDetailsBean) request.getSession().getAttribute("saviePlanDetails");
		parameters.accumulate("amount", saviePlanDetails.getInsuredAmount());
		parameters.accumulate("referralCode", saviePlanDetails.getPromoCode());
		parameters.accumulate("chequeNo", "");
		
		BaseResponse apiResponse = connector.createPolicyApplication(parameters, header);
		if(apiResponse==null){
			logger.error("lifeDeclarationSaveforLater api error: apiResponse=null");
			throw new ECOMMAPIException("api error");
		}
		else if(apiResponse.hasError()) {
			String[] errMsgs=apiResponse.getErrMsgs();
			for(int l=0;l<errMsgs.length;l++)
			{
				logger.error(errMsgs[l].toString());
			}
			//logger.info(apiResponse.getErrMsgs()[0]);
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
		this.uploadPdf("applicationFormPdf","appForm", request);
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
			String[] errMsgs=br.getErrMsgs();
			for(int l=0;l<errMsgs.length;l++)
			{
				logger.error(errMsgs[l].toString());
			}
			//logger.debug(br.getErrMsgs()[0]);
			throw new ECOMMAPIException(br.getErrMsgs()[0]);
		}
	}
	
	public GetPolicyApplicationResponse getPolicyApplicationSaveforLater(HttpServletRequest request) throws ECOMMAPIException{
		final Map<String,String> header = headerUtil.getHeader1(request);
		GetPolicyApplicationResponse apiResponse = connector.getPolicyApplication(header);
		
		if(apiResponse!=null&&apiResponse.hasError()) {
			String[] errMsgs=apiResponse.getErrMsgs();
			for(int l=0;l<errMsgs.length;l++)
			{
				logger.error(errMsgs[l].toString());
			}
			//logger.info(apiResponse.getErrMsgs()[0]);
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
			if(!"".equals(lifePersonalDetails.getMartialStatus())){
				for(OptionItemDesc item:InitApplicationMessage.maritalStatusesEN){
					if(lifePersonalDetails.getMartialStatus().equals(item.getItemCode())){
						lifePersonalDetails.setMartialStatusEnName(item.getItemDesc());
						break;
					}
				}
				for(OptionItemDesc item:InitApplicationMessage.maritalStatusesCN){
					if(lifePersonalDetails.getMartialStatus().equals(item.getItemCode())){
						lifePersonalDetails.setMartialStatusCnName(item.getItemDesc());
						break;
					}
				}
			}
			lifePersonalDetails.setPlaceOfBirth(policyApplication.getApplicantPlaceOfBirth()!=null?policyApplication.getApplicantPlaceOfBirth():"");
			if(!"".equals(lifePersonalDetails.getPlaceOfBirth())){
				for(OptionItemDesc item:InitApplicationMessage.placeOfBirthEN){
					if(lifePersonalDetails.getPlaceOfBirth().equals(item.getItemCode())){
						lifePersonalDetails.setPlaceOfBirthEnName(item.getItemDesc());
						break;
					}
				}
				for(OptionItemDesc item:InitApplicationMessage.placeOfBirthCN){
					if(lifePersonalDetails.getPlaceOfBirth().equals(item.getItemCode())){
						lifePersonalDetails.setPlaceOfBirthCnName(item.getItemDesc());
						break;
					}
				}
			}
			lifePersonalDetails.setNationalty(policyApplication.getApplicantNationality()!=null?policyApplication.getApplicantNationality():"");
			if(!"".equals(lifePersonalDetails.getNationalty())){
				for(OptionItemDesc item:InitApplicationMessage.nationalityEN){
					if(lifePersonalDetails.getNationalty().equals(item.getItemCode())){
						lifePersonalDetails.setNationaltyEnName(item.getItemDesc());
						break;
					}
				}
				for(OptionItemDesc item:InitApplicationMessage.nationalityCN){
					if(lifePersonalDetails.getNationalty().equals(item.getItemCode())){
						lifePersonalDetails.setNationaltyCnName(item.getItemDesc());
						break;
					}
				}
			}
			
			
			
			lifePersonalDetails.setResidentialTelNoCountryCode(policyApplication.getApplicantResidentialTelNoCountryCode()!=null?policyApplication.getApplicantResidentialTelNoCountryCode():"");
			lifePersonalDetails.setResidentialTelNo(policyApplication.getApplicantResidentialTelNo()!=null?policyApplication.getApplicantResidentialTelNo():"");
			lifePersonalDetails.setMobileNoCountryCode(policyApplication.getApplicantMobileNoCountryCode()!=null?policyApplication.getApplicantMobileNoCountryCode():"");
			lifePersonalDetails.setMobileNumber(Methods.formatMobile(policyApplication.getApplicantMobileNo()!=null?policyApplication.getApplicantMobileNo():""));
			lifePersonalDetails.setEmailAddress(policyApplication.getApplicantEmail()!=null?policyApplication.getApplicantEmail():"");
			lifePersonalDetails.setResidentialAddress1(policyApplication.getResidentialAddress1()!=null?policyApplication.getResidentialAddress1():"");
			lifePersonalDetails.setResidentialAddress2(policyApplication.getResidentialAddress2()!=null?policyApplication.getResidentialAddress2():"");
			lifePersonalDetails.setResidentialAddress3(policyApplication.getResidentialAddress3()!=null?policyApplication.getResidentialAddress3():"");
			lifePersonalDetails.setResidentialAddress4(policyApplication.getResidentialAddress4()!=null?policyApplication.getResidentialAddress4():"");
			lifePersonalDetails.setResidentialAddressDistrict(policyApplication.getResidentialDistrict()!=null?policyApplication.getResidentialDistrict():"");
			if(!"".equals(lifePersonalDetails.getResidentialAddressDistrict())){
				for(OptionItemDesc item:InitApplicationMessage.savieDistrictEN){
					if(lifePersonalDetails.getResidentialAddressDistrict().equals(item.getItemCode())){
						lifePersonalDetails.setResidentialAddressDistrictEnName(item.getItemDesc());
						break;
					}
				}
				for(OptionItemDesc item:InitApplicationMessage.savieDistrictCN){
					if(lifePersonalDetails.getResidentialAddressDistrict().equals(item.getItemCode())){
						lifePersonalDetails.setResidentialAddressDistrictCnName(item.getItemDesc());
						break;
					}
				}
			}
			lifePersonalDetails.setCorrespondenceAddress1(policyApplication.getCorrespondenceAddress1()!=null?policyApplication.getCorrespondenceAddress1():"");
			lifePersonalDetails.setCorrespondenceAddress2(policyApplication.getCorrespondenceAddress2()!=null?policyApplication.getCorrespondenceAddress2():"");
			lifePersonalDetails.setCorrespondenceAddress3(policyApplication.getCorrespondenceAddress3()!=null?policyApplication.getCorrespondenceAddress3():"");
			lifePersonalDetails.setCorrespondenceAddress4(policyApplication.getCorrespondenceAddress4()!=null?policyApplication.getCorrespondenceAddress4():"");
			lifePersonalDetails.setCorrespondenceAddressDistrict(policyApplication.getCorrespondenceDistrict()!=null?policyApplication.getCorrespondenceDistrict():"");
			if(!"".equals(lifePersonalDetails.getCorrespondenceAddressDistrict())){
				for(OptionItemDesc item:InitApplicationMessage.savieDistrictEN){
					if(lifePersonalDetails.getCorrespondenceAddressDistrict().equals(item.getItemCode())){
						lifePersonalDetails.setCorrespondenceAddressDistrictEnName(item.getItemDesc());
						break;
					}
				}
				for(OptionItemDesc item:InitApplicationMessage.savieDistrictCN){
					if(lifePersonalDetails.getCorrespondenceAddressDistrict().equals(item.getItemCode())){
						lifePersonalDetails.setCorrespondenceAddressDistrictCnName(item.getItemDesc());
						break;
					}
				}
			}
			lifePersonalDetails.setPermanetAddress1(policyApplication.getPermanentAddress1()!=null?policyApplication.getPermanentAddress1():"");
			lifePersonalDetails.setPermanetAddress2(policyApplication.getPermanentAddress2()!=null?policyApplication.getPermanentAddress2():"");
			lifePersonalDetails.setPermanetAddress3(policyApplication.getPermanentAddress3()!=null?policyApplication.getPermanentAddress3():"");
			lifePersonalDetails.setPermanetAddress4(policyApplication.getPermanentAddress4()!=null?policyApplication.getPermanentAddress4():"");
			lifePersonalDetails.setPermanetAddressDistrict(policyApplication.getPermanentDistrict()!=null?policyApplication.getPermanentDistrict():"");
			if(!"".equals(lifePersonalDetails.getPermanetAddressDistrict())){
				for(OptionItemDesc item:InitApplicationMessage.savieDistrictEN){
					if(lifePersonalDetails.getPermanetAddressDistrict().equals(item.getItemCode())){
						lifePersonalDetails.setPermanetAddressDistrictEnName(item.getItemDesc());
						break;
					}
				}
				for(OptionItemDesc item:InitApplicationMessage.savieDistrictCN){
					if(lifePersonalDetails.getPermanetAddressDistrict().equals(item.getItemCode())){
						lifePersonalDetails.setPermanetAddressDistrictCnName(item.getItemDesc());
						break;
					}
				}
			}
			lifePersonalDetails.setDiffToPermanent(policyApplication.getAddressDiffToPermanent()!=null?policyApplication.getAddressDiffToPermanent():"");
			lifePersonalDetails.setDiffToResidential(policyApplication.getAddressDiffToResidential()!=null?policyApplication.getAddressDiffToResidential():"");
			request.getSession().setAttribute("lifePersonalDetails", lifePersonalDetails);
			
			LifeEmploymentInfoBean lifeEmploymentInfo = (LifeEmploymentInfoBean) request.getSession().getAttribute("lifeEmploymentInfo");
			if(lifeEmploymentInfo==null){
				lifeEmploymentInfo = new LifeEmploymentInfoBean();
			}
			lifeEmploymentInfo.setEmploymentStatus(policyApplication.getEmploymentStatus()!=null?policyApplication.getEmploymentStatus():"");
			if(!"".equals(lifeEmploymentInfo.getEmploymentStatus())){
				for(OptionItemDesc item:InitApplicationMessage.employmentStatusEN){
					if(lifeEmploymentInfo.getEmploymentStatus().equals(item.getItemCode())){
						lifeEmploymentInfo.setEmploymentStatusEnName(item.getItemDesc());
						break;
					}
				}
				for(OptionItemDesc item:InitApplicationMessage.employmentStatusCN){
					if(lifeEmploymentInfo.getEmploymentStatus().equals(item.getItemCode())){
						lifeEmploymentInfo.setEmploymentStatusCnName(item.getItemDesc());
						break;
					}
				}
			}
			lifeEmploymentInfo.setNatureOfBusiness(policyApplication.getNatureOfBusiness()!=null?policyApplication.getNatureOfBusiness():"");
			if(!"".equals(lifeEmploymentInfo.getNatureOfBusiness())){
				for(OptionItemDesc item:InitApplicationMessage.natureOfBusinessEN){
					if(lifeEmploymentInfo.getNatureOfBusiness().equals(item.getItemCode())){
						lifeEmploymentInfo.setNatureOfBusinessEnName(item.getItemDesc());
						break;
					}
				}
				for(OptionItemDesc item:InitApplicationMessage.natureOfBusinessCN){
					if(lifeEmploymentInfo.getNatureOfBusiness().equals(item.getItemCode())){
						lifeEmploymentInfo.setNatureOfBusinessCnName(item.getItemDesc());
						break;
					}
				}
			}
			lifeEmploymentInfo.setOccupation(policyApplication.getOccupation()!=null?policyApplication.getOccupation():"");
			lifeEmploymentInfo.setOtherOccupation(policyApplication.getOtherOccupation()!=null?policyApplication.getOtherOccupation():"");
			if(!"".equals(lifeEmploymentInfo.getOccupation())){
				for(OptionItemDesc item:InitApplicationMessage.getOccupationByNob(commonUtils, lifeEmploymentInfo.getNatureOfBusiness(), "EN", "1", request)){
					if(lifeEmploymentInfo.getOccupation().equals(item.getItemCode())){
						lifeEmploymentInfo.setOccupationEnName(item.getItemDesc());
						break;
					}
				}
				for(OptionItemDesc item:InitApplicationMessage.getOccupationByNob(commonUtils, lifeEmploymentInfo.getNatureOfBusiness(), "CH", "1", request)){
					if(lifeEmploymentInfo.getOccupation().equals(item.getItemCode())){
						lifeEmploymentInfo.setOccupationCnName(item.getItemDesc());
						break;
					}
				}
			}
			lifeEmploymentInfo.setMonthlyPersonalIncome(policyApplication.getMonthlyPersonalIncome()!=null?policyApplication.getMonthlyPersonalIncome():"");
			if(!"".equals(lifeEmploymentInfo.getMonthlyPersonalIncome())){
				for(OptionItemDesc item:InitApplicationMessage.monthlyPersonalIncomeEN){
					if(lifeEmploymentInfo.getMonthlyPersonalIncome().equals(item.getItemCode())){
						lifeEmploymentInfo.setMonthlyPersonalIncomeEnName(item.getItemDesc());
						break;
					}
				}
				for(OptionItemDesc item:InitApplicationMessage.monthlyPersonalIncomeCN){
					if(lifeEmploymentInfo.getMonthlyPersonalIncome().equals(item.getItemCode())){
						lifeEmploymentInfo.setMonthlyPersonalIncomeCnName(item.getItemDesc());
						break;
					}
				}
			}
			lifeEmploymentInfo.setEducation(policyApplication.getEducationLevel()!=null?policyApplication.getEducationLevel():"");
			if(!"".equals(lifeEmploymentInfo.getEducation())){
				for(OptionItemDesc item:InitApplicationMessage.etEducationLevelEN){
					if(lifeEmploymentInfo.getEducation().equals(item.getItemCode())){
						lifeEmploymentInfo.setEducationEnName(item.getItemDesc());
						break;
					}
				}
				for(OptionItemDesc item:InitApplicationMessage.etEducationLevelCN){
					if(lifeEmploymentInfo.getEducation().equals(item.getItemCode())){
						lifeEmploymentInfo.setEducationCnName(item.getItemDesc());
						break;
					}
				}
			}
			lifeEmploymentInfo.setAmountOfOtherSourceOfIncome(policyApplication.getAmountOtherSource()!=null?policyApplication.getAmountOtherSource():"");
			if(!"".equals(lifeEmploymentInfo.getAmountOfOtherSourceOfIncome())){
				for(OptionItemDesc item:InitApplicationMessage.etAmountOtherSourceEN){
					if(lifeEmploymentInfo.getAmountOfOtherSourceOfIncome().equals(item.getItemCode())){
						lifeEmploymentInfo.setAmountOfOtherSourceOfIncomeEnName(item.getItemDesc());
						break;
					}
				}
				for(OptionItemDesc item:InitApplicationMessage.etAmountOtherSourceCN){
					if(lifeEmploymentInfo.getAmountOfOtherSourceOfIncome().equals(item.getItemCode())){
						lifeEmploymentInfo.setAmountOfOtherSourceOfIncomeCnName(item.getItemDesc());
						break;
					}
				}
			}
			lifeEmploymentInfo.setAmountOfLiquidAssets(policyApplication.getLiquidAssest()!=null?policyApplication.getLiquidAssest():"");
			if(!"".equals(lifeEmploymentInfo.getAmountOfLiquidAssets())){
				for(OptionItemDesc item:InitApplicationMessage.etLiquidAssetEN){
					if(lifeEmploymentInfo.getAmountOfLiquidAssets().equals(item.getItemCode())){
						lifeEmploymentInfo.setAmountOfLiquidAssetsEnName(item.getItemDesc());
						break;
					}
				}
				for(OptionItemDesc item:InitApplicationMessage.etLiquidAssetCN){
					if(lifeEmploymentInfo.getAmountOfLiquidAssets().equals(item.getItemCode())){
						lifeEmploymentInfo.setAmountOfLiquidAssetsCnName(item.getItemDesc());
						break;
					}
				}
			}
			lifeEmploymentInfo.setEmployerName(policyApplication.getEmployerName()!=null?policyApplication.getEmployerName():"");
			request.getSession().setAttribute("lifeEmploymentInfo", lifeEmploymentInfo);
			
			LifeBeneficaryInfoBean lifeBeneficaryInfo = (LifeBeneficaryInfoBean) request.getSession().getAttribute("lifeBeneficaryInfo");
			if(lifeBeneficaryInfo==null){
				lifeBeneficaryInfo = new LifeBeneficaryInfoBean();
			}
			lifeBeneficaryInfo.setIsOwnEstate(policyApplication.getIsOwnEstate()!=null?policyApplication.getIsOwnEstate():false);
			lifeBeneficaryInfo.setBeneficaryFirstName1(policyApplication.getBeneficiaryFirstName1()!=null?policyApplication.getBeneficiaryFirstName1():"");
			lifeBeneficaryInfo.setBeneficaryLastName1(policyApplication.getBeneficiaryLastName1()!=null?policyApplication.getBeneficiaryLastName1():"");
			lifeBeneficaryInfo.setBeneficaryChineseName1(policyApplication.getBeneficiaryChineseName1()!=null?policyApplication.getBeneficiaryChineseName1():"");
			lifeBeneficaryInfo.setBeneficiaryHkidPassport1(policyApplication.getBeneficiaryHkidPassport1()!=null?policyApplication.getBeneficiaryHkidPassport1():"");
			lifeBeneficaryInfo.setBeneficaryID1(policyApplication.getBeneficiaryHkId1()!=null?policyApplication.getBeneficiaryHkId1():"");
			lifeBeneficaryInfo.setBeneficiaryPassport1(policyApplication.getBeneficiaryPassport1()!=null?policyApplication.getBeneficiaryPassport1():"");
			lifeBeneficaryInfo.setBeneficaryGender1(policyApplication.getBeneficiaryGender1()!=null?policyApplication.getBeneficiaryGender1():"");
			lifeBeneficaryInfo.setBeneficaryRelation1(policyApplication.getBeneficiaryRelationship1()!=null?policyApplication.getBeneficiaryRelationship1():"");
			if(!"".equals(lifeBeneficaryInfo.getBeneficaryRelation1())){
				for(OptionItemDesc item:InitApplicationMessage.lifeBeneficiaryRelationshipEN){
					if(lifeBeneficaryInfo.getBeneficaryRelation1().equals(item.getItemCode())){
						lifeBeneficaryInfo.setBeneficaryRelationEnName1(item.getItemDesc());
						break;
					}
				}
				for(OptionItemDesc item:InitApplicationMessage.lifeBeneficiaryRelationshipCN){
					if(lifeBeneficaryInfo.getBeneficaryRelation1().equals(item.getItemCode())){
						lifeBeneficaryInfo.setBeneficaryRelationCnName1(item.getItemDesc());
						break;
					}
				}
			}
			lifeBeneficaryInfo.setBeneficaryWeight1(policyApplication.getBeneficiaryEntitlement1()!=null?policyApplication.getBeneficiaryEntitlement1():"");
			lifeBeneficaryInfo.setBeneficaryFirstName2(policyApplication.getBeneficiaryFirstName2()!=null?policyApplication.getBeneficiaryFirstName2():"");
			lifeBeneficaryInfo.setBeneficaryLastName2(policyApplication.getBeneficiaryLastName2()!=null?policyApplication.getBeneficiaryLastName2():"");
			lifeBeneficaryInfo.setBeneficaryChineseName2(policyApplication.getBeneficiaryChineseName2()!=null?policyApplication.getBeneficiaryChineseName2():"");
			lifeBeneficaryInfo.setBeneficiaryHkidPassport2(policyApplication.getBeneficiaryHkidPassport2()!=null?policyApplication.getBeneficiaryHkidPassport2():"");
			lifeBeneficaryInfo.setBeneficaryID2(policyApplication.getBeneficiaryHkId2()!=null?policyApplication.getBeneficiaryHkId2():"");
			lifeBeneficaryInfo.setBeneficiaryPassport2(policyApplication.getBeneficiaryPassport2()!=null?policyApplication.getBeneficiaryPassport2():"");
			lifeBeneficaryInfo.setBeneficaryGender2(policyApplication.getBeneficiaryGender2()!=null?policyApplication.getBeneficiaryGender2():"");
			lifeBeneficaryInfo.setBeneficaryRelation2(policyApplication.getBeneficiaryRelationship2()!=null?policyApplication.getBeneficiaryRelationship2():"");
			if(!"".equals(lifeBeneficaryInfo.getBeneficaryRelation2())){
				for(OptionItemDesc item:InitApplicationMessage.lifeBeneficiaryRelationshipEN){
					if(lifeBeneficaryInfo.getBeneficaryRelation2().equals(item.getItemCode())){
						lifeBeneficaryInfo.setBeneficaryRelationEnName2(item.getItemDesc());
						break;
					}
				}
				for(OptionItemDesc item:InitApplicationMessage.lifeBeneficiaryRelationshipCN){
					if(lifeBeneficaryInfo.getBeneficaryRelation2().equals(item.getItemCode())){
						lifeBeneficaryInfo.setBeneficaryRelationCnName2(item.getItemDesc());
						break;
					}
				}
			}
			lifeBeneficaryInfo.setBeneficaryWeight2(policyApplication.getBeneficiaryEntitlement2()!=null?policyApplication.getBeneficiaryEntitlement2():"");
			lifeBeneficaryInfo.setBeneficaryFirstName3(policyApplication.getBeneficiaryFirstName3()!=null?policyApplication.getBeneficiaryFirstName3():"");
			lifeBeneficaryInfo.setBeneficaryLastName3(policyApplication.getBeneficiaryLastName3()!=null?policyApplication.getBeneficiaryLastName3():"");
			lifeBeneficaryInfo.setBeneficaryChineseName3(policyApplication.getBeneficiaryChineseName3()!=null?policyApplication.getBeneficiaryChineseName3():"");
			lifeBeneficaryInfo.setBeneficiaryHkidPassport3(policyApplication.getBeneficiaryHkidPassport3()!=null?policyApplication.getBeneficiaryHkidPassport3():"");
			lifeBeneficaryInfo.setBeneficaryID3(policyApplication.getBeneficiaryHkId3()!=null?policyApplication.getBeneficiaryHkId3():"");
			lifeBeneficaryInfo.setBeneficiaryPassport3(policyApplication.getBeneficiaryPassport3()!=null?policyApplication.getBeneficiaryPassport3():"");
			lifeBeneficaryInfo.setBeneficaryGender3(policyApplication.getBeneficiaryGender3()!=null?policyApplication.getBeneficiaryGender3():"");
			lifeBeneficaryInfo.setBeneficaryRelation3(policyApplication.getBeneficiaryRelationship3()!=null?policyApplication.getBeneficiaryRelationship3():"");
			if(!"".equals(lifeBeneficaryInfo.getBeneficaryRelation3())){
				for(OptionItemDesc item:InitApplicationMessage.lifeBeneficiaryRelationshipEN){
					if(lifeBeneficaryInfo.getBeneficaryRelation3().equals(item.getItemCode())){
						lifeBeneficaryInfo.setBeneficaryRelationEnName3(item.getItemDesc());
						break;
					}
				}
				for(OptionItemDesc item:InitApplicationMessage.lifeBeneficiaryRelationshipCN){
					if(lifeBeneficaryInfo.getBeneficaryRelation3().equals(item.getItemCode())){
						lifeBeneficaryInfo.setBeneficaryRelationCnName3(item.getItemDesc());
						break;
					}
				}
			}
			lifeBeneficaryInfo.setBeneficaryWeight3(policyApplication.getBeneficiaryEntitlement3()!=null?policyApplication.getBeneficiaryEntitlement3():"");
			request.getSession().setAttribute("lifeBeneficaryInfo", lifeBeneficaryInfo);
			
			LifePaymentBean lifePayment = (LifePaymentBean) request.getSession().getAttribute("lifePayment");
			if(lifePayment==null){
				lifePayment = new LifePaymentBean();
			}
			lifePayment.setPaymentMethod(policyApplication.getPaymentMethod()!=null?policyApplication.getPaymentMethod():"");
			lifePayment.setBankCode(policyApplication.getBankName()!=null?policyApplication.getBankName():"");
			if(!"".equals(lifePayment.getBankCode())){
				for(OptionItemDesc item:InitApplicationMessage.bankCodeEN){
					if(lifePayment.getBankCode().equals(item.getItemCode())){
						lifePayment.setBankEnName(item.getItemDesc());
						break;
					}
				}
				for(OptionItemDesc item:InitApplicationMessage.bankCodeCN){
					if(lifePayment.getBankCode().equals(item.getItemCode())){
						lifePayment.setBankCnName(item.getItemDesc());
						break;
					}
				}
			}
			lifePayment.setBranchCode(policyApplication.getBranchName()!=null?policyApplication.getBranchName():"");
			if(!"".equals(lifePayment.getBranchCode())){
				for(OptionItemDesc item:InitApplicationMessage.getOccupationByNob(commonUtils, lifePayment.getBankCode(), "EN", "1", request)){
					if(lifePayment.getBranchCode().equals(item.getItemCode())){
						lifePayment.setBranchEnName(item.getItemDesc());
						break;
					}
				}
				for(OptionItemDesc item:InitApplicationMessage.getOccupationByNob(commonUtils, lifePayment.getBankCode(), "CH", "1", request)){
					if(lifePayment.getBranchCode().equals(item.getItemCode())){
						lifePayment.setBranchCnName(item.getItemDesc());
						break;
					}
				}
			}
			lifePayment.setAccountNumber(policyApplication.getAccountNo()!=null?policyApplication.getAccountNo():"");
			lifePayment.setPaymentAmount(policyApplication.getAmount());
			lifePayment.setAccountHolderName(policyApplication.getAccountHolderName()!=null?policyApplication.getAccountHolderName():"");
			request.getSession().setAttribute("lifePayment", lifePayment);
			
			LifeDeclarationBean lifeDeclaration = (LifeDeclarationBean) request.getSession().getAttribute("lifeDeclaration");
			if(lifeDeclaration==null){
				lifeDeclaration = new LifeDeclarationBean();
			}
			lifeDeclaration.setHasReadAndAcceptFATC(policyApplication.getDeclaration1()!=null?policyApplication.getDeclaration1():false);
			lifeDeclaration.setHasReadAndAcceptFATC2(policyApplication.getDeclaration2()!=null?policyApplication.getDeclaration2():false);
			lifeDeclaration.setHasReadAndAcceptPICS(policyApplication.getDeclaration3()!=null?policyApplication.getDeclaration3():false);
			lifeDeclaration.setHaveReplaced(policyApplication.getDeclaration4()!=null?policyApplication.getDeclaration4():false);
			lifeDeclaration.setIntentToReplaced(policyApplication.getDeclaration5()!=null?policyApplication.getDeclaration5():false);
			lifeDeclaration.setHasReadAndAcceptCancellation(policyApplication.getDeclaration6()!=null?policyApplication.getDeclaration6():false);
			lifeDeclaration.setIntentToLiveOutside(policyApplication.getDeclaration7()!=null?policyApplication.getDeclaration7():false);
			lifeDeclaration.setHasReadAndAgreeApplication(policyApplication.getDeclaration8()!=null?policyApplication.getDeclaration8():false);
			lifeDeclaration.setChkboxDoNotSendMarketingInfo(policyApplication.getDeclaration9()!=null?policyApplication.getDeclaration9():false);
			lifeDeclaration.setChkboxDoNotProvidePersonalData(policyApplication.getDeclaration10()!=null?policyApplication.getDeclaration10():false);
			request.getSession().setAttribute("lifeDeclaration", lifeDeclaration);
			
			CreateEliteTermPolicyResponse lifePolicy = (CreateEliteTermPolicyResponse) request.getSession().getAttribute("lifePolicy");
			if(lifePolicy==null){
				lifePolicy = new CreateEliteTermPolicyResponse();
			}
			lifePolicy.setPolicyNo(policyApplication.getPolicyNo()!=null?policyApplication.getPolicyNo():"");
			request.getSession().setAttribute("lifePolicy", lifePolicy);
			
			request.getSession().setAttribute("policyNo", policyApplication.getPolicyNo());
			request.getSession().setAttribute("amount", policyApplication.getAmount());
			
			if(policyApplication.getResumeViewPage().endsWith("personal-details")){
				request.getSession().setAttribute("fatcaYes", "fatcaYes");   
			}
			if(policyApplication.getResumeViewPage().endsWith("declaration")){
				request.getSession().setAttribute("applicationSummaryYes", "applicationSummaryYes");
			}
		}
		return apiResponse;
	}
	
	private String formatNumber(String num){
		if(num.contains(".")){
			num = num.split("\\.")[0];
		}
		return num;
	}
	
	public BaseResponse sendImage(HttpServletRequest request,String passportFlage,String plan) throws ECOMMAPIException{
		BaseResponse apiReturn = new BaseResponse();
		apiReturn.setErrMsg(null);
		FileInputStream is = null;
		BaseResponse br = null;
		String planCode = null;
		logger.debug("plan : "+plan);
		if("savings-insurance".equals(plan)){
			planCode = "SAVIE-SP";
		}else if("cansurance".equals(plan)){
			planCode = "HCP1";
		}else if("medical-insurance/cansurance".equals(plan)){
			planCode = "HCP1";
		}
		
		
		else{
			planCode = "ROPHI1";
		}
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
			parameters.put("planCode", planCode);
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
				String[] errMsgs=br.getErrMsgs();
				for(int l=0;l<errMsgs.length;l++)
				{
					logger.error(errMsgs[l].toString());
				}
				//logger.info(br.getErrMsgs().toString());
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
					String[] errMsgs=br.getErrMsgs();
					for(int l=0;l<errMsgs.length;l++)
					{
						logger.error(errMsgs[l].toString());
					}
					//logger.info(br.getErrMsgs().toString());
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
				String[] errMsgs=br.getErrMsgs();
				for(int l=0;l<errMsgs.length;l++)
				{
					logger.error(errMsgs[l].toString());
				}
				//logger.info(br.getErrMsgs().toString());
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
			logger.error("EliteTermServiceImpl sendImage occurs an exception!");
			logger.error(e.getMessage());
			e.printStackTrace();
			apiReturn.setErrMsg(e.getMessage());
			return apiReturn;
		}catch(Exception e){
			logger.error("EliteTermServiceImpl sendImage occurs an exception!");
			logger.error(e.getMessage());
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
	        parameters.put("planCode", request.getParameter("planCode"));
			
			parameters.put("fileType", "jpg");
			parameters.put("documentType", "signature");
			parameters.put("originalFilePath", "");
			parameters.put("base64", image);
			parameters.put("policyNo", lifePolicy.getPolicyNo());
			
			br = connector.uploadSignature(parameters, header);	
		} catch (ECOMMAPIException e) {
			logger.error("EliteTermServiceImpl uploadSignature occurs an exception!");
			logger.error(e.getMessage());
			e.printStackTrace();
		} catch (Exception e) {
			logger.error("EliteTermServiceImpl uploadSignature occurs an exception!");
			logger.error(e.getMessage());
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
		session.removeAttribute("type");
		session.removeAttribute("sendEmailsYes");
		session.removeAttribute("fatcaYes");
		logger.info("remove savie online session");
	}
	
	public void removeProvieOnlineSession(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.removeAttribute("proviePlanDetails");
		session.removeAttribute("provieplanDetailData");
		session.removeAttribute("savieFna");
		session.removeAttribute("productRecommendation");
		session.removeAttribute("lifePersonalDetails");
		session.removeAttribute("lifeEmploymentInfo");
		session.removeAttribute("lifeBeneficaryInfo");
		session.removeAttribute("lifePayment");
		session.removeAttribute("lifeDeclaration");
		session.removeAttribute("lifePolicy");
		session.removeAttribute("type");
		session.removeAttribute("sendEmailsYes");
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
			String appointmentTypeId = request.getParameter("appointmentTypeId");
			request.getSession().setAttribute("csCenter", csCenter);
			request.getSession().setAttribute("perferredDate", perferredDate);
			request.getSession().setAttribute("appointmentTypeId", appointmentTypeId);
			String Url = UserRestURIConstants.SERVICE_URL + "/appointment/timeSlot?date=" + perferredDate
					+ "&serviceCentreCode=" + csCenter + "&appointmentTypeId=" + appointmentTypeId;
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
				logger.error(responseJsonObj.toString());
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
		String appointmentTypeId = request.getParameter("appointmentTypeId");
		String planCode = request.getParameter("planCode");
		String policyNumber = "";
		String applicationNumber = "";
		String userName = (String)session.getAttribute("username");
		String status = "Active";
		String remarks = request.getParameter("remarks");
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
		logger.info(parameters.toString());
		org.json.simple.JSONObject appJsonObj = restService.consumeApi(HttpMethod.PUT, applicationUrl, header, parameters);
		applicationNumber = (String)appJsonObj.get("applicationNumber");
		session.setAttribute("applicationNumber", applicationNumber);
		
		session.removeAttribute("csCenter");
		session.removeAttribute("perferredDate");
		session.removeAttribute("perferredTime");
		session.removeAttribute("appointmentTypeId");
		
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
			parameters.put("appointmentTypeId", appointmentTypeId);
			
			logger.info(parameters.toString());
			org.json.simple.JSONObject makeJsonObj = restService.consumeApi(HttpMethod.POST, makeUrl, header, parameters);
			
			response.setContentType("text/json;charset=utf-8");
			try {
				logger.info(makeJsonObj.toString());
				response.getWriter().print(makeJsonObj.toString());
			}catch(Exception e) {  
				e.printStackTrace();
				logger.error(e.toString());
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
	 * @param model request session appointmentTypeId ,later:2; 其它:1;
	 * @return
	 */
	public void getCustomerServiceCentre(Model model, HttpServletRequest request, HttpSession session, String appointmentTypeId) {
		String lang = UserRestURIConstants.getLanaguage(request);
		String Url = UserRestURIConstants.SERVICE_URL + "/appointment/timeSlot/all?appointmentTypeId=" + appointmentTypeId;
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
		ServiceCentreResponse serviceCentreResponse;
		ServiceCentreResponse serviceCentre = new ServiceCentreResponse();
		if (lang.equals("CN")) {
			serviceCentreResponse = InitApplicationMessage.serviceCentreCN;
		}else {
			serviceCentreResponse =InitApplicationMessage.serviceCentreEN;
		}
		List<ServiceCentreResult> serviceCentreResultList = serviceCentreResponse.getServiceCentres();
		
		Map<String, ServiceCentreResult> entityMap = new HashMap<String, ServiceCentreResult>();
		Map<String, List<String>> datesMap = new HashMap<String, List<String>>();
		Map<String, String> defaultDate = new HashMap<String, String>();
		JSONArray datesArray;
		JSONObject dateObj;
		JSONObject datesObj;
		List<String> datesList;
		List<String> calendarList;
		long beforeDay = 86400000;
		long dateTime;
		JSONArray datesArrB;
		JSONObject dateObjB;
		long dateTimeB;
		
		JSONObject firstService = null;
		JSONObject compareService = null;
		ServiceCentreResult serviceCentreResult;
		if(serviceCentresArr!=null && serviceCentresArr.size()>0) {
			for(int i = 0; i < serviceCentreResultList.size(); i ++) {
				calendarList = DateApi.timeslot(2, 24);
				datesList = new ArrayList<String>();
				serviceCentreResult = serviceCentreResultList.get(i);
				for(int j = 0; j < serviceCentresArr.size(); j++) {
					compareService = (JSONObject) serviceCentresArr.get(j);
					if(serviceCentreResult.getServiceCentreCode().equals(compareService.get("serviceCentreCode"))) {
						datesArrB = (JSONArray) compareService.get("dates");
						dateObjB = getFirstDate(datesArrB);
						dateTimeB = (long) dateObjB.get("date");
						if(firstService == null) {
							firstService = compareService;
						}else {
							datesArray = (JSONArray) firstService.get("dates");
							dateObj = getFirstDate(datesArray);
							dateTime = (long) dateObj.get("date");
							if(dateTime>dateTimeB){
								firstService = compareService;
							}
						}
						
						entityMap.put(serviceCentreResult.getServiceCentreCode(), serviceCentreResult);
						datesArray = (JSONArray) compareService.get("dates");
						for(int k = 0; k< datesArray.size(); k++) {
							datesObj = (JSONObject)datesArray.get(k);
							datesList.add(DateApi.formatTime((long)datesObj.get("date") - beforeDay));
						}
						calendarList.removeAll(datesList);
						datesMap.put(serviceCentreResult.getServiceCentreCode(), calendarList);
						defaultDate.put(serviceCentreResult.getServiceCentreCode(), DateApi.formatTime2(dateTimeB));
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
		serviceCentre.setServiceCentres(results);
		model.addAttribute("serviceCentre", serviceCentre);
		model.addAttribute("datesMap", datesMap);
		model.addAttribute("defaultDate", defaultDate);
		model.addAttribute("results", results);
		if(firstService != null){
			session.setAttribute("csCenter", firstService.get("serviceCentreCode"));
			JSONArray datesArr = (JSONArray) firstService.get("dates");
			if(datesArr != null) {
				dateObj = (JSONObject) datesArr.get(0);
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
		
		String sendEmailsYes = (String) session.getAttribute("sendEmailsYes");
		
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
		models.put("accessCode", session.getAttribute("applicationNumber"));
		models.put("dateEn", preferredDate);
		models.put("timeSlotEn", preferredTime);
		models.put("centerEn", centerEn);
		models.put("centerAddEn", centerAddEn);
		
		models.put("dateCh", preferredDate);
		models.put("timeSlotCh", preferredTime);
		models.put("centerCh", centerCh);
		models.put("centerAddCh", centerAddCh);
		if(sendEmailsYes == null){
			sendEmails(request, action, models);
			request.getSession().setAttribute("sendEmailsYes", "sendEmailsYes");
		}
		
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
			logger.error("clearFna api error: apiReturn==null");
			throw new ECOMMAPIException("api error");
		}
		else if(apiReturn.hasError()) {
			String[] errMsgs=apiReturn.getErrMsgs();
			for(int l=0;l<errMsgs.length;l++)
			{
				logger.error(errMsgs[l].toString());
			}
			//logger.info(apiReturn.getErrMsgs()[0]);
			throw new ECOMMAPIException(apiReturn.getErrMsgs()[0]);
		}
	}
	
	public void sendEmailForSaveLater(HttpServletRequest request) throws ECOMMAPIException{
		UserDetails userDetails = (UserDetails) request.getSession().getAttribute("userDetails");
		String language = (String) request.getSession().getAttribute("language");
		
		String serverUrl = request.getScheme()+"://"+request.getServerName()+request.getContextPath();
		if (request.getServerPort() != 80 && request.getServerPort() != 443)
		{
			serverUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
		}
		
		JSONObject parameters = new JSONObject();
		parameters.put("to", userDetails.getEmailAddress());
		parameters.put("subject", "Your Savie application has not yet been completed!您的Savie自助息申請尚未完成!");
		JSONObject model = new JSONObject();
		   model.put("name", userDetails.getFullName());
		   model.put("resumeEnLink", serverUrl + "/en/savings-insurance/"+request.getParameter("key"));
		   model.put("resumeTcLink", serverUrl + "/tc/savings-insurance/"+request.getParameter("key"));
		parameters.put("model", model);
		parameters.put("template", "savie\\saveLater.html");
		logger.info(parameters.toString());
		
		BaseResponse apiReturn = null;
		final Map<String,String> header = headerUtil.getHeader1(request);
		apiReturn = connector.sendTemplateEmail(parameters, header);
		if(apiReturn==null){
			logger.error("sendEmailForSaveLater api error:apiReturn=null");
			throw new ECOMMAPIException("api error");
		}
		else if(apiReturn.hasError()) {
			String[] errMsgs=apiReturn.getErrMsgs();
			for(int l=0;l<errMsgs.length;l++)
			{
				logger.error(errMsgs[l].toString());
			}
			//logger.info(apiReturn.getErrMsgs()[0]);
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
			subject = "Savie Appointment Acknowledgement from FWD | Savie自助息理財預約申請確認";
			template = "savie\\payLater.html";
		}else if("uploadDocument".equals(action)) {
			CreateEliteTermPolicyResponse lifePolicy = (CreateEliteTermPolicyResponse) session.getAttribute("lifePolicy");
			subject = "FWD Savie Insurance Plan – Documents Upload [" + lifePolicy.getPolicyNo() + "] | 富衛Savie自助息 – 上載檔案 [" + lifePolicy.getPolicyNo() + "]";
			template = "savie\\uploadDocument.html";
		}else if("savieComplete".equals(action)) {
			CreateEliteTermPolicyResponse lifePolicy = (CreateEliteTermPolicyResponse) session.getAttribute("lifePolicy");
			subject = "Your online application of FWD Savie is completed! 您的富衛Savie自助息網上申請已完成！ (" + lifePolicy.getPolicyNo() + ")";
			template = "savie\\savieComplete.html";
		}else if("signLater".equals(action)) {
			subject = "Savie Appointment Acknowledgement from FWD | Savie自助息理財預約申請確認";
			template = "savie\\signLater.html";
		}else if("offlineApplication".equals(action)) {
			subject = "Savie Appointment Acknowledgement from FWD | Savie自助息理財預約申請確認";
			template = "savie\\offlineApplication.html";
		}else if("offlineApplication-rp".equals(action)) {
			subject = "Savie Appointment Acknowledgement from FWD | Savie自助息理財預約申請確認";
			template = "savie\\offlineApplication-rp.html";
		}else if("saveLater".equals(action)) {
			subject = "Your Savie application has not yet been completed!您的Savie自助息申請尚未完成!";
			template = "savie\\saveLater.html";
		}else if("payment".equals(action)) {
			subject = "payment";
			template = "savie\\payment.html";
		}else if("rophiComplete".equals(action)) {
			CreateEliteTermPolicyResponse lifePolicy = (CreateEliteTermPolicyResponse) session.getAttribute("lifePolicy");
			subject = "FWD Medical Insurance Plan - Complete [" + lifePolicy.getPolicyNo() + "] | 您的網上富衛醫療保險申請已完成！ [" + lifePolicy.getPolicyNo() + "]";
			template = "rophi\\rophiComplete.html";
		}else if("rophiUploadDocument".equals(action)) {
			CreateEliteTermPolicyResponse lifePolicy = (CreateEliteTermPolicyResponse) session.getAttribute("lifePolicy");
			subject = "FWD Medical Insurance Plan – Document Upload [" + lifePolicy.getPolicyNo() + "] | 富衛醫療保險 – 上載檔案 [" + lifePolicy.getPolicyNo() + "]";
			template = "rophi\\uploadDocument.html";
		}else if("cansuranceComplete".equals(action)) {
			CreateEliteTermPolicyResponse lifePolicy = (CreateEliteTermPolicyResponse) session.getAttribute("lifePolicy");
			subject = "FWD Medical Insurance Plan - Complete [" + lifePolicy.getPolicyNo() + "] | 您的網上富衛醫療保險申請已完成！ [" + lifePolicy.getPolicyNo() + "]";
			template = "cansurance\\cansuranceComplete.html";
		}else if("provie-o2o-rp".equals(action)) {
			subject = "Provie Appointment Acknowledgement from FWD | Provie真息揀理財壽險計劃申請確認";
			template = "provie\\provie-o2o-rp.html";
		}else if("provie-o2o-sp".equals(action)) {
			subject = "Provie Appointment Acknowledgement from FWD | Provie真息揀理財壽險計劃申請確認";
			template = "provie\\provie-o2o-sp.html";
		}else if("wealthree-o2o-sp".equals(action)) {
			subject = "Wealthree Appointment Acknowledgement from FWD | Wealthree真息揀理財壽險計劃申請確認";
			template = "wealthree\\wealthree-appointment-sp.html";
		}
		
		JSONObject parameters = new JSONObject();
		parameters.put("to", email);
		parameters.put("subject", subject);
		parameters.put("model", model);
		parameters.put("template", template);
		
		final Map<String,String> header = headerUtil.getHeader1(request);
		
		header.put("content-type", "application/json");
		logger.info("sendEmails : " + parameters.toString());
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.POST, Url, header, parameters);
		
		/* send email to operation team for case follow up */
		if("paylater".equals(action)				
				||"offlineApplication".equals(action)
				||"uploadDocument".equals(action)
				||"savieComplete".equals(action)
				||"signLater".equals(action)
				||"rophiComplete".equals(action)
				||"rophiUploadDocument".equals(action)){
				parameters = new JSONObject();
				parameters.put("to", UserRestURIConstants.getConfigs("innerMailTo"));
				parameters.put("subject", subject);
				parameters.put("model", model);
				parameters.put("template", template);
				responseJsonObj = restService.consumeApi(HttpMethod.POST, Url, header, parameters);		
		}				
		return responseJsonObj;
	}
	
	public void clearPolicyApplication(HttpServletRequest request) throws ECOMMAPIException{
		JSONObject parameters = new JSONObject();
		parameters.put("planCode", "SAVIE-SP");
		logger.info(parameters.toString());
		
		BaseResponse apiReturn = null;
		final Map<String,String> header = headerUtil.getHeader1(request);
		apiReturn = connector.clearPolicyApplication(parameters, header);
		
		HttpSession session = request.getSession();
		session.removeAttribute("lifePersonalDetails");
		session.removeAttribute("lifeEmploymentInfo");
		session.removeAttribute("lifeBeneficaryInfo");
		session.removeAttribute("lifePayment");
		session.removeAttribute("lifeDeclaration");
		logger.info("remove savie online session");
		
		if(apiReturn==null){
			logger.error("clearPolicyApplication api error:apiReturn=null");
			throw new ECOMMAPIException("api error");
		}
		else if(apiReturn.hasError()) {
			String[] errMsgs=apiReturn.getErrMsgs();
			for(int l=0;l<errMsgs.length;l++)
			{
				logger.error(errMsgs[l].toString());
			}
			//logger.info(apiReturn.getErrMsgs()[0]);
			throw new ECOMMAPIException(apiReturn.getErrMsgs()[0]);
		}
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
		
		/*if (policy.size() > 0) {
			request.getSession().setAttribute("errorMessageType", "alreadyUploaded");
			return true;
		}*/
		
		for(Object obj : policy) {
			JSONObject entity = (JSONObject)obj;
			String documentType = entity != null ? (String)entity.get("documentType") : "";
			if("hkid".equals(documentType)) {
				request.getSession().setAttribute("errorMessageType", "alreadyUploaded");
				return true;
			}
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
	
	public void deleteSaviePdf(HttpServletRequest request){
		String pdfPath = request.getRealPath("/").replace("\\", "/")+"/resources/pdf";
	    File file = new File(pdfPath);
	    if(!file.exists()){
	    	logger.error("file not exist"+pdfPath);
	    }
	    else if(!file.isDirectory()){
	    	logger.error("file error"+pdfPath);
	    }
	    else{
	    	String[] tempList = file.list();
	    	File temp = null;
	    	if(tempList!=null){
	    		for(int i=0;i<tempList.length;i++){
	    			if(pdfPath.endsWith(File.separator)){
			            temp = new File(pdfPath+tempList[i]);
			        }
			        else{
			            temp = new File(pdfPath+File.separator+tempList[i]);
			        }
			        if(temp.isFile()){
			            temp.delete();
			        }
			        if(temp.isDirectory()){
			        	//文件夹里面是模板，不删除。
			        }
			    }
	    	}
	    }
	}
	
	public void sendEmailForDocumentUploadLater(HttpServletRequest request) throws ECOMMAPIException{
		JSONObject models = new JSONObject();
		models.put("name", request.getSession().getAttribute("username"));
		String serverUrl = request.getScheme()+"://"+request.getServerName()+request.getContextPath();
		if (request.getServerPort() != 80 && request.getServerPort() != 443){
			serverUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
		}
		String language = (String) request.getSession().getAttribute("language");
		if(StringUtils.isEmpty(language)){
			language = "tc";
		}
		CreateEliteTermPolicyResponse lifePolicy = (CreateEliteTermPolicyResponse)request.getSession().getAttribute("lifePolicy");
		String url = serverUrl + "/"+language+"/savings-insurance/document-upload?policyNumber="+new sun.misc.BASE64Encoder().encode(lifePolicy.getPolicyNo().getBytes());
		models.put("uploadLink", url);
		JSONObject responseJsonObj = this.sendEmails(request, "uploadDocument", models);
		if(responseJsonObj==null){
			logger.error("sendEmailForDocumentUploadLater api error:responseJsonObj=null");
			throw new ECOMMAPIException("api error");
		}
		if(responseJsonObj.get("errMsgs") != null){
			logger.error(responseJsonObj.get("errMsgs").toString());
			throw new ECOMMAPIException(responseJsonObj.get("errMsgs").toString());
		}
	}
	
	public void partnerRegister(PartnerRegisterBean partnerRegisterDetails,HttpServletRequest request) throws ECOMMAPIException{
		String language = (String) request.getSession().getAttribute("language");
		final Map<String,String> header = headerUtil.getHeader1(request);
		JSONObject parameters = new JSONObject();
		parameters.put("name", partnerRegisterDetails.getContactName()==null?"":partnerRegisterDetails.getContactName());
		parameters.put("email", partnerRegisterDetails.getContactEmail()==null?"":partnerRegisterDetails.getContactEmail());
		parameters.put("industry", partnerRegisterDetails.getIndustryName()==null?"":partnerRegisterDetails.getIndustryName());
		parameters.put("location", partnerRegisterDetails.getCompanyLocation()==null?"":partnerRegisterDetails.getCompanyLocation());
		parameters.put("number", partnerRegisterDetails.getContactNum()==null?"":partnerRegisterDetails.getContactNum());
		parameters.put("companyName", partnerRegisterDetails.getCompanyName()==null?"":partnerRegisterDetails.getCompanyName());
		parameters.put("message", partnerRegisterDetails.getDescriptionMsg()==null?"":partnerRegisterDetails.getDescriptionMsg());
		logger.info(parameters.toString());
		BaseResponse apiReturn = connector.partnerRegister(parameters, header);
		
		if(apiReturn!=null && apiReturn.hasError()) {
			String[] errMsgs=apiReturn.getErrMsgs();
			for(int l=0;l<errMsgs.length;l++)
			{
				logger.error(errMsgs[l].toString());
			}
			//logger.info(apiReturn.getErrMsgs()[0]);
			throw new ECOMMAPIException(apiReturn.getErrMsgs()[0]);
		} else {
			sendMailToNewPartner(partnerRegisterDetails, request);
		}
	}


	@Override
	public void sendMailToNewPartner(PartnerRegisterBean partnerRegisterDetails,HttpServletRequest request) throws ECOMMAPIException {
		
		try {
			String from = UserRestURIConstants.getConfigs("becomePartnerMailTo");
			String subject = "New Partner – Partner_" + partnerRegisterDetails.getCompanyName();
			
			String serverUrl = request.getScheme()+"://"+request.getServerName()+request.getContextPath();
			if (request.getServerPort() != 80 && request.getServerPort() != 443)
			{
				serverUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
			}
			
			String imageUrl  = serverUrl +"/resources/images/ifwd_hero-banner_edm.jpg";
			String message = " <body>  "+
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
							"                         <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">Dear,</span></span></p>  "+
							"                         <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">New partner contact with below information </p>  "+
							"                         <div>"+
							"                          <table border=\"0\" cellpadding=\"3\" cellspacing=\"0\" width=\"100%\" align=\"left\" style=\"background-color: #b9d8f3;\">"+
							"                                 <tr style=\"text-align: left; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold\"><td font size=\"2\">Name</td><td font size=\"2\" style=\"word-break:break-all;word-wrap:break-word\">"+partnerRegisterDetails.getContactName()+"</td></tr>"+
							"                                 <tr style=\"text-align: left; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold\"><td font size=\"2\">Email</td><td font size=\"2\" style=\"word-break:break-all;word-wrap:break-word\">"+partnerRegisterDetails.getContactEmail()+"</td></tr>"+		
							"                                 <tr style=\"text-align: left; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold\"><td font size=\"2\">Industry</td><td font size=\"2\" style=\"word-break:break-all;word-wrap:break-word\">"+partnerRegisterDetails.getIndustryName()+"</td></tr>"+
							"                                 <tr style=\"text-align: left; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold\"><td font size=\"2\">Location</td><td font size=\"2\" style=\"word-break:break-all;word-wrap:break-word\">"+partnerRegisterDetails.getCompanyLocation()+"</td></tr>"+
							"                                 <tr style=\"text-align: left; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold\"><td font size=\"2\">Number</td><td font size=\"2\" style=\"word-break:break-all;word-wrap:break-word\">"+partnerRegisterDetails.getContactNum()+"</td></tr>"+
							"                                 <tr style=\"text-align: left; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold\"><td font size=\"2\">Company Name</td><td font size=\"2\" style=\"word-break:break-all;word-wrap:break-word\">"+partnerRegisterDetails.getCompanyName()+"</td></tr>"+
							"                                 <tr style=\"text-align: left; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold\"><td font size=\"2\">Message</td><td font size=\"2\" style=\"word-break:break-all;word-wrap:break-word\">"+partnerRegisterDetails.getDescriptionMsg()+"</td></tr>"+
							"  							</table>"+
							" 						</div><br><br>"+
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
			
			final Map<String,String> headerEmail = headerUtil.getHeader1(request);
			String attachment = "";
			boolean isHTML = true;
			String[] emailList = {UserRestURIConstants.getConfigs("becomePartnerMailTo")};
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
			logger.error("SavieOnlineServiceImpl sendEmailToNewPartner occurs an exception!");
			logger.error(e.getMessage());
			e.printStackTrace();
		}				
	}
	
	public void validateSimpleChinese(String str,HttpServletRequest request) throws Exception{
		if(ZHConverter.hasSimpleChinese(str)) {
			throw new Exception("hasSimpleChinese");
		}
	}
	
	/**
	 * 获取日期最早的服务中心
	 * @param arr
	 * @return
	 */
	private JSONObject getFirstDate(JSONArray arr) {
		long arrDate = 0;
		long firstDate = 0;
		JSONObject result = null;
				
		for(Object entity : arr) {
			arrDate = (long)((JSONObject)entity).get("date");
			if(firstDate == 0 || firstDate > arrDate) {
				firstDate = arrDate;
				result = (JSONObject)entity;
			}
		}
		return result;
	}
	
	public void getSavieApplicationByHkId(String hkid,HttpServletRequest request) throws ECOMMAPIException {
		String Url = UserRestURIConstants.SERVICE_URL + "/savie/application/hkid";
		final Map<String,String> header = headerUtil.getHeader(request);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("hkId", hkid);
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.POST,Url, header, jsonObject);
		logger.info("***********responseJsonObj****************:"+responseJsonObj);
		
		if(responseJsonObj==null){
			logger.error("getSavieApplicationByHkId data error: responseJsonObj=null");
			throw new ECOMMAPIException("data error");
		}
		else{
			if (responseJsonObj.get("errMsgs") == null) {
				JSONArray jsonArray = (JSONArray) responseJsonObj.get("policies");
				if(jsonArray.size()>0){
					throw new ECOMMAPIException("you can only buy one savie");
				}
			}
			else{
				logger.error(responseJsonObj.get("errMsgs").toString());
				throw new ECOMMAPIException(responseJsonObj.get("errMsgs").toString());
			}
		}
	}
	
	public void getSavieApplicationByHkIdPlanCode(String hkid,String planCode,HttpServletRequest request) throws ECOMMAPIException {
		String Url = UserRestURIConstants.SERVICE_URL + "/savie/application/plancodehkid";
		final Map<String,String> header = headerUtil.getHeader(request);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("hkId", hkid);
		jsonObject.put("planCode", planCode);
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.POST,Url, header, jsonObject);
		logger.info("***********responseJsonObj****************:"+responseJsonObj);
		
		if(responseJsonObj==null){
			logger.error("getSavieApplicationByHkIdPlanCode data error: responseJsonObj=null");
			throw new ECOMMAPIException("data error");
		}
		else{
			if (responseJsonObj.get("errMsgs") == null) {
				JSONArray jsonArray = (JSONArray) responseJsonObj.get("policies");
				if(jsonArray.size()>0){
					throw new ECOMMAPIException("you can only buy one cansurance");
				}
			}
			else{
				logger.error(responseJsonObj.get("errMsgs").toString());
				throw new ECOMMAPIException(responseJsonObj.get("errMsgs").toString());
			}
		}
	}

	public JSONObject getSavieHkidDiscountByHkIdPlanAll(HttpServletRequest request) throws ECOMMAPIException{
		String hkId = request.getParameter("hkId");
		String saviePlan = request.getParameter("saviePlan");
		
		String Url="";
		if (saviePlan==null||"".equals(saviePlan)){
			Url = UserRestURIConstants.GET_SAVIE_HKID_DISCOUNT_BY_HKID_PLAN + "?hkId="+hkId;
		} else{
			Url = UserRestURIConstants.GET_SAVIE_HKID_DISCOUNT_BY_HKID_PLAN + "?hkId="+hkId +"&saviePlan="+saviePlan;
		}
		final Map<String,String> header = headerUtil.getHeader(request);
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,Url, header, null);
		return responseJsonObj;
	}
	
	public JSONObject getSavieHkidDiscountByHkIdPlan(String hkId, String saviePlan,HttpServletRequest request) throws ECOMMAPIException{
		String 	Url = UserRestURIConstants.GET_SAVIE_HKID_DISCOUNT_BY_HKID_PLAN + "?hkId="+hkId +"&saviePlan="+saviePlan;
		final Map<String,String> header = headerUtil.getHeader(request);
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,Url, header, null);
		return responseJsonObj;
	}
	
	public JSONObject getSavieReferralDiscount(HttpServletRequest request)throws ECOMMAPIException{
		String planCode = request.getParameter("planCode");
		String referralCode = request.getParameter("referralCode");
		String sumInsured = request.getParameter("sumInsured");
		String hkId = request.getParameter("hkId");
		String 	Url = UserRestURIConstants.GET_SAVIE_REFERRAL_DISCOUNT + "?planCode="+planCode +"&referralCode="+referralCode + 
				"&sumInsured=" + sumInsured + "&hkId=" + hkId;
		final Map<String,String> header = headerUtil.getHeader(request);
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,Url, header, null);
		return responseJsonObj;
	}
	
	public JSONObject getSavieReferralDiscountParams(String planCode,String referralCode,String sumInsured,String hkId,HttpServletRequest request)throws ECOMMAPIException{
		//String planCode = request.getParameter("planCode");
		//String referralCode = request.getParameter("referralCode");
		//String sumInsured = request.getParameter("sumInsured");
		String 	Url = UserRestURIConstants.GET_SAVIE_REFERRAL_DISCOUNT + "?planCode="+planCode +"&referralCode="+referralCode + 
				"&sumInsured=" + sumInsured + "&hkId=" + hkId;
		final Map<String,String> header = headerUtil.getHeader(request);
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,Url, header, null);
		return responseJsonObj;
	}
	
	public JSONObject validatePolicyByPolicyNo(String policyNo,HttpServletRequest request) throws ECOMMAPIException{
		//String Url = UserRestURIConstants.GET_PROVIE_RIDER_ELIGIBILITY;
		String Url = UserRestURIConstants.VALIDATE_POLICY_BY_POLICY_NO + "?referenceNo=" + policyNo;
		final Map<String,String> header = headerUtil.getHeader(request);
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,Url, header, null);
		return responseJsonObj;
	}

	public JSONObject validatePolicyHoldersByPolicyNo(PassPolicyNoBean passPolicy,HttpServletRequest request) throws ECOMMAPIException{
		//String Url = UserRestURIConstants.GET_PROVIE_RIDER_ELIGIBILITY;
		String Url = UserRestURIConstants.VALIDATE_POLICY_HOLDERS_BY_POLICY_NO;
		JSONObject params = new JSONObject();
		params.put("referenceNo", passPolicy.getReferenceNo());
		params.put("hkId", passPolicy.getHkId());
		params.put("role", passPolicy.getRole());
		final Map<String,String> header = headerUtil.getHeader(request);
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.POST,Url, header, params);
		return responseJsonObj;
	}
	
	
}