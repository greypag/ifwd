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
<!-- <meta name="robots" content="NOODP"> -->
<meta name='keywords' content="meta keywords here"/>


<!-- Schema.org markup for Google+ -->
<meta itemprop="name" content="${ogTitle}" />
<meta itemprop="description" content="${ogDescription}"/>
<meta itemprop="image" content="${ogImage}" />

<!-- Open Graph data -->
<meta property="og:title" content="${ogTitle}" />
<meta property="og:type" content="${ogType}" />
<meta property="og:url" content="${ogUrl}" />
<meta property="og:image" content="${ogImage}" />
<meta property="og:image:secure_url" content="${ogImage}" />
<meta property="og:description" content="${ogDescription}"/>
<meta property="og:site_name" content="${ogSiteName}" />

<!-- Twitter Card data -->
<meta property="twitter:title" content="${ogTitle}" />
<meta property="twitter:description" content="${ogDescription}"/>
<meta property="twitter:card" content="${ogImage}" />
<meta property="twitter:image:src" content="${ogImage}" />


<meta name="apple-mobile-web-app-capable" content="yes" />
<% String requestUri = request.getRequestURI(); %>

<!-- Bootstrap -->
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/savie/bootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/animate.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font-awesome.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/responsive.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jasny-bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/datepicker.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.mCustomScrollbar.min.css">

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/icomoon.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap-slider.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.jscrollpane.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/savie/styles.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/savie-styles.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/savie/datepicker3.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/jquery.timepicker.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/savie/header.css"> --%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/material.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/animate.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font-awesome.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/responsive.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jasny-bootstrap.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/datepicker.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.mCustomScrollbar.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/icomoon.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap-slider.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.jscrollpane.css">
<%
if(!(requestUri.endsWith("FNA/financial-needs-analysis") || requestUri.endsWith("FNA/review")
		 || requestUri.endsWith("FNA/product-recommendation"))) {
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/styles.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/savie-styles.css">
<%
}
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/savie/datepicker3.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/jquery.timepicker.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/pnotify.custom.min.css">
<!--[if lt IE 8]>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common-ie9.css">
<![endif]-->
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common-ie9.css">
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/js/elite-term/flashcanvas.js"></script>
<![endif]-->


<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/jquery.js"></script> --%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/ZeroClipboard.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/jquery.i18n.properties-min-1.0.9.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/custom.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/jquery.timepicker.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/jquery-ui.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/elite-term/jSignature.min.js"></script>
<!--[if IE]>
    <script src="<%=request.getContextPath()%>/resources/js/savie-2016/es5-shim.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/savie-2016/classList.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/savie-2016/selectivizr-min.js"></script>
<![endif]-->


<script>

	// handle when console is null/undefined especially in IE
	if (typeof console == "undefined") {
		this.console = {
	    	log: function() {},
	    	info: function() {},
	    	error: function() {},
	    	warn: function() {}
	  	};
	}

	// global variables
	var UILANGUAGE = '<%=session.getAttribute("language")%>';

</script>

<!-- Start Visual Website Optimizer Asynchronous Code -->
<script type='text/javascript'>
var _vwo_code=(function(){
var account_id=190010,
settings_tolerance=5000,
library_tolerance=5000,
use_existing_jquery=false,
// DO NOT EDIT BELOW THIS LINE
f=false,d=document;return{use_existing_jquery:function(){return use_existing_jquery;},library_tolerance:function(){return library_tolerance;},finish:function(){if(!f){f=true;var a=d.getElementById('_vis_opt_path_hides');if(a)a.parentNode.removeChild(a);}},finished:function(){return f;},load:function(a){var b=d.createElement('script');b.src=a;b.type='text/javascript';b.innerText;b.onerror=function(){_vwo_code.finish();};d.getElementsByTagName('head')[0].appendChild(b);},init:function(){settings_timer=setTimeout('_vwo_code.finish()',settings_tolerance);this.load('//dev.visualwebsiteoptimizer.com/j.php?a='+account_id+'&u='+encodeURIComponent(d.URL)+'&r='+Math.random());var a=d.createElement('style'),b='body{opacity:0 !important;filter:alpha(opacity=0) !important;background:none !important;}',h=d.getElementsByTagName('head')[0];a.setAttribute('id','_vis_opt_path_hides');a.setAttribute('type','text/css');if(a.styleSheet)a.styleSheet.cssText=b;else a.appendChild(d.createTextNode(b));h.appendChild(a);return settings_timer;}};}());_vwo_settings_timer=_vwo_code.init();
</script>
<!-- End Visual Website Optimizer Asynchronous Code -->

		<script type=text/javascript>
			var hostProtocol = (("https:" == document.location.protocol) ? "https" : "http");
			document.write('<scr'+'ipt src="', hostProtocol+
			'://5198.xg4ken.com/media/getpx.php?cid=67bda50a-b010-4425-9f2b-165bf9a1d04a','" type="text/JavaScript"><\/scr'+'ipt>');
		</script>

<script>
	var context = "${pageContext.request.contextPath}";
	var language = "${language}";
	var affiliate = "${affiliate}";
	var home_url = "<%=request.getContextPath()%>";
	<%--For Savie online 2016 JS --%>
	var getpath = "<%=request.getContextPath()%>";
	<%--For Savie online 2016 JS END--%>

	/*
	 * Global Site Variables
	 */
	var Site = {
		'context':'${pageContext.request.contextPath}',
		'language': '${language}',
		'affiliate': '${affiliate}',
	};

</script>
<dec:head />
<link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/favicon.ico" />
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

	<!--Google Code for SEO-->

<noscript>
	<iframe src="//www.googletagmanager.com/ns.html?id=GTM-MWPF25"
		height="0" width="0" style="display: none; visibility: hidden"></iframe>
</noscript>
<script>
	(function(w, d, s, l, i) {
		w[l] = w[l] || [];
		w[l].push({
			'gtm.start' : new Date().getTime(),
			event : 'gtm.js'
		});
		var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l='
				+ l
				: '';
		j.async = true;
		j.src = '//www.googletagmanager.com/gtm.js?id=' + i + dl;
		f.parentNode.insertBefore(j, f);
	})(window, document, 'script', 'dataLayer', 'GTM-MWPF25');
</script>
<!--END -Google Code for SEO-->
	<div class="fwd-savie-wrapper">
		<%@ include file="include/merged/header.jsp"%>
		<div class="closeMobileMenu commonBody"><dec:body /></div>
		<%@ include file="include/merged/footer.jsp"%>
	</div>

	<%-- 1111 Campaign --%>
	<%
		long current = System.currentTimeMillis();
    	long starttime = cformat.parse("2016-11-11 00:00:00").getTime();
    	long endtime = cformat.parse("2016-11-12 00:00:00").getTime();
    	if(current < endtime && current >= starttime){
    %> 
	<script>
		show_1111_campaign("<%=request.getContextPath()%>","${language}");	//refer to main.js
	</script>
	<% } %>
	<%-- End 1111 Campaign --%>
	


	<%-- <!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="<%=request.getContextPath()%>/resources/js/savie/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/savie/jasny-bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/savie/bootstrap-select.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/savie/jquery.touchSwipe.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/savie/custom.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/savie/placeholders.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/savie/date.format.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/vendor/jquery.i18n.properties-min-1.0.9.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/fwd.js"></script> --%>

	<script type="text/javascript">
		window.status = "Done";
	</script>



</body>
</html>
