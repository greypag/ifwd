package com.ifwd.fwdhk.utils.services;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.velocity.app.VelocityEngine;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Component;
import org.springframework.ui.velocity.VelocityEngineUtils;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.util.WebServiceUtils;

@Component
public class SendEmailService implements SendEmailDao {

	@Autowired
	RestServiceDao restService;

	@Autowired 
	VelocityEngine velocityEngine;
	
	@SuppressWarnings("unchecked")
	@Override
	public boolean sendEmail(String emailId, String promotionalCode,
			HashMap<String, String> header) {
		boolean result = false;
		String message = "\u60A8\u597D,<p><p>\u591A\u8B1D\u60A8\u767B\u8A18\u8A02\u95B1\u5BCC\u885B\u7684\u63A8\u5EE3\u512A\u60E0\u3001\u5347\u7D1A\u734E\u8CDE\u53CA\u516C\u53F8\u8CC7\u8A0A*\u3002\u60A8\u53EF\u4EE5\u4F7F\u7528\u63A8\u5EE3\u7DE8\u865F " + promotionalCode + " \u7372\u53D6\u7DB2\u4E0A\u6295\u4FDD\u512A\u60E0\u3002<p>"
				+ "\u5BCC\u885B\u6642\u523B\u4EE5\u5BA2\u6236\u79C1\u96B1\u70BA\u5148\uFF0C\u4F60\u53EF\u4EE5\u53C3\u95B1<a href='http://www.fwd.com.hk/zh-HK/home/pdo.html'>http://www.fwd.com.hk/zh-HK/home/pdo.html</a>\u4E86\u89E3\u6211\u5011\u7684\u500B\u4EBA\u8CC7\u6599\u4FDD\u8B77\u653F\u7B56\u3002<p>*\u8A3B: \u60A8\u53EF\u4EE5\u96A8\u6642\u81F4\u96FB3123-3123\u53D6\u6D88\u8A02\u95B1<p><p>Hi,<p><p>Thank you for registering to receive offers, upgrades and information from FWD*. You can use the promotion code " + promotionalCode + " to get discounts from online purchases.<p>FWD respects your privacy. For more information, please read our Personal Data Protection Policy at <a href='http://www.fwd.com.hk/en-US/home/pdo.html'>http://www.fwd.com.hk/en-US/home/pdo.html</a>.<p> *Note: You may unsubscribe at any time.  To unsubscribe, please call us at 3123-3123.";

		JSONObject email_params = new JSONObject();
		email_params.put("to", emailId);
		email_params.put("message", message);
		email_params.put("subject", "FWD Promotion Code");
		email_params.put("attachment", null);
		email_params.put("from", UserRestURIConstants.getConfigs("promoteMailFrom"));
		email_params.put("isHtml", true);
		
		JSONObject resp = restService.consumeApi(HttpMethod.POST,
				UserRestURIConstants.SEND_MAIL, header, email_params);
		if (resp != null) {
			if (checkJsonObjNull(resp, "errMsgs").equals("null")) {
				result = true;
			}
		}
		return result;
	}

	private String getRedPacketEmailContent(String serverUrl, String promoCode, String userName)
	{
		return "<html>" +
				"<head>" +
				"  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">" +
				"  <title><span style=\"font-family: calibri, sans-serif;\">FWD ● discover</span>優惠 A Gift from <span style=\"font-family: calibri, sans-serif;\">FWD ● discover</span> </title>" +
				"</head>" +
				"<body>" +
				"  <div marginwidth=\"0\" marginheight=\"0\" style=\"margin:0;padding:0;background-color:#f2f2f2;min-height:100%!important;width:100%!important\">" +
				"    <center>" +
				"      <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" height=\"100%\" width=\"100%\" style=\"border-collapse:collapse;margin:0;padding:0;background-color:#f2f2f2;height:100%!important;width:100%!important\">" +
				"        <tbody>" +
				"          <tr>" +
				"            <td align=\"center\" valign=\"top\" style=\"margin:0;padding:20px;border-top:0;height:100%!important;width:100%!important\">" +
				"              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;border:0\">" +
				"                <tbody>" +
				"                  <tr>" +
				"                    <td align=\"center\" valign=\"top\">" +
				"                      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;background-color:#ffffff;border-top:0;border-bottom:0\">" +
				"                        <tbody>" +
				"                          <tr>" +
				"                            <td valign=\"top\" style=\"padding-top:9px\">" +
				"                              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">" +
				"                                <tbody>" +
				"                                  <tr>" +
				"                                    <td valign=\"top\">" +
				"                                      <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"266\" style=\"border-collapse:collapse\">" +
				"                                        <tbody>" +
				"                                          <tr>" +
				"                                            <td valign=\"top\" style=\"padding-top:9px;padding-left:18px;padding-bottom:9px;padding-right:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px;line-height:125%;text-align:left\">" +
				"                                              <a href=\""+serverUrl+"/tc/?utm_source=edm&amp;utm_medium=cpc&amp;utm_campaign=EDM%7CSA%7CP2%7CO2O&#43;Appointment&#43;Confirmation&amp;utm_content=logo\" style=\"word-wrap:break-word;color:#606060;font-weight:normal;text-decoration:underline\" target=\"_blank\"><img align=\"none\" src=\"https://ci5.googleusercontent.com/proxy/pUUalkIKCfYBNDy3jLrAXaOG3fZKkCgfdmngGJRLq2z16WSbVoolnNEzM6URl0ebkOdGIJZbBsntZA4qwhNGC7iNAiEv_joIenDGsE-Lrv9ddo_wUPLfDJ7x0DolmiB-0r9la_aL9DT2iWAecsFUrfJn1VZqvuVgHQ1NeLw=s0-d-e1-ft#https://gallery.mailchimp.com/e03376087b8f7b09d66ad1fd2/images/c9050e8a-40a3-451c-ad15-4fcd44856132.jpg\" style=\"margin:0px;border:0;outline:none;text-decoration:none;min-height:auto!important\" class=\"CToWUd\">" +
				"                                              </a>" +
				"                                            </td>" +
				"                                          </tr>" +
				"                                        </tbody>" +
				"                                      </table>" +
				"                                      <table align=\"right\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"297\" style=\"border-collapse:collapse\">" +
				"                                        <tbody>" +
				"                                          <tr>" +
				"                                            <td valign=\"top\" style=\"padding-top:9px;padding-right:18px;padding-bottom:9px;padding-left:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px;line-height:125%;text-align:left\">" +
				"                                              <div style=\"text-align:right\">" +
				"                                                <br> </div>" +
				"                                            </td>" +
				"                                          </tr>" +
				"                                        </tbody>" +
				"                                      </table>" +
				"                                    </td>" +
				"                                  </tr>" +
				"                                </tbody>" +
				"                              </table>" +
				"                            </td>" +
				"                          </tr>" +
				"                        </tbody>" +
				"                      </table>" +
				"                    </td>" +
				"                  </tr>" +
				"                  <tr>" +
				"                    <td align=\"center\" valign=\"top\">" +
				"                      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;background-color:#ffffff;border-top:0;border-bottom:0\">" +
				"                        <tbody>" +
				"                          <tr>" +
				"                            <td valign=\"top\">" +
				"                              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">" +
				"                                <tbody>" +
				"                                  <tr>" +
				"                                    <td valign=\"top\">" +
				"                                      <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse\">" +
				"                                        <tbody>" +
				"                                          <tr>" +
				"                                            <td valign=\"top\" style=\"padding:9px 18px;line-height:125%;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px;text-align:left\">" +
				"                                              <div style=\"text-align:center\">" +
				"                                                <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">Dear "+userName+",</span></span>" +
				"                                                </p>" +
				"                                                <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">Congratulations! You have successfully redeemed the reward from <span style=\"font-family: calibri, sans-serif;\">FWD ● discover</span>.<br><br>Reward: HK$500 premium voucher<br>Designated Product: Savie Insurance Plan (Monthly Regular Contribution payment mode)<br><br>Reference code: "+promoCode+"<br><br>Expiry Date: 31 Mar 2016<br><br>Instruction:<p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">Please make an appointment through our i.FWD website at <a href=\""+serverUrl+"/en/savings-insurance/regular-premium\">https://i.fwd.com.hk/en/savings-insurance/regular-premium</a> to visit one of our customer services centres with a copy of this email. During the appointment, FWD shall conduct a simple financial needs analysis to assess your suitability for the Designated Product. Once it is confirmed that the Designated Product meets your objective(s) and need(s), you may present this email to obtain a one-off HK$500 premium discount on the first premium payment. The first premium payment must be paid by your personal cheque or Bank of Communications FWD Credit Card. Please refer to the <a href=\""+serverUrl+"/resources/policy-provisions-pdf/FWDiscover_savie_premium_2016.pdf\">Terms and Conditions</a>. <br><br>To enjoy this reward, the application for the Designated Product must be submitted before the Expiry Date.<br><br>We look forward to providing more discounts and promotions through <span style=\"font-family: calibri, sans-serif;\">FWD ● discover</span>. <br><br>For any enquiries, please contact us at (852) 3123 3123 or via email at <a href=\"iService.hk@fwd.com\">iService.hk@fwd.com</a>.<p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">Yours Sincerely,<br>Fanny                                </span></span></p><p>&nbsp;</p>                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">恭喜您成功於<span style=\"font-family: calibri, sans-serif;\">FWD ● discover</span>獲取獎賞!<br><br>獎賞：港幣500元保費現金券<br>指定產品：自助息理財壽險計劃(只限以每月繳付保費形式)由富衛人壽保險（百慕達）有限公司所承保<br>推廣编號： "+promoCode+"<br>有效日期：31 Mar 2016 <br><br>說明：<br><p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">您只須於有效日期前到i.FWD網頁<a href=\""+serverUrl+"/tc/savings-insurance/regular-premium\">https://i.fwd.com.hk/tc/savings-insurance/regular-premium</a>預約時間帶同此電郵之列印本親臨富衛保險任何一個客戶服務中心。會面當日，富衛保險將為您進行簡單財務需要分析以了解指定產品是否適合您的需要；如指定產品適合您的目標及需要，您便可立刻申請投保並出示FWD ● discover電郵享受一次性港幣500元的首次保費折扣，而首次保費須以您的個人支票或交通銀行FWD 富衛信用卡支付。請瀏覽有關<a href=\""+serverUrl+"/resources/policy-provisions-pdf/FWDiscover_savie_premium_2016.pdf\">條款及細則</a>。<br><br>請於獎賞的有效日期前遞交申請以享用此獎賞。<br><br>富衛期待透過<span style=\"font-family: calibri, sans-serif;\"><span style=\"font-family: calibri, sans-serif;\">FWD ● discover</span></span>為您提供更多折扣和優惠。<br><br>如有任何查詢，請致電富衛客戶服務熱線 (852) 3123 3123 或電郵至 <a href=\"mailto:iService.hk@fwd.com\">iService.hk@fwd.com</a>.                                                    <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">此致<br>Fanny                                </tbody>                              </table>                              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">                                <tbody>                                  <tr>                                    <td style=\"padding:18px\">                                      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-top-width:1px;border-top-style:dotted;border-top-color:#999999;border-collapse:collapse\">                                        <tbody>                                          <tr>                                            <td>                                            </td>                                          </tr>                                        </tbody>                                      </table>                                    </td>                                  </tr>                                </tbody>                              </table>                              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">                                <tbody>                                  <tr>                                    <td valign=\"top\">                                      <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse\">                                        <tbody>                                          <tr>                                            <td valign=\"top\" style=\"padding-top:9px;padding-right:18px;padding-bottom:9px;padding-left:18px;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px;line-height:150%;text-align:left\">                                                <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">Remarks: In case of discrepancies between the English and Chinese versions, English version shall prevail. <br><br>This is an automatically generated email, please do not reply. <br><br>You need Adobe Acrobat Reader to view / print the pdf file, the Reader can be downloaded for free at <body><a href=\"http://www.adobe.com/products/acrobat/readstep.html\">http://www.adobe.com/products/acrobat/readstep.html</a>. </p>                                                <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">備註：中英文本如有歧異，概以英文本為準。<br><br>此乃電腦發出之電子郵件，請不要回覆。<br><br>附載文件適用於 Acrobat 7.0 版本軟體瀏覽。請於此網站 <body><a href=\"http://www.adobe.com/products/acrobat/readstep.html\">http://www.adobe.com/products/acrobat/readstep.html</a> 免費下載 Adobe Reader以瀏覽 / 列印此pdf 文件。</p>                                            </td>                                          </tr>                                        </tbody>                                      </table>                                    </td>                                  </tr>                                </tbody>                              </table>                              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">                                <tbody>                                  <tr>                                    <td valign=\"top\">                                      <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse\">                                        <tbody>                                            </td>                                          </tr>                                        </tbody>                                      </table>                                    </td>                                  </tr>                                </tbody>                              </table>                              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">                                <tbody>                                  <tr>                                    <td style=\"padding:18px\">                                      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-top-width:1px;border-top-style:dotted;border-top-color:#999999;border-collapse:collapse\">                                        <tbody>                                          <tr>                                            <td>                                              <span></span> </td>" +
				"                                          </tr>" +
				"                                        </tbody>" +
				"                                      </table>" +
				"                                    </td>" +
				"                                  </tr>" +
				"                                </tbody>" +
				"                              </table>" +
				"                            </td>" +
				"                          </tr>" +
				"                        </tbody>" +
				"                      </table>" +
				"                    </td>" +
				"                  </tr>" +
				"                  <tr>" +
				"                    <td align=\"center\" valign=\"top\">" +
				"                      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;background-color:#ffffff;border-top:0;border-bottom:0\">" +
				"                        <tbody>" +
				"                          <tr>" +
				"                            <td valign=\"top\" style=\"padding-bottom:9px\">" +
				"                              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">" +
				"                                <tbody>" +
				"                                  <tr>" +
				"                                    <td valign=\"top\">" +
				"                                      <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse\">" +
				"                                        <tbody>" +
				"                                          <tr>" +
				"                                            <td valign=\"top\" style=\"padding-top:9px;padding-right:18px;padding-bottom:9px;padding-left:18px;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px;line-height:125%;text-align:left\">" +
				"                                              <div style=\"text-align:center\">" +
				"                                                <p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:10pt;text-align:center;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">富衛人壽保險(百慕達)有限公司</span></span>" +
				"                                                </p>" +
				"                                                <p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:10pt;text-align:center;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px\"><a href=\"http://www.fwd.com/hk/?utm_source=edm&amp;utm_medium=cpc&amp;utm_campaign=EDM%7CSA%7CP2%7CO2O&#43;Access&#43;Code&amp;utm_content=copy\" style=\"word-wrap:break-word;color:#606060;font-weight:normal;text-decoration:underline\" target=\"_blank\"><span style=\"color:#ff8c00\"><span style=\"font-family:microsoft jhenghei,calibri,sans-serif\"><span><span style=\"background-color:transparent;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">www.fwd.com.hk</span></span></span></span></a>" +
				"                                                </p>" +
				"                                              </div>" +
				"                                            </td>" +
				"                                          </tr>" +
				"                                        </tbody>" +
				"                                      </table>" +
				"                                    </td>" +
				"                                  </tr>" +
				"                                </tbody>" +
				"                              </table>" +
				"                            </td>" +
				"                          </tr>" +
				"                        </tbody>" +
				"                      </table>" +
				"                    </td>" +
				"                  </tr>" +
				"                </tbody>" +
				"              </table>" +
				"            </td>" +
				"          </tr>" +
				"        </tbody>" +
				"      </table>" +
				"    </center>" +
				"    </div>" +
				"</body>" +
				"<br clear=\"both\">" +
				"</html>";
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public boolean sendEmailByDiscover(String offername, String username,
			String discount, String planName, String code, String date, String emailId,
			HashMap<String, String> header, HttpServletRequest request, String tnc) {
		boolean result = false;
		
		String serverUrl = request.getScheme()+"://"+request.getServerName()+request.getContextPath();
		if (request.getServerPort() != 80 && request.getServerPort() != 443)
		{
			serverUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
		}

		String message = null;
		String subject = null;
		
		if (offername.equals("Fanfare.offername5")) {
			subject = "A Gift from FWD ● discover!";
			message = getRedPacketEmailContent(serverUrl, code, username);
		} else if (offername.equals("Fanfare.offername6")
				|| offername.equals("Fanfare.offername7")
				|| offername.equals("Fanfare.offername8")
				|| offername.equals("Fanfare.offername9")
				|| offername.equals("Fanfare.offername10")) {
			String template = "mail-templates/fwddiscover-hotelVoucher-confirmation.vm";
			final Map<String,Object> model = new HashMap<>();
			String rewardNameEn = null;
			String rewardNameCh = null;
			String hotelUrl = null;
			String hotelNameEn = null;
			String hotelNameCh = null;
			String referenceCode = null;
			String expiryDate = null;			
			
			if (offername.equals("Fanfare.offername6")) {
				rewardNameEn = "3 Days / 2 Nights Stay in an Executive Deluxe Room with Breakfast for Two Persons";
				rewardNameCh = "行政豪華房3日2夜的住宿及2份早餐";
				hotelUrl = "http://www.oneworldhotel.com.my/";
				hotelNameEn = "One World Hotel";
				hotelNameCh = "世界酒店";
				referenceCode = "89811";
				expiryDate = "06-04-2016";
			} else if (offername.equals("Fanfare.offername7")) {
				rewardNameEn = "3 Days / 2 Nights Stay in a Standard Room with Breakfast";
				rewardNameCh = "標準房3日2夜的住宿及早餐";
				hotelUrl = "http://www.vivatel.com.my/";
				hotelNameEn = "Vivatel Kuala Lumpur";
				hotelNameCh = "吉隆坡輝煌酒店";
				referenceCode = "398975";
				expiryDate = "07-04-2016";
			} else if (offername.equals("Fanfare.offername8")) {
				rewardNameEn = "3 Days / 2 Nights Stay in a Deluxe Garden View Room with Buffet Breakfast for Two Persons";
				rewardNameCh = "豪華園景房3日2夜的住宿及2份自助早餐";
				hotelUrl = "http://www.shangri-la.com/penang/rasasayangresort/";
				hotelNameEn = "Shangri-La's Rasa Sayang Resort & Spa, Penang";
				hotelNameCh = "檳城香格里拉沙洋度假酒店";
				referenceCode = "10468";
				expiryDate = "08-04-2016";
			} else if (offername.equals("Fanfare.offername9")) {
				rewardNameEn = "3 Days / 2 Nights Stay in a Deluxe Seafacing Room with Buffet Breakfast for Two Persons";
				rewardNameCh = "豪華海景房3日2夜的住宿及2份自助早餐";
				hotelUrl = "http://www.shangri-la.com/penang/goldensandsresort/";
				hotelNameEn = "Golden Sands Resort, Penang";
				hotelNameCh = "檳城香格里拉金色海灘度假村";
				referenceCode = "10466";
				expiryDate = "09-04-2016";
			} else if (offername.equals("Fanfare.offername10")) {
				rewardNameEn = "3 Days / 2 Nights Stay in Traders Twins Towers View Suite for Two Persons";
				rewardNameCh = "雙子塔景套房3日2夜的住宿";
				hotelUrl = "http://www.shangri-la.com/traders/";
				hotelNameEn = "Traders Hotels by Shangri-La";
				hotelNameCh = "吉隆坡商貿飯店";
				referenceCode = "72006";
				expiryDate = "10-04-2016";
			}
			model.put("userName", username);
			model.put("rewardNameEn", rewardNameEn);
			model.put("rewardNameCh", rewardNameCh);
			model.put("hotelUrl", hotelUrl);
			model.put("hotelNameEn", hotelNameEn);
			model.put("hotelNameCh", hotelNameCh);
			model.put("referenceCode", referenceCode);
			model.put("expiryDate", expiryDate);
			
			subject = "A Gift from FWD ● discover!";
			message = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, template, "UTF-8", model);			
		} else {
			String planName_ch = WebServiceUtils.getMessage(planName, "tc");
			String planName_en = WebServiceUtils.getMessage(planName, "EN");
			String offerName_ch = WebServiceUtils.getMessage(offername, "tc");
			String offerName_en = WebServiceUtils.getMessage(offername, "EN");
			
			String tnc_ch = WebServiceUtils.getMessage(tnc, "tc");
			String tnc_en = WebServiceUtils.getMessage(tnc, "EN");
			
			String discount_ch = WebServiceUtils.getMessage(discount, "tc");
			String discount_en = WebServiceUtils.getMessage(discount, "EN");

			subject = "A Gift from FWD ● discover!";
			message = "<html>"+
						 "<head>"+
						 "  <meta charset=\"UTF-8\">"+
						 "  <title><span style=\"font-family: calibri, sans-serif;\">FWD ● discover</span>優惠 A Gift from <span style=\"font-family: calibri, sans-serif;\">FWD ● discover</span></title>"+
						 "</head>"+
						 "<body>"+
						 "  <div marginwidth=\"0\" marginheight=\"0\" style=\"margin:0;padding:0;background-color:#f2f2f2;min-height:100%!important;width:100%!important\">"+
						 "    <center>"+
						 "      <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" height=\"100%\" width=\"100%\" style=\"border-collapse:collapse;margin:0;padding:0;background-color:#f2f2f2;height:100%!important;width:100%!important\">"+
						 "        <tbody>"+
						 "          <tr>"+
						 "            <td align=\"center\" valign=\"top\" style=\"margin:0;padding:20px;border-top:0;height:100%!important;width:100%!important\">"+
						 "              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;border:0\">"+
						 "                <tbody>"+
						 "                  <tr>"+
						 "                    <td align=\"center\" valign=\"top\">"+
						 "                      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;background-color:#ffffff;border-top:0;border-bottom:0\">"+
						 "                        <tbody>"+
						 "                          <tr>"+
						 "                            <td valign=\"top\" style=\"padding-top:9px\">"+
						 "                              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">"+
						 "                                <tbody>"+
						 "                                  <tr>"+
						 "                                    <td valign=\"top\">"+
						 "                                      <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"266\" style=\"border-collapse:collapse\">"+
						 "                                        <tbody>"+
						 "                                          <tr>"+
						 "                                            <td valign=\"top\" style=\"padding-top:9px;padding-left:18px;padding-bottom:9px;padding-right:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px;line-height:125%;text-align:left\">"+
						 "                                              <a href=\"" + serverUrl + "/tc/?utm_source=edm&amp;utm_medium=cpc&amp;utm_campaign=EDM%7CSA%7CP2%7CO2O+Appointment+Confirmation&amp;utm_content=logo\" style=\"word-wrap:break-word;color:#606060;font-weight:normal;text-decoration:underline\" target=\"_blank\"><img align=\"none\" src=\"https://ci5.googleusercontent.com/proxy/pUUalkIKCfYBNDy3jLrAXaOG3fZKkCgfdmngGJRLq2z16WSbVoolnNEzM6URl0ebkOdGIJZbBsntZA4qwhNGC7iNAiEv_joIenDGsE-Lrv9ddo_wUPLfDJ7x0DolmiB-0r9la_aL9DT2iWAecsFUrfJn1VZqvuVgHQ1NeLw=s0-d-e1-ft#https://gallery.mailchimp.com/e03376087b8f7b09d66ad1fd2/images/c9050e8a-40a3-451c-ad15-4fcd44856132.jpg\" style=\"margin:0px;border:0;outline:none;text-decoration:none;min-height:auto!important\" class=\"CToWUd\"></a>"+
						 "                                            </td>"+
						 "                                          </tr>"+
						 "                                        </tbody>"+
						 "                                      </table>"+
						 "                                      <table align=\"right\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"297\" style=\"border-collapse:collapse\">"+
						 "                                        <tbody>"+
						 "                                          <tr>"+
						 "                                            <td valign=\"top\" style=\"padding-top:9px;padding-right:18px;padding-bottom:9px;padding-left:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px;line-height:125%;text-align:left\">"+
						 "                                              <div style=\"text-align:right\"><br>"+
						 "                                              </div>"+
						 "                                            </td>"+
						 "                                          </tr>"+
						 "                                        </tbody>"+
						 "                                      </table>"+
						 "                                    </td>"+
						 "                                  </tr>"+
						 "                                </tbody>"+
						 "                              </table>"+
						 "                            </td>"+
						 "                          </tr>"+
						 "                        </tbody>"+
						 "                      </table>"+
						 "                    </td>"+
						 "                  </tr>"+
						 "                  <tr>"+
						 "                    <td align=\"center\" valign=\"top\">"+
						 "                      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;background-color:#ffffff;border-top:0;border-bottom:0\">"+
						 "                        <tbody>"+
						 "                          <tr>"+
						 "                            <td valign=\"top\">"+
						 "                              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">"+
						 "                                <tbody>"+
						 "                                  <tr>"+
						 "                                    <td valign=\"top\">"+
						 "                                      <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse\">"+
						 "                                        <tbody>"+
						 "                                          <tr>"+
						 "                                            <td valign=\"top\" style=\"padding:9px 18px;line-height:125%;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px;text-align:left\">"+
						 "                                              <div style=\"text-align:center\">"+
						 "                                                <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">Dear " + username +",</span></span></p>"+
						 "                                                <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">Congratulations! You have successfully redeemed your promotion code for " + offerName_en + " from <span style=\"font-family: calibri, sans-serif;\">FWD ● discover</span>.</br></br>Discount: "+ discount_en +"</br>Designated Product: " + planName_en + "</br>Promotion code: " + code + "</br>Expiry Date: "+ date +
						 "                                                <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">You may enter the promotion code on <a href=\"" + serverUrl + "/en\">i.fwd.com.hk</a> to purchase the designated product on or before the expiry date. Please refer to the <a href=\"" + serverUrl + tnc_en + "\">Terms and Conditions</a>. </br></br>Stay tuned to <a href=\"" + serverUrl + "/en/fwdiscover\"><span style=\"font-family: calibri, sans-serif;\">FWD ● discover</span></a> for more offers. For any enquiries, please contact us at +85231233123 or via email at <a href=\"iService.hk@fwd.com\">iService.hk@fwd.com</a>."+ 
						 "                                                    <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">恭喜您成功於<span style=\"font-family: calibri, sans-serif;\">FWD ● discover</span>獲取"+ offerName_ch +" 的推廣编號。</br></br>折扣："+ discount_ch +"</br>指定產品：" + planName_ch + "</br>推廣编號： " + code + "</br>有效日期："+ date +
						 "                                                    <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">您可在有效日期或之前於<a href=\"" + serverUrl + "\">i.fwd.com.hk</a>輸入推廣编號以購買指定產品。請瀏覽有關<a href=\"" + serverUrl + tnc_ch + "\">條款及細則</a>。</br></br>敬請密切留意<a href=\"" + serverUrl + "/tc/fwdiscover\"><span style=\"font-family: calibri, sans-serif;\">FWD ● discover</span></a> 以盡享更多優惠。如有任何查詢，請致電富衛客戶服務熱線 (852) 3123 3123 或電郵至 <a href=\"mailto:iService.hk@fwd.com\">iService.hk@fwd.com</a>."+
						 "                                                    <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">此致</br>Fanny"+ 
						 "                                </tbody>"+
						 "                              </table>"+
						 "                              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">"+
						 "                                <tbody>"+
						 "                                  <tr>"+
						 "                                    <td style=\"padding:18px\">"+
						 "                                      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-top-width:1px;border-top-style:dotted;border-top-color:#999999;border-collapse:collapse\">"+
						 "                                        <tbody>"+
						 "                                          <tr>"+
						 "                                            <td>"+
						 "                                            </td>"+
						 "                                          </tr>"+
						 "                                        </tbody>"+
						 "                                      </table>"+
						 "                                    </td>"+
						 "                                  </tr>"+
						 "                                </tbody>"+
						 "                              </table>"+
						 "                              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">"+
						 "                                <tbody>"+
						 "                                  <tr>"+
						 "                                    <td valign=\"top\">"+
						 "                                      <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse\">"+
						 "                                        <tbody>"+
						 "                                          <tr>"+
						 "                                            <td valign=\"top\" style=\"padding-top:9px;padding-right:18px;padding-bottom:9px;padding-left:18px;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px;line-height:150%;text-align:left\">"+
						 "                                                <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">Remarks: In case of discrepancies between the English and Chinese versions, English version shall prevail. </br></br>This is an automatically generated email, please do not reply. </br></br>You need Adobe Acrobat Reader to view / print the pdf file, the Reader can be downloaded for free at <body><a href=\"http://www.adobe.com/products/acrobat/readstep.html\">http://www.adobe.com/products/acrobat/readstep.html</a>. </p>"+
						 "                                                <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">備註：中英文本如有歧異，概以英文本為準。</br></br>此乃電腦發出之電子郵件，請不要回覆。</br></br>附載文件適用於 Acrobat 7.0 版本軟體瀏覽。請於此網站 <body><a href=\"http://www.adobe.com/products/acrobat/readstep.html\">http://www.adobe.com/products/acrobat/readstep.html</a> 免費下載 Adobe Reader以瀏覽 / 列印此pdf 文件。</p>"+
						 "                                            </td>"+
						 "                                          </tr>"+
						 "                                        </tbody>"+
						 "                                      </table>"+
						 "                                    </td>"+
						 "                                  </tr>"+
						 "                                </tbody>"+
						 "                              </table>"+
						 "                              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">"+
						 "                                <tbody>"+
						 "                                  <tr>"+
						 "                                    <td valign=\"top\">"+
						 "                                      <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse\">"+
						 "                                        <tbody>"+
						 "                                            </td>"+
						 "                                          </tr>"+
						 "                                        </tbody>"+
						 "                                      </table>"+
						 "                                    </td>"+
						 "                                  </tr>"+
						 "                                </tbody>"+
						 "                              </table>"+
						 "                              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">"+
						 "                                <tbody>"+
						 "                                  <tr>"+
						 "                                    <td style=\"padding:18px\">"+
						 "                                      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-top-width:1px;border-top-style:dotted;border-top-color:#999999;border-collapse:collapse\">"+
						 "                                        <tbody>"+
						 "                                          <tr>"+
						 "                                            <td>"+
						 "                                              <span></span>"+
						 "                                            </td>"+
						 "                                          </tr>"+
						 "                                        </tbody>"+
						 "                                      </table>"+
						 "                                    </td>"+
						 "                                  </tr>"+
						 "                                </tbody>"+
						 "                              </table>"+
						 "                            </td>"+
						 "                          </tr>"+
						 "                        </tbody>"+
						 "                      </table>"+
						 "                    </td>"+
						 "                  </tr>"+
						 "                  <tr>"+
						 "                    <td align=\"center\" valign=\"top\">"+
						 "                      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;background-color:#ffffff;border-top:0;border-bottom:0\">"+
						 "                        <tbody>"+
						 "                          <tr>"+
						 "                            <td valign=\"top\" style=\"padding-bottom:9px\">"+
						 "                              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">"+
						 "                                <tbody>"+
						 "                                  <tr>"+
						 "                                    <td valign=\"top\">"+
						 "                                      <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse\">"+
						 "                                        <tbody>"+
						 "                                          <tr>"+
						 "                                            <td valign=\"top\" style=\"padding-top:9px;padding-right:18px;padding-bottom:9px;padding-left:18px;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px;line-height:125%;text-align:left\">"+
						 "                                              <div style=\"text-align:center\">"+
						 "                                                <p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:10pt;text-align:center;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">富衛人壽保險(百慕達)有限公司</span></span></p>"+
						 "                                                <p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:10pt;text-align:center;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px\"><a href=\"http://www.fwd.com/hk/?utm_source=edm&amp;utm_medium=cpc&amp;utm_campaign=EDM%7CSA%7CP2%7CO2O+Access+Code&amp;utm_content=copy\" style=\"word-wrap:break-word;color:#606060;font-weight:normal;text-decoration:underline\" target=\"_blank\"><span style=\"color:#ff8c00\"><span style=\"font-family:microsoft jhenghei,calibri,sans-serif\"><span><span style=\"background-color:transparent;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">www.fwd.com.hk</span></span></span></span></a></p>"+
						 "                                              </div>"+
						 "                                            </td>"+
						 "                                          </tr>"+
						 "                                        </tbody>"+
						 "                                      </table>"+
						 "                                    </td>"+
						 "                                  </tr>"+
						 "                                </tbody>"+
						 "                              </table>"+
						 "                            </td>"+
						 "                          </tr>"+
						 "                        </tbody>"+
						 "                      </table>"+
						 "                    </td>"+
						 "                  </tr>"+
						 "                </tbody>"+
						 "              </table>"+
						 "            </td>"+
						 "          </tr>"+
						 "        </tbody>"+
						 "      </table>"+
						 "    </center>"+
						 "  </div>"+
						 "</body>"+
						"</html>";
		}
		
		
								      
		JSONObject email_params = new JSONObject();
		email_params.put("to", emailId);
		email_params.put("message", message);
		email_params.put("subject", subject);
		email_params.put("attachment", null);
		email_params.put("from", UserRestURIConstants.getConfigs("innerMailFrom"));
		email_params.put("isHtml", true);
		
		JSONObject resp = restService.consumeApi(HttpMethod.POST,
				UserRestURIConstants.SEND_MAIL, header, email_params);
		if (resp != null) {
			if (checkJsonObjNull(resp, "errMsgs").equals("null")) {
				result = true;
			}
		}
		
		if (offername.equals("Fanfare.offername6")
				|| offername.equals("Fanfare.offername7")
				|| offername.equals("Fanfare.offername8")
				|| offername.equals("Fanfare.offername9")
				|| offername.equals("Fanfare.offername10")) {
			email_params = new JSONObject();
			email_params.put("to", "alex.sk.hui@fwd.com");
			email_params.put("message", message);
			email_params.put("subject", "copy:"+subject);
			email_params.put("attachment", null);
			email_params.put("from", UserRestURIConstants.getConfigs("innerMailFrom"));
			email_params.put("isHtml", true);
			
			resp = restService.consumeApi(HttpMethod.POST,
					UserRestURIConstants.SEND_MAIL, header, email_params);
			
			email_params = new JSONObject();
			email_params.put("to", "lisa.d.cheung@fwd.com");
			email_params.put("message", message);
			email_params.put("subject", "copy:"+subject);
			email_params.put("attachment", null);
			email_params.put("from", UserRestURIConstants.getConfigs("innerMailFrom"));
			email_params.put("isHtml", true);
			
			resp = restService.consumeApi(HttpMethod.POST,
					UserRestURIConstants.SEND_MAIL, header, email_params);			
		}
		
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean sendY5buddyEmail(HttpServletRequest request, String recipientEmail, HashMap<String, String> header) {
		boolean result = false;		
		
		String serverUrl = request.getScheme()+"://"+request.getServerName()+request.getContextPath();
		if (request.getServerPort() != 80 && request.getServerPort() != 443)
		{
			serverUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
		}
		
        String message = "<html>" +
        		"  <head>" +
        		"    <meta charset=\"UTF-8\">" +
        		"    <title>FWD FlightCare - Certificate no.[reference number]</title>" +
        		"  </head>" +
        		"  <body>" +
        		"    <div marginwidth=\"0\" marginheight=\"0\" style=\"margin:0;padding:0;background-color:#f2f2f2;min-height:100%!important;width:100%!important\">" +
        		"      <center>" +
        		"        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" height=\"100%\" width=\"100%\" style=\"border-collapse:collapse;margin:0;padding:0;background-color:#f2f2f2;height:100%!important;width:100%!important\">" +
        		"          <tbody>" +
        		"            <tr>" +
        		"              <td align=\"center\" valign=\"top\" style=\"margin:0;padding:20px;border-top:0;height:100%!important;width:100%!important\">" +
        		"                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;border:0\">" +
        		"                  <tbody>" +
        		"                    <tr>" +
        		"                      <td align=\"center\" valign=\"top\">" +
        		"                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;background-color:#ffffff;border-top:0;border-bottom:0\">" +
        		"                          <tbody>" +
        		"                            <tr>" +
        		"                              <td valign=\"top\" style=\"padding-top:9px\">" +
        		"                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">" +
        		"                                  <tbody>" +
        		"                                    <tr>" +
        		"                                      <td valign=\"top\">" +
        		"                                        <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"266\" style=\"border-collapse:collapse\">" +
        		"                                          <tbody>" +
        		"                                            <tr>" +
        		"                                              <td valign=\"top\" style=\"padding-top:9px;padding-left:18px;padding-bottom:9px;padding-right:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px;line-height:125%;text-align:left\">" +
        		"                                                <a href=\""+serverUrl+"/tc/\" style=\"word-wrap:break-word;color:#606060;font-weight:normal;text-decoration:underline\" target=\"_blank\"><img align=\"none\" src=\""+serverUrl+"/resources/images/fwd-email-logo.jpg\" style=\"margin:0px;border:0;outline:none;text-decoration:none;min-height:auto!important\" class=\"CToWUd\"></a>" +
        		"                                              </td>" +
        		"                                            </tr>" +
        		"                                          </tbody>" +
        		"                                        </table>" +
        		"                                        <table align=\"right\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"297\" style=\"border-collapse:collapse\">" +
        		"                                          <tbody>" +
        		"                                            <tr>" +
        		"                                              <td valign=\"top\" style=\"padding-top:9px;padding-right:18px;padding-bottom:9px;padding-left:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px;line-height:125%;text-align:left\">" +
        		"                                                <div style=\"text-align:right\"><br>" +
        		"                                                </div>" +
        		"                                              </td>" +
        		"                                            </tr>" +
        		"                                          </tbody>" +
        		"                                        </table>" +
        		"                                      </td>" +
        		"                                    </tr>" +
        		"                                  </tbody>" +
        		"                                </table>" +
        		"                              </td>" +
        		"                            </tr>" +
        		"                          </tbody>" +
        		"                        </table>" +
        		"                      </td>" +
        		"                    </tr>" +
        		"                    <tr>" +
        		"                      <td align=\"center\" valign=\"top\">" +
        		"                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;background-color:#ffffff;border-top:0;border-bottom:0\">" +
        		"                          <tbody>" +
        		"                            <tr>" +
        		"                              <td valign=\"top\">" +
        		"                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">" +
        		"                                  <tbody>" +
        		"                                    <tr>" +
        		"                                      <td valign=\"top\" style=\"padding:0px\">" +
        		"                                        <table align=\"left\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse\">" +
        		"                                          <tbody>" +
        		"                                            <tr>" +
        		"                                              <td valign=\"top\" style=\"padding-right:0px;padding-left:0px;padding-top:0;padding-bottom:0;text-align:center\">" +
        		"                                               " +
        		"                                                <div class=\"a6S\" dir=\"ltr\" style=\"opacity: 0.01; left: 572px; top: 311px;\">" +
        		"                                                  <div id=\":sw\" class=\"T-I J-J5-Ji aQv T-I-ax7 L3 a5q\" role=\"button\" tabindex=\"0\" aria-label=\"Download attachment \" data-tooltip-class=\"a1V\" data-tooltip=\"Download\">" +
        		"                                                    <div class=\"aSK J-J5-Ji aYr\"></div>" +
        		"                                                  </div>" +
        		"                                                </div>" +
        		"                                              </td>" +
        		"                                            </tr>" +
        		"                                          </tbody>" +
        		"                                        </table>" +
        		"                                      </td>" +
        		"                                    </tr>" +
        		"                                  </tbody>" +
        		"                                </table>" +
        		"                              </td>" +
        		"                            </tr>" +
        		"                          </tbody>" +
        		"                        </table>" +
        		"                      </td>" +
        		"                    </tr>" +
        		"                    <tr>" +
        		"                      <td align=\"center\" valign=\"top\">" +
        		"                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;background-color:#ffffff;border-top:0;border-bottom:0\">" +
        		"                          <tbody>" +
        		"                            <tr>" +
        		"                              <td valign=\"top\">" +
        		"                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">" +
        		"                                  <tbody>" +
        		"                                    <tr>" +
        		"                                      <td valign=\"top\">" +
        		"                                        <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse\">" +
        		"                                          <tbody>" +
        		"                                            <tr>" +
        		"                                              <td valign=\"top\" style=\"padding:9px 18px;line-height:125%;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px;text-align:left\">" +
        		"                                                <div style=\"text-align:center\">" +
        		"                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">Dear Valued Customer,</span></span></p>" +
        		"                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">Thank you for purchasing FWD TravelCare Insurance Plan via online. We are pleased to offer you an exclusive reward on 3-day free pocket wifi rental from <a href=\"http://www.y5buddy.com/index.php?lang=1\" target=\"_blank\">Y5Buddy</a> during the redemption period*, subject to the <a href=\""+serverUrl+"/resources/IFWD_Y5Buddy_Promotion.pdf\" target=\"_blank\">Terms and Conditions</a>. Click <a href=\""+serverUrl+"/resources/IFWD_Y5Buddy_Promotion.pdf\" target=\"_blank\">here</a> for details of rental instructions.</p>" +
        		"                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">多謝您經網上購買富衛旅遊保險。您可於換領期*內到<a href=\"http://www.y5buddy.com/index.php?lang=1\" target=\"_blank\">Y5Buddy</a>，即可免費租用3天流動Wi-Fi數據機，獎賞受<a href=\""+serverUrl+"/resources/IFWD_Y5Buddy_Promotion.pdf\" target=\"_blank\">條款及細則</a>所限。有關租用詳情請<a href=\""+serverUrl+"/resources/IFWD_Y5Buddy_Promotion.pdf\" target=\"_blank\">按此</a>。</p>&nbsp;" +
        		"                                                  <p dir=\"ltr\" style=\"line-height:180%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">*Redemption Period:  16 November 2015 – 31 December 2015<br>*換領期: 2015年11月16日至2015年12月31日</p>&nbsp;" +
        		"                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">Have a nice trip!</p>" +
        		"                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">祝閣下旅途愉快！ </p>&nbsp;" +
        		"                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">Yours Sincerely,<br>此致</span></span>" +
        		"                                                  </p>" +
        		"                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">Fanny from FWD</span></span>" +
        		"                                                  </p>   " +
        		"                                                   <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">FWD General Insurance Company Limited<br>富衛保險有限公司謹啟<br><a href=\"http://www.fwd.com.hk/\" target=\"_blank\">www.fwd.com.hk</a></span></span>" +
        		"                                                  </p> &nbsp;   " +
        		"                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">For enquiry，please contact our FWD 24 hours Customer Service Hotline at (852) 3123 3123 or via email at <a href=\"mailto:iService.hk@fwd.com\">iService.hk@fwd.com</a>.</p>" +
        		"                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">如有任何查詢，請致電富衛24小時客戶服務熱線(852) 3123 3123或電郵至<a href=\"mailto:iService.hk@fwd.com\">iService.hk@fwd.com</a>。</p>" +
        		"                                                </div>" +
        		"                                              </td>" +
        		"                                            </tr>" +
        		"                                          </tbody>" +
        		"                                        </table>" +
        		"                                      </td>" +
        		"                                    </tr>" +
        		"                                  </tbody>" +
        		"                                </table>" +
        		"                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">" +
        		"                                  <tbody>" +
        		"                                    <tr>" +
        		"                                      <td style=\"padding:18px\">" +
        		"                                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-top-width:1px;border-top-style:dotted;border-top-color:#999999;border-collapse:collapse\">" +
        		"                                          <tbody>" +
        		"                                            <tr>" +
        		"                                              <td>" +
        		"                                                <span></span>" +
        		"                                              </td>" +
        		"                                            </tr>" +
        		"                                          </tbody>" +
        		"                                        </table>" +
        		"                                      </td>" +
        		"                                    </tr>" +
        		"                                  </tbody>" +
        		"                                </table>" +
        		"                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">" +
        		"                                  <tbody>" +
        		"                                    <tr>" +
        		"                                      <td valign=\"top\">" +
        		"                                        <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse\">" +
        		"                                          <tbody>" +
        		"                                            <tr>" +
        		"                                              <td valign=\"top\" style=\"padding-top:9px;padding-right:18px;padding-bottom:9px;padding-left:18px;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px;line-height:150%;text-align:left\">" +
        		"                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">Remarks:<ol><li>FWD is not affiliated, associated, authorized, endorsed by, or in any way officially connected with Y5buddy, or any of its subsidiaries or its affiliates. The official Y5buddy website is available at <a href=\"http://www.y5buddy.com/index.php?lang=1\" target=\"_blank\">Y5Buddy.com</a>. FWD is not responsible for the products, information or service of Y5Buddy.</li><li>In case of discrepancies between the English and Chinese versions, English version shall prevail.</li></ol></p>" +
        		"                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">備註：中英文本如有歧異，概以英文本為準。<ol><li>富衛並非以附屬、聯屬、授權、被認可、或任何方式與Y5Buddy及其附屬公司有關聯。Y5Buddy官方網頁為 <a href=\"http://www.y5buddy.com/index.php?lang=2\" target=\"_blank\">Y5Buddy.com</a>。富衛不會就Y5Buddy之產品、資料或服務負上任何責任。</li><li>中英文本如有歧異，概以英文本為準。</li></ol></p><br>" +
        		"                                                      <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">此乃電腦發出之電子郵件，請不要回覆。<br>This is an automatically generated email, please do not reply.</p><br>" +
        		"                                                      <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">You need Adobe Acrobat Reader to view / print the pdf file, the Reader can be downloaded for free at <a href=\"http://www.adobe.com/products/acrobat/readstep.html\"target=\"_blank\">http://www.adobe.com/products/acrobat/readstep.html</a>. </p>" +
        		"                                                  <p dir=\"ltr\" style=\"line-height:125%;margin-top:0pt;margin-bottom:10pt;text-align:left;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:15px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">附載文件適用於Acrobat 7.0 版本軟體瀏覽。請於此網站<a href=\"http://www.adobe.com/products/acrobat/readstep.html\"target=\"_blank\">http://www.adobe.com/products/acrobat/readstep.html</a>免費下載Adobe Reader以瀏覽 / 列印此pdf 文件。</p>                                         " +
        		"                                              </td>" +
        		"                                            </tr>" +
        		"                                          </tbody>" +
        		"                                        </table>" +
        		"                                      </td>" +
        		"                                    </tr>" +
        		"                                  </tbody>" +
        		"                                </table>" +
        		"                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">" +
        		"                                  <tbody>" +
        		"                                    <tr>" +
        		"                                      <td style=\"padding:18px\">" +
        		"                                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-top-width:1px;border-top-style:dotted;border-top-color:#999999;border-collapse:collapse\">" +
        		"                                          <tbody>" +
        		"                                            <tr>" +
        		"                                              <td>" +
        		"                                                <span></span>" +
        		"                                              </td>" +
        		"                                            </tr>" +
        		"                                          </tbody>" +
        		"                                        </table>" +
        		"                                      </td>" +
        		"                                    </tr>" +
        		"                                  </tbody>" +
        		"                                </table>" +
        		"                              </td>" +
        		"                            </tr>" +
        		"                          </tbody>" +
        		"                        </table>" +
        		"                      </td>" +
        		"                    </tr>" +
        		"                    <tr>" +
        		"                      <td align=\"center\" valign=\"top\">" +
        		"                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse;background-color:#ffffff;border-top:0;border-bottom:0\">" +
        		"                          <tbody>" +
        		"                            <tr>" +
        		"                              <td valign=\"top\" style=\"padding-bottom:9px\">" +
        		"                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse\">" +
        		"                                  <tbody>" +
        		"                                    <tr>" +
        		"                                      <td valign=\"top\">" +
        		"                                        <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse:collapse\">" +
        		"                                          <tbody>" +
        		"                                            <tr>" +
        		"                                              <td valign=\"top\" style=\"padding-top:9px;padding-right:18px;padding-bottom:9px;padding-left:18px;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px;line-height:125%;text-align:left\">" +
        		"                                                <div style=\"text-align:center\">" +
        		"                                                  <p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:10pt;text-align:center;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px\"><span><span style=\"background-color:transparent;color:#000000;font-family:microsoft jhenghei,calibri,sans-serif;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">富衛人壽保險(百慕達)有限公司</span></span></p>" +
        		"                                                  <p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:10pt;text-align:center;margin:1em 0;padding:0;color:#606060;font-family:Microsoft JhengHei,Calibri,sans-serif;font-size:11px\"><a href=\"http://www.fwd.com.hk\" style=\"word-wrap:break-word;color:#606060;font-weight:normal;text-decoration:underline\" target=\"_blank\"><span style=\"color:#ff8c00\"><span style=\"font-family:microsoft jhenghei,calibri,sans-serif\"><span><span style=\"background-color:transparent;font-size:13.3333px;vertical-align:baseline;white-space:pre-wrap\">www.fwd.com.hk</span></span></span></span></a></p>" +
        		"                                                </div>" +
        		"                                              </td>" +
        		"                                            </tr>" +
        		"                                          </tbody>" +
        		"                                        </table>" +
        		"                                      </td>" +
        		"                                    </tr>" +
        		"                                  </tbody>" +
        		"                                </table>" +
        		"                              </td>" +
        		"                            </tr>" +
        		"                          </tbody>" +
        		"                        </table>" +
        		"                      </td>" +
        		"                    </tr>" +
        		"                  </tbody>" +
        		"                </table>" +
        		"              </td>" +
        		"            </tr>" +
        		"          </tbody>" +
        		"        </table>" +
        		"      </center>" +
        		"    </div>" +
        		"  </body>" +
        		"</html>";

		JSONObject email_params = new JSONObject();
		email_params.put("to", recipientEmail);
		email_params.put("message", message);
		email_params.put("subject", "Free 3-Day pocket wifi rental from FWD富衛送您3日免费流動Wi-Fi數據機租借服務");
		email_params.put("attachment", null);
		email_params.put("from", UserRestURIConstants.getConfigs("savieMailFrom"));
		email_params.put("isHtml", true);

		JSONObject resp = restService.consumeApi(HttpMethod.POST,
				UserRestURIConstants.SEND_MAIL, header, email_params);
		if (resp != null) {
			if (checkJsonObjNull(resp, "errMsgs").equals("null")) {
				result = true;
			}
		}
		return result;
	}
	
	public String checkJsonObjNull(JSONObject obj, String checkByStr) {
		if (obj.get(checkByStr) != null) {
			return obj.get(checkByStr).toString();
		} else {
			return "null";
		}
	}

	@Override
	public boolean sendPromotionEmail(String emailId,
			HashMap<String, String> header) {
		// TODO Auto-generated method stub
		return false;
	}

	

}
