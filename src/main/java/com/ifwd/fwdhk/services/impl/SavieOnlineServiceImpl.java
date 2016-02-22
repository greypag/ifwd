package com.ifwd.fwdhk.services.impl;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.io.File;
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
import com.ifwd.fwdhk.connector.response.savie.SaviePlanDetailsResponse;
import com.ifwd.fwdhk.connector.response.savieonline.GetPolicyApplicationResponse;
import com.ifwd.fwdhk.connector.response.savieonline.PolicyApplication;
import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.OptionItemDesc;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.model.savieOnline.LifeBeneficaryInfoBean;
import com.ifwd.fwdhk.model.savieOnline.LifeEmploymentInfoBean;
import com.ifwd.fwdhk.model.savieOnline.LifePaymentBean;
import com.ifwd.fwdhk.model.savieOnline.LifePersonalDetailsBean;
import com.ifwd.fwdhk.model.savieOnline.ProductList;
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
import com.ifwd.fwdhk.util.StringHelper;
import com.ifwd.fwdhk.util.WebServiceUtils;
import com.itextpdf.text.DocumentException;
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
		int issueAge = DateApi.getAge(DateApi.formatDate(saviePlanDetails.getDob()));
		
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
		attributeList.add(new PdfAttribute("PolicyNo", eliteTermPolicy.getPolicyNo()));
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
			net.sf.json.JSONObject json = net.sf.json.JSONObject.fromObject(responseJsonObj.toString());
			ProductRecommendation productRecommendation = (ProductRecommendation) net.sf.json.JSONObject.toBean(json, ProductRecommendation.class);
			request.getSession().setAttribute("productRecommendation", productRecommendation);
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
				request.getSession().setAttribute("savieFna", savieFna);
			}
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
	
	public void lifePersonalDetailsSaveforLater(LifePersonalDetailsBean lifePersonalDetails,HttpServletRequest request) throws ECOMMAPIException{
		final Map<String,String> header = headerUtil.getHeader(request);
		net.sf.json.JSONObject parameters = new net.sf.json.JSONObject();
		parameters.accumulate("planCode", "SAVIE-SP");
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
		parameters.accumulate("lastViewPage", "page1");
		
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
		SavieFnaBean savieFna = (SavieFnaBean) request.getSession().getAttribute("savieFna");
		CreateEliteTermPolicyResponse eliteTermPolicy = (CreateEliteTermPolicyResponse) request.getSession().getAttribute("eliteTermPolicy");
		LifePersonalDetailsBean lifePersonalDetails = (LifePersonalDetailsBean) request.getSession().getAttribute("lifePersonalDetails");
		LifeBeneficaryInfoBean lifeBeneficaryInfo = (LifeBeneficaryInfoBean) request.getSession().getAttribute("lifeBeneficaryInfo");
		
		List<PdfAttribute> attributeList = new ArrayList<PdfAttribute>();
		attributeList.add(new PdfAttribute("PolicyNo", eliteTermPolicy.getPolicyNo()));
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
		
		ProductRecommendation productRecommendation = (ProductRecommendation) request.getSession().getAttribute("productRecommendation");
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
	    
	    attributeList.add(new PdfAttribute("SignatureofApplicant", request.getRealPath("/")+"resources\\pdf\\signature.png","imagepath"));
		
	    
	    String pdfTemplatePath = request.getRealPath("/").replace("\\", "/")+"resources/pdf/"+"FinancialNeedsAndInvestorProfileAnalysisForm.pdf";
		String pdfGeneratePath = request.getRealPath("/").replace("\\", "\\\\")+"resources\\\\pdf\\\\";
		String name = PDFGeneration.generatePdf2(pdfTemplatePath,pdfGeneratePath,attributeList,false,"All rights reserved, copy");
		logger.info("fna pdf signature success:"+name);
		
		//application pdf
		LifeEmploymentInfoBean lifeEmploymentInfo = (LifeEmploymentInfoBean) request.getSession().getAttribute("lifeEmploymentInfo");
		LifePaymentBean lifePayment = (LifePaymentBean) request.getSession().getAttribute("lifePayment");
		
	    List<PdfAttribute> attributeList1 = new ArrayList<PdfAttribute>();
	    
	    attributeList1.add(new PdfAttribute("applicationNo", "applicationNo"));
	    attributeList1.add(new PdfAttribute("applicationEnglishName", lifePersonalDetails.getFirstname()+" "+lifePersonalDetails.getLastname()));
	    attributeList1.add(new PdfAttribute("applicationChineseName", lifePersonalDetails.getChineseName()));
	    attributeList1.add(new PdfAttribute("applicationHKID", lifePersonalDetails.getHkid()));
	    attributeList1.add(new PdfAttribute("applicationSex", lifePersonalDetails.getGender()));
	    attributeList1.add(new PdfAttribute("applicationDB", lifePersonalDetails.getDob()));
	    attributeList1.add(new PdfAttribute("applicationMaritalStatus", lifePersonalDetails.getMartialStatus()));
	    attributeList1.add(new PdfAttribute("applicationBirthPlace", lifePersonalDetails.getPlaceOfBirth()));
	    attributeList1.add(new PdfAttribute("applicationNationality", lifePersonalDetails.getNationalty()));
	    attributeList1.add(new PdfAttribute("applicationResidentialPhone", lifePersonalDetails.getMobileNumber()));
	    attributeList1.add(new PdfAttribute("applicationMobile", lifePersonalDetails.getMobileNumber()));
	    attributeList1.add(new PdfAttribute("applicationEmail", lifePersonalDetails.getEmailAddress()));
	    attributeList1.add(new PdfAttribute("applicationResAddress", lifePersonalDetails.getResidentialAddress1()+","+lifePersonalDetails.getResidentialAddress2()+","+lifePersonalDetails.getResidentialAddress3()));
	    attributeList1.add(new PdfAttribute("applicationResDistrict", lifePersonalDetails.getResidentialAddressDistrict()));
	    attributeList1.add(new PdfAttribute("applicationPerAddress", lifePersonalDetails.getPermanetAddress1()+","+lifePersonalDetails.getCorrespondenceAddress2()+","+lifePersonalDetails.getCorrespondenceAddress3()));
	    attributeList1.add(new PdfAttribute("applicationPerDistrict", lifePersonalDetails.getPermanetAddressDistrict()));
	    attributeList1.add(new PdfAttribute("applicationCorrAddress", lifePersonalDetails.getCorrespondenceAddress1()+","+lifePersonalDetails.getCorrespondenceAddress2()+","+lifePersonalDetails.getCorrespondenceAddress3()));
	    attributeList1.add(new PdfAttribute("applicationCorrDistrict", lifePersonalDetails.getCorrespondenceAddressDistrict()));
	    
	    attributeList1.add(new PdfAttribute("educationLevel", lifeEmploymentInfo.getEducation()));
	    attributeList1.add(new PdfAttribute("applicationEmploymentStatusKey", "applicationEmploymentStatusKey"));
	    attributeList1.add(new PdfAttribute("applicationEmploymentStatus", lifeEmploymentInfo.getEmploymentStatus()));
	    attributeList1.add(new PdfAttribute("currentEmployNameKey/otherIncomKey", "currentEmployNameKey/otherIncomKey"));
	    attributeList1.add(new PdfAttribute("currentEmployName/otherIncome", lifeEmploymentInfo.getAmountOfOtherSourceOfIncome()));
	    attributeList1.add(new PdfAttribute("natureOfBusinessKey/liquidAssetKey", "natureOfBusinessKey/liquidAssetKey"));
	    attributeList1.add(new PdfAttribute("natureOfBusiness/liquidAsset", lifeEmploymentInfo.getNatureOfBusiness()));
	    attributeList1.add(new PdfAttribute("occupationKey", "occupationKey"));
	    attributeList1.add(new PdfAttribute("occupation", lifeEmploymentInfo.getOccupation()));
	    attributeList1.add(new PdfAttribute("personalIncomeKey", "personalIncomeKey"));
	    attributeList1.add(new PdfAttribute("personalIncome", lifeEmploymentInfo.getMonthlyPersonalIncome()));
	    
	    attributeList1.add(new PdfAttribute("sumInsured", "sumInsured"));
	    attributeList1.add(new PdfAttribute("firstYearPremium", "firstYearPremium"));
	    attributeList1.add(new PdfAttribute("perMonOnethHKD", "perMonOnethHKD"));
	    attributeList1.add(new PdfAttribute("subsequantPremium", "subsequantPremium"));
	    attributeList1.add(new PdfAttribute("perMonthTwoHKD", "perMonthTwoHKD"));
	    
	    attributeList1.add(new PdfAttribute("beneficiaryEnglishName1", lifeBeneficaryInfo.getBeneficaryFirstName1()+" "+lifeBeneficaryInfo.getBeneficaryLastName1()));
	    attributeList1.add(new PdfAttribute("beneficiaryChineseName1", lifeBeneficaryInfo.getBeneficaryChineseName1()));
	    attributeList1.add(new PdfAttribute("beneficiaryGender1", lifeBeneficaryInfo.getBeneficaryGender1()));
	    attributeList1.add(new PdfAttribute("beneficiaryHKID1", lifeBeneficaryInfo.getBeneficaryID1()));
	    attributeList1.add(new PdfAttribute("relationship1", lifeBeneficaryInfo.getBeneficaryRelation1()));
	    attributeList1.add(new PdfAttribute("entitlement1", lifeBeneficaryInfo.getBeneficaryWeight1()));
	    attributeList1.add(new PdfAttribute("beneficiaryEnglishName2", lifeBeneficaryInfo.getBeneficaryFirstName2()+" "+lifeBeneficaryInfo.getBeneficaryLastName2()));
	    attributeList1.add(new PdfAttribute("beneficiaryChineseName2", lifeBeneficaryInfo.getBeneficaryChineseName2()));
	    attributeList1.add(new PdfAttribute("beneficiaryGender2", lifeBeneficaryInfo.getBeneficaryGender2()));
	    attributeList1.add(new PdfAttribute("beneficiaryHKID2", lifeBeneficaryInfo.getBeneficaryID2()));
	    attributeList1.add(new PdfAttribute("relationship2", lifeBeneficaryInfo.getBeneficaryRelation2()));
	    attributeList1.add(new PdfAttribute("entitlement2", lifeBeneficaryInfo.getBeneficaryWeight2()));
	    attributeList1.add(new PdfAttribute("beneficiaryEnglishName3", lifeBeneficaryInfo.getBeneficaryFirstName3()+" "+lifeBeneficaryInfo.getBeneficaryLastName3()));
	    attributeList1.add(new PdfAttribute("beneficiaryChineseName3", lifeBeneficaryInfo.getBeneficaryChineseName3()));
	    attributeList1.add(new PdfAttribute("beneficiaryGender3", lifeBeneficaryInfo.getBeneficaryGender3()));
	    attributeList1.add(new PdfAttribute("beneficiaryHKID3", lifeBeneficaryInfo.getBeneficaryID3()));
	    attributeList1.add(new PdfAttribute("relationship3", lifeBeneficaryInfo.getBeneficaryRelation3()));
	    attributeList1.add(new PdfAttribute("entitlement3", lifeBeneficaryInfo.getBeneficaryWeight3()));
	    
	    attributeList1.add(new PdfAttribute("creditCardValue", lifePayment.getAccountNumber()));
	    attributeList1.add(new PdfAttribute("cardExpireDate", "cardExpireDate"));
	    attributeList1.add(new PdfAttribute("creditCardAuthEnglish", lifePayment.getAccountHolderName()));
	    
	    SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
	    attributeList1.add(new PdfAttribute("authDate", format.format(new Date())));
	    attributeList1.add(new PdfAttribute("authSign", request.getRealPath("/")+"resources\\pdf\\signature.png","imagepath"));
			
		String pdfTemplatePath1 = request.getRealPath("/").replace("\\", "/")+"resources/pdf/"+"SavieOnlineApplicationForm.pdf";
		String pdfGeneratePath1 = request.getRealPath("/").replace("\\", "\\\\")+"resources\\\\pdf\\\\";
		String name1 = PDFGeneration.generatePdf2(pdfTemplatePath1,pdfGeneratePath1,attributeList1,false,"All rights reserved, copy");
		logger.info("applicationFormPdf pdf signature success:"+name1);
		
		//upload signature
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
		parameters.accumulate("policyNo", eliteTermPolicy.getPolicyNo());
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
}
