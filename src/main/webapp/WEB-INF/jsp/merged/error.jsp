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
<%-- 	<%@ include file="/WEB-INF/decorators/include/merged/header.jsp"%> --%>
	
    <div class="container annexure-form error-page " >
    	<div class="col-xs-12">
    		<div class="company form-regisration error">
				<h4>${errorHeader1}</strong></h4><br>
				<h4><strong>${errorDescription1}</strong></h4><br>
				<h4>${errorHeader2}</h4><br>
				<h4><strong>${errorDescription2}</strong></h4><br>
				
			</div>
			<div class="row">
	            <div class="col-xs-12 col-sm-12 col-md-4">
					<a href="<%=request.getContextPath()%>/${language}/home" class="bdr-curve btn btn-primary btn-next">Go Back to Home / 返回主頁</a>
	            </div>
            </div>
		</div>
	</div>
<%-- 		<jsp:include page="/WEB-INF/decorators/include/merged/footer.jsp" /> --%>
</body>
 