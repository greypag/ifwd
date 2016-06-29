package com.ifwd.fwdhk.message;


@SuppressWarnings("serial")
public class BaseResponse{

	private String[] errMsgs;

	public String[] getErrMsgs() {
		return errMsgs;
	}

	public void setErrMsg(String errMsg) {
		this.errMsgs = new String[]{errMsg};
	}
	
	public void setErrMsgs(String[] errMsgs) {
		this.errMsgs = errMsgs;
	}

	public boolean hasError(){
		return (this.getErrMsgs() != null && this.getErrMsgs().length > 0 && !"".equals(this.getErrMsgs()[0]));
	}
	
}
