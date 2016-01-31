<%@page pageEncoding="UTF-8" %>
<header class="clearfix">
	<!--Top Header-->
	<nav class="navbar-fixed-top">
		<div class="fwd-container container-fluid clearfix">
			
			
			<div class="row">
				<div class="col-xs-6 col-md-4 header-hotline clearfix">
					<div class="pull-left desktop-add-menu">
						<div class="header-top-menu">
							<ul>
								<li>
									<a class="reset-paddings english-text" href="#">EN</a>
								</li>
								<li class="reset-padding-menu">|</li>
								<li class="top-menu-chinese">
									<a class="reset-paddings" href="#">中文</a>
								</li>
								<li>
									<a href="#" class="chat-img"><img src="assets/images/savie-2016/header-chat.png"></a>
								</li>
								<li>
									<a href="#" class="hr-head">24hr hotline <span class="head-number">3123 3123</span></a>
								</li>
							</ul>
						</div>
					</div>	
				</div>
				<div class="col-xs-6 col-md-8 clear-padding clearfix">
					<div class="pull-right buttons-and-chat hidden-xs hidden-sm">
							<% if(isEservicesActiveClass){%>
								<button type="button" class="btn btn-eServices-my-account">
									MY ACCOUNT
								</button>
							<%}else{%>
								<button type="button" class="btn btn-chinese" data-toggle="modal" data-target="#loginModal" id="login-button">
									<span class="login" >LOGIN <i class="fa fa-caret-right"></i></span>
									<span class="chinese">中文</span>
								</button>
							<%}%>
						
						
							<% if(isEservicesActiveClass){%>
								<button type="button" class="btn btn-eServices-fwd-hk">FWD HK</button>
							<%}else{%>
								<button type="button" class="btn btn-chat">FWD HK</button>
							<%}%>
					</div>
					<div class="pull-left hidden-md hidden-lg mobile-regular">
						<span class="mobile-regular">24-HOUR hotline 3123 3123</span>
					</div>
					<% if(isEservicesActiveClass){%>
						<div class="pull-right notification-menu">
							<div class="dropdown-notification" id="dropdown-notification">
								<button class="btn btn-notify" type="button" id="notificationDropdown" data-toggle="dropdown"><span class="notification"></span></button>
								<div class="arrow-bottom hidden" id="arrow-notification"></div>
								<ul class="dropdown-menu notification" role="menu" aria-labelledby="notificationDropdown">
									<li role="presentation" class="dropdown-header notify">Notifications</li>
									<li role="presentation" class="dropdown-body notifications">
										<a href="eServices-document-upload" class="btn-notifications">
											Please upload your document
											<p class="time">1 hour ago</p>
										</a>
										<div class="divider-notify"></div>
									</li>
									<li role="presentation" class="dropdown-body notifications">
										<a href="eServices-signature" class="btn-notifications">
											Please add your signature
											<p class="time">1 hour ago</p>
										</a>
										<div class="divider-notify"></div>
									</li>
									<li role="presentation" class="dropdown-body notifications">
										<a href="eServices-referral" class="btn-notifications">
											Your received 20% discount in Agoda store.
											<p class="time">11 hour ago</p>
										</a>
										<div class="divider-notify"></div>
									</li>
									<li role="presentation" class="dropdown-body notifications bottom">
										<a href="eServices-personal-info" class="btn-notifications">
											Lorem ipsum dolor sit amet 
											<p class="time">Jun 10 at 7: 41</p>
										</a>
									</li>
								</ul>
							</div>
						</div>
					<%}else{%>
						<!--Display Nothing-->
					<%}%>
					
					<div class="pull-right desktop-add-menu clearfix">
						<div class="header-top-menu">
							<ul>
								<li>
									<a title="Find affordable insurance | FWD Hong Kong" href="https://i.fwd.com.hk/en">HOME</a>
								</li>
							</ul>
						</div>
					</div>
				</div>

				<div class="col-xs-5 hidden-lg hidden-md pull-right clear-padding clearfix text-right mobile-regular">
					<span class="chinese">中文</span>
					<button type="button" class="btn btn-eServices-fwd-hk">FWD HK</button>
				</div>
			</div>
		</div>
	</nav>	
	
	<nav class="navbar-menu">
		<div class="fwd-full-container container-fluid navbar-position">
			<div class="fwd-container-limit clearfix">
				<div class="logo-position"> 
					<a href="/savie-fwd-2016" title="FWD">
						<img src="assets/images/iFWD_logo_200px.jpg" class="img-responsive hidden-sm hidden-xs" title="FWD">
						<!-- <img src="assets/images/savie-2016/mob-fwd-logo.png" class="img-responsive hidden-md hidden-lg" title="FWD"> -->
					</a>
				</div>
				<div class="header-menu hidden-xs hidden-sm">
					<div class="navbar-collapse padding-reset" id="bs-navbar-menu">
						<ul class="navigation">
							<% if (isSaleActiveClass) { %>
							<li class="dropdown full-width active">
							<% } else { %>
							<li class="dropdown full-width">
							<% } %>
								<button type="button" class="dropdown-toggle orange-header-menu" data-toggle="dropdown" role="button" aria-expanded="false" id="save-button">PROTECT</button>
								
								<div class="dropdown-menu max-width" role="menu" aria-labelledby="dropdownMenu">
									<div class="fwd-container container-fluid savie-dropdown">
										<div class="row whole-tab">
											<div class="col-md-9 savie-col savie-items">
												<div class="row">
													<div class="col-md-4 savie-col savie-item">
														<h3>Savie</h3>
														<img src="assets/images/mob-travel/banner1.jpg" class="img-responsive">
														<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.</p>
														<a href="#" type="button" class="btn btn-orange">Learn more</a>
													</div>
												</div>
											</div>
											<div class="col-md-3 savie-col promo-banner">
												<div class="promo-container">
													<!-- <img src="assets/images/promo-banner.jpg" class="img-responsive">
													<a href="#" class="find-more">Find out here <i class="fa fa-play"></i></a> -->
												</div>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="dropdown full-width">
								<button type="button" class="dropdown-toggle orange-header-menu" data-toggle="dropdown" role="button" aria-expanded="false" id="travel-button">SAVE</button>
								<div class="dropdown-menu max-width" role="menu" aria-labelledby="dropdownMenu">
									<div class="fwd-container container-fluid savie-dropdown">
										<div class="row whole-tab">
											<div class="col-md-9 savie-col savie-items">
												<div class="row">
													<div class="col-md-4 savie-col savie-item">
														<h3 title="Get Free Flight Insurance | FWD Hong Kong">FlightCare</h3>
														<img title="Get Free Flight Insurance | FWD Hong Kong" src="assets/images/travel-travelcare.png" class="img-responsive">
														<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.</p>
														<a href="https://i.fwd.com.hk/en/flight-insurance" title="Get Free Flight Insurance | FWD Hong Kong" type="button" class="btn btn-orange">Learn more</a>
													</div>
													<div class="col-md-4 savie-col savie-item">
														<h3 title="Find affordable travel insurance | FWD Hong Kong">TravelCare</h3>
														<img title="Find affordable travel insurance | FWD Hong Kong" src="assets/images/travel-flightcare.png" class="img-responsive">
														<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.</p>
														<a href="https://i.fwd.com.hk/en/travel-insurance" title="Find affordable travel insurance | FWD Hong Kong" type="button" class="btn btn-orange">Learn more</a>
													</div>
													<div class="col-md-4 savie-col savie-item">
														<h3 title="Find Affordable Working Holiday Insurance l FWD Hong Kong">Working HolidayCare</h3>
														<img title="Find Affordable Working Holiday Insurance l FWD Hong Kong" src="assets/images/travel-holidaycare.png" class="img-responsive">
														<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.</p>
														<a href="https://i.fwd.com.hk/en/working-holiday-insurance" title="Find Affordable Working Holiday Insurance l FWD Hong Kong" type="button" class="btn btn-orange">Learn more</a>
													</div>
												</div>
											</div>
											<div class="col-md-3 savie-col promo-banner">
												<div class="promo-container">
													<!-- <img src="assets/images/promo-banner.jpg" class="img-responsive">
													<a href="#" class="find-more">Find out here <i class="fa fa-play"></i></a> -->
												</div>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="dropdown full-width">
								<button type="button" class="dropdown-toggle orange-header-menu" data-toggle="dropdown" role="button" aria-expanded="false" id="home-button">ENJOY</button>
								<div class="dropdown-menu max-width" role="menu" aria-labelledby="dropdownMenu">
									<div class="fwd-container container-fluid savie-dropdown">
										<div class="row whole-tab">
											<div class="col-md-9 savie-col savie-items">
												<div class="row">
													<div class="col-md-4 savie-col savie-item">
														<h3 title="Find affordable home insurance | FWD Hong Kong">HomeCare</h3>
														<img title="Find affordable home insurance | FWD Hong Kong" src="assets/images/homecare-banner.png" class="img-responsive">
														<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.</p>
														<a href="https://i.fwd.com.hk/en/home-insurance" title="Find affordable home insurance | FWD Hong Kong" type="button" class="btn btn-orange">Learn more</a>
													</div>
												</div>
											</div>
											<div class="col-md-3 savie-col promo-banner">
												<div class="promo-container">
													<!-- <img src="assets/images/promo-banner.jpg" class="img-responsive">
													<a href="#" class="find-more">Find out here <i class="fa fa-play"></i></a> -->
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
						<%if(isEservicesActiveClass){%>
								<a class="list-group-item notifications" id="eServices-mobile-notications">Notifications <span class="circle">4</span></a>
						<%}else{%>
								<a href="#login-button-mobile" class="list-group-item login-to-fwd padding-all" data-toggle="collapse" data-parent="#mobileMenu"><img src="assets/images/mobile-lock.png" class="lock">Log in to account</a>
						<%}%>
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
									<button type="submit" class="btn btn-orange btn-login">Log In</button>
									<div class="register">New Member? &nbsp;&nbsp;<a href="#">Register here</a></div>
									<p class="plan-details">For the purpose of purchasing a specified insurance plan through this website (“the Plan”), I hereby consent the transfer of my personal data from FWD eServices to the issuer of the Plan.</p>
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
		
		<!-- <button type="button" class="navbar-toggle shown-sm" data-toggle="offcanvas" data-target="#headerNavmenu" data-canvas="body">
			<!-- <span>Toggle</span> -->
			<!-- <span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<!-- <%if(isEservicesActiveClass){%>
				<span class="red-circle"></span>
			<!-- <%}else{%>
				<!--Display nothing-->
			<!-- <%}%>
			
		</button> -->
		
	</div>
</header>

<!--Login Modal-->
<div class="modal fade login-modal" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false" data-keyboard="false">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">Log in to FWD</h4>
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
						<button type="submit" class="btn btn-orange btn-login" data-dismiss="modal">Log In</button>
					</div>
					<div class="col-md-5 col-xs-5">
						<h5>New Member?</h5>
						<a href="#" data-dismiss="modal">Register here</a>
					</div>					
				</div>
				<p class="plan-details">For the purpose of purchasing a specified insurance plan through this website (“the Plan”), I hereby consent the transfer of my personal data from FWD eServices to the issuer of the Plan.</p>
			</div>
		</div>
	</div>
</div>