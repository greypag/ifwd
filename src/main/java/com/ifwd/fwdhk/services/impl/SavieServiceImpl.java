package com.ifwd.fwdhk.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.connector.ECommWsConnector;
import com.ifwd.fwdhk.connector.response.BaseResponse;
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
import com.ifwd.fwdhk.util.PdfAttribute;
import com.ifwd.fwdhk.util.genPDF;

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
	public void getPlanDetails(Model model, HttpServletRequest request,HttpServletResponse response) throws ECOMMAPIException {
		try {
			String planCode = request.getParameter("planCode");
			String issueAge = request.getParameter("issueAge");
			String paymentTerm = request.getParameter("paymentTerm");
			String premium = request.getParameter("premium");
			String referralCode = request.getParameter("referralCode");
			SaviePlanDetailsResponse apiResponse = connector.saviePlanDetails(planCode, issueAge, paymentTerm, premium, referralCode, null);
			
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
	public void createSalesIllustrationPdf(Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {
		List<PdfAttribute> attributeList = new ArrayList<PdfAttribute>();
		attributeList.add(new PdfAttribute("year", "4"));
		attributeList.add(new PdfAttribute("applicationNo", "自助息理財壽險計劃"));
		attributeList.add(new PdfAttribute("englishName", "Bruce Lee"));
		attributeList.add(new PdfAttribute("gender", "男"));
		attributeList.add(new PdfAttribute("dateTime","11/12/1986"));
		attributeList.add(new PdfAttribute("singlePremiumAmount", "10,000"));
		attributeList.add(new PdfAttribute("age", "15"));
		attributeList.add(new PdfAttribute("paymentMethod", "港幣"));
		attributeList.add(new PdfAttribute("Premium","1,000"));
		attributeList.add(new PdfAttribute("singlePremiumAmount","100,000"));
		attributeList.add(new PdfAttribute("paymentType"," - "));
		attributeList.add(new PdfAttribute("verson","1.0"));
		String year66="66";
		for (int i = 0; i < 13; i++) {
			if(i>5 && i<11){
				attributeList.add(new PdfAttribute("endYear"+i,(i-4)*5+""));
			}
			else if(i<6){
				attributeList.add(new PdfAttribute("endYear"+i,i+""));
			}
			else if(i==11){
				if(year66==null && "".equals(year66)){
					attributeList.add(new PdfAttribute("endYear"+i,"100"));
				}
				else{
					attributeList.add(new PdfAttribute("endYear"+i,"66"));
				}
		    }
			else if(i==12){
				attributeList.add(new PdfAttribute("endYear"+i,"100"));
			}
			attributeList.add(new PdfAttribute("totalPremium"+i,"10,000"));
			if(i<4){
				attributeList.add(new PdfAttribute("interestedRate"+i,"3.21%"));
				attributeList.add(new PdfAttribute("accountEOP"+i,"2.28%"));
				attributeList.add(new PdfAttribute("guranteedSurrenderBenefit"+i,"100,000")); 
			    attributeList.add(new PdfAttribute("guranteedDeathBenefit"+i,"2,000")); 
			}else{
				for(int y=1; y<5; y++){
					attributeList.add(new PdfAttribute("guranteedSurrenderBenefit"+i+y,"100,000")); 
					attributeList.add(new PdfAttribute("guranteedDeathBenefit"+i+y,"2,000")); 
				}
			}
		}
		String name = genPDF.generatePdf2("E:\\template\\SavieProposalTemplateChi3.pdf","E:\\template\\",attributeList,false,"All rights reserved, copy");
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
			final Map<String,String> header = headerUtil.getHeader(request);
			JSONObject parameters = new JSONObject();
			parameters.put("email", request.getParameter("email"));
			parameters.put("mobileNo", request.getParameter("mobileNo"));
			parameters.put("answer1", request.getParameter("answer1"));
			parameters.put("step", request.getParameter("step"));
			br = connector.sendLead(parameters,header);
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
			parameters.put("fileType", "svg");
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
	
	@SuppressWarnings({ "restriction", "unchecked" })
	public BaseResponse uploadDocuments(HttpServletRequest request,MultipartFile file)throws ECOMMAPIException{
		BaseResponse br = null;
		try{
			byte[] bytes = file.getBytes();
			String base64 =new sun.misc.BASE64Encoder().encode(bytes);
			final Map<String, String> header = headerUtil.getHeader(request);
			Map<String,Object> clientBrowserInfo = ClientBrowserUtil.getClientInfo(request);
			org.json.simple.JSONObject parameters = new org.json.simple.JSONObject();
			parameters.put("clientBrowserInfo", clientBrowserInfo);
			parameters.put("fileType", file.getContentType().split("/")[1]);
			parameters.put("documentType", "HKID");
			parameters.put("originalFilePath", "C:\\"+file.getOriginalFilename());
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
