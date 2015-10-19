<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.UserDetails"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="language"
	value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}"
	scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<link rel="icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/resources/images/favicon.ico" />
<!-- <a href="javascript:void(0)" id="testajax" >Press</a> -->

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
				url : "<%=request.getContextPath()%>/userLogin",
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
						else {
							perventRedirect=false;
							//window.location.href = "<%=request.getContextPath()%>/getAccByUsernaneAndPassword";
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
<header id="header" class="hidden-xs hidden-sm">
	<div class="top-bar">
		<div class="container ">
			<div class="row">
				<div class="col-lg-5 col-md-5 pad-none">
					<div class="top-number">
						<span class="callus"> <fmt:message key="header.hotline"
								bundle="${msg}" /></span>
					</div>
				</div>
				<div class="col-lg-7 col-md-7">
					<div
						class="collapse navbar-collapse navbar-right top-menu pad-none"
						id="headerLoginForm">

						<ul class="nav navbar-nav">
							<li class="active"><a
								href="<%=request.getContextPath()%>/${language}"><fmt:message
										key="header.menu.home" bundle="${msg}" /></a></li>
							<li>|</li>
							<li><a
								href="<fmt:message key="header.menu.about.link" bundle="${msg}" />"
								target="_blank"><fmt:message key="header.menu.about"
										bundle="${msg}" /></a></li>
							<li>|</li>
							<%
								String username = (String) session.getAttribute("username");
								//System.out.println("username " + username);   
								if (username == null) {
							%>
							<li><a
								href="${pageContext.request.contextPath}/${language}/joinus"><fmt:message
										key="header.menu.join" bundle="${msg}" /></a></li>
							<li>|</li>
							<%
								} else if (username.equals("*DIRECTGI")) {
							%>
							<li><a
								href="${pageContext.request.contextPath}/${language}/joinus"><fmt:message
										key="header.menu.join" bundle="${msg}" /></a></li>
							<li>|</li>

							<%
								}
							%>
							<li>
								<%
									if ("en".equals(session.getAttribute("language").toString())) {
								%>

								<%
									if (request.getServletPath().equals("/en")) {
								%> <a
								class="lang pull-right" id="anchor-lang"
								href="<%=request.getContextPath()%>/changeLang?selectLang=tc&action=/en/"><fmt:message
										key="header.menu.language" bundle="${msg}" /></a> <%
 	} else {
 %> <a
								class="lang pull-right" id="anchor-lang"
								href="<%=request.getContextPath()%>/changeLang?selectLang=tc&action=<%=request.getServletPath()%>"><fmt:message
										key="header.menu.language" bundle="${msg}" /></a> <%
 	}
 	} else {
 %> <%
 	if (request.getServletPath().equals("/tc")) {
 %> <a
								class="lang pull-right" id="anchor-lang"
								href="<%=request.getContextPath()%>/changeLang?selectLang=en&action=/tc/"><fmt:message
										key="header.menu.language" bundle="${msg}" /></a> <%
 	} else {
 %> <a
								class="lang pull-right" id="anchor-lang"
								href="<%=request.getContextPath()%>/changeLang?selectLang=en&action=<%=request.getServletPath()%>"><fmt:message
										key="header.menu.language" bundle="${msg}" /></a> <%
 	}
 %> <%
 	}
 %>
							</li>
							<%
								if (session.getAttribute("authenticate") == null
										|| session.getAttribute("username") == null) {
							%>

							<li class="dropdown login-btn margin-left1" id="myDropdown">
								<a href="#" data-toggle="modal" data-target="#loginpopup"><fmt:message
										key="header.menu.login" bundle="${msg}" /> <i
									class="fa fa-caret-right"></i> </a> <!--  </a> -->


								<div class="dropdown-menu drop-width">
									<form name="loginform" id="loginform">
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
							<%
								} else if (!"true".equals(session.getAttribute("authenticate")
										.toString())) {
							%>
							<li class="dropdown login-btn margin-left1" id="myDropdown">
								<a href="#" data-toggle="modal" data-target="#loginpopup"><fmt:message
										key="header.menu.login" bundle="${msg}" /> <i
									class="fa fa-caret-right"></i> </a>
								<div class="dropdown-menu drop-width">
									<form name="loginform" id="loginform">
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
								href="<fmt:message key="fwd.homepage.link" bundle="${msg}" />"><fmt:message
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
					src="<%=request.getContextPath()%>/resources/images/logo.jpg"
					alt="<fmt:message key="logo.alt" bundle="${msg}" />"></a>
			</div>
			<div class="col-lg-8 col-md-7 pull-right">
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

			</div>
		</div>
		<!--/.container-->
	</nav>
	<!--/nav-->

</header>
<!--End-Desktop-header-->

<!-- hidden navbar -->
<div class="navbar_hidden_content">
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
</div>
<!-- hidden navbar -->

<div
	style="position: absolute; top: 0; left: 0; bottom: 0; right: 0; z-index: 998; display: none"
	id="test"></div>
<!--Mobile-header-->
<div class="mob-header hidden-lg hidden-md pad-none">
	<div class="mob-topbar">
		<!-- 
		<span id="toplefthotline" class="callus top-number"><fmt:message key="header.hotlineSmall" bundle="${msg}" /></span> <a href="#"
			onClick="zopim_chat_start()"><span class="chat pull-right"><fmt:message key="header.menu.chatnow" bundle="${msg}" /></span></a>
		 -->
		<span id="toplefthotline" class="callus top-number"><fmt:message
				key="header.hotlineSmall" bundle="${msg}" /></span> <a
			href="<fmt:message key="fwd.homepage.link" bundle="${msg}" />"><span
			class="chat pull-right"><fmt:message key="header.menu.chatnow"
					bundle="${msg}" /></span></a>


		<!-- <a class="lang pull-right" href="<%=request.getContextPath()%>/changeLang?selectLang=EN&action=<%=request.getServletPath()%>"><fmt:message key="header.menu.language" bundle="${msg}" /></a>  -->
		<%
			if ("en".equals(session.getAttribute("language").toString())) {
		%>

		<%
			if (request.getServletPath().equals("/en")) {
		%>
		<a class="lang pull-right" id="anchor-lang"
			href="<%=request.getContextPath()%>/changeLang?selectLang=tc&action=/en/">中文</a>
		<%
			} else {
		%>
		<a class="lang pull-right" id="anchor-lang"
			href="<%=request.getContextPath()%>/changeLang?selectLang=tc&action=<%=request.getServletPath()%>">中文</a>

		<%
			}
			} else {
		%>
		<%
			if (request.getServletPath().equals("/tc")) {
		%>
		<a class="lang pull-right" id="anchor-lang"
			href="<%=request.getContextPath()%>/changeLang?selectLang=en&action=/tc/">EN</a>
		<%
			} else {
		%>
		<a class="lang pull-right" id="anchor-lang"
			href="<%=request.getContextPath()%>/changeLang?selectLang=en&action=<%=request.getServletPath()%>">EN</a>
		<%
			}
		%>

		<%
			}
		%>
		<div class="clearfix"></div>
	</div>
	<div class="logobox">
		<div class="navbar-header" style="overflow: hidden;">
			<button type="button"
				class="navbar-toggle pull-right col-xs-1 col-sm-1"
				data-toggle="offcanvas" data-target=".navmenu" data-canvas="body">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand pull-left col-xs-8 col-sm-8"
				href="<%=request.getContextPath()%>/${language}"><img
				src="<%=request.getContextPath()%>/resources/images/logo.jpg"
				alt="<fmt:message key="logo.alt" bundle="${msg}" />"
				class="img-responsive"></a>
			<div class="clearfix"></div>
		</div>
	</div>
</div>


<!--Mobile side-menu-->
<div class="navmenu navmenu-default navmenu-fixed-right offcanvas"
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
	</ul>
</div>
<!--End Mobile header-->
<!--/header-->
<script>
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
    
	$(document).ready(function() {
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
	$('#myDropdownMob').click(function(e) {
		e.preventDefault();
		e.stopPropagation();
		$(this).toggleClass('open');
	});
</script>
<jsp:include page="/WEB-INF/jsp/merged/iosChromeAlert.jsp" />
<jsp:include page="/WEB-INF/jsp/merged/login.jsp" />