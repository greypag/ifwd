package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.model.PurchaseHistory;
import com.ifwd.fwdhk.model.UserDetails;
import com.ifwd.fwdhk.model.UserLogin;
import com.ifwd.fwdhk.util.StringHelper;
import com.ifwd.fwdhk.util.WebServiceUtils;

@Controller
@SuppressWarnings("unchecked")
public class UserController {
	
	@Autowired
	RestServiceDao restService;

	@RequestMapping(value = "/userLogout", method = RequestMethod.GET)
	public String logout(HttpServletRequest servletRequest) {
		System.out.println("in logout");
		//HttpSession session = servletRequest.getSession();
		//session.invalidate();
		String lang = UserRestURIConstants.getLanaguage(servletRequest);
		HttpSession session = servletRequest.getSession(false);
		if (session!=null)
			{
			session.invalidate();
			}
		session = servletRequest.getSession(true);
		session.setAttribute("language", lang);
		//return "../.."+ UserRestURIConstants.checkLangSetPage(servletRequest)+ "index";
		String dir = UserRestURIConstants.getSitePath(servletRequest);
		//return "home";
		return "../jsp/" + dir + "/index";
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
				
				JSONObject response = restService.consumeApi(HttpMethod.POST,
						UserRestURIConstants.USER_LOGIN, COMMON_HEADERS,
						params);
				System.out.println(response);

				// check by error message is null then valid response
				if (response.get("errMsgs") == null && response != null) {
					/*System.out.println("session set"
							+ response.get("token").toString());*/
					HttpSession session = servletRequest.getSession(true);
					session.setAttribute("authenticate", "true");
					session.setAttribute("token", response.get("token")
							.toString());
					session.setAttribute("username", userLogin.getUserName());
					System.out.println("language in sessin" + UserRestURIConstants.getLanaguage(servletRequest));
					JSONObject customer = (JSONObject) response.get("customer");
					session.setAttribute("emailAddress",
							checkJsonObjNull(customer, "email"));
					session.setAttribute("referralCode",
							StringHelper.emptyIfNull(checkJsonObjNull(customer, "referralCode")));
					session.setAttribute("myReferralCode",
							checkJsonObjNull(customer, "referralCode"));

					UserDetails userDetails = new UserDetails();
					userDetails.setToken(checkJsonObjNull(response, "token"));
					userDetails.setFullName(checkJsonObjNull(customer, "name"));
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
				} else {
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
	@RequestMapping(value = "/getAccByUsernaneAndPassword", method = RequestMethod.GET)
	public ModelAndView getAccountDetailsByUsernameAndPassoword(
			HttpServletRequest servletRequest, Model model) {
		try {
			HttpSession session = servletRequest.getSession(false);
			String tokenInSession = session.getAttribute("token").toString();
			String usernameInSession = session.getAttribute("username")
					.toString();

			UserDetails userDetails = (UserDetails) session
					.getAttribute("userDetails");
			userDetails.setFullName(userDetails.getFullName());
			userDetails.setEmailAddress(userDetails.getEmailAddress());
			userDetails.setMobileNo(userDetails.getMobileNo());
			userDetails.setUserName(userDetails.getUserName());
			model.addAttribute(userDetails);

			/* Purchase History */
			if (!tokenInSession.isEmpty() && !usernameInSession.isEmpty()) {

				HashMap<String, String> header = new HashMap<String, String>(
						COMMON_HEADERS);
				header.put("userName", usernameInSession);
				header.put("token", tokenInSession);

				/*
				 * if(restService.validateToken(usernameInSession,
				 * tokenInSession)){
				 */

				JSONObject jsonUPHResponse = restService.consumeApi(
						HttpMethod.GET,
						UserRestURIConstants.USER_PURCHASE_POLICY_HISTORY,
						header, null);

				/*
				 * 
				 * {"policies":
				 * [{"amount":0.0,"policyNumber":"74F000010","submissionDate"
				 * :"2015-03-07 13:57:57", "planCode":"Flight"},
				 */

				if (jsonUPHResponse.get("errMsgs") == null) {
					JSONArray jsonArray = (JSONArray) jsonUPHResponse
							.get("policies");
					System.out.println("purchase history" + jsonArray);
					Iterator<?> itr = jsonArray.iterator();
					ArrayList al = new ArrayList();
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

					servletRequest.setAttribute("al", al);
					return new ModelAndView(UserRestURIConstants.getSitePath(servletRequest)+"useraccount");
//					return new ModelAndView(UserRestURIConstants.checkLangSetPage(servletRequest)+"useraccount");
					/*
					 * } else{ return new
					 * ModelAndView("useraccount","messageFromCtrl"
					 * ,"Please Login Session timeout"); }
					 */
				}
			}
			return new ModelAndView(UserRestURIConstants.getSitePath(servletRequest)+ "useraccount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("");

	}

	@RequestMapping(value = {"/joinus", "/join-us"}, method = RequestMethod.GET)
	public String signup(Model model, HttpServletRequest req) {
		/* UserDetails userDetails = new UserDetails(); */
		UserDetails userDetails = new UserDetails();
		model.addAttribute("userDetails", userDetails);
		return UserRestURIConstants.getSitePath(req)+ "joinus";
//		return UserRestURIConstants.checkLangSetPage(req)+ "joinus";
	}

	@RequestMapping(value = "/useraccount", method = RequestMethod.GET)
	public String userAccount(@ModelAttribute("userLogin") UserLogin userLogin,
			BindingResult result, HttpServletRequest req, Model model) {

		return "useraccount";
	}

	@RequestMapping(value = {"/joinus", "/join-us"}, method = RequestMethod.POST)
	@ResponseBody
	public String registerUser(
			@ModelAttribute("userDetails") UserDetails userDetails,
			HttpServletRequest servletRequest, Model model) {
		HttpSession session = servletRequest.getSession(false);

		try {
			
			JSONObject params = new JSONObject();
			params.put("userName", userDetails.getUserName());
			params.put("mobile", userDetails.getMobileNo());
			params.put("password", userDetails.getPassword());
			params.put("email", userDetails.getEmailAddress());
			params.put("name", userDetails.getFullName());
			System.out.println(params);
			JSONObject jsonResponse = restService.consumeApi(HttpMethod.PUT,
					UserRestURIConstants.USER_JOIN_US,
					COMMON_HEADERS, params);
			if (jsonResponse.get("errMsgs") == null) {
				UserLogin userLogin = new UserLogin();
				userLogin.setUserName(userDetails.getUserName());
				userLogin.setPassword(userDetails.getPassword());
				params = new JSONObject();
				params.put("userName", userLogin.getUserName());
				params.put("password", userLogin.getPassword());
				
				JSONObject response = restService.consumeApi(HttpMethod.POST,
						UserRestURIConstants.USER_LOGIN, COMMON_HEADERS,
						params);
				
				if (response.get("errMsgs") == null && response != null) {
					/*System.out.println("session set"
							+ response.get("token").toString());*/
					session.setAttribute("authenticate", "true");
					session.setAttribute("token", response.get("token")
							.toString());
					session.setAttribute("username", userLogin.getUserName());
					System.out.println("language in sessin" + session.getAttribute("language"));
					JSONObject customer = (JSONObject) response.get("customer");
					session.setAttribute("emailAddress",
							checkJsonObjNull(customer, "email"));
					session.setAttribute("referralCode",
							StringHelper.emptyIfNull(checkJsonObjNull(customer, "referralCode")));
					session.setAttribute("myReferralCode",
							checkJsonObjNull(customer, "referralCode"));

					UserDetails loginUserDetails = new UserDetails();
					loginUserDetails.setToken(checkJsonObjNull(response, "token"));
					loginUserDetails.setFullName(checkJsonObjNull(customer, "name"));
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
			params.put("email", userDetails.getEmailAddress());
			params.put("mobile", userDetails.getMobileNo());
			JSONObject jsonResponse = restService.consumeApi(HttpMethod.POST,
					UserRestURIConstants.USER_FORGOT_USERNAME,
					COMMON_HEADERS, params);
			/* {"errMsgs":null,"userName":"eCommUser89"} */
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

	@RequestMapping(value = {"/forgotUserName", "/forgot-user-name"}, method = RequestMethod.GET)
	public String forgotUserNameFields(HttpServletRequest req) {
		//return UserRestURIConstants.checkLangSetPage(req) + "forgot-username";
		return UserRestURIConstants.getSitePath(req) + "forgot-username";
	}

	@RequestMapping(value = {"/forgotUserPassword", "/forgot-password"}, method = RequestMethod.POST)
	@ResponseBody
	public String forgotPassword(
			@ModelAttribute("forgotUserName") UserDetails userDetails,
			HttpServletRequest servletRequest, Model model) {
		try {
			JSONObject params = new JSONObject();
			params.put("userName", userDetails.getUserName());
			params.put("email", userDetails.getEmailAddress());
			params.put("mobile", userDetails.getMobileNo());
			JSONObject jsonResponse = restService.consumeApi(HttpMethod.POST,
					UserRestURIConstants.USER_FORGOT_PASSWORD,
					COMMON_HEADERS, params);
			/* {"errMsgs":null,"userName":"eCommUser89"} */
			if (jsonResponse.get("errMsgs") == null) {
				return "success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "fail";
	}

	@RequestMapping(value = {"/forgotPassword", "/forgot-password"}, method = RequestMethod.GET)
	public String forgotUserPasswordFields(HttpServletRequest req) {
		//return UserRestURIConstants.checkLangSetPage(req) + "forgot-password";
		return UserRestURIConstants.getSitePath(req) + "forgot-password";
		
	}

	@RequestMapping(value = "/indexPage", method = RequestMethod.GET)
	public String indexPage(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.setAttribute("language", "EN");
		//String dir = UserRestURIConstants.checkLangSetPage(req);
		String dir = UserRestURIConstants.getSitePath(req);
		
		if (session.getAttribute("authenticate") != null) {
			if (session.getAttribute("authenticate").toString()
					.equalsIgnoreCase("direct")) {
				session.invalidate();
			}
		}
		return "../jsp" + dir + "index";
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String homePage(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession(true);
		String pageTitle = WebServiceUtils.getPageTitle("page.index", UserRestURIConstants.getLanaguage(req));
		String pageMetaDataDescription = WebServiceUtils.getPageTitle("meta.index", UserRestURIConstants.getLanaguage(req));

		String ogTitle = WebServiceUtils.getPageTitle("index.og.title", UserRestURIConstants.getLanaguage(req));
		String ogType = WebServiceUtils.getPageTitle("index.og.type", UserRestURIConstants.getLanaguage(req));
		String ogUrl = WebServiceUtils.getPageTitle("index.og.url", UserRestURIConstants.getLanaguage(req));
		String ogImage = WebServiceUtils.getPageTitle("index.og.image", UserRestURIConstants.getLanaguage(req));
		String ogDescription = WebServiceUtils.getPageTitle("index.og.description", UserRestURIConstants.getLanaguage(req));

		
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("pageMetaDataDescription", pageMetaDataDescription);
		
		model.addAttribute("ogTitle", ogTitle);
		model.addAttribute("ogType", ogType);
		model.addAttribute("ogUrl", ogUrl);
		model.addAttribute("ogImage", ogImage);
		model.addAttribute("ogDescription", ogDescription);
		String lang = "CN";
//		session.setAttribute("language", lang);
//		// default locale
//		session.setAttribute("uiLocale", "zh-HK");
//		

		
		String dir = UserRestURIConstants.getSitePath(req);
		
//		session.setAttribute("language", "EN");
		return "../jsp/" + dir + "/index";
	}

	public String checkJsonObjNull(JSONObject obj, String checkByStr) {
		if (obj.get(checkByStr) != null) {
			return obj.get(checkByStr).toString();
		} else {
			return "";
		}
	}

}
