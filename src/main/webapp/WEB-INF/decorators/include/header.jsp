<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.UserDetails"%>
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
	
	function changeLang(){
		var language = $('#selectLang').val();
		if(language == "EN"){

			$('#selectLang').val('CN');
			$('#anchor-lang').html('中文');
			document.changeLang.action ="changeLang";			
		}
		if(language == "CN"){

			$('#selectLang').val('EN');
			$('#anchor-lang').html('ENG');
			document.changeLang.action ="changeLang";
		} 
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
						<span> 24-HOUR HOTLINE 3123 3123</span>
					</div>
				</div>
				<form name="changeLang">
				<input type="hidden" id="selectLang" name="selectLang" value="EN">
				</form>
				<div class="col-lg-7 col-md-7">
					<div
						class="collapse navbar-collapse navbar-right top-menu pad-none"
						id="headerLoginForm">

						<ul class="nav navbar-nav">
							<li class="active"><a href="home">HOME</a></li>
							<li> | </li>
							<li><a href="http://www.fwd.com.hk/en-US/about/index.html"
								target="_blank">ABOUT</a></li>
							<li> | </li>
							<li><a href="joinus">JOIN US</a></li>
							<li> | </li>
							
							<li><a id="anchor-lang" href="changeLang?selectLang=CN&action=<%=request.getServletPath()%>">中文</a></li>
							<%
								if (session.getAttribute("authenticate") == null ) {
							%>
							<li class="dropdown login-btn margin-left1" id="myDropdown">
								<a href="#" class="dropdown-toggle" id="fwd-login"
								data-toggle="dropdown">LOGIN <i class="fa fa-caret-right"></i>
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
												<h2>Log in to FWD</h2>
												<h4 class="margin-shift">
													Username <a href="forgotUserName"
														class="pull-right sub-link">Forgot username?</a>
												</h4>

												<div class="form-group">
													<input type="text" name="userName" class="form-control"
														placeholder="" id="headerUserName">
												</div>
												<span id="errUserName" style="color: red"></span>
												<h4 class="margin-shift">
													Password <a href="forgotPassword"
														class="pull-right sub-link">Forgot password?</a>
												</h4>
												<div class="form-group">
													<input type="password" name="password" class="form-control"
														id="headerPassword">
												</div>
												<span id="errPass" style="color: red"></span> <br>
												<div class="row">
													<div class="col-lg-6 col-md-6">
														<button type="button" onclick="return submitLoginForm('loginform');"
															class="bdr-curve btn btn-primary btn-lg wd5">Log
															In</button>
													</div>
													<h3
														class="text-left col-lg-6 col-md-6 pad-none margin-none">
														<span> New Member?</span><br> <a href="joinus">
															Register here</a>
													</h3>
													<div class="clearfix"></div>
												</div>
												<p>For the purpose of purchasing a specified insurance
													plan through this website (“the Plan”), I hereby consent
													the transfer of my personal data from FWD eServices to the
													issuer of the Plan.</p>
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
								data-toggle="dropdown">LOGIN <i class="fa fa-caret-right"></i>
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
												<h2>Log in to FWD</h2>
												<h4>
													Username <a href="forgotUserName"
														class="pull-right sub-link">Forgot username?</a>
												</h4>

												<div class="form-group">
													<input type="text" name="userName" class="form-control"
														placeholder="" id="headerUserName">
												</div>
												<span id="errUserName" style="color: red"></span>
												<h4>
													Password <a href="forgotPassword"
														class="pull-right sub-link">Forgot password?</a>
												</h4>
												<div class="form-group">
													<input type="password" name="password" class="form-control"
														id="headerPassword">
												</div>
												<span id="errPass" style="color: red"></span> <br>
												<div class="row">
													<div class="col-lg-6 col-md-6">
														<button type="button" onclick="return submitLoginForm(loginform);"
															class="bdr-curve btn btn-primary btn-lg wd5">Log
															In</button>
													</div>
													<h3
														class="text-left col-lg-6 col-md-6 pad-none margin-none">
														<span> New Member?</span><br> <a href="joinus">
															Register here</a>
													</h3>
													<div class="clearfix"></div>
												</div>
												<p>For the purpose of purchasing a specified insurance
													plan through this website (“the Plan”), I hereby consent
													the transfer of my personal data from FWD eServices to the
													issuer of the Plan.</p>
											</div>
										</div>
									</form>
								</div>
							</li>
								
								<%
								}else{%>
									<li class="dropdown logout-btn margin-left1" id="myDropdown">
								<a href="#" class="dropdown-toggle" id="fwd-login"
								data-toggle="dropdown">Welcome <%=session.getAttribute("username")%> <i
									class="fa fa-caret-right"></i>
							</a>
								<div class="dropdown-menu drop-width">
									<ul>
									<% if(!"direct".equalsIgnoreCase(request.getSession()
											.getAttribute("authenticate").toString())){ %>
										<li><a href="getAccByUsernaneAndPassword" class="color1">
												Manage FWD Member Account</a></li>
												<%} %>
										<li><a href="userLogout" class="color1">Log Out</a></li>
									</ul>
								</div>
							</li>
								<% }
							%>

							<li class="chatnow-btn"><a href="#"
								onClick="zopim_chat_start()">CHAT NOW</a></li>
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
				<a class="navbar-brand" href="home"><img
					src="resources/images/logo.jpg" alt="logo"></a>
			</div>
			<div class="col-lg-6 col-md-6 pull-right">
				<ul class="maintabs">
					<li class="col-lg-4 col-md-4 pad-none main-tab <% if(actionName.equals("Flight")){ %> active" <%} %>"><a
						href="flight" class="travel-special"><span class="offer">Special Offer</span><br>Flight
							<br>Insurance </a></li>
					<li class="col-lg-4 col-md-4 pad-none main-tab <% if(actionName.equals("Travel")){ %> active" <%} %>"><a
						href="travel" class="travel-and-home-tab"> Travel<br> Insurance</a></li>
					<li class="col-lg-4 col-md-4 pad-none main-tab <% if(actionName.equals("Homecare")){ %> active" <%} %>"><a
						class="travel-and-home-tab" href="homecare"> Home <br> <span
							class="Insurance">Insurance</span></a></li>
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
		<span class="callus">24-HOUR HOTLINE 3123 3123 </span> <a href="#"
			onClick="zopim_chat_start()"><span class="chat pull-right">Chat
				Now</span></a> <a href="changeLang?selectLang=CN&action=<%=request.getServletPath()%>" class="lang pull-right">中文</a>
		<div class="clearfix"></div>
	</div>
	<div class="logobox">
		<div class="navbar-header">
			<button type="button"
				class="navbar-toggle pull-right col-xs-2 col-sm-2"
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
		<a href="#" class="dropdown-toggle color-wht log-to-acc" id="fwd-login-mob"  data-toggle="dropdown"><i class="fa fa-lock"></i> Log in to account  </a>
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
												<h2>Log in to FWD</h2>
												<h4 class="margin-shift">Username <a href="forgotUserName"
														class="pull-right sub-link">Forgot username?</a>
												</h4>

												<div class="form-group">
													<input type="text" name="userName" class="form-control"
														placeholder="" id="headerUserName">
												</div>
												<span id="errUserName" style="color: red"></span>
												<h4 class="margin-shift">Password <a href="forgotPassword"
														class="pull-right sub-link">Forgot password?</a>
												</h4>
												<div class="form-group">
													<input type="password" name="password" class="form-control"
														id="headerPassword">
												</div>
												<span id="errPass" style="color: red"></span> <br>
												<div class="row">
													<div class="col-lg-6 col-md-6 col-xs-6">
														<button type="button" onclick="return submitLoginForm('loginform2');"
															class="bdr-curve btn btn-primary btn-lg wd5">Log
															In</button>
													</div>
													<h3 class="text-left col-lg-6 col-md-6  col-xs-6 pad-none margin-none">
														<span> New Member?</span><br> <a href="joinus">
															Register here</a>
													</h3>
													<div class="clearfix"></div>
												</div>
												
											</div>
										</div>
									</form>
								</div>
		
		<% }else{ %>
		
			<a href="#" class="dropdown-toggle" id="fwd-login"
								data-toggle="dropdown">Welcome <%=session.getAttribute("username")%> <i
									class="fa fa-caret-right"></i>
							</a>
								<div class="dropdown-menu drop-width">
									<ul>
									<% if(!"direct".equalsIgnoreCase(request.getSession()
											.getAttribute("authenticate").toString())){ %>
										<li><a href="getAccByUsernaneAndPassword" class="color1">
												Manage FWD Member Account</a></li>
												<%} %>
										<li><a href="userLogout" class="color1">Log Out</a></li>
									</ul>
								</div>
		
		
		<% } %>
		<!--  <a href="#" class="dropdown-toggle color-wht log-to-acc" id="fwd-login-mob"  data-toggle="dropdown"><i class="fa fa-lock"></i> Log in to account  </a>

		<div class="dropdown-menu full-width">
			<div class="moblogin">
						<div class="form-container text-left">


							
							<h4 class="margin-shift clearfix"><span class="pull-left login-padding">Username or email</span>
								<a href="forgotUserName" class="pull-right sub-link">Forgot username?</a>
							</h4>


							<div class="form-group">
								<input type="text" class="form-control" placeholder="">
							</div>
							<div class="clearfix"></div>

							
							<h4 class="margin-shift clearfix"><span class="pull-left login-padding">Password</span>
								<a href="forgotPassword" class="pull-right sub-link">Forgot password?</a>
							</h4>

							<div class="form-group">
								<input type="text"  type="password" class="form-control">
							</div>
							<br>

							<div class="col-xs-5 col-sm-5 pad-none">


								<a class="bdr-curve btn btn-primary btn-lg btn-block" href="#" onclick="return validUser()"> Log In </a>
							</div>
							<h3 class="text-left col-xs-7 col-sm-7 margin-none"> <span> New Member?</span><br>
								<a href="joinus"> Register here</a> 

							</h3>
							<div class="clearfix"></div>
							
							<div class="clearfix"></div>
							
						</div>
						<div class="clearfix"></div>



			</div>
		</div>-->
	</div>
	
	
	
	
	
	
	
	
							
	<ul class="nav navmenu-nav sidepanel-menu">
		<li><a href="home">Home</a></li>
		<li class="<% if(actionName.equals("Flight")){ %> active" <%} %>"><span class="offer"> SPECIAL OFFER</span> <a
			href="flight">Flight Insurance</a></li>
		<li class="<% if(actionName.equals("Travel")){ %> active" <%} %>"><a href="travel">Travel Insurance</a></li>
		<li class="<% if(actionName.equals("Homecare")){ %> active" <%} %>"><a href="homecare">Home Insurance</a></li>
	</ul>
</div>
<!--End Mobile header-->
<!--/header-->
