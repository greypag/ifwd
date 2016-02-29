<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<div align="center">
<h1 style="color: black;">savie-landing.jsp</h1>
<a id="nextPage" class="buy-now et-quote btn-color-ylw" href="#" >next page</a>
</div>
<script type="text/javascript">
$("#nextPage").click(function(){
	window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow}';
});
</script>