package com.ifwd.fwdhk.services.impl;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.common.document.PDFGeneration;
import com.ifwd.fwdhk.common.document.PdfAttribute;
import com.ifwd.fwdhk.common.util.NumberTransferUtils;
import com.ifwd.fwdhk.connector.ECommWsConnector;
import com.ifwd.fwdhk.connector.response.BaseResponse;
import com.ifwd.fwdhk.connector.response.savie.SalesIllustrationResponse;
import com.ifwd.fwdhk.connector.response.savie.SaviePlanDetailsRate;
import com.ifwd.fwdhk.connector.response.savie.SaviePlanDetailsResponse;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.BankBean;
import com.ifwd.fwdhk.model.BankBranchBean;
import com.ifwd.fwdhk.model.DistrictBean;
import com.ifwd.fwdhk.model.OptionItemDesc;
import com.ifwd.fwdhk.model.SendEmailInfo;
import com.ifwd.fwdhk.model.savie.SavieFormApplicationBean;
import com.ifwd.fwdhk.model.savie.SavieFormDeclarationAuthorizationBean;
import com.ifwd.fwdhk.model.savie.SavieFormDocumentBean;
import com.ifwd.fwdhk.model.savie.SavieFormFNABean;
import com.ifwd.fwdhk.model.savie.SavieFormSetAppointmentBean;
import com.ifwd.fwdhk.model.savie.SavieFormSignatureBean;
import com.ifwd.fwdhk.model.savie.SaviePlanDetailsBean;
import com.ifwd.fwdhk.model.savie.SaviePolicy;
import com.ifwd.fwdhk.model.savie.SaviePolicyAccountBalanceBean;
import com.ifwd.fwdhk.model.savie.SavieServiceCentreBean;
import com.ifwd.fwdhk.services.SavieService;
import com.ifwd.fwdhk.util.ClientBrowserUtil;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.HeaderUtil;
import com.ifwd.fwdhk.util.InitApplicationMessage;
import com.ifwd.fwdhk.util.NumberFormatUtils;

@Service
public class SavieServiceImpl implements SavieService {
	private final static Logger logger = LoggerFactory.getLogger(SavieServiceImpl.class);
	
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
	public List<SavieServiceCentreBean> getServiceCentre(String userName,
			String token, String language) {
		return null;
	}

	@Override
	public List<SaviePolicyAccountBalanceBean> getSavieRate(String userName, String token,
			String language) {
		return null;
	}

	@Override
	public List<DistrictBean> getDistrict(String userName, String token,
			String language) {
				return null;
	}
	
	
	
	@Override
	public List<BankBean> getBank(String userName, String token, String language) {
		return null;
	}

	@Override
	public List<BankBranchBean> getBankBranch(String userName, String token,
			String language, Integer bankCode) {
		return null;
	}

	@Override
	public SaviePolicy createSaviePolicy(String userName, String token,
			String language, SavieFormApplicationBean application,
			SavieFormSetAppointmentBean appointment,
			SavieFormSignatureBean signature,
			SavieFormDeclarationAuthorizationBean authorization,
			SavieFormDocumentBean documents) {
		return null;
	}

	@Override
	public void getPlanDetails(Model model, HttpServletRequest request,HttpServletResponse response,HttpSession httpSession) throws ECOMMAPIException {
		try {
			String planCode = request.getParameter("planCode");
			String issueAge = request.getParameter("issueAge");
			String paymentTerm = request.getParameter("paymentTerm");
			String premium = request.getParameter("premium");
			String referralCode = request.getParameter("referralCode");
			SaviePlanDetailsResponse apiResponse = connector.saviePlanDetails(planCode, issueAge, paymentTerm, premium, referralCode, null);
			
			httpSession.setAttribute("planDetailData", apiResponse);
			
			SaviePlanDetailsBean saviePlanDetailsBean = new SaviePlanDetailsBean();
			saviePlanDetailsBean.setPlanName(planCode.toUpperCase());
			if(!apiResponse.hasError()){
				List<SaviePlanDetailsRate> planDetails0Rate = apiResponse.getPlanDetails0Rate();
				List<SaviePlanDetailsRate> planDetails2Rate = apiResponse.getPlanDetails2Rate();
				List<SaviePlanDetailsRate> planDetails3Rate = apiResponse.getPlanDetails3Rate();
				List<SaviePlanDetailsRate> planDetails4Rate = apiResponse.getPlanDetails4Rate();
				
				if(planDetails0Rate !=null && planDetails0Rate.size()>0){
					String type = planDetails0Rate.get(0).getType().substring(0, 1);
					if(null != type && "Y".equals(type)){
						saviePlanDetailsBean.setPaymentPlan("Yearly plan");
					}
					else{
						saviePlanDetailsBean.setPaymentPlan("Monthly plan");
					}
					saviePlanDetailsBean.setSinglePremiumAmount(apiResponse.getPremium());
					for(int i=0;i<planDetails0Rate.size();i++){
						SaviePlanDetailsRate rate = planDetails0Rate.get(i);
						if("Y1".equals(rate.getType())){
							saviePlanDetailsBean.setGuarantee1stYearRate(Float.valueOf(rate.getInterestedRate()));
						}
						if("Y2".equals(rate.getType())){
							saviePlanDetailsBean.setGuarantee2ndYearRate(Float.valueOf(rate.getInterestedRate()));
						}
						if("Y3".equals(rate.getType())){
							saviePlanDetailsBean.setGuarantee3rdYearRate(Float.valueOf(rate.getInterestedRate()));
						}
					}
					List<SaviePolicyAccountBalanceBean> saviePolicyAccountBalanceList0 = new ArrayList<SaviePolicyAccountBalanceBean>();
					List<SaviePolicyAccountBalanceBean> saviePolicyAccountBalanceList2 = new ArrayList<SaviePolicyAccountBalanceBean>();
					List<SaviePolicyAccountBalanceBean> saviePolicyAccountBalanceList3 = new ArrayList<SaviePolicyAccountBalanceBean>();
					List<SaviePolicyAccountBalanceBean> saviePolicyAccountBalanceList4 = new ArrayList<SaviePolicyAccountBalanceBean>();
					
					for(int i =0;i<planDetails0Rate.size();i++){
						SaviePolicyAccountBalanceBean saPolAccBal0 = new SaviePolicyAccountBalanceBean();
						saPolAccBal0.setPolicyYear(planDetails0Rate.get(i).getType().substring(1));
						saPolAccBal0.setPremiumPaid(planDetails0Rate.get(i).getTotalPremium());
						saPolAccBal0.setAccountValue(planDetails0Rate.get(i).getAccountEOP());
						saPolAccBal0.setSurrenderBenefit(planDetails0Rate.get(i).getGuranteedSurrenderBenefit());
						saviePolicyAccountBalanceList0.add(saPolAccBal0);
						
						SaviePolicyAccountBalanceBean saPolAccBal2 = new SaviePolicyAccountBalanceBean();
						saPolAccBal2.setPolicyYear(planDetails2Rate.get(i).getType().substring(1));
						saPolAccBal2.setPremiumPaid(planDetails2Rate.get(i).getTotalPremium());
						saPolAccBal2.setAccountValue(planDetails2Rate.get(i).getAccountEOP());
						saPolAccBal2.setSurrenderBenefit(planDetails2Rate.get(i).getGuranteedSurrenderBenefit());
						saviePolicyAccountBalanceList2.add(saPolAccBal2);
						
						SaviePolicyAccountBalanceBean saPolAccBal3 = new SaviePolicyAccountBalanceBean();
						saPolAccBal3.setPolicyYear(planDetails3Rate.get(i).getType().substring(1));
						saPolAccBal3.setPremiumPaid(planDetails3Rate.get(i).getTotalPremium());
						saPolAccBal3.setAccountValue(planDetails3Rate.get(i).getAccountEOP());
						saPolAccBal3.setSurrenderBenefit(planDetails3Rate.get(i).getGuranteedSurrenderBenefit());
						saviePolicyAccountBalanceList3.add(saPolAccBal3);
						
						SaviePolicyAccountBalanceBean saPolAccBal4 = new SaviePolicyAccountBalanceBean();
						saPolAccBal4.setPolicyYear(planDetails4Rate.get(i).getType().substring(1));
						saPolAccBal4.setPremiumPaid(planDetails4Rate.get(i).getTotalPremium());
						saPolAccBal4.setAccountValue(planDetails4Rate.get(i).getAccountEOP());
						saPolAccBal4.setSurrenderBenefit(planDetails4Rate.get(i).getGuranteedSurrenderBenefit());
						saviePolicyAccountBalanceList4.add(saPolAccBal4);
					}
					
					saviePlanDetailsBean.setSaviePolicyAccountBalanceList0(saviePolicyAccountBalanceList0);
					saviePlanDetailsBean.setSaviePolicyAccountBalanceList2(saviePolicyAccountBalanceList2);
					saviePlanDetailsBean.setSaviePolicyAccountBalanceList3(saviePolicyAccountBalanceList3);
					saviePlanDetailsBean.setSaviePolicyAccountBalanceList4(saviePolicyAccountBalanceList4);
				}
			}
			request.getSession().setAttribute("planDetail", saviePlanDetailsBean);
			
			JSONObject resultJsonObject = new JSONObject();
			if(!apiResponse.hasError()){
				List<SaviePlanDetailsRate> planDetails0Rate = apiResponse.getPlanDetails0Rate();
				List<SaviePlanDetailsRate> planDetails2Rate = apiResponse.getPlanDetails2Rate();
				List<SaviePlanDetailsRate> planDetails3Rate = apiResponse.getPlanDetails3Rate();
				List<SaviePlanDetailsRate> planDetails4Rate = apiResponse.getPlanDetails4Rate();
				
				if(planDetails0Rate !=null && planDetails0Rate.size()>0){
					List<JSONObject> inputTableList = new ArrayList<JSONObject>();
					JSONObject inputTable = new JSONObject();
					inputTable.accumulate("type", planCode);
					inputTable.accumulate("issueAge", issueAge);
					inputTable.accumulate("paymode", "monthly");
					inputTable.accumulate("premium", premium);
					inputTable.accumulate("paymentMode", "Single");
					inputTable.accumulate("paymentTerm", paymentTerm);
					inputTable.accumulate("promoCode", referralCode);
					inputTableList.add(inputTable);
					
					JSONObject planDetailJsonObject = new JSONObject();
					planDetailJsonObject.accumulate("inputTable", inputTableList);
					
					List<JSONObject> yearPlansList = new ArrayList<JSONObject>();
					
					for(int i =0;i<planDetails0Rate.size();i++){
						JSONObject yesrPlan = new JSONObject();
						yesrPlan.accumulate("year", Integer.valueOf(planDetails0Rate.get(i).getType().substring(1)));
						
						List<JSONObject> plansList = new ArrayList<JSONObject>();
						
						JSONObject plan0 = new JSONObject();
						plan0.accumulate("accountBalance", Float.valueOf(planDetails0Rate.get(i).getAccountEOP()));
						plan0.accumulate("totalPremium", premium);
						plan0.accumulate("guaranteedSurrenderBenefit", Float.valueOf(planDetails0Rate.get(i).getGuranteedSurrenderBenefit()));
						plan0.accumulate("guaranteedDeathBenefit", Float.valueOf(planDetails0Rate.get(i).getGuranteedDeathBenefit()));
						plan0.accumulate("rate","zero");
						plansList.add(plan0);
						
						JSONObject plan2 = new JSONObject();
						plan2.accumulate("accountBalance", Float.valueOf(planDetails2Rate.get(i).getAccountEOP()));
						plan2.accumulate("totalPremium", premium);
						plan2.accumulate("guaranteedSurrenderBenefit", Float.valueOf(planDetails2Rate.get(i).getGuranteedSurrenderBenefit()));
						plan2.accumulate("guaranteedDeathBenefit", Float.valueOf(planDetails2Rate.get(i).getGuranteedDeathBenefit()));
						plan2.accumulate("rate","two");
						plansList.add(plan2);
						
						JSONObject plan3 = new JSONObject();
						plan3.accumulate("accountBalance", Float.valueOf(planDetails3Rate.get(i).getAccountEOP()));
						plan3.accumulate("totalPremium", premium);
						plan3.accumulate("guaranteedSurrenderBenefit", Float.valueOf(planDetails3Rate.get(i).getGuranteedSurrenderBenefit()));
						plan3.accumulate("guaranteedDeathBenefit", Float.valueOf(planDetails3Rate.get(i).getGuranteedDeathBenefit()));
						plan3.accumulate("rate","three");
						plansList.add(plan3);
						
						JSONObject plan4 = new JSONObject();
						plan4.accumulate("accountBalance", Float.valueOf(planDetails4Rate.get(i).getAccountEOP()));
						plan4.accumulate("totalPremium", premium);
						plan4.accumulate("guaranteedSurrenderBenefit", Float.valueOf(planDetails4Rate.get(i).getGuranteedSurrenderBenefit()));
						plan4.accumulate("guaranteedDeathBenefit", Float.valueOf(planDetails4Rate.get(i).getGuranteedDeathBenefit()));
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
				throw new ECOMMAPIException("API savie/planDetails occurs an exception!");
			}
			
			response.setContentType("text/json;charset=utf-8");
			//return data
			try {
				logger.info(resultJsonObject.toString());
				response.getWriter().print(resultJsonObject.toString());
			}catch(Exception e) {
				e.printStackTrace();
			}
		} catch (ECOMMAPIException e) {
			logger.info("SavieServiceImpl getPlanDetails occurs an exception!");
			logger.info(e.getMessage());
			e.printStackTrace();
		}
	}
	
	@Override
	public void createSalesIllustrationPdf(Model model, HttpServletRequest request,HttpServletResponse response,HttpSession httpSession) throws Exception {
		SaviePlanDetailsResponse planDetailData = (SaviePlanDetailsResponse) httpSession.getAttribute("planDetailData");
		JSONObject resultJsonObject = new JSONObject();
		if(planDetailData != null && !planDetailData.hasError()){
			String totalPremium = NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails0Rate().get(0).getTotalPremium());
			int totalYear = 100-Integer.valueOf(planDetailData.getIssueAge());
			List<PdfAttribute> attributeList = new ArrayList<PdfAttribute>();
			attributeList.add(new PdfAttribute("totalYear",NumberTransferUtils.transferNum(totalYear)));
			attributeList.add(new PdfAttribute("applicationNo", "自助息理財壽險計劃"));
			attributeList.add(new PdfAttribute("chineseName", request.getParameter("chineseName")));
			attributeList.add(new PdfAttribute("gender", request.getParameter("gender")));
			SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
			attributeList.add(new PdfAttribute("dateTime",format.format(new Date())));
			attributeList.add(new PdfAttribute("singlePremiumAmount", totalPremium));
			attributeList.add(new PdfAttribute("age", request.getParameter("age")));
			attributeList.add(new PdfAttribute("paymentMethod", request.getParameter("paymentMethod")));
			attributeList.add(new PdfAttribute("Premium",totalPremium));
			attributeList.add(new PdfAttribute("singlePremiumAmount",totalPremium));
			attributeList.add(new PdfAttribute("paymentType",request.getParameter("paymentType")));
			attributeList.add(new PdfAttribute("versionNum","1.0"));
			logger.info(planDetailData.getPlanDetails0Rate().size()+"");
			NumberFormat nt = NumberFormat.getPercentInstance();
			nt.setMinimumFractionDigits(2);
			for(int i=0;i<planDetailData.getPlanDetails0Rate().size();i++){
				int policyYear = Integer.valueOf(planDetailData.getPlanDetails0Rate().get(i).getPolicyYear())+1;
				int age = Integer.valueOf(planDetailData.getPlanDetails0Rate().get(i).getAge());
				int issueAge = Integer.valueOf(planDetailData.getIssueAge());
				if(policyYear<4){
					attributeList.add(new PdfAttribute("endYear"+policyYear,policyYear+""));
					attributeList.add(new PdfAttribute("totalPremium"+policyYear,totalPremium));
					attributeList.add(new PdfAttribute("interestedRate"+policyYear,nt.format(Float.valueOf(planDetailData.getPlanDetails0Rate().get(i).getInterestedRate()))));
					attributeList.add(new PdfAttribute("accountEOP"+policyYear,NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails0Rate().get(i).getAccountEOP())));
					attributeList.add(new PdfAttribute("guranteedSurrenderBenefit"+policyYear,NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails0Rate().get(i).getGuranteedSurrenderBenefit()))); 
				    attributeList.add(new PdfAttribute("guranteedDeathBenefit"+policyYear,NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails0Rate().get(i).getGuranteedDeathBenefit()))); 
				}
				else if(policyYear==4){
					attributeList.add(new PdfAttribute("endYear"+4,"4"));
					attributeList.add(new PdfAttribute("totalPremium"+4,totalPremium));
					attributeList.add(new PdfAttribute("guranteedSurrenderBenefit1_4",NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails0Rate().get(i).getGuranteedSurrenderBenefit()))); 
					attributeList.add(new PdfAttribute("guranteedDeathBenefit1_4",NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails0Rate().get(i).getGuranteedDeathBenefit())));
					attributeList.add(new PdfAttribute("guranteedSurrenderBenefit2_4",NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails2Rate().get(i).getGuranteedSurrenderBenefit()))); 
					attributeList.add(new PdfAttribute("guranteedDeathBenefit2_4",NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails2Rate().get(i).getGuranteedDeathBenefit()))); 
					attributeList.add(new PdfAttribute("guranteedSurrenderBenefit3_4",NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails3Rate().get(i).getGuranteedSurrenderBenefit()))); 
					attributeList.add(new PdfAttribute("guranteedDeathBenefit3_4",NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails3Rate().get(i).getGuranteedDeathBenefit()))); 
					attributeList.add(new PdfAttribute("guranteedSurrenderBenefit4_4",NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails4Rate().get(i).getGuranteedSurrenderBenefit()))); 
					attributeList.add(new PdfAttribute("guranteedDeathBenefit4_4",NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails4Rate().get(i).getGuranteedDeathBenefit()))); 
				}
				else if(policyYear%5==0 && policyYear/5<7){
					attributeList.add(new PdfAttribute("endYear"+(4+policyYear/5),policyYear+""));
					attributeList.add(new PdfAttribute("totalPremium"+(4+policyYear/5),totalPremium));
					attributeList.add(new PdfAttribute("guranteedSurrenderBenefit1_"+(4+policyYear/5),NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails0Rate().get(i).getGuranteedSurrenderBenefit()))); 
					attributeList.add(new PdfAttribute("guranteedDeathBenefit1_"+(4+policyYear/5),NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails0Rate().get(i).getGuranteedDeathBenefit())));
					attributeList.add(new PdfAttribute("guranteedSurrenderBenefit2_"+(4+policyYear/5),NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails2Rate().get(i).getGuranteedSurrenderBenefit()))); 
					attributeList.add(new PdfAttribute("guranteedDeathBenefit2_"+(4+policyYear/5),NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails2Rate().get(i).getGuranteedDeathBenefit()))); 
					attributeList.add(new PdfAttribute("guranteedSurrenderBenefit3_"+(4+policyYear/5),NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails3Rate().get(i).getGuranteedSurrenderBenefit()))); 
					attributeList.add(new PdfAttribute("guranteedDeathBenefit3_"+(4+policyYear/5),NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails3Rate().get(i).getGuranteedDeathBenefit()))); 
					attributeList.add(new PdfAttribute("guranteedSurrenderBenefit4_"+(4+policyYear/5),NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails4Rate().get(i).getGuranteedSurrenderBenefit()))); 
					attributeList.add(new PdfAttribute("guranteedDeathBenefit4_"+(4+policyYear/5),NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails4Rate().get(i).getGuranteedDeathBenefit()))); 
				}
				else if(issueAge>66){
					if(age==100){
						attributeList.add(new PdfAttribute("endYear"+11,"岁数"+100));
						attributeList.add(new PdfAttribute("totalPremium"+11,totalPremium));
						attributeList.add(new PdfAttribute("guranteedSurrenderBenefit1_"+11,NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails0Rate().get(i).getGuranteedSurrenderBenefit()))); 
						attributeList.add(new PdfAttribute("guranteedDeathBenefit1_"+11,NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails0Rate().get(i).getGuranteedDeathBenefit())));
						attributeList.add(new PdfAttribute("guranteedSurrenderBenefit2_"+11,NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails2Rate().get(i).getGuranteedSurrenderBenefit()))); 
						attributeList.add(new PdfAttribute("guranteedDeathBenefit2_"+11,NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails2Rate().get(i).getGuranteedDeathBenefit()))); 
						attributeList.add(new PdfAttribute("guranteedSurrenderBenefit3_"+11,NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails3Rate().get(i).getGuranteedSurrenderBenefit()))); 
						attributeList.add(new PdfAttribute("guranteedDeathBenefit3_"+11,NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails3Rate().get(i).getGuranteedDeathBenefit()))); 
						attributeList.add(new PdfAttribute("guranteedSurrenderBenefit4_"+11,NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails4Rate().get(i).getGuranteedSurrenderBenefit()))); 
						attributeList.add(new PdfAttribute("guranteedDeathBenefit4_"+11,NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails4Rate().get(i).getGuranteedDeathBenefit()))); 
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
						attributeList.add(new PdfAttribute("guranteedSurrenderBenefit1_"+11,NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails0Rate().get(i).getGuranteedSurrenderBenefit()))); 
						attributeList.add(new PdfAttribute("guranteedDeathBenefit1_"+11,NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails0Rate().get(i).getGuranteedDeathBenefit())));
						attributeList.add(new PdfAttribute("guranteedSurrenderBenefit2_"+11,NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails2Rate().get(i).getGuranteedSurrenderBenefit()))); 
						attributeList.add(new PdfAttribute("guranteedDeathBenefit2_"+11,NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails2Rate().get(i).getGuranteedDeathBenefit()))); 
						attributeList.add(new PdfAttribute("guranteedSurrenderBenefit3_"+11,NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails3Rate().get(i).getGuranteedSurrenderBenefit()))); 
						attributeList.add(new PdfAttribute("guranteedDeathBenefit3_"+11,NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails3Rate().get(i).getGuranteedDeathBenefit()))); 
						attributeList.add(new PdfAttribute("guranteedSurrenderBenefit4_"+11,NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails4Rate().get(i).getGuranteedSurrenderBenefit()))); 
						attributeList.add(new PdfAttribute("guranteedDeathBenefit4_"+11,NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails4Rate().get(i).getGuranteedDeathBenefit()))); 
					}
					else if(age==100){
						attributeList.add(new PdfAttribute("endYear"+12,"歲數"+100));
						attributeList.add(new PdfAttribute("totalPremium"+12,totalPremium));
						attributeList.add(new PdfAttribute("guranteedSurrenderBenefit1_"+12,NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails0Rate().get(i).getGuranteedSurrenderBenefit()))); 
						attributeList.add(new PdfAttribute("guranteedDeathBenefit1_"+12,NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails0Rate().get(i).getGuranteedDeathBenefit())));
						attributeList.add(new PdfAttribute("guranteedSurrenderBenefit2_"+12,NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails2Rate().get(i).getGuranteedSurrenderBenefit()))); 
						attributeList.add(new PdfAttribute("guranteedDeathBenefit2_"+12,NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails2Rate().get(i).getGuranteedDeathBenefit()))); 
						attributeList.add(new PdfAttribute("guranteedSurrenderBenefit3_"+12,NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails3Rate().get(i).getGuranteedSurrenderBenefit()))); 
						attributeList.add(new PdfAttribute("guranteedDeathBenefit3_"+12,NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails3Rate().get(i).getGuranteedDeathBenefit()))); 
						attributeList.add(new PdfAttribute("guranteedSurrenderBenefit4_"+12,NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails4Rate().get(i).getGuranteedSurrenderBenefit()))); 
						attributeList.add(new PdfAttribute("guranteedDeathBenefit4_"+12,NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails4Rate().get(i).getGuranteedDeathBenefit()))); 
					}
				}
			}
			String name = null;
			SalesIllustrationResponse br = null;
			String pdfTemplatePath = null;
			String pdfGeneratePath = null;
			try {
				//pdfTemplatePath = request.getRealPath("/").replace("\\", "/")+"pdf/"+"SavieProposalTemplateChi3.pdf";
				//pdfGeneratePath = request.getRealPath("/").replace("\\", "\\\\")+"pdf\\\\";
				pdfTemplatePath = request.getRealPath("/").replace("\\", "/")+"resources/pdf/"+"SavieProposalTemplateChi3.pdf";
				pdfGeneratePath = request.getRealPath("/").replace("\\", "\\\\")+"resources\\\\pdf\\\\";
				name = PDFGeneration.generatePdf2(pdfTemplatePath,pdfGeneratePath,attributeList,false,"All rights reserved, copy");
				final Map<String,String> header = headerUtil.getHeader(request);
				JSONObject parameters = new JSONObject();
				JSONObject applicant = new JSONObject();
				applicant.put("lastName", "Lau");
				applicant.put("firstName", "Andy");
				applicant.put("chineseName", "劉德華");
				applicant.put("dob", "1955-01-01");
				applicant.put("gender", "M");
				parameters.put("applicant", applicant);
				parameters.put("planCode", "savie");
				parameters.put("referralCode", "SAVIE123");
				parameters.put("issueAge", 19);
				parameters.put("paymentTerm", 82);
				parameters.put("premium", 10000);
				br = connector.generateSalesIllustration(parameters, header);
				logger.info(br+"");
			}catch(Exception e){
				logger.info("SavieServiceImpl createSalesIllustrationPdf occurs an exception!");
				logger.info(e.getMessage());
				e.printStackTrace();
			}
			resultJsonObject.accumulate("pdfName", name);
			resultJsonObject.accumulate("Msgs", br);
		}
		else{
			resultJsonObject.accumulate("Msgs", "data error");
		}
		response.setContentType("text/json;charset=utf-8");
		request.getRemoteUser();
		//return data
		try {
			response.getWriter().print(resultJsonObject.toString());
		}catch(Exception e) {  
			e.printStackTrace();
		}
	}
	
	@Override
	public void uploadSalesIllustrationPdf(Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {
		String path = request.getRealPath("/").replace("\\", "\\\\")+"resources\\\\pdf\\\\"+request.getParameter("pdfName");
        logger.info(path);
		File file=new File(path);
		BaseResponse br = null;
		try{
			byte[] bytes = FileCopyUtils.copyToByteArray(file);;
			String base64 =new sun.misc.BASE64Encoder().encode(bytes);
			final Map<String, String> header = headerUtil.getHeader(request);
			Map<String,Object> clientBrowserInfo = ClientBrowserUtil.getClientInfo(request);
			org.json.simple.JSONObject parameters = new org.json.simple.JSONObject();
			parameters.put("clientBrowserInfo", clientBrowserInfo);
			parameters.put("requestNo", request.getParameter("requestNo"));
			parameters.put("fileType", "pdf");
			parameters.put("documentType", "HKID");
			parameters.put("originalFilePath", path);
			parameters.put("base64", base64);
			br = connector.uploadDocuments(parameters, header);
		}catch(Exception e) {
			logger.info("SavieServiceImpl uploadSalesIllustrationPdf occurs an exception!");
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		JSONObject resultJsonObject = new JSONObject();
		resultJsonObject.accumulate("Msgs", br.hasError()?br.getErrMsgs():"success");
		response.setContentType("text/json;charset=utf-8");
		//return data
		try {
			response.getWriter().print(resultJsonObject.toString());
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public String upsertFNA(String userName, String token, String language,
			SavieFormFNABean fna) {
		return null;
	}

	@Override
	public String upsertApplication(String userName, String token,
			String language, SavieFormApplicationBean application) {
		return null;
	}

	@Override
	public String upsertAppointment(String userName, String token,
			String language, SavieFormSetAppointmentBean appointment) {
		return null;
	}

	@Override
	public String upsertSignature(String userName, String token,
			String language, SavieFormSignatureBean signature) {
		return null;
	}

	@Override
	public String upsertDeclarationAuthorization(String userName, String token,
			String language, SavieFormDeclarationAuthorizationBean authorization) {
		return null;
	}

	@Override
	public String upsertDocument(String userName, String token,
			String language, SavieFormDocumentBean documents) {
/*
		40		Savie	ecommerce portal	ecommerce ws	uploadDocument	PUT	/savie/documents	"{
		   documentType: [string:16][M] (either hkId, passport, addressProof),
		    fileType: [string: 8][M],
		    fileContent: [string] (in base64)
		}"															
*/
		
		return null;
	}

	@Override
	public List<OptionItemDesc> getMaritalStatus(String language) {
		
		if(language.equalsIgnoreCase("EN"))
		{
			if(InitApplicationMessage.maritalStatusesEN!=null)
			{
				return InitApplicationMessage.maritalStatusesEN;
			}
			else
			{
				InitApplicationMessage.maritalStatusesEN=commonUtils.getOptionItemDescList("maritalStatuses",language);
				return InitApplicationMessage.maritalStatusesEN;
			}			
		}
		else
		{
			if(InitApplicationMessage.maritalStatusesCN!=null)
			{
				return InitApplicationMessage.maritalStatusesCN;
			}
			else
			{
				InitApplicationMessage.maritalStatusesCN=commonUtils.getOptionItemDescList("maritalStatuses",language);
				return InitApplicationMessage.maritalStatusesCN;
			}
		}
		
		
		//return commonUtils.getOptionItemDescList("maritalStatuses",language);
	}

	@Override
	public List<OptionItemDesc> getSavieDistrict(String language) {
		
		if(language.equalsIgnoreCase("EN"))
		{
			if(InitApplicationMessage.savieDistrictEN!=null)
			{
				return InitApplicationMessage.savieDistrictEN;
			}
			else
			{
				InitApplicationMessage.savieDistrictEN=commonUtils.getOptionItemDescList("savieDistrict",language);
				return InitApplicationMessage.savieDistrictEN;
			}
		}
		else
		{
			if(InitApplicationMessage.savieDistrictCN!=null)
			{
				return InitApplicationMessage.savieDistrictCN;
			}
			else
			{
				InitApplicationMessage.savieDistrictCN=commonUtils.getOptionItemDescList("savieDistrict",language);
				return InitApplicationMessage.savieDistrictCN;
			}
			
		}
		
		//return commonUtils.getOptionItemDescList("savieDistrict",language);
	}

	@Override
	public List<OptionItemDesc> getEmploymentStatus(String language) {
		
		if(language.equalsIgnoreCase("EN"))
		{
			if(InitApplicationMessage.employmentStatusEN!=null)
			{
				return InitApplicationMessage.employmentStatusEN;
			}
			else
			{
				InitApplicationMessage.employmentStatusEN=commonUtils.getOptionItemDescList("employmentStatus",language);
				return InitApplicationMessage.employmentStatusEN;
			}
		}
		else
		{
			if(InitApplicationMessage.employmentStatusCN!=null)
			{
				return InitApplicationMessage.employmentStatusCN;
			}
			else
			{
				InitApplicationMessage.employmentStatusCN=commonUtils.getOptionItemDescList("employmentStatus",language);
				return InitApplicationMessage.employmentStatusCN;
			}
			
		}
		
		//return commonUtils.getOptionItemDescList("employmentStatus",language);
	}

	@Override
	public List<OptionItemDesc> getNationality(String language) {
		if(language.equalsIgnoreCase("EN"))
		{
			if(InitApplicationMessage.nationalityEN!=null)
			{
				return InitApplicationMessage.nationalityEN;
			}
			else
			{
				InitApplicationMessage.nationalityEN=commonUtils.getOptionItemDescList("nationality",language);
				return InitApplicationMessage.nationalityEN;
			}
		}
		else
		{
			if(InitApplicationMessage.nationalityCN!=null)
			{
				return InitApplicationMessage.nationalityCN;
			}
			else
			{
				InitApplicationMessage.nationalityCN=commonUtils.getOptionItemDescList("employmentStatus",language);
				return InitApplicationMessage.nationalityCN;
			}			
		}
		//return commonUtils.getOptionItemDescList("nationality",language);
	}

	@Override
	public List<OptionItemDesc> getNatureOfBusiness(String language) {
		if(language.equalsIgnoreCase("EN"))
		{
			if(InitApplicationMessage.natureOfBusinessEN!=null)
			{
				return InitApplicationMessage.natureOfBusinessEN;
			}
			else
			{
				InitApplicationMessage.natureOfBusinessEN=commonUtils.getOptionItemDescList("natureOfBusiness",language);
				return InitApplicationMessage.natureOfBusinessEN;
			}
		}
		else
		{
			if(InitApplicationMessage.natureOfBusinessCN!=null)
			{
				return InitApplicationMessage.natureOfBusinessCN;
			}
			else
			{
				InitApplicationMessage.natureOfBusinessCN=commonUtils.getOptionItemDescList("natureOfBusiness",language);
				return InitApplicationMessage.natureOfBusinessCN;
			}			
		}
		//return commonUtils.getOptionItemDescList("natureOfBusiness",language);
	}

	@Override
	public List<OptionItemDesc> getPlaceOfBirth(String language) {
		if(language.equalsIgnoreCase("EN"))
		{
			if(InitApplicationMessage.placeOfBirthEN!=null)
			{
				return InitApplicationMessage.placeOfBirthEN;
			}
			else
			{
				InitApplicationMessage.placeOfBirthEN=commonUtils.getOptionItemDescList("placeOfBirth",language);
				return InitApplicationMessage.placeOfBirthEN;
			}
		}
		else
		{
			if(InitApplicationMessage.placeOfBirthCN!=null)
			{
				return InitApplicationMessage.placeOfBirthCN;
			}
			else
			{
				InitApplicationMessage.placeOfBirthCN=commonUtils.getOptionItemDescList("placeOfBirth",language);
				return InitApplicationMessage.placeOfBirthCN;
			}			
		}
		//return commonUtils.getOptionItemDescList("placeOfBirth",language);
	}

	@Override
	public List<OptionItemDesc> getMonthlyPersonalIncome(String language) {
		if(language.equalsIgnoreCase("EN"))
		{
			if(InitApplicationMessage.monthlyPersonalIncomeEN!=null)
			{
				return InitApplicationMessage.monthlyPersonalIncomeEN;
			}
			else
			{
				InitApplicationMessage.monthlyPersonalIncomeEN=commonUtils.getOptionItemDescList("monthlyPersonalIncome",language);
				return InitApplicationMessage.monthlyPersonalIncomeEN;
			}
		}
		else
		{
			if(InitApplicationMessage.monthlyPersonalIncomeCN!=null)
			{
				return InitApplicationMessage.monthlyPersonalIncomeCN;
			}
			else
			{
				InitApplicationMessage.monthlyPersonalIncomeCN=commonUtils.getOptionItemDescList("monthlyPersonalIncome",language);
				return InitApplicationMessage.monthlyPersonalIncomeCN;
			}			
		}
		//return commonUtils.getOptionItemDescList("monthlyPersonalIncome",language);
	}

	@Override
	public List<OptionItemDesc> getSavieBeneficiaryRelationship(String language) {
		if(language.equalsIgnoreCase("EN"))
		{
			if(InitApplicationMessage.savieBeneficiaryRelationshipEN!=null)
			{
				return InitApplicationMessage.savieBeneficiaryRelationshipEN;
			}
			else
			{
				InitApplicationMessage.savieBeneficiaryRelationshipEN=commonUtils.getOptionItemDescList("savieBeneficiaryRelationship",language);
				return InitApplicationMessage.savieBeneficiaryRelationshipEN;
			}
		}
		else
		{
			if(InitApplicationMessage.savieBeneficiaryRelationshipCN!=null)
			{
				return InitApplicationMessage.savieBeneficiaryRelationshipCN;
			}
			else
			{
				InitApplicationMessage.savieBeneficiaryRelationshipCN=commonUtils.getOptionItemDescList("savieBeneficiaryRelationship",language);
				return InitApplicationMessage.savieBeneficiaryRelationshipCN;
			}			
		}
		//return commonUtils.getOptionItemDescList("savieBeneficiaryRelationship",language);
	}

	@Override
	public List<OptionItemDesc> getOccupation(String language) {
			if(language.equalsIgnoreCase("EN"))
			{
				if(InitApplicationMessage.occupationEN!=null)
				{
					return InitApplicationMessage.occupationEN;
				}
				else
				{
					InitApplicationMessage.occupationEN=commonUtils.getOptionItemDescList("occupation",language);
					return InitApplicationMessage.occupationEN;
				}
			}
			else
			{
				if(InitApplicationMessage.occupationCN!=null)
				{
					return InitApplicationMessage.occupationCN;
				}
				else
				{
					InitApplicationMessage.occupationCN=commonUtils.getOptionItemDescList("occupation",language);
					return InitApplicationMessage.occupationCN;
				}			
			}
		//return commonUtils.getOptionItemDescList("occupation",language);
	}
	
	@Override
	public BaseResponse sendLead(HttpServletRequest request)throws ECOMMAPIException{
		BaseResponse br = null;
		try {
			String affiliate = request.getParameter("affiliate");
			final Map<String,String> header = headerUtil.getHeader(request);
			JSONObject parameters = new JSONObject();
			parameters.put("email", request.getParameter("email"));
			parameters.put("mobileNo", request.getParameter("mobileNo"));
			parameters.put("answer1", request.getParameter("answer1"));
			parameters.put("step", request.getParameter("step"));
			parameters.put("affiliate", affiliate);
			br = connector.sendLead(parameters,header);
		}catch(Exception e){
			
			logger.info("SavieServiceImpl sendLead occurs an exception!");
			logger.info(e.getMessage());
			e.printStackTrace();
		}

		 return br;
	}
	
	@Override
	public BaseResponse sendMessagesEmail(HttpServletRequest request)throws ECOMMAPIException{
		BaseResponse br = null;
		try {
			final Map<String,String> header = headerUtil.getHeader(request);
			header.put("language", "ZH");
			String to = request.getParameter("to");
			String message = "您好Hi,<br />您成功於自助息理財壽險計劃網頁登記電郵地址。<br />You have successfully registered your email address at the Savie Insurance Plan’s website.";
			String subject = "Savie Registration Acknowledgement email from FWD";
			String attachment = request.getParameter("attachment");
			String from = "Fanny Wing <i-info.hk@fwd.com>";
			boolean isHTML = true;
			
			org.json.simple.JSONObject parameters = new org.json.simple.JSONObject();
			parameters.put("to", to);
			parameters.put("message", message);
			parameters.put("subject", subject);
			parameters.put("attachment", attachment);
			parameters.put("from", from);
			parameters.put("isHtml", isHTML);
			
			br = connector.sendEmail(parameters,header);
		}catch(Exception e){
			
			logger.info("SavieServiceImpl sendLead occurs an exception!");
			logger.info(e.getMessage());
			e.printStackTrace();
		}

		 return br;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public BaseResponse sendEmail(HttpServletRequest request,SendEmailInfo sei)throws ECOMMAPIException{
		BaseResponse br = null;
		try {
			final Map<String,String> header = headerUtil.getHeader(request);
			String to = sei.getPlayerEmail() ;//request.getParameter("to"); //"nathaniel.kw.cheung@fwd.com";//
			String message = "<h1>my testing</h1><u>underline</u>";//request.getParameter("message");//
			String subject = "html testing";//request.getParameter("subject");//
			String attachment = request.getParameter("attachment");//
			String from = "sit@ecomm.fwd.com";//request.getParameter("from");//
			//String isHtml = "true";//request.getParameter("isHTML");// 
			boolean isHTML = true;
			
			org.json.simple.JSONObject parameters = new org.json.simple.JSONObject();
			parameters.put("to", to);
			parameters.put("message", message);
			parameters.put("subject", subject);
			parameters.put("attachment", attachment);
			parameters.put("from", from);
			parameters.put("isHtml", isHTML);
			
			br = connector.sendEmail(parameters,header);
		}catch(Exception e){
			
			logger.info("SavieServiceImpl sendLead occurs an exception!");
			logger.info(e.getMessage());
			e.printStackTrace();
		}

		 return br;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public BaseResponse signature(HttpServletRequest request,String image)throws ECOMMAPIException{		
		BaseResponse br = null;
		try {
			final Map<String, String> header = headerUtil.getHeader(request);
			Map<String,Object> clientBrowserInfo = ClientBrowserUtil.getClientInfo(request);
			org.json.simple.JSONObject parameters = new org.json.simple.JSONObject();
			parameters.put("clientBrowserInfo", clientBrowserInfo);
			parameters.put("fileType", "png");
			parameters.put("signatureType", "application");
			parameters.put("base64", image);
			br = connector.signature(parameters, header);
		} catch (ECOMMAPIException e) {
			logger.info("SavieServiceImpl sendLead occurs an exception!");
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		
		return br;
	}
	
	public Boolean checkImages(HttpServletRequest request,MultipartFile file){
		try {
			String uploadDir = request.getSession().getServletContext()
					.getRealPath("/")
					+ "upload";
			File dirPath = new File(uploadDir);
			if (!dirPath.exists()) {
				dirPath.mkdirs();
			}
			String name =  UUID.randomUUID().toString().replace("-", "");;
			String filePath = uploadDir + "/" +name+"."+ file.getContentType().split("/")[1];
			// 转存文件  
			File files = new File(filePath);
			file.transferTo(files);
			InputStream is = new FileInputStream(files);
			BufferedImage bufferedImage = ImageIO.read(is);
			int width = bufferedImage.getWidth();
			int height = bufferedImage.getHeight();
			is.close();
			files.delete();
			String signatureWidth = InitApplicationMessage.signatureWidth;
			String signatureHeight = InitApplicationMessage.signatureHeight
;

			if(width > Integer.valueOf(signatureWidth) || height > Integer.valueOf(signatureHeight)){
				return false;
			}
			return true;
		} catch (Exception e) {
			return false;
		} 
	}
	
	@Override
	@SuppressWarnings({ "restriction", "unchecked" })
	public BaseResponse uploadDocuments(HttpServletRequest request,MultipartFile file)throws ECOMMAPIException{
		BaseResponse br = null;
		try{
			byte[] bytes = file.getBytes();
			String imageType = file.getContentType().split("/")[1];
			String fileType = file.getContentType().split("/")[0];
			String filename = file.getOriginalFilename();
			if("image".equals(fileType) && !checkImages(request, file)){
				br = new BaseResponse();
				br.setErrMsg("The picture is not legitimate");
				return br;
			}
			String base64 =new sun.misc.BASE64Encoder().encode(bytes);
			final Map<String, String> header = headerUtil.getHeader(request);
			Map<String,Object> clientBrowserInfo = ClientBrowserUtil.getClientInfo(request);
			org.json.simple.JSONObject parameters = new org.json.simple.JSONObject();
			parameters.put("clientBrowserInfo", clientBrowserInfo);
			parameters.put("fileType", imageType);
			parameters.put("documentType", "HKID");
			parameters.put("originalFilePath", "C:\\"+filename);
			parameters.put("base64", base64);
			br = connector.uploadDocuments(parameters, header);
		}catch(Exception e) {
			logger.info("SavieServiceImpl sendLead occurs an exception!");
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		
		return br;
	}

}
