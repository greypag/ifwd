package com.ifwd.fwdhk.message;

import java.text.MessageFormat;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.support.AbstractMessageSource;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.message.ECommConnector;

public  class RemoteMessageSource extends AbstractMessageSource {
	
	
	@Autowired protected ECommConnector connector;
	
	@Autowired  
	private javax.servlet.ServletContext application;
	
	@Autowired  
	private javax.servlet.http.HttpServletRequest request;
	
	private boolean showKey;
	private boolean isAllMessage;
	private long updateAllMsgInterval;
	
	private static long time=0;
	
	@Value("#{prop['messagetag.showKey']}")
	public void setShowKey(String showKey) {
		this.showKey = new Boolean(showKey);
	}
	
	@Value("#{prop['messagetag.isAllMessage']}")
	public void setIsAllMessage(String isAllMessage) {
		this.isAllMessage = new Boolean(isAllMessage);
	}
	
	@Value("#{prop['messagetag.updateAllMsgInterval']}")
	
	public void setUpdateAllMsgInterval(long updateAllMsgInterval) {
		this.updateAllMsgInterval =updateAllMsgInterval*1000;  //millisecond
	}
	
	private Map<String,Map<String,String>> getAllMessage(){
		MessageResponse messageResponse=connector.getAllMessage();
		
		Map<String,Map<String,String>> allMessages=messageResponse.getAllMessages();
			
		return allMessages;
	}
	
	private void setMessageToApplication(){
		application.setAttribute("allMessages", getAllMessage());
	}
	
	public String getValueFromApplication(String lang,String code){
	    long current;
	    if(application.getAttribute("allMessages") == null){
	    	setMessageToApplication();
	    }
//		if(time==0) {
//			setMessageToApplication();
//		    time=System.currentTimeMillis();
//		}else{
//			current=System.currentTimeMillis();
//			if((current-time)>=updateAllMsgInterval){
//			setMessageToApplication();
//		    time=System.currentTimeMillis();
//			}
//		}
		//logger.info("----code1-----"+code);
		if(lang.endsWith("_")) lang=lang.substring(0,lang.length()-1);
		String msg="";
		Map<String , String> map;
		Map<String,Map<String,String>> allMessages;
		allMessages=(Map<String,Map<String,String>>)application.getAttribute("allMessages");
		map=allMessages.get(lang);
		if(map!= null){
			msg=map.get(code);
		}
		else{
			return code;
		}
		if(msg!= null){
			return msg;
		}else{
		
		return code;
		
		}
		
	}
	
	@Override
	protected MessageFormat resolveCode(String code, Locale locale) {
		
		String preview="0";
		if(request.getParameter("preview")!=null)
		{
			if(request.getParameter("preview").equals("1"))
			{
				preview="1";
			}	
		}
		
		//logger.info("----code locale-----"+createMessageFormat(code, locale));
		if(showKey) return createMessageFormat(code, locale);
		
		String lang=locale.getLanguage()+"_"+locale.getCountry();
		String msg="";
		
		try {
			if (isAllMessage && !preview.equals("1")) {
				msg = getValueFromApplication(lang, code);
			} else {
				ValueResponse t2=new ValueResponse();
				if(preview.equals("1"))
				{
					t2 = connector.getMessage(code, lang, null,"1");
				}
				else
				{
					t2 = connector.getMessage(code, lang, null,"0");
				}				
				msg = t2.getValue();
			}
		} catch (Exception e) {
			msg=code;
		}
		//logger.info("111111111code:"+code+"----value:"+msg);
		return createMessageFormat(msg, locale);
	}
	
	@Override
	protected String resolveCodeWithoutArguments(String code, Locale locale) {
		//logger.info("----lcoal-----"+locale);
		String preview="0";
		if(request.getParameter("preview")!=null)
		{
			if(request.getParameter("preview").equals("1"))
			{
				preview="1";
			}	
		}
		if(request.getParameter("showKey")!=null)
		{
			if(request.getParameter("showKey").equals("1"))
			{
				 return code;
			}
		}
		
	    if(showKey) return code;
	    
		String lang=locale.getLanguage()+"_"+locale.getCountry();
		
		HttpSession session = request.getSession();
		String language=(String) session.getAttribute("language");
		//logger.info("language : "+language);
		if(language!=null)
		{
			switch(language)
			{
			case "sc":
				lang="zh_CN";
				break;
			case "tc":
				lang="zh_HK";
				break;
			case "en":
				lang="en_US";
				break;
			default:
				lang="zh_HK";				
			}			
		}
		
		String msg="";

		try {
			if (isAllMessage && !preview.equals("1")) {
				msg = getValueFromApplication(lang, code);
			} else {
				ValueResponse t2 = new ValueResponse();
				if(preview.equals("1"))
				{
					t2=connector.getMessage(code, lang, null,"1");
				}
				else
				{
					t2=connector.getMessage(code, lang, null,"0");
				}				
				msg = t2.getValue();
			}
		} catch (Exception e) {
			msg=code;
		}
		//logger.info("22222222code:"+code+"----value:"+msg);
		return msg;
	}
	
	
	

}
