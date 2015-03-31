package com.ifwd.fwdhk.api.controller;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Component;

import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.model.UserDetails;

@Component
public class RestServiceImpl implements RestServiceDao {

	public static final Map<String, String> COMMON_HEADERS;

	static {
		Map<String, String> realMap = new HashMap<String, String>();
		realMap.put("Content-Type", "application/json");
		realMap.put("country", "HK");
		realMap.put("language", "EN");
		realMap.put("Accept", "application/json");
		COMMON_HEADERS = Collections.unmodifiableMap(realMap);
	}

	@Override
	public JSONObject consumeApi(HttpMethod type, String url,
			Map<String, String> header, JSONObject parameters) {

		switch (type) {
		case POST:
			return callByPostMethod(url, header, parameters);
		case GET:
			return callByGetMethod(url, header);
		case PUT:
			return callByPutMethod(url, header, parameters);

		default:
			throw new IllegalArgumentException("Unsupported Http method");
		}
	}

	public JSONObject callByPostMethod(String url, Map<String, String> header,
			JSONObject params) {
		JSONObject responseJsonObj = new JSONObject();
		try {

			CloseableHttpClient restClient = (HttpClientBuilder.create())
					.build();
			HttpPost postMehod = new HttpPost();
			URI uri = new URI(url);
			postMehod.setURI(uri);
			if (header != null) {
				header.entrySet()
						.stream()
						.forEach(
								(headParam) -> {
									postMehod.addHeader(headParam.getKey(),
											headParam.getValue());
								});
			}

			postMehod.setEntity(new StringEntity(params.toJSONString()));

			responseJsonObj = restClient.execute(postMehod,
					new ResponseHandler<JSONObject>() {
						@Override
						public JSONObject handleResponse(HttpResponse response)
								throws ClientProtocolException, IOException {

							String responseStr = IOUtils.toString(response
									.getEntity().getContent());
							JSONParser parser = new JSONParser();
							try {
								return (JSONObject) parser.parse(responseStr);
							} catch (ParseException e) {
								e.printStackTrace();
							}
							return null;
						}
					});
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (URISyntaxException e1) {
			e1.printStackTrace();
		}

		return responseJsonObj;
	}

	public JSONObject callByPutMethod(String url, Map<String, String> header,
			JSONObject params) {
		JSONObject responseJsonObj = new JSONObject();
		try {

			CloseableHttpClient restClient = (HttpClientBuilder.create())
					.build();
			HttpPut putMehod = new HttpPut();
			URI uri = new URI(url);
			putMehod.setURI(uri);
			if (header != null) {
				header.entrySet()
						.stream()
						.forEach(
								(headParam) -> {
									putMehod.addHeader(headParam.getKey(),
											headParam.getValue());
								});
			}
			/*
			 * for (int i = 0; i < header.length; i++) {
			 * postMehod.addHeader(header[i][0], header[i][1]); }
			 */

			/*
			 * for (int i = 0; i < params.length; i++) {
			 * jsonParams.put(params[i][0], params[i][1]); }
			 */
			putMehod.setEntity(new StringEntity(params.toJSONString()));

			responseJsonObj = restClient.execute(putMehod,
					new ResponseHandler<JSONObject>() {
						@Override
						public JSONObject handleResponse(HttpResponse response)
								throws ClientProtocolException, IOException {

							String responseStr = IOUtils.toString(response
									.getEntity().getContent());
							JSONParser parser = new JSONParser();
							try {
								return (JSONObject) parser.parse(responseStr);
							} catch (ParseException e) {
								e.printStackTrace();
							}
							return null;
						}
					});
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (URISyntaxException e1) {
			e1.printStackTrace();
		}

		return responseJsonObj;
	}

	public JSONObject callByGetMethod(String url, Map<String, String> header) {
		JSONObject responseJsonObj = new JSONObject();
		try {

			CloseableHttpClient restClient = (HttpClientBuilder.create())
					.build();
			HttpGet method = new HttpGet();
			URI uri = new URI(url);
			method.setURI(uri);
			/*
			 * for (int i = 0; i < header.length; i++) {
			 * method.addHeader(header[i][0], header[i][1]); }
			 */
			if (header != null) {
				header.entrySet().stream().forEach((headParam) -> {
					method.addHeader(headParam.getKey(), headParam.getValue());
				});
			}
			responseJsonObj = restClient.execute(method,
					new ResponseHandler<JSONObject>() {
						@Override
						public JSONObject handleResponse(HttpResponse response)
								throws ClientProtocolException, IOException {
							String responseStr = IOUtils.toString(response
									.getEntity().getContent());
							JSONParser parser = new JSONParser();
							try {
								return (JSONObject) parser.parse(responseStr);
							} catch (ParseException e) {
								e.printStackTrace();
							}
							return null;
						}
					});
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (URISyntaxException e1) {
			e1.printStackTrace();
		}

		return responseJsonObj;
	}

	public void consumeLoginApi(HttpServletRequest request) {

		JSONObject responseJsonObj = new JSONObject();
		try {

			CloseableHttpClient restClient = (HttpClientBuilder.create())
					.build();
			HttpPost method = new HttpPost();
			URI uri = new URI(UserRestURIConstants.USER_LOGIN);
			method.setURI(uri);

			COMMON_HEADERS.entrySet().stream().forEach((headParam) -> {
				method.addHeader(headParam.getKey(), headParam.getValue());
			});
			JSONObject params = new JSONObject();
			params.put("userName", "*DIRECTGI");
			params.put("password", "");
			method.setEntity(new StringEntity(params.toJSONString()));

			responseJsonObj = restClient.execute(method,
					new ResponseHandler<JSONObject>() {
						@Override
						public JSONObject handleResponse(HttpResponse response)
								throws ClientProtocolException, IOException {
							String responseStr = IOUtils.toString(response
									.getEntity().getContent());
							JSONParser parser = new JSONParser();
							try {
								return (JSONObject) parser.parse(responseStr);
							} catch (ParseException e) {
								e.printStackTrace();
							}
							return null;
						}
					});
			System.out.println("direct user response" + responseJsonObj);
			if (responseJsonObj.get("errMsgs") == null) {
				HttpSession session = request.getSession(true);
				session.setAttribute("authenticate", "direct");
				session.setAttribute("token", responseJsonObj.get("token")
						.toString());
				session.setAttribute("username", "*DIRECTGI");

				/*JSONObject customer = (JSONObject) responseJsonObj
						.get("customer");*/
				/*
				 * session.setAttribute("emailAddress",
				 * checkJsonObjNull(customer, "email"));
				 */
				/*session.setAttribute("referralCode",
						checkJsonObjNull(customer, "referralCode"));*/

				UserDetails userDetails = new UserDetails();
				userDetails
						.setToken(checkJsonObjNull(responseJsonObj, "token"));
				/*
				 * userDetails.setFullName(checkJsonObjNull(customer, "name"));
				 * userDetails.setEmailAddress(checkJsonObjNull(customer,
				 * "email"));
				 */
				/*
				 * userDetails.setMobileNo(checkJsonObjNull(customer,
				 * "contactNo"));
				 */
				userDetails.setUserName("*DIRECTGI");
				/*userDetails.setReferralCode(checkJsonObjNull(customer,
						"referralCode"));
				userDetails.setReferralCodeUsedCount(checkJsonObjNull(customer,
						"referralCodeUsedCount"));
				userDetails.setReferralLink(checkJsonObjNull(customer,
						"referralLink"));
				userDetails.setGender(checkJsonObjNull(customer, "gender"));
				userDetails.setDob(checkJsonObjNull(customer, "dob"));
				userDetails.setOptIn1(checkJsonObjNull(customer, "optIn1"));
				userDetails.setOptIn2(checkJsonObjNull(customer, "optIn2"));*/
				session.setAttribute("userDetails", userDetails);
			}

		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (URISyntaxException e1) {
			e1.printStackTrace();
		}

	}

	public String checkJsonObjNull(JSONObject obj, String checkByStr) {
		if (obj.get(checkByStr) != null) {
			return obj.get(checkByStr).toString();
		} else {
			return "";
		}
	}

	public boolean validateToken(String username, String token) {
		boolean result = false;
		HashMap<String, String> header = new HashMap<String, String>(
				COMMON_HEADERS);
		header.put("userName", username);
		header.put("token", token);

		JSONObject responseObj = consumeApi(HttpMethod.POST,
				UserRestURIConstants.VALIDATE_TOKEN, header, null);
		if (responseObj.get("errMsgs") == null) {

			result = true;
		}

		return result;
	}

}
