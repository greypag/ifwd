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
<meta itemprop="headline" content="${ogTitle}" />
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
     
 




<%@ include file="include/setup.jsp"%>
<link rel="alternate" hreflang="en" href="" />
<link rel="alternate" hreflang="zh-HK" href="" />
<link rel="canonical" href=""/>

<!-- Start Visual Website Optimizer Asynchronous Code -->
<script type='text/javascript'>
var _vwo_code=(function(){
var account_id=95373,
settings_tolerance=2000,
library_tolerance=2500,
use_existing_jquery=false,
// DO NOT EDIT BELOW THIS LINE
f=false,d=document;return{use_existing_jquery:function(){return use_existing_jquery;},library_tolerance:function(){return library_tolerance;},finish:function(){if(!f){f=true;var a=d.getElementById('_vis_opt_path_hides');if(a)a.parentNode.removeChild(a);}},finished:function(){return f;},load:function(a){var b=d.createElement('script');b.src=a;b.type='text/javascript';b.innerText;b.onerror=function(){_vwo_code.finish();};d.getElementsByTagName('head')[0].appendChild(b);},init:function(){settings_timer=setTimeout('_vwo_code.finish()',settings_tolerance);this.load('//dev.visualwebsiteoptimizer.com/j.php?a='+account_id+'&u='+encodeURIComponent(d.URL)+'&r='+Math.random());var a=d.createElement('style'),b='body{opacity:0 !important;filter:alpha(opacity=0) !important;background:none !important;}',h=d.getElementsByTagName('head')[0];a.setAttribute('id','_vis_opt_path_hides');a.setAttribute('type','text/css');if(a.styleSheet)a.styleSheet.cssText=b;else a.appendChild(d.createTextNode(b));h.appendChild(a);return settings_timer;}};}());_vwo_settings_timer=_vwo_code.init();
</script>
<!-- End Visual Website Optimizer Asynchronous Code -->


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
	
	
	<%@ include file="include/merged/header.jsp"%>
	<dec:body />
	<%@ include file="include/merged/footer.jsp"%>
	
	<script type="text/javascript">
		window.status = "Done";
	</script>



</body>
</html>
