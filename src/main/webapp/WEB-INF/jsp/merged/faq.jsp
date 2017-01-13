<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ifwd.fwdhk.model.QuoteDetails"%>
<%@page import="com.ifwd.fwdhk.model.TravelQuoteBean"%>
<%@page import="com.google.gson.*"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<%
JsonParser parser = new JsonParser();
//String filePath = new File("").getAbsolutePath();
//Object rootObj = parser.parse(new FileReader("C:/wamp/www/ifwd_git/src/main/webapp/resources/json/jsontest.json"));
//Object rootObj = parser.parse(new FileReader("http://localhost:8080/fwdhk/resources/json/jsontest.json"));
URL url = new URL("http://"+request.getServerName()+":"+request.getServerPort()+"/fwdhk/resources/json/jsontest.json");
BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));
//JsonObject rootObj = parser.parse(br).getAsJsonObject();
JsonArray products = parser.parse(br).getAsJsonObject().getAsJsonArray("products");
/*for (int i=0; i < products.size(); i++) {
	JsonObject product = products.get(i).getAsJsonObject();
	System.out.println(product.get("Category").toString());
}*/
//System.out.println(rootObj.has("products"));
%>
<section id="contact-page">
	<div class="test">
	<% for (int i=0; i < products.size(); i++) { 
		JsonObject product = products.get(i).getAsJsonObject();
	%>
		<% if((int)Integer.parseInt(product.get("Group").toString())==1){ %>
			<div class="col-md-12">
				<a href="<%=request.getContextPath()%>/${language}/<%=product.get("Link").toString()%>"><%=product.get("Name").toString()%></a>
			</div>
		<% }else if ((int)Integer.parseInt(product.get("Group").toString())==2){ %>
			<div class="col-md-12">
				<a href="<%=request.getContextPath()%>/${language}/<%=product.get("Link").toString()%>"><%=product.get("Name").toString()%></a>
			</div>
		<% } %>
	<% } %>
	</div>
</seciton>