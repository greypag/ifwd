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
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.common.document.PDFGeneration;
import com.ifwd.fwdhk.common.document.PdfAttribute;
import com.ifwd.fwdhk.connector.ECommWsConnector;
import com.ifwd.fwdhk.connector.response.BaseResponse;
import com.ifwd.fwdhk.connector.response.eliteterm.CreateEliteTermPolicyResponse;
import com.ifwd.fwdhk.connector.response.savie.SaviePlanDetailsResponse;
import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.OptionItemDesc;
import com.ifwd.fwdhk.model.UserDetails;
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
import com.sun.xml.internal.fastinfoset.util.StringArray;
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
			
		String pdfTemplatePath = request.getRealPath("/").replace("\\", "/")+"resources/pdf/"+"SavieOnlineApplicationForm.pdf";
		String pdfGeneratePath = request.getRealPath("/").replace("\\", "\\\\")+"resources\\\\pdf\\\\";
		String name = PDFGeneration.generatePdf2(pdfTemplatePath,pdfGeneratePath,attributeList,false,"All rights reserved, copy");
		
		request.getSession().setAttribute("applicationFormPdf", name);
		logger.info("applicationFormPdf create successfully");
	}
	
	public void createFnaFormPdf(HttpServletRequest request,HttpSession session) throws Exception {
		SavieFnaBean savieFna = (SavieFnaBean) session.getAttribute("savieFna");
		CreateEliteTermPolicyResponse eliteTermPolicy = (CreateEliteTermPolicyResponse) session.getAttribute("eliteTermPolicy");
		LifePersonalDetailsBean lifePersonalDetails = (LifePersonalDetailsBean) session.getAttribute("lifePersonalDetails");
		LifeBeneficaryInfoBean lifeBeneficaryInfo = (LifeBeneficaryInfoBean) session.getAttribute("lifeBeneficaryInfo");
		
		List<PdfAttribute> attributeList = new ArrayList<PdfAttribute>();
		//attributeList.add(new PdfAttribute("PolicyNo", eliteTermPolicy.getPolicyNo()));
		attributeList.add(new PdfAttribute("PolicyNo", "14121303"));
		String LifeInsuredName = lifeBeneficaryInfo.getBeneficaryFirstName1()+" "+lifeBeneficaryInfo.getBeneficaryLastName1()+
				                 lifeBeneficaryInfo.getBeneficaryFirstName2()+" "+lifeBeneficaryInfo.getBeneficaryLastName2()+
				                 lifeBeneficaryInfo.getBeneficaryFirstName3()+" "+lifeBeneficaryInfo.getBeneficaryLastName3();
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
		attributeList.add(new PdfAttribute("Applicant Occupation", savieFna.getOccupation()));
		
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
		
		attributeList.add(new PdfAttribute("Personalreason", "Personalreason"));
		
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
		
		attributeList.add(new PdfAttribute("Q1a1", "On"));
		attributeList.add(new PdfAttribute("Q1d1", "On"));
		attributeList.add(new PdfAttribute("Q2a1", "On"));
		attributeList.add(new PdfAttribute("Q2b1", "On"));
		attributeList.add(new PdfAttribute("NameofInsuranceProduct(s)Introduced1", "NameofInsuranceProduct(s)Introduced1"));
		attributeList.add(new PdfAttribute("Product(s)Selected1", "Product(s)Selected1"));
		
		attributeList.add(new PdfAttribute("Q1a2", "On"));
		attributeList.add(new PdfAttribute("Q1e2", "On"));
		attributeList.add(new PdfAttribute("NameofInsuranceProduct(s)Introduced2", "NameofInsuranceProduct(s)Introduced2"));
		attributeList.add(new PdfAttribute("Product(s)Selected2", "Product(s)Selected2"));
		
		attributeList.add(new PdfAttribute("SignatureofApplicant", "SignatureofApplicant"));
		attributeList.add(new PdfAttribute("Date1", "1980-10-13"));
		attributeList.add(new PdfAttribute("Date2", "1980-10-13"));
		attributeList.add(new PdfAttribute("Product(s)Selected2", "Product(s)Selected2"));
		attributeList.add(new PdfAttribute("Product(s)Selected2", "Product(s)Selected2"));
		
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
		//jsonObject.put("hash_key", "");
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
		HttpSession hashSession = request.getSession();
		if (responseJsonObj.get("result") != null){
			JSONObject jobject = (JSONObject)responseJsonObj.get("result");
			hashSession.setAttribute("hashKey", jobject.get("hash_key"));
			
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
			request.getSession().setAttribute("savieFna", savieFna);
		}
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
	
	public List<OptionItemDesc> getBranchCode(HttpServletRequest request) throws ECOMMAPIException {
        List<OptionItemDesc> OptionItemDescList = new ArrayList<OptionItemDesc>();
        JSONArray jsonOptionItemDescs = null;
        String value = request.getParameter("value");
        String language = request.getParameter("language");
        String Url = UserRestURIConstants.SERVICE_URL + "/option/itemDesc?itemTable="+value.split("-")[0];
		HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
		header.put("userName", "*DIRECTGI");
		header.put("token", commonUtils.getToken("reload"));
		header.put("language", WebServiceUtils.transformLanaguage(language));
		
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
	
	public JSONObject createPolicyApplicationSaveforLater(HttpServletRequest request) throws ECOMMAPIException{
		String Url = UserRestURIConstants.CREATE_POLICY_APPLICATION_SAVE_FOR_LATER;
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
		
		jsonObject.put("planCode", "SAVIE-SP");
		jsonObject.put("applicantFirstName", "applicantFirstName");
		jsonObject.put("applicantLastName", "applicantLastName");
		jsonObject.put("applicantChineseName", "applicantChineseName");
		jsonObject.put("applicantDob", "applicantDob");
		jsonObject.put("applicantGender", "applicantGender");
		jsonObject.put("applicantHkId", "applicantHkId");
		jsonObject.put("applicantPassport", "applicantPassport");
		jsonObject.put("applicantMaritalStatus", "applicantMaritalStatus");
		jsonObject.put("applicantPlaceOfBirth", "applicantPlaceOfBirth");
		jsonObject.put("applicantNationality", "applicantNationality");
		jsonObject.put("applicantResidentialTelNoCountryCode", "applicantResidentialTelNoCountryCode");
		jsonObject.put("applicantResidentialTelNo", "applicantResidentialTelNo");
		jsonObject.put("applicantMobileNoCountryCode", "applicantMobileNoCountryCode");
		jsonObject.put("applicantMobileNo", "applicantMobileNo");
		jsonObject.put("applicantEmail", "applicantEmail");
		jsonObject.put("residentialAddress1", "residentialAddress1");
		jsonObject.put("residentialAddress2", "residentialAddress2");
		jsonObject.put("residentialAddress3", "residentialAddress3");
		jsonObject.put("residentialAddress4", "residentialAddress4");
		jsonObject.put("residentialDistrict", "residentialDistrict");
		jsonObject.put("correspondenceAddress1", "correspondenceAddress1");
		jsonObject.put("correspondenceAddress2", "correspondenceAddress2");
		jsonObject.put("correspondenceAddress3", "correspondenceAddress3");
		jsonObject.put("correspondenceAddress4", "correspondenceAddress4");
		jsonObject.put("correspondenceDistrict", "correspondenceDistrict");
		jsonObject.put("permanentAddress1", "permanentAddress1");
		jsonObject.put("permanentAddress2", "permanentAddress2");
		jsonObject.put("permanentAddress3", "permanentAddress3");
		jsonObject.put("permanentAddress4", "permanentAddress4");
		jsonObject.put("permanentDistrict", "permanentDistrict");
		jsonObject.put("employmentStatus", "employmentStatus");
		jsonObject.put("occupation", "occupation");
		jsonObject.put("educationLevel", "educationLevel");
		jsonObject.put("natureOfBusiness", "natureOfBusiness");
		jsonObject.put("monthlyPersonalIncome", "monthlyPersonalIncome");
		jsonObject.put("liquidAssest", "liquidAssest");
		jsonObject.put("amountOtherSource", "amountOtherSource");
		jsonObject.put("employerName", "employerName");
		jsonObject.put("smoke", "smoke");
		jsonObject.put("optOut1", "optOut1");
		jsonObject.put("optOut2", "optOut2");
		jsonObject.put("insuredName", "insuredName");
		jsonObject.put("insuredHkId", "insuredHkId");
		jsonObject.put("insuredPassport", "insuredPassport");
		jsonObject.put("insuredRelationship", "insuredRelationship");
		jsonObject.put("beneficiaryFirstName1", "beneficiaryFirstName1");
		jsonObject.put("beneficiaryLastName1", "beneficiaryLastName1");
		jsonObject.put("beneficiaryChineseName1", "beneficiaryChineseName1");
		jsonObject.put("beneficiaryHkId1", "beneficiaryHkId1");
		jsonObject.put("beneficiaryPassport1", "beneficiaryPassport1");
		jsonObject.put("beneficiaryGender1", "beneficiaryGender1");
		jsonObject.put("beneficiaryRelationship1", "beneficiaryRelationship1");
		jsonObject.put("beneficiaryEntitlement1", "32");
		jsonObject.put("beneficiaryFirstName2", "beneficiaryFirstName2");
		jsonObject.put("beneficiaryLastName2", "beneficiaryLastName2");
		jsonObject.put("beneficiaryChineseName2", "beneficiaryChineseName2");
		jsonObject.put("beneficiaryHkId2", "beneficiaryHkId2");
		jsonObject.put("beneficiaryPassport2", "beneficiaryPassport2");
		jsonObject.put("beneficiaryGender2", "beneficiaryGender2");
		jsonObject.put("beneficiaryRelationship2", "beneficiaryRelationship2");
		jsonObject.put("beneficiaryEntitlement2", "33");
		jsonObject.put("beneficiaryFirstName3", "beneficiaryFirstName3");
		jsonObject.put("beneficiaryLastName3", "beneficiaryLastName3");
		jsonObject.put("beneficiaryChineseName3", "beneficiaryChineseName3");
		jsonObject.put("beneficiaryHkId3", "beneficiaryHkId3");
		jsonObject.put("beneficiaryPassport3", "beneficiaryPassport3");
		jsonObject.put("beneficiaryGender3", "beneficiaryGender3");
		jsonObject.put("beneficiaryRelationship3", "beneficiaryRelationship3");
		jsonObject.put("beneficiaryEntitlement3", "35");
		jsonObject.put("referralCode", "referralCode");
		jsonObject.put("insuredAmount", "insuredAmount");
		jsonObject.put("paymentMethod", "paymentMethod");
		jsonObject.put("bankName", "bankName");
		jsonObject.put("branchName", "branchName");
		jsonObject.put("accountNo", "accountNo");
		logger.info(jsonObject.toString());
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.POST,Url, header, jsonObject);
		
		if(responseJsonObj.get("errMsgs") != null) {
			throw new ECOMMAPIException(responseJsonObj.get("errMsgs").toString());
		}
		return responseJsonObj;
	}
	
	public JSONObject getPolicyApplicationSaveforLater(HttpServletRequest request) throws ECOMMAPIException{
		String Url = UserRestURIConstants.GET_POLICY_APPLICATION_SAVE_FOR_LATER;
		HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
		String lang = UserRestURIConstants.getLanaguage(request);
		
		if (lang.equals("tc")){
			lang = "CH";
		}
		else{
			lang = "EN";
		}
		
		header.put("language", WebServiceUtils.transformLanaguage(lang));
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,Url, header, null);
		
		if(responseJsonObj.get("errMsgs") != null) {
			throw new ECOMMAPIException(responseJsonObj.get("errMsgs").toString());
		}
		return responseJsonObj;
	}
}
