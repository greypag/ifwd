<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="dec"%>
	
<!DOCTYPE HTML>
<html>

<%-- <head>
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

		<script src="<%=request.getContextPath()%>/resources/js/passkit/jquery-1.12.2.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/passkit/animatescroll.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/passkit/bootstrap-datepicker.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/passkit/moment-with-locales.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/passkit/bootstrap-datetimepicker.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/passkit/bootstrapValidator.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/passkit/mobiscroll.custom-2.17.2.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/passkit/mobiscroll.i18n.en_fwd.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/passkit/mobiscroll.i18n.zh_fwd.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/passkit/dropzone.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/passkit/common.js"></script>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap-theme.min.css"/>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/datepicker3.min.css"/>
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
</head> --%>

<body>

	

	<div class="container main landing travelcare">
		<div class="hero" style="background-image: url('<%=request.getContextPath()%>/resources/images/passkit/banner.jpg');"></div>
		<div>
			<!-- body start -->
			<div class="col-xs-12 center verify-page">

				<div class="verify-form tabbed-page">
					<h3 class="verify-title">
						身份驗證
					</h3>
					<p>您即將下載電子版本的保險證明書。<br/>請選擇您於保單的身份以繼續︰</p>
					<div class="verify-content">
						<!-- server update -->
						<input type="hidden" id="tbx-policy-no" value="74ZZ20349" />
						<div class="verify-option">
							<label>
							<span class="radio"></span>
							<span class="radio-txt">投保人</span>
							<input type="radio" name="usertype" value="applicant" />
						</label>
						</div>
						<div class="verify-detail" data-type="applicant">
							<p>
								請輸入您香港身份證號碼<br/>的頭5位字母或數字以作驗證
								<br/>（您輸入的資料，必須與申請紀錄一致)
							</p>
							<input class="verify-textfield" type="text" id="tbx-applicant-hkid" placeholder="(例如︰A1234)" maxlength="5" />
							<div class="verify-error" data-error-for="tbx-applicant-hkid" data-error-validate="投保人資料不正確" data-error-required="請輸入您香港身份證號碼"></div>
						</div>
						<div class="verify-option">
							<label>
							<span class="radio"></span>
							<span class="radio-txt">被保人</span>
							<input type="radio" name="usertype" value="insuredperson" />
						</label>
						</div>
						<div class="verify-detail" data-type="insuredperson">
							<p>
								請輸入您的香港身份證或護照號碼<br/>的頭5位字母或數字以作驗證
								<br/>（您輸入的資料，必須與申請紀錄一致)
							</p>
							<input class="verify-textfield" type="text" id="tbx-insuredperson-hkid" placeholder="(例如︰A1234)" maxlength="5" />
							<div class="verify-error" data-error-for="tbx-insuredperson-hkid" data-error-validate="被保人資料不正確" data-error-required="請輸入您的香港身份證或護照號碼"></div>
						</div>
						<div class="verify-action">
							<input type="submit" value="提交" class="verify-button" id="tbx-verify-submit" />
							<p class="verify-remark">
								只要按下提交，您便可下載流動版本的保險證明書。此證書可於iOS或Andriod系統上顯示及儲存於您的手機，方便您聯絡我們或查閱保單詳情。
							</p>
						</div>
					</div>
				</div>

				<div class="verify-expired tabbed-page">
					<h3 class="verify-title">
						證明書已逾期
					</h3>
					<p>您好！您的證明書已逾期，我們希望您有一個愉快的旅程。</p>
					<p class="verify-remark">如欲查看更多精彩優惠，請到<a href="https://i.fwd.com.hk">i.fwd.com.hk</a>。</p>
					<p class="verify-remark">如有任何查詢或索償，請致電富衛24小時服務熱線(852) 3123 3123或瀏覽本公司的<a href="https://www.fwd.com.hk">網站</a>以了解索償程序。</p>
				</div>

				<div class="verify-qr-code tabbed-page">
					<h3 class="verify-title">
						下載證明書
					</h3>
					<p>請以手機掃描以下QR條碼以下載流動版本的保險證明書。</p>
					<div class="qr-code"><img src="<%=request.getContextPath()%>/resources/images/passkit/qr-sample.png" /></div>
					<p class="verify-remark">提示：於下載證明書期間，您的個人資料將會轉交予服務供應商以作於流動手機版本下載之用。</p>
				</div>

				<div class="verify-system-error tabbed-page">
					<h3 class="verify-title">
						System busy
					</h3>
					<p>System busy, please try again later.</p>
				</div>
			</div>

			<div class="loading-container">
			</div>
			<div class="loading">
				<div class="loading-inner">
					<div class='loading-anim'>
						<div style='top:80px;left:93px;width:14px;height:40px;background:#ffffff;-webkit-transform:rotate(0deg) translate(0,-60px);transform:rotate(0deg) translate(0,-60px);border-radius:10px;position:absolute;'></div>
						<div style='top:80px;left:93px;width:14px;height:40px;background:#ffffff;-webkit-transform:rotate(30deg) translate(0,-60px);transform:rotate(30deg) translate(0,-60px);border-radius:10px;position:absolute;'></div>
						<div style='top:80px;left:93px;width:14px;height:40px;background:#ffffff;-webkit-transform:rotate(60deg) translate(0,-60px);transform:rotate(60deg) translate(0,-60px);border-radius:10px;position:absolute;'></div>
						<div style='top:80px;left:93px;width:14px;height:40px;background:#ffffff;-webkit-transform:rotate(90deg) translate(0,-60px);transform:rotate(90deg) translate(0,-60px);border-radius:10px;position:absolute;'></div>
						<div style='top:80px;left:93px;width:14px;height:40px;background:#ffffff;-webkit-transform:rotate(120deg) translate(0,-60px);transform:rotate(120deg) translate(0,-60px);border-radius:10px;position:absolute;'></div>
						<div style='top:80px;left:93px;width:14px;height:40px;background:#ffffff;-webkit-transform:rotate(150deg) translate(0,-60px);transform:rotate(150deg) translate(0,-60px);border-radius:10px;position:absolute;'></div>
						<div style='top:80px;left:93px;width:14px;height:40px;background:#ffffff;-webkit-transform:rotate(180deg) translate(0,-60px);transform:rotate(180deg) translate(0,-60px);border-radius:10px;position:absolute;'></div>
						<div style='top:80px;left:93px;width:14px;height:40px;background:#ffffff;-webkit-transform:rotate(210deg) translate(0,-60px);transform:rotate(210deg) translate(0,-60px);border-radius:10px;position:absolute;'></div>
						<div style='top:80px;left:93px;width:14px;height:40px;background:#ffffff;-webkit-transform:rotate(240deg) translate(0,-60px);transform:rotate(240deg) translate(0,-60px);border-radius:10px;position:absolute;'></div>
						<div style='top:80px;left:93px;width:14px;height:40px;background:#ffffff;-webkit-transform:rotate(270deg) translate(0,-60px);transform:rotate(270deg) translate(0,-60px);border-radius:10px;position:absolute;'></div>
						<div style='top:80px;left:93px;width:14px;height:40px;background:#ffffff;-webkit-transform:rotate(300deg) translate(0,-60px);transform:rotate(300deg) translate(0,-60px);border-radius:10px;position:absolute;'></div>
						<div style='top:80px;left:93px;width:14px;height:40px;background:#ffffff;-webkit-transform:rotate(330deg) translate(0,-60px);transform:rotate(330deg) translate(0,-60px);border-radius:10px;position:absolute;'></div>
					</div>
					<div class="loading-text">請稍後</div>
				</div>
			</div>

			<!-- body end -->
		</div>
	</div>

	<!-- <footer class="footer-small visible-sm visible-xs">
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
	</footer> -->

	<script type="text/javascript">
    window.status = "Done";
  </script>
</body>

</html>