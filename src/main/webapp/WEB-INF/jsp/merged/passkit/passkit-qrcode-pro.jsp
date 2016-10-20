<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
	<script type="text/javascript">
    window.status = "Loading: Document body...";
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

	<script src="resources/js/jquery-1.12.2.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script src="resources/js/animatescroll.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
	<script src="resources/js/moment-with-locales.min.js"></script>
	<script src="resources/js/bootstrap-datetimepicker.min.js"></script>
	<script src="resources/js/bootstrapValidator.min.js"></script>
	<script src="resources/js/mobiscroll.custom-2.17.2.min.js"></script>
	<script src="resources/js/mobiscroll.i18n.en_fwd.js"></script>
	<script src="resources/js/mobiscroll.i18n.zh_fwd.js"></script>
	<script src="resources/js/dropzone.js"></script>
	<script src="resources/js/common.js"></script>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"
	/>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/passkit/bootstrap-datetimepicker.min.css">
	<link rel="<%=request.getContextPath()%>/resources/css/passkit/bootstrapValidator.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/passkit/titatoggle-dist-min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/passkit/mobiscroll.custom-2.17.2.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/passkit/dropzone.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/passkit/all.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/passkit/common.css" />

	<link rel="stylesheet" type="text/css" href="include/css/travelcare.css" />

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

	<link rel="icon" type="image/x-icon" href="resources/images/favicon.ico" />
</head>

<body>

	<header>
		<div class="full-width-container">
			<div class="container">
				<div class="top-nav">
					<div class="float-right">
						<div class="language">
							<ul class="nav">
								<li><a class="active" href="/fwdhk/changeLang?selectLang=en&action=/en" target="_top" data-lang="en">EN</a></li>
								<li><a class="inactive" href="/fwdhk/changeLang?selectLang=tc&action=/en" target="_top" data-lang="tc">中</a></li>
							</ul>
						</div>
					</div>
					<div class="logo-wrap">
						<a href="/fwdhk/en">
							<img class="logo" src="resources/images/mobile_logo.png" alt="" />
						</a>
					</div>
				</div>
			</div>
		</div>
	</header>

	<div class="container main landing travelcare">
		<div class="hero" style="background-image: url('include/images/banner.jpg');"></div>
		<div>
			<!-- body start -->
			<div class="col-xs-12 center verify-page">
				<div class="verify-qr-code tabbed-page current">
					<h3 class="verify-title">
						下載證明書
					</h3>
					<p>請以手機掃描以下QR條碼以下載流動版本的保險證明書。</p>
					<div class="qr-code"><img src="include/images/qr-sample.png" /></div>
					<p class="verify-remark">提示：於下載證明書期間，您的個人資料將會轉交予服務供應商以作於流動手機版本下載之用。</p>
				</div>
			</div>
			<!-- body end -->
		</div>
	</div>

	<footer class="footer-small visible-sm visible-xs">
		<div class="container">
			<div class="corp-links">
				<ul class="nav">
					<li><a href="http://www.fwd.com.hk/tc" target="_blank">富衛主頁</a></li>
					<li><a href="http://blog.fwd.com.hk/zh" target="_blank">富衛博客</a></li>
				</ul>
			</div>
		</div>
		<div class="full-width-container">
			<div class="container">
				<div class="copyright-links">
					<ul class="nav">
						<li><a href="https://www.fwd.com.hk/tc/online-security/" target="_blank">網上保安</a></li>
						<li><a href="https://www.fwd.com.hk/tc/disclaimer/" target="_blank">免責聲明</a></li>
						<li><a href="https://www.fwd.com.hk/tc/personal-data-protection-policy-and-practices/" target="_blank">個人資料保護政策及執行</a></li>
					</ul>
					<p>&copy; 2016 富衛香港　版權所有　不得轉載</p>
				</div>
			</div>
		</div>
	</footer>
	<footer class="footer-large hidden-sm hidden-xs">
		<div class="container">
			<div class="row">
				<div class="col-sm-8 copyright-links">
					<ul class="nav">
						<li><a href="https://www.fwd.com.hk/tc/online-security/" target="_blank">網上保安</a></li>
						<li><a href="https://www.fwd.com.hk/tc/disclaimer/" target="_blank">免責聲明</a></li>
						<li><a href="https://www.fwd.com.hk/tc/personal-data-protection-policy-and-practices/" target="_blank">個人資料保護政策及執行</a></li>
					</ul>
					<p>&copy; 2016 富衛香港　版權所有　不得轉載</p>
				</div>
				<div class="col-sm-4 corp-links">
					<ul class="nav">
						<li><a href="http://www.fwd.com.hk/tc" target="_blank">富衛主頁</a></li>
						<li><a href="http://blog.fwd.com.hk/zh" target="_blank">富衛博客</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>

	<script type="text/javascript">
    window.status = "Done";
  </script>
</body>

</html>