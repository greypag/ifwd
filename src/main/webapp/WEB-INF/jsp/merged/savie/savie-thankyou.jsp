<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<div style="margin-right: auto;margin-left: auto;padding-left:15px;padding-right:15px">Thank you for your purchase!</div>
 <form   style="margin-right: auto;margin-left: auto;padding-left:15px;padding-right:15px" id="form1" name="form1" action="<%=request.getContextPath()%>/${language}/${nextPageFlow }"  method="post">
 <input type="submit" value="next">
 </form>