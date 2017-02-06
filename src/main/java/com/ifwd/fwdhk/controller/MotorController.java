package com.ifwd.fwdhk.controller;

import static org.apache.commons.lang3.StringUtils.replace;

import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ifwd.fwdhk.util.HeaderUtil;
import com.ifwd.fwdhk.util.MotorPageFlowControl;

@Controller
public class MotorController extends BaseController{
	
	private final static Logger logger = LoggerFactory.getLogger(MotorController.class);
	
	@Autowired
	private HeaderUtil headerUtil;
	@Autowired
	private MotorCareController motorCareController;
	
	private UserRestURIConstants urc;
	
	private static String INVALID_INPUT = "##INVALID_INPUT_XSS##";
	
	@RequestMapping(value = {"/{lang}/motor-insurance"})
	public ModelAndView GetLanding(Model model, HttpServletRequest request) throws Exception{
		handleXssInputThurPages(request);
		handleLangFromPath(request);
		return MotorPageFlowControl.pageFlow("", model, request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_LANDING);
	}
	
	@RequestMapping(value = {"/{lang}/motor-insurance/get-quote"})
	public ModelAndView getLSDLogin(Model model, HttpServletRequest request) throws Exception{
		handleXssInputThurPages(request);
		handleLangFromPath(request);
		return MotorPageFlowControl.pageFlow("",model,request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_GET_QUOTE);
	}
	
	@RequestMapping(value = {"/{lang}/motor-insurance/third-party-quote"})
	public ModelAndView getPlanThird(Model model, HttpServletRequest request) throws Exception{
		handleXssInputThurPages(request);
		handleLangFromPath(request);
		return MotorPageFlowControl.pageFlow("", model, request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_PLAN_THIRD);
	}
	
	@RequestMapping(value = {"/{lang}/motor-insurance/comprehensive-quote"})
	public ModelAndView getPlanComp(Model model, HttpServletRequest request) throws Exception{
		handleLangFromPath(request);
		return MotorPageFlowControl.pageFlow("", model, request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_PLAN_COMP);
	}
	
	@RequestMapping(value = {"/{lang}/motor-insurance/rider-options"})
	public ModelAndView getQuickQuote(Model model, HttpServletRequest request) throws Exception{
		handleXssInputThurPages(request);
		handleLangFromPath(request);
		return MotorPageFlowControl.pageFlow("", model, request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_QUICK_QUOTE);
	}
	
	@RequestMapping(value = {"/{lang}/motor-insurance/car-details"})
	public ModelAndView cardetails(Model model, HttpServletRequest request) throws Exception{
		handleXssInputThurPages(request);
		handleLangFromPath(request);
		return MotorPageFlowControl.pageFlow("", model, request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_CAR_DETAILS);
	}
	
	@RequestMapping(value = {"/{lang}/motor-insurance/drivers-details"})
	public ModelAndView driversdetails(Model model, HttpServletRequest request) throws Exception{
		handleXssInputThurPages(request);
		handleLangFromPath(request);
		return MotorPageFlowControl.pageFlow("", model, request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_DRIVERS_DETAILS);
	}

	@RequestMapping(value = {"/{lang}/motor-insurance/policy-details"})
	public ModelAndView policydetails(Model model, HttpServletRequest request) throws Exception{
		handleXssInputThurPages(request);
		handleLangFromPath(request);
		return MotorPageFlowControl.pageFlow("", model, request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_POLICY_DETAILS);
	}
	
	@RequestMapping(value = {"/{lang}/motor-insurance/declarations"})
	public ModelAndView declarations(Model model, HttpServletRequest request) throws Exception{
		handleXssInputThurPages(request);
		handleLangFromPath(request);
		return MotorPageFlowControl.pageFlow("", model, request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_DECLARATIONS);
	}
	
	@RequestMapping(value = {"/{lang}/motor-insurance/application-summary"})
	public ModelAndView applicationsummary(Model model, HttpServletRequest request) throws Exception{
		handleXssInputThurPages(request);		
		handleLangFromPath(request);
		
		return MotorPageFlowControl.pageFlow("", model, request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_APPLICATION_SUMMARY);
	}
	
	@RequestMapping(value = {"/{lang}/motor-insurance/confirmation"})
	public ModelAndView confirmation(Model model, HttpServletRequest request) throws Exception{
		handleXssInputThurPages(request);
		handleLangFromPath(request);
		return MotorPageFlowControl.pageFlow("", model, request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_CONFIRMATION);
	}
	
	@RequestMapping(value = {"/{lang}/motor-insurance/document-upload"})
	public ModelAndView documentupload(Model model, HttpServletRequest request) throws Exception{
		handleXssInputThurPages(request);
		handleLangFromPath(request);
		return MotorPageFlowControl.pageFlow("", model, request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_DOCUMENT_UPLOAD);
	}
	
	@RequestMapping(value = {"/{lang}/motor-insurance/document-upload-confirmation"})
	public ModelAndView documentuploadconfirmation(Model model, HttpServletRequest request) throws Exception{
		handleXssInputThurPages(request);
		handleLangFromPath(request);
		return MotorPageFlowControl.pageFlow("", model, request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_DOCUMENT_UPLOAD_CONFIRMATION);
	}
	
	@RequestMapping(value = {"/{lang}/motor-insurance/document-upload-later"})
	public ModelAndView documentuploadlater(Model model, HttpServletRequest request) throws Exception{
		handleXssInputThurPages(request);
		handleLangFromPath(request);
		return MotorPageFlowControl.pageFlow("", model, request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_DOCUMENT_UPLOAD_LATER);
	}
	
	@RequestMapping(value = {"/{lang}/motor-insurance/document-upload-later-confirmation"})
	public ModelAndView documentuploadlaterconfirmation(Model model, HttpServletRequest request) throws Exception{
		handleXssInputThurPages(request);
		handleLangFromPath(request);
		return MotorPageFlowControl.pageFlow("", model, request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_DOCUMENT_UPLOAD_LATER_CONFIRMATION);
	}
	
	@RequestMapping(value = {"/{lang}/motor-insurance/start-upload-later-check"})
	public ModelAndView documentuploadlatercheck(Model model, HttpServletRequest request) throws Exception{
		handleXssInputThurPages(request);
		handleLangFromPath(request);
		return MotorPageFlowControl.pageFlow("", model, request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_DOCUMENT_UPLOAD_LATER_CHECK);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = {"/{lang}/motor-insurance/payment-result"})
	public ModelAndView paymentResult(Model model, HttpServletRequest request, RedirectAttributes ra) throws Exception{
		handleXssInputThurPages(request);
		String methodName = "paymentResult";
		handleLangFromPath(request);
			
		ModelAndView passView = new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/motor-insurance/confirmation");
		ModelAndView failView = new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/motor-insurance/application-summary?paymentGatewayFlag=1&refNum=" + request.getParameter("refNum"));
		
		try {
			JSONObject responseJsonObj = new JSONObject();
			JSONObject finalResponseJsonObj = new JSONObject();
			JSONObject jsonInput = new JSONObject();
			logger.info( methodName +  " (Key):" + request.getParameter("refNum"));
			
			// Check Session exist or not (security issue)
			HttpSession session = request.getSession(false);
			if (session == null) {
				logger.info( methodName + " no session data found");
				return failView;
			} else {
				if (session.getAttribute(request.getParameter("refNum")) == null) {
					logger.info( methodName + " no valid session data found");
					return failView;
				}
			}
			
			// Check payment result when passed security check
			//String url = UserRestURIConstants.MOTOR_CARE_PAYMENT_RESULT_GET + "?refNum=" + MotorCareController.urlEncodeInputSpace("szBD3e/b/WiRrcsO+6/pPQ==");
			String url = UserRestURIConstants.MOTOR_CARE_PAYMENT_RESULT_GET + "?refNum=" + MotorCareController.urlEncodeInputSpace(request.getParameter("refNum"));
			responseJsonObj = restService.consumeApi(HttpMethod.GET, url, headerUtil.getHeader(request), jsonInput);
			
			if (responseJsonObj.get("gatewayResult") != null && StringUtils.equals("OK", (String)responseJsonObj.get("gatewayResult"))) {				
				if (responseJsonObj.get("motorCareDetails") != null ) {
					
					// Finalize the record when ok
					url = UserRestURIConstants.MOTOR_CARE_PAYMENT_FINALIZE_POST;
					finalResponseJsonObj = restService.consumeApi(HttpMethod.POST, url, headerUtil.getHeader(request), (JSONObject)responseJsonObj.get("motorCareDetails"));
					
					if (finalResponseJsonObj.get("errMsgs") == null){
						if (finalResponseJsonObj.get("motorCareDetails") != null ) {
							// Set motorCareDetail to page's EL var
							ra.addFlashAttribute("quote", (JSONObject)finalResponseJsonObj.get("motorCareDetails"));
							JSONObject mcd = (JSONObject)finalResponseJsonObj.get("motorCareDetails");
							// Plain text
							mcd.remove("refNumber");
							// Encrypted ref
							mcd.put("refNumber", request.getParameter("refNum"));
							
							// Send doc upload later email
							motorCareController.sendEmailByType(request, "UPD_LATER", mcd);
						}
					} else {
						return failView;
					}
				}
				//return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/motor-insurance/confirmation");
				//return MotorPageFlowControl.pageFlow("", model, request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_CONFIRMATION);
			} else {
				return failView;
			}
			
		} catch (Exception e) {
			return failView;
			//return MotorPageFlowControl.pageFlow("", model, request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_CONFIRMATION);
		}
		
		//logger.info("1:" + request.getParameter("refNum"));
		return passView;
		//return new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/motor-insurance/application-summary?paymentGatewayFlag=1&refNum=" + request.getParameter("refNum"));
		//return MotorPageFlowControl.pageFlow("", model, request, UserRestURIConstants.PAGE_PROPERTIES_MOTOR_CONFIRMATION);
	}
	
	@RequestMapping(value = {"/{lang}/motor-insurance/start-upload-later"})
	public ModelAndView uploadDocLater(Model model, HttpServletRequest request, RedirectAttributes ra) throws Exception{
		handleXssInputThurPages(request);
		String methodName = "uploadDocLater";
		handleLangFromPath(request);
			
		ModelAndView passView = new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/motor-insurance/start-upload-later-check");
		ModelAndView failView = new ModelAndView("redirect:/" + UserRestURIConstants.getLanaguage(request) + "/motor-insurance/");
		
		try {
			JSONObject responseJsonObj = new JSONObject();
			JSONObject jsonInput = new JSONObject();
			logger.info( methodName +  " (refNum):" + request.getParameter("refNum"));
			
			String url = replace(UserRestURIConstants.MOTOR_CARE_FILE_UPLOAD_CHECK_GET,"{type}", "1");
			url = url + "?refNum=" + MotorCareController.urlEncodeInputSpace(request.getParameter("refNum"));
			
			responseJsonObj = restService.consumeApi(HttpMethod.GET, url, headerUtil.getHeader(request), jsonInput);
			
			if (responseJsonObj.get("result") != null && StringUtils.equals("OK", (String)responseJsonObj.get("result"))) {				
				ra.addFlashAttribute("refNumber", request.getParameter("refNum"));
			} else {
				logger.info( methodName +  " Cannot pass upload later checking (refNum):" + request.getParameter("refNum"));
				return failView;
			}
		} catch (Exception e) {
			return failView;
		}
		return passView;
	}
	
	public static String getUrl(String page) {
		return UserRestURIConstants.SERVICE_URL + "/motor-insurance/" + page;
	}
	
	private void handleLangFromPath (HttpServletRequest request) {
		urc = new UserRestURIConstants();
		urc.updateLanguage(request);
	}
	
	private static Pattern[] patterns = new Pattern[]{
		// Script fragments
        Pattern.compile("<script>(.*?)</script>", Pattern.CASE_INSENSITIVE),
        // src='...'
        Pattern.compile("src[\r\n]*=[\r\n]*\\\'(.*?)\\\'", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
        Pattern.compile("src[\r\n]*=[\r\n]*\\\"(.*?)\\\"", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
        // lonely script tags
        Pattern.compile("</script>", Pattern.CASE_INSENSITIVE),
        Pattern.compile("<script(.*?)>", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
        // eval(...)
        Pattern.compile("eval\\((.*?)\\)", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
        // expression(...)
        Pattern.compile("expression\\((.*?)\\)", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
        // javascript:...
        Pattern.compile("javascript:", Pattern.CASE_INSENSITIVE),
        // vbscript:...
        Pattern.compile("vbscript:", Pattern.CASE_INSENSITIVE),
        // onload(...)=...
        Pattern.compile("onload(.*?)=", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL)
    };
    
    private boolean isXSSRelated(String value) {
        if (value != null) {        
            // Avoid null characters
            value = value.replaceAll("", "");

            // Remove all sections that match a pattern           
            for (Pattern scriptPattern : patterns){
                value = scriptPattern.matcher(value).replaceAll(INVALID_INPUT);
            }
            
            if (StringUtils.contains(value, INVALID_INPUT)) {
            	return true;
            }
        }
        return false;
    }
    
    private void handleXssInputThurPages (HttpServletRequest request) throws Exception {
    	if (request.getParameterMap().containsKey("data") && request.getParameter("data") != null) {
    		if (isXSSRelated((String)(StringEscapeUtils.unescapeHtml(request.getParameter("data"))))) {
    			throw new Exception("Input data is invalid"); 
    		}
    	}
    }
    
    

}