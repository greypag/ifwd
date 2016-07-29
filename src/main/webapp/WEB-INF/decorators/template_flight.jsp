<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="dec"%>

<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<%
	/*
		Define Java variaibles
	*/

	String requestUri = request.getRequestURI(); 
	String siteURL = request.getContextPath();

	boolean langFlag = false;
 	if(session.getAttribute("language") != null){
		langFlag = true;
 	} else {
		langFlag = false;
 	}
	String langBodyClass = (langFlag && "EN".equals(session.getAttribute("language").toString().toUpperCase()))?"":"chin";
%>

<!DOCTYPE HTML>
<html>
	<head>
		<%@ include file="include/shared/meta_tag.jsp"%>
		<%@ include file="include/shared/social_network.jsp"%>

		<%@ include file="include/shared/core_css.jsp"%>
		<%@ include file="include/shared/core_js.jsp"%>
		<%@ include file="include/shared/IE8_scripts.jsp"%>
		<%@ include file="include/shared/IE9_scripts.jsp"%>

		<%@ include file="include/shared/vwo.jsp"%>
		<%@ include file="include/shared/kenshoo.jsp"%>
		
		<dec:head />

		<link rel="icon" type="image/x-icon" href="<%=siteURL%>/resources/images/favicon.ico" />
	</head>
	
	<body class="<%=langBodyClass%>">

		<%@ include file="include/shared/google_tag_manager.jsp"%>
		<%@ include file="include/shared/notifications.jsp"%>	
		<%@ include file="include/merged/header2.jsp"%>

		<dec:body />
	
		<%@ include file="include/merged/footer2.jsp"%>
		<%@ include file="include/shared/core_footer_js.jsp"%>
	
	</body>
</html>
