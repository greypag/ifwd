package com.ifwd.fwdhk.services.impl;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.common.document.PDFGeneration;
import com.ifwd.fwdhk.common.document.PdfAttribute;
import com.ifwd.fwdhk.connector.ECommWsConnector;
import com.ifwd.fwdhk.connector.request.eliteterm.CreateEliteTermPolicyRequest;
import com.ifwd.fwdhk.connector.response.BaseResponse;
import com.ifwd.fwdhk.connector.response.eliteterm.CreateEliteTermPolicyResponse;
import com.ifwd.fwdhk.connector.response.eliteterm.GetEliteTermPremiumResponse;
import com.ifwd.fwdhk.connector.response.savie.SaviePlanDetailsResponse;
import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.savieOnline.LifeBeneficaryInfoBean;
import com.ifwd.fwdhk.model.savieOnline.LifeEmploymentInfoBean;
import com.ifwd.fwdhk.model.savieOnline.LifePaymentBean;
import com.ifwd.fwdhk.model.savieOnline.LifePersonalDetailsBean;
import com.ifwd.fwdhk.model.savieOnline.SavieFnaBean;
import com.ifwd.fwdhk.model.savieOnline.SaviePlanDetailsBean;
import com.ifwd.fwdhk.services.SavieOnlineService;
import com.ifwd.fwdhk.util.ClientBrowserUtil;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.CompareUtil;
import com.ifwd.fwdhk.util.DateApi;
import com.ifwd.fwdhk.util.HeaderUtil;
import com.ifwd.fwdhk.util.NumberFormatUtils;
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
	public JSONObject getSavieOnlinePlandetails(SaviePlanDetailsBean saviePlanDetails,HttpServletRequest request) throws ECOMMAPIException{
		int issueAge = DateApi.getAge(DateApi.formatDate2(saviePlanDetails.getDob()));
		
		SaviePlanDetailsResponse apiResponse = connector.saviePlanDetails("savie", issueAge, 100-issueAge, saviePlanDetails.getInsuredAmount(), saviePlanDetails.getPromoCode(), null);
		
		request.getSession().setAttribute("planDetailData", apiResponse);
		
		JSONObject jsonObject = new JSONObject();
		if(apiResponse.hasError()){
			throw new ECOMMAPIException(apiResponse.getErrMsgs()[0]);
		}
		else{
			jsonObject.put("planDetails0Rate", apiResponse.getPlanDetails0Rate());
		}
		return jsonObject;
	}
	
	public void createSalesIllustrationPdf(HttpServletRequest request) throws Exception {
		SaviePlanDetailsResponse planDetailData = (SaviePlanDetailsResponse) request.getSession().getAttribute("planDetailData");
		if(planDetailData != null && !planDetailData.hasError()){
			String totalPremium = NumberFormatUtils.formatNumberTwo(planDetailData.getPlanDetails0Rate().get(0).getTotalPremium());
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
			
			String pdfTemplatePath = request.getRealPath("/").replace("\\", "/")+"resources/pdf/"+"SavieProposalTemplateEngA.pdf";
			String pdfGeneratePath = request.getRealPath("/").replace("\\", "\\\\")+"resources\\\\pdf\\\\";
			String name = PDFGeneration.generatePdf2(pdfTemplatePath,pdfGeneratePath,attributeList,false,"All rights reserved, copy");
			
			request.getSession().setAttribute("pdfName", name);
			logger.info("pdf create successfully");
		}
		else{
			throw new Exception("errorMsg: api data error");
		}
	}
	
	public void createApplicationFormPdf(HttpServletRequest request,HttpSession session) throws Exception {
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
	    attributeList.add(new PdfAttribute("authSign", "authSign"));
			
		String pdfTemplatePath = request.getRealPath("/").replace("\\", "/")+"resources/pdf/"+"eliteTerm-applicationForm-0.20.pdf";
		String pdfGeneratePath = request.getRealPath("/").replace("\\", "\\\\")+"resources\\\\pdf\\\\";
		String name = PDFGeneration.generatePdf2(pdfTemplatePath,pdfGeneratePath,attributeList,false,"All rights reserved, copy");
		
		request.getSession().setAttribute("applicationFormPdf", name);
		logger.info("applicationFormPdf create successfully");
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
		
		header.put("language", WebServiceUtils.transformLanaguage(lang));
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("user_name", savieFna.getUser_name());
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
		jsonObject.put("q4_a_others", savieFna.getQ4_a_others());
		jsonObject.put("q4_b", savieFna.getQ4_b());
		jsonObject.put("q4_b_amount", savieFna.getQ4_b_amount());
		jsonObject.put("q4_b_others", savieFna.getQ4_b_others());
		jsonObject.put("q4_c", savieFna.getQ4_c());
		jsonObject.put("q4_d_1", savieFna.getQ4_d_1());
		jsonObject.put("q4_d_2", savieFna.getQ4_d_2());
		jsonObject.put("q4_e", savieFna.getQ4_e());
		jsonObject.put("q4_f", savieFna.getQ4_f());
		jsonObject.put("q4_g", savieFna.getQ4_g());
		jsonObject.put("q4_g_others", savieFna.getQ4_g_others());
		jsonObject.put("hash_key", "");
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
		jsonObject.put("q4_a_others", savieFna.getQ4_a_others());
		jsonObject.put("q4_b", savieFna.getQ4_b());
		jsonObject.put("q4_b_amount", savieFna.getQ4_b_amount());
		jsonObject.put("q4_b_others", savieFna.getQ4_b_others());
		jsonObject.put("q4_c", savieFna.getQ4_c());
		jsonObject.put("q4_d_1", savieFna.getQ4_d_1());
		jsonObject.put("q4_d_2", savieFna.getQ4_d_2());
		jsonObject.put("q4_e", savieFna.getQ4_e());
		jsonObject.put("q4_f", savieFna.getQ4_f());
		jsonObject.put("q4_g", savieFna.getQ4_g());
		jsonObject.put("q4_g_others", savieFna.getQ4_g_others());
		jsonObject.put("lang", lang);
		logger.info(jsonObject.toString());
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.POST,Url, header, jsonObject);
		
		if(responseJsonObj.get("errMsgs") == null) {
			JSONArray productArr = (JSONArray)responseJsonObj.get("product_list");
			JSONArray sortProductArr = new JSONArray();
			String sort;
			JSONObject products;
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
			responseJsonObj.put("product_list", sortProductArr);
		}
		return responseJsonObj;
	}
	
	public JSONObject getFna(HttpServletRequest request) throws ECOMMAPIException{
//		String Url = UserRestURIConstants.getConfigs("Url_SZWS") + "fna";
		String Url = UserRestURIConstants.GET_FNA;
		final Map<String,String> header = headerUtil.getHeader(request);
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,Url, header, null);
		return responseJsonObj.get("result") != null ? (JSONObject) responseJsonObj.get("result"):new JSONObject();
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
		
		JSONObject parameters = new JSONObject();
		parameters.put("planCode", "SAVIE");
			JSONObject applicant = new JSONObject();
			applicant.put("firstName", lifePersonalDetails.getFirstname());
			applicant.put("lastName", lifePersonalDetails.getLastname());
			applicant.put("chineseName", lifePersonalDetails.getChineseName());
			String[] dob = lifePersonalDetails.getDob().split("/");
			applicant.put("dob", dob[0]+"-"+dob[1]+"-"+dob[2]);
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
				permanentAddress.put("line4", "SD3");
				permanentAddress.put("district", lifePersonalDetails.getPermanetAddressDistrict()!=null?lifePersonalDetails.getPermanetAddressDistrict().split("-")[0]:"");
			applicant.put("permanentAddress", permanentAddress);
				
				JSONObject residentialAddress = new JSONObject();
				residentialAddress.put("line1", lifePersonalDetails.getResidentialAddress1());
				residentialAddress.put("line2", lifePersonalDetails.getResidentialAddress2());
				residentialAddress.put("line3", lifePersonalDetails.getResidentialAddress3());
				residentialAddress.put("line4", "SD1");
				residentialAddress.put("district", lifePersonalDetails.getResidentialAddressDistrict()!=null?lifePersonalDetails.getResidentialAddressDistrict().split("-")[0]:"");
			applicant.put("residentialAddress", residentialAddress);
				
				JSONObject correspondenceAddress = new JSONObject();
				correspondenceAddress.put("line1", lifePersonalDetails.getCorrespondenceAddress1());
				correspondenceAddress.put("line2", lifePersonalDetails.getCorrespondenceAddress2());
				correspondenceAddress.put("line3", lifePersonalDetails.getCorrespondenceAddress3());
				correspondenceAddress.put("line4", "SD2");
				correspondenceAddress.put("district", lifePersonalDetails.getCorrespondenceAddressDistrict()!=null?lifePersonalDetails.getCorrespondenceAddressDistrict().split("-")[0]:"");
			applicant.put("correspondenceAddress", correspondenceAddress);
				
				JSONObject employmentStatus = new JSONObject();
				employmentStatus.put("employmentStatus", lifeEmploymentInfo.getEmploymentStatus());
				employmentStatus.put("occupation", lifeEmploymentInfo.getOccupation());
				employmentStatus.put("educationLevel", lifeEmploymentInfo.getEducation());
				employmentStatus.put("natureOfBusiness", lifeEmploymentInfo.getNatureOfBusiness());
				employmentStatus.put("monthlyPersonalIncome", lifeEmploymentInfo.getMonthlyPersonalIncome());
				employmentStatus.put("liquidAsset", lifeEmploymentInfo.getAmountOfLiquidAssets());
				employmentStatus.put("amountOtherSource", lifeEmploymentInfo.getAmountOfOtherSourceOfIncome());
				employmentStatus.put("employerName", lifeEmploymentInfo.getEmployerName());
			applicant.put("employmentStatus", employmentStatus);
			applicant.put("smoke", false);
			applicant.put("optOut1", true);
			applicant.put("optOut2", true);
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
					beneficiarie1.put("firstName", lifeBeneficaryInfo.getBeneficaryFirstName1());
					beneficiarie1.put("lastName", lifeBeneficaryInfo.getBeneficaryLastName1());
					beneficiarie1.put("chineseName", lifeBeneficaryInfo.getBeneficaryChineseName1());
					beneficiarie1.put("hkId", lifeBeneficaryInfo.getBeneficaryID1());
					beneficiarie1.put("passport", lifeBeneficaryInfo.getBeneficaryID1());
					beneficiarie1.put("gender", lifeBeneficaryInfo.getBeneficaryGender1());
					beneficiarie1.put("relationship", lifeBeneficaryInfo.getBeneficaryRelation1());
					beneficiarie1.put("entitlement", lifeBeneficaryInfo.getBeneficaryWeight1());
				beneficiaries.add(beneficiarie1);
					beneficiarie2.put("firstName", lifeBeneficaryInfo.getBeneficaryFirstName2());
					beneficiarie2.put("lastName", lifeBeneficaryInfo.getBeneficaryLastName2());
					beneficiarie2.put("chineseName", lifeBeneficaryInfo.getBeneficaryChineseName2());
					beneficiarie2.put("hkId", lifeBeneficaryInfo.getBeneficaryID2());
					beneficiarie2.put("passport", lifeBeneficaryInfo.getBeneficaryID2());
					beneficiarie2.put("gender", lifeBeneficaryInfo.getBeneficaryGender2());
					beneficiarie2.put("relationship", lifeBeneficaryInfo.getBeneficaryRelation2());
					beneficiarie2.put("entitlement", lifeBeneficaryInfo.getBeneficaryWeight2());
				beneficiaries.add(beneficiarie2);
					beneficiarie3.put("firstName", lifeBeneficaryInfo.getBeneficaryFirstName3());
					beneficiarie3.put("lastName", lifeBeneficaryInfo.getBeneficaryLastName3());
					beneficiarie3.put("chineseName", lifeBeneficaryInfo.getBeneficaryChineseName3());
					beneficiarie3.put("hkId", lifeBeneficaryInfo.getBeneficaryID3());
					beneficiarie3.put("passport", lifeBeneficaryInfo.getBeneficaryID3());
					beneficiarie3.put("gender", lifeBeneficaryInfo.getBeneficaryGender3());
					beneficiarie3.put("relationship", lifeBeneficaryInfo.getBeneficaryRelation3());
					beneficiarie3.put("entitlement", lifeBeneficaryInfo.getBeneficaryWeight3());
				beneficiaries.add(beneficiarie3);
			insured.put("beneficiaries", beneficiaries);
		parameters.put("insured", insured);
			JSONObject payment = new JSONObject();
			payment.put("amount", saviePlanDetails.getInsuredAmount());
			payment.put("paymentMethod", "CreditCard");
			payment.put("bankName", "");
			payment.put("branchName", "");
			payment.put("accountNo", "");
			payment.put("expiryDate", "");
		parameters.put("payment", payment);
		parameters.put("insuredAmount", saviePlanDetails.getInsuredAmount());
		parameters.put("referralCode", saviePlanDetails.getPromoCode());
		logger.info(parameters.toString());
		
		final Map<String,String> header = headerUtil.getHeader(request);
		CreateEliteTermPolicyResponse eliteTermPolicy = new CreateEliteTermPolicyResponse();
		eliteTermPolicy = connector.createLifePolicy(parameters, header);
		if(!eliteTermPolicy.hasError()){
			request.getSession().setAttribute("eliteTermPolicy", eliteTermPolicy);
		}
		else{
			throw new ECOMMAPIException(eliteTermPolicy.getErrMsgs()[0]);
		}
		return eliteTermPolicy;
	}
	
	public BaseResponse finalizeLifePolicy(HttpServletRequest request,HttpSession session)throws ECOMMAPIException{
		CreateEliteTermPolicyResponse eliteTermPolicy = (CreateEliteTermPolicyResponse) request.getSession().getAttribute("eliteTermPolicy");
		JSONObject parameters = new JSONObject();
		parameters.put("creditCaredNo", "");
		parameters.put("expiryDate", "");
		parameters.put("cardHolderName", "");
		parameters.put("policyNo", eliteTermPolicy.getPolicyNo());
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
}
