<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:htmlEscape defaultHtmlEscape="true" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />

	<form action="https://gateway.sandbox.tapngo.com.hk/web/payments" method="post"><br><br>
		appId:<input type="text" name="appId" value="${appId}" size="100"/><br>
		merTradeNo:<input type="text" name="merTradeNo" value="${merTradeNo}" size="100" /><br>
		payload:<input type="text" name="payload" value="${payload}" size="100"/><br>
		paymentType:<input type="text" name="paymentType" value="${paymentType}" size="100"/><br>
		extras:<input type="text" name="extras" value="${extras}" size="100"/><br>
		sign:<input type="text" name="sign" value="${sign}" size="100"/><br>
		<br><br><p><input type="submit" value="Pay By Tap &amp; Go"/></p><br><br><br><br>
	</form>

    
   