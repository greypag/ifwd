package com.ifwd.fwdhk.message;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLEncoder;
import java.util.Locale;
import java.util.Map;

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
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Component;

import com.google.common.collect.Maps;
import com.ifwd.fwdhk.message.BaseResponse;
import com.ifwd.fwdhk.message.MessageResponse;
import com.ifwd.fwdhk.message.ValueResponse;

@Component
public class ECommConnector {
	
	private static Logger logger = LoggerFactory.getLogger(ECommConnector.class);

	private static final String RESPONSE_ENCODING = "UTF-8";
/*	private static String REQ_HEADER_USERNAME = "userName";
	private static String REQ_HEADER_TOKEN = "token";*/
	
	//private String wsUrl;
	private String wsMsgUrl;

	/*@Value("#{prop['ws.url']}")
	public void setWsUrl(String wsUrl) {
		this.wsUrl = wsUrl;
	}*/
	
	@Value("#{prop['ws.msgUrl']}")
	public void setWsMsgUrl(String wsMsgUrl) {
		this.wsMsgUrl = wsMsgUrl;
	}

	private <T> T parseJson(String response, Class<T> clazz) throws IOException, JsonParseException, JsonMappingException {
		ObjectMapper objectMapper = new ObjectMapper();
		return objectMapper.readValue(response, clazz);
	}
	
	private static String encodeUTF8(String idType) throws UnsupportedEncodingException {
		return URLEncoder.encode(idType, "UTF-8");
	}

	public ValueResponse getMessage(String key,String lang, Locale locale){
		//String path="/messageBundle/mesgBundleWs/getMessage";
		String path=wsMsgUrl+"/message/getMessage"+"/"+key+"/"+lang;		
		return consumeECommWs(path, HttpMethod.GET, null, ValueResponse.class, locale);
	}
	
	
	public ValueResponse getMessage(String key,String lang, Locale locale,String preview){
		//String path="/messageBundle/mesgBundleWs/getMessage";
		String path=wsMsgUrl+"/message/getMessage"+"/"+key+"/"+lang;
		if(preview.equals("1"))
		{
			path=path+"?preview=1";
		}
		return consumeECommWs(path, HttpMethod.GET, null, ValueResponse.class, locale);
	}
	
	public MessageResponse getAllMessage(){
		//String path="/messageBundle/mesgBundleWs/getAllMessage";
		String path=wsMsgUrl+"/message/getAllMessage";		
		return consumeECommWs(path, HttpMethod.GET, null, MessageResponse.class, null);
	}
	
	public MessageResponse getAllMessage(String preview){
		//String path="/messageBundle/mesgBundleWs/getAllMessage";
		String path=wsMsgUrl+"/message/getAllMessage";
		if(preview.equals("1"))
		{
			path=path+"?preview=1";
		}
		return consumeECommWs(path, HttpMethod.GET, null, MessageResponse.class, null);
	}
	

	// TODO pass in headers information
	private <T extends BaseResponse> T consumeECommWs(String url, HttpMethod method, Object requestBody, Class<T> responseClazz, Locale locale) {
		
		final ObjectMapper mapper = new ObjectMapper();
		try {
			final String objStr = mapper.writeValueAsString(requestBody);
			logger.debug("path:" + url);
		} catch (Exception ex) {
			logger.error(ex.toString());
		}
		
		final Map<String,String> headers = Maps.newHashMap();
		if(locale != null){			
			headers.put("language", locale.getLanguage());
		}
		switch (method) {
		case POST:
			return callByPostMethod(url, headers, requestBody, responseClazz);
		case GET:
			return callByGetMethod(url, headers, responseClazz);
		case PUT:
			return callByPutMethod(url, headers, requestBody, responseClazz);
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
				method.setEntity(new StringEntity(requestStr));
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
