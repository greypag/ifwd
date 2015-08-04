package com.ifwd.fwdhk.connector;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLEncoder;
import java.util.Collections;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpEntityEnclosingRequestBase;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.AbstractHttpMessage;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Component;

import com.google.common.collect.Maps;
import com.ifwd.fwdhk.connector.response.BaseResponse;
import com.ifwd.fwdhk.connector.response.savie.SalesIllustrationResponse;
import com.ifwd.fwdhk.connector.response.savie.SaviePlanDetailsResponse;
import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.exception.ECOMMAPIException;

@Component
public class ECommWsConnector {
	public static final Map<String, String> COMMON_HEADERS;

	static {
		Map<String, String> realMap = new HashMap<String, String>();
		realMap.put("Content-Type", "application/json");
		realMap.put("country", "HK");
		realMap.put("language", "EN");
		
		COMMON_HEADERS = Collections.unmodifiableMap(realMap);
	}
	
	private static Logger logger = LoggerFactory.getLogger(ECommWsConnector.class);

	private static final String RESPONSE_ENCODING = "UTF-8";
	
	private String wsUrl = UserRestURIConstants.getUrl();

	private <T> T parseJson(String response, Class<T> clazz) throws IOException, JsonParseException, JsonMappingException {
		ObjectMapper objectMapper = new ObjectMapper();
		return objectMapper.readValue(response, clazz);
	}
	
	private static String encodeUTF8(String str) {
		try {
			return URLEncoder.encode(str, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			logger.error(ExceptionUtils.getStackTrace(e));
			return "";
		}
	}
	public SaviePlanDetailsResponse saviePlanDetails(String planCode, String issueAge, String paymentTerm, String premium, String referralCode, Locale locale){
		StringBuffer url = new StringBuffer();
		url.append(UserRestURIConstants.SAVIE_PLAN_DETAIL);
		url.append("?planCode=");
		url.append(planCode);
		url.append("&issueAge=");
		url.append(issueAge);
		url.append("&paymentTerm=");
		url.append(paymentTerm);
		url.append("&premium=");
		url.append(premium);
		url.append("&referralCode=");
		url.append(referralCode);
		
		Map<String,String> header = Maps.newHashMap();
		if(locale != null){			
			header.put("language", locale.getLanguage());
		}
		return consumeECommWs(url.toString(), HttpMethod.GET, null, SaviePlanDetailsResponse.class, header);
	}
	
	public SalesIllustrationResponse generateSalesIllustration(JSONObject parameters,final Map<String,String> header)throws ECOMMAPIException{
		return consumeECommWs(UserRestURIConstants.GENERATE_SALES_ILLUSTRATION,HttpMethod.PUT,parameters,SalesIllustrationResponse.class,header);
	}
	
	public BaseResponse sendLead(JSONObject parameters,final Map<String,String> header)throws ECOMMAPIException{
		return consumeECommWs(UserRestURIConstants.SEND_LEAD,HttpMethod.PUT,parameters,BaseResponse.class,header);
	}
	
	public BaseResponse sendEmail(org.json.simple.JSONObject parameters,final Map<String,String> header)throws ECOMMAPIException{
		return consumeECommWs(UserRestURIConstants.SEND_EMAIL,HttpMethod.POST,parameters,BaseResponse.class,header);
	}
	
	
	public BaseResponse signature(org.json.simple.JSONObject parameters,final Map<String,String> header)throws ECOMMAPIException{
		return consumeECommWs(UserRestURIConstants.SEND_SIGN,HttpMethod.POST,parameters,BaseResponse.class,header);
	}
	
	public BaseResponse uploadDocuments(org.json.simple.JSONObject parameters,final Map<String,String> header)throws ECOMMAPIException{
		return consumeECommWs(UserRestURIConstants.SEND_DOCUMENTS,HttpMethod.POST,parameters,BaseResponse.class,header);
	}
	
	private <T extends BaseResponse> T consumeECommWs(String path, HttpMethod method, Object requestBody, Class<T> responseClazz, Map<String,String> header) {
		
		final String url = wsUrl + path;
		logger.debug("path:" + url);
		
		switch (method) {
		case POST:
			return callByPostMethod(url, header, requestBody, responseClazz);
		case GET:
			return callByGetMethod(url, header, responseClazz);
		case PUT:
			return callByPutMethod(url, header, requestBody, responseClazz);
		default:
			throw new IllegalArgumentException("Unsupported Http method");
		}
	}

	private void addHeaders(Map<String, String> headers, AbstractHttpMessage method) {
		headers.entrySet()
				.stream()
				.forEach(
						(headParam) -> {
							method.addHeader(headParam.getKey(),
									headParam.getValue());
						});
		method.addHeader("Content-Type", "application/json");
		method.addHeader("Accept-Charset", "UTF-8");
	}

	private <T extends BaseResponse> ResponseHandler<T> newResponseHandler(final Class<T> responseClazz) {
		return new ResponseHandler<T>() {
			@Override
			public T handleResponse(HttpResponse response)
				throws ClientProtocolException, IOException {
				final String responseStr = IOUtils.toString(response.getEntity().getContent(), RESPONSE_ENCODING);
				logger.debug("responseStr: " + responseStr);
				return parseJson(responseStr, responseClazz);
			}
		};
	}
	
	private <T extends BaseResponse> T callWithBody(String url, HttpEntityEnclosingRequestBase method, Map<String, String> header, Object requestBody, Class<T> responseClazz) {
		try {
			CloseableHttpClient client = (HttpClientBuilder.create())
					.build();
			URI uri = new URI(url);
			method.setURI(uri);
			if (header != null) {
				this.addHeaders(header, method);
			}
			if(requestBody != null){
				ObjectMapper mapper = new ObjectMapper();
				String requestStr = mapper.writeValueAsString(requestBody);
				logger.debug("requestStr: " + requestStr);
				method.setEntity(new StringEntity(requestStr,"UTF-8"));
			}
			return client.execute(method, newResponseHandler(responseClazz));
		} catch (IOException | URISyntaxException e) {
			logger.error(ExceptionUtils.getStackTrace(e));
		}
		return null;
	}
	
	private <T extends BaseResponse> T callByPostMethod(String url, Map<String, String> header,
			Object requestBody, Class<T> responseClazz) {
		return callWithBody(url, new HttpPost(), header, requestBody, responseClazz);
	}
	
	private <T extends BaseResponse> T callByPutMethod(String url, Map<String, String> header,
			Object requestBody, Class<T> responseClazz) {
		return callWithBody(url, new HttpPut(), header, requestBody, responseClazz);
	}
	
	private <T extends BaseResponse> T callByGetMethod(final String url, final Map<String, String> headers, final Class<T> responseClazz) {
		try {
			CloseableHttpClient restClient = (HttpClientBuilder.create())
					.build();
			HttpGet method = new HttpGet();
			URI uri = new URI(url);
			method.setURI(uri);
			if (headers != null) {
				this.addHeaders(headers, method);
			}
			logger.debug("requestStr: " + url);			
			return restClient.execute(method, newResponseHandler(responseClazz));
		} catch (IOException | URISyntaxException e) {
			logger.error(ExceptionUtils.getStackTrace(e));
		}
		return null;
	}
	
}
