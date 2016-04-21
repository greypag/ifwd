<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="enhance" uri="http://pukkaone.github.com/jsp" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<div align="center">
<h1 style="color: black;">easy health plan-option page</h1>
<a id="online" class="buy-now et-quote btn-color-ylw" href="#" >online</a>
<a id="offline" class="buy-now et-quote btn-color-ylw" href="#" >offline</a>
</div>
<script type="text/javascript">
$("#online").click(function(){
	if('${authenticate}' == 'true' && '${authenticate}' != '*DIRECTGI'){
		window.location = '<%=request.getContextPath()%>/${language}/${nextPageFlow}';
    }else{
        $('#loginpopup').modal('show');         
    }
});
$("#offline").click(function(){
	if('${authenticate}' == 'true' && '${authenticate}' != '*DIRECTGI'){
		window.location = '<%=request.getContextPath()%>/${language}/${nextPageFlow2}';
    }else{
        $('#loginpopup').modal('show');         
    }
});
</script>