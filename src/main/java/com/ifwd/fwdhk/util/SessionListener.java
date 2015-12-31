package com.ifwd.fwdhk.util;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ifwd.fwdhk.connector.response.eliteterm.CreateEliteTermPolicyResponse;
import com.ifwd.fwdhk.controller.EliteTermController;
import com.ifwd.fwdhk.controller.UserRestURIConstants;

public class SessionListener implements HttpSessionListener{

	private final static Logger logger = LoggerFactory.getLogger(SessionListener.class);
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		logger.info("sessionCreated");
	}

	@SuppressWarnings("restriction")
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		CreateEliteTermPolicyResponse eliteTermPolicy = (CreateEliteTermPolicyResponse) se.getSession().getAttribute("eliteTermPolicy");
		if(eliteTermPolicy != null &&  StringUtils.isNotEmpty(eliteTermPolicy.getPolicyNo())){
			String policyNo = eliteTermPolicy.getPolicyNo();
			String documentPath = UserRestURIConstants.getConfigs("documentPath");
			String uploadDir = documentPath + "/"+new sun.misc.BASE64Encoder().encode(policyNo.getBytes())+"/"; 
	        FileUtil.deletFile(uploadDir);
		}
		logger.info("sessionDestroyed");
	}

}
