<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.UserDetails"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/favicon.ico" />



<header class="clearfix">
	<!--Top Header-->
	<nav class="navbar-fixed-top">
		<div class="fwd-container container-fluid">
			<div class="row">
				<div class="col-xs-6 col-md-4 header-hotline" >
					<p><fmt:message key="header.hotline" bundle="${msg}" /></p>
				</div>
				<div class="col-xs-6 col-md-8 clear-padding">
					<div class="clearfix">
						<div class="pull-right buttons-and-chat">
							<button type="button" class="btn btn-chinese" data-toggle="modal" data-target="#loginModal" id="login-button">
								<span class="chinese">中文</span>
								<span class="login" >LOGIN <i class="fa fa-caret-right"></i></span>
							</button>
							<button type="button" class="btn btn-chat">CHAT NOW</button>
						</div>
						<div class="pull-right desktop-add-menu">
							<div class="header-top-menu">
								<ul class="clearfix">
									<li>
										<a href="<%=request.getContextPath()%>/${language}/home"><fmt:message key="header.menu.home" bundle="${msg}" /></a>
									</li>
									<li class="reset-padding-menu">|</li>
									<li>
										<a href="<fmt:message key="header.menu.about.link" bundle="${msg}" />" target="_blank"><fmt:message key="header.menu.about" bundle="${msg}" /></a>
									</li>
									<li class="reset-padding-menu">|</li>
									<li>
										<a title="Become our member | FWD Hong Kong" href="https://i.fwd.com.hk/en/joinus">JOIN US</a>
									</li>
									<li class="reset-padding-menu">|</li>
									<li>
									<%
									//System.out.println("session.getAttribute(language).toString() " + session.getAttribute("language").toString());
									if ("en".equals(session.getAttribute("language").toString())) {
									%>
										<a id="anchor-lang" href="<%=request.getContextPath()%>/changeLang?selectLang=tc&action=<%=request.getServletPath()%>" onclick="perventRedirect=false;">中文</a>
									<%
									} else {
									%>
										<a id="anchor-lang" href="<%=request.getContextPath()%>/changeLang?selectLang=en&action=<%=request.getServletPath()%>" onclick="perventRedirect=false;">EN</a>
									<%
									}
									
									 %>
									<li>
								</ul>
							</div>
						</div>						
					</div>
				</div>
			</div>
		</div>
	</nav>
	
	
	<nav class="navbar-menu">
		<div class="fwd-full-container container-fluid navbar-position">
			<div class="fwd-container-limit clearfix">
				<div class="pull-left logo-position"> 
					<a href="<%=request.getContextPath()%>" title="FWD">
						<img src="<%=request.getContextPath()%>/resources/images/savie/logo.jpg" class="img-responsive" title="FWD">
					</a>
				</div>
				<div class="pull-right header-menu hidden-xs hidden-sm">					
					<div class="navbar-collapse padding-reset" id="bs-navbar-menu">
						<ul class="navigation">
							<li class="dropdown full-width">
								<button type="button" class="dropdown-toggle orange-header-menu" data-toggle="dropdown" role="button" aria-expanded="false" id="save-button">SAVE</button>
								
								<div class="dropdown-menu max-width" role="menu" aria-labelledby="dropdownMenu">
									<div class="fwd-container container-fluid savie-dropdown">
										<div class="row whole-tab">
											<div class="col-md-9 savie-col savie-items">
												<div class="row">
													<div class="col-md-4 savie-col savie-item">
														<h3>Savie</h3>
														<img src="<%=request.getContextPath()%>/resources/images/savie/savie-banner.png" class="img-responsive">
														<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.</p>
														<a href="#" type="button" class="btn btn-orange">Learn more</a>
													</div>
												</div>
											</div>
											<div class="col-md-3 savie-col promo-banner">
												<div class="promo-container">
													<!-- <img src="<%=request.getContextPath()%>/resources/images/savie/promo-banner.jpg" class="img-responsive">
													<a href="#" class="find-more">Find out here <i class="fa fa-play"></i></a>  -->
												</div>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="dropdown full-width">
								<button type="button" class="dropdown-toggle orange-header-menu" data-toggle="dropdown" role="button" aria-expanded="false" id="travel-button">TRAVEL</button>
								<div class="dropdown-menu max-width" role="menu" aria-labelledby="dropdownMenu">
									<div class="fwd-container container-fluid savie-dropdown">
										<div class="row whole-tab">
											<div class="col-md-9 savie-col savie-items">
												<div class="row">
													<div class="col-md-4 savie-col savie-item">
														<h3 title="Get Free Flight Insurance | FWD Hong Kong">FlightCare</h3>
														<img title="Get Free Flight Insurance | FWD Hong Kong" src="<%=request.getContextPath()%>/resources/images/savie/travel-travelcare.png" class="img-responsive">
														<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.</p>
														<a href="https://i.fwd.com.hk/en/flight-insurance" title="Get Free Flight Insurance | FWD Hong Kong" type="button" class="btn btn-orange">Learn more</a>
													</div>
													<div class="col-md-4 savie-col savie-item">
														<h3 title="Find affordable travel insurance | FWD Hong Kong">TravelCare</h3>
														<img title="Find affordable travel insurance | FWD Hong Kong" src="<%=request.getContextPath()%>/resources/images/savie/travel-flightcare.png" class="img-responsive">
														<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.</p>
														<a href="https://i.fwd.com.hk/en/travel-insurance" title="Find affordable travel insurance | FWD Hong Kong" type="button" class="btn btn-orange">Learn more</a>
													</div>
													<div class="col-md-4 savie-col savie-item">
														<h3 title="Find Affordable Working Holiday Insurance l FWD Hong Kong">Working HolidayCare</h3>
														<img title="Find Affordable Working Holiday Insurance l FWD Hong Kong" src="<%=request.getContextPath()%>/resources/images/savie/travel-holidaycare.png" class="img-responsive">
														<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.</p>
														<a href="https://i.fwd.com.hk/en/working-holiday-insurance" title="Find Affordable Working Holiday Insurance l FWD Hong Kong" type="button" class="btn btn-orange">Learn more</a>
													</div>
												</div>
											</div>
											<div class="col-md-3 savie-col promo-banner">
												<div class="promo-container">
													<!-- <img src="<%=request.getContextPath()%>/resources/images/savie/promo-banner.jpg" class="img-responsive">
													<a href="#" class="find-more">Find out here <i class="fa fa-play"></i></a> -->
												</div>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="dropdown full-width">
								<button type="button" class="dropdown-toggle orange-header-menu" data-toggle="dropdown" role="button" aria-expanded="false" id="home-button">HOME</button>
								<div class="dropdown-menu max-width" role="menu" aria-labelledby="dropdownMenu">
									<div class="fwd-container container-fluid savie-dropdown">
										<div class="row whole-tab">
											<div class="col-md-9 savie-col savie-items">
												<div class="row">
													<div class="col-md-4 savie-col savie-item">
														<h3 title="Find affordable home insurance | FWD Hong Kong">HomeCare</h3>
														<img title="Find affordable home insurance | FWD Hong Kong" src="<%=request.getContextPath()%>/resources/images/savie/homecare-banner.png" class="img-responsive">
														<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.</p>
														<a href="https://i.fwd.com.hk/en/home-insurance" title="Find affordable home insurance | FWD Hong Kong" type="button" class="btn btn-orange">Learn more</a>
													</div>
												</div>
											</div>
											<div class="col-md-3 savie-col promo-banner">
												<div class="promo-container">
													<!-- <img src="<%=request.getContextPath()%>/resources/images/savie/promo-banner.jpg" class="img-responsive">
													<a href="#" class="find-more">Find out here <i class="fa fa-play"></i></a>  -->
												</div>
											</div>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div><!-- /.navbar-collapse -->
					
				</div>
			</div>
		</div>
	</nav>
	
	<!--Mobile Menu-->
	<div class="fwd-full-container container-fluid header-nav-mobile">
		<nav id="headerNavmenu" class="navmenu navmenu-default navmenu-fixed-right offcanvas header-nav-menu-mobile on" role="navigation">
			<div class="right-mobile-menu">

				<div id="mobileMenu" class="mobile-accrdn-list">
					<div class="list-group">
						<a href="#login-button-mobile" class="list-group-item login-to-fwd padding-all" data-toggle="collapse" data-parent="#mobileMenu"><img src="<%=request.getContextPath()%>/resources/images/savie/mobile-lock.png" class="lock">Log in to account</a>
							<div class="collapse login-mobile" id="login-button-mobile">
								<form class="padding-div">
									<div class="form-group">
										<label>Username</label>
										<input class="form-control input-orange" id="username" type="text" placeholder="Username">
										<a title="Forgot Username | FWD Hong Kong" href="https://i.fwd.com.hk/en/forgotUserName">Forgot username?</a>
									</div>
									<div class="form-group">
										<label>Password</label>
										<input class="form-control input-orange" id="username" type="password" placeholder="*****">
										<a title="Forgot Password | FWD Hong Kong" href="https://i.fwd.com.hk/en/forgotPassword" class="border-bottom">Forgot password?</a>
									</div>
									
									<button type="submit" class="btn btn-orange btn-login">Login</button>						
									<div class="register">New user? &nbsp;&nbsp;<a href="#">Register here</a></div>
														
								</form>
							</div>
						<a id="save-mobile-menu" href="#demo1" class="list-group-item mobile-top-menu collapsed" data-toggle="collapse" data-parent="#mobileMenu">SAVE	<i class="arrow-right right" id="arrow-save"></i> 	</a>
						<a id="travel-mobile-menu" href="#travel-mobile-sub-menu" class="list-group-item mobile-top-menu border collapsed" data-toggle="collapse" data-parent="#mobileMenu">TRAVEL	<i class="arrow-right right" id="arrow-travel"></i>	</a>
							<div class="collapse mobile-top-submenu" id="travel-mobile-sub-menu">
								<a href="#" class="list-group-item">FlightCare</a>
								<a href="#" class="list-group-item">TravelCare</a>
								<a href="#" class="list-group-item bb-none">Working HolidayCare</a>
							</div>		
						<a id="home-mobile-menu" href="#demo3" class="list-group-item mobile-top-menu border collapsed" data-toggle="collapse" data-parent="#mobileMenu">HOME	<i class="arrow-right right" id="arrow-home"></i>	</a>			
					</div>
				</div>
				<div class="menu-bottom">
					<div class="clearfix mobile-menu-footer-whole">
						<div class="pull-left social-padding">
							<a href="#" class="change-to-web">Change to Web version</a>
						</div>
						<div class="pull-right ">
							<a href="#">
								<i class="fa fa-facebook  fa-2x"></i>
							</a>
							<a href="#">
								<i class="fa fa-youtube  fa-2x youtube"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
		</nav>
		
		<button type="button" class="navbar-toggle shown-sm" data-toggle="offcanvas" data-target="#headerNavmenu" data-canvas="body">
			<!-- <span>Toggle</span> -->
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		
	</div>
</header>

<!--Login Modal-->
<div class="modal fade login-modal" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false" data-keyboard="false">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">Login to FWD</h4>
			</div>
			<div class="modal-body">
				<form>
					<div class="form-group">
						<div class="clearfix">
							<div class="pull-left">Username</div>
							<div class="pull-right border-bottom">
								<a title="Forgot Username | FWD Hong Kong" href="https://i.fwd.com.hk/en/forgotUserName">Forgot username?</a>
							</div>
						</div>
						<input class="form-control input-orange" id="username" type="text" placeholder="Username">
					</div>
					<div class="form-group">
						<div class="clearfix">
							<div class="pull-left">Password</div>
							<div class="pull-right"><a title="Forgot Password | FWD Hong Kong" href="https://i.fwd.com.hk/en/forgotPassword" class="border-bottom">Forgot password?</a></div>
						</div>
						<input class="form-control input-orange" id="username" type="password" placeholder="*****">
					</div>
				</form>
			</div>
			<div class="modal-footers">
				<div class="row">
					<div class="col-md-5 col-xs-5">
						<button type="submit" class="btn btn-orange btn-login" data-dismiss="modal">Login</button>
					</div>
					<div class="col-md-5 col-xs-5">
							<h5>New user?</h5>
							<a href="#" data-dismiss="modal">Register here</a>
					</div>
				</div>
				<h6>For the purpose of purchasing a specified insurance plan through this website (“the Plan”), I hereby consent the transfer of my personal data from FWD eServices to the issuer of the Plan.</h6>
			</div>
		</div>
	</div>
</div>