<head>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

<dec:head />

</head>
	<%
	if (langFlag && "EN".equals(session.getAttribute("language").toString())) {
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
        <img src="http://localhost:8080/FWDHKPH1A/resources/images/icon1.png">
    </div>
    
    
    <div align="center" style="margin-top:50px;" >
        <h3 style="bold !important; font-weight: 900; font-size:30px;">
            <!-- System maintenance -->
            <fmt:message key="system.under.maintenance.notice" bundle="${msg}" /> 
        </h3>
    </div>
    
    
    <div align="center" style="margin-top:38px;" >
        <h3 style="font-size:23px;">
            <!-- Our site is currently undergoing scheduled maintenance. -->
            <fmt:message key="system.under.scheduled.maintenance" bundle="${msg}" /> 
            <br>
            <br>
            <!-- Please try again later. For any further assistance, please call our 24-hour hotline. -->
            <fmt:message key="system.assistance.hotline.call" bundle="${msg}" /> 
        </h3>
    </div>
    
    <div align="center" style="margin-top:55px; margin-bottom:80px;" >
        <a href="/" class="btn-box-2 color4 " style="padding-left:25px; padding-right:25px;" >
        <!-- Back to Home -->
        <fmt:message key="system.back.to.me" bundle="${msg}" /> 
        </a>
    </div>
    
    
</div>
<!--------/end- Main Content------------>
		<jsp:include page="/WEB-INF/decorators/include/merged/footer.jsp" />
</body>
 