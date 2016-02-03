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
<% String requestUri = request.getRequestURI(); %>
<% if(!requestUri.endsWith("regular-premium")) { %>
<meta name="robots" content="noindex">
<% }%>

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
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/styles.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/savie-regular-styles.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/datepicker3.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/jquery.timepicker.css">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>

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
settings_tolerance=2000,
library_tolerance=2500,
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
		<script type=text/javascript>
			var params = new Array();
			params[0]='id=67bda50a-b010-4425-9f2b-165bf9a1d04a';
			params[1]='type=Registration_Step1';
			params[2]='val=0.0';
			params[3]='orderId=0';
			params[4]='promoCode=Regis_Savie_Step1 ZH';
			params[5]='valueCurrency=USD';
			params[6]='GCID='; //For Live Tracking only
			params[7]='kw='; //For Live Tracking only
			params[8]='product='; //For Live Tracking only
			k_trackevent(params,'5198');
		</script>
	
		<noscript>
			<img src="https://5198.xg4ken.com/media/redir.php?track=1&token=67bda50a-b010-4425-9f2b-165bf9a1d04a&type=Registration_Step1&val=0.0&orderId=0&promoCode=Regis_Savie_Step1 ZH&valueCurrency=USD&GCID=&kw=&product=" width="1" height="1">
		</noscript>
		
		<!--LightBox Pop Up-->
		<script type=text/javascript>
			var hostProtocol = (("https:" == document.location.protocol) ? "https" : "http");
			document.write('<scr'+'ipt src="', hostProtocol+
			'://5198.xg4ken.com/media/getpx.php?cid=67bda50a-b010-4425-9f2b-165bf9a1d04a','" type="text/JavaScript"><\/scr'+'ipt>');
		</script>
		<script type=text/javascript>
			var params = new Array();
			params[0]='id=67bda50a-b010-4425-9f2b-165bf9a1d04a';
			params[1]='type=Registration';
			params[2]='val=0.0';
			params[3]='orderId=0';
			params[4]='promoCode=Regis_Savie ZH';
			params[5]='valueCurrency=USD';
			params[6]='GCID='; //For Live Tracking only
			params[7]='kw='; //For Live Tracking only
			params[8]='product='; //For Live Tracking only
			k_trackevent(params,'5198');
		</script>
		
		<noscript>
			<img src="https://5198.xg4ken.com/media/redir.php?track=1&token=67bda50a-b010-4425-9f2b-165bf9a1d04a&type=Registration&val=0.0&orderId=0&promoCode=Regis_Savie ZH&valueCurrency=USD&GCID=&kw=&product=" width="1" height="1">
		</noscript>

		<script type=text/javascript>
			var hostProtocol = (("https:" == document.location.protocol) ? "https" : "http");
			document.write('<scr'+'ipt src="', hostProtocol+
			'://5198.xg4ken.com/media/getpx.php?cid=67bda50a-b010-4425-9f2b-165bf9a1d04a','" type="text/JavaScript"><\/scr'+'ipt>');
			</script>
			<script type=text/javascript>
			var params = new Array();
			params[0]='id=67bda50a-b010-4425-9f2b-165bf9a1d04a';
			params[1]='type=Registration_Savie_Survey';
			params[2]='val=0.0';
			params[3]='orderId=0';
			params[4]='promoCode=Regis_Savie_Survey ZH';
			params[5]='valueCurrency=USD';
			params[6]='GCID='; //For Live Tracking only
			params[7]='kw='; //For Live Tracking only
			params[8]='product='; //For Live Tracking only
			k_trackevent(params,'5198');
		</script>
		
		<noscript>
			<img src="https://5198.xg4ken.com/media/redir.php?track=1&token=67bda50a-b010-4425-9f2b-165bf9a1d04a&type=Registration_Savie_Survey&val=0.0&orderId=0&promoCode=Regis_Savie_Survey ZH&valueCurrency=USD&GCID=&kw=&product=" width="1" height="1">
		</noscript>
		
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
		<%-- <%@ include file="include/merged/saints/header.jsp"%> --%>
		<%@ include file="include/merged/header.jsp"%>
		<dec:body />
		<%@ include file="include/merged/saints/footer.jsp"%>
	</div>
	

	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/ZeroClipboard.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.i18n.properties-min-1.0.9.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/main.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/wow.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bootstrap-datepicker.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/locales/bootstrap-datepicker.zh-TW.js"></script>  
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jasny-bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/number-spinner.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.placeholder.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/numeral.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/fwd.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.payment.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.timepicker.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.placeholder.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/elite-term/jSignature.min.js"></script> 
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/savie-2016/custom.js"></script>

	<script type="text/javascript">
		window.status = "Done";
	</script>



</body>
</html>
