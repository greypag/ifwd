package com.ifwd.fwdhk.services.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.ezmorph.bean.MorphDynaBean;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;

import com.ifwd.ecomm.chinese.ZHConverter;
import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.connector.ECommWsConnector;
import com.ifwd.fwdhk.connector.response.eliteterm.CreateEliteTermPolicyResponse;
import com.ifwd.fwdhk.connector.response.life.GetVulnerableCustomerResponse;
import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.easyhealth.EasyHealthPlanDetailBean;
import com.ifwd.fwdhk.model.easyhealth.EasyHealthPremium;
import com.ifwd.fwdhk.model.easyhealth.EasyHealthPremiumSelectPlan;
import com.ifwd.fwdhk.model.life.LifeBeneficaryInfoBean;
import com.ifwd.fwdhk.model.life.LifeDeclarationBean;
import com.ifwd.fwdhk.model.life.LifeEmploymentInfoBean;
import com.ifwd.fwdhk.model.life.LifePersonalDetailsBean;
import com.ifwd.fwdhk.services.EasyHealthService;
import com.ifwd.fwdhk.util.ClientBrowserUtil;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.HeaderUtil;
import com.ifwd.fwdhk.util.Methods;
@Service
public class EasyHealthServiceImpl implements EasyHealthService {
	private final static Logger logger = LoggerFactory.getLogger(EasyHealthServiceImpl.class);
	
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
	public JSONObject getPremium(EasyHealthPlanDetailBean planDetail,HttpServletRequest request) throws ECOMMAPIException{
		StringBuffer url = new StringBuffer();
		url.append(UserRestURIConstants.GET_EASYHEALTH_PREMIUM);
		url.append("?dob=");
		String[] dob = planDetail.getDobdmy().split("-");
		planDetail.setDob(dob[2]+"-"+dob[1]+"-"+dob[0]);
		url.append(planDetail.getDob());
		url.append("&gender=");
		url.append(planDetail.getGender().equals("0")?"M":"F");
		url.append("&planCode=ROPHI");
		url.append("&smoke=");
		url.append("1".equals(planDetail.getSmoker())?true:false);
		final Map<String,String> header = headerUtil.getHeader(request);
		JSONObject jsonObject = new JSONObject();
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,url.toString(), header, jsonObject);
		request.getSession().setAttribute("ehPlanDetail", planDetail);
		request.getSession().setAttribute("ehStep", "1");
		
		net.sf.json.JSONObject json = net.sf.json.JSONObject.fromObject(responseJsonObj.toString());
		EasyHealthPremium easyHealthPremium = (EasyHealthPremium) net.sf.json.JSONObject.toBean(json, EasyHealthPremium.class);
		request.getSession().setAttribute("easyHealthPremium", easyHealthPremium);
		return responseJsonObj;
	}
	
	@SuppressWarnings("unchecked")
	public CreateEliteTermPolicyResponse createLifePolicy(HttpServletRequest request,HttpSession session)throws ECOMMAPIException{
		LifePersonalDetailsBean lifePersonalDetails = (LifePersonalDetailsBean) session.getAttribute("lifePersonalDetails");
		LifeEmploymentInfoBean lifeEmploymentInfo = (LifeEmploymentInfoBean) session.getAttribute("lifeEmploymentInfo");
		LifeBeneficaryInfoBean lifeBeneficaryInfo = (LifeBeneficaryInfoBean) session.getAttribute("lifeBeneficaryInfo");
		LifeDeclarationBean lifeDeclaration = (LifeDeclarationBean) session.getAttribute("lifeDeclaration");
		EasyHealthPlanDetailBean planDetail = (EasyHealthPlanDetailBean) session.getAttribute("ehPlanDetail");
		
		StringBuffer inputMsg = new StringBuffer();
		
		EasyHealthPremiumSelectPlan selectPlan = (EasyHealthPremiumSelectPlan) session.getAttribute("selectPlan");
		String planCode = "";
		String dateofbirth=planDetail.getDob();
		String product=(String) session.getAttribute("prod");
		
	
		String[] strArray = {"eh-plan-a","eh-plan-b","eh-plan-c", "eh-plan-d"};
		for(int i=0;i<4;i++){
			if(strArray[i].equals(selectPlan.getSelectPlan())){
				planCode = "ROPHI"+(i+1);
			}
		}
		
		if(product==null){
			planCode="";
		}else{
			if(product.equals("guardian")){
				planCode="HCP1";
				dateofbirth=lifePersonalDetails.getDob();
			}
		}
		
		JSONObject parameters = new JSONObject();
		parameters.put("planCode", planCode);
			JSONObject applicant = new JSONObject();
			applicant.put("firstName", lifePersonalDetails.getFirstname());
			applicant.put("lastName", lifePersonalDetails.getLastname());
			applicant.put("chineseName", lifePersonalDetails.getChineseName());
			inputMsg.append(lifePersonalDetails.getChineseName());
			applicant.put("dob", dateofbirth);
			applicant.put("gender", lifePersonalDetails.getGender().substring(0, 1).toUpperCase());
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
				employmentStatus.put("regularIncome", lifeEmploymentInfo.getRegularIncome());
			applicant.put("employmentStatus", employmentStatus);
			applicant.put("smoke", "1".equals(planDetail.getSmoker())?true:false);
			applicant.put("optOut1", lifeDeclaration.getChkboxDoNotSendMarketingInfo()!=null?lifeDeclaration.getChkboxDoNotSendMarketingInfo():false);
			applicant.put("optOut2", lifeDeclaration.getChkboxDoNotProvidePersonalData()!=null?lifeDeclaration.getChkboxDoNotProvidePersonalData():false);
			
			
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
			payment.put("amount", "");
			payment.put("paymentMethod", "CC");
			payment.put("bankCode", "");
			payment.put("branchCode", "");
			payment.put("accountNo", "");
			payment.put("expiryDate", "");
		parameters.put("payment", payment);
		parameters.put("insuredAmount", "100000");
		parameters.put("referralCode", "");
		
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
		//GetVulnerableCustomerResponse vulnerableCustomerResponse=new GetVulnerableCustomerResponse();
		
		/*if(ZHConverter.hasSimpleChinese(inputMsg.toString())){
			logger.info("Some input information contains simplified Chinese");
			throw new ECOMMAPIException("Some input information contains simplified Chinese");
		}
		else{*/
			lifePolicy = connector.createLifePolicy(parameters, header);
			if(!lifePolicy.hasError()){
				request.getSession().setAttribute("lifePolicy", lifePolicy);
				//String policyNo=lifePolicy.getPolicyNo();
				//vulnerableCustomerResponse=connector.isVulnerable(policyNo,header);
				//if(vulnerableCustomerResponse.hasError()){
				// request.getSession().setAttribute("isVulnerable", false);
				//	throw new ECOMMAPIException(vulnerableCustomerResponse.getErrMsgs()[0]);
				//}
				//request.getSession().setAttribute("isVulnerable", false);
			}
			else{
				String[] errMsgs=lifePolicy.getErrMsgs();
				for(int l=0;l<errMsgs.length;l++)
				{
					logger.error(errMsgs[l].toString());
				}
				throw new ECOMMAPIException(lifePolicy.getErrMsgs()[0]);
			}
		//}
		return lifePolicy;
	}
	
	public void putPaymentSession(HttpServletRequest request)throws Exception{
		try {
			request.getSession().setAttribute("creditCaredNo", request.getParameter("creditCaredNo").replaceAll(" ", ""));
			request.getSession().setAttribute("expiryDate", request.getParameter("expiryDate"));
			request.getSession().setAttribute("cardHolderName", request.getParameter("cardHolderName"));
			logger.info("payment put session success");
		}catch(Exception e){
			logger.error(e.getMessage());
			logger.error(ExceptionUtils.getStackTrace(e));
			e.printStackTrace();
		}
	}
	
	public void removeSession(HttpServletRequest request){
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
		session.removeAttribute("ehPlanDetail");
		session.removeAttribute("ehStep");
		session.removeAttribute("pro");
		session.removeAttribute("underwritingYes");
		session.removeAttribute("fatcaYes");
		session.removeAttribute("applicationSummaryYes");
		session.removeAttribute("documentUploadYes");
		session.removeAttribute("sendEmailsYes");
		logger.info("remove session");
	}
	
	public void putPremium(HttpServletRequest request) throws Exception{
		EasyHealthPremium easyHealthPremium = (EasyHealthPremium) request.getSession().getAttribute("easyHealthPremium");
		List<MorphDynaBean> plans = easyHealthPremium.getPlans();
		if(plans != null && plans.size() > 0){
			EasyHealthPremiumSelectPlan selectPlan = new EasyHealthPremiumSelectPlan();
			String pro = request.getParameter("pro");
			String[] strArray = {"eh-plan-a","eh-plan-b","eh-plan-c", "eh-plan-d"};
			for(int i=0;i<plans.size();i++){
				if(strArray[i].equals(pro)){
					selectPlan.setIntensiveCareUnit(plans.get(i).get("intensiveCareUnit").toString());
					selectPlan.setDeathBenefit(plans.get(i).get("deathBenefit").toString());
					selectPlan.setDailyHospitalCash(plans.get(i).get("dailyHospitalCash").toString());
					selectPlan.setRefundPremium(plans.get(i).get("refundPremium").toString());
					selectPlan.setType(plans.get(i).get("type").toString());
					selectPlan.setPaidPremium(plans.get(i).get("paidPremium").toString());
					selectPlan.setPlanCode(plans.get(i).get("planCode").toString());
					selectPlan.setMonthlyPremium(plans.get(i).get("monthlyPremium").toString());
					selectPlan.setInfectiousDisease(plans.get(i).get("infectiousDisease").toString());
					selectPlan.setAccidentalDeathBenefit(plans.get(i).get("accidentalDeathBenefit").toString());
					selectPlan.setSelectPlan(pro);
					if(0 == i){
						selectPlan.setPlanNameCn("「守衛您」保費回贈住院保障計劃 - 基本計劃");
						selectPlan.setPlanNameEn("EasyHealth Refundable Hospital Income Plan - "+selectPlan.getType());
					}
					if(1 == i){
						selectPlan.setPlanNameCn("「守衛您」保費回贈住院保障計劃 - 升級計劃");
						selectPlan.setPlanNameEn("EasyHealth Refundable Hospital Income Plan - "+selectPlan.getType());
					}
					if(2 == i){
						selectPlan.setPlanNameCn("「守衛您」保費回贈住院保障計劃 - 高級計劃");
						selectPlan.setPlanNameEn("EasyHealth Refundable Hospital Income Plan - "+selectPlan.getType());
					}
					if(3 == i){
						selectPlan.setPlanNameCn("「守衛您」保費回贈住院保障計劃 - 豪華計劃");
						selectPlan.setPlanNameEn("EasyHealth Refundable Hospital Income Plan - "+selectPlan.getType());
					}
					
				}
			}
			request.getSession().setAttribute("selectPlan", selectPlan);
			request.getSession().setAttribute("ehStep", "2");
			request.getSession().setAttribute("pro", pro);
		}
		else{
			
			EasyHealthPremiumSelectPlan selectPlan = new EasyHealthPremiumSelectPlan();
			String pro = request.getParameter("pro");
			String[] strArray = {"eh-plan-a","eh-plan-b","eh-plan-c", "eh-plan-d"};
			for(int i=0;i<plans.size();i++){
				if(strArray[i].equals(pro)){
					selectPlan.setIntensiveCareUnit(plans.get(i).get("intensiveCareUnit").toString());
					selectPlan.setDeathBenefit(plans.get(i).get("deathBenefit").toString());
					selectPlan.setDailyHospitalCash(plans.get(i).get("dailyHospitalCash").toString());
					selectPlan.setRefundPremium(plans.get(i).get("refundPremium").toString());
					selectPlan.setType(plans.get(i).get("type").toString());
					selectPlan.setPaidPremium(plans.get(i).get("paidPremium").toString());
					selectPlan.setPlanCode(plans.get(i).get("planCode").toString());
					selectPlan.setMonthlyPremium(plans.get(i).get("monthlyPremium").toString());
					selectPlan.setInfectiousDisease(plans.get(i).get("infectiousDisease").toString());
					selectPlan.setAccidentalDeathBenefit(plans.get(i).get("accidentalDeathBenefit").toString());
					selectPlan.setSelectPlan(pro);
					if(0 == i){
						selectPlan.setPlanNameCn("「守衛您」保費回贈住院保障計劃 - 基本計劃");
						selectPlan.setPlanNameEn("EasyHealth Refundable Hospital Income Plan - "+selectPlan.getType());
					}
					if(1 == i){
						selectPlan.setPlanNameCn("「守衛您」保費回贈住院保障計劃 - 升級計劃");
						selectPlan.setPlanNameEn("EasyHealth Refundable Hospital Income Plan - "+selectPlan.getType());
					}
					if(2 == i){
						selectPlan.setPlanNameCn("「守衛您」保費回贈住院保障計劃 - 高級計劃");
						selectPlan.setPlanNameEn("EasyHealth Refundable Hospital Income Plan - "+selectPlan.getType());
					}
					if(3 == i){
						selectPlan.setPlanNameCn("「守衛您」保費回贈住院保障計劃 - 豪華計劃");
						selectPlan.setPlanNameEn("EasyHealth Refundable Hospital Income Plan - "+selectPlan.getType());
					}
					
				}
			}
			request.getSession().setAttribute("selectPlan", selectPlan);
			request.getSession().setAttribute("ehStep", "2");
			request.getSession().setAttribute("pro", pro);
			
		}
		
	}
}
