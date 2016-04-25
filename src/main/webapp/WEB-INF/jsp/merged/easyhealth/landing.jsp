<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="enhance" uri="http://pukkaone.github.com/jsp" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
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
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/animate.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font-awesome.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/material.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/responsive.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jasny-bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/datepicker.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.mCustomScrollbar.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/icomoon.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap-slider.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.jscrollpane.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/styles.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/savie-styles.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/datepicker3.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/jquery.timepicker.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/pnotify.custom.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/savie-regular-styles.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/easy-health/landing.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/ZeroClipboard.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.i18n.properties-min-1.0.9.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/custom.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.timepicker.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-ui.min.js"></script>
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
<script type="text/javascript">
    var context = "${pageContext.request.contextPath}";
    </script>
<div class="fwd-savie-wrapper">
    <link rel="icon" type="image/x-icon" href="http://localhost:8080/fwdhk/resources/images/favicon.ico">
    </head>
    <!-- <a href="javascript:void(0)" id="testajax" >Press</a> -->
    <body>
<div class="fwd-savie-wrapper">
    <script src="<%=request.getContextPath()%>/resources/js/jquery.i18n.properties-min-1.0.9.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/jquery.countdown.min.js"></script>
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
    <script>
        $(document).ready(function() {
            if(isMobile) {

                $(".annualTravel_policy_item").click(function(){
                    alert(1);
                    itemTop = $(this).offset();
                    var html=$(this).children('.hidden-benefits').children().clone();
                    $("#modal_policy_container").html(html);
                    $("#policyCoveragePopup").modal("show");
                    $("#policyCoveragePopup").on('show.bs.modal', function () {
                        $('body').css("position", "inital");
                        $('.hidden-benefits-info').css("font-family", "Calibri");
                        $('.hidden-benefits-info').css("font-size", "14px");
                        $('body').animate({scrollTop: itemTop.top - 60}, 0);      
                    });
                    $("#policyCoveragePopup").on('hide.bs.modal', function () {
                        //alert(itemTop.top);
                        $('body').css("position", "initial");
                        $('body').animate({scrollTop: itemTop.top - 60}, 0);
                        //$('body').css("position", "relative");
                    });
                    $("#policyCoveragePopup").on('hidden.bs.modal', function () {
                        $('body').attr("style", "");
                    });         
                });

                $('#btn-blog-link').click(function(){
                        window.location.href='http://blog.fwd.com.hk/en/';
                });
            }
        });


    </script>
    
    <div class="fwd-savie-wrapper ">
        <div class="fwd-container container-fluid breadcrumbs savie-regular-pay-breadcrumbs">
                <div class="breadcrumb-container">
                    <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
                      <li><a href="#">Home</a></li>
                      <li class="divider"><i class="fa fa-angle-right"></i></li>
                      <li><a href="#">Protect </a></li>
                      <li class="divider"><i class="fa fa-angle-right"></i></li>
                      <li class="active-bc" id="et-active-bc-menu">EasyHealth Refundable Hospital Income Plan</li>
                     </ol>
                </div>
            </div>
    </div>
    <div class="savie-regular-container savie-regular-landing rp-only">
        <div class="whole-banner">
            <div class="page-banner">
                <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-bg-mobile.jpg" class="img-responsive hidden-md hidden-lg">
                <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-bg-desktop.jpg" class="img-responsive hidden-xs hidden-sm">
                <div class="fwd-container-limit">
                
                <form id="o2o-landing-form" action="<%=request.getContextPath()%>/${language}/${nextPageFlow}" method="post">
                    <div class="img-banner-text savie-landing">
                        <div id="clearfix-height-rp">
                            <button id="op-buy-now-O2O-mobile" class="savie-regular-btn start-btn">Quote Now</button>
                        </div>                      
                    <div class="savie-product text-bold">
                        <a href="/resources/brochure-pdf/savie_brochure_rp.pdf" target="_blank">Product brochure</a> | <a href="/resources/policy-provisions-pdf/Savie_En_Provisions.pdf" target="_blank">Product provisions</a>
                    </div>
                    </div>
                </form>
                </div>
            </div>
        </div>
                        
        <div class="payment-mode">
           
            <p class="availability-notice text-center"><strong>EasyHealth Refundable Hospital Income Plan</strong> (“the Plan”, “EasyHealth”) provides you Hospital Cash Benefit, regardless of the actual hospital expenses, for 15 years with 10 years of payment only, in addition, you will enjoy refund of 102% of actual total premium paid at maturity (i.e. end of the 15th policy year) regardless of any claims made during the protection period. Even if you surrender the policy before the maturity, you can still get back a percentage of actual premium paid starting at the 6th policy year.<span></span>
            </p>

            <!-- <h5 class="hidden-sm hidden-xs product-options text-center">
                <a href="#">Product brochure</a> | <a href="#">Product provisions</a>
            </h5> -->
        </div>
        
        <div class="fwd-container-limit">
                <div class="usp row">
                    <div class="usp-item clearfix col-xs-12 col-md-4">
                        <h5 class="hidden-xs hidden-sm">Cash Benefit</h5>
                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-usp-flexible.png" class="">
                        <div class="item-desc">
                            <h5 class="hidden-md hidden-lg">Cash Benefit</h5>
                            <p>You will receive a cash benefit from HK$300 to HK$1,200 per day (depend on your selected plan) when hospitalised for not less than 6 consecutive hours. You have the flexibility to use the money to suit your needs, such as paying for your medical or non-medical expenses or protecting against any loss of income.</p>
                        </div>
                    </div>
                    <div class="usp-item clearfix col-xs-12 col-md-4">
                        <h5 class="hidden-xs hidden-sm">HK$12 per day</h5>
                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-usp-protection.png" class="">
                        <div class="item-desc">
                            <h5 class="hidden-md hidden-lg">HK$12 per day</h5>
                            <p class="padded">Affordable premium for unexpected hospitalization to provide daily hospital cash. Enjoy as low as HK$12/day to get additional coverage on top of your existing medical plan. EasyHealth offers 4 benefit levels to cater your needs.</p>
                        </div>
                    </div>
                    <div class="usp-item clearfix col-xs-12 col-md-4">
                        <h5 class="hidden-xs hidden-sm">Return of Premium</h5>
                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-usp-save.png" class="">
                        <div class="item-desc">
                            <h5 class="hidden-md hidden-lg">Return of Premium</h5>
                            <p class="padded">You will enjoy refund of 102% of actual total premium paid at maturity (i.e. end of the 15th policy year) regardless of any claims made during the protection period.  Even if you surrender the policy before the maturity, you can still get back a percentage of actual premium paid starting the 6<sup>th</sup> policy year.</p>
                        </div>
                    </div>
                </div>
            </div>
 
            <div class="regular-benefit">
                    <div class="hidden-xs hidden-sm">
                <h3 class="benefits-desktop text-center">Benefits</h3>
                <div class="gray-divide"></div>
            </div>
                <div class="hidden-md hidden-lg">
                    <h4 class="text-center">Benefits</h4>
                    <div class="gray-divide"></div>
                </div>
                <div class="fwd-container-limit">
                    <div class="benefits-holder">
                        <div class="hidden-md hidden-lg">
                            <div class="row">
                                <!-- <div class="col-xs-6 text-center annualTravel_policy_item">
                                    <img src="/resources/images/savie-regular/benefit-1.png">
                                    <span>???product.details.savie.group1.section1.title.ocean???</span>
                                    <div class="hidden-benefits benefits-content">
                                        <img src="/resources/images/savie-regular/benefit-1.png" />
                                        <div class="info hidden-benefits-info">
                                            <h3 class="hidden-benefits-info">Benefits</h3>
                                            <p class="hidden-benefits-info">Ocean Park SmartFun Gold and Silver pass members now enjoy premium discount of HK$960 (gold) and HK$740 (silver), respectively upon a successfully application of Savie Insurance Plan with lump sum payment not less than HK$100,000.  </p>
                                        </div>
                                    </div>
                                </div>-->
                                <div class="col-xs-6 text-center annualTravel_policy_item">
                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-benefit-2.png">
                                    <span class="two-lines">Additional Intensive Care Unit and Infectious Disease benefits</span>
                                    <div class="hidden-benefits benefits-content">
                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-benefit-2.png" />
                                        <div class="info hidden-benefits-info">
                                            <h3 class="hidden-benefits-info">Additional Intensive Care Unit and Infectious Disease benefits</h3>
                                            <p class="hidden-benefits-info">If you are admitted to the intensive care unit during a quarantine, an additional benefit will be payable (up to HK$1,200 per day) up to 90 days per disability. Further, an additional Infectious Disease Benefit will be payable (up to HK$1,200 per day) up to 30 days per disability.</p>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-xs-6 text-center annualTravel_policy_item">
                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-benefit-4.png">
                                    <span>Claim Ambassador</span>
                                    <div class="hidden-benefits benefits-content">
                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-benefit-4.png" />
                                        <div class="info hidden-benefits-info">
                                            <h3 class="hidden-benefits-info">Claim Ambassador</h3>
                                            <p class="hidden-benefits-info">When you are hospitalised or requires assistance during the claim process, a claim ambassador will be present to help make the claim for the insured.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-6 text-center annualTravel_policy_item">
                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-benefit-6.png">
                                    <span>Life protection</span>
                                    <div class="hidden-benefits benefits-content">
                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-benefit-6.png" />
                                        <div class="info">
                                            <h3 class="hidden-benefits-info">Life protection</h3>
                                            <p class="hidden-benefits-info">The Plan will offer a life protection of 150% of Total Annualised Premium to ease your family needs at the unfortunate event of death of the insured person.  There will be an additional accidental death benefit of 50% of Total Annualised Premium if the death is caused by an accident.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-6 text-center annualTravel_policy_item">
                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-benefit-6.png">
                                    <span>Easy Online Purchase</span>
                                    <div class="hidden-benefits benefits-content">
                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-benefit-6.png" />
                                        <div class="info">
                                            <h3 class="hidden-benefits-info">Easy Online Purchase</h3>
                                            <p class="hidden-benefits-info">Simplified underwriting process enables you to complete the entire application process online. You may also visit our Customer Service Centers for more comprehensive coverage.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="hidden-xs hidden-sm">
                            <div class="" id="benefits-nav-holder">
                                <ul class="nav nav-tabs row so-fna-row" role="tablist">
                                    <!-- <li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li active" id="benefits-nav-title-1">
                                        <a href="#benefits-navtabs-1" role="tab" data-toggle="tab" class="navtabs-title first-fna ui-link text-center">Benefits </a>
                                    </li>-->
                                    <li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li active" id="benefits-nav-title-6">
                                        <a href="#benefits-navtabs-1" role="tab" data-toggle="tab" class="navtabs-title last-fna ui-link text-center">Additional Intensive Care Unit and Infectious Disease benefits</a>
                                    </li>                                   
                                    <li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li" id="benefits-nav-title-2">
                                        <a href="#benefits-navtabs-2" role="tab" data-toggle="tab" class="navtabs-title ui-link text-center">Claim Ambassador</a>
                                    </li>
                                    <li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li" id="benefits-nav-title-3">
                                        <a href="#benefits-navtabs-3" role="tab" data-toggle="tab" class="navtabs-title ui-link text-center">Life protection</span></a>
                                    </li>
                                    <li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li last" id="benefits-nav-title-4">
                                        <a href="#benefits-navtabs-4" role="tab" data-toggle="tab" class="navtabs-title last-fna ui-link text-center">Easy Online Purchase</a>
                                    </li>
                                    <!-- <li role="presentation" class="col-lg-2 col-md-2 col-sm-2 col-xs-2 navtabs-li last" id="benefits-nav-title-5">
                                        <a href="#benefits-navtabs-5" role="tab" data-toggle="tab" class="navtabs-title last-fna ui-link text-center">24 hours <span>service hotline</span></a>
                                    </li>-->
                                </ul>
                                <div class="fna-carousel carousel slide" id="benefits-carousel" data-ride="carousel" data-interval="false">
                                    <div class="tab-content carousel-inner clearfix" role="listbox">
                                                <!--  <div role="tabpanel" class="fna-tab-content tab-pane item active" id="benefits-navtabs-1">
                                                    <div class="benefits-content clearfix">
                                                        <img src="/resources/images/savie-regular/new-benefit-1.png">
                                                        <div class="info">
                                                            <h3>???product.details.savie.group1.section1.title.ocean???</h3>
                                                            <p>Ocean Park SmartFun Gold and Silver pass members now enjoy premium discount of HK$960 (gold) and HK$740 (silver), respectively upon a successfully application of Savie Insurance Plan with lump sum payment not less than HK$100,000.  </p>
                                                        </div>
                                                    </div>
                                                </div>-->
                                                <div role="tabpanel" class="fna-tab-content tab-pane item active" id="benefits-navtabs-1">
                                                    <div class="benefits-content clearfix">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-benefit-2.png">
                                                        <div class="info">
                                                            <h3>Additional Intensive Care Unit and Infectious Disease benefits </h3>
                                                            <p>If you are admitted to the intensive care unit during a quarantine, an additional benefit will be payable (up to HK$1,200 per day) up to 90 days per disability. Further, an additional Infectious Disease Benefit will be payable (up to HK$1,200 per day) up to 30 days per disability.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--  <div role="tabpanel" class="fna-tab-content tab-pane item" id="benefits-navtabs-3">
                                                    <div class="benefits-content clearfix">
                                                        <img src="/resources/images/savie-regular/benefit-3.png">
                                                        <div class="info">
                                                            <h3>Earning after 3 years</h3>
                                                            <p>Savie while you play!  </p>
                                                        </div>
                                                    </div>
                                                </div> -->
                                                <div role="tabpanel" class="fna-tab-content tab-pane item" id="benefits-navtabs-2">
                                                    <div class="benefits-content clearfix">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-benefit-4.png">
                                                        <div class="info">
                                                            <h3>Claim Ambassador</h3>
                                                            <p>When you are hospitalised or requires assistance during the claim process, a claim ambassador will be present to help make the claim for the insured.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- <div role="tabpanel" class="fna-tab-content tab-pane item" id="benefits-navtabs-5">
                                                    <div class="benefits-content clearfix">
                                                        <img src="/resources/images/savie-regular/benefit-5.png">
                                                        <div class="info">
                                                            <h3>Payment options</h3>
                                                            <p>Savie while you play!  </p>
                                                        </div>
                                                    </div>
                                                </div> -->
                                                <div role="tabpanel" class="fna-tab-content tab-pane item" id="benefits-navtabs-3">
                                                    <div class="benefits-content clearfix">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-benefit-6.png">
                                                        <div class="info">
                                                            <h3>Life protection</h3>
                                                            <p>The Plan will offer a life protection of 150% of Total Annualised Premium to ease your family needs at the unfortunate event of death of the insured person.  There will be an additional accidental death benefit of 50% of Total Annualised Premium if the death is caused by an accident.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div role="tabpanel" class="fna-tab-content tab-pane item" id="benefits-navtabs-4">
                                                    <div class="benefits-content clearfix">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-benefit-6.png">
                                                        <div class="info">
                                                            <h3>Easy Online Purchase</h3>
                                                            <p>Simplified underwriting process enables you to complete the entire application process online. You may also visit our Customer Service Centers for more comprehensive coverage.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                    <!-- Carousel 
                                    <a class="left carousel-control hidden-lg hidden-md ui-link" href="#so-carousel" role="button" data-slide="prev">
                                    </a>
                                    <a class="right carousel-control hidden-lg hidden-md ui-link" href="#so-carousel" role="button" data-slide="next">
                                    </a>
                                    -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="fna-icons-body text-center clearfix">
                <div class="fwd-container-limit" id="nav-holder">
                    <ul class="nav nav-tabs row so-fna-row visible-xs visible-sm" role="tablist">
                        <li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li active" id="nav-title-1">
                            <a href="#navtabs-1" role="tab" data-toggle="tab" class="navtabs-title first-fna ui-link">Here when you need us</a>
                        </li>
                        <li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li" id="nav-title-2">
                            <a href="#navtabs-2" role="tab" data-toggle="tab" class="navtabs-title ui-link">Come visit us</a>
                        </li>
                        <li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li" id="nav-title-3">
                            <a href="#navtabs-3" role="tab" data-toggle="tab" class="navtabs-title ui-link">Make claims easy</a>
                        </li>
                        <li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li last" id="nav-title-4">
                            <a href="#navtabs-4" role="tab" data-toggle="tab" class="navtabs-title last-fna ui-link">eService app available</a>
                        </li>
                    </ul>
                    <div class="fna-carousel carousel slide" id="so-carousel" data-ride="carousel" data-interval="false">
                        <div class="tab-content carousel-inner clearfix" role="listbox">
                            <div role="tabpanel" class="fna-tab-content tab-pane item active" id="navtabs-1" next-target="nav-title-2">
                                <div class="so-fna-content">
                                    <div class="fna-icon-circle">
                                        <img src="<%=request.getContextPath()%>/resources/images/savie-regular/fna-1.png">
                                    </div>
                                    <h3 class="visible-md visible-lg  tab-head">Here when you need us</h3>
                                     <p>Our 24/7 Live Chat and Customer Hotline 3123 3123 are ready to assist you anytime you need us! <!--<a href="#" class="eserv-link ui-link">eServices</a>--></p>
                                </div>
                            </div>
                            <div role="tabpanel" class="fna-tab-content tab-pane item" id="navtabs-2" next-target="nav-title-3">
                                <div class="so-fna-content">
                                    <div class="fna-icon-circle">
                                        <img src="<%=request.getContextPath()%>/resources/images/savie-regular/fna-2.png">
                                    </div>
                                    <h3 class="visible-md visible-lg tab-head">Come visit us</h3>
                                    <p> 6 Customer Service Centres across Hong Kong, Kowloon and New Territories, to provide efficient, personalised and quality service for you.</p>
                                </div>
                            </div>
                            <div role="tabpanel" class="fna-tab-content tab-pane item" id="navtabs-3" next-target="nav-title-4">
                                <div class="so-fna-content">
                                    <div class="fna-icon-circle">
                                        <img src="<%=request.getContextPath()%>/resources/images/savie-regular/fna-3.png">
                                    </div>
                                    <h3 class="visible-md visible-lg tab-head">Make claims easy</h3>
                                    <p>We have developed a simple and quick process to make it easier for you to make a claim. <a href="http://www.fwd.com.hk/en/support-claims/" class="eserv-link ui-link" target="_blank">Click here</a> to learn more</p>
                                </div>
                            </div>
                            <div role="tabpanel" class="fna-tab-content tab-pane item" id="navtabs-4" next-target="nav-title-1">
                                <div class="so-fna-content">
                                    <div class="fna-icon-circle">
                                        <img src="<%=request.getContextPath()%>/resources/images/savie-regular/fna-4.png">
                                    </div>
                                    <h3 class="visible-md visible-lg  tab-head">eService app available</h3>
                                    <p>Download our <a href="http://www.fwd.com.hk/en/support-claims/eservices-app/" class="eserv-link ui-link" target="_blank">eServices App</a> and get the support you need, when you need it.</p>
                                </div>
                            </div>
                        </div>
                        <!-- Carousel -->
                        <a class="left carousel-control hidden-lg hidden-md ui-link" href="#so-carousel" role="button" data-slide="prev">
                        </a>
                        <a class="right carousel-control hidden-lg hidden-md ui-link" href="#so-carousel" role="button" data-slide="next">
                        </a>
                    </div>
                </div>
            </div>
        
        <!-- OUR BLOG -->
        <div class="blog">
                <div class="hidden-md hidden-lg">
                    <div class="mini-banner-holder">
                        <img src="<%=request.getContextPath()%>/resources/images/savie-regular/read-our-blog.jpg" class="img-responsive">
                        <div class="black-overlay"></div>
                        <h5 class="text-center">Save before you spend</h5>
                    </div>
                    <div class="btn-holder">
                        <button id="btn-blog-link" class="savie-regular-btn">Read More from our blog</button>
                    </div>
                </div>
                <div class="hidden-xs hidden-sm">
                        <h3 class="text-center">Read more from our blog</h3>
                        <div class="gray-divide"></div>
                        <p class="definition text-center">Why not check out our savings tips?</p>
    
                        <div class="blogs-holder clearfix fwd-container-limit">
                            <div class="blogs first">
                                <img src="<%=request.getContextPath()%>/resources/images/savie-regular/blog-1.jpg" class="img-responsive">
                                <div class="orange-overlay text-center">
                                    <p class="title">Efficient and affordable lessons for babies</p>
                                    <span>SAVE</span>
                                    <p class="definition"></p>
                                    <a class="btn-read-now" href="http://blog.fwd.com.hk/en/2016/01/25/efficient-and-affordable-lessons-for-babie/" target="_blank">Read now</a>
                                </div>
                            </div>
                            <div class="blogs">
                                <img src="<%=request.getContextPath()%>/resources/images/savie-regular/blog-2.jpg" class="img-responsive">
                                <div class="orange-overlay text-center">
                                    <p class="title">Do holidays have to be savings traps?</p>
                                    <span>SAVE</span>
                                    <p class="definition"></p>
                                    <a class="btn-read-now" href="http://blog.fwd.com.hk/en/2015/12/30/do-holidays-have-to-be-saving-traps-2/" target="_blank">Read now</a>
                                </div>
                            </div>
                            <div class="blogs">
                                <img src="<%=request.getContextPath()%>/resources/images/savie-regular/blog-3.jpg" class="img-responsive">
                                <div class="orange-overlay text-center">
                                    <p class="title">Busting myths of savings traps</p>
                                    <span>SAVE</span>
                                    <p class="definition"></p>
                                    <a class="btn-read-now" href="http://blog.fwd.com.hk/en/2015/12/17/busting-the-myths-of-saving-traps-2/" target="_blank">Read now</a>
                                </div>
                            </div>
                            <div class="blogs last">
                                <img src="<%=request.getContextPath()%>/resources/images/savie-regular/blog-4.jpg" class="img-responsive">
                                <div class="orange-overlay text-center">
                                    <p class="title">That’s right! Coupons do save you BIG bucks!</p>
                                    <span>SAVE</span>
                                    <p class="definition"></p>
                                    <a class="btn-read-now" href="http://blog.fwd.com.hk/en/2015/12/09/thats-right-coupons-do-save-you-big-bucks-2/" target="_blank">Read now</a>
                                </div>
                            </div>
                        </div>
    
                        <div class="fwd-container-limit">
                            <p class="blog-notice">The information provided in the blogs is for reference only. While FWD Life Insurance Company (Bermuda) Limited and its affiliates ("FWD") use all reasonable efforts to ensure the information is accurate, FWD makes no warranties or representations as to the accuracy or completeness of any of the information and assumes no liability for any errors or omissions thereof. FWD shall not be liable for any direct, incidental, consequential, indirect or punitive damages arising out of access to, use of or inability to use the information, or any errors or omissions in the content of this material. Users should carefully evaluate the information.</p>
                        </div>
                    </div>
            </div>
            
            <a href="#" id="gotop-rp" class="go-top go-top-default rp"><img src="<%=request.getContextPath()%>/resources/images/savie-regular/to-top.jpg"></a>
        
        <!-- Customer Center Modal -->
        <div class="modal fade" role="dialog" aria-labelledby="customerCenter" id="customerCenter">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2>Getting started is easy.<br>Just follow these simple steps to <br>complete your Savie applicaton.</h2>
                    </div>
                    <div class="modal-body">
                        <img src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/infographic-steps.jpg" />
                    </div>
                    <div class="modal-footer">
                        <div class="top-section">
                            <h2>Congratulations!</h2>
                            <h4>Your application is complete.</h4>
                            <p>Can't make it for your appointment? Call us at 3123 3123 for a reschedule.</p>
                        </div>
                        
                        <div class="bottom-section">
                            <button type="button" class="btn" data-dismiss="modal">Continue</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>

</div>
    <!-- -->

<div class="modal fade bs-example-modal-lg  in" id="policyCoveragePopup" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content plan-modal">
        <div class="modal-body">
            <a class="close" aria-label="Close" data-dismiss="modal"><span aria-hidden="true" style="font-size:30px;">×</span></a>
            <div id="modal_policy_container" style="padding-top: 10px;text-align: center;">
            </div>
      </div>
    </div>
  </div>
</div>

                
              

    <!-- -->
    <div id="myModal" class="mob-login-form-wrapper modal fade" role="dialog">
        <div style="display: none; position: fixed; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 2001" class="login-ajax-loading">
            <img style="width: 100px; height: 100px; position: absolute; top: 50%; left: 50%; margin-top: -50px; margin-left: -50px;" src="<%=request.getContextPath()%>/resources/images/ajax-loader.gif">
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
                    <img src="<%=request.getContextPath()%>/resources/images/safari_background.png">
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
                    <img src="<%=request.getContextPath()%>/resources/images/login/savie-bg-overlay.png" alt="Saive" class="hidden-xs hidden-sm img-responsive">
                    <img src="<%=request.getContextPath()%>/resources/images/login/savie-bg-mobile-overlay.png" alt="Saive" class="hidden-lg hidden-md img-responsive">
                </div>
                <div class="login-title-wrapper">
                    <h4 class="color-darkgray heading-h4">Log In</h4></div>
                <form name="loginform" id="loginform-pop">
                    <div class="login-form">
                        <div style="display: none; position: absolute; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1000" class="login-ajax-loading">
                            <img style="width: 100px; height: 100px; position: absolute; top: 40%; left: 40%" src="<%=request.getContextPath()%>/resources/images/ajax-loader.gif">
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
                            <img style="width: 100px; height: 100px; position: absolute; top: 40%; left: 40%" src="<%=request.getContextPath()%>/resources/images/ajax-loader.gif">
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
                            <img style="width: 100px; height: 100px; position: absolute; top: 40%; left: 40%" src="<%=request.getContextPath()%>/resources/images/ajax-loader.gif">
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
                <img src="<%=request.getContextPath()%>/resources/images/loading.gif" width="300">
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
        <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/html5shiv.js"></script>
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

<!-- <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/custom.js"></script> -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.timepicker.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.placeholder.min.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/savie-2016/savie-online.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bootstrapValidator.min.js"></script>

        <!--<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bootstrap-slider.js"></script>-->
    </div>
    <style>
    .table>thead:first-child>tr:first-child>th:first-child {
        position: absolute;
        display: inline-block;
        background-color: red;
        height: 100%;
    }

    .table> tbody > tr > td:first-child {
        position: absolute;
        display: inline-block;
        background-color: red;
        height: 100%;
    }

    .table>thead:first-child>tr:first-child>th:nth-child(2) {
        padding-left: 40px;
    }

    .table> tbody > tr > td:nth-child(2) {
        padding-left: 50px !important;
    }
    </style>
    </body>

</html>
