<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ifwd.fwdhk.model.QuoteDetails"%>
<%@page import="com.ifwd.fwdhk.model.TravelQuoteBean"%>
<%@page import="com.google.gson.*"%>
<%@page import="java.io.File"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.io.*"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.net.*"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
JsonParser parser = new JsonParser();
//String filePath = new File("").getAbsolutePath();
//Object rootObj = parser.parse(new FileReader("C:/wamp/www/ifwd_git/src/main/webapp/resources/json/jsontest.json"));
//Object rootObj = parser.parse(new FileReader("http://localhost:8080/fwdhk/resources/json/jsontest.json"));
URL url = new URL("http://"+request.getServerName()+":"+request.getServerPort()+"/fwdhk/resources/json/jsontest.json");
BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));
JsonObject rootObj = parser.parse(br).getAsJsonObject();
%>
<%=rootObj%>
<%=request.getServerName() %>
<%=request.getServerPort() %>