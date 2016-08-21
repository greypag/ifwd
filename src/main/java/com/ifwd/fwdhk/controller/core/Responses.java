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
  
  public static <T> ResponseEntity<T> error(T model) {
	    return new ResponseEntity<T>(model, HttpStatus.INTERNAL_SERVER_ERROR);
  }
  
  public static <T> ResponseEntity<T> unauthorized(T model) {
	    return new ResponseEntity<T>(model, HttpStatus.UNAUTHORIZED);
  }
}
