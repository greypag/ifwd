<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.UserDetails"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<script>
function submitLoginForm(formID) {
	
	$('#ajax-loading').show();
	$('#login-err-msg').html("");
	$('#login-err-msg').hide();
	if (validUser(formID)) {
		$.ajax({
			type : "POST",
			url : "userLogin",
			data : $("#"+formID).serialize(),//$("#headerLoginForm form").serialize(),
			async : false,
			success : function(data) {
				$('#ajax-loading').hide();
				if (data == 'success') {
					$('#ajax-loading').hide();
					var Backlen = history.length;
					history.go(-Backlen);
					window.location.href = "getAccByUsernaneAndPassword";
				} else if (data == 'fail') {
					$('#ajax-loading').hide();
					$("#"+formID+' #login-err-msg').show();
					$("#"+formID+' #login-err-msg').html('Please Check Login Credential');
				} else {
					$('#ajax-loading').hide();
					$("#"+formID+' #login-err-msg').show();
					$("#"+formID+' #login-err-msg').html(data);
				}

			},
			error : function() {
				$('#ajax-loading').hide();
			}
		});
	}
	$('#ajax-loading').hide();
	return false;
}
</script>

<!-- Session is alive or not -->
<%
	session = request.getSession();
	UserDetails user = new UserDetails();
	if (session.getAttribute("userDetails") != null) {
		user = (UserDetails) session.getAttribute("userDetails");
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

<!--desktop header-->
<header id="header" class="hidden-xs hidden-sm">
	<div class="top-bar">
		<div class="container ">
			<div class="row">
				<div class="col-lg-5 col-md-5 pad-none">
					<div class="top-number">
						<span class="callus"> <fmt:message key="header.hotline" bundle="${msg}" /></span>
					</div>
				</div>
				<div class="col-lg-7 col-md-7">
					<div
						class="collapse navbar-collapse navbar-right top-menu pad-none"
						id="headerLoginForm">

						<ul class="nav navbar-nav">
							<li class="active"><a href="<%=request.getContextPath()%>"><fmt:message key="header.menu.home" bundle="${msg}" /></a></li>
							<li> | </li>
							<li><a href="home"
								target="_blank"><fmt:message key="header.menu.about" bundle="${msg}" /></a></li>
							<li> | </li>
							<li><a href="joinus"><fmt:message key="header.menu.join" bundle="${msg}" /></a></li>
							<li> | </li>
							<li>
							<%
							if ("EN".equals(session.getAttribute("language").toString())) {
							%>
								<a id="anchor-lang" href="changeLang?selectLang=CN&action=<%=request.getServletPath()%>">中文</a>
							<%
							} else {
							%>
								<a id="anchor-lang" href="changeLang?selectLang=EN&action=<%=request.getServletPath()%>">EN</a>
							<%
							}
							
							 %>
							 </li>
							<%
								if (session.getAttribute("authenticate") == null ) {
							%>
							<li class="dropdown login-btn margin-left1" id="myDropdown">
								<a href="#" class="dropdown-toggle" id="fwd-login"
								data-toggle="dropdown"><fmt:message key="header.menu.login" bundle="${msg}" />  <i class="fa fa-caret-right"></i>
							</a>
								<div class="dropdown-menu drop-width">
									<form name="loginform" id="loginform">
										<div class="login-form">
											<div
												style="display: none; position: absolute; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1000"
												id="ajax-loading">
												<img
													style="width: 100px; height: 100px; position: absolute; top: 40%; left: 40%"
													src="resources/images/ajax-loader.gif">
											</div>
											<div id="login-err-msg" class="alert alert-danger"
												role="alert" style="display: none;"></div>
											<div class="form-container">
												<h2><fmt:message key="header.login.heading" bundle="${msg}" /></h2>
												<h4 class="margin-shift">
													<fmt:message key="header.login.username" bundle="${msg}" />  <a href="forgotUserName"
														class="pull-right sub-link"><fmt:message key="header.login.username.forget" bundle="${msg}" /></a>
												</h4>

												<div class="form-group">
													<input type="text" name="userName" class="form-control"
														placeholder="" id="headerUserName">
												</div>
												<span id="errUserName" style="color: red"></span>
												<h4 class="margin-shift">
													<fmt:message key="header.login.password" bundle="${msg}" />  <a href="forgotPassword"
														class="pull-right sub-link"><fmt:message key="header.login.password.forget" bundle="${msg}" /></a>
												</h4>
												<div class="form-group">
													<input type="password" name="password" class="form-control"
														id="headerPassword">
												</div>
												<span id="errPass" style="color: red"></span> <br>
												<div class="row">
													<div class="col-lg-6 col-md-6">
														<button type="button" onclick="return submitLoginForm('loginform');"
															class="bdr-curve btn btn-primary btn-lg wd5"><fmt:message key="header.login.action" bundle="${msg}" /></button>
													</div>
													<h3
														class="text-left col-lg-6 col-md-6 pad-none margin-none">
														<span> <fmt:message key="header.login.registration.heading" bundle="${msg}" /></span><br> <a href="joinus">
															 <fmt:message key="header.login.registration.action" bundle="${msg}" /></a>
													</h3>
													<div class="clearfix"></div>
												</div>
												<p><fmt:message key="header.login.disclaimer" bundle="${msg}" /></p>
											</div>
										</div>
									</form>
								</div>
							</li>
							<%
							}else if(!"true".equals(session
									.getAttribute("authenticate").toString())){
								%>
								<li class="dropdown login-btn margin-left1" id="myDropdown">
								<a href="#" class="dropdown-toggle" id="fwd-login"
								data-toggle="dropdown"><fmt:message key="header.menu.login" bundle="${msg}" /> <i class="fa fa-caret-right"></i>
							</a>
								<div class="dropdown-menu drop-width">
									<form name="loginform" id="loginform">
										<div class="login-form">
											<div
												style="display: none; position: absolute; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1000"
												id="ajax-loading">
												<img
													style="width: 100px; height: 100px; position: absolute; top: 40%; left: 40%"
													src="resources/images/ajax-loader.gif">
											</div>
											<div id="login-err-msg" class="alert alert-danger"
												role="alert" style="display: none;"></div>
											<div class="form-container">
												<h2><fmt:message key="header.login.heading" bundle="${msg}" /></h2>
												<h4>
													<fmt:message key="header.login.username" bundle="${msg}" />稱 <a href="forgotUserName"
														class="pull-right sub-link"><fmt:message key="header.login.username.forget" bundle="${msg}" /></a>
												</h4>

												<div class="form-group">
													<input type="text" name="userName" class="form-control"
														placeholder="" id="headerUserName">
												</div>
												<span id="errUserName" style="color: red"></span>
												<h4>
													<fmt:message key="header.login.password" bundle="${msg}" /> <a href="forgotPassword"
														class="pull-right sub-link"><fmt:message key="header.login.password.forget" bundle="${msg}" /></a>
												</h4>
												<div class="form-group">
													<input type="password" name="password" class="form-control"
														id="headerPassword">
												</div>
												<span id="errPass" style="color: red"></span> <br>
												<div class="row">
													<div class="col-lg-6 col-md-6">
														<button type="button" onclick="return submitLoginForm('loginform');"
															class="bdr-curve btn btn-primary btn-lg wd5"><fmt:message key="header.login.action" bundle="${msg}" /></button>
													</div>
													<h3
														class="text-left col-lg-6 col-md-6 pad-none margin-none">
														<span> <fmt:message key="header.login.registration.heading" bundle="${msg}" /></span><br> <a href="joinus">
															 <fmt:message key="header.login.registration.action" bundle="${msg}" /></a>
													</h3>
													<div class="clearfix"></div>
												</div>
												<p><fmt:message key="header.login.disclaimer" bundle="${msg}" /></p>
											</div>
										</div>
									</form>
								</div>
							</li>
								
								<%
								}else{%>
									<li class="dropdown logout-btn margin-left1" id="myDropdown">
								<a href="#" class="dropdown-toggle" id="fwd-login"
								data-toggle="dropdown"><fmt:message key="header.login.welcome" bundle="${msg}" /> <%=session.getAttribute("username")%> <i
									class="fa fa-caret-right"></i>
							</a>
								<div class="dropdown-menu drop-width">
									<ul>
									<% if(!"direct".equalsIgnoreCase(request.getSession()
											.getAttribute("authenticate").toString())){ %>
										<li><a href="getAccByUsernaneAndPassword" class="color1">
												<fmt:message key="header.menu.member" bundle="${msg}" /></a></li>
												<%} %>
										<li><a href="userLogout" class="color1"><fmt:message key="header.menu.logout" bundle="${msg}" /></a></li>
									</ul>
								</div>
							</li>
								<% }
							%>

							<li class="chatnow-btn"><a href="#"
								onClick="zopim_chat_start()"><fmt:message key="header.menu.chatnow" bundle="${msg}" /></a></li>
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
	if(request.getAttribute("controller")!=null){
		actionName =  request.getAttribute("controller").toString();
	}
	
	%>

	<nav class="navbar navbar-inverse">
		<div class="container pad-none">
			<div class="navbar-header">
				<a class="navbar-brand" href="<%=request.getContextPath()%>"><img
					src="resources/images/logo.jpg" alt="logo"></a>
			</div>
			<div class="col-lg-6 col-md-6 pull-right">
				
				<ul class="maintabs">
       <li class="col-lg-4 col-md-4 pad-none main-tab <% if(actionName.equals("Flight")){ %> active <%} %>"><a href="flight" class="travel-special"><span class="offer"> SPECIAL OFFER</span><br> <fmt:message key="header.product.flight" bundle="${msg}" /> </a></li>
      <li class="col-lg-4 col-md-4 pad-none main-tab <% if(actionName.equals("Travel")){ %> active <%} %>"><a href="travel" class="travel-and-home-tab"><fmt:message key="header.product.travel" bundle="${msg}" /></a> </li>
      <li class="col-lg-4 col-md-4 pad-none main-tab <% if(actionName.equals("Homecare")){ %> active <%} %>"><a class="travel-and-home-tab text-left"   href="homecare"><fmt:message key="header.product.home" bundle="${msg}" /></a> </li>
      </ul>
				
			</div>
		</div>
		<!--/.container-->
	</nav>
	<!--/nav-->

</header>
<!--End-Desktop-header-->

<!--Mobile-header-->
<div class="mob-header hidden-lg hidden-md pad-none">
	<div class="mob-topbar">
		<span class="callus top-number"> &nbsp&nbsp&nbsp&nbsp <fmt:message key="header.hotline" bundle="${msg}" />  </span> <a href="#"
			onClick="zopim_chat_start()"><span class="chat pull-right"><fmt:message key="header.menu.chatnow" bundle="${msg}" />話</span></a> 
			<a class="lang pull-right" href="changeLang?selectLang=EN&action=<%=request.getServletPath()%>"><fmt:message key="header.menu.language" bundle="${msg}" /></a>
		<div class="clearfix"></div>
	</div>
	<div class="logobox">
		<div class="navbar-header">
			<button type="button"
				class="navbar-toggle pull-right col-xs-1 col-sm-1"
				data-toggle="offcanvas" data-target=".navmenu" data-canvas="body">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand pull-left col-xs-8 col-sm-8" href="home"><img
				src="resources/images/logo.jpg" alt="logo" class="img-responsive"></a>
			<div class="clearfix"></div>
		</div>
	</div>
</div>

<!--Mobile side-menu-->
<div class="navmenu navmenu-default navmenu-fixed-right offcanvas"
	style="">
	<div class="dropdown login-btn btn btn-lg wd2" id="myDropdownMob">
		
		<% if (session.getAttribute("authenticate") == null || !"true".equals(session.getAttribute("authenticate").toString())) { %>
		<a href="#" class="dropdown-toggle color-wht log-to-acc" id="fwd-login-mob"  data-toggle="dropdown"><i class="fa fa-lock"></i> ç™»å…¥  </a>
		<div class="dropdown-menu drop-width">
									<form name="loginform" id="loginform2">
										<div class="login-form">
											<div
												style="display: none; position: absolute; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1000"
												id="ajax-loading">
												<img
													style="width: 100px; height: 100px; position: absolute; top: 40%; left: 40%"
													src="resources/images/ajax-loader.gif">
											</div>
											<div id="login-err-msg" class="alert alert-danger col-xs-10 col-xs-offset-1 " role="alert" style="display: none;"></div>
											<div class="form-container">
												<h2><fmt:message key="header.login.heading" bundle="${msg}" /></h2>
												<h4 class="margin-shift"><fmt:message key="header.login.username" bundle="${msg}" /> <a href="forgotUserName"
														class="pull-right sub-link"><fmt:message key="header.login.username.forget" bundle="${msg}" /></a>
												</h4>

												<div class="form-group">
													<input type="text" name="userName" class="form-control"
														placeholder="" id="headerUserName">
												</div>
												<span id="errUserName" style="color: red"></span>
												<h4 class="margin-shift"><fmt:message key="header.login.password" bundle="${msg}" /> <a href="forgotPassword"
														class="pull-right sub-link"><fmt:message key="header.login.password.forget" bundle="${msg}" /></a>
												</h4>
												<div class="form-group">
													<input type="password" name="password" class="form-control"
														id="headerPassword">
												</div>
												<span id="errPass" style="color: red"></span> <br>
												<div class="row">
													<div class="col-lg-6 col-md-6 col-xs-6">
														<button type="button" onclick="return submitLoginForm('loginform2');"
															class="bdr-curve btn btn-primary btn-lg wd5"><fmt:message key="header.login.action" bundle="${msg}" /></button>
													</div>
													<h3 class="text-left col-lg-6 col-md-6  col-xs-6 pad-none margin-none">
														<span> <fmt:message key="header.login.registration.heading" bundle="${msg}" /></span><br> <a href="joinus">
															<fmt:message key="header.login.registration.action" bundle="${msg}" /></a>
													</h3>
													<div class="clearfix"></div>
												</div>
												
											</div>
										</div>
									</form>
								</div>
		
		<% }else{ %>
		
			<a href="#" class="dropdown-toggle" id="fwd-login"
								data-toggle="dropdown"><fmt:message key="header.login.welcome" bundle="${msg}" /> <%=session.getAttribute("username")%> <i
									class="fa fa-caret-right"></i>
							</a>
								<div class="dropdown-menu drop-width">
									<ul>
									<% if(!"direct".equalsIgnoreCase(request.getSession()
											.getAttribute("authenticate").toString())){ %>
										<li><a href="getAccByUsernaneAndPassword" class="color1">
												<fmt:message key="header.menu.member" bundle="${msg}" /></a></li>
												<%} %>
										<li><a href="userLogout" class="color1"><fmt:message key="header.menu.logout" bundle="${msg}" /></a></li>
									</ul>
								</div>
		
		
		<% } %>
		
		
		
		
		<!-- <a href="#" class="dropdown-toggle color-wht log-to-acc" id="fwd-login-mob" data-toggle="dropdown"><i class="fa fa-lock"></i> 登入 </a>
		<div class="dropdown-menu full-width">
			<div class="moblogin">
				<div class="form-container">
					<h2>ç™»å…¥å¯Œè¡›å®¢æˆ¶ç¶²ä¸Šæœå‹™</h2>
					<h4 class="margin-shift clearfix">
						<span class="pull-left login-padding">ç”¨æˆ¶åç¨±</span> <a href="forgotUserName" class="pull-right sub-link">忘記用戶名稱?</a>
					</h4>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="">
					</div>
					<h4 class="margin-shift clearfix">
						<span class="pull-left login-padding">å€‹äººå¯†ç¢¼ </span><a href="forgotPassword" class="pull-right sub-link">忘記密碼?</a>
					</h4>
					<div class="form-group">
						<input type="text" class="form-control">
					</div>
					<br>
					<div class="row">
						<div class="col-xs-6 col-sm-6">

							<a class="bdr-curve btn btn-primary btn-lg wd5"
								href="#" onclick="return validUser()"> ç™»å…¥ </a>
						</div>
						<h3 class="text-left col-xs-6 col-sm-6 pad-none margin-none">
							<span> 新會員？</span><br> <a href="joinus"> è«‹è¨»å†Š</a>
						</h3>
						<div class="clearfix"></div>
					</div>
					<p>æœ¬äººåœ¨æ­¤åŒæ„é€šéŽæœ¬ç¶²ç«™ï¼ˆä»¥ä¸‹ç°¡ç¨±â€œè¨ˆåŠƒâ€ï¼‰è³¼è²·æŒ‡å®šä¿éšªè¨ˆåŠƒï¼Œå°‡æˆ‘çš„å€‹äººè³‡æ–™å¾žå¯Œè¡›é›»å­æœå‹™è½‰ç§»åˆ°è¨ˆåŠƒçš„ç°½ç™¼äººã€‚</p>
				</div>
			</div>
		</div> -->
	</div>
							
	<ul class="nav navmenu-nav sidepanel-menu">
		<li><a href="home"><fmt:message key="header.menu.home" bundle="${msg}" /></a></li>
		<li class="<% if(actionName.equals("Flight")){ %> active" <%} %>"><span class="offer"> SPECIAL OFFER</span> <a
			href="flight"><fmt:message key="header.product.flight" bundle="${msg}" /></a></li>
		<li class="<% if(actionName.equals("Travel")){ %> active" <%} %>"><a href="travel"><fmt:message key="header.product.travel" bundle="${msg}" /></a></li>
		<li class="<% if(actionName.equals("homecare")){ %> active" <%} %>"><a href="homecare"><fmt:message key="header.product.home" bundle="${msg}" /></a></li>
	</ul>
</div>
<!--End Mobile header-->
<!--/header-->
