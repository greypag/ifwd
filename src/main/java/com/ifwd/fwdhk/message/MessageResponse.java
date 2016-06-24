package com.ifwd.fwdhk.message;

import java.util.HashMap;
import java.util.Map;

import com.ifwd.fwdhk.message.BaseResponse;

public class MessageResponse  extends BaseResponse {
	//<lang, <key,value>>
	Map<String,Map<String,String>> allMessages=new HashMap<String,Map<String,String>>();

	public Map<String, Map<String, String>> getAllMessages() {
		return allMessages;
	}

	public void setAllMessages(Map<String, Map<String, String>> allMessages) {
		this.allMessages = allMessages;
	}


}
