<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.UserDetails"%>
<script>
	function submitLoginForm() {
		$('#ajax-loading').show();
		$('#login-err-msg').html("");
		$('#login-err-msg').hide();
		if (validUser()) {
			$.ajax({
				type : "POST",
				url : "userLogin",
				data : $("#headerLoginForm form").serialize(),
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
						$('#login-err-msg').show();
						$('#login-err-msg').html(
								'Please Check Login Credential');
					} else {
						$('#ajax-loading').hide();
						$('#login-err-msg').show();
						$('#login-err-msg').html(data);
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


<!--desktop header-->
<header id="header" class="hidden-xs hidden-sm">
	<div class="top-bar">
		<div class="container ">
			<div class="row">
				<div class="col-lg-5 col-md-5 pad-none">
					<div class="top-number">
						<span class="callus"> 24小時熱線 3123 3123</span>
					</div>
				</div>
				<div class="col-lg-7 col-md-7">
					<div
						class="collapse navbar-collapse navbar-right top-menu pad-none"
						id="headerLoginForm">

						<ul class="nav navbar-nav">
							<li class="active"><a href="<%=request.getContextPath()%>">主頁</a></li>
							<li> | </li>
							<li><a href="indexPage"
								target="_blank">關於我們</a></li>
							<li> | </li>
							<li><a href="joinus">加入我們</a></li>
							<li> | </li>
							<li><a id="anchor-lang" href="changeLang?selectLang=EN&action=<%=request.getServletPath()%>">EN</a></li>
							

							<%
								if (session.getAttribute("authenticate") == null ) {
							%>
							<li class="dropdown login-btn margin-left1" id="myDropdown">
								<a href="#" class="dropdown-toggle" id="fwd-login"
								data-toggle="dropdown">登入  <i class="fa fa-caret-right"></i>
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
												<h2>登入富衛客戶網上服務</h2>
												<h4 class="margin-shift">
													用戶名稱  <a href="forgotUserName"
														class="pull-right sub-link">忘記用戶名稱?</a>
												</h4>

												<div class="form-group">
													<input type="text" name="userName" class="form-control"
														placeholder="" id="headerUserName">
												</div>
												<span id="errUserName" style="color: red"></span>
												<h4 class="margin-shift">
													個人密碼  <a href="forgotPassword"
														class="pull-right sub-link">忘記密碼?</a>
												</h4>
												<div class="form-group">
													<input type="password" name="password" class="form-control"
														id="headerPassword">
												</div>
												<span id="errPass" style="color: red"></span> <br>
												<div class="row">
													<div class="col-lg-6 col-md-6">
														<button type="button" onclick="return submitLoginForm();"
															class="bdr-curve btn btn-primary btn-lg wd5">登入</button>
													</div>
													<h3
														class="text-left col-lg-6 col-md-6 pad-none margin-none">
														<span> 新用戶?</span><br> <a href="joinus">
															 請註冊</a>
													</h3>
													<div class="clearfix"></div>
												</div>
												<p>本人在此同意通過本網站（以下簡稱“計劃”）購買指定保險計劃，將我的個人資料從富衛電子服務轉移到計劃的簽發人。</p>
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
								data-toggle="dropdown">登入 <i class="fa fa-caret-right"></i>
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
												<h2>登入富衛客戶網上服務</h2>
												<h4>
													用戶名稱 <a href="forgotUserName"
														class="pull-right sub-link">忘記用戶名稱?</a>
												</h4>

												<div class="form-group">
													<input type="text" name="userName" class="form-control"
														placeholder="" id="headerUserName">
												</div>
												<span id="errUserName" style="color: red"></span>
												<h4>
													個人密碼 <a href="forgotPassword"
														class="pull-right sub-link">忘記密碼?</a>
												</h4>
												<div class="form-group">
													<input type="password" name="password" class="form-control"
														id="headerPassword">
												</div>
												<span id="errPass" style="color: red"></span> <br>
												<div class="row">
													<div class="col-lg-6 col-md-6">
														<button type="button" onclick="return submitLoginForm();"
															class="bdr-curve btn btn-primary btn-lg wd5">登入</button>
													</div>
													<h3
														class="text-left col-lg-6 col-md-6 pad-none margin-none">
														<span> 新用戶?</span><br> <a href="joinus">
															 請註冊</a>
													</h3>
													<div class="clearfix"></div>
												</div>
												<p>本人在此同意通過本網站（以下簡稱“計劃”）購買指定保險計劃，將我的個人資料從富衛電子服務轉移到計劃的簽發人。</p>
											</div>
										</div>
									</form>
								</div>
							</li>
								
								<%
								}else{%>
									<li class="dropdown logout-btn margin-left1" id="myDropdown">
								<a href="#" class="dropdown-toggle" id="fwd-login"
								data-toggle="dropdown">歡迎 <%=session.getAttribute("username")%> <i
									class="fa fa-caret-right"></i>
							</a>
								<div class="dropdown-menu drop-width">
									<ul>
									<% if(!"direct".equalsIgnoreCase(request.getSession()
											.getAttribute("authenticate").toString())){ %>
										<li><a href="getAccByUsernaneAndPassword" class="color1">
												富衛會員帳戶</a></li>
												<%} %>
										<li><a href="userLogout" class="color1">登出</a></li>
									</ul>
								</div>
							</li>
								<% }
							%>

							<li class="chatnow-btn"><a href="#"
								onClick="zopim_chat_start()">即時對話</a></li>
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
       <li class="col-lg-4 col-md-4 pad-none main-tab <% if(actionName.equals("Flight")){ %> active <%} %>"><a href="flight" class="travel-special"><span class="offer"> SPECIAL OFFER</span><br> 航空保險 </a></li>
      <li class="col-lg-4 col-md-4 pad-none main-tab <% if(actionName.equals("Travel")){ %> active <%} %>"><a href="travel" class="travel-and-home-tab">旅遊保險</a> </li>
      <li class="col-lg-4 col-md-4 pad-none main-tab <% if(actionName.equals("homecare")){ %> active <%} %>"><a class="travel-and-home-tab text-left latter-space-1"   href="homecare">家居保險</a> </li>
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
		<span class="callus top-number"> &nbsp&nbsp&nbsp&nbsp 24小時熱線 3123 3123  </span> <a href="#"
			onClick="zopim_chat_start()"><span class="chat pull-right">即時對話</span></a> 
			<a class="lang pull-right" href="changeLang?selectLang=EN&action=<%=request.getServletPath()%>">EN</a>
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
			<a class="navbar-brand pull-left col-xs-8 col-sm-8" href="indexPage"><img
				src="resources/images/logo.jpg" alt="logo" class="img-responsive"></a>
			<div class="clearfix"></div>
		</div>
	</div>
</div>

<!--Mobile side-menu-->
<div class="navmenu navmenu-default navmenu-fixed-right offcanvas"
	style="">
	<div class="dropdown login-btn btn btn-lg wd2" id="myDropdownMob">
		<!--  <button type="button" onclick="return submitLoginForm();"
			class="dropdown-toggle color-wht log-to-acc"></button> -->
		<a href="#" class="dropdown-toggle color-wht log-to-acc" id="fwd-login-mob" data-toggle="dropdown"><i class="fa fa-lock"></i> 登入 </a>
		<div class="dropdown-menu full-width">
			<div class="moblogin">
				<div class="form-container">
					<h2>登入富衛客戶網上服務</h2>
					<h4 class="margin-shift clearfix">
						<span class="pull-left login-padding">用戶名稱</span> <a href="forgotUserName" class="pull-right sub-link">忘記用戶名稱?</a>
					</h4>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="">
					</div>
					<h4 class="margin-shift clearfix">
						<span class="pull-left login-padding">個人密碼 </span><a href="forgotPassword" class="pull-right sub-link">忘記密碼?</a>
					</h4>
					<div class="form-group">
						<input type="text" class="form-control">
					</div>
					<br>
					<div class="row">
						<div class="col-xs-6 col-sm-6">

							<a class="bdr-curve btn btn-primary btn-lg wd5"
								href="#" onclick="return validUser()"> 登入 </a>
						</div>
						<h3 class="text-left col-xs-6 col-sm-6 pad-none margin-none">
							<span> 新會員？</span><br> <a href="joinus"> 請註冊</a>
						</h3>
						<div class="clearfix"></div>
					</div>
					<p>本人在此同意通過本網站（以下簡稱“計劃”）購買指定保險計劃，將我的個人資料從富衛電子服務轉移到計劃的簽發人。</p>
				</div>
			</div>
		</div>
	</div>
							
	<ul class="nav navmenu-nav sidepanel-menu">
		<li><a href="indexPage">Home</a></li>
		<li class="<% if(actionName.equals("Flight")){ %> active" <%} %>"><span class="offer"> SPECIAL OFFER</span> <a
			href="flight">航空保險</a></li>
		<li class="<% if(actionName.equals("Travel")){ %> active" <%} %>"><a href="travel">旅遊保險</a></li>
		<li class="<% if(actionName.equals("homecare")){ %> active" <%} %>"><a href="homecare">家居保險</a></li>
	</ul>
</div>
<!--End Mobile header-->
<!--/header-->
