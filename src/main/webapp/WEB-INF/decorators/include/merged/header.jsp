<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ifwd.fwdhk.model.UserDetails"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<c:set var="language"
	value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}"
	scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<link rel="icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/resources/images/favicon.ico" />
<!-- <a href="javascript:void(0)" id="testajax" >Press</a> -->

<!-- header.notification.bar -->

<%
	/* Temporarily set the msg before controller return the message */

	java.text.SimpleDateFormat cformat = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	long currentDate = System.currentTimeMillis();
    long msgEndDate = cformat.parse("2016-09-16 09:00:00").getTime();

	String notificationMsg = "";
    if (currentDate <= msgEndDate) {
    	if (session.getAttribute("uiLocale").equals("zh-HK")) {
        	notificationMsg = java.util.ResourceBundle.getBundle("messages", new java.util.Locale("zh","HK")).getString("header.notification.msg.repair");
    	} else {
        	notificationMsg = java.util.ResourceBundle.getBundle("messages", new java.util.Locale("en","US")).getString("header.notification.msg.repair");
    	}
    }
	boolean showNotification = (notificationMsg.equals(""))?false:true;
%>

<script type="text/javascript">
	var obj = {
	    'topBar': {
			'mobileDefaultHeight': 0,
	        'desktopDefaultHeight': 42,
	        'classname': {
	            'mobile': 'div.commonBody',
	            'desktop': 'nav.navbar.navbar-inverse'
	        }
	    },
	    'nBarOnly': {
	        'mobile': 0,
	        'desktop': 56,
	        'classname': {
	            'mobile': '.header-notification-box.header-notification-box--mobile',
	            'desktop': '.header-notification-box.header-notification-box--desktop'
	        },
	        'content': {
			    'ifwd_repair': {
			        'mobile': '<%=notificationMsg%>',
			        'desktop': '<%=notificationMsg%>'
			    },
				'fraud' : {
			        'mobile': '<fmt:message key="header.notification.msg.fraud" bundle="${msg}" />',
			        'desktop': '<fmt:message key="header.notification.msg.fraud" bundle="${msg}" />'
			    },
			    'flightcare_moncare': {
			        'mobile': '<%=notificationMsg%>',
			        'desktop': '<%=notificationMsg%>'
			    },
			    'ios_chrome': {
			        'mobile': '<fmt:message key="header.notification.msg.ios" bundle="${msg}" />',
			        'desktop': '<fmt:message key="header.notification.msg.ios" bundle="${msg}" />'
			    },
			    'maintenance': {
			        'mobile': '<s:message code="label.header.maintenance.message"/>',
			        'desktop': '<s:message code="label.header.maintenance.message"/>'
			    }
			}
	    }
	};

// Default value
var isChromeIOS = navigator.userAgent.match('CriOS') ? true : false;
var contentIndexArr = [];

<% if(request.getRequestURI().indexOf("/travel-insurance")>0) { %>

var nBarConfig = {
	'contentIndex': contentIndexArr,
	'isVisible': ( <%=showNotification%> == false ) ? false : true
}

<% } else { %>

if ( isChromeIOS ) { contentIndexArr.push('ios_chrome'); }
var nBarConfig = {
	'contentIndex': contentIndexArr,
	'isVisible': ( <%=showNotification%> == false && isChromeIOS == false ) ? false : true
}

<% } %>

var isMaintenance = obj.nBarOnly.content.maintenance.desktop != 'deployed';

if (isMaintenance) {
	contentIndexArr.push('maintenance');
}

var nBarConfig = {
	'contentIndex': contentIndexArr,
	'isVisible': isMaintenance
}

</script>

<%-- if(request.getRequestURI().indexOf("/flight-insurance")>0) { %>
<!-- customized behaviour for flight insurance landing page only -->
<script src="<%=request.getContextPath()%>/resources/js/header.notification.bar.custom.flight.js" charset="utf-8"></script>
<% } --%>

<!-- <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/header.notification.bar.css" media="screen" title="no title" charset="utf-8"> -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css_dir/header.notification.bar.css" media="screen" title="no title" charset="utf-8">
<script src="<%=request.getContextPath()%>/resources/js/header.notification.bar.js" charset="utf-8"></script>
<!-- ./header.notification.bar -->

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


var home_url = "<%=request.getContextPath()%>";

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

function putPremium(){
    var pro = $(".text-center.btn-plan-selector.selected").attr("data-tab");
	var isNavbarLogin = ($('#loginpopup #nav-bar-check').val()=='true')?true:false;
    if(pro != null && !isNavbarLogin){

    	$.ajax({
            type : "post",
            cache:false,
            async:false,
            url : '${pageContext.request.contextPath}/ajax/medical-insurance/putPremium',
            data : {pro : pro},
            success : function(data) {
               window.location = '<%=request.getContextPath()%>/${language}/${nextPageFlow}';
            },
            error:function(){
                console.log('error');
            }
      });
    }
    else{
    	refreshPage();
    }
}

function refreshPage(){
	//Most browsers do not refresh link with hash if not using reload function.
	//However, browsers do refresh if the URL is different.

	var cleanURL = window.location.href.replace(/\?r=\d*/,''); //remove random parameter;
	window.location.href = cleanURL.split('#')[0] + '?r=' + new Date().getTime();
}
function switchLoginWdiget(loginStatus){
	//console.log(loginStatus);
	$(".js-not-logged-in").remove();
	$(".js-logged-in").removeClass("hidden");
	$("#loginpopup").modal("hide");
	$(".js-myDropdown__userName").append(loginStatus.fullName);
<%--    $.ajax({
		type : "GET",
		url : "<%=request.getContextPath()%>/api/member/session",
		async : false,
		success : function(data) {
			console.log(data);
		}
	}); --%>
}
function submitLoginForm(formID) {
	console.log("submitLoginForm");
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
				url : "<%=request.getContextPath()%>/userLogin",
				data : $("#"+formID).serialize(),//$("#headerLoginForm form").serialize(),
				async : false,
				success : function(data) {
					if (data.loginResult == 'success') {
                    	//console.log(data);
                    	switchLoginWdiget(data);
						//$('.login-ajax-loading').hide();
						//var Backlen = history.length;
						//history.go(-Backlen);
						if(((window.location.href.length - window.location.href.indexOf("tc") <= 3)
								|| (window.location.href.length - window.location.href.indexOf("en") <= 3)
								|| (window.location.href.length - window.location.href.indexOf("home") <= 4))
								&& $('#loginpopup #nav-bar-check').val() == 'false'){
							getStarted();
							$("#fullName").html(data.fullName);
							$("#fullName1").html(data.fullName);
						} else if(window.location.href.indexOf("savings-insurance/plan-details-")>0){
							// && $('#loginpopup #nav-bar-check').val() == 'false'
							$("#fullName").html(data.fullName);
							$("#fullNames").html(data.fullName);
							$("#fullName1").html(data.fullName);
							saviePlanDetailsGoNext();
						}
						else if(window.location.href.indexOf("medical-insurance/plan-option")>0){
							$('#loginpopup').modal('hide');
							$.ajax({
							    url:'${pageContext.request.contextPath}/ajax/savings-insurance/getPurchaseHistoryByPlanCode',
							    type:'get',
							    cache:false,
							    async:false,
							    data:{
					    	    	"planCode" : "HEH1"
					       		},
							    error:function(){
							    },
							    success:function(data){
							    	if(data != null && data.errMsgs == null && data.policies !=null && data.policies.length > 0){
								    	$('#loginpopup').modal('hide');
							    		$('#prev-savie-app-modal').modal({backdrop: 'static', keyboard: false});
							    		$('#prev-savie-app-modal').modal('show');
							    	}else{
							    		$.ajax({
										    url:'${pageContext.request.contextPath}/ajax/savings-insurance/getPurchaseHistoryByPlanCode',
										    type:'get',
										    cache:false,
										    async:false,
										    data:{
								    	    	"planCode" : "HEH2"
								       		},
										    error:function(){
										    },
										    success:function(data){
										    	if(data != null && data.errMsgs == null && data.policies !=null && data.policies.length > 0){
											    	$('#loginpopup').modal('hide');
										    		$('#prev-savie-app-modal').modal({backdrop: 'static', keyboard: false});
										    		$('#prev-savie-app-modal').modal('show');
										    	}else{
										    		$.ajax({
													    url:'${pageContext.request.contextPath}/ajax/savings-insurance/getPurchaseHistoryByPlanCode',
													    type:'get',
													    cache:false,
													    async:false,
													    data:{
											    	    	"planCode" : "HEH3"
											       		},
													    error:function(){
													    },
													    success:function(data){
													    	if(data != null && data.errMsgs == null && data.policies !=null && data.policies.length > 0){
														    	$('#loginpopup').modal('hide');
													    		$('#prev-savie-app-modal').modal({backdrop: 'static', keyboard: false});
													    		$('#prev-savie-app-modal').modal('show');
													    	}else{
													    		putPremium();
													    	}
													    }
													});
										    	}
										    }
										});
							    	}
							    }
							});
						}
						else if(window.location.href.indexOf("term-life-insurance/select-plan")>0){
							perventRedirect=false;
							ga('send', 'event', 'Login', 'Click', 'Login success');
							window.location.href= "<%=request.getContextPath()%>/${language}/term-life-insurance/select-plan?goApp="+$('#goApp').val();
						}
						else {
							perventRedirect=false;
												ga('send', 'event', 'Login',
														'Click',
														'Login success');
												//location.reload();
												// window.location.href = window.location.href;
												window.location.href = window.location.href.substr(0, window.location.href.indexOf('#'));
											}
					} else if (data.loginResult == 'Provided User Account Details Does Not Exist') {
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
					} else if (data.loginResult == 'Please provide a valid User Name and Password.') {
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
					} else if (data.loginResult == 'Link Sent Successfully On Your Registered Mail ID') {
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
					} else if (data.loginResult == 'Internet Connection Error') {
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
					} else if (data.loginResult == 'Invaild Username or password. Please try again.') {
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
					} else if (data.loginResult == 'Invaild Username or password. Next invalid attempt will block your account.') {
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
					} else if (data.loginResult == 'Your username has been locked out, please reset your password by \'Forget Password\'.') {
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
				error : function() {
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



var nextPage;

function getStarted(){
		/* $.ajax({
		    url:'${pageContext.request.contextPath}/ajax/savings-insurance/getPurchaseHistoryByPlanCode',
		    type:'get',
		    data:{
  	    	"planCode" : "SAVIE-SP"
     		},
		    error:function(){
		    },
		    success:function(data){
		    	if(data != null && data.errMsgs == null && data.policies !=null && data.policies.length > 0){
		    		$('#prev-savie-app-modal').modal({backdrop: 'static', keyboard: false});
			    	$('#loginpopup').modal('hide');
		    		$('#prev-savie-app-modal').modal('show');
		    	}else{ */
	                    $.ajax({
	                        url:'${pageContext.request.contextPath}/ajax/savings-insurance/getPolicyApplicationSaveforLater',
	                        type:'get',
	                        error:function(){
	                        },
	                        success:function(data){
	                            if(data != null && data.errMsgs == null && data.nextPage !=null && $('#loginform-pop #forcefna').val()=="false"){
	                                $('#retrieve-application-modal').modal({backdrop: 'static', keyboard: false});
	                                $('#loginpopup').modal('hide');
	                                $('#retrieve-application-modal').modal('show');
	                                nextPage = data.nextPage;
	                            }
	                            else{
	                                $.ajax({
	                                    url:'${pageContext.request.contextPath}/ajax/savings-insurance/show',
	                                    type:'get',
	                                    error:function(){
	                                    },
	                                    success:function(data){
	                                        if(data != null && data.errMsgs == null && data.name !=null){
	                                            $('#review-fna-modal').modal({backdrop: 'static', keyboard: false});
	                                            $('#loginpopup').modal('hide');
	                                            $('#review-fna-modal').modal('show');
	                                        }
	                                        else{
	                                            window.location = '<%=request.getContextPath()%>/${language}/FNA/financial-needs-analysis';
	                                        }
	                                    }
	                                });
	                            }
	                        }
	                    });
		    	/* }
		    }
		}); */
	}
</script>

<!-- Session is alive or not -->
<%
	session = request.getSession();
	String uatAuth = (String) session.getAttribute("uatAuth");
	// 	if (uatAuth == null)
	// 		response.sendRedirect(request.getContextPath() + "/uatAuth");
	// 	if (!uatAuth.equals("userName"))
	// 		response.sendRedirect(request.getContextPath() + "/uatAuth");

	UserDetails user = new UserDetails();
	if (session.getAttribute("userDetails") != null) {
		user = (UserDetails) session.getAttribute("userDetails");
	}
%>

<!-- End Visual Website Optimizer Asynchronous Code -->
<!--End VWO-->
<!--desktop header-->
<header id="header" class="header hidden-xs hidden-sm">
	<div class="top-bar">
		<%@include file="header.notification.bar.desktop.jsp" %>
		<div class="container ">
			<div class="row">
				<div class="col-lg-5 col-md-5 pad-none">
					<ul class="nav navbar-nav lang-btn-grp">
 							<li>
								<%
									String switchUrl = "";
								    String langClass = "";
									if ("en".equals(session.getAttribute("language").toString())) {
									    langClass = "eng";
										if (request.getServletPath().equals("/en")) {
											switchUrl = request.getContextPath() + "/changeLang?selectLang=en&action=/en/";
										} else {
											switchUrl = request.getContextPath() + "/changeLang?selectLang=tc&action=" + request.getServletPath();
											if (request.getQueryString() != null && request.getQueryString().length() > 0) {
												switchUrl += "?" + request.getQueryString();
											}
										}
									} else {
									    langClass = "chi";
										if (request.getServletPath().equals("/tc")) {
											switchUrl = request.getContextPath() + "/changeLang?selectLang=tc&action=/tc/";
										} else {
											switchUrl = request.getContextPath() + "/changeLang?selectLang=tc&action=" + request.getServletPath();
											if (request.getQueryString() != null && request.getQueryString().length() > 0) {
												switchUrl += "?" + request.getQueryString();
											}
										}
									}
								%>
								<a class="lang <%=langClass%> pull-left" id="anchor-lang" href="<%=switchUrl%>"><fmt:message key="header.menu.language" bundle="${msg}" /></a>
							</li>
							<li><span class="top-livechat"><a class="livechat_button"><i class="fa fa-comments-o"></i></a></span></li>
							<li>
							<div class="top-number"><span class="callus"> <fmt:message key="header.hotline" bundle="${msg}" /></span>
							</div>
							</li>
 					</ul>
				</div>
				<div class="col-lg-7 col-md-7">
					<div class="collapse navbar-collapse navbar-right top-menu pad-none" id="headerLoginForm">
						<ul class="nav navbar-nav">
							<li class="active"><a
								href="<%=request.getContextPath()%>/${language}"><fmt:message
										key="header.menu.home" bundle="${msg}" /></a></li>
							<li><a
								href="<fmt:message key="header.menu.about.link" bundle="${msg}" />"
								target="_blank"><fmt:message key="header.menu.about"
										bundle="${msg}" /></a></li>
							<li class="active"><a
								href="<fmt:message key="header.menu.contactus.link" bundle="${msg}" />"
								target="_blank"><fmt:message key="header.menu.contactus"
										bundle="${msg}" /></a></li></li>
							<%
								String username = (String) session.getAttribute("username");
								//System.out.println("username " + username);
								if (username == null) {
							%>
							<li><a
								href="${pageContext.request.contextPath}/${language}/joinus"><fmt:message
										key="header.menu.join" bundle="${msg}" /></a></li>
							<%
								} else if (username.equals("*DIRECTGI")) {
							%>
							<li><a
								href="${pageContext.request.contextPath}/${language}/joinus"><fmt:message
										key="header.menu.join" bundle="${msg}" /></a></li>

							<%
								}
							%>
							<%
								if (session.getAttribute("authenticate") == null
										|| session.getAttribute("username") == null) {
							%>

							<li class="dropdown login-btn margin-left1 js-not-logged-in" id="myDropdown">
								<a id="fwd-login-desk" href="#" data-toggle="modal" data-target="#loginpopup"><fmt:message
										key="header.menu.login" bundle="${msg}" /> <i
									class="fa fa-caret-right"></i> </a> <!--  </a> -->


								<div class="dropdown-menu drop-width">
									<form name="loginform" id="loginform" method="post">
										<div class="login-form">
											<div
												style="display: none; position: fixed; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1000"
												class="login-ajax-loading">
												<img
													style="width: 100px; height: 100px; position: absolute; top: 50%; left: 50%; margin-top: -50px; margin-left: -50px;"
													src="<%=request.getContextPath()%>/resources/images/ajax-loader.gif">
											</div>
											<div id="login-err-msg" class="alert alert-danger"
												role="alert" style="display: none;"></div>
											<div class="form-container" >
												<h2>
													<fmt:message key="header.login.heading" bundle="${msg}" />
												</h2>
												<h4 class="margin-shift">
													<fmt:message key="header.login.username" bundle="${msg}" />
													<a
														href="${pageContext.request.contextPath}/${language}/forgotUserName"
														class="pull-right sub-link"><fmt:message
															key="header.login.username.forget" bundle="${msg}" /></a>
												</h4>

												<div class="form-group">
													<input type="text" name="userName" class="form-control"
														placeholder="" id="headerUserName">
												</div>
												<span id="errUserName" style="color: red"></span>
												<h4 class="margin-shift">
													<fmt:message key="header.login.password" bundle="${msg}" />
													<a
														href="${pageContext.request.contextPath}/${language}/forgotPassword"
														class="pull-right sub-link"><fmt:message
															key="header.login.password.forget" bundle="${msg}" /></a>
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
															<fmt:message key="header.login.action" bundle="${msg}" />
														</button>
													</div>
													<h3
														class="text-left col-lg-6 col-md-6 pad-none margin-none">
														<span> <fmt:message
																key="header.login.registration.heading" bundle="${msg}" /></span><br>
														<a
															href="${pageContext.request.contextPath}/${language}/joinus">
															<fmt:message key="header.login.registration.action"
																bundle="${msg}" />
														</a>
													</h3>
													<div class="clearfix"></div>
												</div>
												<p>
													<fmt:message key="header.login.disclaimer" bundle="${msg}" />
												</p>
											</div>
										</div>
									</form>
								</div>
							</li>
							
							<li class="dropdown logout-btn margin-left1 hidden js-logged-in" id="myDropdown">
								<a class="js-myDropdown__userName" href="#" class="dropdown-toggle" data-toggle="dropdown"><fmt:message
										key="header.login.welcome" bundle="${msg}" />&nbsp;&nbsp;&nbsp;
									<i class="fa fa-caret-right"></i> </a>
								<div class="dropdown-menu drop-width">
									<ul>
										<li><a
											href="<%=request.getContextPath()%>/${language}/account"
											class="color1"> <fmt:message key="header.menu.member"
													bundle="${msg}" /></a></li>
										<li><a href="<%=request.getContextPath()%>/userLogout"
											class="color1"> <fmt:message key="header.menu.logout"
													bundle="${msg}" />


										</a></li>
									</ul>
								</div>
							</li>							
							<%
								} else if (!"true".equals(session.getAttribute("authenticate")
										.toString())) {
							%>
							<li class="dropdown login-btn margin-left1" id="myDropdown">
								<a href="#" data-toggle="modal" data-target="#loginpopup"><fmt:message
										key="header.menu.login" bundle="${msg}" /> <i
									class="fa fa-caret-right"></i> </a>
								<div class="dropdown-menu drop-width">
									<form name="loginform" id="loginform" method="post">
										<div class="login-form">
											<div
												style="display: none; position: fixed; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1000"
												class="login-ajax-loading">
												<img
													style="width: 100px; height: 100px; position: absolute; top: 50%; left: 50%; margin-top: -50px; margin-left: -50px;"
													src="<%=request.getContextPath()%>/resources/images/ajax-loader.gif">
											</div>
											<div id="login-err-msg" class="alert alert-danger"
												role="alert" style="display: none;"></div>
											<div class="form-container">
												<h2>
													<fmt:message key="header.login.heading" bundle="${msg}" />
												</h2>
												<h4>
													<fmt:message key="header.login.username" bundle="${msg}" />
													<a
														href="${pageContext.request.contextPath}/${language}/forgotUserName"
														class="pull-right sub-link"><fmt:message
															key="header.login.username.forget" bundle="${msg}" /></a>
												</h4>

												<div class="form-group">
													<input type="text" name="userName" class="form-control"
														placeholder="" id="headerUserName">
												</div>
												<span id="errUserName" style="color: red"></span>
												<h4>
													<fmt:message key="header.login.password" bundle="${msg}" />
													<a
														href="${pageContext.request.contextPath}/${language}/forgotPassword"
														class="pull-right sub-link"><fmt:message
															key="header.login.password.forget" bundle="${msg}" /></a>
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
															<fmt:message key="header.login.action" bundle="${msg}" />
														</button>
													</div>
													<h3
														class="text-left col-lg-6 col-md-6 pad-none margin-none">
														<span> <fmt:message
																key="header.login.registration.heading" bundle="${msg}" /></span><br>
														<a
															href="${pageContext.request.contextPath}/${language}/joinus">
															<fmt:message key="header.login.registration.action"
																bundle="${msg}" />
														</a>
													</h3>
													<div class="clearfix"></div>
												</div>
												<p>
													<fmt:message key="header.login.disclaimer" bundle="${msg}" />
												</p>
											</div>
										</div>
									</form>
								</div>
							</li>

							<%
								} else {
							%>
							<li class="dropdown logout-btn margin-left1" id="myDropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown"><fmt:message
										key="header.login.welcome" bundle="${msg}" />&nbsp;&nbsp;&nbsp;<%=session.getAttribute("username")%>
									<i class="fa fa-caret-right"></i> </a>
								<div class="dropdown-menu drop-width">
									<ul>
										<%
											if (!"direct".equalsIgnoreCase(request.getSession()
														.getAttribute("authenticate").toString())) {
										%>
										<li><a
											href="<%=request.getContextPath()%>/${language}/account"
											class="color1"> <fmt:message key="header.menu.member"
													bundle="${msg}" /></a></li>
										<%
											}
										%>
										<li><a href="<%=request.getContextPath()%>/userLogout"
											class="color1"> <fmt:message key="header.menu.logout"
													bundle="${msg}" />


										</a></li>
									</ul>
								</div>
							</li>
							<%
								}
							%>

							<li class="chatnow-btn"><a
								href="<fmt:message key="fwd.homepage.link" bundle="${msg}" />" target="_blank"><fmt:message
										key="header.menu.chatnow" bundle="${msg}" /></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!--/.container-->
	</div>
	<!--/.top-bar-->

	<%
		String actionName = "";
		if (request.getAttribute("controller") != null) {
			actionName = request.getAttribute("controller").toString();
		}
	%>

	<nav class="navbar navbar-inverse">
		<div class="container pad-none">
			<div class="navbar-header">
				<a class="navbar-brand"
					href="<%=request.getContextPath()%>/${language}"><img
					src="<%=request.getContextPath()%>/resources/images/iFWD_logo_200px.jpg"
					alt="<fmt:message key="logo.alt" bundle="${msg}" />"></a>
			</div>
			<!--<div class="col-lg-8 col-md-7 pull-right">
				<ul class="maintabs">
					<li
						class="col-lg-3 col-md-3 pad-none main-tab <%if (actionName.equals("Savie")) {%> active"<%}%>"><a
						href="<%=request.getContextPath()%>/${language}/savings-insurance"
						class="travel-and-home-tab"><fmt:message
								key="header.product.savie.part1" bundle="${msg}" /> <fmt:message
								key="header.product.savie.part2" bundle="${msg}" /></a>
						<div class="special-offer"></div></li>
					<li
						class="col-lg-3 col-md-3 pad-none main-tab <%if (actionName.equals("WorkingHoliday")) {%> active <%}%>"><a
						href="<%=request.getContextPath()%>/${language}/working-holiday-insurance"
						class="workingholiday-tab"><fmt:message
								key="header.product.workingholiday" bundle="${msg}" /></a></li>
					<li
						class="col-lg-3 col-md-3 pad-none main-tab <%if (actionName.equals("Flight")) {%> active <%}%>"><a
						href="<%=request.getContextPath()%>/${language}/flight-insurance"
						class="travel-and-home-tab"><fmt:message
								key="header.product.flight" bundle="${msg}" /></a>
						<div class="offer"></div></li>
					<li
						class="col-lg-3 col-md-3 pad-none main-tab <%if (actionName.equals("Travel")) {%> active <%}%>"><a
						href="<%=request.getContextPath()%>/${language}/travel-insurance"
						class="travel-and-home-tab"><fmt:message
								key="header.product.travel" bundle="${msg}" /></a></li>
					<li
						class="col-lg-3 col-md-3 pad-none main-tab ext_content <%if (actionName.equals("Homecare")) {%> active <%}%>"><a
						href="<%=request.getContextPath()%>/${language}/home-insurance"
						class="travel-and-home-tab"><fmt:message
								key="header.product.home" bundle="${msg}" /></a></li>
				</ul>

			</div>-->
            <div class="col-lg-8 col-md-7 pull-right">
                <!-- <ul class="col-lg-8 col-md-11 maintabs menutab-V2 pull-right"> -->
				<ul class="col-lg-11 col-md-12 maintabs menutab-V2 pull-right">
                    <li class="col-lg-4 col-md-4 pad-none main-tab dropdown <%if (actionName.equals("WorkingHoliday") | actionName.equals("Flight") | actionName.equals("Travel") | actionName.equals("Homecare") | actionName.equals("Oversea") | actionName.equals("Eliteterm")) {%> active <%}%>">
                        <a class="protect-save-enjoy-tab"><fmt:message key="header.product.type1" bundle="${msg}" /></a>
		                <ul class="col-lg-12 col-md-12 dropdown-menu protect-tab">
			                  <li class="nav-group no-padding partition-on-the-right protect-tab__1st_col">
		                          <ul class="col-lg-12 col-md-12 no-padding">
			                          <li class="menu-subtitle"><fmt:message key="header.product.type1.group1.title1" bundle="${msg}" /></li>
			                          <li class="menu-link">
			                          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			                          <a href="<%=request.getContextPath()%>/${language}/term-life-insurance"><fmt:message key="header.product.type1.group1.linkname1" bundle="${msg}" /></a>
			                          </li>
			                          <li class="menu-subtitle"><fmt:message key="header.product.type1.group1.title2" bundle="${msg}" /></li>
			                          <li class="menu-link">
			                          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			                          <a href="<%=request.getContextPath()%>/${language}/medical-insurance"><fmt:message key="header.product.type1.group1.linkname2" bundle="${msg}" /></a>
			                          </li>
		                         </ul>
			                  </li>
	                          <li class="nav-group no-padding partition-on-the-right protect-tab__2nd_col">
	                              <ul class="col-lg-12 col-md-12 no-padding">
	                              <li class="menu-subtitle"><fmt:message key="header.product.type1.group2.title" bundle="${msg}" /></li>
	                              <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/flight-insurance"><fmt:message key="header.product.type1.group2.linkname1" bundle="${msg}" /></a></li>
	                              <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/travel-insurance"><fmt:message key="header.product.type1.group2.linkname3" bundle="${msg}" /></a></li>
	                              <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/overseas-study-insurance"><fmt:message key="header.product.type1.group2.linkname2" bundle="${msg}" /></a></li>
	                              <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/working-holiday-insurance"><fmt:message key="header.product.type1.group2.linkname4" bundle="${msg}" /></a></li>
	                             </ul>
	                          </li>
	                          <li class="nav-group no-padding partition-on-the-right protect-tab__3rd_col">
	                              <ul class="col-lg-12 col-md-12 no-padding">
	                              <li class="menu-subtitle"><fmt:message key="header.product.type1.group3.title" bundle="${msg}" /></li>
	                              <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/household-insurance/easy-home-care"><fmt:message key="header.product.type1.group3.linkname1" bundle="${msg}" /></a></li>
	                              <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/household-insurance/home-liability"><fmt:message key="header.product.type1.group3.linkname2" bundle="${msg}" /></a></li>
	                              <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/screen-insurance/${language}" target="_blank"><fmt:message key="header.product.type1.group3.linkname3" bundle="${msg}" /></a></li>
	                              <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/phone-insurance/${language}" target="_blank"><fmt:message key="header.product.type1.group3.linkname4" bundle="${msg}" /></a></li>
	                             </ul>
	                          </li>
							  <li class="nav-group no-padding protect-tab__4th_col">
	                              <ul class="col-lg-12 col-md-12 no-padding">
	                              <li class="menu-subtitle"><fmt:message key="header.product.type1.group4.title" bundle="${msg}" /></li>
	                              <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/motor-insurance"><fmt:message key="header.product.type1.group4.linkname1" bundle="${msg}" /></a></li>
	                             </ul>
	                          </li>
		                 </ul>
                    </li>
                    <li class="col-lg-4 col-md-4 pad-none main-tab dropdown<%if (actionName.equals("Savie")) {%> active <%}%>">
                        <a class="protect-save-enjoy-tab"><fmt:message key="header.product.type2" bundle="${msg}" /></a>
                        <ul class="col-lg-12 col-md-12 dropdown-menu one-column save-tab">
                          <li>
                              <ul class="col-lg-12 col-md-12 no-padding">
                              <li class="menu-subtitle"><fmt:message key="header.product.type2.group1.title" bundle="${msg}" /></li>
                                  <li class="menu-link">
	                                  <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	                                  <a class="menu-link" href="<%=request.getContextPath()%>/${language}/savings-insurance"><fmt:message key="header.product.type2.group1.linkname1" bundle="${msg}" /></a>
                                  </li>
                                  <li class="menu-link">
	                                  <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	                                  <a class="menu-link" href="<%=request.getContextPath()%>/${language}/savings-insurance/provie"><fmt:message key="header.product.type2.group1.linkname2" bundle="${msg}" /></a>
                                  </li>
                                  <li class="menu-link">
	                                  <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	                                  <a class="menu-link" href="<%=request.getContextPath()%>/${language}/savings-insurance/wealthree"><fmt:message key="header.product.type2.group1.linkname3" bundle="${msg}" /></a>
                                  </li>
                             </ul>
                          </li>
                         </ul>
                    </li>
                    <li class="col-lg-4 col-md-4 pad-none main-tab dropdown enjoy<%if (actionName.equals("offers")) {%> active <%}%>">
                        <a class="protect-save-enjoy-tab"><fmt:message key="header.product.type3" bundle="${msg}" /></a>
                        <ul class="col-lg-12 col-md-12 dropdown-menu one-column enjoy-tab">
                          <li>
                              <ul class="col-lg-12 col-md-12 no-padding">
                                  <li class="menu-link">
                                      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                      <%-- <a class="menu-link" href="<%=request.getContextPath()%>/${language}/fwdiscover"><fmt:message key="header.product.type3.group1.linkname2" bundle="${msg}" /></a> --%>
									  <a class="menu-link" href='<fmt:message key="footer.product.type3.link" bundle="${msg}" />'><fmt:message key="header.product.type3.group1.linkname2" bundle="${msg}" /></a>
                                  </li>
                                  <li class="menu-link">
	                                  <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	                                  <a class="menu-link" href="<%=request.getContextPath()%>/${language}/offers"><fmt:message key="header.product.type3.group1.linkname1" bundle="${msg}" /></a>
                                  </li>
                                  <li class="menu-link">
	                                  <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	                                  <a class="menu-link" href="<fmt:message key="link.blog" bundle="${msg}" />" target="_blank"><fmt:message key="header.product.type3.group1.linkname3" bundle="${msg}" /></a>
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

<div id="test" style="position: absolute; top: 0; left: 0; bottom: 0; right: 0; z-index: 998; display: none"></div>
<!--Mobile-header-->
<div class="navbar navbar-default navbar-fixed-top hidden-lg hidden-md pad-none" role="navigation">
	<%@include file="header.notification.bar.mobile.jsp" %>
<%-- 	<div class="mob-topbar">
		<span id="toplefthotline" class="callus top-number"><fmt:message key="header.hotlineSmall" bundle="${msg}" /></span> <a href="#"
			onClick="zopim_chat_start()"><span class="chat pull-right"><fmt:message key="header.menu.chatnow" bundle="${msg}" /></span></a>
		<span id="toplefthotline" class="callus top-number"><fmt:message
				key="header.hotlineSmall" bundle="${msg}" /></span> <a
			href="<fmt:message key="fwd.homepage.link" bundle="${msg}" />"><span
			class="chat pull-right"><fmt:message key="header.menu.chatnow"
					bundle="${msg}" /></span></a>
			<a class="lang pull-right hehe" id="anchor-lang" href="<%=switchUrl%>"><fmt:message key="header.menu.language" bundle="${msg}" /></a>
		<div class="clearfix"></div>
	</div> --%>
	<div class="logobox">
		<div class="navbar-header" style="overflow: hidden;">
			<button type="button"
				class="navbar-toggle mob-menu-btn col-xs-1 col-sm-1" data-toggle="collapse" data-target=".navbar-collapse">
				<!--<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">-->
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span> <span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand pull-left col-xs-12 col-sm-12"
				href="<%=request.getContextPath()%>/${language}"><img
				src="<%=request.getContextPath()%>/resources/images/iFWD_logo_mobile.png"
				alt="<fmt:message key="logo.alt" bundle="${msg}" />"
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
        <%
            if (session.getAttribute("authenticate") == null
                    || !"true".equals(session.getAttribute("authenticate")
                            .toString())) {
        %>
        <div class="dropdown login-btn btn btn-lg wd2 js-not-logged-in" id="myDropdown" data-toggle="modal" data-target="#loginpopup">
	        <a class="dropdown-toggle color-wht log-to-acc"
	            id="fwd-login-mob"><i
	            class="fa fa-lock"></i> <fmt:message key="header.login.heading"
	                bundle="${msg}" /> </a>
        </div>
         <div class="dropdown login-btn btn btn-lg wd2 hidden js-logged-in" id="myDropdownMob">
	        <a class="js-myDropdown__userName dropdown-toggle" id="fwd-login"
	            data-toggle="dropdown"><fmt:message key="header.login.welcome"
	                bundle="${msg}" />&nbsp;&nbsp;&nbsp;
	            <i class="fa fa-caret-right"> </i> </a>
	        <div class="dropdown-menu drop-width">
	            <ul>
	                <li><a href="<%=request.getContextPath()%>/${language}/account"
	                    class="color1"> <fmt:message key="header.menu.member"
	                            bundle="${msg}" /></a></li>
	                <li><a href="<%=request.getContextPath()%>/userLogout"
	                    class="color1"><fmt:message key="header.menu.logout"
	                            bundle="${msg}" /></a></li>
	            </ul>
	        </div>
		</div>       
        
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
                            src="<%=request.getContextPath()%>/resources/images/ajax-loader.gif">
                    </div>
                    <div id="login-err-msg"
                        class="alert alert-danger col-xs-10 col-xs-offset-1 " role="alert"
                        style="display: none;"></div>
                    <div class="form-container">
                        <h2>
                            <fmt:message key="header.login.heading" bundle="${msg}" />
                        </h2>
                        <h4 class="margin-shift">
                            <fmt:message key="header.login.username" bundle="${msg}" />
                            <a
                                href="${pageContext.request.contextPath}/${language}/forgotUserName"
                                class="pull-right sub-link"><fmt:message
                                    key="header.login.username.forget" bundle="${msg}" /></a>
                        </h4>

                        <div class="form-group">
                            <input type="text" name="userName" class="form-control"
                                placeholder="" id="headerUserName">
                        </div>
                        <span id="errUserName" style="color: red"></span>
                        <h4 class="margin-shift">
                            <fmt:message key="header.login.password" bundle="${msg}" />
                            <a
                                href="${pageContext.request.contextPath}/${language}/forgotPassword"
                                class="pull-right sub-link"><fmt:message
                                    key="header.login.password.forget" bundle="${msg}" /></a>
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
                                    <fmt:message key="header.login.action" bundle="${msg}" />
                                </button>
                            </div>
                            <h3
                                class="text-left col-lg-6 col-md-6  col-xs-6 pad-none margin-none">
                                <span> <fmt:message
                                        key="header.login.registration.heading" bundle="${msg}" /></span><br>
                                <a href="${pageContext.request.contextPath}/${language}/joinus">
                                    <fmt:message key="header.login.registration.action"
                                        bundle="${msg}" />
                                </a>
                            </h3>
                            <div class="clearfix"></div>
                        </div>

                    </div>
                </div>
            </form>
        </div>-->

        <%
            } else {
        %>


        <div class="dropdown login-btn btn btn-lg wd2" id="myDropdownMob">
	        <a class="dropdown-toggle" id="fwd-login"
	            data-toggle="dropdown"><fmt:message key="header.login.welcome"
	                bundle="${msg}" />&nbsp;&nbsp;&nbsp;<%=session.getAttribute("username")%>
	            <i class="fa fa-caret-right"> </i> </a>
	        <div class="dropdown-menu drop-width">
	            <ul>
	                <%
	                    if (!"direct".equalsIgnoreCase(request.getSession()
	                                .getAttribute("authenticate").toString())) {
	                %>
	                <li><a href="<%=request.getContextPath()%>/${language}/account"
	                    class="color1"> <fmt:message key="header.menu.member"
	                            bundle="${msg}" /></a></li>
	                <%
	                    }
	                %>
	                <li><a href="<%=request.getContextPath()%>/userLogout"
	                    class="color1"><fmt:message key="header.menu.logout"
	                            bundle="${msg}" /></a></li>
	            </ul>
	        </div>
		</div>

        <%
            }
        %>
             </li>
             <li class="pad-none col-sm-12 dropdown link-btn link-grp border-bottom fwd-header-navgation-menu">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><fmt:message key="header.product.type1" bundle="${msg}" /><img class="link-arrow" src="<%=request.getContextPath()%>/resources/images/arrow.png"><img class="link-arrow hidden-label" src="<%=request.getContextPath()%>/resources/images/arrow-down.png"></a>
              <ul class="col-sm-12 dropdown-menu">

                <li class="menu-link-grp-title">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><fmt:message key="header.product.type1.group1.title1" bundle="${msg}" /></a>
                    <ul class="col-sm-12 dropdown-menu">
	                    <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/term-life-insurance"><fmt:message key="header.product.type1.group1.linkname1" bundle="${msg}" /></a></li>
	                	</ul>
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><fmt:message key="header.product.type1.group1.title2" bundle="${msg}" /></a>
                    <ul class="col-sm-12 dropdown-menu">
	                    <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/medical-insurance"><fmt:message key="header.product.type1.group1.linkname2" bundle="${msg}" /></a></li>
	                </ul>
                </li>
                <li class="menu-link-grp-title">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><fmt:message key="header.product.type1.group2.title" bundle="${msg}" /></a>
                    <ul class="col-sm-12 dropdown-menu">
                         <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/flight-insurance"><fmt:message key="header.product.type1.group2.linkname1" bundle="${msg}" /></a></li>
                         <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/travel-insurance"><fmt:message key="header.product.type1.group2.linkname3" bundle="${msg}" /></a></li>
                         <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/overseas-study-insurance"><fmt:message key="header.product.type1.group2.linkname2" bundle="${msg}" /></a></li>
                         <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/working-holiday-insurance"><fmt:message key="header.product.type1.group2.linkname4" bundle="${msg}" /></a></li>
                    </ul>
                </li>
				<li class="menu-link-grp-title">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><fmt:message key="header.product.type1.group3.title" bundle="${msg}" /></a>
					<ul class="col-sm-12 dropdown-menu">
                         <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/household-insurance/easy-home-care"><fmt:message key="header.product.type1.group3.linkname1" bundle="${msg}" /></a></li>
                         <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/household-insurance/home-liability"><fmt:message key="header.product.type1.group3.linkname2" bundle="${msg}" /></a></li>
                         <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/screen-insurance/${language}" target="_blank"><fmt:message key="header.product.type1.group3.linkname3" bundle="${msg}" /></a></li>
                    	 <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/phone-insurance/${language}" target="_blank"><fmt:message key="header.product.type1.group3.linkname4" bundle="${msg}" /></a></li>
                    </ul>
				</li>
				<li class="menu-link-grp-title">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><fmt:message key="header.product.type1.group4.title" bundle="${msg}" /></a>
					<ul class="col-sm-12 dropdown-menu">
                         <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/motor-insurance"><fmt:message key="header.product.type1.group4.linkname1" bundle="${msg}" /></a></li>
                    </ul>
				</li>

					</ul>
            </li>
            <li class="pad-none col-sm-12 dropdown link-btn border-bottom fwd-header-navgation-menu"> <%-- Saving Insurance --%>
							<%-- <a href="<%=request.getContextPath()%>/${language}/savings-insurance"><fmt:message key="header.product.type2" bundle="${msg}" /><img class="link-arrow" src="<%=request.getContextPath()%>/resources/images/arrow.png"><img class="link-arrow hidden-label" src="<%=request.getContextPath()%>/resources/images/arrow-down.png"></a> --%>
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><fmt:message key="header.product.type2" bundle="${msg}" /><img class="link-arrow" src="<%=request.getContextPath()%>/resources/images/arrow.png"><img class="link-arrow hidden-label" src="<%=request.getContextPath()%>/resources/images/arrow-down.png"></a>
							<ul class="col-sm-12 dropdown-menu">
								<li class="menu-link-grp-title">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown"><fmt:message key="header.product.type2.group1.title" bundle="${msg}" /></a>
										<ul class="col-sm-12 dropdown-menu">
											<li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/savings-insurance"><fmt:message key="header.product.type2.group1.linkname1" bundle="${msg}" /></a></li>
											<li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/savings-insurance/provie"><fmt:message key="header.product.type2.group1.linkname2" bundle="${msg}" /></a></li>
											<li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/savings-insurance/wealthree"><fmt:message key="header.product.type2.group1.linkname3" bundle="${msg}" /></a></li>
										</ul>
	            	</li>
							</ul>
						</li>
            <li class="pad-none col-sm-12 dropdown link-btn border-bottom link-grp fwd-header-navgation-menu">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><fmt:message key="header.product.type3" bundle="${msg}" /><img class="link-arrow" src="<%=request.getContextPath()%>/resources/images/arrow.png"><img class="link-arrow hidden-label" src="<%=request.getContextPath()%>/resources/images/arrow-down.png"></a>
              <ul class="col-sm-12 dropdown-menu">
				  <%--<li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/fwdiscover"><fmt:message key="header.product.type3.group1.linkname2" bundle="${msg}" /></a></li>--%>
				  <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href='<fmt:message key="footer.product.type3.link" bundle="${msg}" />'><fmt:message key="header.product.type3.group1.linkname2" bundle="${msg}" /></a></li>
                   <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/offers"><fmt:message key="header.product.type3.group1.linkname1" bundle="${msg}" /></a></li>
                   <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<fmt:message key="link.blog" bundle="${msg}" />" target="_blank"><fmt:message key="header.product.type3.group1.linkname3" bundle="${msg}" /></a></li>
              </ul>
            </li>
             <li class="pad-none col-sm-12 dropdown lang-grp">
                <ul>
 							<li>
 							<a class="lang menu-lang" id="anchor-lang" href="<%=switchUrl%>"><fmt:message key="header.menu.language" bundle="${msg}" /></a>
							</li>
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

		<%
			if (session.getAttribute("authenticate") == null
					|| !"true".equals(session.getAttribute("authenticate")
							.toString())) {
		%>
		<a href="#" class="dropdown-toggle color-wht log-to-acc"
			id="fwd-login-mob" onclick="$('.bmg_mobile_login_mask').toggle();"><i
			class="fa fa-lock"></i> <fmt:message key="header.login.heading"
				bundle="${msg}" /> </a>
		<div class="dropdown-menu drop-width"
			style="left: -32px; top: 105px; max-width: 300px;">
			<form name="loginform" id="loginform2">
				<div class="login-form" style="position: relative;">
					<div
						style="display: none; position: fixed; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1000"
						class="login-ajax-loading">
						<img
							style="width: 100px; height: 100px; position: absolute; top: 50%; left: 50%; margin-top: -50px; margin-left: -50px;"
							src="<%=request.getContextPath()%>/resources/images/ajax-loader.gif">
					</div>
					<div id="login-err-msg"
						class="alert alert-danger col-xs-10 col-xs-offset-1 " role="alert"
						style="display: none;"></div>
					<div class="form-container">
						<h2>
							<fmt:message key="header.login.heading" bundle="${msg}" />
						</h2>
						<h4 class="margin-shift">
							<fmt:message key="header.login.username" bundle="${msg}" />
							<a
								href="${pageContext.request.contextPath}/${language}/forgotUserName"
								class="pull-right sub-link"><fmt:message
									key="header.login.username.forget" bundle="${msg}" /></a>
						</h4>

						<div class="form-group">
							<input type="text" name="userName" class="form-control"
								placeholder="" id="headerUserName">
						</div>
						<span id="errUserName" style="color: red"></span>
						<h4 class="margin-shift">
							<fmt:message key="header.login.password" bundle="${msg}" />
							<a
								href="${pageContext.request.contextPath}/${language}/forgotPassword"
								class="pull-right sub-link"><fmt:message
									key="header.login.password.forget" bundle="${msg}" /></a>
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
									<fmt:message key="header.login.action" bundle="${msg}" />
								</button>
							</div>
							<h3
								class="text-left col-lg-6 col-md-6  col-xs-6 pad-none margin-none">
								<span> <fmt:message
										key="header.login.registration.heading" bundle="${msg}" /></span><br>
								<a href="${pageContext.request.contextPath}/${language}/joinus">
									<fmt:message key="header.login.registration.action"
										bundle="${msg}" />
								</a>
							</h3>
							<div class="clearfix"></div>
						</div>

					</div>
				</div>
			</form>
		</div>

		<%
			} else {
		%>



		<a href="#" class="dropdown-toggle" id="fwd-login"
			data-toggle="dropdown"><fmt:message key="header.login.welcome"
				bundle="${msg}" />&nbsp;&nbsp;&nbsp;<%=session.getAttribute("username")%>
			<i class="fa fa-caret-right"> </i> </a>
		<div class="dropdown-menu drop-width">
			<ul>
				<%
					if (!"direct".equalsIgnoreCase(request.getSession()
								.getAttribute("authenticate").toString())) {
				%>
				<li><a href="<%=request.getContextPath()%>/${language}/account"
					class="color1"> <fmt:message key="header.menu.member"
							bundle="${msg}" /></a></li>
				<%
					}
				%>
				<li><a href="<%=request.getContextPath()%>/userLogout"
					class="color1"><fmt:message key="header.menu.logout"
							bundle="${msg}" /></a></li>
			</ul>
		</div>


		<%
			}
		%>
	</div>

	<ul class="nav navmenu-nav sidepanel-menu">
		<li><a href="<%=request.getContextPath()%>/${language}"><fmt:message
					key="header.menu.home" bundle="${msg}" /></a></li>
		<li class="<%if (actionName.equals("Savie")) {%>active<%}%>"><span><fmt:message
					key="header.limitedOffer" bundle="${msg}" /></span><a
			class="limited-offer-mobile"
			href="<%=request.getContextPath()%>/${language}/savings-insurance"><fmt:message
					key="header.product.savie.part1" bundle="${msg}" /> <br
				class="visible-md visible-lg" />
			<fmt:message key="header.product.savie.part2" bundle="${msg}" /></a>
		<div class="special-offer"></div></li>
		<li class="<%if (actionName.equals("WorkingHoliday")) {%>active<%}%>"><a
			href="<%=request.getContextPath()%>/${language}/working-holiday-insurance"><fmt:message
					key="header.product.workingholiday" bundle="${msg}" /></a></li>
		<li class="<%if (actionName.equals("Flight")) {%>active<%}%>"><a
			href="<%=request.getContextPath()%>/${language}/flight-insurance"><fmt:message
					key="header.product.flight" bundle="${msg}" /></a>
		<div class="offer"></div></li>
		<li class="<%if (actionName.equals("Travel")) {%>active<%}%>"><a
			href="<%=request.getContextPath()%>/${language}/travel-insurance"><fmt:message
					key="header.product.travel" bundle="${msg}" /></a></li>
		<li class="<%if (actionName.equals("Homecare")) {%>active<%}%>"><a
			href="<%=request.getContextPath()%>/${language}/home-insurance"><fmt:message
					key="header.product.home" bundle="${msg}" /></a></li>
	</ul>-->
</div>

<div id="myModal" class="mob-login-form-wrapper modal fade" role="dialog">
<div
    style="display: none; position: fixed; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 2001"
    class="login-ajax-loading">
    <img
        style="width: 100px; height: 100px; position: absolute; top: 50%; left: 50%; margin-top: -50px; margin-left: -50px;"
        src="<%=request.getContextPath()%>/resources/images/ajax-loader.gif">
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
        <form name="loginform" id="loginform2" method="post">
            <div class="login-form" style="position: absolute;">
                <div id="login-err-msg"
                    class="alert alert-danger col-xs-10 col-xs-offset-1 " role="alert"
                    style="display: none;"></div>
                <div class="form-container">
                    <h2>
                        <fmt:message key="header.login.heading" bundle="${msg}" />
                    </h2>
                    <h4 class="margin-shift">
                        <fmt:message key="header.login.username" bundle="${msg}" />
                        <a
                            href="${pageContext.request.contextPath}/${language}/forgotUserName"
                            class="pull-right sub-link"><fmt:message
                                key="header.login.username.forget" bundle="${msg}" /></a>
                    </h4>

                    <div class="form-group">
                        <input type="text" name="userName" class="form-control"
                            placeholder="" id="headerUserName">
                    </div>
                    <span id="errUserName" style="color: red"></span>
                    <h4 class="margin-shift">
                        <fmt:message key="header.login.password" bundle="${msg}" />
                        <a
                            href="${pageContext.request.contextPath}/${language}/forgotPassword"
                            class="pull-right sub-link"><fmt:message
                                key="header.login.password.forget" bundle="${msg}" /></a>
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
                                <fmt:message key="header.login.action" bundle="${msg}" />
                            </button>
                        </div>
                        <h3
                            class="text-left col-lg-6 col-md-6  col-xs-6 pad-none margin-none">
                            <span> <fmt:message
                                    key="header.login.registration.heading" bundle="${msg}" /></span><br>
                            <a href="${pageContext.request.contextPath}/${language}/joinus">
                                <fmt:message key="header.login.registration.action"
                                    bundle="${msg}" />
                            </a>
                        </h3>
                        <div class="clearfix"></div>
                    </div>
                    <p>
						<fmt:message key="header.login.disclaimer" bundle="${msg}" />
					</p>
                </div>
            </div>
        </form>
    </div>
</div>

<div class="modal fade common-welcome-modal" id="prev-savie-app-modal" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog">
   <div class="modal-dialog">
       <div class="modal-content">
           <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button> -->
           <h4 class="text-center welcome-msg">
           		<c:if test="${planIndex == 'medical-insurance'}">
           			<fmt:message key="overlay.easyhealth.repeated.purchase.copy1" bundle="${msg}" />
           		</c:if>
           		<c:if test="${planIndex == 'savings-insurance'}">
           			<fmt:message key="label.savie.repeat.buy.title" bundle="${msg}" />
           		</c:if>
           	<span id="fullName1" class="hidden"></span></h4>
           <p class="text-center description-msg">
           		<c:if test="${planIndex == 'medical-insurance'}">
           			<fmt:message key="overlay.easyhealth.repeated.purchase.copy2" bundle="${msg}" />
           		</c:if>
           		<c:if test="${planIndex == 'savings-insurance'}">
           			<fmt:message key="label.savie.repeat.buy.copy" bundle="${msg}" />
           		</c:if>
           	</p>
           <center>
               <button class="btn savie-common-btn" id="back-home"><fmt:message key="button.back.to.home" bundle="${msg}" /></button>
           </center>
        </div>
    </div>
</div>
<!--End Mobile header-->
<!--/header-->
<script>
$(function() {
	if((navigator.userAgent.match(/iPhone/i)) || (navigator.userAgent.match(/iPod/i)) || (navigator.userAgent.match(/iPad/i))) {
	    $(".menutab-V2 li").click(function(){
	        // Update '.change-this-class' to the class of your menu
	        // Leave this empty, that's the magic sauce
	        // Unbelivable, it works - IPAD Safari css hover fix
	    });
	}
    var pageControllerName = "<%=actionName%>";
    if(pageControllerName!=""){
    	pageControllerName = "#" + pageControllerName;
    }
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
		if (isMobile){
			$("#closeMobileMenu").on("touchmove touchstart",function(e) {
				if($(".mobile-menu-V2").hasClass("in")){
					$(".mob-menu-btn").click();
					//console.log(e);
				}
			});
			$(window).on("orientationchange load",function(){
                if(window.orientation == 0 || window.orientation == 180) // Portrait
                {
                    // alert("Portrait");
                  $(".mobile-menu-V2.navbar-collapse").css("max-height",$(window).height()*0.7);
                }
                else // Landscape
                {
                    $(".mobile-menu-V2.navbar-collapse").css("max-height",$(window).height()*0.6);
                    //alert("Landscape"+$(".mobile-menu-V2.navbar-collapse").css("max-height"));
                }
			});
		}
        $('.livechat_button').on("click",function(){
        	//console.log("livechat clicked");
            $('#livechat-compact-container').show();
            $('#livechat-compact-container').css({
                visibility: 'visible',
                opacity: 1
            });
            LC_API.open_chat_window();
        });
        $('.copyright .options li').click(function() {
            var link = $(this).attr('data-raw-value');
            window.open( link , '_blank');
        });
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
		    //$('#ios_chromeAlert').modal('show');
		    //centerModals($('#ios_chromeAlert'));
		    //$(window).on('resize', centerModals);
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
	<%
    if (session.getAttribute("authenticate") == null
            || !"true".equals(session.getAttribute("authenticate")
                    .toString())) {
    %>
		/*$('#myDropdownMob').cli
    ck(function(e) {
			e.preventDefault();
			e.stopPropagation();
			$(".mob-login-form-wrapper").toggleClass('open');
			$(".bmg_mobile_login_mask").toggle();
		});*/
	<%
    }
    %>
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
<jsp:include page="/WEB-INF/jsp/merged/iosChromeAlert.jsp" />
<jsp:include page="/WEB-INF/jsp/merged/login.jsp" />
<%if (session.getAttribute("authenticate") == "true" && session.getAttribute("username") != null) {%>
<jsp:include page="/WEB-INF/jsp/merged/session.jsp" />
<% } %>
<%-- <%if ((actionName.equals("WorkingHoliday") && request.getRequestURI().indexOf("/user-details")>0) | (actionName.equals("Oversea") && request.getRequestURI().indexOf("/application")>0) | (actionName.equals("Travel") && request.getRequestURI().indexOf("/user-details")>0) ){%>
<jsp:include page="/WEB-INF/jsp/merged/travel-alert.jsp" />
<% } %> --%>
