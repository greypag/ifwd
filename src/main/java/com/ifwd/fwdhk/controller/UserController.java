package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

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

	@RequestMapping(value = "/verifyRecaptcha", method = RequestMethod.POST)
	@ResponseBody
	public String verifyCaptcha(HttpServletRequest request) 
	{	
		boolean result = ValidationUtils.verifyGoogleRecaptcha(request.getParameter("recaptchaValue"));
		logger.debug("Google Recaptcha Result: "+result);
		return result ? "success": "fail";
	}
	
	@RequestMapping(value = "/userLogout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest servletRequest) 
	{	

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
	public String login(@ModelAttribute("userLogin") UserLogin userLogin,
			HttpServletRequest servletRequest) {
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
								firstName = strArray[0];
							}
							else{
								lastName += strArray[i]+" ";
							}
						}
						userDetails.setFirstName(firstName);
						userDetails.setLastName(lastName);
					}
					else{
						userDetails.setFirstName(userDetails.getFullName());
					}
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

					return "success";
				}else if (response.isEmpty()) {
					return "fail";
				}else {
					String errMessage = response.get("errMsgs").toString();
					return errMessage.replaceAll("\"", "").replace("[", "")
							.replace("]", "");
				}
			} else {
				return "fail";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "fail";

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
					List<PurchaseHistoryPolicies> policiesGI = new ArrayList<PurchaseHistoryPolicies>();
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
					model.addAttribute("policiesLife", policiesLife);
				}
				/* getAccountBalance 
				if (!tokenInSession.isEmpty() && !usernameInSession.isEmpty()) {
					HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
					header.put("userName", usernameInSession);
					header.put("token", tokenInSession);

					AccountBalanceResponse accountBalance = connector.getAccountBalance(header);
					model.addAttribute("accountBalance", accountBalance);
				}*/
				
				/* Purchase History 
				ArrayList al = new ArrayList();
				if (!tokenInSession.isEmpty() && !usernameInSession.isEmpty()) {
					HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
					header.put("userName", usernameInSession);
					header.put("token", tokenInSession);

					JSONObject jsonUPHResponse = restService.consumeApi(
							HttpMethod.GET,
							UserRestURIConstants.USER_PURCHASE_POLICY_HISTORY,
							header, null);
					logger.info("USER_PURCHASE_POLICY_HISTORY Response " + JsonUtils.jsonPrint(jsonUPHResponse));

					if (jsonUPHResponse.get("errMsgs") == null) {
						JSONArray jsonArray = (JSONArray) jsonUPHResponse.get("policies");
						Iterator<?> itr = jsonArray.iterator();
						while (itr.hasNext()) {
							JSONObject jsonObjHistory = (JSONObject) itr.next();
							PurchaseHistory purchaseHistory = new PurchaseHistory();
							purchaseHistory.setAmount(checkJsonObjNull(
									jsonObjHistory, "amount"));
							purchaseHistory.setPolicyNumber(checkJsonObjNull(
									jsonObjHistory, "policyNumber"));
							purchaseHistory.setSubmissionDate(checkJsonObjNull(
									jsonObjHistory, "submissionDate"));
							purchaseHistory.setPlanCode(checkJsonObjNull(
									jsonObjHistory, "planCode"));
							al.add(purchaseHistory);
						}
					}
				}

				request.setAttribute("al", al);*/
				return new ModelAndView(UserRestURIConstants.getSitePath(request)+ "useraccount");
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
								firstName = strArray[0];
							}
							else{
								lastName += strArray[i]+" ";
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
