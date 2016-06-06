<!DOCTYPE html>
<html class="mdl-js">
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
    window.status = "Loading: Document body...";
</script>
<!-- Title -->
<title>Savie plan details - Savings insurance | FWD Hong Kong</title>
<meta name="description" content="HKD savings insurance plan. Guaranteed 3% crediting rate in first 3 years. Withdraw the account value with NO charges. 105% death benefit and extra accidental dealth protection.">
<meta name="format-detection" content="telephone=no">
<meta http-equiv="Cache-control" content="no-cache, no-store">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<!-- <meta name="robots" content="NOODP"> -->
<meta name="keywords" content="meta keywords here">
<!-- Schema.org markup for Google+ -->
<meta itemprop="name" content="">
<meta itemprop="description" content="">
<meta itemprop="image" content="">
<!-- Open Graph data -->
<meta property="og:title" content="">
<meta property="og:type" content="">
<meta property="og:url" content="">
<meta property="og:image" content="">
<meta property="og:image:secure_url" content="">
<meta property="og:description" content="">
<meta property="og:site_name" content="">
<!-- Twitter Card data -->
<meta property="twitter:title" content="">
<meta property="twitter:description" content="">
<meta property="twitter:card" content="">
<meta property="twitter:image:src" content="">
<meta name="apple-mobile-web-app-capable" content="yes">
<!-- Bootstrap -->
<link rel="stylesheet" href="./asset/bootstrap.min.css">
<link rel="stylesheet" href="./asset/animate.min.css">
<link rel="stylesheet" href="./asset/font-awesome.css">
<link rel="stylesheet" href="./asset/font-awesome.min.css">
<link rel="stylesheet" href="./asset/material.min.css">
<link rel="stylesheet" href="./asset/main.css">
<link rel="stylesheet" href="./asset/responsive.css">
<link rel="stylesheet" href="./asset/jasny-bootstrap.min.css">
<link rel="stylesheet" href="./asset/datepicker.min.css">
<link rel="stylesheet" href="./asset/jquery.mCustomScrollbar.min.css">
<link rel="stylesheet" href="./asset/icomoon.min.css">
<link rel="stylesheet" href="./asset/bootstrap-slider.css">
<link rel="stylesheet" href="./asset/jquery.jscrollpane.css">
<link rel="stylesheet" href="./asset/styles.css">
<link rel="stylesheet" href="./asset/savie-styles.css">
<link rel="stylesheet" type="text/css" href="./asset/datepicker3.min.css">
<link rel="stylesheet" type="text/css" href="./asset/jquery.timepicker.css">
<link rel="stylesheet" type="text/css" href="./asset/pnotify.custom.min.css">
<script type="text/javascript" src="./asset/jquery.min.js"></script>
<script type="text/javascript" src="./asset/ZeroClipboard.js"></script>
<script type="text/javascript" src="./asset/jquery.i18n.properties-min-1.0.9.js"></script>
<script type="text/javascript" src="./asset/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="./asset/custom.js"></script>
<script type="text/javascript" src="./asset/jquery.timepicker.min.js"></script>
<script type="text/javascript" src="./asset/jquery-ui.min.js"></script>
<script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>
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
<div class="fwd-savie-wrapper">
    <link rel="icon" type="image/x-icon" href="http://localhost:8080/fwdhk/resources/images/favicon.ico">
    </head>
    <!-- <a href="javascript:void(0)" id="testajax" >Press</a> -->
    <body>
<div class="fwd-savie-wrapper">
    <script src="./asset/jquery.i18n.properties-min-1.0.9.js"></script>
    <script src="./asset/jquery.countdown.min.js"></script>
    <script>
    var getBundleLanguage = "";
    var lang = UILANGUAGE;

    if (lang === "EN") {
        getBundleLanguage = "en";
    } else {
        if (lang === "tc") {
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




    var home_url = "/fwdhk";

    /* New GetBundle */
    var _fwdErrMsg;

    $.i18n.properties({
        name: 'Messages',
        path: '' + home_url + '/resources/bundle/',
        mode: 'map',
        language: getBundleLanguage,
        cache: false,
        callback: function() {
            _fwdErrMsg = $.extend(true, {}, $.i18n);
        }
    });


    function fwdGetBundle(lang, key) {
        return (_fwdErrMsg && _fwdErrMsg.map[key]) ? (_fwdErrMsg.map[key]) : '[' + key + ']';
    }

    function getBundle(lang, key) {
        return fwdGetBundle(lang, key);
    }

    function submitLoginForm(formID) {
        $('.login-ajax-loading').css({
            "left": "0px",
            "right": "0px"
        });
        $('.login-ajax-loading').show();
        $("#" + formID + ' #login-err-msg').html("");
        $("#" + formID + ' #login-err-msg').hide();
        setTimeout(function() {
            if (validUser(formID)) {
                $.ajax({
                    type: "POST",
                    url: "/fwdhk/userLogin",
                    data: $("#" + formID).serialize(), //$("#headerLoginForm form").serialize(),
                    async: false,
                    success: function(data) {
                        if (data.loginResult == 'success') {
                            //$('.login-ajax-loading').hide();
                            //var Backlen = history.length;
                            //history.go(-Backlen);
                            if (window.location.href.indexOf("savings-insurance/plan-details") > 0) {
                                $("#fullName").html(data.fullName);
                                saviePlanDetailsGoNext();
                            } else if (window.location.href.indexOf("term-life-insurance/select-plan") > 0) {
                                perventRedirect = false;
                                ga('send', 'event', 'Login', 'Click', 'Login success');
                                window.location.href = "/fwdhk/en/term-life-insurance/select-plan?goApp=" + $('#goApp').val();
                            } else {
                                perventRedirect = false;
                                ga('send', 'event', 'Login',
                                    'Click',
                                    'Login success');
                                //location.reload();
                                window.location.href = window.location.href;
                            }
                        } else if (data.loginResult == 'Provided User Account Details Does Not Exist') {
                            try {
                                $('.login-ajax-loading').hide();
                            } catch (error) {}
                            $('#ajax-loading').hide();
                            $("#" + formID + ' #login-err-msg')
                                .show();
                            $("#" + formID + ' #login-err-msg')
                                .html(
                                    getBundle(
                                        getBundleLanguage,
                                        "member.login.fail.first"));
                        } else if (data.loginResult == 'Please provide a valid User Name and Password.') {
                            try {
                                $('.login-ajax-loading').hide();
                            } catch (error) {}
                            $('#ajax-loading').hide();
                            $("#" + formID + ' #login-err-msg')
                                .show();
                            $("#" + formID + ' #login-err-msg')
                                .html(
                                    getBundle(
                                        getBundleLanguage,
                                        "member.login.fail.first"));
                        } else if (data.loginResult == 'Link Sent Successfully On Your Registered Mail ID') {
                            try {
                                $('.login-ajax-loading').hide();
                            } catch (error) {}
                            $('#ajax-loading').hide();
                            $("#" + formID + ' #login-err-msg')
                                .show();
                            $("#" + formID + ' #login-err-msg')
                                .html(
                                    getBundle(
                                        getBundleLanguage,
                                        "member.forgotPassword.success.message"));
                        } else if (data.loginResult == 'Internet Connection Error') {
                            try {
                                $('.login-ajax-loading').hide();
                            } catch (error) {}
                            $('#ajax-loading').hide();
                            $("#" + formID + ' #login-err-msg')
                                .show();
                            $("#" + formID + ' #login-err-msg')
                                .html(
                                    getBundle(
                                        getBundleLanguage,
                                        "Connection.lost.message"));
                        } else if (data.loginResult == 'Invaild Username or password. Please try again.') {
                            try {
                                $('.login-ajax-loading').hide();
                            } catch (error) {}
                            $('#ajax-loading').hide();
                            $("#" + formID + ' #login-err-msg')
                                .show();
                            $("#" + formID + ' #login-err-msg')
                                .html(
                                    getBundle(
                                        getBundleLanguage,
                                        "member.login.fail.first"));
                        } else if (data.loginResult == 'Invaild Username or password. Next invalid attempt will block your account.') {
                            try {
                                $('.login-ajax-loading').hide();
                            } catch (error) {}
                            $('#ajax-loading').hide();
                            $("#" + formID + ' #login-err-msg')
                                .show();
                            $("#" + formID + ' #login-err-msg')
                                .html(
                                    getBundle(
                                        getBundleLanguage,
                                        "member.login.fail.second"));
                        } else if (data.loginResult == 'Your username has been locked out, please reset your password by \'Forget Password\'.') {
                            try {
                                $('.login-ajax-loading').hide();
                            } catch (error) {}
                            $('#ajax-loading').hide();
                            $("#" + formID + ' #login-err-msg')
                                .show();
                            $("#" + formID + ' #login-err-msg')
                                .html(
                                    getBundle(
                                        getBundleLanguage,
                                        "member.login.fail.third"));
                        } else if (data.loginResult == 'fail') {
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
                                .html(data.loginResult);
                        }

                    },
                    error: function() {
                        $('.login-ajax-loading').hide();

                        $('.login-ajax-loading').hide();
                        $("#" + formID + ' #login-err-msg')
                            .show();
                        $("#" + formID + ' #login-err-msg')
                            .html(data.loginResult);

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
                            <span class="top-weixin"><a href="http://localhost:8080/fwdhk/en/savings-insurance/plan-details#" target="_blank"><i class="fa fa-weixin"></i></a></span> <span class="callus"> 24-HOUR HOTLINE 3123 3123</span>
                        </div>
                    </div>
                    <div class="col-lg-7 col-md-7">
                        <div class="collapse navbar-collapse navbar-right top-menu pad-none" id="headerLoginForm">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="http://localhost:8080/fwdhk/en">HOME</a></li>
                                <li>|</li>
                                <li><a href="http://www.fwd.com.hk/en-US/about/index.html" target="_blank">ABOUT</a></li>
                                <li>|</li>
                                <li><a href="http://localhost:8080/fwdhk/en/joinus">REGISTER</a></li>
                                <li>|</li>
                                <li>
                                    <a class="lang pull-right" id="anchor-lang" href="http://localhost:8080/fwdhk/changeLang?selectLang=tc&amp;action=/en/savings-insurance/plan-details">中文</a>
                                </li>
                                <li class="dropdown login-btn margin-left1" id="myDropdown">
                                    <a href="http://localhost:8080/fwdhk/en/savings-insurance/plan-details#" data-toggle="modal" data-target="#loginpopup">LOGIN <i class="fa fa-caret-right"></i> </a>
                                    <!--  </a> -->
                                    <div class="dropdown-menu drop-width">
                                        <form name="loginform" id="loginform">
                                            <div class="login-form">
                                                <div style="display: none; position: fixed; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1000" class="login-ajax-loading">
                                                    <img style="width: 100px; height: 100px; position: absolute; top: 50%; left: 50%; margin-top: -50px; margin-left: -50px;" src="./asset/ajax-loader.gif">
                                                </div>
                                                <div id="login-err-msg" class="alert alert-danger" role="alert" style="display: none;"></div>
                                                <div class="form-container">
                                                    <h2>
													Log in to FWD
												</h2>
                                                    <h4 class="margin-shift">
													Username
													<a href="http://localhost:8080/fwdhk/en/forgotUserName" class="pull-right sub-link">Forgot username?</a>
												</h4>
                                                    <div class="form-group">
                                                        <input type="text" name="userName" class="form-control placeholder" placeholder="" id="headerUserName">
                                                    </div>
                                                    <span id="errUserName" style="color: red"></span>
                                                    <h4 class="margin-shift">
													Password
													<a href="http://localhost:8080/fwdhk/en/forgotPassword" class="pull-right sub-link">Forgot password?</a>
												</h4>
                                                    <div class="form-group">
                                                        <input type="password" name="password" class="form-control" autocomplete="off" id="headerPassword">
                                                    </div>
                                                    <span id="errPass" style="color: red"></span>
                                                    <br>
                                                    <div class="row">
                                                        <div class="col-lg-6 col-md-6">
                                                            <button type="button" onclick="submitLoginForm(&#39;loginform&#39;);" class="bdr-curve btn btn-primary btn-lg wd5">
                                                                Log In
                                                            </button>
                                                        </div>
                                                        <h3 class="text-left col-lg-6 col-md-6 pad-none margin-none">
														<span> New Member?</span><br>
														<a href="http://localhost:8080/fwdhk/en/joinus">
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
                                <li class="chatnow-btn"><a href="http://www.fwd.com.hk/en-US/" target="_blank">FWD HK</a></li>
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
                    <a class="navbar-brand" href="http://localhost:8080/fwdhk/en"><img src="./asset/iFWD_logo_200px.jpg" alt="FWD Hong Kong"></a>
                </div>
                <!--<div class="col-lg-8 col-md-7 pull-right">
				<ul class="maintabs">
					<li
						class="col-lg-3 col-md-3 pad-none main-tab "><a
						href="/fwdhk/en/savings-insurance"
						class="travel-and-home-tab">Savie<br> Insurance</a>
						<div class="special-offer"></div></li>
					<li
						class="col-lg-3 col-md-3 pad-none main-tab "><a
						href="/fwdhk/en/working-holiday-insurance"
						class="workingholiday-tab">Working Holiday Insurance</a></li>
					<li
						class="col-lg-3 col-md-3 pad-none main-tab "><a
						href="/fwdhk/en/flight-insurance"
						class="travel-and-home-tab">Flight Insurance</a>
						<div class="offer"></div></li>
					<li
						class="col-lg-3 col-md-3 pad-none main-tab "><a
						href="/fwdhk/en/travel-insurance"
						class="travel-and-home-tab">Travel Insurance</a></li>
					<li
						class="col-lg-3 col-md-3 pad-none main-tab ext_content "><a
						href="/fwdhk/en/home-insurance"
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
                                        <li class="menu-subtitle">Life &amp; Health</li>
                                        <li class="menu-link">
                                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                            <a href="http://localhost:8080/fwdhk/en/term-life-insurance">Term Life</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="col-lg-5 col-md-5 no-padding middle-group">
                                    <ul class="col-lg-12 col-md-12">
                                        <li class="menu-subtitle">Travel</li>
                                        <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="http://localhost:8080/fwdhk/en/flight-insurance">FlightCare</a></li>
                                        <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="http://localhost:8080/fwdhk/en/travel-insurance">TravelCare</a></li>
                                        <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="http://localhost:8080/fwdhk/en/overseas-study-insurance">Overseas StudyCare</a></li>
                                        <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="http://localhost:8080/fwdhk/en/working-holiday-insurance">Working HolidayCare</a></li>
                                    </ul>
                                </li>
                                <li class="col-lg-3 col-md-3 no-padding">
                                    <ul class="col-lg-12 col-md-12 no-padding">
                                        <li class="menu-subtitle">Household</li>
                                        <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="http://localhost:8080/fwdhk/en/home-insurance">Easy HomeCare</a></li>
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
                                            <a class="menu-link" href="http://localhost:8080/fwdhk/en/savings-insurance">Savie Insurance Plan</a>
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
                                            <a class="menu-link" href="http://localhost:8080/fwdhk/en/fwdiscover">FWDiscover</a>
                                        </li>
                                        <li class="menu-link">
                                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                            <a class="menu-link" href="http://localhost:8080/fwdhk/en/offers">Partners &amp; Offers</a>
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
    <div style="position: absolute; top: 0; left: 0; bottom: 0; right: 0; z-index: 998; display: none" id="test"></div>
    <!--Mobile-header-->
    <div class="navbar navbar-default navbar-fixed-top hidden-lg hidden-md pad-none" role="navigation">
        <!--<div class="mob-header hidden-lg hidden-md pad-none">-->
        <div class="mob-topbar">
            <!--
		<span id="toplefthotline" class="callus top-number">24hr Hotline 3123 3123</span> <a href="#"
			onClick="zopim_chat_start()"><span class="chat pull-right">FWD HK</span></a>
		 -->
            <span id="toplefthotline" class="callus top-number">24hr Hotline 3123 3123</span> <a href="http://www.fwd.com.hk/en-US/"><span class="chat pull-right">FWD HK</span></a>
            <!-- <a class="lang pull-right" href="/fwdhk/changeLang?selectLang=EN&action=/en/savings-insurance/plan-details">中文</a>  -->
            <a class="lang pull-right" id="anchor-lang" href="http://localhost:8080/fwdhk/changeLang?selectLang=tc&amp;action=/en/savings-insurance/plan-details">中文</a>
            <div class="clearfix"></div>
        </div>
        <div class="logobox">
            <div class="navbar-header" style="overflow: hidden;">
                <button type="button" class="navbar-toggle mob-menu-btn col-xs-1 col-sm-1" data-toggle="collapse" data-target=".navbar-collapse">
                    <!--<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">-->
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span> <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand pull-left col-xs-12 col-sm-12" href="http://localhost:8080/fwdhk/en"><img src="./asset/iFWD_logo_mobile.png" alt="FWD Hong Kong" class="img-responsive"></a>
                <div class="clearfix"></div>
            </div>
            <div class="navbar-collapse collapse mobile-menu-V2">
                <ul class="col-sm-12 nav navbar-nav">
                    <li class="pad-none col-sm-12 dropdown border-bottom">
                        <div class="dropdown login-btn btn btn-lg wd2" id="myDropdown" data-toggle="modal" data-target="#loginpopup">
                            <a href="http://localhost:8080/fwdhk/en/savings-insurance/plan-details#" class="dropdown-toggle color-wht log-to-acc" id="fwd-login-mob"><i class="fa fa-lock"></i> Log in to FWD </a>
                        </div>
                    </li>
                    <li class="pad-none col-sm-12 dropdown link-btn link-grp border-bottom fwd-header-navgation-menu">
                        <a href="http://localhost:8080/fwdhk/en/savings-insurance/plan-details#" class="dropdown-toggle" data-toggle="dropdown">PROTECT<img class="link-arrow" src="./asset/arrow.png"><img class="link-arrow hidden-label" src="./asset/arrow-down.png"></a>
                        <ul class="col-sm-12 dropdown-menu">
                            <li class="menu-link-grp-title">
                                <a href="http://localhost:8080/fwdhk/en/term-life-insurance">Life &amp; Health</a>
                            </li>
                            <li class="menu-link-grp-title">
                                <a href="http://localhost:8080/fwdhk/en/savings-insurance/plan-details#" class="dropdown-toggle" data-toggle="dropdown">Travel</a>
                                <ul class="col-sm-12 dropdown-menu">
                                    <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="http://localhost:8080/fwdhk/en/flight-insurance">FlightCare</a></li>
                                    <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="http://localhost:8080/fwdhk/en/travel-insurance">TravelCare</a></li>
                                    <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="http://localhost:8080/fwdhk/en/overseas-study-insurance">Overseas StudyCare</a></li>
                                    <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="http://localhost:8080/fwdhk/en/working-holiday-insurance">Working HolidayCare</a></li>
                                </ul>
                            </li>
                            <li class="menu-link-grp-title"><a href="http://localhost:8080/fwdhk/en/home-insurance">Household</a></li>
                        </ul>
                    </li>
                    <li class="pad-none col-sm-12 dropdown link-btn border-bottom fwd-header-navgation-menu">
                        <a href="http://localhost:8080/fwdhk/en/savings-insurance">SAVE<img class="link-arrow" src="./asset/arrow.png"><img class="link-arrow hidden-label" src="./asset/arrow-down.png"></a>
                    </li>
                    <li class="pad-none col-sm-12 dropdown link-btn link-grp fwd-header-navgation-menu">
                        <a href="http://localhost:8080/fwdhk/en/savings-insurance/plan-details#" class="dropdown-toggle" data-toggle="dropdown">ENJOY<img class="link-arrow" src="./asset/arrow.png"><img class="link-arrow hidden-label" src="./asset/arrow-down.png"></a>
                        <ul class="col-sm-12 dropdown-menu">
                            <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="http://localhost:8080/fwdhk/en/fwdiscover">FWDiscover</a></li>
                            <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="http://localhost:8080/fwdhk/en/offers">Partners &amp; Offers</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
    </div>

    <!-- Main Content Start-->

    <link rel="stylesheet" href="./resources/css/application.css">
    <link rel="stylesheet" href="./resources/css/easy-home/easyhome-application.css">
    <link rel="stylesheet" href="./resources/css/easy-home/icon-font.css"></head>
    <!-- <link href="http://cdn-dev.aldu.net/jquery.mobiscroll/latest/jquery.mobiscroll.min.css" rel="stylesheet" type="text/css" /> -->
    <link href="./resources/css/easy-health/mobiscroll.custom-2.17.1.min.css" rel="stylesheet" type="text/css" />
    <!-- <script src="http://cdn-dev.aldu.net/jquery.mobiscroll/latest/jquery.mobiscroll.min.js" type="text/javascript"></script> -->
    <script src="./resources/js/easy-health/mobiscroll.custom-2.17.1.min.js" type="text/javascript"></script>
    <script src="./asset/jSignature.min.js"></script>
    <script type="text/javascript" src="./resources/js/application.common.0.2.js"></script>
    <script type="text/javascript" src="./resources/js/easy-health/easyhealth-app-uifn.js"></script>
    <div class="fwd-container container-fluid breadcrumbs">
        <div class="breadcrumb-container">
           <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
               <li><a href="https://uat-ecom.i.fwd.com.hk/fna/tc/savings-insurance/signature#">Home</a></li>
               <li class="divider"><i class="fa fa-play"></i></li>
               <li><a href="https://uat-ecom.i.fwd.com.hk/fna/tc/savings-insurance/signature#">Save</a></li>
               <li class="divider"><i class="fa fa-play"></i></li>
               <li><a href="https://uat-ecom.i.fwd.com.hk/fna/tc/savings-insurance/signature#">Life Insureance Plan</a></li>
               <li class="divider last"><i class="fa fa-play"></i></li>
               <li class="active-bc" id="et-active-bc-menu">Application</li>
           </ol>
        </div>
     </div>
     <div class="savie-online-container app-pg-ctnr" id="ehome-app-selectplan">
     <div class="container-fluid fwd-full-container browse-holder">
        <div class="application-page-header et-header-browse">
           <div class="browse-container">
              <div class="row reset-margin hidden-xs hidden-sm">
                 <ul class="common-steps-list six-steps nav nav-pills">
                    <li class="step-number" id="first-step"><button type="button" class="et-header-info-btn active"><span class="status">1</span>Select Plan</button></li>
                    <li class="arrow-next-step"> <img src="./asset/header-browse-arrow.png" class="browse-arrow"></li>
                    <li class="step-number"><button type="button" class="et-header-info-btn"><span class="status">2</span>Application</button></li>
                    <li class="arrow-next-step"> <img src="./asset/header-browse-arrow.png" class="browse-arrow"></li>
                    <li class="step-number" id="last-steps"><button type="button" class="et-header-info-btn"><span class="status">3</span>Summary &amp; Payment</button></li>
                    <li class="arrow-next-step"> <img src="./asset/header-browse-arrow.png" class="browse-arrow"></li>
                    <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">4</span>Confirmation</button></li>
                 </ul>
             </div>
           </div>  
        </div>
     </div>
    <div class="container-fluid summary-bar">
        <div class="row">
            <div class="summary-bar-container">
                
                <ul class="summary-group clearfix">
                    <!--  -->
                    <li class="back">
                        <a href="javascript:void(0);" class="btn-summary-back"><i class="icon icon-arrow-left2"></i></a>
                    </li>
                    <li class="first">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label">Easy HomeCare</p>
                            <p class="fld-val">Standard cover, Annual</p>
                            </div>
                        </div>                        
                    </li>
                    <li class="hidden-xs">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label">Promote Code</p>
                            <p class="fld-val"><span class="txt-promote-code">-</span></p>
                            </div>
                        </div>
                    </li>
                    <li class="hidden-xs">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label">The Club Member</p>
                            <p class="fld-val"><span class="txt-theclub-member">-</span></p>
                            </div>
                        </div>
                    </li>
                    <li class="hidden-xs">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label">Original price</p>
                            <p class="fld-val">HK$420.00</p>
                            </div>
                        </div>
                    </li>
                    <li class="hidden-xs">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label">Discount</p>
                            <p class="fld-val">HK$0.00</p>
                            </div>
                        </div>
                    </li>
                    <li class="last hidden-xs">
                        <p><span class="txt-hkd-prefix">HK$</span><span class="txt-price">420.00</span><span class="txt-hkd-suffix"></span></p>
                    </li>
                    <li class="visible-xs dropdown-more">
                         <a href="javascript:void(0);" class="btn-summary-back" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-chevron-down"></i></a>

                         <ul class="col-sm-12 dropdown-menu dropdown-menu-more">
                            <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label">Promote Code</p>
                                        <p class="fld-val"><span class="txt-promote-code">-</span></p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label">The Club Member</p>
                                        <p class="fld-val"><span class="txt-theclub-member">-</span></p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label">Original price</p>
                                        <p class="fld-val">HK$420.00</p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label">Discount</p>
                                        <p class="fld-val">HK$0.00</p>
                                    </div>
                                </div>
                            </li>
                         </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
     <div class="app-pg-cont">
        <form id="ef-form-selectplan">
        <div class="container-fluid">
            <div class="row app-selectplan-tab">
                <div class="col-xs-12 col-md-12">
                    <div class="row app-selectplan-tab-head">
                        <div class="col-xs-12 col-md-12">
                            <img src="./resources/images/easy-home/img-planA-hero.jpg" class="img-hero" alt="">
                            <div class="app-hero-panel-cont">
                                <h2><span>Easy HomeCare</span><br>HK $420/year</h2>
                                <a href="javascript:void(0);" class="btn-app btn-select-plan reverse">Selected</a>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div class="col-xs-12 col-md-12">
                    <div class="row app-selectplan-tab-body">
                        <div class="col-xs-3"> <!-- required for floating -->
                        <!-- Nav tabs -->
                        <ul class="tabs-left">
                            <li class="active"><a href="#highlights" data-toggle="tab"><i class="icon-icon_01"></i><span>Product Highlights</span></a></li>
                            <li><a href="#coverage" data-toggle="tab"><i class="icon-icon_03"></i><span>Summary of Coverage</span></a></li>
                            <li><a href="#premium" data-toggle="tab"><i class="icon-icon_02"></i><span>Premium Table (HK$)</span></a></li>
                            <li><a href="#exclusion" data-toggle="tab"><i class="icon-icon_04"></i><span>Major Exclusions</span></a></li>
                            <li><a href="#excess" data-toggle="tab"><i class="icon-icon_05"></i><span>Excess</span></a></li>
                        </ul>
                        </div>

                        <div class="col-xs-9">
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div class="tab-pane active" id="highlights">
                                <h4>Product Highlights</h4>
                                <p>You'll receive extensive 'All Risks' cover: up to HK$500,000 on Household Contents as well as up to HK$100,000 for personal items (with a maximum of $10,000 per item). From your furniture to your frozen food, stay protected with this comprehensive home insurance.</p>
                                <ul>
                                    <li>Household Contents cover up to a limit as high as HK$500,000</li>
                                    <li>Personal Liability Insurance covers up to HK$5,000,000 as owner and/or occupier of your home or as a private individual anywhere in the world</li>
                                    <li>Protects household contents inside the home, such as furniture, electrical appliances etc., against loss or damage arising from fire, flood, bursting pipes, typhoon, theft and other accidents</li>
                                    <li>In an event that your home becomes uninhabitable as a result of accidental loss or damage, our home insurance will help you with the costs of alternative accommodation of up to HK$1,000 per day / HK$50,000 per year</li>
                                    <li>If someone sustains accidental bodily injury or accidental property damage and you, or your family members, are responsible, we'll pay up to HK$5,000,000 for any loss or damage</li>
                                    <li>Applicable to Home for Net Floor Area up to 1,000 square feet</li>
                                </ul>
                            </div>
                            <div class="tab-pane" id="premium">
                                <h4>Premium Table (HK$)</h4>
                                <p>Applicable to Home for Net Floor Area up to 1,000 square feet</p>
                                <br>
                                <table class="table-in-tab">
                                    <tr class="thbg">
                                        <th>Section</th>
                                        <th>Coverage</th>
                                        <th>Limit of Liability (HK$)</th>
                                        <th>Annual Premium (HK$)</th>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>Household Contents</td>
                                        <td>500,000</td>
                                        <td>420</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Personal Liability</td>
                                        <td>5,000,000</td>
                                        <td>Free with Section 1</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="tab-pane" id="coverage">
                                <h4>Summary of Coverage</h4>
                                <strong>Section 1. Household Contents</strong><br>
                                <p>Your household contents at home are insured for 'All Risks' cover. This 'All Risks' cover protects your contents against accidental loss or damage arising from, including but not limited to, fire, flood, typhoon, explosion or theft, up to a maximum of HK$500,000 per year. Maximum limit of the coverage for any one item of your household contents is HK$100,000. Valuables, such as jewellery, gold, silver, watches, photographic equipment, furs, musical instruments (except pianos), are covered up to HK$10,000 per item and with an aggregate maximum of HK$100,000 per year.</p>
                                <br>
                                <p>In addition to the above mentioned coverage, this insurance provides the following extra benefits:</p>
                                <br>
                                <table id="homecarePremium" class="table table-bordred">
                                    <tbody>
                                        <tr style="background-color: #f68a1d;">
                                            <td><strong style="color: #fff;">Item</strong></td>
                                            <td><strong style="color: #fff;">Benefit</strong></td>
                                            <td><strong style="color: #fff;">Maximum Limits(HK$)</strong></td>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td><strong>Window, Door Lock &amp; Key Replacement Replacement of external door locks and keys or broken windows due to theft or attempted theft</strong></td>
                                            <td>3,000 per year</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td><strong>Temporary Removal<br>Accidental loss of or damage to household contents whilst being temporarily removed from home for renovation, cleaning or repair</strong></td>
                                            <td>50,000 per year</td>
                                        </tr>
                                        <tr>
                                            <td>3<br></td>
                                            <td><strong>Home Removal<br>Accidental loss of or damage to household contents:<br>(a) whilst in transit between current home and new home by professional removers within Hong Kong; or<br>(b) whilst in temporary storage, for up to 7 days in a furniture depository; or<br>(c) whilst at the new home but before occupied as permanent residence up to 2 months (you have to notify us before your move)</strong></td>
                                            <td>50,000 per year</td>
                                        </tr>
                                        <tr>
                                            <td>4</td>
                                            <td><strong>Frozen Food<br>Cost of replacing spoilt frozen food due to accidental power failure or breakdown of refrigerator</strong></td>
                                            <td>5,000 per year</td>
                                        </tr>
                                        <tr>
                                            <td>5</td>
                                            <td><strong>Removal of Debris<br>Cost of removal of debris when household contents are accidentally damaged</strong></td>
                                            <td>10,000 per year</td>
                                        </tr>
                                        <tr>
                                            <td>6</td>
                                            <td><strong>Personal Money<br>Accidental loss or theft of money at home</strong></td>
                                            <td>2,500 per year</td>
                                        </tr>
                                        <tr>
                                            <td rowspan="2">7</td>
                                            <td><strong>Domestic Helper's Property</strong></td>
                                            <td>1,000 per item</td>
                                        </tr>
                                        <tr>
                                            <td><strong>Accidental loss of or damage to domestic helper's property at home</strong></td>
                                            <td>5,000 per year</td>
                                        </tr>
                                        <tr>
                                            <td>8</td>
                                            <td><strong>Tenants Improvement<br>Accidental loss of or damage to tenant's improvements at home</strong></td>
                                            <td>100,000 per item</td>
                                        </tr>
                                        <tr>
                                            <td>9</td>
                                            <td><strong>Interior Renovation<br>Accidental loss of or damage to household contents during interior renovation by contractors (provided that the period of renovation is within 2 months)</strong></td>
                                            <td>100,000 per year</td>
                                        </tr>
                                        <tr>
                                            <td rowspan="2">10</td>
                                            <td rowspan="2"><strong>Alternative Accommodation<br>Cost of alternative accommodation when the home becomes uninhabitable as a result of accidental loss or damage</strong></td>
                                            <td>1,000 per day</td>
                                        </tr>
                                        <tr>
                                            <td>50,000 per year</td>
                                        </tr>
                                        <tr>
                                            <td rowspan="2">11</td>
                                            <td rowspan="2"><strong>Personal Accident<br>Accidental death of Insured or Insured's family members as a result of fire or theft at home</strong></td>
                                            <td>50,000 per person</td>
                                        </tr>
                                        <tr>
                                            <td>200,000 per year</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <strong>Section 2. Personal Liability</strong><br>
                                
                                <p>Easy HomeCare provides worldwide cover of your legal liability up to HK$5,000,000 against any claim for bodily injury or property damage resulting from the negligence of you or your family members normally living with you, provided that the legal proceeding is submitted to the Hong Kong court.</p>
                                <p>a) as occupier of the home</p>
                                <p>b) as owner of the home (including common areas of the building)</p>
                                <p>c) as a private individual (anywhere in the world)</p>
                                <p>Cover for your legal liability as a Tenant of the home against damage caused to the structure of the home and landlord's fixtures and fittings.</p>
                            </div>
                            <div class="tab-pane" id="exclusion">
                                <h4>Major Exclusions</h4>
                                <p>The following is only a summary of the major exclusions. Please refer to the Policy for details.</p>
                                <ul>
                                    <li>Loss or damage arising from uninsurable risks such as scratching, wear and tear, mechanical or electrical fault or breakdown, misuse or domestic animals</li>
                                    <li>Loss of or damage to mobile phones, household contents contained in open areas or on roofs, spectacles, contact lenses, sporting equipment whilst in use, computer system records, aerial devices or satellite dish</li>
                                    <li>Loss or damage if the home is unoccupied for more than 60 consecutive days</li>
                                    <li>Personal Liability for travel out of Hong Kong exceeding 90 consecutive days</li>
                                    <li>Loss or damage due to war risks, radioactive risks, sonic bangs or any act of terrorism</li>
                                </ul>
                            </div>
                            <div class="tab-pane" id="excess">
                                <h4>Excess</h4>
                                <table>
                                    <tr>
                                        <th>Section 1 - Household Contents</th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <ul>
                                                <li>The first HK$1,000 of each claim caused by water</li>
                                                <li>The first HK$500 of each claim resulting from any other cause</li>
                                            </ul>
                                        </td>
                                    </tr>
                                </table><br>
                                <table>
                                    <tr>
                                        <th>Section 2 - Personal Liability</th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <ul>
                                                <li>The first HK$500 of each claim for third party property damage</li>
                                            </ul>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        </div>  
                    </div>
                </div>
            </div>
            <p class="disclaimer">The features above are indicative only. Please refer to the <a href="https://www.fwd.com.hk/~/media/Files/FWDHK/pdf/protect/household/easy-home-care.pdf" target="_blank">Product Brochure</a> for details. 
For a complete explanation of the terms and conditions, please call our Customer Hotline at<nobr> <a href="tel:31233123">3123 3123</a></nobr>.</p>

        </div>
        </form>
    </div>
    <div class="container-fluid summary-bottom-bar">
        <div class="summary-bottom-bar-container">
            <div class="row">
                <div class="col-xs-12 col-md-4 col-md-offset-2 promotion-wrapper">
                    <form action="">
                        <div class="lbl">
                            <label>Promotion Code</label> <a href="javascript:void(0);" class="link-how2-get" data-toggle="modal" data-target=".bs-promo-modal-lg">How do I get promotion code?</a>
                        </div>
                        <div>
                            <input type="text" id="promoCode" name="referralCode" class=""><a href="javascript:void(0);" class="btn-promo-apply">Apply</a>
                        </div>
                    </form>
                </div>
                <div class="col-xs-12 col-md-4 theclub-wrapper">
                    <div class="checkbox">
                        <input type="checkbox" id="the-club-member-toggle" name="hasTheClubMembershipNo"> <label for="the-club-member-toggle"><a class="sub-link" href="" data-toggle="modal" data-target=".bs-theclub-modal-lg"><img src="./resources/images/easy-home/ico-the-club.png" alt=""><span>Member</span></a></label>
                    </div>
                    <input type="text" id="theClubMembershipNo" name="theClubMembershipNo" disabled="disabled">
                    
                    
                </div>
                
                
            </div>
        </div>
    </div>

    <!--Get promotion code popup-->
    <div class="modal fade bs-promo-modal-lg " tabindex="-1" role="dialog"
        aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content plan-modal">
                <div class="login-form" id="sendmailofpromocode">
                    <div style="overflow: hidden;">
                        <a class="close" aria-label="Close" data-dismiss="modal"> <span
                            aria-hidden="true" style="font-size: 30px;">×</span>
                        </a>
                    </div>
                    <form>
                        <div class="form-container">
                            <h2>
                                Don't have a promotion code? Enter your email address and we'll send you one.
                            </h2>
                            <div class="alert alert-success hide proSuccess"></div>
                            <h4>
                                Email address
                            </h4>
                            <div class="form-group">
                                <input type="email" class="form-control" placeholder=""
                                    name="emailToSendPromoCode" id="emailToSendPromoCode">
                                <input type="hidden" name="planCode" id="planCode"
                                    value="HOMECARE">
                            </div>
                            <span id="errPromoEmail" class="text-red"></span> <br>
                            <div class="row">
                                <div class="col-lg-6 col-md-6">
                                    
                                    <button type="submit" onclick="return sendEmail()"
                                        class="bdr-curve btn btn-primary btn-lg wd5">
                                        Submit
                                    </button>
                                </div>
                                <div class="col-md-2">
                                    <br>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <!-- <a class="bdr-curve btn btn-primary btn-lg promo-pop-close wd5" href="#" data-dismiss="modal">Close </a>  -->
                                </div>
                                <br> <br>
                                <div class="col-lg-12 col-md-12">
                                    <p>
                                        By submitting my email address I agree to receive FWD's promotion code and other offers in the future.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="app-pg-cont">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12">
                    <div class="btn-row text-center">
                        <a href="javascript:void(0);" class="btn-app eh-btn-back grey-out">Back</a>
                        <a href="javascript:void(0);" class="btn-app eh-btn-next grey-out">Next</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--Get promotion code popup-->
    <div class="modal fade bs-promo-modal-lg " tabindex="-1" role="dialog"
        aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content plan-modal">
                <div class="login-form" id="sendmailofpromocode">
                    <div style="overflow: hidden;">
                        <a class="close" aria-label="Close" data-dismiss="modal"> <span
                            aria-hidden="true" style="font-size: 30px;">×</span>
                        </a>
                    </div>
                    <form>
                        <div class="form-container">
                            <h2>
                                Don't have a promotion code? Enter your email address and we'll send you one.
                            </h2>
                            <div class="alert alert-success hide proSuccess"></div>
                            <h4>
                                Email address
                            </h4>
                            <div class="form-group">
                                <input type="email" class="form-control" placeholder=""
                                    name="emailToSendPromoCode" id="emailToSendPromoCode">
                                <input type="hidden" name="planCode" id="planCode"
                                    value="HOMECARE">
                            </div>
                            <span id="errPromoEmail" class="text-red"></span> <br>
                            <div class="row">
                                <div class="col-lg-6 col-md-6">
                                    
                                    <button type="submit" onclick="return sendEmail()"
                                        class="bdr-curve btn btn-primary btn-lg wd5">
                                        Submit
                                    </button>
                                </div>
                                <div class="col-md-2">
                                    <br>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <!-- <a class="bdr-curve btn btn-primary btn-lg promo-pop-close wd5" href="#" data-dismiss="modal">Close </a>  -->
                                </div>
                                <br> <br>
                                <div class="col-lg-12 col-md-12">
                                    <p>
                                        By submitting my email address I agree to receive FWD's promotion code and other offers in the future.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Main Content End-->

		
    </div>

</div>
    <!-- -->


                
              

    <!-- -->
    <div id="myModal" class="mob-login-form-wrapper modal fade" role="dialog">
        <div style="display: none; position: fixed; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 2001" class="login-ajax-loading">
            <img style="width: 100px; height: 100px; position: absolute; top: 50%; left: 50%; margin-top: -50px; margin-left: -50px;" src="./asset/ajax-loader.gif">
        </div>
        <div id="myDropdownMob" class="modal-dialog">
            <form name="loginform" id="loginform2">
                <div class="login-form" style="position: absolute;">
                    <div id="login-err-msg" class="alert alert-danger col-xs-10 col-xs-offset-1 " role="alert" style="display: none;"></div>
                    <div class="form-container">
                        <h2>
                        Log in to FWD
                    </h2>
                        <h4 class="margin-shift">
                        Username
                        <a href="http://localhost:8080/fwdhk/en/forgotUserName" class="pull-right sub-link">Forgot username?</a>
                    </h4>
                        <div class="form-group">
                            <input type="text" name="userName" class="form-control placeholder" placeholder="" id="headerUserName">
                        </div>
                        <span id="errUserName" style="color: red"></span>
                        <h4 class="margin-shift">
                        Password
                        <a href="http://localhost:8080/fwdhk/en/forgotPassword" class="pull-right sub-link">Forgot password?</a>
                    </h4>
                        <div class="form-group">
                            <input type="password" name="password" class="form-control" autocomplete="off" id="headerPassword">
                        </div>
                        <span id="errPass" style="color: red"></span>
                        <br>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-xs-6">
                                <button type="button" onclick="submitLoginForm(&#39;loginform2&#39;);" class="bdr-curve btn btn-primary btn-lg wd5">
                                    Log In
                                </button>
                            </div>
                            <h3 class="text-left col-lg-6 col-md-6  col-xs-6 pad-none margin-none">
                            <span> New Member?</span><br>
                            <a href="http://localhost:8080/fwdhk/en/joinus">
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
        var pageControllerName = "#SavieOnline";
        var faqProductLink = "/fwdhk/en/faq";
        //console.log(faqProductLink);
        $("#faqProductLink").attr("href", "" + faqProductLink + pageControllerName + "");
        var faqLinkRe = new RegExp(/^faq/);
        var langFaqProductLink = window.location.href.substr(window.location.href.lastIndexOf("/") + 1);
        console.log(faqLinkRe.test(langFaqProductLink));
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
        $modals.each(function(i) {
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


    function offerMenuActive() {
        var site_uri = window.location.pathname;
        var uri_array = site_uri.split("/");
        if (uri_array[uri_array.length - 1] == 'offers') {
            $(".enjoy").addClass("active");
        }
    }
    $(document).ready(function() {
        offerMenuActive();
        //console.log(window.location.pathname.substring(-5));
        //$("#loginform2").appendTo("body");
        //console.log(navigator.userAgent.match('CriOS'));
        if (navigator.userAgent.match('CriOS')) {
            if (lang === "tc") {
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

    $("li.link-btn.link-grp").click(function() {
        $(this).find("img").toggle();
    });
    $('ul.dropdown-menu [data-toggle=dropdown]').on('click', function(event) {
        // Avoid following the href location when clicking
        event.preventDefault();
        // Avoid having the menu to close when clicking
        event.stopPropagation();
        // Re-add .open to parent sub-menu item
        if ($(this).parent().hasClass('open')) {
            $(this).parent().removeClass('open');
        } else {
            $(this).parent().addClass('open');
            $(this).parent().siblings("li").removeClass('open');
            $(this).parent().find("ul").parent().find("li.dropdown").addClass('open');
        }
    });
    </script>
    <div class="modal modal-vcenter fade bs-example-modal-lg " id="ios_chromeAlert" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content plan-modal">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>
                <div class="modal-body">
                    <p class="alert_header">Opps...Your browser is currently not supported.</p>
                    <p class="alert_suggest">Please switch to suggested
                        <br>browsers below:</p>
                    <img src="./asset/safari_background.png">
                </div>
                <div class="modal-footer">
                    <button id="closemodal" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade bs-example-modal-lg " id="loginpopup" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg savie-modal-wrapper">
            <div class="modal-content plan-modal">
                <div class="login-close-wrapper"><a class="close" aria-label="Close" data-dismiss="modal"><span aria-hidden="true">×</span></a></div>
                <!-- 登入 -->
                <div class="login-info hidden login-info-savie">
                    <div class="upper-overlay">
                        <h4 class="heading-h4">
	                        Thank you for your interest in this product.
	                    </h4>
                        <h5 class="heading-h5">
	                        Let’s complete a quick Financial Needs Analysis (FNA) to assess your suitability for your interested products! You can log in to your existing FWD account or create one to proceed.
	                    </h5>
                    </div>
                    <img src="./asset/savie-bg-overlay.png" alt="Saive" class="hidden-xs hidden-sm img-responsive">
                    <img src="./asset/savie-bg-mobile-overlay.png" alt="Saive" class="hidden-lg hidden-md img-responsive">
                </div>
                <div class="login-title-wrapper">
                    <h4 class="color-darkgray heading-h4">Log In</h4></div>
                <form name="loginform" id="loginform-pop">
                    <div class="login-form">
                        <div style="display: none; position: absolute; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1000" class="login-ajax-loading">
                            <img style="width: 100px; height: 100px; position: absolute; top: 40%; left: 40%" src="./asset/ajax-loader.gif">
                        </div>
                        <div class="form-container">
                            <h4 class="heading-h4 color-orange">
							Log in to FWD
						</h4>
                            <div class="form-group">
                                <!--使用者名 -->
                                <input type="text" name="userName" class="form-control check-emp login-input placeholder" placeholder="Username" id="headerUserName" onkeypress="return validationUsername(event);">
                                <!-- 忘記使用者名 -->
                                <span id="errUserName" class="empHide color-red heading-h5"></span>
                                <a id="forgotUserName" class="heading-h6">Forgot username?</a>
                            </div>
                            <div class="form-group">
                                <input type="password" name="password" class="form-control check-emp-forgotusername login-input placeholder" placeholder="Password" autocomplete="off" id="headerPassword">
                                <!--忘記密碼 -->
                                <span id="errPass" class="empHide color-red heading-h5"></span>
                                <a id="link-forgotPassword" class="heading-h6">Forgot password?</a>
                            </div>
                            <div class="login-button-group">
                                <button type="button" onclick="submitLoginForm(&#39;loginform-pop&#39;);" class="cta-confirm cta-font cta-orange cta-padding-40">
                                    Log In
                                </button>
                                <div class="login-error-wrapper">
                                    <div id="login-err-msg" class="color-red heading-h5" role="alert"></div>
                                </div>
                            </div>
                            <h6 class="heading-h6 color-gray login-disclaimer">For the purpose of purchasing a specified insurance plan through this website ("the Plan"), I hereby consent to the transfer of my personal data from FWD eServices to the issuer of the Plan.</h6>
                        </div>
                    </div>
                </form>
                <!-- ======================================== 忘記使用者   ============================================================ -->
                <!-- ======================================== 忘記使用者   ============================================================ -->
                <form name="forgotUserNameForm" id="forgotUserNameForm" action="http://localhost:8080/fwdhk/en/savings-insurance/forgotUserNameFields" method="post" commandname="forgotUserName" style="display: none">
                    <div class="login-form">
                        <div style="display: none; position: absolute; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1000" class="login-ajax-loading">
                            <img style="width: 100px; height: 100px; position: absolute; top: 40%; left: 40%" src="./asset/ajax-loader.gif">
                        </div>
                        <div id="success-message" class="alert alert-success empHide" role="alert" style="display: none;">
                            <p id="error1"></p>
                        </div>
                        <div id="login-err-msg" class="alert alert-danger" role="alert" style="display: none;"></div>
                        <div class="form-container">
                            <h4 class="heading-h4 color-orange">
							<!--Message 忘記用戶名稱 -->
							Forgot username
						</h4>
                            <!--電話 text-------->
                            <!-- 電話 inout -->
                            <div class="form-group">
                                <input type="tel" name="mobileNo" class="form-control check-emp-forgotusername login-input placeholder invalid-field" id="mobileNo" placeholder="Mobile no." onkeypress="return isNumeric(event)" onblur="forgotUserName();">
                                <!--  phone erro message -->
                                <span id="errorEmptyMob" class="hide1 empHide" style="display: none;"> <label class="color-red heading-h5">Please enter your Mobile No.</label>


		                        </span>
                                <span id="errorInvalidMob" class="hide1 empHide" style="display: block;"> <label class="color-red heading-h5">Please enter a valid Mobile No.</label>
		                        </span>
                            </div>
                            <!-- -======================================================================- -->
                            <!-- 電郵 text-->
                            <!-- 電郵 input-->
                            <div class="form-group">
                                <input type="email" name="emailAddress" class="form-control check-emp-forgotusername login-input placeholder invalid-field" id="emailAddress" onkeypress="return validationEmail(event);" onblur="forgotUserName();" placeholder="Email address">
                                <!-- 電郵 Errror message -->
                                <span id="errorEmptyEmailId" class="hide1 empHide" style="display: none;"><label class="color-red heading-h5">Please enter your Email.</label></span> <span id="errorInvalidEmailId" class="hide1 empHide" style="display: block;"> <label class="color-red heading-h5">Please enter a valid Email.</label>
		                        </span>
                            </div>
                            <div class="login-button-group forgot-group">
                                <button type="button" onclick="backToLogin()" class="cta-confirm cta-font cta-gray cta-padding-40">
                                    Back
                                </button>
                                <button type="button" onclick="getForgotUserName()" class="cta-confirm cta-font cta-orange cta-padding-40">
                                    Submit
                                </button>
                            </div>
                            <div id="forgotusername-err-msg" class="alert alert-danger" role="alert" style="display: none;">
                                <p id="error-mobile-no"></p>
                                <p id="error-email-id"></p>
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
                            type: 'POST',
                            url: '/fwdhk/forgotUser',
                            data: $('#forgotUserNameForm input').serialize(),
                            success: function(data) {

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
                                } else if (data.indexOf('[') == 0 & data.indexOf(']') > 0) {
                                    $('#success-message').html('');
                                    $('#success-message').hide();
                                    $('#forgotusername-err-msg').html(data.slice(2, data.length - 2));
                                    $('#forgotusername-err-msg').show();
                                } else {
                                    $('#success-message').html('Your Username is ' + data);
                                    $('#success-message').show();
                                }

                            },
                            error: function(xhr, status, error) {
                                $('.login-ajax-loading').hide();
                            }
                        });
                    }
                }
                </script>
                <!-- ===================================================================================================== -->
                <!-- ========================================忘記密碼===================================================== -->
                <!-- ===================================================================================================== -->
                <form name="forgotPasswordForm" id="forgotPasswordForm" action="http://localhost:8080/fwdhk/en/savings-insurance/forgotPassword" method="post" commandname="forgotUserPassword" style="display: none">
                    <div class="login-form">
                        <div style="display: none; position: absolute; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1000" class="login-ajax-loading">
                            <img style="width: 100px; height: 100px; position: absolute; top: 40%; left: 40%" src="./asset/ajax-loader.gif">
                        </div>
                        <div class="form-container">
                            <h4 class="heading-h4 color-orange">
							<!--Message 忘記密碼 -->
							Forgot Password
						</h4>
                            <!-- 電話 inout -->
                            <div class="form-group">
                                <input type="tel" name="mobileNo" class="form-control check-emp-forgotuserpassoword login-input placeholder invalid-field" id="mobileNo-forgotpassowrd" placeholder="Mobile no." onkeypress="return isNumeric(event)" onblur="validForgetUserPassword();">
                                <!--  phone erro message -->
                                <span id="errorEmptyMob-forgotPassword" class="hide1 empHide color-red heading-h5" style="display: none;">
		                            <label class="color-red heading-h5">Please enter your Mobile No.</label>
		                        </span>
                                <span id="errorInvalidMob-forgotPassword" class="hide1 empHide color-red heading-h5" style="display: inline;">
		                            <label class="color-red heading-h5">Please enter a valid Mobile No.</label>
		                        </span>
                            </div>
                            <!-- -======================================================================- -->
                            <!-- 電郵 input-->
                            <div class="form-group">
                                <input type="email" name="emailAddress" class="form-control check-emp-forgotuserpassoword login-input placeholder invalid-field" id="emailAddress-forgotpassowrd" onkeypress="return validationEmail(event);" onblur="validForgetUserPassword();" placeholder="Email address">
                                <!-- 電郵 Errror message -->
                                <span id="errorEmptyEmailId" class="hide1 empHide color-red heading-h5"> <label class="color-red heading-h5">Please enter your Email.</label></span> <span id="errorEmptyEmailId-forgotpassword" class="hide1 empHide color-red heading-h5" style="display: none;"> <label class="color-red heading-h5">Please enter your Email.</label>
		                        </span>
                                <span id="errorInvalidEmailId-forgotpassword" class="hide1 empHide color-red heading-h5" style="display: inline;"> <label class="color-red heading-h5">Please enter a valid Email.</label>
		                        </span>
                            </div>
                            <!-- 使用者input -->
                            <div class="form-group">
                                <input type="text" name="userName" class="form-control check-emp-forgotuserpassoword login-input placeholder" id="userName" placeholder="Username" onkeypress="return validationUsername(event);" onblur="validForgetUserPassword();">
                                <!-- 使用者ERROR -->
                                <span id="errorEmptyUName" class="hide1 empHide color-red heading-h5" style="display: none;"> <label class="color-red heading-h5">Please enter a Username.</label>
		                        </span>
                                <span id="errorInvalidUName" class="hide1 empHide color-red heading-h5" style="display: none;"> <label class="color-red heading-h5">Please enter a valid Username.</label>
		                        </span>
                            </div>
                            <div class="login-button-group forgot-group">
                                <button type="button" onclick="backToLogin()" class="cta-confirm cta-font cta-gray cta-padding-40">
                                    Back
                                </button>
                                <button type="button" onclick="forgotUserPassword()" class="cta-confirm cta-font cta-orange cta-padding-40">
                                    Submit
                                </button>
                            </div>
                            <div id="hide-field"></div>
                            <div id="forgotpassword-err-msg" class="color-red heading-h5" role="alert" style="display: none;">
                                <p id="error1"></p>
                            </div>
                            <div id="success-message-password" class="alert alert-success" role="alert" style="display: none;">
                                <p id="error1"></p>
                            </div>
                            <div id="login-err-msg" class="alert alert-danger" role="alert" style="display: none;"></div>
                        </div>
                    </div>
                </form>
                <div class="login-form-footer">
                    <h5>
                <span class="color-gray heading-h5">New Member?</span>
                <a href="http://localhost:8080/fwdhk/en/joinus" class="color-orange heading-h5">Register here</a>
            </h5>
                </div>
                <script>
                function validForgetUserPassword() {
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
                    } else {

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
                        } else if (userName.length < 6 || userName.length > 50) {
                            $("#errorInvalidUName").show();
                            $("#userName").addClass("invalid-field");
                            valid = false;
                        }
                    }
                    return valid;
                }


                function forgotUserPassword() {



                    if (validForgetUserPassword() == true) {


                        $('.login-ajax-loading').show();
                        $.ajax({
                            type: 'POST',
                            url: '/fwdhk/forgotUserPassword',
                            data: {
                                'emailAddress': $('#emailAddress-forgotpassowrd').val(),
                                'mobileNo': $('#mobileNo-forgotpassowrd').val(),
                                'userName': $('#userName').val()

                            },
                            success: function(data) {

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
                            error: function(xhr, status, error) {
                                $('.login-ajax-loading').hide();
                            }
                        });
                    }
                }
                </script>
            </div>
        </div>
    </div>
    <div id="loading-overlay" class="modal fade bs-loading-modal-lg" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg loading-dialog">
            <div class="modal-content plan-modal loading-modal">
                <img src="./asset/loading.gif" width="300">
            </div>
        </div>
    </div>
    <script>
    function backToLogin() {
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


    $(document).ready(function() {



        $('html').keyup(function(e) {

            var emp = "";
            $(".check-emp").each(function() {
                emp = emp + $(this).val();
            });




            if (emp == "") {

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
            $(".check-emp-forgotusername").each(function() {
                checkEmpForgotuserName = checkEmpForgotuserName + $(this).val();
            });


            if (checkEmpForgotuserName == "") {
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
            $('.check-emp-forgotuserpassoword').each(function() {
                checkEmpForgotuserPassword = checkEmpForgotuserPassword + $(this).val();
                if (checkEmpForgotuserPassword == "") {
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
        $('.login-btn').click(function() {
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


            $('.login-info').addClass('hidden');
            $('#loginpopup .modal-dialog').removeClass('loginpopupext');
        })


        $('#forgotUserName').click(function() {

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


        $('#link-forgotPassword').click(function() {
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
    /* UserLogin ajax function */
    function userLoginFnc() {

        /* var a=validUser(); */
        /*
        if(a==true)
        { */
        $.ajax({
            type: "POST",
            url: "/fwdhk/userLogin",
            data: $("#popUploginform input").serialize(),
            async: false,
            success: function(data) {
                if (data.loginResult == 'success') {
                    window.location.href = window.location.href;
                    //window.location.reload();
                } else if (data.loginResult == 'fail') {
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

    var perventRedirect = false;
    //window.onbeforeunload = function() {
    //	if(perventRedirect){
    //		return "???index.leavePage.desc???";
    //	}
    //}
    </script>
    <!-- FOOTER -->
    <!--mob bottom-->
    <div class="footer-container">
        <div class="upper-footer-wrapper">
            <div class="bottom-contact-wrapper">
                <div class="contact-label">
                    Contact us<i class="fa fa-caret-right" aria-hidden="true"></i>
                    <br>
                    <br> 24-HOUR Hotline
                </div>
                <a class="contact-number" href="tel:31233123">3123 3123</a>
            </div>
            <div class="bottom-link-wrapper">
                <div class="bottom-link">
                    <a href="" target="_blank">PROTECT</a>
                    <a href="" target="_blank">SAVE</a>
                    <a href="" target="_blank">ENJOY</a>
                </div>
                <div class="bottom-link">
                    <a href="" target="_blank">Support &amp; Claims</a>
                    <a href="http://localhost:8080/fwdhk/en/faq">FAQ</a>
                    <a href="http://blog.fwd.com.hk/en_US/" target="_blank">Blog</a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="social-link-wrapper">
                <div class="social-link">
                    <a href="https://www.youtube.com/user/FWDHK" target="_blank"><i class="fa fa-share-alt"></i></a>
                    <a href="https://www.facebook.com/FWD.HK.MO" target="_blank"><i class="fa fa-facebook-official"></i></a>
                    <a href="https://www.youtube.com/user/FWDHK" target="_blank"><i class="fa fa-youtube-play"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="bottom-footer-wrapper">
            <div class="bottom-footer-link">
                <a href="http://www.fwd.com.hk/en-US/home/security.html" target="_blank">Online Security</a> |
                <a href="http://www.fwd.com.hk/en-US/home/disclaimer.html" target="_blank"> Disclaimer </a> |
                <a href="http://www.fwd.com.hk/en-US/home/pdo.html" target="_blank"> Personal Data Protection Policy and Practices</a>
                <div class="copy-right">© 2015 FWD Hong Kong. All rights reserved.</div>
                <div class="clearfix"></div>
            </div>
        </div>
        <div>
        </div>
        <!--/mob bottom-->
        <script type="text/javascript" src="./asset/bootstrap.min.js"></script>
        <script type="text/javascript" src="./asset/html5shiv.js"></script>
        <script type="text/javascript" src="./asset/main.js"></script>
        <script type="text/javascript" src="./asset/wow.min.js"></script>
        <script type="text/javascript" src="./asset/bootstrap-datepicker.min.js"></script>
        <script type="text/javascript" src="./asset/bootstrap-datepicker.zh-TW.js"></script>
        <script type="text/javascript" src="./asset/jasny-bootstrap.min.js"></script>
        <script type="text/javascript" src="./asset/number-spinner.js"></script>
        <script type="text/javascript" src="./asset/jquery.placeholder.min.js"></script>
        <script type="text/javascript" src="./asset/numeral.min.js"></script>
        <script type="text/javascript" src="./asset/jquery.mCustomScrollbar.concat.min.js"></script>
        <script type="text/javascript" src="./asset/jquery.payment.js"></script>
        <script type="text/javascript" src="./asset/custom.js"></script>
        <script type="text/javascript" src="./asset/jquery.timepicker.min.js"></script>
        <script type="text/javascript" src="./asset/jquery.placeholder.min.js"></script>
        <!--<script type="text/javascript" src="./asset/savie-online.js"></script>-->
        <script type="text/javascript" src="./asset/bootstrapValidator.min.js"></script>
        <script src="./asset/jSignature.min.js"></script>
        <!--<script type="text/javascript" src="./asset/bootstrap-slider.js"></script>-->
        <script src="./asset/material.min.js"></script>
        <script src="./asset/pnotify.custom.min.js"></script>
        <script type="text/javascript" src="./asset/custom(1).js"></script>
        <!--<script type="text/javascript" src="./asset/bootstrap-slider.js"></script>-->
    </div>
    
    
    </body>

</html>
