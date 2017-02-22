<!DOCTYPE HTML>
<html>
<head>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% response.setStatus(404); %>
<script type="text/javascript">
	window.status = "Loading: Document body...";
</script>

<!-- Title -->
<title>${pageTitle}</title>
<meta name='description' content="${pageMetaDataDescription}" >

<meta property="og:title" content="${ogTitle}" />
<meta property="og:type" content="${ogType}" />
<meta property="og:url" content="${ogUrl}" />
<meta property="og:image" content="${ogImage}" />
<meta property="og:image:secure_url" content="${ogImage}" />
<meta property="og:description" content="${ogDescription}"/>




<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<% boolean langFlag = false;
 if(session.getAttribute("language") != null){
	 langFlag = true;
 } else {
	 langFlag = false;
 }
%> 
<%@ include file="/WEB-INF/decorators/include/setup.jsp"%>
<link rel="alternate" hreflang="en" href="" />
<link rel="alternate" hreflang="zh-HK" href="" />
<link rel="canonical" href=""/>
<meta name="format-detection" content="telephone=no">
<meta http-equiv="Cache-control" content="no-cache, no-store">
<meta property="og:type" content="website" />
<meta property="og:image" content="" />
<meta property="og:image:secure_url" content="" />
<meta property="og:title" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="FWD" />
<meta property="og:description" content="" />
<meta name="robots" content="NOODP">
<meta name='keywords' content="meta keywords here"/>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">


<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
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
	<%@ include file="/WEB-INF/decorators/include/merged/header.jsp"%>
	
<!--/#main-Content-->
<div class="container">

    <div align="center" style="margin-top:80px;">
        <img src="<%=request.getContextPath()%>/resources/images/icon1.png">
    </div>
    
    
    <div align="center" style="margin-top:50px;" >
        <h3 style="bold !important; font-weight: 900; font-size:30px;">
            <!-- Page not found -->
            <fmt:message key="erro.404.page.miss" bundle="${msg}" />
        </h3>
    </div>
    
    
    <div align="center" style="margin-top:35px;" >
        <h2 style="bold !important; font-weight:1200; font-size:90px; color:#f68a1d;">
            404
        </h3>
    </div>
    
    <div align="center" style="margin-top:30px;" >
        <h3 style="font-size:23px;">
            <!-- Your request page cannot be found or has been moved. -->
            <fmt:message key="erro.404.page.move" bundle="${msg}" />
            <br>
            <br>
            <!-- Please call our 24-hour hotline for any assistance. -->
            <fmt:message key="erro.404.call.assistance" bundle="${msg}" /> 
        </h3>
    </div>
    
    <div align="center" style="margin-top:55px; margin-bottom:80px;" >
        <a href="<%=request.getContextPath()%>/${language}" class="btn-box-2 color4 " style="padding-left:25px; padding-right:25px;" >
        <!-- Back to Home -->
        <fmt:message key="system.back.to.me" bundle="${msg}" />
        </a>
    </div>
    
    
</div>
<!--------/end- Main Content------------>
		<jsp:include page="/WEB-INF/decorators/include/merged/footer.jsp" />
</body>
</html>