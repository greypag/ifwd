<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="dec"%>

<%-- <%
	session.setAttribute("language", "EN");
	session.setAttribute("page", request.getServletPath());
%> --%>
<!DOCTYPE HTML>
<html>
<%@ include file="include/merged/browser.jsp"%>
<head>
<script type="text/javascript">
	window.status = "Loading: Document body...";
</script>

<!-- Title -->
<title>${pageTitle}</title>
<meta name='description' content="${pageMetaDataDescription}" >
<meta name="format-detection" content="telephone=no">
<meta http-equiv="Cache-control" content="no-cache, no-store">

<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<% boolean langFlag = false;
 if(session.getAttribute("language") != null){
	 langFlag = true;
 } else {
	 langFlag = false;
 }
%> 
<meta http-equiv="X-UA-Compatible" content="IE=edge">


<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="robots" content="NOODP">
<meta name='keywords' content="meta keywords here"/>


<!-- Schema.org markup for Google+ -->
<meta itemprop="name" content="${ogTitle}" />
<meta itemprop="description" content="${ogDescription}"/>
<meta itemprop="image" content="${ogImage}" />

<!-- Open Graph data -->
<meta property="og:title" content="${ogTitle}" />
<meta property="og:type" content="${ogType}" />
<%-- <meta property="og:url" content="${ogUrl}" /> --%>
<meta property="og:image" content="${ogImage}" />
<meta property="og:description" content="${ogDescription}"/>
<meta property="og:site_name" content="Moz" />

<!-- Twitter Card data -->     
<meta property="twitter:title" content="${ogTitle}" />
<meta property="twitter:description" content="${ogDescription}"/>
<meta property="twitter:card" content="${ogImage}" />
<meta property="twitter:image:src" content="${ogImage}" />
     
 




<%@ include file="include/setup.jsp"%>
<link rel="alternate" hreflang="en" href="" />
<link rel="alternate" hreflang="zh-HK" href="" />
<link rel="canonical" href=""/>


<dec:head />

</head>
	<%
	if (langFlag && "EN".equals(session.getAttribute("language").toString().toUpperCase())) {
	%>
		<body>
	<%
	} else {
	%>
		<body class="chin">	
	<%
	}
	%>
	<%@ include file="include/merged/header.jsp"%>
	<dec:body />
	<%@ include file="include/merged/footer.jsp"%>
	
	<script type="text/javascript">
		window.status = "Done";
	</script>



</body>
</html>
