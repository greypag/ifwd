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

	String username = (String)session.getAttribute("username");
	boolean isAuthenticated = session.getAttribute("authenticate")=="true";
%>

<!DOCTYPE HTML>
<html>
	<head>
	
	<%-- Meta data--%>
		<%@ include file="include/shared/meta_tag.jsp"%>
		<%@ include file="include/shared/social_network.jsp"%>
	<%-- End Meta data--%>

	<%-- Core Header Scripts--%>
		<%@ include file="include/shared/core_css.jsp"%>
		<%@ include file="include/shared/core_js.jsp"%>
	<%-- End Core Header Scripts--%>

	<%-- Browser Specific Scripts--%>
		<%@ include file="include/shared/IE8_scripts.jsp"%>
		<%@ include file="include/shared/IE9_scripts.jsp"%>
		<%@ include file="include/shared/IOS_chrome.jsp"%>
	<%-- End Browser Specific Scripts--%>

	<%-- Tracking Scripts--%>
		<%@ include file="include/shared/vwo.jsp"%>
		<%@ include file="include/shared/kenshoo.jsp"%>
	<%-- End Tracking Scripts--%>

		<dec:head />

	</head>
	
	<body class="<%=langBodyClass%>">

	<%-- GTM Scripts--%>
		<%@ include file="include/shared/google_tag_manager.jsp"%>
	<%-- End GTM Scripts--%>

	<%-- Body Scripts--%>
		<%@ include file="include/merged/header_v2.jsp"%>
		<dec:body />	
		<%@ include file="include/merged/footer_v2.jsp"%>
	<%-- End Body Scripts--%>

	<%-- Core Footer Scripts--%>
		<%@ include file="include/shared/core_footer_js.jsp"%>
	<%-- End Core Footer Scripts--%>

	<%-- Module Scripts--%>
		<%if (isAuthenticated && username!=null) {%>
			<%@ include file="/WEB-INF/jsp/merged/session.jsp"%>
		<% } %>
		<%@ include file="include/shared/timeout.jsp"%>
		
		<%@ include file="include/shared/i18n.jsp"%>
		<%@ include file="/WEB-INF/jsp/merged/comp/notification.jsp"%>
	<%-- End Module Scripts--%>

	<%-- Third Party Scripts--%>
		<%@ include file="include/shared/facebook_share.jsp"%>
		<%@ include file="include/shared/livechat.jsp"%>
	<%-- End Third Party Scripts--%>		
	
	</body>
</html>
