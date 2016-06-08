<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeCareQuetionaries"%>
<%@page import="java.util.*"%>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<c:set var="context" value="${pageContext.request.contextPath}" />
<fmt:setBundle basename="messages" var="msg" />
home-liability-landing page
<input type="button" value="nextPage" id="nextPage"/>
<script>
$("#nextPage").on("click",function(){
	window.location = '<%=request.getContextPath()%>/${language}/household-insurance/home-liability/${nextPageFlow}';
});
</script>