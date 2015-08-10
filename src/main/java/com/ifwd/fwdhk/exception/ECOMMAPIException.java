package com.ifwd.fwdhk.exception;

public class ECOMMAPIException extends Exception {
	private static final long serialVersionUID = 1L;
	
	public ECOMMAPIException() {
	    super();
	}
	    
    public ECOMMAPIException(String msg) {
        super(msg);
    }
    
    public ECOMMAPIException(String msg, Throwable cause) {
        super(msg, cause);
    }
    
    public ECOMMAPIException(Throwable cause) {
        super(cause);
    }
}
