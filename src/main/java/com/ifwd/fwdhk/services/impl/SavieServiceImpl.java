package com.ifwd.fwdhk.services.impl;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
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
import com.ifwd.fwdhk.connector.response.savie.ServiceCentreResponse;
import com.ifwd.fwdhk.connector.response.savie.ServiceCentreResult;
import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.BankBean;
import com.ifwd.fwdhk.model.BankBranchBean;
import com.ifwd.fwdhk.model.DistrictBean;
import com.ifwd.fwdhk.model.OptionItemDesc;
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
import com.ifwd.fwdhk.util.WebServiceUtils;

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
			int issueAge = Integer.valueOf(request.getParameter("issueAge"))+1;
			int paymentTerm = 0;
			
			String premium = request.getParameter("premium");
			String referralCode = request.getParameter("referralCode");
			String paymentMode = request.getParameter("paymentMode");
			if("SP".equals(paymentMode)) {
				httpSession.setAttribute("savieType", "SP");
				paymentTerm = 100-issueAge;
			}else if("RP".equals(paymentMode)) {
				httpSession.setAttribute("savieType", "RP");
				String paymentYear = request.getParameter("paymentYear");
				paymentTerm = paymentYear == null ? 3 : Integer.valueOf(paymentYear);
			}
			
			SaviePlanDetailsResponse apiResponse = connector.saviePlanDetails(planCode, issueAge, paymentTerm, premium, referralCode, paymentMode, null);
			
			httpSession.setAttribute("planDetailData", apiResponse);
            httpSession.setAttribute("birthOfDay", request.getParameter("birthOfDay"));
            
            httpSession.setAttribute("savingAmount", premium);
            httpSession.setAttribute("formatSavingAmount", NumberFormatUtils.formatNumber(premium));
            httpSession.setAttribute("savingDob", request.getParameter("birthOfDay"));
            httpSession.setAttribute("savingPromocode", referralCode);
			
			SaviePlanDetailsBean saviePlanDetailsBean = new SaviePlanDetailsBean();
			saviePlanDetailsBean.setPlanName(planCode.toUpperCase());
			/*if(apiResponse !=null && !apiResponse.hasError()){
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
			request.getSession().setAttribute("planDetail", saviePlanDetailsBean);*/
			
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
						plan0.accumulate("accountBalance", formartNumber(planDetails0Rate.get(i).getAccountEOP()));
						plan0.accumulate("totalPremium", formartNumber(planDetails0Rate.get(i).getTotalPremium()));
						plan0.accumulate("guaranteedSurrenderBenefit", formartNumber(planDetails0Rate.get(i).getGuranteedSurrenderBenefit()));
						plan0.accumulate("guaranteedDeathBenefit", formartNumber(planDetails0Rate.get(i).getGuranteedDeathBenefit()));
						plan0.accumulate("accidentalDeathBenefit", formartNumber(planDetails0Rate.get(i).getAccidentalDeathBenefit()));
						plan0.accumulate("rate","zero");
						plansList.add(plan0);
						
						JSONObject plan2 = new JSONObject();
						plan2.accumulate("accountBalance", formartNumber(planDetails2Rate.get(i).getAccountEOP()));
						plan2.accumulate("totalPremium", formartNumber(planDetails2Rate.get(i).getTotalPremium()));
						plan2.accumulate("guaranteedSurrenderBenefit", formartNumber(planDetails2Rate.get(i).getGuranteedSurrenderBenefit()));
						plan2.accumulate("guaranteedDeathBenefit", formartNumber(planDetails2Rate.get(i).getGuranteedDeathBenefit()));
						plan2.accumulate("accidentalDeathBenefit", formartNumber(planDetails2Rate.get(i).getAccidentalDeathBenefit()));
						plan2.accumulate("rate","two");
						plansList.add(plan2);
						
						JSONObject plan3 = new JSONObject();
						plan3.accumulate("accountBalance", formartNumber(planDetails3Rate.get(i).getAccountEOP()));
						plan3.accumulate("totalPremium", formartNumber(planDetails3Rate.get(i).getTotalPremium()));
						plan3.accumulate("guaranteedSurrenderBenefit", formartNumber(planDetails3Rate.get(i).getGuranteedSurrenderBenefit()));
						plan3.accumulate("guaranteedDeathBenefit", formartNumber(planDetails3Rate.get(i).getGuranteedDeathBenefit()));
						plan3.accumulate("accidentalDeathBenefit", formartNumber(planDetails3Rate.get(i).getAccidentalDeathBenefit()));
						plan3.accumulate("rate","three");
						plansList.add(plan3);
						
						JSONObject plan4 = new JSONObject();
						plan4.accumulate("accountBalance", formartNumber(planDetails4Rate.get(i).getAccountEOP()));
						plan4.accumulate("totalPremium", formartNumber(planDetails4Rate.get(i).getTotalPremium()));
						plan4.accumulate("guaranteedSurrenderBenefit", formartNumber(planDetails4Rate.get(i).getGuranteedSurrenderBenefit()));
						plan4.accumulate("guaranteedDeathBenefit", formartNumber(planDetails4Rate.get(i).getGuranteedDeathBenefit()));
						plan4.accumulate("accidentalDeathBenefit", formartNumber(planDetails4Rate.get(i).getAccidentalDeathBenefit()));
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
				InitApplicationMessage.maritalStatusesEN=commonUtils.getOptionItemDescList("maritalStatuses",language,"reload");
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
				InitApplicationMessage.maritalStatusesCN=commonUtils.getOptionItemDescList("maritalStatuses",language,"reload");
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
				InitApplicationMessage.savieDistrictEN=commonUtils.getOptionItemDescList("savieDistrict",language,"reload");
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
				InitApplicationMessage.savieDistrictCN=commonUtils.getOptionItemDescList("savieDistrict",language,"reload");
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
				InitApplicationMessage.employmentStatusEN=commonUtils.getOptionItemDescList("employmentStatus",language,"reload");
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
				InitApplicationMessage.employmentStatusCN=commonUtils.getOptionItemDescList("employmentStatus",language,"reload");
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
				InitApplicationMessage.nationalityEN=commonUtils.getOptionItemDescList("nationality",language,"reload");
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
				InitApplicationMessage.nationalityCN=commonUtils.getOptionItemDescList("employmentStatus",language,"reload");
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
				InitApplicationMessage.natureOfBusinessEN=commonUtils.getOptionItemDescList("natureOfBusiness",language,"reload");
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
				InitApplicationMessage.natureOfBusinessCN=commonUtils.getOptionItemDescList("natureOfBusiness",language,"reload");
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
				InitApplicationMessage.placeOfBirthEN=commonUtils.getOptionItemDescList("placeOfBirth",language,"reload");
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
				InitApplicationMessage.placeOfBirthCN=commonUtils.getOptionItemDescList("placeOfBirth",language,"reload");
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
				InitApplicationMessage.monthlyPersonalIncomeEN=commonUtils.getOptionItemDescList("monthlyPersonalIncome",language,"reload");
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
				InitApplicationMessage.monthlyPersonalIncomeCN=commonUtils.getOptionItemDescList("monthlyPersonalIncome",language,"reload");
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
				InitApplicationMessage.savieBeneficiaryRelationshipEN=commonUtils.getOptionItemDescList("savieBeneficiaryRelationship",language,"reload");
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
				InitApplicationMessage.savieBeneficiaryRelationshipCN=commonUtils.getOptionItemDescList("savieBeneficiaryRelationship",language,"reload");
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
					InitApplicationMessage.occupationEN=commonUtils.getOptionItemDescList("occupation",language,"reload");
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
					InitApplicationMessage.occupationCN=commonUtils.getOptionItemDescList("occupation",language,"reload");
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
			String serverUrl = request.getScheme()+"://"+request.getServerName()+request.getContextPath();
			if (request.getServerPort() != 80 && request.getServerPort() != 443)
			{
				serverUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
			}
			String message = "<html>" +
                    "<head>" +
					"	<meta charset=\"UTF-8\">" +
                    "</head>" +
                    "<body>" +
                    "<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" style=\"width:100.0%;background:white;border-collapse:collapse\">" +
                    "  <tbody>" +
                    "    <tr>" +
                    "      <td width=\"100%\" valign=\"top\" style=\"width:100.0%;padding:15.0pt 15.0pt 15.0pt 15.0pt\">" +
                    "        <div align=\"center\">" +
                    "          <table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"600\" style=\"width:6.25in;border-collapse:collapse\">" +
                    "            <tbody>" +
                    "              <tr>" +
                    "                <td valign=\"top\" style=\"padding:0in 0in 0in 0in\">" +
                    "                  <div align=\"center\">" +
                    "                    <table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"600\" style=\"width:6.25in;background:white;border-collapse:collapse\">" +
                    "                      <tbody>" +
                    "                        <tr>" +
                    "                          <td valign=\"top\" style=\"padding:6.75pt 0in 0in 0in\">" +
                    "                            <table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" style=\"width:100.0%;border-collapse:collapse\">" +
                    "                              <tbody>" +
                    "                                <tr>" +
                    "                                  <td valign=\"top\" style=\"padding:6.75pt 6.75pt 6.75pt 6.75pt\">" +
                    "                                    <table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"left\" width=\"100%\" style=\"width:100.0%;border-collapse:collapse\">" +
                    "                                      <tbody>" +
                    "                                        <tr>" +
                    "                                          <td valign=\"top\" style=\"padding:0in 6.75pt 0in 6.75pt\">"+
                    "                                            <p class=\"MsoNormal\"><u></u><img width=\"564\" src=\""+serverUrl+"/resources/images/savie-banner.jpg\" align=\"left\" class=\"CToWUd a6T\" tabindex=\"0\">" +
                    "                                              <div class=\"a6S\" dir=\"ltr\" style=\"opacity: 0.01; left: 676px; top: 603px;\">" +
                    "                                                <div id=\":n3\" class=\"T-I J-J5-Ji aQv T-I-ax7 L3 a5q\" role=\"button\" tabindex=\"0\" aria-label=\"Download attachment \" data-tooltip-class=\"a1V\" data-tooltip=\"Download\">" +
                    "                                                  <div class=\"aSK J-J5-Ji aYr\"></div>" +
                    "                                                </div>" +                    
                    "                                              </div><u></u><u></u><u></u>" +
                    "                                            </p>" +
                    "                                          </td>" +
                    "                                        </tr>" +
                    "                                      </tbody>" +
                    "                                    </table>" +
                    "                                  </td>" +
                    "                                </tr>" +
                    "                              </tbody>" +
                    "                            </table>" +
                    "                          </td>" +
                    "                        </tr>" +
                    "                      </tbody>" +
                    "                    </table>" +
                    "                  </div>" +
                    "                </td>" +
                    "              </tr>" +
                    "              <tr>" +
                    "                <td valign=\"top\" style=\"padding:0in 0in 0in 0in\">" +
                    "                  <div align=\"center\">" +
                    "                    <table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"600\" style=\"width:6.25in;background:white;border-collapse:collapse\">" +
                    "                      <tbody>" +
                    "                        <tr>" +
                    "                          <td valign=\"top\" style=\"padding:0in 0in 0in 0in\">" +
                    "                            <table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" style=\"width:100.0%;border-collapse:collapse\">" +
                    "                              <tbody>" +
                    "                                <tr>" +
                    "                                  <td valign=\"top\" style=\"padding:0in 0in 0in 0in\">" +
                    "                                    <table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"left\" width=\"600\" style=\"width:6.25in;border-collapse:collapse\">" +
                    "                                      <tbody>" +
                    "                                        <tr>" +
                    "                                          <td valign=\"top\" style=\"padding:6.75pt 13.5pt 6.75pt 13.5pt\">" +
                    "                                            <p class=\"MsoNormal\" style=\"line-height:15.6pt\"><span class=\"im\"><span lang=\"ZH-TW\" style=\"font-size:11.5pt;font-family:Microsoft JhengHei, Calibri, sans-serif !important;color:#606060\">您好</span><span style=\"font-size:11.5pt;font-family:Microsoft JhengHei, Calibri, sans-serif !important;color:#606060\"><br>" +
                    "&nbsp;<br>" +
                    "</span><span lang=\"ZH-TW\" style=\"font-size:11.5pt;font-family:Microsoft JhengHei, Calibri, sans-serif !important;color:#606060\">您已成功於Savie自助息理財壽險計劃 (「<strong><span style=\"font-family:Microsoft JhengHei, Calibri, sans-serif !important\">本計劃</span></strong>」) 網頁登記電郵地址並加入了本計劃的候補名單。由即日起，您有機會透過已登記的電郵地址收到本計劃接受您申請的電郵通知 (「<strong><span style=\"font-family:Microsoft JhengHei, Calibri, sans-serif !important\">電郵通知</span></strong>」) 。</span><br><br><span lang=\"ZH-TW\" style=\"font-size:11.5pt;font-family:Microsoft JhengHei, Calibri, sans-serif !important;color:#606060\">您可憑該電郵通知內的申請通行碼到本計劃網頁預約時間親臨富衛任何一個客戶服務中心。會面當日，富衛將為您進行簡單財務需要分析以了解本計劃是否適合您的需要；一經確定本計劃迎合您選購保險產品的目標及需要，您便可立刻申請投保。<br><br>於限量發售期間，每位申請人只限以一筆過繳付保費30,000 至 400,000港元申請本計劃保單一份。請密切期待富衛的電郵通知，希望您能夠成為其中一位優先入場的幸運兒！您可瀏覽富衛網頁<a href=https://i.fwd.com.hk/tc/savings-insurance>i.fwd.com.hk/tc/savings-insurance</a>參閱本計劃及活動詳情，本計劃受相關保單條款及細則所約束。</span><span class=\"im\"><span style=\"font-size:11.5pt;font-family:Microsoft JhengHei, Calibri, sans-serif !important;color:#606060\"><br>" +
                    "&nbsp;<br>" +                    
                    "Hi,<br>" +
                    "&nbsp;<br>" +
                    "You have successfully registered your email address at the Savie Insurance Plan (“<strong><span style=\"font-family:Microsoft JhengHei, Calibri, sans-serif !important\">the Plan</span></strong>”) website, and have been placed on the Plan's waiting list. From today onwards, you may receive a notification email (“<strong><span style=\"font-family:Microsoft JhengHei, Calibri, sans-serif !important\">notification email</span></strong>”) that the Plan is open for your application through this registered email address. " +
                    "                                              <br> &nbsp;" +
                    "                                              <br> With the notification email, you can make an appointment to visit one of our customer service centres through the Plan's website. During the appointment, FWD shall conduct a simple financial needs analysis (“<strong><span style=\"font-family:Microsoft JhengHei, Calibri, sans-serif !important\">FNA</span></strong>”) to assess your suitability for the Plan. Once it is confirmed that the Plan meets your objective(s) and need(s), you may immediately apply for the Plan." +
                    "                                              <br> &nbsp;" +
                    "                                              <br> During the limited sales period, each applicant can only apply for one policy of the Plan with a single premium payment of HK$30,000 to HK$400,000. Stay tuned to FWD Notification Email, and we hope you are amongst the lucky ones to receive the priority access! You may also visit the FWD website <a href=https://i.fwd.com.hk/en/savings-insurance>i.fwd.com.hk/en/savings-insurance</a> for more details about this Plan and the campaign. The Plan is subject to its policy provisions and conditions." +
                    "                                              <br> &nbsp;" +
                    "                                              <br>" +
                    "                                              </span><span lang=\"ZH-TW\" style=\"font-size:11.5pt;font-family:Microsoft JhengHei, Calibri, sans-serif !important;color:#606060\">此致</span><span style=\"font-size:11.5pt;font-family:Microsoft JhengHei, Calibri, sans-serif !important;color:#606060\"><br>" +
                    "Yours sincerely,<br>" +
                    "&nbsp;<br>" +
                    "Fanny<br>" +
                    "&nbsp;<br>" +
                    "</span><span lang=\"ZH-TW\" style=\"font-size:11.5pt;font-family:Microsoft JhengHei, Calibri, sans-serif !important;color:#606060\">富衛人壽保險</span><span style=\"font-size:11.5pt;font-family:Microsoft JhengHei, Calibri, sans-serif !important;color:#606060\">(</span><span lang=\"ZH-TW\" style=\"font-size:11.5pt;font-family:Microsoft JhengHei, Calibri, sans-serif !important;color:#606060\">百慕達</span><span style=\"font-size:11.5pt;font-family:Microsoft JhengHei, Calibri, sans-serif !important;color:#606060\">)</span><span lang=\"ZH-TW\" style=\"font-size:11.5pt;font-family:Microsoft JhengHei, Calibri, sans-serif !important;color:#606060\">有限公司</span><span style=\"font-size:11.5pt;font-family:Microsoft JhengHei, Calibri, sans-serif !important;color:#606060\"><br>" +
                    "FWD Life Insurance Company (Bermuda) Limited<br>" +
                    "<a href=\"http://www.fwd.com.hk\" target=\"_blank\">www.fwd.com.hk</a><br><img border=\"0\" width=\"200\" height=\"124\" src=\""+serverUrl+"/resources/images/fwd-logo.jpg\" class=\"CToWUd a6T\" tabindex=\"0\">"+
                    "<div class=\"a6S\" dir=\"ltr\" style=\"opacity: 0.01; left: 362px; top: 1415px;\"><div id=\":n2\" class=\"T-I J-J5-Ji aQv T-I-ax7 L3 a5q\" role=\"button\" tabindex=\"0\" aria-label=\"Download attachment \" data-tooltip-class=\"a1V\" data-tooltip=\"Download\"><div class=\"aSK J-J5-Ji aYr\"></div></div></div>" +
                    "</span><span lang=\"ZH-TW\" style=\"font-size:9.0pt;font-family:Microsoft JhengHei, Calibri, sans-serif !important;color:#606060\">如有任何查詢，請致電富衛</span><span style=\"font-size:9.0pt;font-family:Microsoft JhengHei, Calibri, sans-serif !important;color:#606060\">24</span><span lang=\"ZH-TW\" style=\"font-size:9.0pt;font-family:Microsoft JhengHei, Calibri, sans-serif !important;color:#606060\">小時客戶服務熱線</span><span style=\"font-size:9.0pt;font-family:Microsoft JhengHei, Calibri, sans-serif !important;color:#606060\">(852)" +
                    " 3123 3123<span lang=\"ZH-TW\" style=\"font-family:Microsoft JhengHei, Calibri, sans-serif !important\">或電郵至</span><a href=\"mailto:iService.hk@fwd.com\" target=\"_blank\">iService.hk@fwd.com</a>" +
                    "                                              </span><span lang=\"ZH-TW\" style=\"font-size:9.0pt;font-family:Microsoft JhengHei, Calibri, sans-serif !important;color:#606060\">。</span><span style=\"font-size:9.0pt;font-family:Microsoft JhengHei, Calibri, sans-serif !important;color:#606060\"><br>" +
                    "For enquiry, please contact our FWD 24 hours Customer Service Hotline at (852) 3123 3123 or via email at " +
                    "<a href=\"mailto:iService.hk@fwd.com\" target=\"_blank\">iService.hk@fwd.com</a>.<br>" +
                    "&nbsp;<br>" +
                    "</span><span lang=\"ZH-TW\" style=\"font-size:9.0pt;font-family:Microsoft JhengHei, Calibri, sans-serif !important;color:#606060\">備註：此乃電腦發出之電子郵件，請不要回覆。</span><span style=\"font-size:9.0pt;font-family:Microsoft JhengHei, Calibri, sans-serif !important;color:#606060\"><br>" +
                    "Note: This is an automatically generated email, please do not reply.</span><span style=\"font-size:11.5pt;font-family:Microsoft JhengHei, Calibri, sans-serif !important;color:#606060\"><u></u><u></u></span></span>" +
                    "                                            </p>" +
                    "                                          </td>" +
                    "                                        </tr>" +
                    "                                      </tbody>" +
                    "                                    </table>" +
                    "                                  </td>" +
                    "                                </tr>" +
                    "                              </tbody>" +
                    "                            </table>" +
                    "                          </td>" +
                    "                        </tr>" +
                    "                      </tbody>" +
                    "                    </table>" +
                    "                  </div>" +
                    "                </td>" +
                    "              </tr>" +
                    "              <tr>" +
                    "                <td valign=\"top\" style=\"padding:0in 0in 0in 0in\">" +
                    "                  <div align=\"center\">" +
                    "                    <table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"600\" style=\"width:6.25in;background:white;border-collapse:collapse\">" +
                    "                      <tbody>" +
                    "                        <tr>" +
                    "                          <td valign=\"top\" style=\"padding:0in 0in 0in 0in\">" +
                    "                          </td>" +
                    "                        </tr>" +
                    "                      </tbody>" +
                    "                    </table>" +
                    "                  </div>" +
                    "                </td>" +
                    "              </tr>" +
                    "              <tr>" +
                    "                <td valign=\"top\" style=\"padding:0in 0in 0in 0in\">" +
                    "                  <div align=\"center\">" +
                    "                    <table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"600\" style=\"width:6.25in;background:white;border-collapse:collapse\">" +
                    "                      <tbody>" +
                    "                        <tr>" +
                    "                          <td valign=\"top\" style=\"padding:0in 0in 6.75pt 0in\">" +
                    "                          </td>" +
                    "                        </tr>" +
                    "                      </tbody>" +
                    "                    </table>" +
                    "                  </div>" +
                    "                </td>" +
                    "              </tr>" +
                    "            </tbody>" +
                    "          </table>" +
                    "        </div>" +
                    "      </td>" +
                    "    </tr>" +
                    "  </tbody>" +
                    "</table>" +
                    "</body>" +
                    "</html>";
			
			String subject = "富衛Savie自助息理財壽險計劃候補名單確認電郵";
			String attachment = request.getParameter("attachment");
			String from = UserRestURIConstants.getConfigs("savieMailFrom");
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
	
	/*@SuppressWarnings("unchecked")
	@Override
	public BaseResponse sendEmail(HttpServletRequest request,SendEmailInfo sei)throws ECOMMAPIException{
		BaseResponse br = null;
		try {
			final Map<String,String> header = headerUtil.getHeader(request);
			String to = sei.getPlayerEmail() ;//request.getParameter("to"); //"nathaniel.kw.cheung@fwd.com";//
			String message = "<h1>my testing</h1><u>underline</u>";//request.getParameter("message");//
			String subject = "html testing";//request.getParameter("subject");//
			String attachment = request.getParameter("attachment");//
			String from = UserRestURIConstants.getConfigs("sitFrom");//request.getParameter("from");//
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
	}*/
	
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
			String signatureHeight = InitApplicationMessage.signatureHeight;
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
	
	
	@Override
	public void getOccupation(Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {
		String value = request.getParameter("value");
        String language = request.getParameter("language");
		List<OptionItemDesc> OptionItemDescList = new ArrayList<OptionItemDesc>();
		if("NoB1".equals(value.split("-")[0])){
			if (language.toUpperCase().equals("CN") || language.toUpperCase().equals("TC") || language.toUpperCase().equals("CH") || language.toUpperCase().equals("ZH")){
				OptionItemDescList = InitApplicationMessage.occupationCnNoB1;
			}
			else{
				OptionItemDescList = InitApplicationMessage.occupationEnNoB1;
			}
		}
		if("NoB2".equals(value.split("-")[0])){
			if (language.toUpperCase().equals("CN") || language.toUpperCase().equals("TC") || language.toUpperCase().equals("CH") || language.toUpperCase().equals("ZH")){
				OptionItemDescList = InitApplicationMessage.occupationCnNoB2;
			}
			else{
				OptionItemDescList = InitApplicationMessage.occupationEnNoB2;
			}
		}
		if("NoB3".equals(value.split("-")[0])){
			if (language.toUpperCase().equals("CN") || language.toUpperCase().equals("TC") || language.toUpperCase().equals("CH") || language.toUpperCase().equals("ZH")){
				OptionItemDescList = InitApplicationMessage.occupationCnNoB3;
			}
			else{
				OptionItemDescList = InitApplicationMessage.occupationEnNoB3;
			}
		}
		if("NoB4".equals(value.split("-")[0])){
			if (language.toUpperCase().equals("CN") || language.toUpperCase().equals("TC") || language.toUpperCase().equals("CH") || language.toUpperCase().equals("ZH")){
				OptionItemDescList = InitApplicationMessage.occupationCnNoB4;
			}
			else{
				OptionItemDescList = InitApplicationMessage.occupationEnNoB4;
			}
		}
		if("NoB5".equals(value.split("-")[0])){
			if (language.toUpperCase().equals("CN") || language.toUpperCase().equals("TC") || language.toUpperCase().equals("CH") || language.toUpperCase().equals("ZH")){
				OptionItemDescList = InitApplicationMessage.occupationCnNoB5;
			}
			else{
				OptionItemDescList = InitApplicationMessage.occupationEnNoB5;
			}
		}
		if("NoB6".equals(value.split("-")[0])){
			if (language.toUpperCase().equals("CN") || language.toUpperCase().equals("TC") || language.toUpperCase().equals("CH") || language.toUpperCase().equals("ZH")){
				OptionItemDescList = InitApplicationMessage.occupationCnNoB6;
			}
			else{
				OptionItemDescList = InitApplicationMessage.occupationEnNoB6;
			}
		}
		if("NoB7".equals(value.split("-")[0])){
			if (language.toUpperCase().equals("CN") || language.toUpperCase().equals("TC") || language.toUpperCase().equals("CH") || language.toUpperCase().equals("ZH")){
				OptionItemDescList = InitApplicationMessage.occupationCnNoB7;
			}
			else{
				OptionItemDescList = InitApplicationMessage.occupationEnNoB7;
			}
		}
		if("NoB8".equals(value.split("-")[0])){
			if (language.toUpperCase().equals("CN") || language.toUpperCase().equals("TC") || language.toUpperCase().equals("CH") || language.toUpperCase().equals("ZH")){
				OptionItemDescList = InitApplicationMessage.occupationCnNoB8;
			}
			else{
				OptionItemDescList = InitApplicationMessage.occupationEnNoB8;
			}
		}
		if("NoB9".equals(value.split("-")[0])){
			if (language.toUpperCase().equals("CN") || language.toUpperCase().equals("TC") || language.toUpperCase().equals("CH") || language.toUpperCase().equals("ZH")){
				OptionItemDescList = InitApplicationMessage.occupationCnNoB9;
			}
			else{
				OptionItemDescList = InitApplicationMessage.occupationEnNoB9;
			}
		}
		if("NoB10".equals(value.split("-")[0])){
			if (language.toUpperCase().equals("CN") || language.toUpperCase().equals("TC") || language.toUpperCase().equals("CH") || language.toUpperCase().equals("ZH")){
				OptionItemDescList = InitApplicationMessage.occupationCnNoB10;
			}
			else{
				OptionItemDescList = InitApplicationMessage.occupationEnNoB10;
			}
		}
		if("NoB11".equals(value.split("-")[0])){
			if (language.toUpperCase().equals("CN") || language.toUpperCase().equals("TC") || language.toUpperCase().equals("CH") || language.toUpperCase().equals("ZH")){
				OptionItemDescList = InitApplicationMessage.occupationCnNoB11;
			}
			else{
				OptionItemDescList = InitApplicationMessage.occupationEnNoB11;
			}
		}
		if("NoB12".equals(value.split("-")[0])){
			if (language.toUpperCase().equals("CN") || language.toUpperCase().equals("TC") || language.toUpperCase().equals("CH") || language.toUpperCase().equals("ZH")){
				OptionItemDescList = InitApplicationMessage.occupationCnNoB12;
			}
			else{
				OptionItemDescList = InitApplicationMessage.occupationEnNoB12;
			}
		}
		if("NoB13".equals(value.split("-")[0])){
			if (language.toUpperCase().equals("CN") || language.toUpperCase().equals("TC") || language.toUpperCase().equals("CH") || language.toUpperCase().equals("ZH")){
				OptionItemDescList = InitApplicationMessage.occupationCnNoB13;
			}
			else{
				OptionItemDescList = InitApplicationMessage.occupationEnNoB13;
			}
		}
		if("NoB14".equals(value.split("-")[0])){
			if (language.toUpperCase().equals("CN") || language.toUpperCase().equals("TC") || language.toUpperCase().equals("CH") || language.toUpperCase().equals("ZH")){
				OptionItemDescList = InitApplicationMessage.occupationCnNoB14;
			}
			else{
				OptionItemDescList = InitApplicationMessage.occupationEnNoB14;
			}
		}
		if("NoB15".equals(value.split("-")[0])){
			if (language.toUpperCase().equals("CN") || language.toUpperCase().equals("TC") || language.toUpperCase().equals("CH") || language.toUpperCase().equals("ZH")){
				OptionItemDescList = InitApplicationMessage.occupationCnNoB15;
			}
			else{
				OptionItemDescList = InitApplicationMessage.occupationEnNoB15;
			}
		}
		if("NoB16".equals(value.split("-")[0])){
			if (language.toUpperCase().equals("CN") || language.toUpperCase().equals("TC") || language.toUpperCase().equals("CH") || language.toUpperCase().equals("ZH")){
				OptionItemDescList = InitApplicationMessage.occupationCnNoB16;
			}
			else{
				OptionItemDescList = InitApplicationMessage.occupationEnNoB16;
			}
		}
		if("NoB17".equals(value.split("-")[0])){
			if (language.toUpperCase().equals("CN") || language.toUpperCase().equals("TC") || language.toUpperCase().equals("CH") || language.toUpperCase().equals("ZH")){
				OptionItemDescList = InitApplicationMessage.occupationCnNoB17;
			}
			else{
				OptionItemDescList = InitApplicationMessage.occupationEnNoB17;
			}
		}
		if("NoB18".equals(value.split("-")[0])){
			if (language.toUpperCase().equals("CN") || language.toUpperCase().equals("TC") || language.toUpperCase().equals("CH") || language.toUpperCase().equals("ZH")){
				OptionItemDescList = InitApplicationMessage.occupationCnNoB18;
			}
			else{
				OptionItemDescList = InitApplicationMessage.occupationEnNoB18;
			}
		}
		if("NoB19".equals(value.split("-")[0])){
			if (language.toUpperCase().equals("CN") || language.toUpperCase().equals("TC") || language.toUpperCase().equals("CH") || language.toUpperCase().equals("ZH")){
				OptionItemDescList = InitApplicationMessage.occupationCnNoB19;
			}
			else{
				OptionItemDescList = InitApplicationMessage.occupationEnNoB19;
			}
		}
		if("NoB20".equals(value.split("-")[0])){
			if (language.toUpperCase().equals("CN") || language.toUpperCase().equals("TC") || language.toUpperCase().equals("CH") || language.toUpperCase().equals("ZH")){
				OptionItemDescList = InitApplicationMessage.occupationCnNoB20;
			}
			else{
				OptionItemDescList = InitApplicationMessage.occupationEnNoB20;
			}
		}
		if("NoB21".equals(value.split("-")[0])){
			if (language.toUpperCase().equals("CN") || language.toUpperCase().equals("TC") || language.toUpperCase().equals("CH") || language.toUpperCase().equals("ZH")){
				OptionItemDescList = InitApplicationMessage.occupationCnNoB21;
			}
			else{
				OptionItemDescList = InitApplicationMessage.occupationEnNoB21;
			}
		}
		if("NoB22".equals(value.split("-")[0])){
			if (language.toUpperCase().equals("CN") || language.toUpperCase().equals("TC") || language.toUpperCase().equals("CH") || language.toUpperCase().equals("ZH")){
				OptionItemDescList = InitApplicationMessage.occupationCnNoB22;
			}
			else{
				OptionItemDescList = InitApplicationMessage.occupationEnNoB22;
			}
		}
		if("NoB23".equals(value.split("-")[0])){
			if (language.toUpperCase().equals("CN") || language.toUpperCase().equals("TC") || language.toUpperCase().equals("CH") || language.toUpperCase().equals("ZH")){
				OptionItemDescList = InitApplicationMessage.occupationCnNoB23;
			}
			else{
				OptionItemDescList = InitApplicationMessage.occupationEnNoB23;
			}
		}
		if("NoB24".equals(value.split("-")[0])){
			if (language.toUpperCase().equals("CN") || language.toUpperCase().equals("TC") || language.toUpperCase().equals("CH") || language.toUpperCase().equals("ZH")){
				OptionItemDescList = InitApplicationMessage.occupationCnNoB24;
			}
			else{
				OptionItemDescList = InitApplicationMessage.occupationEnNoB24;
			}
		}
        JSONArray jsonOptionItemDescs = new JSONArray();
        if(OptionItemDescList!=null && OptionItemDescList.size()>0){
			for(int i = 0; i<OptionItemDescList.size(); i++){
				OptionItemDesc desc = OptionItemDescList.get(i);
				org.json.simple.JSONObject object = new org.json.simple.JSONObject();
				
				object.put("itemTable", desc.getItemTable());
				object.put("itemCode", desc.getItemCode());
				object.put("itemLang", desc.getItemLang());
				object.put("itemDesc", desc.getItemDesc());
				jsonOptionItemDescs.add(object);
			}
		}
        
		response.setContentType("text/json;charset=utf-8");
		try {
			logger.info(jsonOptionItemDescs.toString());
			response.getWriter().print(jsonOptionItemDescs.toString());
		}catch(Exception e) {  
			e.printStackTrace();
		}
	}
	
	@Override
	public void verifyAccessCode(Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {
		response.setContentType("text/json;charset=utf-8");
		String accessCode = request.getParameter("accessCode");
		accessCode = accessCode.replace(" ", "");
		//request.getSession().setAttribute("accessCode", accessCode);
		String Url = UserRestURIConstants.SERVICE_URL + "/savie/accessCodes/validate?accessCode="+accessCode;
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc")) {
			lang = "CN";
		}
		
		HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
		header.put("userName", "*DIRECTGI");
		header.put("token", commonUtils.getToken("reload"));
		header.put("language", WebServiceUtils.transformLanaguage(lang));
		
		org.json.simple.JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,Url, header, null);
		
		response.setContentType("text/json;charset=utf-8");
		try {
			logger.info(responseJsonObj.toString());
			response.getWriter().print(responseJsonObj.toString());
		}catch(Exception e) {  
			e.printStackTrace();
		}
	}
	
	/**
	 * 通过ajax获取时间段
	 */
	@Override
	public void getAllAvailableTimeSlot(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/json;charset=utf-8");
		String Url = UserRestURIConstants.SERVICE_URL + "/appointment/timeSlot/all";
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc")) {
			lang = "CN";
		}
		
		HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
		header.put("userName", "*DIRECTGI");
		header.put("token", commonUtils.getToken("reload"));
		header.put("language", WebServiceUtils.transformLanaguage(lang));
		
		org.json.simple.JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,Url, header, null);
		
		response.setContentType("text/json;charset=utf-8");
		try {
			logger.info(responseJsonObj.toString());
			response.getWriter().print(responseJsonObj.toString());
		}catch(Exception e) {  
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 通过ajax获取时间段
	 */
	@Override
	public void getTimeSlot(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		org.json.simple.JSONObject responseJsonObj = new org.json.simple.JSONObject();
		if(org.apache.commons.lang.StringUtils.isNotBlank((String)session.getAttribute("savingAmount")) && org.apache.commons.lang.StringUtils.isNotBlank((String)session.getAttribute("username")) && org.apache.commons.lang.StringUtils.isNotBlank((String)session.getAttribute("accessCode"))) {
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
	 * 保存储蓄金额
	 */
	public void saveAmount(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String savingAmount = (String) request.getParameter("savingAmount");
		String savingDob = (String) request.getParameter("savingDob");
		String savingPromocode = (String) request.getParameter("savingPromocode");
		
		HttpSession session = request.getSession();
		session.setAttribute("savingAmount", savingAmount);
		session.setAttribute("formatSavingAmount", NumberFormatUtils.formatNumber(savingAmount));
		session.setAttribute("savingDob", savingDob);
		session.setAttribute("savingPromocode", savingPromocode);
	}
	
	public void confirmationOffline(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String preferred_date = (String) request.getParameter("preferred-date");
		String preferred_time = (String) request.getParameter("preferred-time");
		String centre = (String) request.getParameter("centre");
		if(null != preferred_date){
			session.setAttribute("preferred_date", preferred_date);
		}
		if(null != preferred_time){
			session.setAttribute("preferred_time", preferred_time);
		}
		if(null != centre){
			session.setAttribute("centre", centre);
		}
		
		if(null != centre){
			String lang = UserRestURIConstants.getLanaguage(request);
			ServiceCentreResponse serviceCentreResponse;
			if (lang.equals("tc")) {
				serviceCentreResponse = InitApplicationMessage.serviceCentreCN;
			}else {
				serviceCentreResponse = InitApplicationMessage.serviceCentreEN;
			}
			for(ServiceCentreResult entity : serviceCentreResponse.getServiceCentres()) {
				if(entity.getServiceCentreCode().equals(centre)) {
					session.setAttribute("centreDetails", entity);
					break;
				}
			}
		}
		else{
			centre = (String) session.getAttribute("centre");
			String lang = UserRestURIConstants.getLanaguage(request);
			ServiceCentreResponse serviceCentreResponse;
			if (lang.equals("tc")) {
				serviceCentreResponse = InitApplicationMessage.serviceCentreCN;
			}else {
				serviceCentreResponse = InitApplicationMessage.serviceCentreEN;
			}
			for(ServiceCentreResult entity : serviceCentreResponse.getServiceCentres()) {
				if(entity.getServiceCentreCode().equals(centre)) {
					session.setAttribute("centreDetails", entity);
					break;
				}
			}
		}
		//清空储蓄金额
		/*HttpSession session = session;
		session.removeAttribute("savingAmount");*/
	}
	
	@Override
	public BaseResponse sendAppointmentAcknowledgeMail(HttpServletRequest request)throws ECOMMAPIException{
		BaseResponse br = null;
		try {
			String applicationNumber = (String) request.getSession().getAttribute("applicationNumber");
			String perferred_Date = (String) request.getParameter("perferredDate");
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
			Date date = sdf.parse(perferred_Date);
			SimpleDateFormat sdfC = new SimpleDateFormat("yyyy年MM月dd日",Locale.CHINESE); 
			String perferredDateC = sdfC.format(date);
			SimpleDateFormat sdfE = new SimpleDateFormat("dd MMM yyyy",Locale.US); 
			String perferredDateE = sdfE.format(date);
			String perferredTime = (String) request.getParameter("perferredTime");
			String csCenter = (String) request.getParameter("csCenter");
			ServiceCentreResult scrChi = new ServiceCentreResult();
			ServiceCentreResult scrEng = new ServiceCentreResult();
			
			
			if(null != csCenter){
				ServiceCentreResponse serviceCentreResponseChi;
				ServiceCentreResponse serviceCentreResponseEng;
				
				
				serviceCentreResponseChi = InitApplicationMessage.serviceCentreCN;
				
				serviceCentreResponseEng = InitApplicationMessage.serviceCentreEN;
				
				for(ServiceCentreResult entity : serviceCentreResponseChi.getServiceCentres()) {
					if(entity.getServiceCentreCode().equals(csCenter)) {
						scrChi = entity;
						
						break;
					}
				}
				for(ServiceCentreResult entity : serviceCentreResponseEng.getServiceCentres()) {
					if(entity.getServiceCentreCode().equals(csCenter)) {
						scrEng = entity;
						
						break;
					}
				}
			}
			
			final Map<String,String> header = headerUtil.getHeader(request);
			header.put("language", "ZH");
			String to = (String) request.getSession().getAttribute("emailAddress");
			logger.info("To Email:"+to);
			String serverUrl = request.getScheme()+"://"+request.getServerName()+request.getContextPath();
			if (request.getServerPort() != 80 && request.getServerPort() != 443)
			{
				serverUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
			}
			
			
//			String message1 = "<h2 style=\"font-family:'Microsoft JhengHei', Calibri, sans-serif;color:#FF8200;font-size:24px;background-color:#FFFFFF;\"></h2>"+
//                             "<h2 style=\"font-family:'Microsoft JhengHei', Calibri, sans-serif;color:#FF8200;font-size:24px;background-color:#FFFFFF;\">預約詳情</h2>"+
//                             "<div class=\"appointment-detail clearfix\" style=\"color:#333333;font-family:'Microsoft JhengHei', Calibri, sans-serif;font-size:16px;background-color:#FFFFFF;\">"+
//                             "日期 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span class=\"pull-left\">"+perferredDate+"</span></div>"+
//                             "<div class=\"appointment-detail clearfix\" style=\"color:#333333;font-family:'Microsoft JhengHei', Calibri, sans-serif;font-size:16px;background-color:#FFFFFF;\">"+
//	                         "時間 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<span class=\"pull-left\">"+perferredTime+"</span></div>"+
//                             "<div class=\"appointment-detail clearfix\" style=\"color:#333333;font-family:'Microsoft JhengHei', Calibri, sans-serif;font-size:16px;background-color:#FFFFFF;\">"+
//	                         "客戶服務中心 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span class=\"pull-left\">"+scr.getServiceCentreName()+"</span></div>"+
//                             "<div class=\"appointment-detail clearfix\" style=\"color:#333333;font-family:'Microsoft JhengHei', Calibri, sans-serif;font-size:16px;background-color:#FFFFFF;\">"+
//	                         "地址 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<span class=\"pull-left\">"+scr.getAddress()+"</span></div>"+
//                             "<div class=\"appointment-detail clearfix\" style=\"color:#333333;font-family:'Microsoft JhengHei', Calibri, sans-serif;font-size:16px;background-color:#FFFFFF;\">"+
//	                         "參考編號 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span class=\"pull-left\">"+applicationNumber+"</span></div>"+
//                             "<div class=\"appointment-detail clearfix\" style=\"color:#333333;font-family:'Microsoft JhengHei', Calibri, sans-serif;font-size:16px;background-color:#FFFFFF;\">"+
//	                         "電話號碼 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span class=\"pull-left\">"+scr.getPhone()+"</span></div>"+
//                             "<div class=\"appointment-detail clearfix\" style=\"color:#333333;font-family:'Microsoft JhengHei', Calibri, sans-serif;font-size:16px;background-color:#FFFFFF;\">"+
//	                         "辦公時間 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span class=\"pull-left\">"+scr.getOperationHours()+"</span></div>"+
//                             "<div class=\"appointment-detail clearfix\" style=\"color:#333333;font-family:'Microsoft JhengHei', Calibri, sans-serif;font-size:16px;background-color:#FFFFFF;\"><span class=\"pull-left\"></span></div>";
			
	
			String message = "<head>\r\n" + 
					"			    <meta charset=\"UTF-8\">\r\n" + 
					"			    <title>富衛Savie自助息理財壽險計劃申請預約確認電郵</title>\r\n" + 
					"			  </head>\r\n" + 
					"			  <body>\r\n" + 
					"			    <div marginwidth=\"0\" marginheight=\"0\" style=\"margin:0;padding:0;background-color:#f2f2f2;min-height:100%!important;width:100%!important\">\r\n" + 
					"			      <center>\r\n" + 
					"			        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" height=\"100%\" width=\"100%\" style=\"border-collapse:collapse;margin:0;padding:0;background-color:#f2f2f2;height:100%!important;width:100%!important\">\r\n" + 
					"			          <tbody>\r\n" + 
					"			            <tr>\r\n" + 
					"			              <td align=\"center\" valign=\"top\" style=\"margin:0;padding:20px;border-top:0;height:100%!important;width:100%!important\">\r\n" + 
					"			                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;border:0\">\r\n" + 
					"			                  <tbody>\r\n" + 
					"			                    <tr>\r\n" + 
					"			                      <td align=\"center\" valign=\"top\">\r\n" + 
					"			                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;background-color:#ffffff;border-top:0;border-bottom:0\">\r\n" + 
					"			                          <tbody>\r\n" + 
					"			                            <tr>\r\n" + 
					"			                              <td valign=\"top\" style=\"padding-top:9px\">\r\n" + 
					"			                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\r\n" + 
					"			                                  <tbody>\r\n" + 
					"			                                    <tr>\r\n" + 
					"			                                      <td valign=\"top\">\r\n" + 
					"			                                        <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"266\" style=\"border-collapse:collapse\">\r\n" + 
					"			                                          <tbody>\r\n" + 
					"			                                            <tr>\r\n" + 
					"			                                              <td valign=\"top\" style=\"padding-top:9px;padding-left:18px;padding-bottom:9px;padding-right:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px;line-height:125%;text-align:left\">\r\n" + 
					"			                                                <a href=\"https://i.fwd.com.hk/tc/?utm_source=edm&amp;utm_medium=cpc&amp;utm_campaign=EDM%7CSA%7CP2%7CO2O+Appointment+Confirmation&amp;utm_content=logo\" style=\"word-wrap:break-word;color:#606060;font-weight:normal;text-decoration:underline\" target=\"_blank\"><img align=\"none\" src=\""+serverUrl+"/resources/images/savie-fwd-logo.jpg\" style=\"margin:0px;border:0;outline:none;text-decoration:none;min-height:auto!important\" class=\"CToWUd\"></a>\r\n" + 
					"			                                              </td>\r\n" + 
					"			                                            </tr>\r\n" + 
					"			                                          </tbody>\r\n" + 
					"			                                        </table>\r\n" + 
					"			                                        <table align=\"right\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"297\" style=\"border-collapse:collapse\">\r\n" + 
					"			                                          <tbody>\r\n" + 
					"			                                            <tr>\r\n" + 
					"			                                              <td valign=\"top\" style=\"padding-top:9px;padding-right:18px;padding-bottom:9px;padding-left:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px;line-height:125%;text-align:left\">\r\n" + 
					"			                                                <div style=\"text-align:right\"><br>\r\n" + 
					"			                                                </div>\r\n" + 
					"			                                              </td>\r\n" + 
					"			                                            </tr>\r\n" + 
					"			                                          </tbody>\r\n" + 
					"			                                        </table>\r\n" + 
					"			                                      </td>\r\n" + 
					"			                                    </tr>\r\n" + 
					"			                                  </tbody>\r\n" + 
					"			                                </table>\r\n" + 
					"			                              </td>\r\n" + 
					"			                            </tr>\r\n" + 
					"			                          </tbody>\r\n" + 
					"			                        </table>\r\n" + 
					"			                      </td>\r\n" + 
					"			                    </tr>\r\n" + 
					"			                    <tr>\r\n" + 
					"			                      <td align=\"center\" valign=\"top\">\r\n" + 
					"			                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;background-color:#ffffff;border-top:0;border-bottom:0\">\r\n" + 
					"			                          <tbody>\r\n" + 
					"			                            <tr>\r\n" + 
					"			                              <td valign=\"top\">\r\n" + 
					"			                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\r\n" + 
					"			                                  <tbody>\r\n" + 
					"			                                    <tr>\r\n" + 
					"			                                      <td valign=\"top\" style=\"padding:0px\">\r\n" + 
					"			                                        <table align=\"left\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n" + 
					"			                                          <tbody>\r\n" + 
					"			                                            <tr>\r\n" + 
					"			                                              <td valign=\"top\" style=\"padding-right:0px;padding-left:0px;padding-top:0;padding-bottom:0;text-align:center\">\r\n" + 
					"			                                                <img align=\"center\" alt=\"\" src=\""+serverUrl+"/resources/images/FWD_Hero-images_Savie-OP.jpg\" width=\"600\" style=\"max-width:600px;padding-bottom:0;display:inline!important;vertical-align:bottom;border:0;outline:none;text-decoration:none\" class=\"CToWUd a6T\" tabindex=\"0\">\r\n" + 
					"			                                                <div class=\"a6S\" dir=\"ltr\" style=\"opacity: 0.01; left: 572px; top: 311px;\">\r\n" + 
					"			                                                  <div id=\":sw\" class=\"T-I J-J5-Ji aQv T-I-ax7 L3 a5q\" role=\"button\" tabindex=\"0\" aria-label=\"Download attachment \" data-tooltip-class=\"a1V\" data-tooltip=\"Download\">\r\n" + 
					"			                                                    <div class=\"aSK J-J5-Ji aYr\"></div>\r\n" + 
					"			                                                  </div>\r\n" + 
					"			                                                </div>\r\n" + 
					"			                                              </td>\r\n" + 
					"			                                            </tr>\r\n" + 
					"			                                          </tbody>\r\n" + 
					"			                                        </table>\r\n" + 
					"			                                      </td>\r\n" + 
					"			                                    </tr>\r\n" + 
					"			                                  </tbody>\r\n" + 
					"			                                </table>\r\n" + 
					"			                              </td>\r\n" + 
					"			                            </tr>\r\n" + 
					"			                          </tbody>\r\n" + 
					"			                        </table>\r\n" + 
					"			                      </td>\r\n" + 
					"			                    </tr>\r\n" + 
					"			                    <tr>\r\n" + 
					"			                      <td align=\"center\" valign=\"top\">\r\n" + 
					"			                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;background-color:#ffffff;border-top:0;border-bottom:0\">\r\n" + 
					"			                          <tbody>\r\n" + 
					"			                            <tr>\r\n" + 
					"			                              <td valign=\"top\">\r\n" + 
					"			                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\r\n" + 
					"			                                  <tbody>\r\n" + 
					"			                                    <tr>\r\n" + 
					"			                                      <td valign=\"top\">\r\n" + 
					"			                                        <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse\">\r\n" + 
					"			                                          <tbody>\r\n" + 
					"			                                            <tr>\r\n" + 
					"			                                              <td valign=\"top\" style=\"padding:9px 18px;line-height:125%;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px;text-align:left\">\r\n" + 
					"			                                                <div style=\"text-align:center\">\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">您好，</span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">恭喜！您已完成自助息理財壽險計劃 (「本計劃」) 的申請預約，<wbr>煩請於預約時間帶備下列文件親臨以下客戶服務中心完成簡單的財務需要分析，<wbr>以評估本計劃是否切合您的需要。<wbr>而一經確定，您便可立即於客戶服務中心投保。<wbr>預約詳情及所需文件如下:</p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>日期:  </strong></span><span style=\"color:#000000\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" + perferredDateC + "</span></span></span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>時間:  </strong></span><span style=\"color:#000000\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" + perferredTime + "</span></span></span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>客戶服務中心:  </strong></span><span style=\"color:#000000\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" +scrChi.getServiceCentreName() + "</span></span></span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>地址:  </strong></span><span style=\"color:#000000\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" + scrChi.getAddress() + "</span></span></span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>參考編號: </strong></span><span style=\"color:#000000\"><span style=\"line-height:125%;background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" + applicationNumber + "</span></span></span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>所需文件:</strong></span><br /><span style=\"color:#000000\"><span style=\"line-height:125%;background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">1. 香港身份證 <br>  <span style=\"line-height:125%;background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap;font-size:12px\">   (如您並非香港永久性居民，您必須出示香港身份證及護照作為證明。)</span><br />2.三個月內的<a style=\"color:#ff8c00\" href=\""+serverUrl+"/resources/policy-provisions-pdf/Savie_Address_Proof.pdf\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap;text-decoration:underline;\">有效住址證明</span></a><br />3.繳付保費 - 申請人之支票/銀行資料以作填寫自動轉賬授權書之用/申請人之交通銀行信用卡<br />4.海洋公園所發行的成人金卡或成人銀卡智紛全年入場證正本*(如有)</span></span></span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>付款方式:</strong></span><br /><span style=\"color:#000000\"><span style=\"line-height:125%;background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">1.申請人之支票；或<br />2.申請人之交通銀行信用卡；或<br />3. 銀行自動轉帳</span></span></span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>保費金額:</strong></span><br /><span style=\"color:#000000\"><span style=\"line-height:125%;background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">本計劃的一筆過保費為港幣三萬元至四十萬元內。<wbr>客戶可於投保當日因應財務需要分析及個人意願以作決定。</span></span></span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">如欲更改預約時段或客戶服務中心，請致電富衛24小時客戶服務熱線<span style=\"color:#ff8c00\"><span style=\"font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\">(852) 3123 3123</span></span>。</span></span>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">此致</span></span>\r\n" +
					"			                                                  </p>\r\n" +
					"			                                                  &nbsp;\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">Hi,</span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">Congratulations! You have completed the application appointment for Savie Insurance Plan (the \"Plan\"). Please kindly visit our customer service centre at the scheduled timeslot with the required documents set out below to conduct a simple financial needs analysis (\"FNA\") to assess your suitability for the Plan. Once your needs are confirmed, you may begin the application process immediately at the customer service centre. The appointment details are as follows:</p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>Date:  </strong></span><span style=\"color:#000000\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" + perferredDateE + "</span></span></span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>Time:  </strong></span><span style=\"color:#000000\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" + perferredTime + "</span></span></span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>Customer service centre:  </strong></span><span style=\"color:#000000\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" +scrEng.getServiceCentreName() + "</span></span></span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>Address:  </strong></span><span style=\"color:#000000\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" + scrEng.getAddress() + "</span></span></span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>Reference number:  </strong></span><span style=\"color:#000000\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" + applicationNumber + "</span></span></span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>Required documents:</strong></span><br /><span style=\"color:#000000\"><span style=\"line-height:125%;background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">1. HKID card <br>  <span style=\"line-height:125%;background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap;font-size:12px\">   (If you are a non-permanent Hong Kong resident, you must present your HKID Card and your passport for verification.)</span><br />2. <a style=\"color:#ff8c00\" href=\""+serverUrl+"/resources/policy-provisions-pdf/Savie_Address_Proof.pdf\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap;text-decoration:underline;\">A valid address proof</span></a> within the last 3 months  <br />3. Premium Payment – Personal cheque of the applicant/the applicant’s bank information for completing the direct debit authorization form/the applicant’s Bank of Communication FWD Credit Card<br />4.	Original copy of SmartFun Annual Pass (Gold Pass-Adult) or SmartFun Annual Pass (Silver Pass-Adult)issued by Ocean Park Corporation*(If applicable)</span></span></span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>Payment methods: </strong></span><br /><span style=\"color:#000000\"><span style=\"line-height:125%;background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">1. Personal cheque of the applicant; or<br />2. The applicant’s Bank of Communication FWD Credit Card; or<br />3. Bank direct debit</span></span></span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>Premium: </strong></span><br /><span style=\"color:#000000\"><span style=\"line-height:125%;background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">The one-off payment of the Plan is between HK$30,000 and HK$400,000. Customers have the right to decide the premium amount based on the FNA results or at his/her personal discretion on the day of application.</span></span></span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">For questions regarding appointments, please contact our FWD 24 hours Customer Service Hotline at <span style=\"color:#ff8c00\"><span style=\"font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\">(852) 3123 3123</span></span>.</span></span>\r\n" +
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">Yours sincerely,<br>Fanny from FWD<br><br>富衛人壽保險(百慕達)有限公司<br>FWD Life Insurance Company (Bermuda) Limited<br>www.fwd.com.hk</span></span>\r\n" +
					"			                                                  </p>\r\n" + 
					"			                                                  &nbsp;\r\n" + 
					"			                                                </div>\r\n" + 
					"			                                              </td>\r\n" + 
					"			                                            </tr>\r\n" + 
					"			                                          </tbody>\r\n" + 
					"			                                        </table>\r\n" + 
					"			                                      </td>\r\n" + 
					"			                                    </tr>\r\n" + 
					"			                                  </tbody>\r\n" + 
					"			                                </table>\r\n" + 
					"			                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\r\n" + 
					"			                                  <tbody>\r\n" + 
					"			                                    <tr>\r\n" + 
					"			                                      <td style=\"padding:18px\">\r\n" + 
					"			                                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-top-width:1px;border-top-style:dotted;border-top-color:#999999;border-collapse:collapse\">\r\n" + 
					"			                                          <tbody>\r\n" + 
					"			                                            <tr>\r\n" + 
					"			                                              <td>\r\n" + 
					"			                                                <span></span>\r\n" + 
					"			                                              </td>\r\n" + 
					"			                                            </tr>\r\n" + 
					"			                                          </tbody>\r\n" + 
					"			                                        </table>\r\n" + 
					"			                                      </td>\r\n" + 
					"			                                    </tr>\r\n" + 
					"			                                  </tbody>\r\n" + 
					"			                                </table>\r\n" + 
					"			                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\r\n" + 
					"			                                  <tbody>\r\n" + 
					"			                                    <tr>\r\n" + 
					"			                                      <td valign=\"top\">\r\n" + 
					"			                                        <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse\">\r\n" + 
					"			                                          <tbody>\r\n" + 
					"			                                            <tr>\r\n" + 
					"			                                              <td valign=\"top\" style=\"padding-top:9px;padding-right:18px;padding-bottom:9px;padding-left:18px;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px;line-height:150%;text-align:left\">\r\n" + 
					"			                                                <p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:0pt;text-align:center;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"color:#000000;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\">如有任何查詢，請致電富衛24小時客戶服務熱線</span><span style=\"color:#ff8c00\"><span style=\"font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\">(852) 3123 3123</span></span><span style=\"color:#000000;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\">或電郵至</span><span style=\"color:#ff8c00\"><span style=\"font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\"><a href=\"mailto:iService.hk@fwd.com\" target=\"_blank\">iService.hk@fwd.com</a></span></span><span style=\"color:#000000;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\">。</span></p>\r\n" + 
					"			                                                <p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:0pt;text-align:center;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"color:#000000;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\">For enquiry, please contact our FWD 24 hours Customer Service Hotline at </span><span style=\"color:#ff8c00\"><span style=\"font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\">(852) 3123 3123</span></span><span style=\"color:#000000;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\"> or via email at </span><span style=\"color:#ff8c00\"><span style=\"font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\"><a href=\"mailto:iService.hk@fwd.com\" target=\"_blank\">iService.hk@fwd.com</a></span></span><span style=\"color:#000000;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\">.</span></p>\r\n" + 
					"			                                              </td>\r\n" + 
					"			                                            </tr>\r\n" + 
					"			                                          </tbody>\r\n" + 
					"			                                        </table>\r\n" + 
					"			                                      </td>\r\n" + 
					"			                                    </tr>\r\n" + 
					"			                                  </tbody>\r\n" + 
					"			                                </table>\r\n" + 
					"			                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\r\n" + 
					"			                                  <tbody>\r\n" + 
					"			                                    <tr>\r\n" + 
					"			                                      <td valign=\"top\">\r\n" + 
					"			                                        <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse\">\r\n" + 
					"			                                          <tbody>\r\n" + 
					"			                                            <tr>\r\n" + 
					"			                                              <td valign=\"top\" style=\"padding-top:9px;padding-right:18px;padding-bottom:9px;padding-left:18px;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px;line-height:150%;text-align:left\">\r\n" + 
					"			                                                <div style=\"text-align:center\">備註：此乃電腦發出之電子郵件，請不要回覆。<br>Note: This is an automatically generated email, please do not reply.</div>\r\n" + 
					"			                                              </td>\r\n" + 
					"			                                            </tr>\r\n" + 
					"			                                          </tbody>\r\n" + 
					"			                                        </table>\r\n" + 
					"			                                      </td>\r\n" + 
					"			                                    </tr>\r\n" + 
					"			                                  </tbody>\r\n" + 
					"			                                </table>\r\n" + 
					"			                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\r\n" + 
					"			                                  <tbody>\r\n" + 
					"			                                    <tr>\r\n" + 
					"			                                      <td style=\"padding:18px\">\r\n" + 
					"			                                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-top-width:1px;border-top-style:dotted;border-top-color:#999999;border-collapse:collapse\">\r\n" + 
					"			                                          <tbody>\r\n" + 
					"			                                            <tr>\r\n" + 
					"			                                              <td>\r\n" + 
					"			                                                <span></span>\r\n" + 
					"			                                              </td>\r\n" + 
					"			                                            </tr>\r\n" + 
					"			                                          </tbody>\r\n" + 
					"			                                        </table>\r\n" + 
					"			                                      </td>\r\n" + 
					"			                                    </tr>\r\n" + 
					"			                                  </tbody>\r\n" + 
					"			                                </table>\r\n" + 
					"			                              </td>\r\n" + 
					"			                            </tr>\r\n" + 
					"			                          </tbody>\r\n" + 
					"			                        </table>\r\n" + 
					"			                      </td>\r\n" + 
					"			                    </tr>\r\n" + 
					"			                    <tr>\r\n" + 
					"			                      <td align=\"center\" valign=\"top\">\r\n" + 
					"			                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;background-color:#ffffff;border-top:0;border-bottom:0\">\r\n" + 
					"			                          <tbody>\r\n" + 
					"			                            <tr>\r\n" + 
					"			                              <td valign=\"top\" style=\"padding-bottom:9px\">\r\n" + 
					"			                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\r\n" + 
					"			                                  <tbody>\r\n" + 
					"			                                    <tr>\r\n" + 
					"			                                      <td valign=\"top\">\r\n" + 
					"			                                        <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse\">\r\n" + 
					"			                                          <tbody>\r\n" + 
					"			                                            <tr>\r\n" + 
					"			                                              <td valign=\"top\" style=\"padding-top:9px;padding-right:18px;padding-bottom:9px;padding-left:18px;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px;line-height:125%;text-align:left\">\r\n" + 
					"			                                                <div style=\"text-align:center\">\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:10pt;text-align:center;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">富衛人壽保險(百慕達)有限公司</span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:10pt;text-align:center;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px\"><a href=\"http://www.fwd.com/hk/?utm_source=edm&amp;utm_medium=cpc&amp;utm_campaign=EDM%7CSA%7CP2%7CO2O+Access+Code&amp;utm_content=copy\" style=\"word-wrap:break-word;color:#606060;font-weight:normal;text-decoration:underline\" target=\"_blank\"><span style=\"color:#ff8c00\"><span style=\"font-family:microsoft jhenghei,calibri,sans-serif\"><span><span style=\"background-color:transparent;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">www.fwd.com.hk</span></span></span></span></a></p>\r\n" + 
					"			                                                </div>\r\n" + 
					"			                                              </td>\r\n" + 
					"			                                            </tr>\r\n" + 
					"			                                          </tbody>\r\n" + 
					"			                                        </table>\r\n" + 
					"			                                      </td>\r\n" + 
					"			                                    </tr>\r\n" + 
					"			                                  </tbody>\r\n" + 
					"			                                </table>\r\n" + 
					"			                              </td>\r\n" + 
					"			                            </tr>\r\n" + 
					"			                          </tbody>\r\n" + 
					"			                        </table>\r\n" + 
					"			                      </td>\r\n" + 
					"			                    </tr>\r\n" + 
					"			                  </tbody>\r\n" + 
					"			                </table>\r\n" + 
					"			              </td>\r\n" + 
					"			            </tr>\r\n" + 
					"			          </tbody>\r\n" + 
					"			        </table>\r\n" + 
					"			      </center>\r\n" + 
					"			    </div>\r\n" + 
					"			  </body>\r\n" + 
					"			</html>";
			 
			String subject = "Savie Appointment Acknowledgement email from FWD";
			String attachment = "";
			String from = UserRestURIConstants.getConfigs("savieMailFrom");
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
			logger.info("SavieServiceImpl sendAppointmentAcknowledgeMail occurs an exception!");
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		return br;
	}
	private String formartNumber(String num){
		if(num.contains(".")){
			num = num.split("\\.")[0];
		}
		return num;
	}
}
