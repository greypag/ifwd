<!DOCTYPE HTML>
<html>
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
<meta http-equiv="X-UA-Compatible" content="IE=edge">


<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
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
	
    <div class="container annexure-form error-page " >
    	<div class="col-xs-12">
    		<h2 class="annexure-form-header">ERROR</h2>
		    <div class="company form-regisration error">
				<h3>ERROR No. 400</h3>
				<p>The following error was encountered:</p>
				<p>
					<strong>400 - Bad request.</strong>
				</p>
				<ul>
					<li>The request could not be understood by the server due to malformed syntax. </li>
					<li>The client should not repeat the request without modifications </li>
				</ul>
			</div>
			<div class="row">
	            <div class="col-xs-12 col-sm-12 col-md-4">
					<a href="<%=request.getContextPath()%>/${language}/home" class="bdr-curve-none btn btn-primary btn-next">Go Back to Home Page</a>
	            </div>
            </div>
		</div>
	</div>
		<jsp:include page="/WEB-INF/decorators/include/merged/footer.jsp" />
</body>
</html>