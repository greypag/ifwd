<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="enhance" uri="http://pukkaone.github.com/jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="dec"%>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<!DOCTYPE HTML>
<html ng-app="fwdDemo" ng-controller="ctrlFwdiscover">
<head>
<%-- <%
if(request.getRequestURI().indexOf("/become-partner")>0) {
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/material.min.css" />
<% } %> --%>
<script type="text/javascript">
	window.status = "Loading: Document body...";
</script>

<!-- Title -->
<title>${pageTitle}</title>
<meta name='description' content="${pageMetaDataDescription}">
<meta name="format-detection" content="telephone=no">
<meta http-equiv="Cache-control" content="no-cache, no-store">
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<%
	boolean langFlag = false;
	if (session.getAttribute("language") != null) {
		langFlag = true;
	} else {
		langFlag = false;
	}
%>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">
<meta name='keywords' content="meta keywords here" />
<!-- Schema.org markup for Google+ -->
<meta itemprop="headline" content="${ogTitle}" />
<meta itemprop="description" content="${ogDescription}" />
<meta itemprop="image" content="${ogImage}" />
<!-- Open Graph data -->
<meta property="og:title" content="${ogTitle}" />
<meta property="og:type" content="${ogType}" />
<meta property="og:url" content="${ogUrl}" />
<meta property="og:image" content="${ogImage}" />
<meta property="og:image:secure_url" content="${ogImage}" />
<meta property="og:description" content="${ogDescription}" />
<meta property="og:site_name" content="${ogSiteName}" />
<!-- Twitter Card data -->
<meta property="twitter:title" content="${ogTitle}" />
<meta property="twitter:description" content="${ogDescription}" />
<meta property="twitter:card" content="${twitterCard}" />
<meta property="twitter:image" content="${twitterImage}" />
<meta name="twitter:site" content="${twitterSite}" />
<meta name="twitter:url" content="${twitterUrl}" />

<link rel="canonical" href="${canonical}" />

<%
	String requestUri = request.getRequestURI();
%>
<%
	if (!requestUri.endsWith("-insurance")
			&& !(requestUri.endsWith("/tc/home") || requestUri.endsWith("/tc/home/")
					|| requestUri.endsWith("/tc") || requestUri.endsWith("/tc/"))
			&& !(requestUri.endsWith("/en/home") || requestUri.endsWith("/en/home/")
					|| requestUri.endsWith("/en") || requestUri.endsWith("/en/"))
			&& !requestUri.endsWith("/offers") && !requestUri.endsWith("/faq")) {
%>
<meta name="robots" content="noindex">
<%
	}

	if (requestUri.endsWith("/tc/home") || requestUri.endsWith("/tc/home/") || requestUri.endsWith("/tc")
			|| requestUri.endsWith("/tc/")) {
%>
<link rel="alternate" hreflang="en" href="https://i.fwd.com.hk/en" />
<%
	} else if (requestUri.endsWith("/en/home") || requestUri.endsWith("/en/home/") || requestUri.endsWith("/en")
			|| requestUri.endsWith("/en/")) {
%>
<link rel="alternate" hreflang="zh-HK" href="https://i.fwd.com.hk/tc" />
<%
	} else if (requestUri.indexOf("/en/") >= 0) {
%>
<link rel="alternate" hreflang="zh-HK"
	href="<%=requestUri.replaceAll("/en/", "/tc/")%>" />
<%
	} else if (requestUri.indexOf("/tc/") >= 0) {
%>
<link rel="alternate" hreflang="en"
	href="<%=requestUri.replaceAll("/tc/", "/en/")%>" />
<%
	}
%>
<%@ include file="include/setup.jsp"%>
<%--<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/fwdiscover/seed.js"></script> --%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/fwdiscover/angular/angular.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/fwdiscover/angular-animate/angular-animate.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/fwdiscover/angular-scroll/angular-scroll.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/fwdiscover/angular-sanitize/angular-sanitize.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/fwdiscover/lodash/dist/lodash.min.js"></script>
<!-- Start Visual Website Optimizer Asynchronous Code -->
<script type='text/javascript'>
	var _vwo_code = (function() {
		var account_id = 190010, settings_tolerance = 5000, library_tolerance = 5000, use_existing_jquery = false,
		// DO NOT EDIT BELOW THIS LINE
		f = false, d = document;
		return {
			use_existing_jquery : function() {
				return use_existing_jquery;
			},
			library_tolerance : function() {
				return library_tolerance;
			},
			finish : function() {
				if (!f) {
					f = true;
					var a = d.getElementById('_vis_opt_path_hides');
					if (a)
						a.parentNode.removeChild(a);
				}
			},
			finished : function() {
				return f;
			},
			load : function(a) {
				var b = d.createElement('script');
				b.src = a;
				b.type = 'text/javascript';
				b.innerText;
				b.onerror = function() {
					_vwo_code.finish();
				};
				d.getElementsByTagName('head')[0].appendChild(b);
			},
			init : function() {
				settings_timer = setTimeout('_vwo_code.finish()',
						settings_tolerance);
				this.load('//dev.visualwebsiteoptimizer.com/j.php?a='
						+ account_id + '&u=' + encodeURIComponent(d.URL)
						+ '&r=' + Math.random());
				var a = d.createElement('style'), b = 'body{opacity:0 !important;filter:alpha(opacity=0) !important;background:none !important;}', h = d
						.getElementsByTagName('head')[0];
				a.setAttribute('id', '_vis_opt_path_hides');
				a.setAttribute('type', 'text/css');
				if (a.styleSheet)
					a.styleSheet.cssText = b;
				else
					a.appendChild(d.createTextNode(b));
				h.appendChild(a);
				return settings_timer;
			}
		};
	}());
	_vwo_settings_timer = _vwo_code.init();
</script>
<!-- End Visual Website Optimizer Asynchronous Code -->

<!-- Kenshoo Button Click Code -->
<script type=text/javascript>
	function kVoid() {
		return;
	}
	function kenshoo_conv(type, value, orderId, promoCode, valueCurrency) {
		var hostProtocol = (("https:" == document.location.protocol) ? "https"
				: "http");
		var url = hostProtocol
				+ "://5198.xg4ken.com/media/redir.php?track=1&id=67bda50a-b010-4425-9f2b-165bf9a1d04a&type="
				+ type + "&val=" + value + "&orderId=" + orderId
				+ "&valueCurrency=" + valueCurrency + "&promoCode=" + promoCode
				+ "&ref=" + document.referrer;
		var a = new Image(1, 1);
		a.src = url;
		a.onload = function() {
			kVoid();
		}
	}
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
<link rel="icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/resources/images/favicon.ico" />
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
	<!-- Google Enabling Rich Snippets for Products -->

	<%-- <enhance:out escapeXml="false"> --%>
	<!-- <div itemscope itemtype="http://schema.org/Product"> -->
	<%--    <span itemprop="brand">${googleRickSnippetBrand}</span> --%>
	<%--    <span itemprop="name">${googleRickSnippetName}</span> --%>
	<%--    <img itemprop="image" src="${googleRickSnippetImageUrl}" alt="${googleRickSnippetImageAlt}" /> --%>
	<%--    <div itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">${googleRickSnippetRating}</div> --%>

	<!--    <div itemprop="offers" itemscope itemtype="http://schema.org/Offer"> -->
	<%--        <span itemprop="price">${googleRickSnippetPrice}</span> --%>
	<%--        <link itemprop="availability" href="${googleRickSnippetAvailability}" />${googleRickSnippetAvailabilityText} --%>
	<!--    </div> -->

	<%--    <u>${googleRickSnippetDescription1}</u> <span itemprop="description">${googleRickSnippetDescription2}</span> --%>
	<!-- </div> -->
	<%-- </enhance:out> --%>
	<!--END -Google Enabling Rich Snippets for Products-->
	<%@ include file="include/merged/header.jsp"%>
	<div class="commonBody"><dec:body /></div>
	<%@ include file="include/merged/footer.jsp"%>

	<script type="text/javascript">
		window.status = "Done";
	</script>
</body>
</html>
