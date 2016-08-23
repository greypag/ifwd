<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:htmlEscape defaultHtmlEscape="true" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />

<div style="margin-top:50px; height:100%;">
		merTradeNo:<input type="text" name="merTradeNo" value="${merTradeNo}" size="100" /><br>
		msg:<input type="text" name="ReturnMsg" value="${ReturnMsg}" size="100"/><br>
		resultCode:<input type="text" name="extras" value="${resultCode}" size="100"/><br>
		sign:<input type="text" name="sign" value="${sign}" size="100"/><br>
		<br><br><p><input type="button" onclick="backPayment();" value="Return Payment"/></p><br><br><br><br>
</div>

<script>
function backPayment(){
	window.location.href = "<%=request.getContextPath()%>/paymentPage";

}

</script>