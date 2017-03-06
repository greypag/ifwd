<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="dec"%>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<c:set var="langLink" value="${language == 'tc' ? 'zh-HK' : 'en-US'}" />
<c:set var="captchaLang" value="${language == 'tc' ? 'zh-TW' : 'en'}" />
	
	
<!DOCTYPE HTML>
<html>
 <head>
	<script type="text/javascript">
    window.status = "Loading: Document body...";
    var context="<%=request.getContextPath()%>";
    var language = "${language}";

  </script>

	<!-- Title -->
	<title>Travel Care - Traveling Insurance| FWD Hong Kong</title>
	<meta name='description' content="">
	<meta name="format-detection" content="telephone=no">
	<meta http-equiv="Cache-control" content="no-cache, no-store">
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />

	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta name='keywords' content="meta keywords here" />
	<!-- Schema.org markup for Google+ -->
	<meta itemprop="headline" content="" />
	<meta itemprop="description" content="" />
	<meta itemprop="image" content="" />
	<!-- Open Graph data -->
	<meta property="og:title" content="" />
	<meta property="og:type" content="" />
	<meta property="og:url" content="" />
	<meta property="og:image" content="" />
	<meta property="og:image:secure_url" content="" />
	<meta property="og:description" content="" />
	<meta property="og:site_name" content="" />
	<!-- Twitter Card data -->
	<meta property="twitter:title" content="" />
	<meta property="twitter:description" content="" />
	<meta property="twitter:card" content="" />
	<meta property="twitter:image" content="" />
	<meta name="twitter:site" content="" />
	<meta name="twitter:url" content="" />

	<link rel="canonical" href="" />

	<link rel="alternate" hreflang="zh-HK" href="https://i.fwd.com.hk/tc" />

	<%-- 	<script src="<%=request.getContextPath()%>/resources/js/passkit/jquery-1.12.2.min.js"></script>
 --%>	<script src="<%=request.getContextPath()%>/resources/js/vendor/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/vendor/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/passkit/animatescroll.min.js"></script>
<%-- 	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/passkit/bootstrap-datepicker.min.js"></script>
 --%>	<script src="<%=request.getContextPath()%>/resources/js/passkit/moment-with-locales.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/passkit/bootstrap-datetimepicker.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/passkit/bootstrapValidator.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/passkit/mobiscroll.custom-2.17.2.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/passkit/mobiscroll.i18n.en_fwd.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/passkit/mobiscroll.i18n.zh_fwd.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/passkit/dropzone.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/passkit/common.js"></script>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
<%-- 	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap-theme.min.css"/>
 --%>	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/datepicker3.min.css"/>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap-datetimepicker.css"/>
	<link rel="<%=request.getContextPath()%>/resources/css/bootstrapValidator.min.css"/>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/passkit/titatoggle-dist-min.css"/>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/passkit/mobiscroll.custom-2.17.2.min.css"/>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/passkit/dropzone.css"/>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/passkit/all.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/passkit/common.css" />

	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/passkit/travelcare.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/passkit/loading.css" />

	<script src="<%=request.getContextPath()%>/resources/js/passkit/travelcare.js"></script>

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
    var UILANGUAGE = 'en';
  </script>

	<link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/images/passkit/favicon.ico" />
</head>

<body <c:out  value="${language == 'tc' ? 'class=\"zh\"' : ''}"  escapeXml="boolean"/>>


	<%@ include file="include/merged/passkit/header.jsp"%>
	<div class="closeMobileMenu commonBody"><dec:body /></div>
	<%@ include file="include/merged/passkit/footer.jsp"%>	

	<script type="text/javascript">
    window.status = "Done";
  </script>
</body>

</html>