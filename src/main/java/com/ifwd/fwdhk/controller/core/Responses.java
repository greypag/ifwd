package com.ifwd.fwdhk.controller.core;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

public class Responses {
  public static ResponseEntity ok() {
    return new ResponseEntity(HttpStatus.OK);
  }

  public static ResponseEntity notFound() {
    return new ResponseEntity(HttpStatus.NOT_FOUND);
  }

  public static <T> ResponseEntity<T> ok(T model) {
    return new ResponseEntity<T>(model, HttpStatus.OK);
  }
  
  public static <T> ResponseEntity<T> notFound(T model) {
	    return new ResponseEntity<T>(model, HttpStatus.NOT_FOUND);
  }
  
  public static <T> ResponseEntity<T> badRequest(T model) {
	    return new ResponseEntity<T>(model, HttpStatus.BAD_REQUEST);
  }

  public static <T> ResponseEntity<T> notAcceptable(T model) {
	    return new ResponseEntity<T>(model, HttpStatus.NOT_ACCEPTABLE);
  }

  public static <T> ResponseEntity<T> methodNotAllowed(T model) {
	    return new ResponseEntity<T>(model, HttpStatus.METHOD_NOT_ALLOWED);
  }

  public static <T> ResponseEntity<T> conflict(T model) {
	    return new ResponseEntity<T>(model, HttpStatus.CONFLICT);
  }
  
  public static <T> ResponseEntity<T> error(T model) {
	    return new ResponseEntity<T>(model, HttpStatus.INTERNAL_SERVER_ERROR);
  }
  
  public static <T> ResponseEntity<T> expectationFailed(T model) {
	    return new ResponseEntity<T>(model, HttpStatus.EXPECTATION_FAILED);
  }

  public static <T> ResponseEntity<T> unauthorized(T model) {
	    return new ResponseEntity<T>(model, HttpStatus.UNAUTHORIZED);
  }
}
