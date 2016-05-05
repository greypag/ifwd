package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.connector.ECommWsConnector;
import com.ifwd.fwdhk.connector.response.savie.AccountBalanceResponse;
import com.ifwd.fwdhk.connector.response.savie.PurchaseHistoryPolicies;
import com.ifwd.fwdhk.connector.response.savie.PurchaseHistoryResponse;
import com.ifwd.fwdhk.model.PurchaseHistory;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.model.UserLogin;
import com.ifwd.fwdhk.services.LifeService;
import com.ifwd.fwdhk.util.DateApi;
import com.ifwd.fwdhk.util.HeaderUtil;
import com.ifwd.fwdhk.util.JsonUtils;
import com.ifwd.fwdhk.util.ValidationUtils;
import com.ifwd.fwdhk.util.WebServiceUtils;

@Controller
@SuppressWarnings("unchecked")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);	
	
	@Autowired
	RestServiceDao restService;
	
	@Autowired 
	protected ECommWsConnector connector;
	
	@Autowired
	protected HeaderUtil headerUtil;
	
	@Autowired
	private LifeService savieOnlineService;

	@RequestMapping(value = "/verifyRecaptcha", method = RequestMethod.POST)
	@ResponseBody
	public String verifyCaptcha(HttpServletRequest request) 
	{	
		boolean result = ValidationUtils.verifyGoogleRecaptcha(request.getParameter("recaptchaValue"));
		logger.debug("Google Recaptcha Result: "+result);
		return result ? "success": "fail";
	}
	
	@RequestMapping(value = "/userLogout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest servletRequest){
		savieOnlineService.deleteSaviePdf(servletRequest);

		String homeURL = "/changeLang?selectLang=EN&action=/tc/";
		String lang = UserRestURIConstants.getLanaguage(servletRequest);
		HttpSession session = servletRequest.getSession(false);
		
		if (session!=null) 
		{
			session.invalidate();
		}
		session = servletRequest.getSession(true);
		session.setAttribute("language", lang);
		
		if (lang != null)
		{
			if (lang.equals("tc"))
				homeURL = "/changeLang?selectLang=tc&action=/en/";
			else
				homeURL = "/changeLang?selectLang=tc&action=/tc/";
		}
		return new ModelAndView("redirect:" + homeURL);
	}

	@RequestMapping(value = "/userLogin", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject login(@ModelAttribute("userLogin") UserLogin userLogin,
			HttpServletRequest servletRequest) {
		JSONObject jsonObject = new JSONObject();
		try {
			if (!userLogin.getPassword().isEmpty()
					&& !userLogin.getUserName().isEmpty()) {

				JSONObject params = new JSONObject();
				params.put("userName", userLogin.getUserName());
				params.put("password", userLogin.getPassword());
				
				logger.info("USER_LOGIN Requset" + JsonUtils.jsonPrint(params));
				JSONObject response = restService.consumeApi(HttpMethod.POST,
						UserRestURIConstants.USER_LOGIN, COMMON_HEADERS,
						params);
				logger.info("USER_LOGIN Response" + JsonUtils.jsonPrint(response));

				// check by error message is null then valid response
				if (response != null && !response.isEmpty() && response.get("errMsgs") == null) {
					HttpSession session = servletRequest.getSession(true);
					session.setAttribute("authenticate", "true");
					session.setAttribute("token", response.get("token")
							.toString());
					session.setAttribute("username", userLogin.getUserName());
					JSONObject customer = (JSONObject) response.get("customer");
					session.setAttribute("emailAddress",
							checkJsonObjNull(customer, "email"));
					session.setAttribute("myReferralCode",
							checkJsonObjNull(customer, "referralCode"));
					session.setAttribute("myHomeReferralCode",
							checkJsonObjNull(customer, "referralCode"));
					session.setAttribute("myTravelReferralCode",
							checkJsonObjNull(customer, "referralCode"));
					session.setAttribute("myAnnualTravelReferralCode",
							checkJsonObjNull(customer, "referralCode"));
					/*session.setAttribute("myOverseasReferralCode",
							checkJsonObjNull(customer, "referralCode"));*/
					

					UserDetails userDetails = new UserDetails();
					userDetails.setToken(checkJsonObjNull(response, "token"));
					userDetails.setFullName(checkJsonObjNull(customer, "name"));
					if(userDetails.getFullName() != null && userDetails.getFullName().contains(" ")){
						String[] strArray = userDetails.getFullName().split(" ");
						String firstName = "";
						String lastName = "";
						for(int i=0;i<strArray.length;i++){
							if(i==0){
								lastName = strArray[0];
							}
							else{
								firstName += strArray[i]+" ";
							}
						}
						userDetails.setFirstName(firstName);
						userDetails.setLastName(lastName);
					}
					else{
						userDetails.setFirstName(userDetails.getFullName());
					}
					jsonObject.put("fullName", userDetails.getFullName());
					userDetails.setEmailAddress(checkJsonObjNull(customer,
							"email"));
					userDetails.setMobileNo(checkJsonObjNull(customer,
							"contactNo"));
					userDetails.setUserName(userLogin.getUserName());
					userDetails.setReferralCode(checkJsonObjNull(customer,
							"referralCode"));
					userDetails.setReferralCodeUsedCount(checkJsonObjNull(
							customer, "referralCodeUsedCount"));
					userDetails.setReferralLink(checkJsonObjNull(customer,
							"referralLink"));
					userDetails.setGender(checkJsonObjNull(customer, "gender"));
					userDetails.setDob(checkJsonObjNull(customer, "dob"));
					userDetails.setOptIn1(checkJsonObjNull(customer, "optIn1"));
					userDetails.setOptIn2(checkJsonObjNull(customer, "optIn2"));
					session.setAttribute("userDetails", userDetails);
					
					String Url = UserRestURIConstants.GET_FNA;
					final Map<String,String> header = headerUtil.getHeader(servletRequest);
					JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,Url, header, null);
					if (responseJsonObj.get("result") != null){
						JSONObject jobject = (JSONObject)responseJsonObj.get("result");
						if(jobject.get("name")!=null&&jobject.get("gender")!=null){
							session.setAttribute("fnaLastUpdate", jobject.get("last_update")!=null?DateApi.formatTime1(Long.valueOf(jobject.get("last_update").toString())):"");
						}
					}
					
					jsonObject.put("loginResult", "success");
					return jsonObject;
				}else if (response.isEmpty()) {
					jsonObject.put("loginResult", "fail");
					return jsonObject;
				}else {
					String errMessage = response.get("errMsgs").toString();
					jsonObject.put("loginResult", errMessage.replaceAll("\"", "").replace("[", "").replace("]", ""));
					return jsonObject;
				}
			} else {
				jsonObject.put("loginResult", "fail");
				return jsonObject;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		jsonObject.put("loginResult", "fail");
		return jsonObject;

	}

	@SuppressWarnings("rawtypes")
	@RequestMapping(value = {"/getAccByUsernaneAndPassword", "/{lang}/account"}, method = RequestMethod.GET)
	public ModelAndView getAccountDetailsByUsernameAndPassoword(HttpServletRequest request, Model model) {
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		HttpSession session = request.getSession(false);
		UserDetails userDetails = (UserDetails) session.getAttribute("userDetails");
		if(userDetails != null){
			try {
				String tokenInSession = session.getAttribute("token").toString();
				String usernameInSession = session.getAttribute("username").toString();
				
				userDetails.setFullName(userDetails.getFullName());
				userDetails.setEmailAddress(userDetails.getEmailAddress());
				userDetails.setMobileNo(userDetails.getMobileNo());
				userDetails.setUserName(userDetails.getUserName());
				model.addAttribute(userDetails);
				
				/* getPurchaseHistory */
				if (!tokenInSession.isEmpty() && !usernameInSession.isEmpty()) {
					HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
					String lang = UserRestURIConstants.getLanaguage(request);
					header.put("userName", usernameInSession);
					header.put("token", tokenInSession);
					header.put("language", WebServiceUtils
							.transformLanaguage(UserRestURIConstants
									.getLanaguage(request)));

					PurchaseHistoryResponse purchaseHistory = connector.getPurchaseHistory(header);
					/*List<PurchaseHistoryPolicies> policiesGI = new ArrayList<PurchaseHistoryPolicies>();
					List<PurchaseHistoryPolicies> policiesLife = new ArrayList<PurchaseHistoryPolicies>();
					if(purchaseHistory !=null && !purchaseHistory.hasError() && purchaseHistory.getPolicies().size()>0){
						for(int i=0;i<purchaseHistory.getPolicies().size();i++){
							
							SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
							if(purchaseHistory.getPolicies().get(i).getSubmissionDate() !=null){
								SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss") ;
								Date d = null ;    
								try{
									d = sdf1.parse(purchaseHistory.getPolicies().get(i).getSubmissionDate()) ;
								}catch(Exception e){
									e.printStackTrace() ;
								}    
								purchaseHistory.getPolicies().get(i).setSubmissionDate(sdf.format(d));
							}
							if(purchaseHistory.getPolicies().get(i).getCommencementDate() !=null && purchaseHistory.getPolicies().get(i).getCommencementDate().length() >9 ){
								purchaseHistory.getPolicies().get(i).setCommencementDate(sdf.format(new Date(Long.valueOf(purchaseHistory.getPolicies().get(i).getCommencementDate()))));
							}
							if(purchaseHistory.getPolicies().get(i).getExpiryDate() !=null && purchaseHistory.getPolicies().get(i).getExpiryDate().length() >9 ){
								purchaseHistory.getPolicies().get(i).setExpiryDate(sdf.format(new Date(Long.valueOf(purchaseHistory.getPolicies().get(i).getExpiryDate()))));
							}
							
							if(purchaseHistory.getPolicies().get(i).getPolicyType() !=null && purchaseHistory.getPolicies().get(i).getPolicyType().equals("GI")){
								policiesGI.add(purchaseHistory.getPolicies().get(i));
							}
							if(purchaseHistory.getPolicies().get(i).getPolicyType() !=null && purchaseHistory.getPolicies().get(i).getPolicyType().equals("Life")){
								policiesLife.add(purchaseHistory.getPolicies().get(i));
							}
							purchaseHistory.getPolicies().get(i).setPolicyNumberBase64(new sun.misc.BASE64Encoder().encode(purchaseHistory.getPolicies().get(i).getPolicyNumber().getBytes()));
						}
					}
					model.addAttribute("policiesGI", policiesGI);
					model.addAttribute("policiesLife", policiesLife);*/
//					Life and health - elite term
//					Saving insurance - savie
//					Household - easy home
//					Travel - all others 
					if(purchaseHistory !=null && !purchaseHistory.hasError() && purchaseHistory.getPolicies().size()>0){
						List<PurchaseHistoryPolicies> pending_life = new ArrayList<PurchaseHistoryPolicies>();
						List<PurchaseHistoryPolicies> active_life = new ArrayList<PurchaseHistoryPolicies>();
						List<PurchaseHistoryPolicies> past_life = new ArrayList<PurchaseHistoryPolicies>();
						
						List<PurchaseHistoryPolicies> pending_saving = new ArrayList<PurchaseHistoryPolicies>();
						List<PurchaseHistoryPolicies> active_saving = new ArrayList<PurchaseHistoryPolicies>();
						List<PurchaseHistoryPolicies> past_saving = new ArrayList<PurchaseHistoryPolicies>();
						
						List<PurchaseHistoryPolicies> pending_house = new ArrayList<PurchaseHistoryPolicies>();
						List<PurchaseHistoryPolicies> active_house = new ArrayList<PurchaseHistoryPolicies>();
						List<PurchaseHistoryPolicies> past_house = new ArrayList<PurchaseHistoryPolicies>();
						
						List<PurchaseHistoryPolicies> pending_travel = new ArrayList<PurchaseHistoryPolicies>();
						List<PurchaseHistoryPolicies> active_travel = new ArrayList<PurchaseHistoryPolicies>();
						List<PurchaseHistoryPolicies> past_travel = new ArrayList<PurchaseHistoryPolicies>();
						
						long currentTime = DateApi.getCurrentTime();
						
						PurchaseHistoryPolicies entity;
						String url;
						sun.misc.BASE64Encoder encoder = new sun.misc.BASE64Encoder();
						String serverUrl = request.getScheme()+"://"+request.getServerName()+request.getContextPath();
						if (request.getServerPort() != 80 && request.getServerPort() != 443){
							serverUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
						}
						String language = (String) request.getSession().getAttribute("language");
						if(StringUtils.isEmpty(language)){
							language = "tc";
						}
						String inComplete = WebServiceUtils.getMessage("user.policy.status.incomplete", UserRestURIConstants.getLanaguage(request));
						String type1 = WebServiceUtils.getMessage("eservice.product.type1", UserRestURIConstants.getLanaguage(request));
						String type2 = WebServiceUtils.getMessage("eservice.product.type2", UserRestURIConstants.getLanaguage(request));
						String type3 = WebServiceUtils.getMessage("eservice.product.type3", UserRestURIConstants.getLanaguage(request));
						String type4 = WebServiceUtils.getMessage("eservice.product.type4", UserRestURIConstants.getLanaguage(request));
						String type5 = WebServiceUtils.getMessage("eservice.product.type5", UserRestURIConstants.getLanaguage(request));
						String type6 = WebServiceUtils.getMessage("eservice.product.type6", UserRestURIConstants.getLanaguage(request));
						String type7 = WebServiceUtils.getMessage("eservice.product.type7", UserRestURIConstants.getLanaguage(request));
						String type8 = WebServiceUtils.getMessage("eservice.product.type8", UserRestURIConstants.getLanaguage(request));
						String type9 = WebServiceUtils.getMessage("eservice.product.type9", UserRestURIConstants.getLanaguage(request));
						String inforce = WebServiceUtils.getMessage("eservice.status.inforce", UserRestURIConstants.getLanaguage(request));
						String docNow = WebServiceUtils.getMessage("label.status.upload.doc.now", UserRestURIConstants.getLanaguage(request));
						String pending = WebServiceUtils.getMessage("tab.member.top.pending", UserRestURIConstants.getLanaguage(request));
						String active = WebServiceUtils.getMessage("tab.member.top.active", UserRestURIConstants.getLanaguage(request));
						String past = WebServiceUtils.getMessage("tab.member.top.past", UserRestURIConstants.getLanaguage(request));
						
						for(int i=0;i<purchaseHistory.getPolicies().size();i++){
							entity = purchaseHistory.getPolicies().get(i);
							
							if(!StringUtils.isEmpty(entity.getCommencementDate())) {
								entity.setCommencementDateDesc(DateApi.formatTime2(entity.getCommencementDate()));
							}else {
								entity.setCommencementDateDesc(inComplete);
						    }
							if(!StringUtils.isEmpty(entity.getExpiryDate())) {
								entity.setExpiryDateDesc(DateApi.formatTime2(entity.getExpiryDate()));
							}else {
								entity.setExpiryDateDesc(inComplete);
							}
							if("ET".equalsIgnoreCase(entity.getPlanCode())) {
								entity.setPlanName(type1);
							}else if("FlightCare".equalsIgnoreCase(entity.getPlanCode())) {
								entity.setPlanName(type2);
							}else if("TravelCare".equalsIgnoreCase(entity.getPlanCode())) {
								entity.setPlanName(type3);
							}else if("AnnualTravelCare".equalsIgnoreCase(entity.getPlanCode())) {
								entity.setPlanName(type4);
							}else if("OverseasStudyCare".equalsIgnoreCase(entity.getPlanCode())) {
								entity.setPlanName(type5);
							}else if("WorkingHolidayCare".equalsIgnoreCase(entity.getPlanCode()) || "WorkingHoliday".equalsIgnoreCase(entity.getPlanCode())) {
								entity.setPlanName(type6);
							}else if("EasyHomeCare".equalsIgnoreCase(entity.getPlanCode())) {
								entity.setPlanName(type7);
							}else if("SAVIE".equalsIgnoreCase(entity.getPlanCode())) {
								entity.setPlanName(type8);
							}else if("SAVIE-SP".equalsIgnoreCase(entity.getPlanCode())) {
								entity.setPlanName(type9);
							}
							
							if("Z".equalsIgnoreCase(entity.getStatus())){
								entity.setStatus(inforce);
							}
							
							if("ET".equals(entity.getPlanCode())) {
								if("GI".equals(entity.getPolicyType())) {
									if(currentTime <= DateApi.String2Long(entity.getExpiryDate())) {
										if("false".equals(entity.getDocumentUploaded())) {
											url = serverUrl + "/"+language+"/term-life-insurance/document-upload?policyNumber="+encoder.encode(entity.getPolicyNumber().getBytes());
											entity.setStatus("<a href=\"" + url + "\">"
												+ docNow + "</a>");
										}else {
											entity.setStatus(active);
										}
										active_life.add(entity);
				 					}else {
				 						if("false".equals(entity.getDocumentUploaded())) {
											url = serverUrl + "/"+language+"/term-life-insurance/document-upload?policyNumber="+encoder.encode(entity.getPolicyNumber().getBytes());
											entity.setStatus("<a href=\"" + url + "\">"
												+ docNow + "</a>");
										}else {
											entity.setStatus(past);
										}
										past_life.add(entity);
									}
								}else if("Life".equals(entity.getPolicyType())) {

									// Change Elite Term Plan Name. Temp Solution. Please Update Database
									if(entity.getPlanName().equals("定期壽險")){
										entity.setPlanName("智理想定期保障計劃");
									}

									if("PENDING".equals(entity.getStatus())) {
										if("false".equals(entity.getDocumentUploaded())) {
											url = serverUrl + "/"+language+"/term-life-insurance/document-upload?policyNumber="+encoder.encode(entity.getPolicyNumber().getBytes());
											entity.setStatus("<a href=\"" + url + "\">"
												+ docNow + "</a>");
										}else {
											entity.setStatus(pending);
										}
										pending_life.add(entity);
									}else if("ACTIVE".equals(entity.getStatus())) {
										if("false".equals(entity.getDocumentUploaded())) {
											url = serverUrl + "/"+language+"/term-life-insurance/document-upload?policyNumber="+encoder.encode(entity.getPolicyNumber().getBytes());
											entity.setStatus("<a href=\"" + url + "\">"
												+ docNow + "</a>");
										}else {
											entity.setStatus(active);
										}
										active_life.add(entity);
									}else if("PAST".equals(entity.getStatus())) {
										if("false".equals(entity.getDocumentUploaded())) {
											url = serverUrl + "/"+language+"/term-life-insurance/document-upload?policyNumber="+encoder.encode(entity.getPolicyNumber().getBytes());
											entity.setStatus("<a href=\"" + url + "\">"
												+ docNow + "</a>");
										}else {
											entity.setStatus(past);
										}
										past_life.add(entity);
									}
								}
							}else if("SAVIE".equals(entity.getPlanCode()) || "SAVIE-SP".equals(entity.getPlanCode()) || "SAVIE-RP".equals(entity.getPlanCode())) {
								if("GI".equals(entity.getPolicyType())) {
									if(currentTime <= DateApi.String2Long(entity.getExpiryDate())) {
										if("false".equals(entity.getDocumentUploaded())) {
											url = serverUrl + "/"+language+"/savings-insurance/document-upload?policyNumber="+encoder.encode(entity.getPolicyNumber().getBytes());
											entity.setStatus("<a href=\"" + url + "\">"
												+ docNow + "</a>");
										}else {
											entity.setStatus(active);
										}
										active_saving.add(entity);
									}else {
										if("false".equals(entity.getDocumentUploaded())) {
											url = serverUrl + "/"+language+"/savings-insurance/document-upload?policyNumber="+encoder.encode(entity.getPolicyNumber().getBytes());
											entity.setStatus("<a href=\"" + url + "\">"
												+ docNow + "</a>");
										}else {
											entity.setStatus(past);
										}
										past_saving.add(entity);
									}
								}else if("Life".equals(entity.getPolicyType())) {
									if("PENDING".equals(entity.getStatus())) {
										if("false".equals(entity.getDocumentUploaded())) {
											url = serverUrl + "/"+language+"/savings-insurance/document-upload?policyNumber="+encoder.encode(entity.getPolicyNumber().getBytes());
											entity.setStatus("<a href=\"" + url + "\">"
												+ docNow + "</a>");
										}else {
											entity.setStatus(pending);
										}
										pending_saving.add(entity);
									}else if("ACTIVE".equals(entity.getStatus())) {
										if("false".equals(entity.getDocumentUploaded())) {
											url = serverUrl + "/"+language+"/savings-insurance/document-upload?policyNumber="+encoder.encode(entity.getPolicyNumber().getBytes());
											entity.setStatus("<a href=\"" + url + "\">"
												+ docNow + "</a>");
										}else {
											entity.setStatus(active);
										}
										active_saving.add(entity);
									}else if("PAST".equals(entity.getStatus())) {
										if("false".equals(entity.getDocumentUploaded())) {
											url = serverUrl + "/"+language+"/savings-insurance/document-upload?policyNumber="+encoder.encode(entity.getPolicyNumber().getBytes());
											entity.setStatus("<a href=\"" + url + "\">"
												+ docNow + "</a>");
										}else {
											entity.setStatus(past);
										}
										past_saving.add(entity);
									}
								}
							}else if("EasyHomeCare".equals(entity.getPlanCode())) {
								if("GI".equals(entity.getPolicyType())) {
									if(currentTime <= DateApi.String2Long(entity.getExpiryDate())) {
										active_house.add(entity);
									}else {
										past_house.add(entity);
									}
								}else if("Life".equals(entity.getPolicyType())) {
									if("PENDING".equals(entity.getStatus())) {
										entity.setStatus(pending);
										pending_house.add(entity);
									}else if("ACTIVE".equals(entity.getStatus())) {
										entity.setStatus(active);
										active_house.add(entity);
									}else if("PAST".equals(entity.getStatus())) {
										entity.setStatus(past);
										past_house.add(entity);
									}
								}
							}else {
								if("GI".equals(entity.getPolicyType())) {
									if(currentTime <= DateApi.String2Long(entity.getExpiryDate())) {
										active_travel.add(entity);
									}else {
										past_travel.add(entity);
									}
								}else if("Life".equals(entity.getPolicyType())) {
									if("PENDING".equals(entity.getStatus())) {
										entity.setStatus(pending);
										pending_travel.add(entity);
									}else if("ACTIVE".equals(entity.getStatus())) {
										entity.setStatus(active);
										active_travel.add(entity);
									}else if("PAST".equals(entity.getStatus())) {
										entity.setStatus(past);
										past_travel.add(entity);
									}
								}
							}
						}
						
						
						model.addAttribute("pending_life", pending_life);
						model.addAttribute("pending_saving", pending_saving);
						model.addAttribute("pending_house", pending_house);
						model.addAttribute("pending_travel", pending_travel);
						model.addAttribute("active_life", active_life);
						model.addAttribute("active_saving", active_saving);
						model.addAttribute("active_house", active_house);
						model.addAttribute("active_travel", active_travel);
						model.addAttribute("past_life", past_life);
						model.addAttribute("past_saving", past_saving);
						model.addAttribute("past_house", past_house);
						model.addAttribute("past_travel", past_travel);
						
					}
				}
				return new ModelAndView(UserRestURIConstants.getSitePath(request)+ "eservices");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else{
			return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request));
		}
		return new ModelAndView("");
	}

	@RequestMapping(value = {"/{lang}/joinus", "/{lang}/join-us"}, method = RequestMethod.GET)
	public String signup(Model model, HttpServletRequest req) {
		UserDetails userDetails = new UserDetails();
		model.addAttribute("userDetails", userDetails);
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(req);
		
		String pageTitle = WebServiceUtils.getPageTitle("page.joinUs", UserRestURIConstants.getLanaguage(req));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.joinUs", UserRestURIConstants.getLanaguage(req));
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
		
		return UserRestURIConstants.getSitePath(req)+ "joinus";
	}
	
	

	@RequestMapping(value = "/useraccount", method = RequestMethod.GET)
	public String userAccount(@ModelAttribute("userLogin") UserLogin userLogin,
			BindingResult result, HttpServletRequest req, Model model) {

		return "useraccount";
	}
	
	
	@RequestMapping(value = "/uatAuth", method = RequestMethod.GET)
	public String uatAuthBrowse(HttpServletRequest request, Model model) {
		
		String dir = UserRestURIConstants.getSitePath(request);
		
//		session.setAttribute("language", "EN");
		String redirect ="../jsp/" + dir + "/uatLogin";
		return redirect;
	}
	
	@RequestMapping(value = "/uatAuth", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView uatAuth(HttpServletRequest request, Model model) {
		String userName = request.getParameter("uatUserName");
		String password = request.getParameter("uatPassword");
		if (userName.equals("ifwdUser") && password.equals("Pass1234")) {
			HttpSession session = request.getSession();
			session.setAttribute("uatAuth", "ifwdUser");
			return new ModelAndView("redirect:" + "/tc");
		}
		return null;
	}
			
			
	
	
	@RequestMapping(value = {"/{lang}/joinus", "/{lang}/join-us"}, method = RequestMethod.POST)
	@ResponseBody
	public String registerUser(
			@ModelAttribute("userDetails") UserDetails userDetails,
			HttpServletRequest servletRequest, Model model) {
		HttpSession session = servletRequest.getSession(false);
		boolean optIn1 = false;
		boolean optIn2 = false;
		if (userDetails.getCheckbox3() == null) { 
			optIn1 = false;
		} else	if (userDetails.getCheckbox3().toUpperCase().equals("ON")) {
			optIn1 = true;
		} else {
			optIn1 = false;
		}
		
		if (userDetails.getCheckbox4() == null) {
			optIn2 = false;
		}
		else if (userDetails.getCheckbox4().toUpperCase().equals("ON")) {
			optIn2 = true;
		} else {
			optIn2 = false;
		}
		
		
		try {
			
			JSONObject params = new JSONObject();
			params.put("userName", userDetails.getUserName());
			params.put("mobile", userDetails.getMobileNo());
			params.put("password", userDetails.getPassword());
			params.put("email", userDetails.getEmailAddress());
			params.put("name", userDetails.getFullName());
			params.put("optIn1", optIn1);
			params.put("optIn2", optIn2);
			
			//added this for ajax sign up for those forms
			if(servletRequest.getParameter("ajax") != null){
				params.put("userName", servletRequest.getParameter("userName"));
				params.put("password", servletRequest.getParameter("password"));
				params.put("email", servletRequest.getParameter("email"));
				params.put("mobile", servletRequest.getParameter("mobile"));
				params.put("name", servletRequest.getParameter("name"));
				params.put("optIn1", servletRequest.getParameter("optIn1"));
				params.put("optIn2", servletRequest.getParameter("optIn2"));
			}
			
			logger.info("USER_JOIN_US Request " + JsonUtils.jsonPrint(params));
			JSONObject jsonResponse = restService.consumeApi(HttpMethod.PUT,
					UserRestURIConstants.USER_JOIN_US,
					COMMON_HEADERS, params);
			logger.info("USER_JOIN_US Response " + JsonUtils.jsonPrint(jsonResponse));
			if (jsonResponse.get("errMsgs") == null) {
				UserLogin userLogin = new UserLogin();
				userLogin.setUserName(userDetails.getUserName());
				userLogin.setPassword(userDetails.getPassword());
				params = new JSONObject();
				params.put("userName", userLogin.getUserName());
				params.put("password", userLogin.getPassword());
				
				logger.info("USER_LOGIN Request " + JsonUtils.jsonPrint(params));
				JSONObject response = restService.consumeApi(HttpMethod.POST,
						UserRestURIConstants.USER_LOGIN, COMMON_HEADERS,
						params);
				logger.info("USER_LOGIN Response " + JsonUtils.jsonPrint(response));
				if (response.get("errMsgs") == null && response != null) {
					session.setAttribute("authenticate", "true");
					session.setAttribute("token", response.get("token")
							.toString());
					session.setAttribute("username", userLogin.getUserName());
					JSONObject customer = (JSONObject) response.get("customer");
					session.setAttribute("emailAddress",
							checkJsonObjNull(customer, "email"));
					session.setAttribute("myReferralCode",
							checkJsonObjNull(customer, "referralCode"));
					session.setAttribute("myHomeReferralCode",
							checkJsonObjNull(customer, "referralCode"));
					session.setAttribute("myTravelReferralCode",
							checkJsonObjNull(customer, "referralCode"));
					session.setAttribute("myAnnualTravelReferralCode",
							checkJsonObjNull(customer, "referralCode"));
					/*session.setAttribute("myOverseasReferralCode",
							checkJsonObjNull(customer, "referralCode"));*/

					UserDetails loginUserDetails = new UserDetails();
					loginUserDetails.setToken(checkJsonObjNull(response, "token"));
					loginUserDetails.setFullName(checkJsonObjNull(customer, "name"));
					if(loginUserDetails.getFullName() != null && loginUserDetails.getFullName().contains(" ")){
						String[] strArray = loginUserDetails.getFullName().split(" ");
						String firstName = "";
						String lastName = "";
						for(int i=0;i<strArray.length;i++){
							if(i==0){
								lastName = strArray[0];
							}
							else{
								firstName += strArray[i]+" ";
							}
						}
						loginUserDetails.setFirstName(firstName);
						loginUserDetails.setLastName(lastName);
					}
					else{
						loginUserDetails.setFirstName(loginUserDetails.getFullName());
					}
					loginUserDetails.setEmailAddress(checkJsonObjNull(customer,
							"email"));
					loginUserDetails.setMobileNo(checkJsonObjNull(customer,
							"contactNo"));
					loginUserDetails.setUserName(userLogin.getUserName());
					loginUserDetails.setReferralCode(checkJsonObjNull(customer,
							"referralCode"));
					loginUserDetails.setReferralCodeUsedCount(checkJsonObjNull(
							customer, "referralCodeUsedCount"));
					loginUserDetails.setReferralLink(checkJsonObjNull(customer,
							"referralLink"));
					loginUserDetails.setGender(checkJsonObjNull(customer, "gender"));
					loginUserDetails.setDob(checkJsonObjNull(customer, "dob"));
					loginUserDetails.setOptIn1(checkJsonObjNull(customer, "optIn1"));
					loginUserDetails.setOptIn2(checkJsonObjNull(customer, "optIn2"));
					session.setAttribute("userDetails", loginUserDetails);
					if(session.getAttribute("chooseCampaign") != null) {
						return "discover";
					}

					return "success";
				} else {
					String errMessage = response.get("errMsgs").toString();
					return errMessage.replaceAll("\"", "").replace("[", "")
							.replace("]", "");
				}
			} else {
				return jsonResponse.get("errMsgs").toString()
						.replaceAll("\"", "").replace("[", "").replace("]", "");
			}

		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
		
	}

	@RequestMapping(value = {"/forgotUser", "forget-user-name"}, method = RequestMethod.POST)
	@ResponseBody
	public String forgotUserName(
			@ModelAttribute("forgotUserName") UserDetails userDetails,
			HttpServletRequest servletRequest, Model model) {
		try {
			JSONObject params = new JSONObject();
			if(!(StringUtils.isEmpty(userDetails.getEmailAddress1()) && StringUtils.isEmpty(userDetails.getMobileNo1()))) {
				params.put("email", userDetails.getEmailAddress1());
				params.put("mobile", userDetails.getMobileNo1());
			}else {
				params.put("email", userDetails.getEmailAddress());
				params.put("mobile", userDetails.getMobileNo());
			}
			
			logger.info("USER_FORGOT_USERNAME Request " + JsonUtils.jsonPrint(params));
			JSONObject jsonResponse = restService.consumeApi(HttpMethod.POST,
					UserRestURIConstants.USER_FORGOT_USERNAME,
					COMMON_HEADERS, params);
			logger.info("USER_FORGOT_USERNAME Response " + JsonUtils.jsonPrint(jsonResponse));
			
			if (jsonResponse.get("errMsgs") == null) {
				return jsonResponse.get("userName").toString();
			} else {
				return jsonResponse.get("errMsgs").toString();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "fail";
	}

	@RequestMapping(value = {"/{lang}/forgotUserName", "/{lang}/forgot-user-name"}, method = RequestMethod.GET)
	public String forgotUserNameFields(HttpServletRequest req) {
		return UserRestURIConstants.getSitePath(req) + "forgot-username";
	}

	@RequestMapping(value = {"/forgotUserPassword", "/forgot-password", "/forgotPassword"}, method = RequestMethod.POST)
	@ResponseBody
	public String forgotPassword(
			@ModelAttribute("forgotUserName") UserDetails userDetails,
			HttpServletRequest servletRequest, Model model) {
		try {
			JSONObject params = new JSONObject();
			params.put("userName", userDetails.getUserName());
			params.put("email", userDetails.getEmailAddress());
			params.put("mobile", userDetails.getMobileNo());
			
			logger.info("USER_FORGOT_PASSWORD Request " + JsonUtils.jsonPrint(params));
			JSONObject jsonResponse = restService.consumeApi(HttpMethod.POST,
					UserRestURIConstants.USER_FORGOT_PASSWORD,
					COMMON_HEADERS, params);
			logger.info("USER_FORGOT_PASSWORD Response " + JsonUtils.jsonPrint(jsonResponse));
			
            if (jsonResponse.get("errMsgs") == null) {
                return "success";
            }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "fail";
	}

	@RequestMapping(value = {"/{lang}/forgotPassword", "/{lang}/forgot-password"}, method = RequestMethod.GET)
	public String forgotUserPasswordFields(HttpServletRequest req) {
		return UserRestURIConstants.getSitePath(req) + "forgot-password";
	}

	
	public String checkJsonObjNull(JSONObject obj, String checkByStr) {
		if (obj.get(checkByStr) != null) {
			return obj.get(checkByStr).toString().trim();
		} else {
			return "";
		}
	}

	@RequestMapping(value = {"/AGODA", "/agoda", "/Agoda"}, method = RequestMethod.GET)
	public String agodaRedirect(Model model, HttpServletRequest request) {
		return UserRestURIConstants.getSitePath(request)+ "agoda_redirect";
	}
	
	@RequestMapping(value = {"/{lang}/offers"}, method = RequestMethod.GET)
	public String offers(Model model, HttpServletRequest request) {
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		
		String pageTitle = WebServiceUtils.getPageTitle("page.offers", UserRestURIConstants.getLanaguage(request));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.offers", UserRestURIConstants.getLanaguage(request));
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
		
		return UserRestURIConstants.getSitePath(request)+ "partner";
	}
	
	@RequestMapping(value = {"/{lang}/become-our-partner"}, method = RequestMethod.GET)
	public String partner(Model model, HttpServletRequest request) {
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(request);
		
		String pageTitle = WebServiceUtils.getPageTitle("page.become.partner", UserRestURIConstants.getLanaguage(request));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.become.partner", UserRestURIConstants.getLanaguage(request));
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
		
		return UserRestURIConstants.getSitePath(request)+ "become-partner";
	}

	@RequestMapping(value = {"/{lang}/faq"}, method = RequestMethod.GET)
	public String faq(Model model, HttpServletRequest req) {	
		UserRestURIConstants urc = new UserRestURIConstants();
		urc.updateLanguage(req);
		
		String pageTitle = WebServiceUtils.getPageTitle("page.faq", UserRestURIConstants.getLanaguage(req));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.faq", UserRestURIConstants.getLanaguage(req));
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
		
		String str=  UserRestURIConstants.getSitePath(req)+ "faq";	
		return UserRestURIConstants.getSitePath(req)+ "faq";
	}
}
