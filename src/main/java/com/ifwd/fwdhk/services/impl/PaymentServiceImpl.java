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
import com.ifwd.fwdhk.model.PaymentStatusQueryResponse;
import com.ifwd.fwdhk.services.PaymentService;
import com.ifwd.fwdhk.utils.services.SendEmailDao;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	private final static Logger logger = LoggerFactory.getLogger(PaymentServiceImpl.class);
	
	private static final String url = UserRestURIConstants.TAG_GO_URL;//"https://gateway.sandbox.tapngo.com.hk/paymentApi/payment/status";
	
	private static final String username = "";
	
	private static final String password = "";
	
	private static final String ip = "10.12.251.5";
	
	private static final String port = "8080";
	
	private static final Boolean useProxy = false;
	
	@Autowired
	private RestServiceDao restService;
	
	@Autowired
	private SendEmailDao sendEmail;

	@Override
	public JSONObject getPaymentStatus(String appId, String merTradeNo,
			String timestamp, String sign) {
		HashMap<String, String> header = new HashMap<String, String>();
		header.put("Content-Type", "application/x-www-form-urlencoded");
		header.put("Accept", "application/json");
		
		List<NameValuePair> params = new ArrayList<NameValuePair>();   
	    params.add(new BasicNameValuePair("appId", appId));   
	    params.add(new BasicNameValuePair("merTradeNo", merTradeNo));
	    params.add(new BasicNameValuePair("timestamp", timestamp));   
	    params.add(new BasicNameValuePair("sign", sign));
		
	    logger.debug("appId: "+appId + " merTradeNo: "+merTradeNo+" timestamp: "+timestamp+" sign: "+sign);
	    logger.debug("url: "+url);
	    
		JSONObject loginJsonObj = restService.consumePaymentStatusAPI(url,header, params);
		
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
	
	public PaymentStatusQueryResponse queryByOrderReference(String appId, String merTradeNo,String timestamp, String sign) throws PaymentQueryException{
        try {
           final RestTemplate restTemplate = new RestTemplate();
           if(useProxy){
        	   PaymentServiceImpl.configure(restTemplate);
           }
           final Map<String,String> vars = new HashMap<>();
           //vars.put("merchantApi", merchantApi);
           vars.put("appId", appId);
           vars.put("merTradeNo", merTradeNo);
           vars.put("timestamp", timestamp);
           vars.put("sign", "sign");
           
           HttpHeaders headers = new HttpHeaders();
           MediaType type = MediaType.parseMediaType("application/x-www-form-urlencoded; charset=UTF-8");
           headers.setContentType(type);
           headers.add("Accept", MediaType.APPLICATION_JSON.toString());
           net.sf.json.JSONObject jsonObj = net.sf.json.JSONObject.fromObject(vars);
           HttpEntity<String> formEntity = new HttpEntity<String>(jsonObj.toString(), headers);
           return restTemplate.postForObject(url, formEntity, PaymentStatusQueryResponse.class);
           
           //return restTemplate.postForObject(url, vars, PaymentStatusQueryResponse.class, null);//getForObject("{merchantApi}?merchantId={merchantId}&loginId={loginId}&password={password}&actionType=Query&orderRef={orderRef}&payRef={payRef}", PaymentStatusQueryResponse.class, vars);

        } catch (Exception e) {
               e.printStackTrace();
               throw new PaymentQueryException();
        }
 }
	
	
}
