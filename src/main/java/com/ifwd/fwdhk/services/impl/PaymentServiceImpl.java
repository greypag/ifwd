package com.ifwd.fwdhk.services.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpHost;
import org.apache.http.NameValuePair;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.HttpClient;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.exception.PaymentQueryException;
import com.ifwd.fwdhk.model.TapAndGoPaymentStatusQueryResponse;
import com.ifwd.fwdhk.services.PaymentService;
import com.ifwd.fwdhk.util.EncryptionUtils;
import com.ifwd.fwdhk.utils.services.SendEmailDao;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	private final static Logger logger = LoggerFactory.getLogger(PaymentServiceImpl.class);
	
	//private final static String APP_ID = UserRestURIConstants.APP_ID;
	
	//private final static String url = UserRestURIConstants.TAG_GO_URL;//"https://gateway.sandbox.tapngo.com.hk/paymentApi/payment/status";
	
	private final static String username = "";
	
	private final static String password = "";
	
	private final static String ip = "10.12.251.5";
	
	private final static String port = "8080";
	
	private final static Boolean useProxy = false;
	
	@Autowired
	private RestServiceDao restService;
	
	@Autowired
	private SendEmailDao sendEmail;

	@Override
	public JSONObject getPaymentStatus(String merTradeNo) {
		HashMap<String, String> header = new HashMap<String, String>();
		header.put("Content-Type", "application/x-www-form-urlencoded");
		header.put("Accept", "application/json");
		
		long timestamp = System.currentTimeMillis();
	    String sign = "";	
	    sign="appId="+UserRestURIConstants.APP_ID;
	    if(StringUtils.isNotEmpty(merTradeNo)) sign=sign+"&merTradeNo="+merTradeNo;
	    sign=sign+"&timestamp="+timestamp;
		
	    sign=EncryptionUtils.encryptByHMACSHA512(sign);
		
		List<NameValuePair> params = new ArrayList<NameValuePair>();   
	    params.add(new BasicNameValuePair("appId", UserRestURIConstants.APP_ID));   
	    params.add(new BasicNameValuePair("merTradeNo", merTradeNo));
	    params.add(new BasicNameValuePair("timestamp", String.valueOf(timestamp)));   
	    params.add(new BasicNameValuePair("sign", sign));
		
	    logger.debug("appId: "+UserRestURIConstants.APP_ID + " merTradeNo: "+merTradeNo+" timestamp: "+timestamp+" sign: "+sign);
	    logger.debug("url: "+UserRestURIConstants.TAG_GO_URL);
	    
		JSONObject loginJsonObj = restService.consumePaymentStatusAPI(UserRestURIConstants.TAG_GO_URL,header, params);
		
		return loginJsonObj;
	}
	
	
	private static void configure(RestTemplate restTemplate){
        if(StringUtils.isNoneBlank(ip) && StringUtils.isNoneBlank(port)
                     && StringUtils.isNoneBlank(username) && StringUtils.isNoneBlank(password)){

	       final CredentialsProvider credsProvider = new BasicCredentialsProvider();
	       final UsernamePasswordCredentials credentials = new UsernamePasswordCredentials(username, password);
	       credsProvider.setCredentials(new AuthScope(null, -1), credentials);
	       HttpClientBuilder httpClientBldr = HttpClients.custom();
	       HttpHost proxy = new HttpHost(ip, Integer.parseInt(port));
	       httpClientBldr.setDefaultCredentialsProvider(credsProvider).setProxy(proxy);
	      
	       final HttpClient httpClient = httpClientBldr.build();
	       final HttpComponentsClientHttpRequestFactory requestFactory = new HttpComponentsClientHttpRequestFactory(httpClient);
               restTemplate.setRequestFactory(requestFactory);
        }            
	}
	
	public TapAndGoPaymentStatusQueryResponse tapAndGoQueryByOrderReference(String merTradeNo) throws PaymentQueryException{
        try {
           final RestTemplate restTemplate = new RestTemplate();
           if(useProxy){
        	   PaymentServiceImpl.configure(restTemplate);
           }
           
           long timestamp = System.currentTimeMillis();
   		   String sign = "";	
   		   sign="appId="+UserRestURIConstants.APP_ID;
   		   if(StringUtils.isNotEmpty(merTradeNo)) sign=sign+"&merTradeNo="+merTradeNo;
   		   sign=sign+"&timestamp="+timestamp;
   		
   		   sign=EncryptionUtils.encryptByHMACSHA512(sign);
           
           final Map<String,String> vars = new HashMap<>();
           //vars.put("merchantApi", merchantApi);
           vars.put("appId", UserRestURIConstants.APP_ID);
           vars.put("merTradeNo", merTradeNo);
           vars.put("timestamp", String.valueOf(timestamp));
           vars.put("sign", "sign");
           
           HttpHeaders headers = new HttpHeaders();
           MediaType type = MediaType.parseMediaType("application/x-www-form-urlencoded; charset=UTF-8");
           headers.setContentType(type);
           headers.add("Accept", MediaType.APPLICATION_JSON.toString());
           net.sf.json.JSONObject jsonObj = net.sf.json.JSONObject.fromObject(vars);
           HttpEntity<String> formEntity = new HttpEntity<String>(jsonObj.toString(), headers);
           return restTemplate.postForObject(UserRestURIConstants.TAG_GO_URL, formEntity, TapAndGoPaymentStatusQueryResponse.class);
           
           //return restTemplate.postForObject(url, vars, PaymentStatusQueryResponse.class, null);//getForObject("{merchantApi}?merchantId={merchantId}&loginId={loginId}&password={password}&actionType=Query&orderRef={orderRef}&payRef={payRef}", PaymentStatusQueryResponse.class, vars);

        } catch (Exception e) {
               e.printStackTrace();
               throw new PaymentQueryException();
        }
 }
	
	
}
