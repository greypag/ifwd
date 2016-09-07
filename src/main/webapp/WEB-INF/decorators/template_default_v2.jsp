<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="enhance" uri="http://pukkaone.github.com/jsp" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="dec" uri="http://www.opensymphony.com/sitemesh/decorator"%>

<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<%
	/*********
		Define Java variaibles
	**********/

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

	boolean isAuthenticated = session.getAttribute("authenticate") != null && session.getAttribute("authenticate")=="true";
	boolean isDirect = session.getAttribute("authenticate") != null && "direct".equalsIgnoreCase(session.getAttribute("authenticate").toString());

	String actionName = "";
	if (request.getAttribute("controller") != null) {
		actionName = request.getAttribute("controller").toString();
	}

%>

<!DOCTYPE HTML>
<html>
	<head>
	<!--Template V2-->
	<%-- Meta data--%>
		<%@ include file="include/shared/meta_tag.jsp"%>
		<%@ include file="include/shared/social_network.jsp"%>
	<%-- End Meta data--%>

	<%-- Core Header Scripts--%>
		<%@ include file="include/shared/core_css.jsp"%>
		<%@ include file="include/shared/core_js.jsp"%>
		<%@ include file="include/shared/i18n.jsp"%>

		<script>
			var context = "${pageContext.request.contextPath}";
			var language = "${language}";
			var affiliate = "${affiliate}";
			var home_url = "<%=request.getContextPath()%>";
			<%--For Savie online 2016 JS --%>
			var getpath = "<%=request.getContextPath()%>";
			<%--For Savie online 2016 JS END--%>
			var actionName = "<%=actionName%>";
		</script>
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

		<link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/favicon.ico" />

	</head>

	<body class="<%=langBodyClass%>">

	<%-- GTM Scripts--%>
		<%@ include file="include/shared/google_tag_manager.jsp"%>
	<%-- End GTM Scripts--%>

	<%-- Body Scripts--%>
		<%@ include file="include/merged/header_v2.jsp"%>

		<div class="closeMobileMenu">
			<dec:body />
		</div>

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

		<%@ include file="/WEB-INF/jsp/merged/comp/notification.jsp"%>
	<%-- End Module Scripts--%>

	<%-- Third Party Scripts--%>
		<%@ include file="include/shared/facebook_share.jsp"%>
		<%@ include file="include/shared/livechat.jsp"%>
	<%-- End Third Party Scripts--%>

	</body>
</html>
