package com.ifwd.fwdhk.services.impl;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.connector.ECommWsConnector;
import com.ifwd.fwdhk.connector.response.BaseResponse;
import com.ifwd.fwdhk.connector.response.savie.ServiceCentreResponse;
import com.ifwd.fwdhk.connector.response.savie.ServiceCentreResult;
import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.services.EvergreenService;
import com.ifwd.fwdhk.util.ClientBrowserUtil;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.HeaderUtil;
import com.ifwd.fwdhk.util.InitApplicationMessage;
import com.ifwd.fwdhk.util.WebServiceUtils;

@Service
public class EvergreenServiceImpl implements EvergreenService {
	private final static Logger logger = LoggerFactory.getLogger(EvergreenServiceImpl.class);
	
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
	
	/**
	 * 服务中心提交
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void upsertAppointment(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/json;charset=utf-8");
		HttpSession session = request.getSession();
		String csCenter = request.getParameter("csCenter");
		String perferredDate = request.getParameter("perferredDate");
		String perferredTime = request.getParameter("perferredTime");
		String planCode = "savie";
		String policyNumber = "";
		String applicationNumber = "";
		String userName = (String)session.getAttribute("username");
		String status = "Active";
		String remarks = "";
		String accessCode = (String)request.getSession().getAttribute("accessCode");
		String servicingAgent = "";
		
		String applicationUrl = UserRestURIConstants.SERVICE_URL + "/savie/application";
		String makeUrl = UserRestURIConstants.SERVICE_URL + "/appointment/make";
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc")) {
			lang = "CN";
		}
		
		
		HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
		header.put("userName", "*DIRECTGI");
		header.put("token", commonUtils.getToken("reload"));
		header.put("language", WebServiceUtils.transformLanaguage(lang));
		
		org.json.simple.JSONObject parameters = new org.json.simple.JSONObject();
		parameters.put("planCode", planCode);
		parameters.put("accessCode", accessCode);
		org.json.simple.JSONObject appJsonObj = restService.consumeApi(HttpMethod.PUT, applicationUrl, header, parameters);
		applicationNumber = (String)appJsonObj.get("applicationNumber");
		session.setAttribute("applicationNumber", applicationNumber);
		
		if(appJsonObj != null) {
			String savieType = (String)session.getAttribute("savieType");
			if("SP".equals(savieType)) {
				planCode="SAVIE-SP";
			}else if("RP".equals(savieType)) {
				planCode="SAVIE-RP";
			}
			parameters = new org.json.simple.JSONObject();
			parameters.put("serviceCentreCode", csCenter);
			parameters.put("date", perferredDate);
			parameters.put("timeSlot", perferredTime);
			parameters.put("planCode", planCode);
			parameters.put("policyNumber", policyNumber);
			parameters.put("applicationNumber", applicationNumber);
			parameters.put("userName", userName);
			parameters.put("status", status);
			parameters.put("remarks", remarks);
			parameters.put("accessCode", accessCode);
			parameters.put("servicingAgent", servicingAgent);
			
			org.json.simple.JSONObject makeJsonObj = restService.consumeApi(HttpMethod.POST, makeUrl, header, parameters);
			
			response.setContentType("text/json;charset=utf-8");
			try {
				logger.info(makeJsonObj.toString());
				response.getWriter().print(makeJsonObj.toString());
			}catch(Exception e) {  
				e.printStackTrace();
				response.getWriter().print("application error!");
			}
		}else {
			response.getWriter().print("application error!");
		}
	}
	
	@Override
	public BaseResponse sendAppointmentAcknowledgeMail(HttpServletRequest request)throws ECOMMAPIException{
		BaseResponse br = null;
		try {
			String applicationNumber = (String) request.getSession().getAttribute("applicationNumber");
			String perferred_Date = (String) request.getParameter("perferredDate");
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
			Date date = sdf.parse(perferred_Date);
			SimpleDateFormat sdfC = new SimpleDateFormat("yyyy年MM月dd日",Locale.CHINESE); 
			String perferredDateC = sdfC.format(date);
			SimpleDateFormat sdfE = new SimpleDateFormat("dd MMM yyyy",Locale.US); 
			String perferredDateE = sdfE.format(date);
			String perferredTime = (String) request.getParameter("perferredTime");
			String csCenter = (String) request.getParameter("csCenter");
			ServiceCentreResult scrChi = new ServiceCentreResult();
			ServiceCentreResult scrEng = new ServiceCentreResult();
			
			
			if(null != csCenter){
				ServiceCentreResponse serviceCentreResponseChi;
				ServiceCentreResponse serviceCentreResponseEng;
				
				
				serviceCentreResponseChi = InitApplicationMessage.serviceCentreCN;
				
				serviceCentreResponseEng = InitApplicationMessage.serviceCentreEN;
				
				for(ServiceCentreResult entity : serviceCentreResponseChi.getServiceCentres()) {
					if(entity.getServiceCentreCode().equals(csCenter)) {
						scrChi = entity;
						
						break;
					}
				}
				for(ServiceCentreResult entity : serviceCentreResponseEng.getServiceCentres()) {
					if(entity.getServiceCentreCode().equals(csCenter)) {
						scrEng = entity;
						
						break;
					}
				}
			}
			
			final Map<String,String> header = headerUtil.getHeader(request);
			header.put("language", "ZH");
			String to = (String) request.getSession().getAttribute("emailAddress");
			logger.info("To Email:"+to);
			String serverUrl = request.getScheme()+"://"+request.getServerName()+request.getContextPath();
			if (request.getServerPort() != 80 && request.getServerPort() != 443)
			{
				serverUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
			}
			
			
//			String message1 = "<h2 style=\"font-family:'Microsoft JhengHei', Calibri, sans-serif;color:#FF8200;font-size:24px;background-color:#FFFFFF;\"></h2>"+
//                             "<h2 style=\"font-family:'Microsoft JhengHei', Calibri, sans-serif;color:#FF8200;font-size:24px;background-color:#FFFFFF;\">預約詳情</h2>"+
//                             "<div class=\"appointment-detail clearfix\" style=\"color:#333333;font-family:'Microsoft JhengHei', Calibri, sans-serif;font-size:16px;background-color:#FFFFFF;\">"+
//                             "日期 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span class=\"pull-left\">"+perferredDate+"</span></div>"+
//                             "<div class=\"appointment-detail clearfix\" style=\"color:#333333;font-family:'Microsoft JhengHei', Calibri, sans-serif;font-size:16px;background-color:#FFFFFF;\">"+
//	                         "時間 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<span class=\"pull-left\">"+perferredTime+"</span></div>"+
//                             "<div class=\"appointment-detail clearfix\" style=\"color:#333333;font-family:'Microsoft JhengHei', Calibri, sans-serif;font-size:16px;background-color:#FFFFFF;\">"+
//	                         "客戶服務中心 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span class=\"pull-left\">"+scr.getServiceCentreName()+"</span></div>"+
//                             "<div class=\"appointment-detail clearfix\" style=\"color:#333333;font-family:'Microsoft JhengHei', Calibri, sans-serif;font-size:16px;background-color:#FFFFFF;\">"+
//	                         "地址 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<span class=\"pull-left\">"+scr.getAddress()+"</span></div>"+
//                             "<div class=\"appointment-detail clearfix\" style=\"color:#333333;font-family:'Microsoft JhengHei', Calibri, sans-serif;font-size:16px;background-color:#FFFFFF;\">"+
//	                         "參考編號 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span class=\"pull-left\">"+applicationNumber+"</span></div>"+
//                             "<div class=\"appointment-detail clearfix\" style=\"color:#333333;font-family:'Microsoft JhengHei', Calibri, sans-serif;font-size:16px;background-color:#FFFFFF;\">"+
//	                         "電話號碼 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span class=\"pull-left\">"+scr.getPhone()+"</span></div>"+
//                             "<div class=\"appointment-detail clearfix\" style=\"color:#333333;font-family:'Microsoft JhengHei', Calibri, sans-serif;font-size:16px;background-color:#FFFFFF;\">"+
//	                         "辦公時間 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span class=\"pull-left\">"+scr.getOperationHours()+"</span></div>"+
//                             "<div class=\"appointment-detail clearfix\" style=\"color:#333333;font-family:'Microsoft JhengHei', Calibri, sans-serif;font-size:16px;background-color:#FFFFFF;\"><span class=\"pull-left\"></span></div>";
			
			String message = "";
			
			HttpSession session = request.getSession();
			if("SP".equals(session.getAttribute("savieType"))) {
				message = "<head>\r\n" + 
						  "  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n" + 
						  "  <title>自助息理財預約申請確認 | Savie Appointment Acknowledgement from FWD</title>\r\n" + 
						  "</head>\r\n" + 
						  "<body>\r\n" + 
						  "  <div marginwidth=\"0\" marginheight=\"0\" style=\"margin:0;padding:0;background-color:#f2f2f2;min-height:100%!important;width:100%!important\">\r\n" + 
						  "    <center>\r\n" + 
						  "      <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" height=\"100%\" width=\"100%\" style=\"border-collapse:collapse;margin:0;padding:0;background-color:#f2f2f2;height:100%!important;width:100%!important\">\r\n" + 
						  "        <tbody>\r\n" + 
						  "          <tr>\r\n" + 
						  "            <td align=\"center\" valign=\"top\" style=\"margin:0;padding:20px;border-top:0;height:100%!important;width:100%!important\">\r\n" + 
						  "              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;border:0\">\r\n" + 
						  "                <tbody>\r\n" + 
						  "                  <tr>\r\n" + 
						  "                    <td align=\"center\" valign=\"top\">\r\n" + 
						  "                      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;background-color:#ffffff;border-top:0;border-bottom:0\">\r\n" + 
						  "                        <tbody>\r\n" + 
						  "                          <tr>\r\n" + 
						  "                            <td valign=\"top\" style=\"padding-top:9px\">\r\n" + 
						  "                              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\r\n" + 
						  "                                <tbody>\r\n" + 
						  "                                  <tr>\r\n" + 
						  "                                    <td valign=\"top\">\r\n" + 
						  "                                      <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"266\" style=\"border-collapse:collapse\">\r\n" + 
						  "                                        <tbody>\r\n" + 
						  "                                          <tr>\r\n" + 
						  "                                            <td valign=\"top\" style=\"padding-top:9px;padding-left:18px;padding-bottom:9px;padding-right:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px;line-height:125%;text-align:left\">\r\n" + 
						  "                                              <a href=\"https://i.fwd.com.hk/tc/?utm_source=edm&amp;utm_medium=cpc&amp;utm_campaign=EDM%7CSA%7CP2%7CO2O&#43;Appointment&#43;Confirmation&amp;utm_content=logo\" style=\"word-wrap:break-word;color:#606060;font-weight:normal;text-decoration:underline\" target=\"_blank\"><img align=\"none\" src=\"https://i.fwd.com.hk/resources/images/savie-fwd-logo.jpg\" style=\"margin:0px;border:0;outline:none;text-decoration:none;min-height:auto!important\" class=\"CToWUd\"></a>\r\n" + 
						  "                                            </td>\r\n" + 
						  "                                          </tr>\r\n" + 
						  "                                        </tbody>\r\n" + 
						  "                                      </table>\r\n" + 
						  "                                      <table align=\"right\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"297\" style=\"border-collapse:collapse\">\r\n" + 
						  "                                        <tbody>\r\n" + 
						  "                                          <tr>\r\n" + 
						  "                                            <td valign=\"top\" style=\"padding-top:9px;padding-right:18px;padding-bottom:9px;padding-left:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px;line-height:125%;text-align:left\">\r\n" + 
						  "                                              <div style=\"text-align:right\"><br>\r\n" + 
						  "                                              </div>\r\n" + 
						  "                                            </td>\r\n" + 
						  "                                          </tr>\r\n" + 
						  "                                        </tbody>\r\n" + 
						  "                                      </table>\r\n" + 
						  "                                    </td>\r\n" + 
						  "                                  </tr>\r\n" + 
						  "                                </tbody>\r\n" + 
						  "                              </table>\r\n" + 
						  "                            </td>\r\n" + 
						  "                          </tr>\r\n" + 
						  "                        </tbody>\r\n" + 
						  "                      </table>\r\n" + 
						  "                    </td>\r\n" + 
						  "                  </tr>\r\n" + 
						  "                  <tr>\r\n" + 
						  "                    <td align=\"center\" valign=\"top\">\r\n" + 
						  "                      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;background-color:#ffffff;border-top:0;border-bottom:0\">\r\n" + 
						  "                        <tbody>\r\n" + 
						  "                          <tr>\r\n" + 
						  "                            <td valign=\"top\">\r\n" + 
						  "                              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\r\n" + 
						  "                                <tbody>\r\n" + 
						  "                                  <tr>\r\n" + 
						  "                                    <td valign=\"top\" style=\"padding:0px\">\r\n" + 
						  "                                      <table align=\"left\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n" + 
						  "                                        <tbody>\r\n" + 
						  "                                          <tr>\r\n" + 
						  "                                            <td valign=\"top\" style=\"padding-right:0px;padding-left:0px;padding-top:0;padding-bottom:0;text-align:center\">\r\n" + 
						  "                                              <img align=\"center\" alt=\"\" src=\"https://i.fwd.com.hk/resources/images/savie-regular/savie-regular_cn.png\" width=\"600\" style=\"max-width:600px;padding-bottom:0;display:inline!important;vertical-align:bottom;border:0;outline:none;text-decoration:none\" class=\"CToWUd a6T\" tabindex=\"0\">\r\n" + 
						  "                                              <div class=\"a6S\" dir=\"ltr\" style=\"opacity: 0.01; left: 572px; top: 311px;\">\r\n" + 
						  "                                                <div id=\":sw\" class=\"T-I J-J5-Ji aQv T-I-ax7 L3 a5q\" role=\"button\" tabindex=\"0\" aria-label=\"Download attachment \" data-tooltip-class=\"a1V\" data-tooltip=\"Download\">\r\n" + 
						  "                                                  <div class=\"aSK J-J5-Ji aYr\"></div>\r\n" + 
						  "                                                </div>\r\n" + 
						  "                                              </div>\r\n" + 
						  "                                            </td>\r\n" + 
						  "                                          </tr>\r\n" + 
						  "                                        </tbody>\r\n" + 
						  "                                      </table>\r\n" + 
						  "                                    </td>\r\n" + 
						  "                                  </tr>\r\n" + 
						  "                                </tbody>\r\n" + 
						  "                              </table>\r\n" + 
						  "                            </td>\r\n" + 
						  "                          </tr>\r\n" + 
						  "                        </tbody>\r\n" + 
						  "                      </table>\r\n" + 
						  "                    </td>\r\n" + 
						  "                  </tr>\r\n" + 
						  "                  <tr>\r\n" + 
						  "                    <td align=\"center\" valign=\"top\">\r\n" + 
						  "                      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;background-color:#ffffff;border-top:0;border-bottom:0\">\r\n" + 
						  "                        <tbody>\r\n" + 
						  "                          <tr>\r\n" + 
						  "                            <td valign=\"top\">\r\n" + 
						  "                              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\r\n" + 
						  "                                <tbody>\r\n" + 
						  "                                  <tr>\r\n" + 
						  "                                    <td valign=\"top\">\r\n" + 
						  "                                      <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse\">\r\n" + 
						  "                                        <tbody>\r\n" + 
						  "                                          <tr>\r\n" + 
						  "                                            <td valign=\"top\" style=\"padding:9px 18px;line-height:125%;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px;text-align:left\">\r\n" + 
						  "                                              <div style=\"text-align:center\">\r\n" + 
						  "                                                <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">您好，</span></span></p>\r\n" + 
						  "                                                <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">恭喜！您已完成自助息理財壽險計劃(「本計劃」) 的預約申請，煩請於預約時間帶備下列所需文件親臨客戶服務中心完成簡單的財務需要分析，以評估本計劃是否切合您的需要，而一經確定本計劃切合您所需，您便可立即於客戶服務中心投保。<br><br>預約詳情及所需文件如下:</p>\r\n" + 
						  "                                                <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>日期:  </strong></span><span style=\"color:#000000\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" + perferredDateC + "</span></span></span></span></p>\r\n" + 
						  "                                                <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>時間:  </strong></span><span style=\"color:#000000\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" + perferredTime + "</span></span></span></span></p>\r\n" + 
						  "                                                <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>客戶服務中心:  </strong></span><span style=\"color:#000000\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" + scrChi.getServiceCentreName() + "</span></span></span></span></p>\r\n" + 
						  "                                                <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>地址:  </strong></span><span style=\"color:#000000\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" + scrChi.getAddress() + "</span></span></span></span></p>\r\n" + 
						  "                                                <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>參考編號: </strong></span><span style=\"color:#000000\"><span style=\"line-height:125%;background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" + applicationNumber + "</span></span></span></span></p>\r\n" + 
						  "                                                <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>所需文件:</strong></span><br><span style=\"color:#000000\"><span style=\"line-height:125%;background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><ol style=\"text-align: left; font-size:13px; color:#000000;\"><li>香港身份證 <br>  <span style=\"line-height:125%;background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap;font-size:12px\">   (如您並非香港永久性居民，您必須出示香港身份證及護照作為證明。)</span><br><br></li><li>三個月內的<a style=\"color:#ff8c00\" href=\"https://i.fwd.com.hk/resources/policy-provisions-pdf/Savie_Address_Proof.pdf\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap;text-decoration:underline;\">有效住址證明</span></a><br><br></li><li><span style=\"text-decoration: underline;\">保費支付</span><br><br>一筆過保費：<br>您的支票/交通銀行FWD 富衛信用卡/銀行資料以便填寫自動轉賬授權書<br><br></li></ol></span></span></span></span></p>\r\n" + 
						  "                                                <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>付款方式:</strong></span><br><br><span style=\"color:#000000\"><span style=\"line-height:125%;background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">一筆過保費：<br>您的支票/交通銀行FWD 富衛信用卡/自動轉賬</span></span></span></span></p>\r\n" + 
						  "                                                <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>保費金額:</strong></span><br><br><span style=\"color:#000000\"><span style=\"line-height:125%;background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">本計劃的一筆過保費為港幣三萬元至四十萬元內。您可於投保當日因應財務需要分析及個人意願以作決定。</span></span></span></span></p>\r\n" +  
						  "                                                <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">如欲更改預約時段或客戶服務中心，請致電富衛24小時客戶服務熱線<span style=\"color:#ff8c00\"><span style=\"font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\">(852) 3123 3123</span></span>。</span></span>\r\n" + 
						  "                                                &nbsp;\r\n" + 
						  "                                                <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">Hi,</span></span></p>\r\n" + 
						  "                                                <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">Congratulations! You have completed the appointment application for Savie Insurance Plan (the \"Plan\"). Please visit our customer service centre at the scheduled time with the required documents as set out below to conduct a simple financial needs analysis (\"FNA\") to assess your suitability for the Plan. Once it is confirmed that Savie is right for you, you may begin the application process immediately at the customer service centre.<br><br>The appointment details are as follows:</p>\r\n" + 
						  "                                                <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>Date:  </strong></span><span style=\"color:#000000\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" + perferredDateE + "</span></span></span></span></p>\r\n" + 
						  "                                                <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>Time:  </strong></span><span style=\"color:#000000\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" + perferredTime + "</span></span></span></span></p>\r\n" + 
						  "                                                <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>Customer service centre:  </strong></span><span style=\"color:#000000\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" + scrEng.getServiceCentreName() + "</span></span></span></span></p>\r\n" + 
						  "                                                <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>Address:  </strong></span><span style=\"color:#000000\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" + scrEng.getAddress() + "</span></span></span></span></p>\r\n" + 
						  "                                                <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>Reference number:  </strong></span><span style=\"color:#000000\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" + applicationNumber + "</span></span></span></span></p>\r\n" + 
						  "                                                <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>Required documents:</strong></span><br><span style=\"color:#000000\"><span style=\"line-height:125%;background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><ol style=\"text-align: left; font-size:13px; color:#000000;\"><li>HKID card <br><span style=\"line-height:125%;background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap;font-size:12px\">   (If you are a non-permanent Hong Kong resident, you must present your HKID Card and your passport for verification.)</span><br><br></li><li><a style=\"color:#ff8c00\" href=\"https://i.fwd.com.hk/resources/policy-provisions-pdf/Savie_Address_Proof.pdf\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap;text-decoration:underline;\">A valid address proof</span></a> within the last 3 months*  <br><br></li><li><span style=\"text-decoration: underline;\">Premium Payment</span><br><br>The one-off payment:<br>Your personal cheque / Bank of Communications FWD Credit Card / Bank information for completing the direct debit authorization form<br><br></li></ol></span></span></span></span></p>\r\n" + 
						  "                                                <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>Payment methods: </strong></span><br><br><span style=\"color:#000000\"><span style=\"line-height:125%;background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">The one-off payment:<br>Your personal cheque / Bank of Communications FWD Credit Card / Direct debit </span></span></span></span></p>\r\n" + 
						  "                                                <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>Premium: </strong></span><br><br><span style=\"color:#000000\"><span style=\"line-height:125%;background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">The one-off payment of the Plan is between HK$30,000 and HK$400,000.\r\n" +  
						  "                                                You have the right to decide the premium amount based on the FNA results or at your discretion on the day of application.</span></span></span></span></p><br>\r\n" + 
						  "                                                <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">For questions regarding appointments, please contact our FWD 24 hours Customer Service Hotline at <span style=\"color:#ff8c00\"><span style=\"font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\">(852) 3123 3123</span></span>.</span></span>\r\n" + 
						  "                                                <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">此致</span></span><br><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">Yours sincerely,<br>Fanny<br><br>富衛人壽保險(百慕達)有限公司<br>FWD Life Insurance Company (Bermuda) Limited<br>www.fwd.com.hk</span></span>\r\n" + 
						  "                                                </p>\r\n" + 
						  "                                                &nbsp;\r\n" + 
						  "                                              </div>\r\n" + 
						  "                                            </td>\r\n" + 
						  "                                          </tr>\r\n" + 
						  "                                        </tbody>\r\n" + 
						  "                                      </table>\r\n" + 
						  "                                    </td>\r\n" + 
						  "                                  </tr>\r\n" + 
						  "                                </tbody>\r\n" + 
						  "                              </table>\r\n" + 
						  "                              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\r\n" + 
						  "                                <tbody>\r\n" + 
						  "                                  <tr>\r\n" + 
						  "                                    <td style=\"padding:18px\">\r\n" + 
						  "                                      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-top-width:1px;border-top-style:dotted;border-top-color:#999999;border-collapse:collapse\">\r\n" + 
						  "                                        <tbody>\r\n" + 
						  "                                          <tr>\r\n" + 
						  "                                            <td>\r\n" + 
						  "                                              <span></span>\r\n" + 
						  "                                            </td>\r\n" + 
						  "                                          </tr>\r\n" + 
						  "                                        </tbody>\r\n" + 
						  "                                      </table>\r\n" + 
						  "                                    </td>\r\n" + 
						  "                                  </tr>\r\n" + 
						  "                                </tbody>\r\n" + 
						  "                              </table>\r\n" + 
						  "                              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\r\n" + 
						  "                                <tbody>\r\n" + 
						  "                                  <tr>\r\n" + 
						  "                                    <td valign=\"top\">\r\n" + 
						  "                                      <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse\">\r\n" + 
						  "                                        <tbody>\r\n" + 
						  "                                          <tr>\r\n" + 
						  "                                            <td valign=\"top\" style=\"padding-top:9px;padding-right:18px;padding-bottom:9px;padding-left:18px;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px;line-height:150%;text-align:left\">\r\n" + 
						  "                                              <p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:0pt;text-align:center;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"color:#000000;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\">如有任何查詢，請致電富衛24小時客戶服務熱線</span><span style=\"color:#ff8c00\"><span style=\"font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\">(852) 3123 3123</span></span><span style=\"color:#000000;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\">或電郵至</span><span style=\"color:#ff8c00\"><span style=\"font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\"><a href=\"mailto:iService.hk@fwd.com\" target=\"_blank\">iService.hk@fwd.com</a></span></span><span style=\"color:#000000;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\">。</span></p>\r\n" + 
						  "                                              <p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:0pt;text-align:center;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"color:#000000;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\">For enquiry, please contact our FWD 24 hours Customer Service Hotline at </span><span style=\"color:#ff8c00\"><span style=\"font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\">(852) 3123 3123</span></span><span style=\"color:#000000;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\"> or via email at </span><span style=\"color:#ff8c00\"><span style=\"font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\"><a href=\"mailto:iService.hk@fwd.com\" target=\"_blank\">iService.hk@fwd.com</a></span></span><span style=\"color:#000000;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\">.</span></p>\r\n" + 
						  "                                            </td>\r\n" + 
						  "                                          </tr>\r\n" + 
						  "                                        </tbody>\r\n" + 
						  "                                      </table>\r\n" + 
						  "                                    </td>\r\n" + 
						  "                                  </tr>\r\n" + 
						  "                                </tbody>\r\n" + 
						  "                              </table>\r\n" + 
						  "                              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\r\n" + 
						  "                                <tbody>\r\n" + 
						  "                                  <tr>\r\n" + 
						  "                                    <td valign=\"top\">\r\n" + 
						  "                                      <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse\">\r\n" + 
						  "                                        <tbody>\r\n" + 
						  "                                          <tr>\r\n" + 
						  "                                            <td valign=\"top\" style=\"padding-top:9px;padding-right:18px;padding-bottom:9px;padding-left:18px;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px;line-height:150%;text-align:left\">\r\n" + 
						  "                                              <div style=\"text-align:center\">備註：此乃電腦發出之電子郵件，請不要回覆。<br>Note: This is an automatically generated email, please do not reply.</div>\r\n" + 
						  "                                            </td>\r\n" + 
						  "                                          </tr>\r\n" + 
						  "                                        </tbody>\r\n" + 
						  "                                      </table>\r\n" + 
						  "                                    </td>\r\n" + 
						  "                                  </tr>\r\n" + 
						  "                                </tbody>\r\n" + 
						  "                              </table>\r\n" + 
						  "                              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\r\n" + 
						  "                                <tbody>\r\n" + 
						  "                                  <tr>\r\n" + 
						  "                                    <td style=\"padding:18px\">\r\n" + 
						  "                                      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-top-width:1px;border-top-style:dotted;border-top-color:#999999;border-collapse:collapse\">\r\n" + 
						  "                                        <tbody>\r\n" + 
						  "                                          <tr>\r\n" + 
						  "                                            <td>\r\n" + 
						  "                                              <span></span>\r\n" + 
						  "                                            </td>\r\n" + 
						  "                                          </tr>\r\n" + 
						  "                                        </tbody>\r\n" + 
						  "                                      </table>\r\n" + 
						  "                                    </td>\r\n" + 
						  "                                  </tr>\r\n" + 
						  "                                </tbody>\r\n" + 
						  "                              </table>\r\n" + 
						  "                            </td>\r\n" + 
						  "                          </tr>\r\n" + 
						  "                        </tbody>\r\n" + 
						  "                      </table>\r\n" + 
						  "                    </td>\r\n" + 
						  "                  </tr>\r\n" + 
						  "                  <tr>\r\n" + 
						  "                    <td align=\"center\" valign=\"top\">\r\n" + 
						  "                      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;background-color:#ffffff;border-top:0;border-bottom:0\">\r\n" + 
						  "                        <tbody>\r\n" + 
						  "                          <tr>\r\n" + 
						  "                            <td valign=\"top\" style=\"padding-bottom:9px\">\r\n" + 
						  "                              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\r\n" + 
						  "                                <tbody>\r\n" + 
						  "                                  <tr>\r\n" + 
						  "                                    <td valign=\"top\">\r\n" + 
						  "                                      <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse\">\r\n" + 
						  "                                        <tbody>\r\n" + 
						  "                                          <tr>\r\n" + 
						  "                                            <td valign=\"top\" style=\"padding-top:9px;padding-right:18px;padding-bottom:9px;padding-left:18px;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px;line-height:125%;text-align:left\">\r\n" + 
						  "                                              <div style=\"text-align:center\">\r\n" + 
						  "                                                <p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:10pt;text-align:center;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">富衛人壽保險(百慕達)有限公司</span></span></p>\r\n" + 
						  "                                                <p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:10pt;text-align:center;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px\"><a href=\"http://www.fwd.com/hk/?utm_source=edm&amp;utm_medium=cpc&amp;utm_campaign=EDM%7CSA%7CP2%7CO2O&#43;Access&#43;Code&amp;utm_content=copy\" style=\"word-wrap:break-word;color:#606060;font-weight:normal;text-decoration:underline\" target=\"_blank\"><span style=\"color:#ff8c00\"><span style=\"font-family:microsoft jhenghei,calibri,sans-serif\"><span><span style=\"background-color:transparent;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">www.fwd.com.hk</span></span></span></span></a></p>\r\n" + 
						  "                                              </div>\r\n" + 
						  "                                            </td>\r\n" + 
						  "                                          </tr>\r\n" + 
						  "                                        </tbody>\r\n" + 
						  "                                      </table>\r\n" + 
						  "                                    </td>\r\n" + 
						  "                                  </tr>\r\n" + 
						  "                                </tbody>\r\n" + 
						  "                              </table>\r\n" + 
						  "                            </td>\r\n" + 
						  "                          </tr>\r\n" + 
						  "                        </tbody>\r\n" + 
						  "                      </table>\r\n" + 
						  "                    </td>\r\n" + 
						  "                  </tr>\r\n" + 
						  "                </tbody>\r\n" + 
						  "              </table>\r\n" + 
						  "            </td>\r\n" + 
						  "          </tr>\r\n" + 
						  "        </tbody>\r\n" + 
						  "      </table>\r\n" + 
						  "    </center>\r\n" + 
						  "  </div>\r\n" + 
						  "<br clear=\"both\">\r\n" + 
						  "</body>\r\n" + 
						  "</html>";
			}else if ("RP".equals(session.getAttribute("savieType"))) {
				message = "<head>\r\n" + 
						  "  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n" + 
						  "  <title>自助息理財預約申請確認 | Savie Appointment Acknowledgement</title>\r\n" + 
						  "</head>\r\n" + 
						  "<body>\r\n" + 
						  "  <div marginwidth=\"0\" marginheight=\"0\" style=\"margin:0;padding:0;background-color:#f2f2f2;min-height:100%!important;width:100%!important\">\r\n" + 
						  "    <center>\r\n" + 
						  "    <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" height=\"100%\" width=\"100%\" style=\"border-collapse:collapse;margin:0;padding:0;background-color:#f2f2f2;height:100%!important;width:100%!important\">\r\n" + 
						  "      <tbody>\r\n" + 
						  "        <tr>\r\n" + 
						  "          <td align=\"center\" valign=\"top\" style=\"margin:0;padding:20px;border-top:0;height:100%!important;width:100%!important\">\r\n" + 
						  "            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;border:0\">\r\n" + 
						  "              <tbody>\r\n" + 
						  "                <tr>\r\n" + 
						  "                  <td align=\"center\" valign=\"top\">\r\n" + 
						  "                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;background-color:#ffffff;border-top:0;border-bottom:0\">\r\n" + 
						  "                      <tbody>\r\n" + 
						  "                        <tr>\r\n" + 
						  "                          <td valign=\"top\" style=\"padding-top:9px\">\r\n" + 
						  "                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\r\n" + 
						  "                              <tbody>\r\n" + 
						  "                                <tr>\r\n" + 
						  "                                  <td valign=\"top\">\r\n" + 
						  "                                    <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"266\" style=\"border-collapse:collapse\">\r\n" + 
						  "                                      <tbody>\r\n" + 
						  "                                        <tr>\r\n" + 
						  "                                          <td valign=\"top\" style=\"padding-top:9px;padding-left:18px;padding-bottom:9px;padding-right:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px;line-height:125%;text-align:left\">\r\n" + 
						  "                                            <a href=\"https://i.fwd.com.hk/tc/?utm_source=edm&amp;utm_medium=cpc&amp;utm_campaign=EDM%7CSA%7CP2%7CO2O&#43;Appointment&#43;Confirmation&amp;utm_content=logo\" style=\"word-wrap:break-word;color:#606060;font-weight:normal;text-decoration:underline\" target=\"_blank\"><img align=\"none\" src=\"https://i.fwd.com.hk/resources/images/savie-fwd-logo.jpg\" style=\"margin:0px;border:0;outline:none;text-decoration:none;min-height:auto!important\" class=\"CToWUd\">\r\n" + 
						  "                                            </a>\r\n" + 
						  "                                          </td>\r\n" + 
						  "                                        </tr>\r\n" + 
						  "                                      </tbody>\r\n" + 
						  "                                    </table>\r\n" + 
						  "                                    <table align=\"right\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"297\" style=\"border-collapse:collapse\">\r\n" + 
						  "                                      <tbody>\r\n" + 
						  "                                        <tr>\r\n" + 
						  "                                          <td valign=\"top\" style=\"padding-top:9px;padding-right:18px;padding-bottom:9px;padding-left:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px;line-height:125%;text-align:left\">\r\n" + 
						  "                                            <div style=\"text-align:right\">\r\n" + 
						  "                                              <br>\r\n" + 
						  "                                            </div>\r\n" + 
						  "                                          </td>\r\n" + 
						  "                                        </tr>\r\n" + 
						  "                                      </tbody>\r\n" + 
						  "                                    </table>\r\n" + 
						  "                                  </td>\r\n" + 
						  "                                </tr>\r\n" + 
						  "                              </tbody>\r\n" + 
						  "                            </table>\r\n" + 
						  "                          </td>\r\n" + 
						  "                        </tr>\r\n" + 
						  "                      </tbody>\r\n" + 
						  "                    </table>\r\n" + 
						  "                  </td>\r\n" + 
						  "                </tr>\r\n" + 
						  "                <tr>\r\n" + 
						  "                  <td align=\"center\" valign=\"top\">\r\n" + 
						  "                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;background-color:#ffffff;border-top:0;border-bottom:0\">\r\n" + 
						  "                      <tbody>\r\n" + 
						  "                        <tr>\r\n" + 
						  "                          <td valign=\"top\">\r\n" + 
						  "                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\r\n" + 
						  "                              <tbody>\r\n" + 
						  "                                <tr>\r\n" + 
						  "                                  <td valign=\"top\" style=\"padding:0px\">\r\n" + 
						  "                                    <table align=\"left\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n" + 
						  "                                      <tbody>\r\n" + 
						  "                                        <tr>\r\n" + 
						  "                                          <td valign=\"top\" style=\"padding-right:0px;padding-left:0px;padding-top:0;padding-bottom:0;text-align:center\">\r\n" + 
						  "                                            <img align=\"center\" alt=\"\" src=\"https://i.fwd.com.hk/resources/images/savie-regular/savie-regular_cn.png\" width=\"600\" style=\"max-width:600px;padding-bottom:0;display:inline!important;vertical-align:bottom;border:0;outline:none;text-decoration:none\" class=\"CToWUd a6T\" tabindex=\"0\">\r\n" + 
						  "                                            <div class=\"a6S\" dir=\"ltr\" style=\"opacity: 0.01; left: 572px; top: 311px;\">\r\n" + 
						  "                                              <div id=\":sw\" class=\"T-I J-J5-Ji aQv T-I-ax7 L3 a5q\" role=\"button\" tabindex=\"0\" aria-label=\"Download attachment \" data-tooltip-class=\"a1V\" data-tooltip=\"Download\">\r\n" + 
						  "                                                <div class=\"aSK J-J5-Ji aYr\"></div>\r\n" + 
						  "                                              </div>\r\n" + 
						  "                                            </div>\r\n" + 
						  "                                          </td>\r\n" + 
						  "                                        </tr>\r\n" + 
						  "                                      </tbody>\r\n" + 
						  "                                    </table>\r\n" + 
						  "                                  </td>\r\n" + 
						  "                                </tr>\r\n" + 
						  "                              </tbody>\r\n" + 
						  "                            </table>\r\n" + 
						  "                          </td>\r\n" + 
						  "                        </tr>\r\n" + 
						  "                      </tbody>\r\n" + 
						  "                    </table>\r\n" + 
						  "                  </td>\r\n" + 
						  "                </tr>\r\n" + 
						  "                <tr>\r\n" + 
						  "                  <td align=\"center\" valign=\"top\">\r\n" + 
						  "                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;background-color:#ffffff;border-top:0;border-bottom:0\">\r\n" + 
						  "                      <tbody>\r\n" + 
						  "                        <tr>\r\n" + 
						  "                          <td valign=\"top\">\r\n" + 
						  "                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\r\n" + 
						  "                              <tbody>\r\n" + 
						  "                                <tr>\r\n" + 
						  "                                  <td valign=\"top\">\r\n" + 
						  "                                    <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse\">\r\n" + 
						  "                                      <tbody>\r\n" + 
						  "                                        <tr>\r\n" + 
						  "                                          <td valign=\"top\" style=\"padding:9px 18px;line-height:125%;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px;text-align:left\">\r\n" + 
						  "                                            <div style=\"text-align:center\">\r\n" + 
						  "                                              <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">您好，</span></span>\r\n" + 
						  "                                              </p>\r\n" + 
						  "                                              <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">恭喜！您已完成自助息理財壽險計劃(「本計劃」) 的預約申請，煩請於預約時間帶備下列所需文件親臨客戶服務中心完成簡單的財務需要分析，以評估本計劃是否切合您的需要，而一經確定本計劃切合您所需，您便可立即於客戶服務中心投保。<wbr><br><br>預約詳情如下：</p>\r\n" + 
						  "		                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>日期:  </strong></span><span style=\"color:#000000\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" + perferredDateC + "</span></span>\r\n" + 
						  "                                                </span>\r\n" + 
						  "                                                </span>\r\n" + 
						  "                                              </p>\r\n" + 
						  "                                              <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>時間:  </strong></span><span style=\"color:#000000\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" + perferredTime + "</span></span>\r\n" + 
						  "                                                </span>\r\n" + 
						  "                                                </span>\r\n" + 
						  "                                              </p>\r\n" + 
						  "                                              <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>客戶服務中心:  </strong></span><span style=\"color:#000000\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" + scrChi.getServiceCentreName() + "</span></span>\r\n" + 
						  "                                                </span>\r\n" + 
						  "                                                </span>\r\n" + 
						  "                                              </p>\r\n" + 
						  "                                              <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>地址:  </strong></span><span style=\"color:#000000\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" + scrChi.getAddress() + "</span></span>\r\n" + 
						  "                                                </span>\r\n" + 
						  "                                                </span>\r\n" + 
						  "                                              </p>\r\n" + 
						  "                                              <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>參考編號: </strong></span><span style=\"color:#000000\"><span style=\"line-height:125%;background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" + applicationNumber + "</span></span>\r\n" + 
						  "                                                </span>\r\n" + 
						  "                                                </span>\r\n" + 
						  "                                              </p>\r\n" + 
						  "                                              <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>所需文件:</strong></span>\r\n" + 
						  "                                                <br><span style=\"color:#000000\"><span style=\"line-height:125%;background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><ol style=\"text-align: left; font-size:13px; color:#000000;\"><li>香港身份證 <br>  <span style=\"line-height:125%;background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap;font-size:12px\">   (如您並非香港永久性居民，您必須出示香港身份證及護照作為證明。)</span><br><br></li>\r\n" + 
						  "                                                <li>三個月內的<a style=\"color:#ff8c00\" href=\"https://i.fwd.com.hk/resources/policy-provisions-pdf/Savie_Address_Proof.pdf\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap;text-decoration:underline;\">有效住址證明</span></a><br><br></li>\r\n" + 
						  "                                                <li><span style=\"text-decoration: underline; font-weight: bold;\">保費支付</span><br><br>首2個月月繳保費：<br>您的支票/交通銀行FWD 富衛信用卡<br><br>其後保費：<br>銀行資料以便填寫自動轉賬授權書<br></li>\r\n" + 
						  "                                                  </ol></span>\r\n" + 
						  "                                                </span>\r\n" + 
						  "                                                </span>\r\n" + 
						  "                                                </span>\r\n" + 
						  "                                              </p>\r\n" + 
						  "                                              <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>付款方式:</strong></span>\r\n" + 
						  "                                                <br><span style=\"color:#000000\"><span style=\"line-height:125%;background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><br>首2個月月繳保費：<br>您的支票/交通銀行FWD 富衛信用卡<br><br>其後保費：<br>自動轉賬</span></span>\r\n" + 
						  "                                                </span>\r\n" + 
						  "                                                </span>\r\n" + 
						  "                                              </p>\r\n" + 
						  "                                              <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>保費金額:</strong></span>\r\n" + 
						  "                                                <br><br><span style=\"color:#000000\"><span style=\"line-height:125%;background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">本計劃的月繳保費為港幣一千元至一萬元內。您可於投保當日因應財務需要分析及個人意願以作決定。\r\n" + 
						  "                                                  </span>\r\n" + 
						  "                                                </span>\r\n" + 
						  "                                                <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">如欲更改預約時段或客戶服務中心，請致電富衛24小時客戶服務熱線<span style=\"color:#ff8c00\"><span style=\"font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\">(852) 3123 3123</span></span>。</span>\r\n" + 
						  "                                                  </span>\r\n" + 
						  "                                                  &nbsp;\r\n" + 
						  "                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">Hi,</span></span>\r\n" + 
						  "                                                  </p>\r\n" + 
						  "                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">Congratulations! You have completed the appointment application for Savie Insurance Plan (the \"Plan\"). Please visit our customer service centre at the scheduled time with the required documents as set out below to conduct a simple financial needs analysis (\"FNA\") to assess your suitability for the Plan. Once it is confirmed that Savie is right for you, you may begin the application process immediately at the customer service centre.<br><br>The appointment details are as follows:</p>\r\n" + 
						  "		                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>Date:  </strong></span><span style=\"color:#000000\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" + perferredDateE + "</span></span>\r\n" + 
						  "                                                    </span>\r\n" + 
						  "                                                    </span>\r\n" + 
						  "                                                  </p>\r\n" + 
						  "                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>Time:  </strong></span><span style=\"color:#000000\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" + perferredTime + "</span></span>\r\n" + 
						  "                                                    </span>\r\n" + 
						  "                                                    </span>\r\n" + 
						  "                                                  </p>\r\n" + 
						  "                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>Customer service centre:  </strong></span><span style=\"color:#000000\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" + scrEng.getServiceCentreName() + "</span></span>\r\n" + 
						  "                                                    </span>\r\n" + 
						  "                                                    </span>\r\n" + 
						  "                                                  </p>\r\n" + 
						  "                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>Address:  </strong></span><span style=\"color:#000000\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" + scrEng.getAddress() + "</span></span>\r\n" + 
						  "                                                    </span>\r\n" + 
						  "                                                    </span>\r\n" + 
						  "                                                  </p>\r\n" + 
						  "                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>Reference number:  </strong></span><span style=\"color:#000000\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" + applicationNumber + "</span></span>\r\n" + 
						  "                                                    </span>\r\n" + 
						  "                                                    </span>\r\n" + 
						  "                                                  </p>\r\n" + 
						  "                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>Required documents:</strong></span>\r\n" + 
						  "                                                    <br><span style=\"color:#000000\"><span style=\"line-height:125%;background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><ol style=\"text-align: left; font-size:13px; color:#000000;\"><li>HKID card <br>  <span style=\"line-height:125%;background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap;font-size:12px\">(If you are a non-permanent Hong Kong resident, you must present your HKID Card and your passport for verification.)</span><br><br></li>\r\n" + 
						  "                                                    <li><a style=\"color:#ff8c00\" href=\"https://i.fwd.com.hk/resources/policy-provisions-pdf/Savie_Address_Proof.pdf\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap;text-decoration:underline;\">A valid address proof</span></a> within the last 3 months<br><br></li>\r\n" + 
						  "                                                    <li><span style=\"text-decoration: underline; font-weight: bold;\">Premium Payment</span><br><br>For the first 2 months' Regular Premium Payment:<br>Your personal cheque/Bank of Communications FWD Credit Card <br><br>Future Premium Payment:<br>Bank information for completing the direct debit authorization form<br><br></li>\r\n" + 
						  "                                                    </ol></span>\r\n" + 
						  "                                                    </span>\r\n" + 
						  "                                                    </span>\r\n" + 
						  "                                                    </span>\r\n" + 
						  "                                                  </p>\r\n" + 
						  "                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>Payment methods: </strong></span>\r\n" + 
						  "                                                    <br><br><span style=\"color:#000000\"><span style=\"line-height:125%;background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">For the first 2 months' Regular Premium Payment:<br>Your personal cheque/Bank of Communications FWD Credit Card<br><br>Future Premium Payment:<br>Direct debit<br></span></span>\r\n" + 
						  "                                                    </span>\r\n" + 
						  "                                                    </span>\r\n" + 
						  "                                                  </p>\r\n" + 
						  "                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>Premium: </strong></span>\r\n" + 
						  "                                                    <br><br><span style=\"color:#000000\"><span style=\"line-height:125%;background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">The regular premium payment of the Plan is between HK$1,000 and HK$10,000. You have the right to decide the premium amount based on the FNA results or at your discretion on the day of application.</span></span>\r\n" + 
						  "                                                    </span>\r\n" + 
						  "                                                    </span>\r\n" + 
						  "                                                  </p>\r\n" + 
						  "                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\">\r\n" + 
						  "                                                    <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">For questions regarding appointments, please contact our FWD 24 hours Customer Service Hotline at <span style=\"color:#ff8c00\"><span style=\"font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\">(852) 3123 3123</span></span>.</span>\r\n" + 
						  "                                                      </span>\r\n" + 
						  "                                                      <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">此致</span></span><br><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">Yours sincerely,<br>Fanny<br><br>富衛人壽保險(百慕達)有限公司<br>FWD Life Insurance Company (Bermuda) Limited<br>www.fwd.com.hk</span></span>\r\n" + 
						  "                                                      </p>\r\n" + 
						  "                                                      &nbsp;\r\n" + 
						  "                                            </div>\r\n" + 
						  "                                          </td>\r\n" + 
						  "                                        </tr>\r\n" + 
						  "                                      </tbody>\r\n" + 
						  "                                    </table>\r\n" + 
						  "                                  </td>\r\n" + 
						  "                                </tr>\r\n" + 
						  "                              </tbody>\r\n" + 
						  "                            </table>\r\n" + 
						  "                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\r\n" + 
						  "                              <tbody>\r\n" + 
						  "                                <tr>\r\n" + 
						  "                                  <td style=\"padding:18px\">\r\n" + 
						  "                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-top-width:1px;border-top-style:dotted;border-top-color:#999999;border-collapse:collapse\">\r\n" + 
						  "                                      <tbody>\r\n" + 
						  "                                        <tr>\r\n" + 
						  "                                          <td>\r\n" + 
						  "                                            <span></span>\r\n" + 
						  "                                          </td>\r\n" + 
						  "                                        </tr>\r\n" + 
						  "                                      </tbody>\r\n" + 
						  "                                    </table>\r\n" + 
						  "                                  </td>\r\n" + 
						  "                                </tr>\r\n" + 
						  "                              </tbody>\r\n" + 
						  "                            </table>\r\n" + 
						  "                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\r\n" + 
						  "                              <tbody>\r\n" + 
						  "                                <tr>\r\n" + 
						  "                                  <td valign=\"top\">\r\n" + 
						  "                                    <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse\">\r\n" + 
						  "                                      <tbody>\r\n" + 
						  "                                        <tr>\r\n" + 
						  "                                          <td valign=\"top\" style=\"padding-top:9px;padding-right:18px;padding-bottom:9px;padding-left:18px;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px;line-height:150%;text-align:left\">\r\n" + 
						  "                                            <p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:0pt;text-align:center;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"color:#000000;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\">如有任何查詢，請致電富衛24小時客戶服務熱線</span><span style=\"color:#ff8c00\"><span style=\"font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\">(852) 3123 3123</span></span><span style=\"color:#000000;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\">或電郵至</span><span style=\"color:#ff8c00\"><span style=\"font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\"><a href=\"mailto:iService.hk@fwd.com\" target=\"_blank\">iService.hk@fwd.com</a></span></span><span style=\"color:#000000;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\">。</span>\r\n" + 
						  "                                            </p>\r\n" + 
						  "                                            <p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:0pt;text-align:center;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"color:#000000;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\">For enquiry, please contact our FWD 24 hours Customer Service Hotline at </span><span style=\"color:#ff8c00\"><span style=\"font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\">(852) 3123 3123</span></span><span style=\"color:#000000;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\"> or via email at </span><span style=\"color:#ff8c00\"><span style=\"font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\"><a href=\"mailto:iService.hk@fwd.com\" target=\"_blank\">iService.hk@fwd.com</a></span></span><span style=\"color:#000000;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\">.</span>\r\n" + 
						  "                                            </p>\r\n" + 
						  "                                          </td>\r\n" + 
						  "                                        </tr>\r\n" + 
						  "                                      </tbody>\r\n" + 
						  "                                    </table>\r\n" + 
						  "                                  </td>\r\n" + 
						  "                                </tr>\r\n" + 
						  "                              </tbody>\r\n" + 
						  "                            </table>\r\n" + 
						  "                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\r\n" + 
						  "                              <tbody>\r\n" + 
						  "                                <tr>\r\n" + 
						  "                                  <td valign=\"top\">\r\n" + 
						  "                                    <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse\">\r\n" + 
						  "                                      <tbody>\r\n" + 
						  "                                        <tr>\r\n" + 
						  "                                          <td valign=\"top\" style=\"padding-top:9px;padding-right:18px;padding-bottom:9px;padding-left:18px;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px;line-height:150%;text-align:left\">\r\n" + 
						  "                                            <div style=\"text-align:center\">備註：此乃電腦發出之電子郵件，請不要回覆。\r\n" + 
						  "                                              <br>Note: This is an automatically generated email, please do not reply.</div>\r\n" + 
						  "                                          </td>\r\n" + 
						  "                                        </tr>\r\n" + 
						  "                                      </tbody>\r\n" + 
						  "                                    </table>\r\n" + 
						  "                                  </td>\r\n" + 
						  "                                </tr>\r\n" + 
						  "                              </tbody>\r\n" + 
						  "                            </table>\r\n" + 
						  "                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\r\n" + 
						  "                              <tbody>\r\n" + 
						  "                                <tr>\r\n" + 
						  "                                  <td style=\"padding:18px\">\r\n" + 
						  "                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-top-width:1px;border-top-style:dotted;border-top-color:#999999;border-collapse:collapse\">\r\n" + 
						  "                                      <tbody>\r\n" + 
						  "                                        <tr>\r\n" + 
						  "                                          <td>\r\n" + 
						  "                                            <span></span>\r\n" + 
						  "                                          </td>\r\n" + 
						  "                                        </tr>\r\n" + 
						  "                                      </tbody>\r\n" + 
						  "                                    </table>\r\n" + 
						  "                                  </td>\r\n" + 
						  "                                </tr>\r\n" + 
						  "                              </tbody>\r\n" + 
						  "                            </table>\r\n" + 
						  "                          </td>\r\n" + 
						  "                        </tr>\r\n" + 
						  "                      </tbody>\r\n" + 
						  "                    </table>\r\n" + 
						  "                  </td>\r\n" + 
						  "                </tr>\r\n" + 
						  "                <tr>\r\n" + 
						  "                  <td align=\"center\" valign=\"top\">\r\n" + 
						  "                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;background-color:#ffffff;border-top:0;border-bottom:0\">\r\n" + 
						  "                      <tbody>\r\n" + 
						  "                        <tr>\r\n" + 
						  "                          <td valign=\"top\" style=\"padding-bottom:9px\">\r\n" + 
						  "                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\r\n" + 
						  "                              <tbody>\r\n" + 
						  "                                <tr>\r\n" + 
						  "                                  <td valign=\"top\">\r\n" + 
						  "                                    <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse\">\r\n" + 
						  "                                      <tbody>\r\n" + 
						  "                                        <tr>\r\n" + 
						  "                                          <td valign=\"top\" style=\"padding-top:9px;padding-right:18px;padding-bottom:9px;padding-left:18px;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px;line-height:125%;text-align:left\">\r\n" + 
						  "                                            <div style=\"text-align:center\">\r\n" + 
						  "                                              <p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:10pt;text-align:center;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">富衛人壽保險(百慕達)有限公司</span></span>\r\n" + 
						  "                                              </p>\r\n" + 
						  "                                              <p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:10pt;text-align:center;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px\"><a href=\"http://www.fwd.com/hk/?utm_source=edm&amp;utm_medium=cpc&amp;utm_campaign=EDM%7CSA%7CP2%7CO2O&#43;Access&#43;Code&amp;utm_content=copy\" style=\"word-wrap:break-word;color:#606060;font-weight:normal;text-decoration:underline\" target=\"_blank\"><span style=\"color:#ff8c00\"><span style=\"font-family:microsoft jhenghei,calibri,sans-serif\"><span><span style=\"background-color:transparent;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">www.fwd.com.hk</span></span></span></span></a>\r\n" + 
						  "                                              </p>\r\n" + 
						  "                                            </div>\r\n" + 
						  "                                          </td>\r\n" + 
						  "                                        </tr>\r\n" + 
						  "                                      </tbody>\r\n" + 
						  "                                    </table>\r\n" + 
						  "                                  </td>\r\n" + 
						  "                                </tr>\r\n" + 
						  "                              </tbody>\r\n" + 
						  "                            </table>\r\n" + 
						  "                          </td>\r\n" + 
						  "                        </tr>\r\n" + 
						  "                      </tbody>\r\n" + 
						  "                    </table>\r\n" + 
						  "                  </td>\r\n" + 
						  "                </tr>\r\n" + 
						  "              </tbody>\r\n" + 
						  "            </table>\r\n" + 
						  "          </td>\r\n" + 
						  "        </tr>\r\n" + 
						  "      </tbody>\r\n" + 
						  "    </table>\r\n" + 
						  "  </center>\r\n" + 
						  "</div>\r\n" + 
						  "</body>\r\n" + 
						  "</html>";
			}
			/*message = "<head>\r\n" + 
					"			    <meta charset=\"UTF-8\">\r\n" + 
					"			    <title>富衛Savie自助息理財壽險計劃申請預約確認電郵</title>\r\n" + 
					"			  </head>\r\n" + 
					"			  <body>\r\n" + 
					"			    <div marginwidth=\"0\" marginheight=\"0\" style=\"margin:0;padding:0;background-color:#f2f2f2;min-height:100%!important;width:100%!important\">\r\n" + 
					"			      <center>\r\n" + 
					"			        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" height=\"100%\" width=\"100%\" style=\"border-collapse:collapse;margin:0;padding:0;background-color:#f2f2f2;height:100%!important;width:100%!important\">\r\n" + 
					"			          <tbody>\r\n" + 
					"			            <tr>\r\n" + 
					"			              <td align=\"center\" valign=\"top\" style=\"margin:0;padding:20px;border-top:0;height:100%!important;width:100%!important\">\r\n" + 
					"			                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;border:0\">\r\n" + 
					"			                  <tbody>\r\n" + 
					"			                    <tr>\r\n" + 
					"			                      <td align=\"center\" valign=\"top\">\r\n" + 
					"			                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;background-color:#ffffff;border-top:0;border-bottom:0\">\r\n" + 
					"			                          <tbody>\r\n" + 
					"			                            <tr>\r\n" + 
					"			                              <td valign=\"top\" style=\"padding-top:9px\">\r\n" + 
					"			                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\r\n" + 
					"			                                  <tbody>\r\n" + 
					"			                                    <tr>\r\n" + 
					"			                                      <td valign=\"top\">\r\n" + 
					"			                                        <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"266\" style=\"border-collapse:collapse\">\r\n" + 
					"			                                          <tbody>\r\n" + 
					"			                                            <tr>\r\n" + 
					"			                                              <td valign=\"top\" style=\"padding-top:9px;padding-left:18px;padding-bottom:9px;padding-right:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px;line-height:125%;text-align:left\">\r\n" + 
					"			                                                <a href=\"https://i.fwd.com.hk/tc/?utm_source=edm&amp;utm_medium=cpc&amp;utm_campaign=EDM%7CSA%7CP2%7CO2O+Appointment+Confirmation&amp;utm_content=logo\" style=\"word-wrap:break-word;color:#606060;font-weight:normal;text-decoration:underline\" target=\"_blank\"><img align=\"none\" src=\""+serverUrl+"/resources/images/savie-fwd-logo.jpg\" style=\"margin:0px;border:0;outline:none;text-decoration:none;min-height:auto!important\" class=\"CToWUd\"></a>\r\n" + 
					"			                                              </td>\r\n" + 
					"			                                            </tr>\r\n" + 
					"			                                          </tbody>\r\n" + 
					"			                                        </table>\r\n" + 
					"			                                        <table align=\"right\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"297\" style=\"border-collapse:collapse\">\r\n" + 
					"			                                          <tbody>\r\n" + 
					"			                                            <tr>\r\n" + 
					"			                                              <td valign=\"top\" style=\"padding-top:9px;padding-right:18px;padding-bottom:9px;padding-left:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px;line-height:125%;text-align:left\">\r\n" + 
					"			                                                <div style=\"text-align:right\"><br>\r\n" + 
					"			                                                </div>\r\n" + 
					"			                                              </td>\r\n" + 
					"			                                            </tr>\r\n" + 
					"			                                          </tbody>\r\n" + 
					"			                                        </table>\r\n" + 
					"			                                      </td>\r\n" + 
					"			                                    </tr>\r\n" + 
					"			                                  </tbody>\r\n" + 
					"			                                </table>\r\n" + 
					"			                              </td>\r\n" + 
					"			                            </tr>\r\n" + 
					"			                          </tbody>\r\n" + 
					"			                        </table>\r\n" + 
					"			                      </td>\r\n" + 
					"			                    </tr>\r\n" + 
					"			                    <tr>\r\n" + 
					"			                      <td align=\"center\" valign=\"top\">\r\n" + 
					"			                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;background-color:#ffffff;border-top:0;border-bottom:0\">\r\n" + 
					"			                          <tbody>\r\n" + 
					"			                            <tr>\r\n" + 
					"			                              <td valign=\"top\">\r\n" + 
					"			                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\r\n" + 
					"			                                  <tbody>\r\n" + 
					"			                                    <tr>\r\n" + 
					"			                                      <td valign=\"top\" style=\"padding:0px\">\r\n" + 
					"			                                        <table align=\"left\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n" + 
					"			                                          <tbody>\r\n" + 
					"			                                            <tr>\r\n" + 
					"			                                              <td valign=\"top\" style=\"padding-right:0px;padding-left:0px;padding-top:0;padding-bottom:0;text-align:center\">\r\n" + 
					"			                                                <img align=\"center\" alt=\"\" src=\""+serverUrl+"/resources/images/FWD_Hero-images_Savie-OP.jpg\" width=\"600\" style=\"max-width:600px;padding-bottom:0;display:inline!important;vertical-align:bottom;border:0;outline:none;text-decoration:none\" class=\"CToWUd a6T\" tabindex=\"0\">\r\n" + 
					"			                                                <div class=\"a6S\" dir=\"ltr\" style=\"opacity: 0.01; left: 572px; top: 311px;\">\r\n" + 
					"			                                                  <div id=\":sw\" class=\"T-I J-J5-Ji aQv T-I-ax7 L3 a5q\" role=\"button\" tabindex=\"0\" aria-label=\"Download attachment \" data-tooltip-class=\"a1V\" data-tooltip=\"Download\">\r\n" + 
					"			                                                    <div class=\"aSK J-J5-Ji aYr\"></div>\r\n" + 
					"			                                                  </div>\r\n" + 
					"			                                                </div>\r\n" + 
					"			                                              </td>\r\n" + 
					"			                                            </tr>\r\n" + 
					"			                                          </tbody>\r\n" + 
					"			                                        </table>\r\n" + 
					"			                                      </td>\r\n" + 
					"			                                    </tr>\r\n" + 
					"			                                  </tbody>\r\n" + 
					"			                                </table>\r\n" + 
					"			                              </td>\r\n" + 
					"			                            </tr>\r\n" + 
					"			                          </tbody>\r\n" + 
					"			                        </table>\r\n" + 
					"			                      </td>\r\n" + 
					"			                    </tr>\r\n" + 
					"			                    <tr>\r\n" + 
					"			                      <td align=\"center\" valign=\"top\">\r\n" + 
					"			                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;background-color:#ffffff;border-top:0;border-bottom:0\">\r\n" + 
					"			                          <tbody>\r\n" + 
					"			                            <tr>\r\n" + 
					"			                              <td valign=\"top\">\r\n" + 
					"			                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\r\n" + 
					"			                                  <tbody>\r\n" + 
					"			                                    <tr>\r\n" + 
					"			                                      <td valign=\"top\">\r\n" + 
					"			                                        <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse\">\r\n" + 
					"			                                          <tbody>\r\n" + 
					"			                                            <tr>\r\n" + 
					"			                                              <td valign=\"top\" style=\"padding:9px 18px;line-height:125%;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px;text-align:left\">\r\n" + 
					"			                                                <div style=\"text-align:center\">\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">您好，</span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">恭喜！您已完成自助息理財壽險計劃 (「本計劃」) 的申請預約，<wbr>煩請於預約時間帶備下列文件親臨以下客戶服務中心完成簡單的財務需要分析，<wbr>以評估本計劃是否切合您的需要。<wbr>而一經確定，您便可立即於客戶服務中心投保。<wbr>預約詳情及所需文件如下:</p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>日期:  </strong></span><span style=\"color:#000000\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" + perferredDateC + "</span></span></span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>時間:  </strong></span><span style=\"color:#000000\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" + perferredTime + "</span></span></span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>客戶服務中心:  </strong></span><span style=\"color:#000000\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" +scrChi.getServiceCentreName() + "</span></span></span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>地址:  </strong></span><span style=\"color:#000000\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" + scrChi.getAddress() + "</span></span></span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>參考編號: </strong></span><span style=\"color:#000000\"><span style=\"line-height:125%;background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" + applicationNumber + "</span></span></span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>所需文件:</strong></span><br /><span style=\"color:#000000\"><span style=\"line-height:125%;background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">1. 香港身份證 <br>  <span style=\"line-height:125%;background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap;font-size:12px\">   (如您並非香港永久性居民，您必須出示香港身份證及護照作為證明。)</span><br />2.三個月內的<a style=\"color:#ff8c00\" href=\""+serverUrl+"/resources/policy-provisions-pdf/Savie_Address_Proof.pdf\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap;text-decoration:underline;\">有效住址證明</span></a><br />3.繳付保費 - 申請人之支票/銀行資料以作填寫自動轉賬授權書之用/申請人之交通銀行信用卡<br />4.海洋公園所發行的成人金卡或成人銀卡智紛全年入場證正本*(如有)</span></span></span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>付款方式:</strong></span><br /><span style=\"color:#000000\"><span style=\"line-height:125%;background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">1.申請人之支票；或<br />2.申請人之交通銀行信用卡；或<br />3. 銀行自動轉帳</span></span></span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>保費金額:</strong></span><br /><span style=\"color:#000000\"><span style=\"line-height:125%;background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">本計劃的一筆過保費為港幣三萬元至四十萬元內。<wbr>客戶可於投保當日因應財務需要分析及個人意願以作決定。</span></span></span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">如欲更改預約時段或客戶服務中心，請致電富衛24小時客戶服務熱線<span style=\"color:#ff8c00\"><span style=\"font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\">(852) 3123 3123</span></span>。</span></span>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">此致</span></span>\r\n" +
					"			                                                  </p>\r\n" +
					"			                                                  &nbsp;\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">Hi,</span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">Congratulations! You have completed the application appointment for Savie Insurance Plan (the \"Plan\"). Please kindly visit our customer service centre at the scheduled timeslot with the required documents as set out below to conduct a simple financial needs analysis (\"FNA\") to assess your suitability for the Plan. Once your needs are confirmed, you may begin the application process immediately at the customer service centre. The appointment details are as follows:</p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>Date:  </strong></span><span style=\"color:#000000\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" + perferredDateE + "</span></span></span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>Time:  </strong></span><span style=\"color:#000000\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" + perferredTime + "</span></span></span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>Customer service centre:  </strong></span><span style=\"color:#000000\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" +scrEng.getServiceCentreName() + "</span></span></span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>Address:  </strong></span><span style=\"color:#000000\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" + scrEng.getAddress() + "</span></span></span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>Reference number:  </strong></span><span style=\"color:#000000\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">" + applicationNumber + "</span></span></span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>Required documents:</strong></span><br /><span style=\"color:#000000\"><span style=\"line-height:125%;background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">1. HKID card <br>  <span style=\"line-height:125%;background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap;font-size:12px\">   (If you are a non-permanent Hong Kong resident, you must present your HKID Card and your passport for verification.)</span><br />2. <a style=\"color:#ff8c00\" href=\""+serverUrl+"/resources/policy-provisions-pdf/Savie_Address_Proof.pdf\"><span style=\"background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap;text-decoration:underline;\">A valid address proof</span></a> within the last 3 months  <br />3. Premium Payment – Personal cheque of the applicant/the applicant’s bank information for completing the direct debit authorization form/the applicant’s Bank of Communication FWD Credit Card<br />4.	Original copy of SmartFun Annual Pass (Gold Pass-Adult) or SmartFun Annual Pass (Silver Pass-Adult)issued by Ocean Park Corporation*(If applicable)</span></span></span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>Payment methods: </strong></span><br /><span style=\"color:#000000\"><span style=\"line-height:125%;background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">1. Personal cheque of the applicant; or<br />2. The applicant’s Bank of Communication FWD Credit Card; or<br />3. Bank direct debit</span></span></span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"font-size:13px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\"><strong>Premium: </strong></span><br /><span style=\"color:#000000\"><span style=\"line-height:125%;background-color:transparent;font-family:microsoft jhenghei,calibri,sans-serif;vertical-align:baseline;white-space:pre-wrap\">The one-off payment of the Plan is between HK$30,000 and HK$400,000. Customers have the right to decide the premium amount based on the FNA results or at his/her personal discretion on the day of application.</span></span></span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">For questions regarding appointments, please contact our FWD 24 hours Customer Service Hotline at <span style=\"color:#ff8c00\"><span style=\"font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\">(852) 3123 3123</span></span>.</span></span>\r\n" +
					"			                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">Yours sincerely,<br>Fanny from FWD<br><br>富衛人壽保險(百慕達)有限公司<br>FWD Life Insurance Company (Bermuda) Limited<br>www.fwd.com.hk</span></span>\r\n" +
					"			                                                  </p>\r\n" + 
					"			                                                  &nbsp;\r\n" + 
					"			                                                </div>\r\n" + 
					"			                                              </td>\r\n" + 
					"			                                            </tr>\r\n" + 
					"			                                          </tbody>\r\n" + 
					"			                                        </table>\r\n" + 
					"			                                      </td>\r\n" + 
					"			                                    </tr>\r\n" + 
					"			                                  </tbody>\r\n" + 
					"			                                </table>\r\n" + 
					"			                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\r\n" + 
					"			                                  <tbody>\r\n" + 
					"			                                    <tr>\r\n" + 
					"			                                      <td style=\"padding:18px\">\r\n" + 
					"			                                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-top-width:1px;border-top-style:dotted;border-top-color:#999999;border-collapse:collapse\">\r\n" + 
					"			                                          <tbody>\r\n" + 
					"			                                            <tr>\r\n" + 
					"			                                              <td>\r\n" + 
					"			                                                <span></span>\r\n" + 
					"			                                              </td>\r\n" + 
					"			                                            </tr>\r\n" + 
					"			                                          </tbody>\r\n" + 
					"			                                        </table>\r\n" + 
					"			                                      </td>\r\n" + 
					"			                                    </tr>\r\n" + 
					"			                                  </tbody>\r\n" + 
					"			                                </table>\r\n" + 
					"			                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\r\n" + 
					"			                                  <tbody>\r\n" + 
					"			                                    <tr>\r\n" + 
					"			                                      <td valign=\"top\">\r\n" + 
					"			                                        <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse\">\r\n" + 
					"			                                          <tbody>\r\n" + 
					"			                                            <tr>\r\n" + 
					"			                                              <td valign=\"top\" style=\"padding-top:9px;padding-right:18px;padding-bottom:9px;padding-left:18px;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px;line-height:150%;text-align:left\">\r\n" + 
					"			                                                <p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:0pt;text-align:center;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"color:#000000;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\">如有任何查詢，請致電富衛24小時客戶服務熱線</span><span style=\"color:#ff8c00\"><span style=\"font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\">(852) 3123 3123</span></span><span style=\"color:#000000;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\">或電郵至</span><span style=\"color:#ff8c00\"><span style=\"font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\"><a href=\"mailto:iService.hk@fwd.com\" target=\"_blank\">iService.hk@fwd.com</a></span></span><span style=\"color:#000000;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\">。</span></p>\r\n" + 
					"			                                                <p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:0pt;text-align:center;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span style=\"color:#000000;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\">For enquiry, please contact our FWD 24 hours Customer Service Hotline at </span><span style=\"color:#ff8c00\"><span style=\"font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\">(852) 3123 3123</span></span><span style=\"color:#000000;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\"> or via email at </span><span style=\"color:#ff8c00\"><span style=\"font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\"><a href=\"mailto:iService.hk@fwd.com\" target=\"_blank\">iService.hk@fwd.com</a></span></span><span style=\"color:#000000;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:13.3333px;line-height:16px;text-align:left;white-space:pre-wrap\">.</span></p>\r\n" + 
					"			                                              </td>\r\n" + 
					"			                                            </tr>\r\n" + 
					"			                                          </tbody>\r\n" + 
					"			                                        </table>\r\n" + 
					"			                                      </td>\r\n" + 
					"			                                    </tr>\r\n" + 
					"			                                  </tbody>\r\n" + 
					"			                                </table>\r\n" + 
					"			                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\r\n" + 
					"			                                  <tbody>\r\n" + 
					"			                                    <tr>\r\n" + 
					"			                                      <td valign=\"top\">\r\n" + 
					"			                                        <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse\">\r\n" + 
					"			                                          <tbody>\r\n" + 
					"			                                            <tr>\r\n" + 
					"			                                              <td valign=\"top\" style=\"padding-top:9px;padding-right:18px;padding-bottom:9px;padding-left:18px;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px;line-height:150%;text-align:left\">\r\n" + 
					"			                                                <div style=\"text-align:center\">備註：此乃電腦發出之電子郵件，請不要回覆。<br>Note: This is an automatically generated email, please do not reply.</div>\r\n" + 
					"			                                              </td>\r\n" + 
					"			                                            </tr>\r\n" + 
					"			                                          </tbody>\r\n" + 
					"			                                        </table>\r\n" + 
					"			                                      </td>\r\n" + 
					"			                                    </tr>\r\n" + 
					"			                                  </tbody>\r\n" + 
					"			                                </table>\r\n" + 
					"			                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\r\n" + 
					"			                                  <tbody>\r\n" + 
					"			                                    <tr>\r\n" + 
					"			                                      <td style=\"padding:18px\">\r\n" + 
					"			                                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-top-width:1px;border-top-style:dotted;border-top-color:#999999;border-collapse:collapse\">\r\n" + 
					"			                                          <tbody>\r\n" + 
					"			                                            <tr>\r\n" + 
					"			                                              <td>\r\n" + 
					"			                                                <span></span>\r\n" + 
					"			                                              </td>\r\n" + 
					"			                                            </tr>\r\n" + 
					"			                                          </tbody>\r\n" + 
					"			                                        </table>\r\n" + 
					"			                                      </td>\r\n" + 
					"			                                    </tr>\r\n" + 
					"			                                  </tbody>\r\n" + 
					"			                                </table>\r\n" + 
					"			                              </td>\r\n" + 
					"			                            </tr>\r\n" + 
					"			                          </tbody>\r\n" + 
					"			                        </table>\r\n" + 
					"			                      </td>\r\n" + 
					"			                    </tr>\r\n" + 
					"			                    <tr>\r\n" + 
					"			                      <td align=\"center\" valign=\"top\">\r\n" + 
					"			                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;background-color:#ffffff;border-top:0;border-bottom:0\">\r\n" + 
					"			                          <tbody>\r\n" + 
					"			                            <tr>\r\n" + 
					"			                              <td valign=\"top\" style=\"padding-bottom:9px\">\r\n" + 
					"			                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\r\n" + 
					"			                                  <tbody>\r\n" + 
					"			                                    <tr>\r\n" + 
					"			                                      <td valign=\"top\">\r\n" + 
					"			                                        <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse\">\r\n" + 
					"			                                          <tbody>\r\n" + 
					"			                                            <tr>\r\n" + 
					"			                                              <td valign=\"top\" style=\"padding-top:9px;padding-right:18px;padding-bottom:9px;padding-left:18px;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px;line-height:125%;text-align:left\">\r\n" + 
					"			                                                <div style=\"text-align:center\">\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:10pt;text-align:center;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">富衛人壽保險(百慕達)有限公司</span></span></p>\r\n" + 
					"			                                                  <p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:10pt;text-align:center;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px\"><a href=\"http://www.fwd.com/hk/?utm_source=edm&amp;utm_medium=cpc&amp;utm_campaign=EDM%7CSA%7CP2%7CO2O+Access+Code&amp;utm_content=copy\" style=\"word-wrap:break-word;color:#606060;font-weight:normal;text-decoration:underline\" target=\"_blank\"><span style=\"color:#ff8c00\"><span style=\"font-family:microsoft jhenghei,calibri,sans-serif\"><span><span style=\"background-color:transparent;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">www.fwd.com.hk</span></span></span></span></a></p>\r\n" + 
					"			                                                </div>\r\n" + 
					"			                                              </td>\r\n" + 
					"			                                            </tr>\r\n" + 
					"			                                          </tbody>\r\n" + 
					"			                                        </table>\r\n" + 
					"			                                      </td>\r\n" + 
					"			                                    </tr>\r\n" + 
					"			                                  </tbody>\r\n" + 
					"			                                </table>\r\n" + 
					"			                              </td>\r\n" + 
					"			                            </tr>\r\n" + 
					"			                          </tbody>\r\n" + 
					"			                        </table>\r\n" + 
					"			                      </td>\r\n" + 
					"			                    </tr>\r\n" + 
					"			                  </tbody>\r\n" + 
					"			                </table>\r\n" + 
					"			              </td>\r\n" + 
					"			            </tr>\r\n" + 
					"			          </tbody>\r\n" + 
					"			        </table>\r\n" + 
					"			      </center>\r\n" + 
					"			    </div>\r\n" + 
					"			  </body>\r\n" + 
					"			</html>";*/
			 
			String subject = "Savie Appointment Acknowledgement email from FWD";
			String attachment = "";
			String from = UserRestURIConstants.getConfigs("innerMailFrom");
			boolean isHTML = true;
			
			org.json.simple.JSONObject parameters = new org.json.simple.JSONObject();
			parameters.put("to", to);
			parameters.put("message", message);
			parameters.put("subject", subject);
			parameters.put("attachment", attachment);
			parameters.put("from", from);
			parameters.put("isHtml", isHTML);
			
			br = connector.sendEmail(parameters,header);
		}catch(Exception e){
			logger.info("SavieServiceImpl sendAppointmentAcknowledgeMail occurs an exception!");
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		return br;
	}
	
	@Override
	public void getAppointmentAccessCode(Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {
		response.setContentType("text/json;charset=utf-8");
		String Url = UserRestURIConstants.SERVICE_URL + "/appointment/accessCode";
		String lang = UserRestURIConstants.getLanaguage(request);
		if (lang.equals("tc")) {
			lang = "CN";
		}
		
		HashMap<String, String> header = new HashMap<String, String>(COMMON_HEADERS);
		header.put("userName", "*DIRECTGI");
		header.put("token", commonUtils.getToken("reload"));
		header.put("language", WebServiceUtils.transformLanaguage(lang));
		org.json.simple.JSONObject responseJsonObj = restService.consumeApi(HttpMethod.GET,Url, header, null);
		if(responseJsonObj.get("errMsgs")==null){
			request.getSession().setAttribute("accessCode", responseJsonObj.get("accessCode"));
		}
		response.setContentType("text/json;charset=utf-8");
		try {
			logger.info(responseJsonObj.toString());
			response.getWriter().print(responseJsonObj.toString());
		}catch(Exception e) {  
			e.printStackTrace();
		}
	}
}
