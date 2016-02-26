







<!DOCTYPE HTML>
<html>
<head>
<script type="text/javascript">
	window.status = "Loading: Document body...";
</script>

<!-- Title -->
<title>FNA Review | FWD Hong Kong</title>
<meta name='description' content="" >
<meta name="format-detection" content="telephone=no">
<meta http-equiv="Cache-control" content="no-cache, no-store">
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
 
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name='keywords' content="meta keywords here"/>
<!-- Schema.org markup for Google+ -->
<meta itemprop="headline" content="" />
<meta itemprop="description" content=""/>
<meta itemprop="image" content="" />
<!-- Open Graph data -->
<meta property="og:title" content="FNA Review | FWD Hong Kong" />
<meta property="og:type" content="" />
<meta property="og:url" content="" />
<meta property="og:image" content="" />
<meta property="og:image:secure_url" content="" />
<meta property="og:description" content=""/>
<meta property="og:site_name" content="" />
<!-- Twitter Card data -->     
<meta property="twitter:title" content="" />
<meta property="twitter:description" content=""/>
<meta property="twitter:card" content="" />
<meta property="twitter:image:src" content="" />


<meta name="robots" content="noindex">

<link rel="alternate" hreflang="zh-HK" href="/tc/joinus" />

<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="/resources/css/animate.min.css" />
<link rel="stylesheet" href="/resources/css/font-awesome.css" />
<link rel="stylesheet" href="/resources/css/font-awesome.min.css" />
<!-- <link rel="stylesheet" href="/resources/css/prettyPhoto.css" /> -->
<link rel="stylesheet" href="/resources/css/main.css" />
<link rel="stylesheet" href="/resources/css/responsive.css" />
<link rel="stylesheet" href="/resources/css/jasny-bootstrap.min.css" />
<link rel="stylesheet" href="/resources/css/datepicker.min.css" />
<link rel="stylesheet" href="/resources/css/jquery.mCustomScrollbar.min.css">
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript" src="/resources/js/ZeroClipboard.js"></script>
<script type="text/javascript" src="/resources/js/jquery.i18n.properties-min-1.0.9.js"></script>

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

<!-- Kenshoo Button Click Code -->
<script type=text/javascript>
function kVoid() { return; }
function kenshoo_conv(type,value,orderId,promoCode,valueCurrency) {
	var hostProtocol = (("https:" == document.location.protocol) ? "https" : "http");
	var url = hostProtocol+"://5198.xg4ken.com/media/redir.php?track=1&id=67bda50a-b010-4425-9f2b-165bf9a1d04a&type="+ type + "&val=" + value + "&orderId=" + orderId + "&valueCurrency=" + valueCurrency + "&promoCode=" + promoCode + "&ref=" + document.referrer;
	var a = new Image(1,1);
	a.src = url;
	a.onload = function() { kVoid(); }
}
</script>


<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="">

<script src="/resources/js/fwd.js">
	
</script>
<script>
	$(function() {
		$("[data-toggle='tooltip']").tooltip();
	});
</script>
<script>
	function activateUserAccountJoinUs() {
		

		var validateFormVal = activateUserAccount();
		if (validateFormVal == true) {
			$.ajax({
						type : 'POST',
						url : '/{language}/joinus',
						data : $('#joinus_form form').serialize(),
						async : false,
						success : function(data) {
							
							if (data == 'success') {
								
								$('#success-message').show();
								$('#joinus-err-msg').hide();
								window.location.hash = '#success-message';
								$('#success-message').html("User succesfully Register"); 
// 								setTimeout(function() {document.joinus_form.action= "useraccount";								
// 								}, 3000);
 								if(window.top.document.referrer.indexOf("savings-insurance/plan-details")>0){
 									window.location.href = '/en/savings-insurance/plan-details?thankyou=thankyou';
 								}
 								else if(window.top.document.referrer.indexOf("term-life-insurance/select-plan")>0){
 									perventRedirect=false;
 									ga('send', 'event', 'Login', 'Click', 'Login success');
 									window.location.href= "/en/term-life-insurance/select-plan?goApp=yes";
 								}
 								else {
 									window.location.href = '/en/account';
 								}
// 								setTimeout(function() {window.location.href = '/getAccByUsernaneAndPassword';;								
// 								}, 3000);
								
							} else if(data == 'discover'){
								window.location.href = '/en/fwdiscover';
							} else {
								
								$('#joinus-err-msg').show();
								
								window.location.hash = '#joinus-err-msg';
                                if (data == 'This username already in use, please try again') {
                                    $('#joinus-err-msg').html('The Username has already been registered.');
                                } else if (data == 'email address and mobile no. already registered') {
                                    $('#joinus-err-msg').html('The Email Address and Mobile No. have already been registered.');
                                } else {
                                    $('#joinus-err-msg').html(data);
                                }

							} 
						},
						error : function(xhr, status, error) {

						}
					});
		}
		return false;
	}
</script>
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.ico" />
</head>
	
		<body>
	
	
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


<!-- <div itemscope itemtype="http://schema.org/Product"> -->





<!--    <div itemprop="offers" itemscope itemtype="http://schema.org/Offer"> -->


<!--    </div> -->


<!-- </div> -->

<!--END -Google Enabling Rich Snippets for Products-->	
	








<link rel="icon" type="image/x-icon"
	href="/resources/images/favicon.ico" />
<!-- <a href="javascript:void(0)" id="testajax" >Press</a> -->

<script src="/resources/js/jquery.i18n.properties-min-1.0.9.js"></script>
<script>

var getBundleLanguage = "";
var lang = UILANGUAGE;

if(lang === "EN") {
    getBundleLanguage = "en";
} else {
	if(lang === "tc") {
	    getBundleLanguage = "zh";
	} else {
	    getBundleLanguage = "en";
	}
}

$(window).bind("pageshow", function(event) {
    if (event.originalEvent.persisted) {
        //window.location.reload();
        $('#loading-overlay').modal('hide');
        $("#PaymentingDiv").hide();
        $("#button_confirm").show();
    }
});

/*
$( "#testajax" ).click(function() {
  
  
  $('#loading-overlay').modal({
	   backdrop: 'static',
	   keyboard: false
	})
});
*/




var home_url = "";

/* New GetBundle */
var _fwdErrMsg;

$.i18n.properties({
   name: 'Messages',
   path: ''+home_url+'/resources/bundle/',
   mode: 'map',
   language: getBundleLanguage,
   cache: false,
   callback: function() {
   	_fwdErrMsg = $.extend(true, {}, $.i18n);
   }
});


function fwdGetBundle(lang, key){ 
	return (_fwdErrMsg && _fwdErrMsg.map[key])?(_fwdErrMsg.map[key]):'['+key+']';
}

function getBundle(lang, key){
	return fwdGetBundle(lang,key);
}

function submitLoginForm(formID) {
	$('.login-ajax-loading').css({
		"left":"0px",
		"right":"0px"
	});
	$('.login-ajax-loading').show();
	$("#"+formID+' #login-err-msg').html("");
	$("#"+formID+' #login-err-msg').hide();
    setTimeout(function(){
		if (validUser(formID)) {
			$.ajax({
				type : "POST",
				url : "/userLogin",
				data : $("#"+formID).serialize(),//$("#headerLoginForm form").serialize(),
				async : false,
				success : function(data) {				
					if (data == 'success') {
						//$('.login-ajax-loading').hide();
						//var Backlen = history.length;
						//history.go(-Backlen);
						if(window.location.href.indexOf("savings-insurance/plan-details")>0){
							$('#loginpopup').modal('hide');
							$('#thankYouModal').modal({backdrop: 'static', keyboard: false});
							$('#thankYouModal').modal('show');
						}
						else if(window.location.href.indexOf("term-life-insurance/select-plan")>0){
							perventRedirect=false;
							ga('send', 'event', 'Login', 'Click', 'Login success');
							window.location.href= "/en/term-life-insurance/select-plan?goApp="+$('#goApp').val();
						}
						else {
							perventRedirect=false;
												ga('send', 'event', 'Login',
														'Click',
														'Login success');
												//location.reload();
												window.location.href = window.location.href;
											}
										} else if (data == 'Provided User Account Details Does Not Exist') {
											try {
												$('.login-ajax-loading').hide();
											} catch (error) {
											}
											$('#ajax-loading').hide();
											$("#" + formID + ' #login-err-msg')
													.show();
											$("#" + formID + ' #login-err-msg')
													.html(
															getBundle(
																	getBundleLanguage,
																	"member.login.fail.first"));
										} else if (data == 'Please provide a valid User Name and Password.') {
											try {
												$('.login-ajax-loading').hide();
											} catch (error) {
											}
											$('#ajax-loading').hide();
											$("#" + formID + ' #login-err-msg')
													.show();
											$("#" + formID + ' #login-err-msg')
													.html(
															getBundle(
																	getBundleLanguage,
																	"member.login.fail.first"));
										} else if (data == 'Link Sent Successfully On Your Registered Mail ID') {
											try {
												$('.login-ajax-loading').hide();
											} catch (error) {
											}
											$('#ajax-loading').hide();
											$("#" + formID + ' #login-err-msg')
													.show();
											$("#" + formID + ' #login-err-msg')
													.html(
															getBundle(
																	getBundleLanguage,
																	"member.forgotPassword.success.message"));
										} else if (data == 'Internet Connection Error') {
											try {
												$('.login-ajax-loading').hide();
											} catch (error) {
											}
											$('#ajax-loading').hide();
											$("#" + formID + ' #login-err-msg')
													.show();
											$("#" + formID + ' #login-err-msg')
													.html(
															getBundle(
																	getBundleLanguage,
																	"Connection.lost.message"));
										} else if (data == 'Invaild Username or password. Please try again.') {
											try {
												$('.login-ajax-loading').hide();
											} catch (error) {
											}
											$('#ajax-loading').hide();
											$("#" + formID + ' #login-err-msg')
													.show();
											$("#" + formID + ' #login-err-msg')
													.html(
															getBundle(
																	getBundleLanguage,
																	"member.login.fail.first"));
										} else if (data == 'Invaild Username or password. Next invalid attempt will block your account.') {
											try {
												$('.login-ajax-loading').hide();
											} catch (error) {
											}
											$('#ajax-loading').hide();
											$("#" + formID + ' #login-err-msg')
													.show();
											$("#" + formID + ' #login-err-msg')
													.html(
															getBundle(
																	getBundleLanguage,
																	"member.login.fail.second"));
										} else if (data == 'Your username has been locked out, please reset your password by \'Forget Password\'.') {
											try {
												$('.login-ajax-loading').hide();
											} catch (error) {
											}
											$('#ajax-loading').hide();
											$("#" + formID + ' #login-err-msg')
													.show();
											$("#" + formID + ' #login-err-msg')
													.html(
															getBundle(
																	getBundleLanguage,
																	"member.login.fail.third"));
										} else if (data == 'fail') {
											$('.login-ajax-loading').hide();
											$("#" + formID + ' #login-err-msg')
													.show();
											$("#" + formID + ' #login-err-msg')
													.html(
															getBundle(
																	getBundleLanguage,
																	"member.login.fail.first"));
										} else {
											$('.login-ajax-loading').hide();
											$("#" + formID + ' #login-err-msg')
													.show();
											$("#" + formID + ' #login-err-msg')
													.html(data);
										}

									},
									error : function() {
										$('.login-ajax-loading').hide();

										$('.login-ajax-loading').hide();
										$("#" + formID + ' #login-err-msg')
												.show();
										$("#" + formID + ' #login-err-msg')
												.html(data);

									}
								});
					} else {
						$('.login-ajax-loading').hide();
					}
					$('.login-ajax-loading').hide();
				}, 1000);

	}
</script>

<!-- Session is alive or not -->




<!-- End Visual Website Optimizer Asynchronous Code -->
<!--End VWO-->
<!--desktop header-->
<header id="header" class="hidden-xs hidden-sm">
	<div class="top-bar">
		<div class="container ">
			<div class="row">
				<div class="col-lg-5 col-md-5 pad-none">
					<div class="top-number">
						<span class="callus"> 24-HOUR HOTLINE 3123 3123</span>
					</div>
				</div>
				<div class="col-lg-7 col-md-7">
					<div class="collapse navbar-collapse navbar-right top-menu pad-none" id="headerLoginForm">
						<ul class="nav navbar-nav">
							<li class="active"><a
								href="/en">HOME</a></li>
							<li>|</li>
							<li><a
								href="http://www.fwd.com.hk/en-US/about/index.html"
								target="_blank">ABOUT</a></li>
							<li>|</li>
							
							<li><a
								href="/en/joinus">REGISTER</a></li>
							<li>|</li>
							
							<li>
								

								 <a
								class="lang pull-right" id="anchor-lang"
								href="/changeLang?selectLang=tc&action=/en/joinus">中文</a> 
							</li>
							

							<li class="dropdown login-btn margin-left1" id="myDropdown">
								<a href="#" data-toggle="modal" data-target="#loginpopup">LOGIN <i
									class="fa fa-caret-right"></i> </a> <!--  </a> -->


								<div class="dropdown-menu drop-width">
									<form name="loginform" id="loginform">
										<div class="login-form">
											<div
												style="display: none; position: fixed; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1000"
												class="login-ajax-loading">
												<img
													style="width: 100px; height: 100px; position: absolute; top: 50%; left: 50%; margin-top: -50px; margin-left: -50px;"
													src="/resources/images/ajax-loader.gif">
											</div>
											<div id="login-err-msg" class="alert alert-danger"
												role="alert" style="display: none;"></div>
											<div class="form-container" >
												<h2>
													Log in to FWD
												</h2>
												<h4 class="margin-shift">
													Username
													<a
														href="/en/forgotUserName"
														class="pull-right sub-link">Forgot username?</a>
												</h4>

												<div class="form-group">
													<input type="text" name="userName" class="form-control"
														placeholder="" id="headerUserName">
												</div>
												<span id="errUserName" style="color: red"></span>
												<h4 class="margin-shift">
													Password
													<a
														href="/en/forgotPassword"
														class="pull-right sub-link">Forgot password?</a>
												</h4>
												<div class="form-group">
													<input type="password" name="password" class="form-control"
														autocomplete="off" id="headerPassword">
												</div>
												<span id="errPass" style="color: red"></span> <br>
												<div class="row">
													<div class="col-lg-6 col-md-6">
														<button type="button"
															onclick="submitLoginForm('loginform');"
															class="bdr-curve btn btn-primary btn-lg wd5">
															Log In
														</button>
													</div>
													<h3
														class="text-left col-lg-6 col-md-6 pad-none margin-none">
														<span> New Member?</span><br>
														<a
															href="/en/joinus">
															Register here
														</a>
													</h3>
													<div class="clearfix"></div>
												</div>
												<p>
													For the purpose of purchasing a specified insurance plan through this website ("the Plan"), I hereby consent to the transfer of my personal data from FWD eServices to the issuer of the Plan.
												</p>
											</div>
										</div>
									</form>
								</div>
							</li>
							

							<li class="chatnow-btn"><a
								href="http://www.fwd.com.hk/en-US/" target="_blank">FWD HK</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!--/.container-->
	</div>
	<!--/.top-bar-->

	

	<nav class="navbar navbar-inverse">
		<div class="container pad-none">
			<div class="navbar-header">
				<a class="navbar-brand"
					href="/en"><img
					src="/resources/images/iFWD_logo_200px.jpg"
					alt="FWD Hong Kong"></a>
			</div>
			<!--<div class="col-lg-8 col-md-7 pull-right">
				<ul class="maintabs">
					<li
						class="col-lg-3 col-md-3 pad-none main-tab "><a
						href="/en/savings-insurance"
						class="travel-and-home-tab">Savie<br> Insurance</a>
						<div class="special-offer"></div></li>
					<li
						class="col-lg-3 col-md-3 pad-none main-tab "><a
						href="/en/working-holiday-insurance"
						class="workingholiday-tab">Working Holiday Insurance</a></li>
					<li
						class="col-lg-3 col-md-3 pad-none main-tab "><a
						href="/en/flight-insurance"
						class="travel-and-home-tab">Flight Insurance</a>
						<div class="offer"></div></li>
					<li
						class="col-lg-3 col-md-3 pad-none main-tab "><a
						href="/en/travel-insurance"
						class="travel-and-home-tab">Travel Insurance</a></li>
					<li
						class="col-lg-3 col-md-3 pad-none main-tab ext_content "><a
						href="/en/home-insurance"
						class="travel-and-home-tab">Home Insurance</a></li>
				</ul>

			</div>-->
            <div class="col-lg-8 col-md-7 pull-right">
                <ul class="col-lg-7 col-md-10 maintabs menutab-V2 pull-right">
                    <li class="col-lg-4 col-md-4 pad-none main-tab dropdown ">
                        <a class="protect-save-enjoy-tab">PROTECT</a>
		                <ul class="col-lg-12 col-md-12 dropdown-menu protect-tab">
			                  <li class="col-lg-3 col-md-3 no-padding">
		                          <ul class="col-lg-12 col-md-12 no-padding">
		                          <li class="menu-subtitle">Life & Health</li>
			                          <li class="menu-link">
			                          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			                          <a href="/en/term-life-insurance">Elite Term</a>
			                          </li>
		                         </ul> 		                      
			                  </li>
	                          <li class="col-lg-5 col-md-5 no-padding middle-group">
	                              <ul class="col-lg-12 col-md-12">
	                              <li class="menu-subtitle">Travel</li>
	                              <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="/en/flight-insurance">FlightCare</a></li>
	                              <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="/en/travel-insurance">TravelCare</a></li>
	                              <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="/en/working-holiday-insurance">Working HolidayCare</a></li>
	                             </ul>                            
	                          </li>
	                          <li class="col-lg-3 col-md-3 no-padding">
	                              <ul class="col-lg-12 col-md-12 no-padding">
	                              <li class="menu-subtitle">Household</li>
	                              <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="/en/home-insurance">Easy HomeCare</a></li>
	                             </ul>                            
	                          </li>                         		                  
		                 </ul>                      
                    </li>
                    <li class="col-lg-4 col-md-4 pad-none main-tab dropdown">
                        <a class="protect-save-enjoy-tab">SAVE</a>
                        <ul class="col-lg-12 col-md-12 dropdown-menu one-column save-tab">
                          <li>
                              <ul class="col-lg-12 col-md-12 no-padding">
                              <li class="menu-subtitle">Saving Insurance</li>
                                  <li class="menu-link">
	                                  <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	                                  <a class="menu-link" href="/en/savings-insurance">Savie Insurance Plan</a>
                                  </li>
                             </ul>                            
                          </li>
                         </ul>                      
                    </li>
                    <li class="col-lg-4 col-md-4 pad-none main-tab dropdown enjoy">
                        <a class="protect-save-enjoy-tab">ENJOY</a>
                        <ul class="col-lg-12 col-md-12 dropdown-menu one-column enjoy-tab">
                          <li>
                              <ul class="col-lg-12 col-md-12 no-padding">
                                  <li class="menu-link">
                                      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                      <a class="menu-link" href="/en/fwdiscover">FWDiscover</a>
                                  </li>  
                                  <li class="menu-link">
	                                  <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	                                  <a class="menu-link" href="/en/offers">Partners & Offers</a>
                                  </li>                                
                             </ul>                            
                          </li>
                         </ul>                      
                    </li>                   
                </ul>

            </div>
		</div>
		<!--/.container-->
	</nav>
	<!--/nav-->

</header>
<!--End-Desktop-header-->

<!-- hidden navbar -->
<!--<div class="navbar_hidden_content">
	<div class="container pad-none">
		<div class="pull-right submenu_list">
			<div class="product_type">
				<div>Health Insurance</div>
			</div>
			<hr />
			<div class="product_type">
				<div>Home Insurance</div>
			</div>
			<hr />
			<div class="product_type">
				<div>Moter Insurance</div>
			</div>
		</div>
		<div class="pull-right">image</div>
		<div class="clearfix"></div>
	</div>
	<script>
		$("li.main-tab.ext_content").hover(function() {
			$(".navbar_hidden_content").toggle();
		});

		$(".navbar_hidden_content").hover(function() {
			$(".navbar_hidden_content").toggle();
		});
	</script>
</div>-->
<!-- hidden navbar -->

<div
	style="position: absolute; top: 0; left: 0; bottom: 0; right: 0; z-index: 998; display: none"
	id="test"></div>
<!--Mobile-header-->
<div class="navbar navbar-default navbar-fixed-top hidden-lg hidden-md pad-none" role="navigation">
<!--<div class="mob-header hidden-lg hidden-md pad-none">-->
	<div class="mob-topbar">
		<!-- 
		<span id="toplefthotline" class="callus top-number">24hr Hotline 3123 3123</span> <a href="#"
			onClick="zopim_chat_start()"><span class="chat pull-right">FWD HK</span></a>
		 -->
		<span id="toplefthotline" class="callus top-number">24hr Hotline 3123 3123</span> <a
			href="http://www.fwd.com.hk/en-US/"><span
			class="chat pull-right">FWD HK</span></a>


		<!-- <a class="lang pull-right" href="/changeLang?selectLang=EN&action=/en/joinus">中文</a>  -->
		

		
		<a class="lang pull-right" id="anchor-lang"
			href="/changeLang?selectLang=tc&action=/en/joinus">中文</a>

		
		<div class="clearfix"></div>
	</div>
	<div class="logobox">
		<div class="navbar-header" style="overflow: hidden;">
			<button type="button"
				class="navbar-toggle mob-menu-btn col-xs-1 col-sm-1" data-toggle="collapse" data-target=".navbar-collapse">
				<!--<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">-->
				<span class="sr-only">Toggle navigation</span> 
				<span class="icon-bar"></span> <span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand pull-left col-xs-8 col-sm-8"
				href="/en"><img
				src="/resources/images/iFWD_logo_150px.jpg"
				alt="FWD Hong Kong"
				class="img-responsive"></a>
			<div class="clearfix"></div>
		</div>
	    
	
    <div class="navbar-collapse collapse mobile-menu-V2">
          <ul class="col-sm-12 nav navbar-nav">
             <li class="pad-none col-sm-12 dropdown border-bottom">
            <!-- <div
		        style="display: none; position: absolute; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1000"
		        class="bmg_mobile_login_mask"
		        onclick="$('#fwd-login-mob').trigger('click');"></div>
		        -->
		         <!--<div
                style="display: none; position: absolute; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1000"
                class="bmg_mobile_login_mask"
                onclick="$('body').removeClass('modal-open');"></div>-->    
        
        <div class="dropdown login-btn btn btn-lg wd2" id="myDropdownMob" data-toggle="modal" data-target="#myModal">       
        <a href="#" class="dropdown-toggle color-wht log-to-acc"
            id="fwd-login-mob"><i
            class="fa fa-lock"></i> Log in to FWD </a>
        <!--<div class="dropdown-menu drop-width"
            style="left: -32px; top: 105px; max-width: 300px;">-->
            <!--<div class="dropdown-menu drop-width">
            <form name="loginform" id="loginform2">
                <div class="login-form" style="position: absolute;">
                    <div
                        style="display: none; position: fixed; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1000"
                        class="login-ajax-loading">
                        <img
                            style="width: 100px; height: 100px; position: absolute; top: 50%; left: 50%; margin-top: -50px; margin-left: -50px;"
                            src="/resources/images/ajax-loader.gif">
                    </div>
                    <div id="login-err-msg"
                        class="alert alert-danger col-xs-10 col-xs-offset-1 " role="alert"
                        style="display: none;"></div>
                    <div class="form-container">
                        <h2>
                            Log in to FWD
                        </h2>
                        <h4 class="margin-shift">
                            Username
                            <a
                                href="/en/forgotUserName"
                                class="pull-right sub-link">Forgot username?</a>
                        </h4>

                        <div class="form-group">
                            <input type="text" name="userName" class="form-control"
                                placeholder="" id="headerUserName">
                        </div>
                        <span id="errUserName" style="color: red"></span>
                        <h4 class="margin-shift">
                            Password
                            <a
                                href="/en/forgotPassword"
                                class="pull-right sub-link">Forgot password?</a>
                        </h4>
                        <div class="form-group">
                            <input type="password" name="password" class="form-control"
                                autocomplete="off" id="headerPassword">
                        </div>
                        <span id="errPass" style="color: red"></span> <br>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-xs-6">
                                <button type="button" onclick="submitLoginForm('loginform2');"
                                    class="bdr-curve btn btn-primary btn-lg wd5">
                                    Log In
                                </button>
                            </div>
                            <h3
                                class="text-left col-lg-6 col-md-6  col-xs-6 pad-none margin-none">
                                <span> New Member?</span><br>
                                <a href="/en/joinus">
                                    Register here
                                </a>
                            </h3>
                            <div class="clearfix"></div>
                        </div>

                    </div>
                </div>
            </form>
        </div>-->

                     
             </li>
             <li class="pad-none col-sm-12 dropdown link-btn link-grp border-bottom fwd-header-navgation-menu">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">PROTECT<img class="link-arrow" src="/resources/images/arrow.png"><img class="link-arrow hidden-label" src="/resources/images/arrow-down.png"></a>
              <ul class="col-sm-12 dropdown-menu">
                <li class="menu-link-grp-title">
                    <a href="/en/term-life-insurance">Life & Health</a>                   
                </li>
                <li class="menu-link-grp-title">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Travel</a>
                    <ul class="col-sm-12 dropdown-menu">
                         <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="/en/flight-insurance">FlightCare</a></li>
                         <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="/en/travel-insurance">TravelCare</a></li>
                         <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="/en/working-holiday-insurance">Working HolidayCare</a></li>
                    </ul>
                </li>
						<li class="menu-link-grp-title"><a
							href="/en/home-insurance">Household</a></li>
					</ul>              
            </li>         
            <li class="pad-none col-sm-12 dropdown link-btn border-bottom fwd-header-navgation-menu">
              <a href="/en/savings-insurance">SAVE<img class="link-arrow" src="/resources/images/arrow.png"><img class="link-arrow hidden-label" src="/resources/images/arrow-down.png"></a>
            </li>
            <li class="pad-none col-sm-12 dropdown link-btn link-grp fwd-header-navgation-menu">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">ENJOY<img class="link-arrow" src="/resources/images/arrow.png"><img class="link-arrow hidden-label" src="/resources/images/arrow-down.png"></a>
              <ul class="col-sm-12 dropdown-menu">
                   <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="/en/fwdiscover">FWDiscover</a></li> 
                   <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="/en/offers">Partners & Offers</a></li>
              </ul>              
            </li>
          </ul>
        </div><!--/.nav-collapse -->
</div>
    
<!--Mobile side-menu-->
<!--<div class="navmenu navmenu-default navmenu-fixed-right offcanvas"
	style="">

	<div
		style="display: none; position: absolute; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1000"
		class="bmg_mobile_login_mask"
		onclick="$('#fwd-login-mob').trigger('click');"></div>

	<div class="dropdown login-btn btn btn-lg wd2" id="myDropdownMob">

		
		<a href="#" class="dropdown-toggle color-wht log-to-acc"
			id="fwd-login-mob" onclick="$('.bmg_mobile_login_mask').toggle();"><i
			class="fa fa-lock"></i> Log in to FWD </a>
		<div class="dropdown-menu drop-width"
			style="left: -32px; top: 105px; max-width: 300px;">
			<form name="loginform" id="loginform2">
				<div class="login-form" style="position: relative;">
					<div
						style="display: none; position: fixed; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1000"
						class="login-ajax-loading">
						<img
							style="width: 100px; height: 100px; position: absolute; top: 50%; left: 50%; margin-top: -50px; margin-left: -50px;"
							src="/resources/images/ajax-loader.gif">
					</div>
					<div id="login-err-msg"
						class="alert alert-danger col-xs-10 col-xs-offset-1 " role="alert"
						style="display: none;"></div>
					<div class="form-container">
						<h2>
							Log in to FWD
						</h2>
						<h4 class="margin-shift">
							Username
							<a
								href="/en/forgotUserName"
								class="pull-right sub-link">Forgot username?</a>
						</h4>

						<div class="form-group">
							<input type="text" name="userName" class="form-control"
								placeholder="" id="headerUserName">
						</div>
						<span id="errUserName" style="color: red"></span>
						<h4 class="margin-shift">
							Password
							<a
								href="/en/forgotPassword"
								class="pull-right sub-link">Forgot password?</a>
						</h4>
						<div class="form-group">
							<input type="password" name="password" class="form-control"
								autocomplete="off" id="headerPassword">
						</div>
						<span id="errPass" style="color: red"></span> <br>
						<div class="row">
							<div class="col-lg-6 col-md-6 col-xs-6">
								<button type="button" onclick="submitLoginForm('loginform2');"
									class="bdr-curve btn btn-primary btn-lg wd5">
									Log In
								</button>
							</div>
							<h3
								class="text-left col-lg-6 col-md-6  col-xs-6 pad-none margin-none">
								<span> New Member?</span><br>
								<a href="/en/joinus">
									Register here
								</a>
							</h3>
							<div class="clearfix"></div>
						</div>

					</div>
				</div>
			</form>
		</div>

		
	</div>

	<ul class="nav navmenu-nav sidepanel-menu">
		<li><a href="/en">HOME</a></li>
		<li class=""><span>LIMITED OFFER</span><a
			class="limited-offer-mobile"
			href="/en/savings-insurance">Savie<br> <br
				class="visible-md visible-lg" />
			Insurance</a>
		<div class="special-offer"></div></li>
		<li class=""><a
			href="/en/working-holiday-insurance">Working Holiday Insurance</a></li>
		<li class=""><a
			href="/en/flight-insurance">Flight Insurance</a>
		<div class="offer"></div></li>
		<li class=""><a
			href="/en/travel-insurance">Travel Insurance</a></li>
		<li class=""><a
			href="/en/home-insurance">Home Insurance</a></li>
	</ul>-->
</div>

<div id="myModal" class="mob-login-form-wrapper modal fade" role="dialog">
<div
    style="display: none; position: fixed; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 2001"
    class="login-ajax-loading">
    <img
        style="width: 100px; height: 100px; position: absolute; top: 50%; left: 50%; margin-top: -50px; margin-left: -50px;"
        src="/resources/images/ajax-loader.gif">
</div>
<!-- 
<div
        style="display: none; position: absolute; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1500"
        class="bmg_mobile_login_mask"
        onclick="$('body').removeClass('modal-open');$('#fwd-login-mob').trigger('click');"></div>
         -->
         <!--<div
        style="display: none; background: #000; left: 0; top: 0; bottom: -100px; right: 0; opacity: 0.8; z-index: 1500"
        class="bmg_mobile_login_mask"
        onclick="$('#fwd-login-mob').trigger('click');$('body').removeClass('modal-open');"></div>-->

    <div id="myDropdownMob" class="modal-dialog">
        <form name="loginform" id="loginform2">
            <div class="login-form" style="position: absolute;">
                <div id="login-err-msg"
                    class="alert alert-danger col-xs-10 col-xs-offset-1 " role="alert"
                    style="display: none;"></div>
                <div class="form-container">
                    <h2>
                        Log in to FWD
                    </h2>
                    <h4 class="margin-shift">
                        Username
                        <a
                            href="/en/forgotUserName"
                            class="pull-right sub-link">Forgot username?</a>
                    </h4>

                    <div class="form-group">
                        <input type="text" name="userName" class="form-control"
                            placeholder="" id="headerUserName">
                    </div>
                    <span id="errUserName" style="color: red"></span>
                    <h4 class="margin-shift">
                        Password
                        <a
                            href="/en/forgotPassword"
                            class="pull-right sub-link">Forgot password?</a>
                    </h4>
                    <div class="form-group">
                        <input type="password" name="password" class="form-control"
                            autocomplete="off" id="headerPassword">
                    </div>
                    <span id="errPass" style="color: red"></span> <br>
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-xs-6">
                            <button type="button" onclick="submitLoginForm('loginform2');"
                                class="bdr-curve btn btn-primary btn-lg wd5">
                                Log In
                            </button>
                        </div>
                        <h3
                            class="text-left col-lg-6 col-md-6  col-xs-6 pad-none margin-none">
                            <span> New Member?</span><br>
                            <a href="/en/joinus">
                                Register here
                            </a>
                        </h3>
                        <div class="clearfix"></div>
                    </div>
                    <p>
						For the purpose of purchasing a specified insurance plan through this website ("the Plan"), I hereby consent to the transfer of my personal data from FWD eServices to the issuer of the Plan.
					</p>
                </div>
            </div>
        </form>
    </div>
</div>
<!--End Mobile header-->
<!--/header-->
<script>
$(function() {
    var pageControllerName = "#";
    var faqProductLink = "/en/faq";
    //console.log(faqProductLink);
    $("#faqProductLink").attr("href", ""+ faqProductLink + pageControllerName + "");
    var faqLinkRe = new RegExp(/^faq/);
    var langFaqProductLink = window.location.href.substr(window.location.href.lastIndexOf("/") + 1);
    //console.log(faqLinkRe.test(langFaqProductLink));
//     if(faqLinkRe.test(langFaqProductLink)){





//     }
});
	function centerModals($element) {
	    var $modals;
	    if ($element.length) {
	      $modals = $element;
	    } else {
	      $modals = $('.modal-vcenter:visible');
	    }
	    $modals.each( function(i) {
	      var $clone = $(this).clone().css('display', 'block').appendTo('body');
	      var top = Math.round(($clone.height() - $clone.find('.modal-content').height()) / 2);
	      top = top > 0 ? top : 0;
	      $clone.remove();
	      $(this).find('.modal-content').css("margin-top", top);
	    });
	  }
	
	var iosChromeAlertMsg = [];
	iosChromeAlertMsg[0] = '抱歉，你的瀏覽器現時未受支援。';
    iosChromeAlertMsg[1] = '請選用以下其它建議的瀏覽器：';
    iosChromeAlertMsg[2] = '關閉';

    
    function offerMenuActive(){
    	var site_uri = window.location.pathname;
    	var uri_array = site_uri.split("/");
    	if(uri_array[uri_array.length-1]=='offers'){
    		$( ".enjoy" ).addClass( "active" );
    	}
    }
	$(document).ready(function() {
		offerMenuActive();
		//console.log(window.location.pathname.substring(-5));
		//$("#loginform2").appendTo("body");
		//console.log(navigator.userAgent.match('CriOS'));
		if(navigator.userAgent.match('CriOS')){
			if(lang === "tc") {
				$('#ios_chromeAlert .alert_header').html(iosChromeAlertMsg[0]);
				$('#ios_chromeAlert').addClass("tc_alert");
				$('#ios_chromeAlert .alert_suggest').html(iosChromeAlertMsg[1]);
				$('#ios_chromeAlert .btn').html(iosChromeAlertMsg[2]);
			}
		    $('#ios_chromeAlert').modal('show');
		    centerModals($('#ios_chromeAlert'));
		    $(window).on('resize', centerModals);
		}
	});
	
	$('.navmenu').on('show.bs.offcanvas', function() {
		$('#test').show();
	});
	$('.navmenu').on('hidden.bs.offcanvas', function() {
		$('#test').hide(function() {
			$("#toplefthotline").trigger("click");
		});
	});
	$('#test').click(function() {
		$('.navmenu').offcanvas('hide');
	});
	
		/*$('#myDropdownMob').click(function(e) {
			e.preventDefault();
			e.stopPropagation();
			$(".mob-login-form-wrapper").toggleClass('open');
			$(".bmg_mobile_login_mask").toggle();
		});*/
	
    $( "li.link-btn.link-grp" ).click(function() {
    	  $(this).find("img").toggle();
    	});
    $('ul.dropdown-menu [data-toggle=dropdown]').on('click', function(event) {
        // Avoid following the href location when clicking
        event.preventDefault(); 
        // Avoid having the menu to close when clicking
        event.stopPropagation(); 
        // Re-add .open to parent sub-menu item
        if($(this).parent().hasClass('open')){
            $(this).parent().removeClass('open');
        }else{          
	        $(this).parent().addClass('open');
	        $(this).parent().siblings("li").removeClass('open');
	        $(this).parent().find("ul").parent().find("li.dropdown").addClass('open');
        }
    }); 
</script>
<div class="modal modal-vcenter fade bs-example-modal-lg " id="ios_chromeAlert"
        tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
        aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content plan-modal">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <p class="alert_header">Opps...Your browser is currently not supported.</p>
                    <p class="alert_suggest">Please switch to suggested <br/>browsers below:</p>
                    <img src="/resources/images/safari_background.png">
                </div>
                <div class="modal-footer">
                  <button id="closemodal" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
</div>










<div class="modal fade bs-example-modal-lg " id="loginpopup"
        tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
        aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content plan-modal">
            
                       <!-- 登入 -->      
            
                            <form name="loginform" id="loginform-pop">
                                        
                                        <div class="login-form" >
                                            <div style="display: none; position: absolute; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1000" class="login-ajax-loading">
							                    <img style="width: 100px; height: 100px; position: absolute; top: 40%; left: 40%" src="/resources/images/ajax-loader.gif">
							                </div>
                                            <div id="login-err-msg" class="alert alert-danger empHide"
                                                role="alert" style="display: none;"></div>
                                        
                                        
                                        <a class="close" aria-label="Close" data-dismiss="modal">
                                        <span aria-hidden="true" style="font-size:30px;">×</span>
                                        </a>
                                        
                                            <div class="form-container" >
                                                <h2>Log in to FWD</h2>
                                                <h4 class="margin-shift">
                                                <!--使用者名 -->
                                                    Username 
                                                    
                                                    <!-- 忘記使用者名 -->
                                                    <a id="forgotUserName" style="cursor:pointer"
                                                        class="pull-right sub-link">Forgot username?</a>
                                                </h4>

                                                <div class="form-group">
                                                    <input type="text" name="userName" class="form-control check-emp"
                                                        placeholder="" id="headerUserName" onkeypress="return validationUsername(event);">
                                                </div>
                                                <span id="errUserName" class="empHide" style="color: red;font-size: 16px;"></span>
                                                
                                                
                                                
                                                <h4 class="margin-shift">
                                                    Password 
                                                    
                                                    <!--忘記密碼 -->                                                    
                                                    <a id="link-forgotPassword" style="cursor:pointer" 
                                                        class="pull-right sub-link">Forgot password?</a>
                                                        
                                                </h4>
                                                <div class="form-group">
                                                    <input type="password" name="password" class="form-control check-emp-forgotusername" autocomplete="off" id="headerPassword">
                                                </div>
                                                <span id="errPass" class="empHide" style="color: red;font-size: 16px;"></span> <br>
                                                <div class="row">
                                                    <div class="col-lg-6 col-md-6">
                                                        <button type="button" onclick="submitLoginForm('loginform-pop');"
                                                            class="bdr-curve btn btn-primary btn-lg wd5">Log In</button>
                                                    </div>
                                                    <h3
                                                        class="text-left col-lg-6 col-md-6 pad-none margin-none">
                                                        <span> New Member?</span><br> <a href="/en/joinus">
                                                            Register here</a>
                                                    </h3>
                                                    <div class="clearfix"></div>
                                                </div>
                                                <p>
                                                    <h6>For the purpose of purchasing a specified insurance plan through this website ("the Plan"), I hereby consent to the transfer of my personal data from FWD eServices to the issuer of the Plan.</h6>
                                                </p>
                                            </div>
                                        </div>
                    </form>
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    <!-- ======================================== 忘記使用者   ============================================================ -->
                                    <!-- ======================================== 忘記使用者   ============================================================ -->
                                    
                                    
                                    
                        <form name="forgotUserNameForm" id="forgotUserNameForm"
                    action="forgotUserNameFields" method="post"
                    commandName="forgotUserName" style="display:none">
                        
                        
                 
                        
                            <div class="login-form"  >
                                <div style="display: none; position: absolute; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1000" class="login-ajax-loading">
                                    <img style="width: 100px; height: 100px; position: absolute; top: 40%; left: 40%" src="/resources/images/ajax-loader.gif">
                                </div>
                <div id="forgotusername-err-msg" class="alert alert-danger"
                        role="alert" style="display: none;">
                        <P id="error-mobile-no"></P>
                        <P id="error-email-id"></P>
                    </div>

                    <div id="success-message" class="alert alert-success empHide" role="alert"
                        style="display: none;">
                        <P id="error1"></P>
                    </div>
                            
                            
                            
                                            
                                            <div id="login-err-msg" class="alert alert-danger"
                                                role="alert" style="display: none;"></div>
                                        
                                                                           <a class="close" aria-label="Close" data-dismiss="modal">
                                        <span aria-hidden="true" style="font-size:30px;">×</span>
                                        </a>                                                                                                         
                                            <div class="form-container" >
                                                <h2>
                                                  <!--Message 忘記用戶名稱 -->
                                                  Forgot username                                                                                                                                           
                                                </h2>
                                                

                                                <!--電話 text-------->                                                
                                                <h4 class="margin-shift">
                                                   Mobile no.                                                    
                                                </h4>
                                                
                                                
                                                <!-- 電話 inout -->
                                                <div class="form-group">                                                   
                                                        <input type="tel" name="mobileNo" class="form-control  check-emp-forgotusername" id="mobileNo" placeholder=""
                                                        onkeypress="return isNumeric(event)"
                                                        onblur="forgotUserName();">                                                                                                                
                                                </div>
                                                                                        
                                               <!--  phone erro message -->
                                                                    <span id="errorEmptyMob" class="hide1 empHide"> <label
                                            class="text-red">Please enter your Mobile No.</label>
                                            
                                            
                                    </span> <span id="errorInvalidMob" class="hide1 empHide"> <label
                                            class="text-red">Please enter a valid Mobile No.</label>
                                    </span>
                                       
                                       
                                                                                                                   
                                          <!-- -======================================================================- -->
                                                                                                                                                                  
                                                
                                                <!-- 電郵 text-->                                                
                                                <h4 class="margin-shift">                                                    
                                                    Email address                                                                                                                                                                                                         
                                                </h4>
                                              
                                              
                                                                                                                      
                                                 <!-- 電郵 input-->                                                
                                                <div class="form-group">
                                             <input type="email"
                                        name="emailAddress" class="form-control check-emp-forgotusername" id="emailAddress"
                                        onkeypress="return validationEmail(event);"
                                        onblur="forgotUserName();"
                                        placeholder=""> 
                                             
                                                </div>
                                                

                                                
                                                <!-- 電郵 Errror message -->   
                                                                                            
                                                <span id="errorEmptyEmailId" class="hide1 empHide"><label class="text-red">Please enter your Email.</label></span> 

                                    
                                                 <span id="errorInvalidEmailId" class="hide1 empHide"> 
                                                     <label class="text-red">Please enter a valid Email.</label>
                                                 </span>
                                                
                                                
                                                 <br> 
                                                
                                  
                                                <div class="row">
                                                    <div class="col-xs-6 col-sm-6 col-lg-4 col-md-4">
                                                                <button type="button" onclick="backToLogin()" class="bdr-curve btn btn-primary btn-lg ">Back</button>
                                                    </div>
                                                
                                                    <div class="col-xs-6 col-sm-6 col-lg-4 col-md-4">                                           
                                                                <button type="button" onclick="getForgotUserName()" class="bdr-curve btn btn-primary btn-lg ">Submit</button>                                                    
                                                    </div>
                                                    
                                                    <div class="clearfix"></div>
                                                </div>
                                             
                                            </div>
                             </div> 
                                   
                                </form>    
                                    
                                    <!-- 忘記使用者END -->
                                    

    <script>
        function getForgotUserName() {
        	$('#forgotusername-err-msg').hide();
        	$('#success-message').hide();
        	
            var validationFormVal = forgotUserName();
            if (validationFormVal == true) {
                $('#forgotusername-err-msg').hide();
                $('.login-ajax-loading').show();
                $.ajax({
                            type : 'POST',
                            url : '/forgotUser',
                            data : $('#forgotUserNameForm input').serialize(),
                            success : function(data) {

                                $('.login-ajax-loading').hide();
                                if (data == 'fail') {
                                    $('#forgotusername-err-msg').html(getBundle(getBundleLanguage, "member.login.fail.first"));
		                            $('#forgotusername-err-msg').show();
                                    $('#user-details-main').hide();
                                    $('#hide-field').hide();
                                } else if (data.indexOf('~~~') > -1) {
                                    $('#success-message').html(data.slice(5, 68));
                                    $('#success-message').show();
                                    $('#user-details-main').hide();
                                    $('#hide-field').hide();
                                } else if (data.indexOf('[')==0&data.indexOf(']')>0) {
                                	$('#success-message').html('');
                                    $('#success-message').hide();
                                    $('#forgotusername-err-msg').html(data.slice(2, data.length-2));
                                    $('#forgotusername-err-msg').show();
                                } else {             
                                    $('#success-message').html('Your Username is ' + data);
                                    $('#success-message').show();
                                }

                            },
                            error : function(xhr, status, error) {
                                $('.login-ajax-loading').hide();
                            }
                        });
            }
        }
    </script>
                                                   
                                    
                                <!-- ===================================================================================================== -->
                                <!-- ========================================忘記密碼===================================================== -->
                                <!-- ===================================================================================================== -->                                                                  
                                    
                              
             <form name="forgotPasswordForm" id="forgotPasswordForm"
                        action="forgotPassword" method="post"
                        commandName="forgotUserPassword" style="display:none">
                        
                        
           
                        
                        
                        
                            <div class="login-form"  >
                                <div style="display: none; position: absolute; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1000" class="login-ajax-loading">
                                    <img style="width: 100px; height: 100px; position: absolute; top: 40%; left: 40%" src="/resources/images/ajax-loader.gif">
                                </div>
                                                                                           
                                                                           <div id="hide-field"></div>
                        <div id="forgotpassword-err-msg" class="alert alert-danger empHide"
                            role="alert" style="display: none;">
                            <P id="error1"></P>
                        </div>
                        <div id="success-message-password" class="alert alert-success" role="alert"
                            style="display: none;">
                            <P id="error1"></P>
                        </div>
                            
                                            
                                            <div id="login-err-msg" class="alert alert-danger"
                                                role="alert" style="display: none;"></div>
                                        
                                                    <a class="close" aria-label="Close" data-dismiss="modal">
                                        <span aria-hidden="true" style="font-size:30px;">×</span>
                                        </a>                                         
                                        
                                                                                                                                                           
                                            <div class="form-container" >
                                                <h2>
                                                  <!--Message 忘記密碼 -->
                                                 Forgot Password                                                                                                                                       
                                                </h2>
                                                
                                                
                                                
                                                     
                                                
                                                
                                                <!--電話 text-------->                                                
                                                <h4 class="margin-shift">
                                                   Mobile no.                                                    
                                                </h4>
                                                
                                                
                                                <!-- 電話 inout -->
                                                <div class="form-group">                                                   
                                                        <input type="tel" name="mobileNo" class="form-control check-emp-forgotuserpassoword" id="mobileNo-forgotpassowrd" placeholder=""
                                                        onkeypress="return isNumeric(event)"
                                                        onblur="validForgetUserPassword();">                                                                                                                
                                               
                                               
                                                </div>
                                                                                        
                                               <!--  phone erro message -->
                                                                    <span id="errorEmptyMob-forgotPassword" class="hide1 empHide"> <label
                                            class="text-red">Please enter your Mobile No.</label>
                                            
                                            
                                    </span> <span id="errorInvalidMob-forgotPassword" class="hide1 empHide"> <label
                                            class="text-red">Please enter a valid Mobile No.</label>
                                    </span>
                                       
                                       
                                                    
                                                                                                                   
                                          <!-- -======================================================================- -->
                                                                                                                                                               
                                                
                                                <!-- 電郵 text-->                                                
                                                <h4 class="margin-shift">                                                    
                                                    Email address                                                                                                                                                                                                         
                                                </h4>
                                              
                                              
                                                                                                                      
                                                 <!-- 電郵 input-->                                                
                                                <div class="form-group">
                                                    <input type="email"
                                                name="emailAddress" class="form-control check-emp-forgotuserpassoword" id="emailAddress-forgotpassowrd"
                                                onkeypress="return validationEmail(event);"
												onblur="validForgetUserPassword();"
                                                placeholder="">
                                                </div>
                                                
                                                
                                                

                                                
                                                <!-- 電郵 Errror message -->
                                                <span id="errorEmptyEmailId" class="hide1 empHide"> <label class="text-red">Please enter your Email.</label></span>                                             
                                                <span id="errorEmptyEmailId-forgotpassword" class="hide1 empHide">
                                                     <label class="text-red">Please enter your Email.</label>
                                                </span>

                                    
                                                 <span id="errorInvalidEmailId-forgotpassword" class="hide1 empHide"> 
                                                     <label class="text-red">Please enter a valid Email.</label>
                                                 </span>
                                                
                                                
                                                
                                                <!-- 使用者text -->
                                                   <h4 class="margin-shift">                                                    
                                                   Username                                                                                                                                                                                                     
                                                </h4>
                                                
                                                
                                                
                                                
                                                
                                                <!-- 使用者input -->
                                                
                                                    <div class="form-group">
                                                <input type="text" name="userName"
                                                class="form-control check-emp-forgotuserpassoword" id="userName" placeholder=""
                                                onkeypress="return validationUsername(event);"
                                                onblur="validForgetUserPassword();">
                                                </div>
                                                
                                                
                                                <!-- 使用者ERROR -->
                                                
                                                 <span id="errorEmptyUName" class="hide1 empHide"> <label
                                                    class="text-red">Please enter a Username.</label>
                                                 </span> 
                                            
                                            
                                            <span id="errorInvalidUName" class="hide1 empHide"> <label
                                                    class="text-red">Please enter a valid Username.</label>
                                            </span>
                                                
                                                
                                                 <br> 
                                                
                                  
                                                <div class="row">
                                                    <div class="col-xs-6 col-sm-6 col-lg-4 col-md-4">
                                                                                                              
                                                       <button type="button" onclick="backToLogin()" class="bdr-curve btn btn-primary btn-lg ">Back</button>                                                    
                                                    
                                                    </div>
                                                
                                                    <div class="col-xs-6 col-sm-6 col-lg-4 col-md-4">
                                                                                                              
                                                       <button type="button" onclick="forgotUserPassword()" class="bdr-curve btn btn-primary btn-lg ">Submit</button>                                                    
                                                    
                                                    </div>
                                                    
                                                    <div class="clearfix"></div>
                                                </div>
                                             
                                            </div>
                             </div> 
                                   
                                </form>    
                                    
            
                                    
                                    
                                
                                
                                
                                
                        

    <script>
	    function validForgetUserPassword(){
	    	$('#forgotpassword-err-msg').hide();
	        $('#success-message-password').hide();
	        
	        $('#errorEmptyMob-forgotPassword').hide();
	        $('#errorInvalidMob-forgotPassword').hide();
	        $('#errorEmptyEmailId-forgotpassword').hide();
	        $('#errorInvalidEmailId-forgotpassword').hide();
	        $('#errorEmptyUName').hide();
	        $('#errorInvalidUName').hide();
	        
	        $("#mobileNo-forgotpassowrd").removeClass("invalid-field");
	        $("#emailAddress-forgotpassowrd").removeClass("invalid-field");
	        $("#userName").removeClass("invalid-field");
	        
	        var valid = true;
	         
	        var mobileNo = $('#mobileNo-forgotpassowrd').val();
	        var emailId = $('#emailAddress-forgotpassowrd').val();
	        var userName = $('#userName').val();        
	        
	          // Mobile Number Validation
	        if (mobileNo.trim() == "") {
	             $('#errorEmptyMob-forgotPassword').show();
	             $("#mobileNo-forgotpassowrd").addClass("invalid-field");
	             valid = false;
	        }   else{
	            
	            if (mobile_pattern.test(mobileNo) == false) {
	                $("#errorInvalidMob-forgotPassword").show();         
	                $("#mobileNo-forgotpassowrd").addClass("invalid-field");
	                valid = false;
	            }               
	        }             
	       
	        // Email Address Validation
	        if (emailId.trim() == "") {
	           $('#errorEmptyEmailId-forgotpassword').show();
	           $("#emailAddress-forgotpassowrd").addClass("invalid-field");
	            valid = false;
	            
	        } else {
	            if (emailreg.test(emailId) == false) {
	                  $('#errorInvalidEmailId-forgotpassword').show();
	                  $("#emailAddress-forgotpassowrd").addClass("invalid-field");
	                  valid = false;
	                //document.getElementById("errorInvalidEmailId").style.display = "block";
	                //valid = false;
	            }
	        }
	        
	        // UserName Validation
	        if (userName.trim() == "") {
	            $("#errorEmptyUName").show();
	            $("#userName").addClass("invalid-field");
	            valid = false;
	
	        } else {                
	            if (isAccountNumeric(userName)) {
	            	$("#errorInvalidUName").show();
	            	$("#userName").addClass("invalid-field");
	                valid = false;
	            } else if (!plan_user.test(userName)) {
	            	$("#errorInvalidUName").show();
	            	$("#userName").addClass("invalid-field");
	                valid = false;
	            } else if(userName.length < 6 || userName.length > 50) {
	            	$("#errorInvalidUName").show();
	            	$("#userName").addClass("invalid-field");
	                valid = false;
	            }
	        }
	        return valid;
	    }
    
    
        function forgotUserPassword() {

            
            
            if( validForgetUserPassword() == true){

   
                $('.login-ajax-loading').show();
                $.ajax({
                            type : 'POST',
                            url : '/forgotUserPassword',
                            data : {'emailAddress':$('#emailAddress-forgotpassowrd').val(),
                                    'mobileNo':$('#mobileNo-forgotpassowrd').val(),
                                    'userName':$('#userName').val()
                                                                
                                },
                            success : function(data) {

                                $('.login-ajax-loading').hide();
                                if (data == 'fail') {
                                    $('#forgotpassword-err-msg').html(getBundle(getBundleLanguage, "member.login.fail.first"));
                                    $('#forgotpassword-err-msg').show();
                                } else if (data == 'success') {
                                    $('#success-message-password').html(getBundle(getBundleLanguage, "member.forgotPassword.success.message"));
                                    $('#success-message-password').show();
                                } else {
                                    $('#success-message-password').html(getBundle(getBundleLanguage, "connection.lost.message"));
                                    $('#success-message-password').show();
                                    $('#user-details-main').hide();
                                }

                            },
                            error : function(xhr, status, error) {
                                $('.login-ajax-loading').hide();
                            }
                        });
            }
        }
    </script>               
                                    
            </div>
        </div>
    </div>
    <!-- payment error popup  -->
    <!-- Modal -->
	<div class="modal fade bs-example-modal-lg  in" id="paymentErrorPopup" tabindex="-1" role="dialog" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content plan-modal">
            <div class="modal-body">
                <a class="close" aria-label="Close" data-dismiss="modal"><span aria-hidden="true" style="font-size:30px;">×</span></a>
                <div class="form-container" style="padding-top: 10px;">
                    <br/>
                    Your payment request was submitted before. For any enquiry, please call our customer service hotline at 3123 3123.
                    <br/>
                    <br/>
                    <br/>
                </div>
	      </div>
	    </div>
	  </div>
	</div>
	
	<div id="loading-overlay" class="modal fade bs-loading-modal-lg" tabindex="-1" role="dialog"  aria-hidden="true" style="display: none;" >
	    <div class="modal-dialog modal-lg loading-dialog">
	        <div class="modal-content plan-modal loading-modal">
	           <img src="/resources/images/loading.gif" width="300"/>
	        </div>
	    </div>
	</div>
    

    
    <script>
    
    function backToLogin(){
    	$('#loginform-pop').fadeIn();
        $('#forgotUserNameForm').hide();
        $('#forgotPasswordForm').hide();
        $('.empHide').hide();
        
        $("#mobileNo").removeClass("invalid-field");
        $("#emailAddress").removeClass("invalid-field");
        
        $("#loginform-pop #headerUserName").removeClass("invalid-field");
        $("#loginform-pop #headerPassword").removeClass("invalid-field");
        
        $("#mobileNo-forgotpassowrd").removeClass("invalid-field");
        $("#emailAddress-forgotpassowrd").removeClass("invalid-field");
        $("#userName").removeClass("invalid-field");
    }
   
    
       $(document).ready(function(){

           
           
           $('html').keyup(function(e){
                    
                 var emp= "";
            $(".check-emp").each(function(){
               emp = emp + $(this).val(); 
            });
         
            
            
            
            if(emp==""){
             
              $('.empHide').hide();
              
              $("#mobileNo").removeClass("invalid-field");
              $("#emailAddress").removeClass("invalid-field");
              
              $("#loginform-pop #headerUserName").removeClass("invalid-field");
              $("#loginform-pop #headerPassword").removeClass("invalid-field");
              
              $("#mobileNo-forgotpassowrd").removeClass("invalid-field");
              $("#emailAddress-forgotpassowrd").removeClass("invalid-field");
              $("#userName").removeClass("invalid-field");
            }
            
            
            var checkEmpForgotuserName = "";                       
            $(".check-emp-forgotusername").each(function(){
                checkEmpForgotuserName = checkEmpForgotuserName + $(this).val(); 
             });            
            
            
            if(checkEmpForgotuserName==""){               
                $('.empHide').hide();
                $("#mobileNo").removeClass("invalid-field");
                $("#emailAddress").removeClass("invalid-field");
                
                $("#loginform-pop #headerUserName").removeClass("invalid-field");
                $("#loginform-pop #headerPassword").removeClass("invalid-field");
                
                $("#mobileNo-forgotpassowrd").removeClass("invalid-field");
                $("#emailAddress-forgotpassowrd").removeClass("invalid-field");
                $("#userName").removeClass("invalid-field");
              }
            
            var checkEmpForgotuserPassword = "";
            $('.check-emp-forgotuserpassoword').each(function(){                
                checkEmpForgotuserPassword = checkEmpForgotuserPassword + $(this).val(); 
                if(checkEmpForgotuserPassword==""){                    
                    $('.empHide').hide();    
                    $("#mobileNo").removeClass("invalid-field");
                    $("#emailAddress").removeClass("invalid-field");
                    
                    $("#loginform-pop #headerUserName").removeClass("invalid-field");
                    $("#loginform-pop #headerPassword").removeClass("invalid-field");
                    
                    $("#mobileNo-forgotpassowrd").removeClass("invalid-field");
                    $("#emailAddress-forgotpassowrd").removeClass("invalid-field");
                    $("#userName").removeClass("invalid-field");
                  }                                         
            })
            
            
               
           })
           
           
           

           
           
           //--
           $('.login-btn').click(function(){              
               $('#loginform-pop').show();
               $('#forgotUserNameForm').hide();
               $('#forgotPasswordForm').hide();
               
               
               $("#mobileNo").removeClass("invalid-field");
               $("#emailAddress").removeClass("invalid-field");
               
               $("#headerUserName").removeClass("invalid-field");
               $("#headerPassword").removeClass("invalid-field");
               
               $("#mobileNo-forgotpassowrd").removeClass("invalid-field");
               $("#emailAddress-forgotpassowrd").removeClass("invalid-field");
               $("#userName").removeClass("invalid-field");
           })
           
           
           $('#forgotUserName').click(function(){       
               
               $('#loginform-pop').hide();
               $('#forgotUserNameForm').fadeIn();
               $('#forgotPasswordForm').hide();
               $('.empHide').hide();    
               
               $("#mobileNo").removeClass("invalid-field");
               $("#emailAddress").removeClass("invalid-field");
               
               $("#headerUserName").removeClass("invalid-field");
               $("#headerPassword").removeClass("invalid-field");
               
               $("#mobileNo-forgotpassowrd").removeClass("invalid-field");
               $("#emailAddress-forgotpassowrd").removeClass("invalid-field");
               $("#userName").removeClass("invalid-field");
           })
           
           
           $('#link-forgotPassword').click(function(){             
                  $('#loginform-pop').hide();
                  $('#forgotUserNameForm').hide(); 
                  $('#forgotPasswordForm').fadeIn();
                  $('.empHide').hide();
                  
                  $("#mobileNo").removeClass("invalid-field");
                  $("#emailAddress").removeClass("invalid-field");
                  
                  $("#headerUserName").removeClass("invalid-field");
                  $("#headerPassword").removeClass("invalid-field");
                  
                  $("#mobileNo-forgotpassowrd").removeClass("invalid-field");
                  $("#emailAddress-forgotpassowrd").removeClass("invalid-field");
                  $("#userName").removeClass("invalid-field");
           })
          
                                         
       })
    </script>




    <!--/ Get promotion code popup-->

<script>
    function activeDiv(id, selected) {
        var selectedValue = $('#' + selected).val();
        if (id.indexOf('adult') > -1) {
            activeDeactive(selectedValue, id);
        }
        if (id.indexOf('child') > -1) {
            activeDeactive(selectedValue, id);
        }
        if (id.indexOf('other') > -1) {
            activeDeactive(selectedValue, id);
        }

    }
    function activeDeactive(selectedValue, id) {
        if (selectedValue == "SE") {
            $('#' + id).addClass('hide');
        } else {
            $('#' + id).removeClass('hide');
        }
    }

    function selected(id){
        $('#selectedAdHkidPass1').val(id.value);
    }
</script>

<script>

/* UserLogin ajax function */
function userLoginFnc() {

    /* var a=validUser(); */
    /* 
    if(a==true)
    { */
    $.ajax({
        type : "POST",
        url : "/userLogin",
        data : $("#popUploginform input").serialize(),
        async : false,
        success : function(data) {
            if (data == 'success') {
            	window.location.href=window.location.href;
                //window.location.reload();
            } else if (data == 'fail') {
                $('.login-ajax-loading').hide();
                $('#login-err-msg').show();
                $('#login-err-msg').html(getBundle(getBundleLanguage, "member.login.fail.first"));
            }
        }
    });
    /* } */
    return false;
}
function BackMe() {

    window.history.back();
}

var perventRedirect=false;
//window.onbeforeunload = function() {
//	if(perventRedirect){
//		return "???index.leavePage.desc???";
//	}
//}
</script>




<!-- Kitchen start -->
<!-- Main Content Start -->
<script type="text/javascript" src="/resources/js/onlinesavieFNA/locale.js"></script>
<script type="text/javascript" src="/resources/js/onlinesavieFNA/uifn.js"></script>
<script type="text/javascript" src="/resources/js/onlinesavieFNA/review.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/onlinesavieFNA/onlinesavieFNAReview.css">
<section id="FNAReview">
	<div class="breadcrumb-container">
		<div class="container">
			<div class="row">
				<ol class="breadcrumb pad-none">
					<li><a href="#">Home</a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#">Save</a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#">Savie</a></li>
					<li class="active "><i class="fa fa-caret-right"></i>Financial Needs Analysis</li>
				</ol>
			</div>
		</div>
	</div>
	<form id="frmReview" name="frmReview" action="" method="post">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12 lead-in">
				<p>Review and update your Financial Needs Analysis selection to match your current needs</p>
				<p><span>Last updated on <span id="lastupdate">25/10/2015</span></span></p>
			</div>
		</div>
	</div>

	<div id="personal_info" class="container review-box display">
		<div class="row question">
			<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 num">&nbsp;</div>
			<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11 title"><p>Personal Information</p></div>
			<!-- <a class="btn_edit" href="javascript:void(0);" rel="">Edit</a> -->
		</div>
		<div class="row">
			<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">&nbsp;</div>
			<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11"><span class="headline">Name</span><span id="name">&nbsp;</span></div>
		</div>
		<div class="row">
			<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">&nbsp;</div>
			<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11"><span class="headline">Gender</span><span id="gender">&nbsp;</span></div>
		</div>
		<div class="row">
			<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">&nbsp;</div>
			<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11"><span class="headline">Date of Birth</span><span id="dob">&nbsp;</span></div>
		</div>
		<div class="row">
			<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">&nbsp;</div>
			<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11">
				<span class="headline">Marital Status</span>
				<span class="displayMode marital_status">&nbsp;</span>
				<span class="editMode">
					<select id="marital_status" name="marital_status" class="form-control select-label">
						<option value="0">Single</option>
						<option value="1">Married</option>
						<option value="2">Divorced</option>
						<option value="3">Widowed</option>
					</select>
				</span>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">&nbsp;</div>
			<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11">
				<span class="headline">No. of dependents</span>
				<span class="displayMode dependents">&nbsp;</span>
				<span class="editMode">
					<select id="dependents" name="dependents" class="form-control select-label">
						<option value="0">Nil</option>
						<option value="1">1-3</option>
						<option value="2">4-5</option>
						<option value="3">7 or above</option>
					</select>
				</span>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">&nbsp;</div>
			<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11">
				<span class="headline">Education Level</span>
				<span class="displayMode education">&nbsp;</span>
				<span class="editMode">
					<select id="education" name="education" class="form-control select-label">
						<option value="0">Primary or below</option>
						<option value="1">Secondary / Matriculation</option>
						<option value="2">Vocational Training / Technical Institute / Business Institute</option>
						<option value="3">Post-secondary / University or above</option>
					</select>
				</span>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">&nbsp;</div>
			<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11">
				<span class="headline">Occupation</span>
				<span class="displayMode occupation">&nbsp;</span>
				<span class="editMode">
					<select id="status" name="status" class="form-control select-label"></select>
					<select id="nature" name="nature" class="form-control select-label"></select>
					<select id="occupation" name="occupation" class="form-control select-label"></select>
					<p class="occupation_others">Please specify: <input type="text" id="occupation_others" name="occupation_others" value="" maxlength="100"/></p>
				</span>
			</div>
		</div>

		<div id="cn" class="btn-action">
			<p class="error">&nbsp;</p>
			<a href="javascript:void(0);" class="bdr-curve btn btn-primary bck-btn btn_cancel" rel="personal_info">CANCEL</a>
			<a href="javascript:void(0);" class="bdr-curve btn btn-primary nxt-btn btn_ok" rel="personal_info">OK</a>
		</div>
		<a class="btn_edit" href="javascript:void(0);" rel="personal_info">Edit</a>
	</div>

	<div id="question-list"></div>

	<div class="center">
		<input type="button" id="btn_save" name="save" value="Save and Proceed to Product Recommendation" class="bdr-curve btn btn-primary btn-lg btn-color-ylw" >
	</div>
	</form>

	<div style="display:none;">
		<div id="template_qu" class="container review-box display">
			<div class="question row">
				<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 right num"><p>&nbsp;</p></div>
				<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11 title"><p>&nbsp;</p></div>
			</div>
			<div class="option row"></div>
			<div id="cn" class="btn-action">
				<p class="error">&nbsp;</p>
				<a href="javascript:void(0);" class="bdr-curve btn btn-primary bck-btn btn_cancel">CANCEL</a>
				<a href="javascript:void(0);" class="bdr-curve btn btn-primary nxt-btn btn_ok">OK</a>
			</div>
			<a class="btn_edit" href="javascript:void(0);" rel="">Edit</a>
		</div>

		<div id="template_op" class="row">
			<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">&nbsp;</div>
			<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11">
				<div class="wrapper">
					<div class="checkbox">
						<input type="checkbox" id="q0-c0" name="q0-c0" value="yes">
						<label for="q0-c0">&nbsp;</label>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="modal modal-vcenter fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" id="fnaPopupEnquiry">
			<div class="modal-dialog modal-lg">
				<div class="modal-content plan-modal">
					<div class="fna-popup-cont">
						<a class="close" aria-label="Close" data-dismiss="modal">
							<span aria-hidden="true" style="font-size:30px;">×</span>
						</a>
						<div class="modal-body">
							<h4>Customer Services</h4>
							<div class="cont">
								<p>Please call our Customer Service Hotline <span>3123 3123</span> to find out more or leave your contact and let us call you back.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!--#End# Template for dynamic content-->
	</div>
</section>
<!-- Main Content End -->
<!-- Kitchen end -->





<footer id="footer" class="midnight-blue hidden-sm hidden-xs">
  <div class="container">
    <div class="row">
      <div class="col-sm-6 pad-none">
        <ul class="pull-left foot-links">
          <li class="divider margin-left-none"><a href="http://www.fwd.com.hk/en-US/" target="_blank">FWD Home</a></li>
          <li  class="divider"><a href="http://www.fwd.com.hk/en-US/about/index.html" target="_blank">About us</a></li>
          <li  class="divider"><a href="http://blog.fwd.com.hk/en_US/" target="_blank">Blog</a></li>
          <li  class="divider"><a id="faqProductLink" href="/en/faq">FAQ</a></li>
          <li><a href="/en/offers">Partners & Offers</a></li>
        </ul>
      </div>
      <div class="col-sm-5 col-lg-4 pull-right">
        <div class="social">
          <ul class="social-share pull-left text-right">
        <li><a href="https://www.facebook.com/FWD.HK.MO" target="_blank"><i class="fa fa-facebook"></i></a></li>
            <li><a href="https://www.youtube.com/user/FWDHK " target="_blank"><i class="fa fa-youtube"></i></a></li>
          </ul>
          <div class="hotline pull-right text-left">
             <h5 class="text-white">24-HOUR Hotline</h5>
            <a class="hotline-num"> 3123 3123</a> </div>
          <div class="clearfix"></div>
        </div>
      </div>
    </div>
  </div>
</footer>

  
     <!-- Start of LiveChat (www.livechatinc.com) code -->

    <script type="text/javascript">
    /*
    var __lc = {};
    __lc.license = 6320751;
    __lc.group = 1;
    (function() {
    var lc = document.createElement('script'); lc.type = 'text/javascript'; lc.async = true;
    lc.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'cdn.livechatinc.com/tracking.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(lc, s);
    })();
*/
    </script>
    <!-- End of LiveChat code -->
  
  

<!--/#footer--> 
<!--/#bottom-->
<div class="bottom hidden-sm hidden-xs">
  <div class="container">
    <div class="row">
      <div class="col-lg-7 col-md-7 pull-left pad-none">
        <ul class="nav nav-pills">
          <li><a href="http://www.fwd.com.hk/en-US/home/security.html" target="_blank">Online Security</a></li>
          <li> | </li>
          <li><a href="http://www.fwd.com.hk/en-US/home/disclaimer.html" target="_blank"> Disclaimer </a></li>
          <li> | </li>
          <li><a href="http://www.fwd.com.hk/en-US/home/pdo.html" target="_blank"> Personal Data Protection Policy and Practices</a></li>
        </ul>
      </div>
    <!-- issue 50 - vincent (pccw) -->
      <div class="col-lg-5 col-md-5 pull-right text-right">
        <p> © 2015 FWD Hong Kong. All rights reserved.</p>
      </div>
    
    </div>
  </div>
</div>
<!--/#bottom--> 
<!--mob bottom-->
<div id="mob-footer" class="hidden-lg hidden-md mob-bottom">
    <div>
        <a href="http://www.fwd.com.hk/en-US/" target="_blank">FWD Home</a> |
        <a href="http://www.fwd.com.hk/en-US/about/index.html" target="_blank">About us</a> |
        <a href="http://blog.fwd.com.hk/en_US/" target="_blank">Blog</a> |
        <a href="/en/faq">FAQ</a> |
        <a href="/en/offers">Partners & Offers</a>
    </div>
    <div>
        24-HOUR Hotline 3123 3123
    </div>
  <div>
<!--      <h3 class="text-center marg-t"><a href="http://blog.fwd.com.hk" target="_blank">Blog</a></h3> -->
    <a href="http://www.fwd.com.hk/en-US/home/security.html" target="_blank">Online Security</a> |
    <a href="http://www.fwd.com.hk/en-US/home/disclaimer.html" target="_blank"> Disclaimer </a> |
    <a href="http://www.fwd.com.hk/en-US/home/pdo.html" target="_blank"> Personal Data Protection Policy and Practices</a>
  </div>
  <div id="mob-footer-terms">© 2015 FWD Hong Kong. All rights reserved.</div>
  
  
   <!-- <p class="text-center mob-bottom">© 2015 FWD Hong Kong. All rights reserved.</p> -->
</div>
<!--/mob bottom--> 

<!-- Timeout Modal -->
<div id="timeout-modal" class="modal fade fwd-generic-modal timeout" role="dialog" data-keyboard="false" data-backdrop="static">
  <div class="modal-dialog">
      <div class="modal-content" align="center">
        <div class="modal-body form-container" style="color:#fc6d08">
           <div class="row">
              <h2>Opps...Your session has been timeout.</h2>  
           </div>
           <div class="row">
              <div class="col-lg-6 col-md-6 fwd-orange-btn-center-wrapper">
                 <button type="button" class="btn next bdr-curve btn btn-primary btn-lg wd5" id="timeout-btn" data-dismiss="modal">Back to homepage</button>
              </div>
           </div>
        </div>
     </div>
  </div>
</div>

<script>
$(function() {
    $('input, textarea').placeholder();
    function navbarLogoSticky(){
        if(window.pageYOffset<35){
            $('.navbar-fixed-top').css("top", -window.pageYOffset);
        }
        if(window.pageYOffset>=35){
            $('.navbar-fixed-top').css("top", -35);
        }
    }
    $(window).scroll(navbarLogoSticky);
});

$('#timeout-btn').on('click', function(e) {
  window.location.href= contextPath+'/'+language;
});

</script>
<script type="text/javascript"
  src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript"
  src="/resources/js/html5shiv.js"></script>
<!-- <script type="text/javascript"
  src="/resources/js/jquery.isotope.min.js"></script> -->

<!-- <script type="text/javascript"
  src="/resources/js/jquery.prettyPhoto.js"></script> -->
<script type="text/javascript"
  src="/resources/js/main.js"></script>

<script type="text/javascript"
  src="/resources/js/wow.min.js"></script>

<script type="text/javascript"
  src="/resources/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript"
  src="/resources/js/locales/bootstrap-datepicker.zh-TW.js"></script>  


<script type="text/javascript"
  src="/resources/js/jasny-bootstrap.min.js"></script>

<script type="text/javascript"
  src="/resources/js/number-spinner.js"></script>
<script type="text/javascript"
  src="/resources/js/jquery.placeholder.min.js"></script>
<script type="text/javascript"
  src="/resources/js/numeral.min.js"></script>
<script type="text/javascript"
  src="/resources/js/fwd.js"></script>
<script type="text/javascript" src="/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.payment.js"></script>

	
	<script type="text/javascript">
		window.status = "Done";
	</script>
</body>
</html>




