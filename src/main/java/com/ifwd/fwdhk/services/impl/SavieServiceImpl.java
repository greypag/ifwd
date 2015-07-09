package com.ifwd.fwdhk.services.impl;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
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
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.InitApplicationMessage;

@Service
public class SavieServiceImpl implements SavieService {
	
	
	@Autowired
	private RestServiceDao restService;
	
	@Autowired
	private CommonUtils commonUtils;

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
	public SaviePlanDetailsBean getPlanDetails(org.json.simple.JSONObject apiJsonObj,String product,String issueAge,String paymentTerm,String premium,String referralCode) {
		SaviePlanDetailsBean saviePlanDetailsBean = new SaviePlanDetailsBean();
		saviePlanDetailsBean.setPlanName(product.toUpperCase());
		if(null == apiJsonObj.get("errMsgs")){
			String jsonStr = apiJsonObj.toJSONString();
			JSONObject responseJsonObj = JSONObject.fromObject(jsonStr);
			
			List<JSONObject> planDetails0Rate = (List<JSONObject>) responseJsonObj.get("planDetails0Rate");
			List<JSONObject> planDetails2Rate = (List<JSONObject>) responseJsonObj.get("planDetails2Rate");
			List<JSONObject> planDetails3Rate = (List<JSONObject>) responseJsonObj.get("planDetails3Rate");
			List<JSONObject> planDetails4Rate = (List<JSONObject>) responseJsonObj.get("planDetails4Rate");
			
			if(planDetails0Rate.size()>0){
				String type = planDetails0Rate.get(0).getString("type").substring(0, 1);
				if(null != type && "Y".equals(type)){
					saviePlanDetailsBean.setPaymentPlan("Yearly plan");
				}
				else{
					saviePlanDetailsBean.setPaymentPlan("Monthly plan");
				}
				saviePlanDetailsBean.setSinglePremiumAmount(responseJsonObj.getString("premium"));
				for(int i=0;i<planDetails0Rate.size();i++){
					JSONObject rate = planDetails0Rate.get(i);
					if("Y1".equals(rate.get("type"))){
						saviePlanDetailsBean.setGuarantee1stYearRate(Float.valueOf(rate.getString("interestedRate")));
					}
					if("Y2".equals(rate.get("type"))){
						saviePlanDetailsBean.setGuarantee2ndYearRate(Float.valueOf(rate.getString("interestedRate")));
					}
					if("Y3".equals(rate.get("type"))){
						saviePlanDetailsBean.setGuarantee3rdYearRate(Float.valueOf(rate.getString("interestedRate")));
					}
				}
			}
			
			List<SaviePolicyAccountBalanceBean> saviePolicyAccountBalanceList0 = new ArrayList<SaviePolicyAccountBalanceBean>();
			List<SaviePolicyAccountBalanceBean> saviePolicyAccountBalanceList2 = new ArrayList<SaviePolicyAccountBalanceBean>();
			List<SaviePolicyAccountBalanceBean> saviePolicyAccountBalanceList3 = new ArrayList<SaviePolicyAccountBalanceBean>();
			List<SaviePolicyAccountBalanceBean> saviePolicyAccountBalanceList4 = new ArrayList<SaviePolicyAccountBalanceBean>();
			
			for(int i =0;i<planDetails0Rate.size();i++){
				SaviePolicyAccountBalanceBean saPolAccBal0 = new SaviePolicyAccountBalanceBean();
				saPolAccBal0.setPolicyYear(planDetails0Rate.get(i).getString("type").substring(1));
				saPolAccBal0.setPremiumPaid(planDetails0Rate.get(i).getString("totalPremium"));
				saPolAccBal0.setAccountValue(planDetails0Rate.get(i).getString("accountEOP"));
				saPolAccBal0.setSurrenderBenefit(planDetails0Rate.get(i).getString("guranteedSurrenderBenefit"));
				saviePolicyAccountBalanceList0.add(saPolAccBal0);
				
				SaviePolicyAccountBalanceBean saPolAccBal2 = new SaviePolicyAccountBalanceBean();
				saPolAccBal2.setPolicyYear(planDetails2Rate.get(i).getString("type").substring(1));
				saPolAccBal2.setPremiumPaid(planDetails2Rate.get(i).getString("totalPremium"));
				saPolAccBal2.setAccountValue(planDetails2Rate.get(i).getString("accountEOP"));
				saPolAccBal2.setSurrenderBenefit(planDetails2Rate.get(i).getString("guranteedSurrenderBenefit"));
				saviePolicyAccountBalanceList2.add(saPolAccBal2);
				
				SaviePolicyAccountBalanceBean saPolAccBal3 = new SaviePolicyAccountBalanceBean();
				saPolAccBal3.setPolicyYear(planDetails3Rate.get(i).getString("type").substring(1));
				saPolAccBal3.setPremiumPaid(planDetails3Rate.get(i).getString("totalPremium"));
				saPolAccBal3.setAccountValue(planDetails3Rate.get(i).getString("accountEOP"));
				saPolAccBal3.setSurrenderBenefit(planDetails3Rate.get(i).getString("guranteedSurrenderBenefit"));
				saviePolicyAccountBalanceList3.add(saPolAccBal3);
				
				SaviePolicyAccountBalanceBean saPolAccBal4 = new SaviePolicyAccountBalanceBean();
				saPolAccBal4.setPolicyYear(planDetails4Rate.get(i).getString("type").substring(1));
				saPolAccBal4.setPremiumPaid(planDetails4Rate.get(i).getString("totalPremium"));
				saPolAccBal4.setAccountValue(planDetails4Rate.get(i).getString("accountEOP"));
				saPolAccBal4.setSurrenderBenefit(planDetails4Rate.get(i).getString("guranteedSurrenderBenefit"));
				saviePolicyAccountBalanceList4.add(saPolAccBal4);
			}
			
			saviePlanDetailsBean.setSaviePolicyAccountBalanceList0(saviePolicyAccountBalanceList0);
			saviePlanDetailsBean.setSaviePolicyAccountBalanceList2(saviePolicyAccountBalanceList2);
			saviePlanDetailsBean.setSaviePolicyAccountBalanceList3(saviePolicyAccountBalanceList3);
			saviePlanDetailsBean.setSaviePolicyAccountBalanceList4(saviePolicyAccountBalanceList4);
		}
		return saviePlanDetailsBean;
	}
	
	@Override
	public JSONObject getPlanDetailsAjax(org.json.simple.JSONObject apiJsonObj,String product,String issueAge,String paymentTerm,String premium,String referralCode) {
		JSONObject resultJsonObject = new JSONObject();
		if(null == apiJsonObj.get("errMsgs")){
			String jsonStr = apiJsonObj.toJSONString();
			JSONObject responseJsonObj = JSONObject.fromObject(jsonStr);
			
			List<JSONObject> planDetails0Rate = (List<JSONObject>) responseJsonObj.get("planDetails0Rate");
			List<JSONObject> planDetails2Rate = (List<JSONObject>) responseJsonObj.get("planDetails2Rate");
			List<JSONObject> planDetails3Rate = (List<JSONObject>) responseJsonObj.get("planDetails3Rate");
			List<JSONObject> planDetails4Rate = (List<JSONObject>) responseJsonObj.get("planDetails4Rate");
			
			List<JSONObject> inputTableList = new ArrayList<JSONObject>();
			JSONObject inputTable = new JSONObject();
			inputTable.accumulate("type", product);
			inputTable.accumulate("issueAge", issueAge);
			inputTable.accumulate("paymode", "monthly");
			inputTable.accumulate("premium", premium);
			inputTable.accumulate("paymentTerm", paymentTerm);
			inputTable.accumulate("promoCode", referralCode);
			inputTableList.add(inputTable);
			
			JSONObject planDetailJsonObject = new JSONObject();
			planDetailJsonObject.accumulate("inputTable", inputTableList);
			
			List<JSONObject> yearPlansList = new ArrayList<JSONObject>();
			
			for(int i =0;i<planDetails0Rate.size();i++){
				JSONObject yesrPlan = new JSONObject();
				yesrPlan.accumulate("year", Integer.valueOf(planDetails0Rate.get(i).getString("type").substring(1)));
				
				List<JSONObject> plansList = new ArrayList<JSONObject>();
				
				JSONObject plan0 = new JSONObject();
				plan0.accumulate("accountBalance", Float.valueOf(planDetails0Rate.get(i).getString("accountEOP")));
				plan0.accumulate("rate","zero");
				plansList.add(plan0);
				
				JSONObject plan2 = new JSONObject();
				plan2.accumulate("accountBalance", Float.valueOf(planDetails2Rate.get(i).getString("accountEOP")));
				plan2.accumulate("rate","two");
				plansList.add(plan2);
				
				JSONObject plan3 = new JSONObject();
				plan3.accumulate("accountBalance", Float.valueOf(planDetails3Rate.get(i).getString("accountEOP")));
				plan3.accumulate("rate","three");
				plansList.add(plan3);
				
				JSONObject plan4 = new JSONObject();
				plan4.accumulate("accountBalance", Float.valueOf(planDetails4Rate.get(i).getString("accountEOP")));
				plan4.accumulate("rate","four");
				plansList.add(plan4);
				
				yesrPlan.accumulate("plans", plansList);
				yearPlansList.add(yesrPlan);
			}
			planDetailJsonObject.accumulate("yearPlans", yearPlansList);
			resultJsonObject.accumulate("salesIllustration", planDetailJsonObject);
		}
		else{
			resultJsonObject.accumulate("salesIllustration", apiJsonObj.get("errMsgs"));
		}
		return resultJsonObject;
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
}
