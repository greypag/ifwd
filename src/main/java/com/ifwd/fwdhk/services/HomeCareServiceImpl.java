package com.ifwd.fwdhk.services;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.swing.text.html.HTMLDocument.HTMLReader.IsindexAction;

import org.joda.time.LocalDate;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.api.controller.RestServiceImpl;
import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.model.CreatePolicy;
import com.ifwd.fwdhk.model.DistrictBean;
import com.ifwd.fwdhk.model.FinalizePolicy;
import com.ifwd.fwdhk.model.HomeCareDetailsBean;
import com.ifwd.fwdhk.model.HomeCareQuetionaries;
import com.ifwd.fwdhk.model.HomeQuoteBean;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.util.WebServiceUtils;
import com.ifwd.fwdhk.utils.services.SendEmailDao;

/**
 * The HomeCareServiceImpl implementation Class for HomecareService
 * for HOME care Module
 *  * @author Prakash
 * Added @since 2015-03-18
 */
public class HomeCareServiceImpl implements HomeCareService {
	@Autowired
	SendEmailDao sendEmail;

	public List<HomeCareQuetionaries> getHomeQuetionaries(String token,
			String userName, String language) {
		// TODO Auto-generated method stub

		String Url = UserRestURIConstants.GET_HOMECARE_UW_QUESTIONS;
		RestServiceDao restService = new RestServiceImpl();
		List<HomeCareQuetionaries> quetionariesList = new ArrayList<HomeCareQuetionaries>();
		HashMap<String, String> header = new HashMap<String, String>(
				COMMON_HEADERS);

		header.put("username", userName);
		header.put("token", token);
		header.put("language", WebServiceUtils.transformLanaguage(language));
		JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,
				Url, header, null);
		if (responseJsonObj.get("errMsgs") == null) {
			JSONArray jsonQuetionaries = (JSONArray) responseJsonObj
					.get("homeCareQuestions");
			Iterator<?> itr = jsonQuetionaries.iterator();
			int i = 1;
			while (itr.hasNext()) {
				JSONObject jsonObjQuetionaries = (JSONObject) itr.next();
				HomeCareQuetionaries quetionaries = new HomeCareQuetionaries();
				quetionaries.setQuetion(checkJsonObjNull(jsonObjQuetionaries,
						"question"));
				quetionaries.setAnswer1(checkJsonObjNull(jsonObjQuetionaries,
						"answer1"));
				quetionaries.setAnswer2(checkJsonObjNull(jsonObjQuetionaries,
						"answer2"));

				quetionaries.setQid(String.valueOf(i));
				quetionariesList.add(quetionaries);
				i++;
				System.out.println("Value After ++" + i);
			}

		}
		return quetionariesList;
	}

	public String checkJsonObjNull(JSONObject obj, String checkByStr) {
		if (obj.get(checkByStr) != null) {
			return obj.get(checkByStr).toString();
		} else {
			return "null";
		}
	}

	public String checkStringNull(String checkByStr) {
		if (checkByStr != null) {
			return checkByStr.toString();
		} else {
			return "null";
		}
	}

	public HomeQuoteBean getHomePlan(String token, String userName,
			String userReferralCode, String answer1, String answer2) {
		
		String ans1="";;
		String ans2="";
		System.out.println("Ans 1 in Controller==="+answer1+"Answer2 in Servicr impl==="+answer2);
		if(answer1.equalsIgnoreCase("NO"))
		{
			ans1="N";
		}
		if(answer2.equalsIgnoreCase("NO"))
		{
			ans2="N";
		}
		//NAT TEMPORARILY SET BEFORE THE LANGUAGE PROBLEM SOLVED IN API
		ans1="N";
		ans2="N";
		HomeQuoteBean quoteDetails = new HomeQuoteBean();
		RestServiceDao restService = new RestServiceImpl();	
		String url = UserRestURIConstants.HOMECARE_GET_QUOTE
				+ "?planCode=EasyHomeCare" + "&referralCode="
				+ userReferralCode + "&room=&floor=&block="
				+ "&building=building1&estate=estate1&streetNo="
				+ "&streetName=&district=&area=&answer1="+ans1+"&answer2="+ans2;

		HashMap<String, String> header = new HashMap<String, String>(
				COMMON_HEADERS);
		if (userName != null && token != null) {
			header.put("userName", userName);
			header.put("token", token);
		}
		
		System.out.println("******************URL==>" + url);
		System.out.println("******************Header ===>>" + header);

		JSONObject jsonGetPlanResponse = restService.consumeApi(HttpMethod.GET,
				url, header, null);
		System.out.println("WS Response===>>>" + jsonGetPlanResponse);
		JSONArray jsonArrayMsg = (JSONArray) jsonGetPlanResponse
				.get("errMsgs");
		
	//	if (jsonGetPlanResponse.get("errMsgs") == null) {
		String referralCode = (String) jsonGetPlanResponse.get("referralCode");
		String referralName = (String) jsonGetPlanResponse.get("referralName");
		String planCode = (String) jsonGetPlanResponse.get("planCode");
		
		System.out.println("Plan Code ===>>" + planCode);
		
		jsonGetPlanResponse.get("priceInfo");
		JSONObject jsonPriceInfo = new JSONObject();
		
		jsonPriceInfo = (JSONObject) jsonGetPlanResponse.get("priceInfo");
		String discountPercentage = jsonPriceInfo.get("discountPercentage").toString();
		String totalDue = jsonPriceInfo.get("totalDue").toString();
		String grossPremium = jsonPriceInfo.get("grossPremium").toString();
		String totalNetPremium = jsonPriceInfo.get("totalNetPremium").toString();
		 String discountAmount = jsonPriceInfo.get("discountAmount").toString();
		/*
		String discountPercentage =(checkJsonObjNull(jsonGetPlanResponse, "discountPercentage"));
		String totalDue =(checkJsonObjNull(jsonGetPlanResponse, "totalDue"));
		String grossPremium =(checkJsonObjNull(jsonGetPlanResponse, "grossPremium"));
		String totalNetPremium =(checkJsonObjNull(jsonGetPlanResponse, "totalNetPremium"));
		String discountAmount =(checkJsonObjNull(jsonGetPlanResponse, "discountAmount"));*/
		
		quoteDetails.setDiscountPercentage(discountPercentage);
		quoteDetails.setTotalDue(totalDue);
		quoteDetails.setGrossPremium(grossPremium);
		quoteDetails.setTotalNetPremium(totalNetPremium);
		quoteDetails.setDiscountAmount(discountAmount);
		quoteDetails.setReferralCode(referralCode);
		quoteDetails.setReferralName(referralName);
		quoteDetails.setPlanCode(planCode);
		//quoteDetails.setErrormsg(jsonGetPlanResponse.get("errMsgs").toString());
		quoteDetails.setErrormsg(checkJsonObjNull(jsonGetPlanResponse, "errMsgs"));
		
		//}
		return quoteDetails;
	}

	public List<DistrictBean> getDistrict(String userName, String token) {
		// TODO Auto-generated method stub
		String Url = UserRestURIConstants.HOMECARE_GET_DISTRICT;

		RestServiceDao restService = new RestServiceImpl();
		List<DistrictBean> districtList = new ArrayList<DistrictBean>();
		HashMap<String, String> header = new HashMap<String, String>(
				COMMON_HEADERS);
		header.put("userName", userName);
		header.put("token", token);

		JSONObject jsonResponseDistrict = restService.consumeApi(
				HttpMethod.GET, Url, header, null);

		System.out.println("jsonResponseDistrict=====>>>"
				+ jsonResponseDistrict);

		// {"districtList":
		// [{"Area":"HK ","Description":"ABERDEEN ","Code":"AD"},{"Area":"HK ","Description":"ADMIRALTY","Code":"A1"},
		// {"Area":"HK ","Description":"AP LEI CHAU","Code":"AL"},{"Area":"KL ","Description":"BEACON HILL","Code":"BH"},

		if (jsonResponseDistrict.get("errMsgs") == null) {

			if (jsonResponseDistrict.get("errMsgs") == null) {
				JSONArray jsonDistrictArray = (JSONArray) jsonResponseDistrict
						.get("districtList");
				Iterator<?> itr = jsonDistrictArray.iterator();

				while (itr.hasNext()) {
					JSONObject jsonDistrictObj = (JSONObject) itr.next();
					DistrictBean district = new DistrictBean();
					district.setArea(checkJsonObjNull(jsonDistrictObj, "Area"));
					district.setCode(checkJsonObjNull(jsonDistrictObj, "Code"));
					district.setDescription(checkJsonObjNull(jsonDistrictObj,
							"Description"));

					districtList.add(district);
				}
			}
		}

		return districtList;
	}

	@Override
	public Map<String, String> getNetFloorArea(String userName, String token) {
		// TODO Auto-generated method stub

		String url = UserRestURIConstants.HOMECARE_GET_NET_FLOOR_AREA
				+ "?itemTable=NetFloorArea";

		RestServiceDao restService = new RestServiceImpl();
		Map<String, String> mapNetFloorArea = new HashMap<String, String>();
		HashMap<String, String> header = new HashMap<String, String>(
				COMMON_HEADERS);
		header.put("userName", userName);
		header.put("token", token);

		JSONObject jsonResponseNetFloorArea = restService.consumeApi(
				HttpMethod.GET, url, header, null);

		System.out.println("jsonResponseDistrict=====>>>"
				+ jsonResponseNetFloorArea);
		if (jsonResponseNetFloorArea.get("errMsgs") == null) {
			JSONArray jsonNetFloorAreaArray = (JSONArray) jsonResponseNetFloorArea
					.get("optionItemDesc");
		
		for (int i = 0; i < jsonNetFloorAreaArray.size(); i++) {
			JSONObject obj = (JSONObject) jsonNetFloorAreaArray.get(i);
			mapNetFloorArea.put(checkJsonObjNull(obj, "itemCode"),
					checkJsonObjNull(obj, "itemDesc"));
		}
		
		// {"optionItemDesc":[{"itemTable":"NetFloorArea","itemCode":"EEHCFLOORAREAA01","itemLang":"EN","itemDesc":"Less than 500"},{"itemTable":"NetFloorArea","itemCode":"EEHCFLOORAREAA02","itemLang":"EN","itemDesc":"500-700"},{"itemTable":"NetFloorArea","itemCode":"EEHCFLOORAREAA03","itemLang":"EN","itemDesc":"701-850"},{"itemTable":"NetFloorArea","itemCode":"EEHCFLOORAREAA04","itemLang":"EN","itemDesc":"851-1000"}],"errMsgs":null}
		}

		return mapNetFloorArea;
	}

	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public CreatePolicy createHomeCarePolicy(String userName,
			String token, HomeCareDetailsBean homeCareDetails, UserDetails userDetails) {
		
		
		JSONObject parameters = new JSONObject();
		JSONObject correspondenceAddress = new JSONObject();
		JSONObject insuredAddress = new JSONObject();
		JSONObject applicant = new JSONObject();
		RestServiceDao restService = new RestServiceImpl();
		
		Date effectiveDate = new Date(homeCareDetails.getEffectiveDate());
		
		LocalDate date = new LocalDate(effectiveDate);
		CreatePolicy createPolicy= new CreatePolicy();
		
		String edate=date.toString();
		System.out.println("edATE============================>>>"+edate);
		String strDeclaration =homeCareDetails.getDeclarration();
		String strReadAndUnderstood= homeCareDetails.getReadAndUnderstood();
		boolean dec;
		boolean readAndUnderStood;
		if (strDeclaration.equalsIgnoreCase("on"))
		{
			dec=true;
		}else{dec=false;}
		
//		if (strReadAndUnderstood.equalsIgnoreCase("on"))
//		{
//			readAndUnderStood=true;
//		}
//		else
//		{
//			readAndUnderStood=false;
//		}
//		
		parameters.put("commencementDate",edate);
		parameters.put("netFloorArea", homeCareDetails.getNetFloorArea());
		parameters.put("planCode", homeCareDetails.getPlanCode());
		
		correspondenceAddress.put("room",homeCareDetails.getApplicantRoom());
		correspondenceAddress.put("floor", homeCareDetails.getApplicantFloor());
		correspondenceAddress.put("block", homeCareDetails.getApplicantBlock());
		correspondenceAddress.put("building", homeCareDetails.getApplicantBuilding());
		correspondenceAddress.put("estate", homeCareDetails.getApplicantEstate());
		correspondenceAddress.put("streetNo",homeCareDetails.getApplicantStreetName());
		correspondenceAddress.put("district", homeCareDetails.getApplicantDistrict());
		correspondenceAddress.put("area", homeCareDetails.getApplicantArea());
		
		parameters.put("correspondenceAddress", correspondenceAddress);
		
		
		applicant.put("name", userDetails.getFullName());
		//applicant.put("gender", userDetails.getGender());
		applicant.put("gender","M");
	//	applicant.put("dob", userDetails.getDob());
		
		applicant.put("dob", "");
		
		applicant.put("hkId", userDetails.getHkid());
		applicant.put("passport", userDetails.getPassport());
		applicant.put("email",userDetails.getEmailAddress());
		applicant.put("mobileNo", userDetails.getMobileNo());
		applicant.put("occupation","");
		applicant.put("optIn1",dec);
//		applicant.put("optIn2",readAndUnderStood);

		parameters.put("applicant", applicant);
		
		insuredAddress.put("room", homeCareDetails.getaRoom());
		
		insuredAddress.put("floor", homeCareDetails.getaFloor());;
		insuredAddress.put("block", homeCareDetails.getaBlock());
		insuredAddress.put("building", homeCareDetails.getaBuilding());
		insuredAddress.put("estate", homeCareDetails.getaEstate() );
		insuredAddress.put("streetNo", homeCareDetails.getaStreetNo());
		insuredAddress.put("streetName", homeCareDetails.getaStreetName());
		insuredAddress.put("district",homeCareDetails.getaDistrict());
		insuredAddress.put("area", homeCareDetails.getaArea());
		parameters.put("insuredAddress", insuredAddress);
		
		HashMap<String, String> header = new HashMap<String, String>(
				COMMON_HEADERS);
		header.put("userName",userName);
		header.put("token",token);

		System.out.println("parameter for Create Homecare Policy=========>>>"+parameters);
		
		JSONObject responsObject = restService.consumeApi(HttpMethod.PUT,
				UserRestURIConstants.HOMECARE_CREATE_POLICY, header, parameters);

		System.out.println("WS Response=====>>>>" + responsObject);

		JSONObject resultObj = new JSONObject();
		if (resultObj.get("errMsgs") == null) {
			resultObj.get("referenceNo");
			resultObj.get("referralCode");
			
			createPolicy.setReferralCode(checkJsonObjNull(responsObject, "referralCode"));
			createPolicy.setReferenceNo(checkJsonObjNull(responsObject, "referenceNo"));
			createPolicy.setPlanCode(checkJsonObjNull(responsObject, "planCode"));
			createPolicy.setPaymentGateway(checkJsonObjNull(responsObject, "paymentGateway"));
			createPolicy.setMerchantId(checkJsonObjNull(responsObject, "merchantId"));
			createPolicy.setCurrCode(checkJsonObjNull(responsObject, "currCode"));
			createPolicy.setPaymentType(checkJsonObjNull(responsObject, "paymentType"));
			createPolicy.setLang(checkJsonObjNull(responsObject, "lang"));
		}
		return createPolicy;
	}

	@Override
	public CreatePolicy confirmHomeCarePolicy(String userName, String token,
			String referenceNo) {
		// TODO Auto-generated method stub
		
		HashMap<String, String> header = new HashMap<String, String>(
				COMMON_HEADERS);
		header.put("userName",
				userName);
		header.put("token", token);
		RestServiceDao restService = new RestServiceImpl();
		
		CreatePolicy createPolicy= new CreatePolicy();
		
		JSONObject confirmPolicyParameter = new JSONObject();
		confirmPolicyParameter.put("referenceNo", referenceNo);
		JSONObject jsonResponse = restService.consumeApi(HttpMethod.POST,
				UserRestURIConstants.HOMECARE_CONFIRM_POLICY, header,
				confirmPolicyParameter);
		System.out.println("Response From Confirm homeCare Policy "
				+ jsonResponse);

		createPolicy.setSecureHash(checkJsonObjNull(jsonResponse,
				"secureHash"));
		createPolicy.setTransactionNo(checkJsonObjNull(jsonResponse,
				"transactionNumber"));
		createPolicy.setTransactionDate(checkJsonObjNull(jsonResponse,
				"transactionDate"));
		
		
		return createPolicy;
	}

	/*@Override
	public List<String> confirmHomeCare(String userName, String token,
			String referenceNo, String transactionNumber,
			String transactionDate, String creditCardNo, String expiryDate) {

		
		RestServiceDao restService = new RestServiceImpl();
		HashMap<String, String> header = new HashMap<String, String>(
				COMMON_HEADERS);
		header.put("userName",
				userName);
		header.put("token",
				token);

		
		JSONObject responsObject = new JSONObject();
		
			JSONObject parameters = new JSONObject();
			parameters.put("referenceNo",referenceNo);
			parameters.put("transactionNumber", transactionNumber);
			parameters.put("transactionDate", transactionDate);
			parameters.put("creditCardNo",creditCardNo);
			parameters.put("expiryDate", expiryDate);
			
		
		
		JSONObject apiResponsObject = restService.consumeApi(HttpMethod.POST,
				UserRestURIConstants.HOMECARE_FINALIZE_POLICY, header,
				parameters);
		 System.out.println("final homeCare Policy Response"+responsObject);

		if (responsObject.get("errMsgs") == null) {
			
			JSONObject email_params = new JSONObject();
			//email_params.put("to", emailId);
			email_params.put("message", "<h1>my testing</h1><u>underline</u>");
			email_params.put("subject", "html testing");
			email_params.put("attachment", null);
			email_params.put("from", "sit@ecomm.fwd.com");

			restService.consumeApi(HttpMethod.POST,
					UserRestURIConstants.SEND_MAIL, header, email_params);
		}
		
		// TODO Auto-generated method stub
		return null;
	}*/

	@SuppressWarnings("unchecked")
	@Override
	public CreatePolicy finalizeHomeCarePolicy(String userName, String token,String referenceNo, String transactionNumber,String transactionDate,String creditCardNo, String expiryDate, String emailId) {
		
		
		RestServiceDao restService = new RestServiceImpl();
		CreatePolicy finalizeObject = new CreatePolicy();
		HashMap<String, String> header = new HashMap<String, String>(
				COMMON_HEADERS);
		header.put("userName",
				userName);
		header.put("token",
				token);
			JSONObject parameters = new JSONObject();
			parameters.put("referenceNo",referenceNo);
			parameters.put("transactionNumber", transactionNumber);
			parameters.put("transactionDate", transactionDate);
			parameters.put("creditCardNo",creditCardNo);
			parameters.put("expiryDate", expiryDate);
			
		JSONObject apiResponsObject = restService.consumeApi(HttpMethod.POST,
				UserRestURIConstants.HOMECARE_FINALIZE_POLICY, header,
				parameters);
		 System.out.println("final homeCare Policy Response"+apiResponsObject);

		if (apiResponsObject.get("errMsgs") == null) {
			
		//	finalizeObject.setPolicyNo((String )apiResponsObject.get("policy"));
			finalizeObject.setPolicyNo(checkJsonObjNull(apiResponsObject,
					"policyNo"));
			
			System.out.println("POlicy Number in Impl after WS "+finalizeObject.getPolicyNo());
			finalizeObject.setReferralCode(referenceNo);
		}
		return finalizeObject;
	}
}