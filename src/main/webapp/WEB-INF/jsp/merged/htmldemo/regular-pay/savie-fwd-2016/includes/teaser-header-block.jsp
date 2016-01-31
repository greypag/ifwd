<%@page pageEncoding="UTF-8" %>
<header class="clearfix">
	<!--Top Header-->
	<nav class="navbar-fixed-top teaser-header">
		<div class="fwd-container container-fluid">
			<div class="row">
				<div class="col-xs-6 col-md-4 header-hotline" >
					<p>24-HOUR HOTLINE 3123 3123</p>
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
										<a title="Find affordable insurance | FWD Hong Kong" href="https://i.fwd.com.hk/en">HOME</a>
									</li>
									<li class="reset-padding-menu">|</li>
									<li>
										<a href="https://i.fwd.com.hk/en/about-fwd-insurance">ABOUT</a>
									</li>
									<li class="reset-padding-menu">|</li>
									<li>
										<a title="Become our member | FWD Hong Kong" href="https://i.fwd.com.hk/en/joinus">JOIN US</a>
									</li>
									<li class="reset-padding-menu">|</li>
									<li class="top-menu-chinese">
										<a href="#">中文</a>
									<li>
								</ul>
							</div>
						</div>						
					</div>
				</div>
			</div>
		</div>
	</nav>
	
	
	<nav class="navbar-menu teaser-header">
		<div class="fwd-full-container container-fluid navbar-position">
			<div class="fwd-container-limit clearfix">
				<div class="pull-left logo-position"> 
					<a href="/fwd-savie" title="FWD">
						<img src="assets/images/logo.jpg" class="img-responsive" title="FWD">
					</a>
				</div>
				<div class="pull-right header-menu hidden-xs hidden-sm">					
					<div class="navbar-collapse padding-reset" id="bs-navbar-menu">
						<ul class="navigation">
							<li class="full-width active">
								<a class="orange-header-menu savie-header-menu"><span>LIMITED OFFER</span>Savie <br class="visible-md visible-lg"/>Insurance</a>
							</li>
							<li class="full-width">
								<a class="orange-header-menu flight-header-menu"><span>FREE OFFER</span>Flight <br class="visible-md visible-lg"/>Insurance</a>
							</li>
							<li class="full-width">
								<a class="orange-header-menu holiday-header-menu">Working Holiday <br class="visible-md visible-lg"/>Insurance</a>
							</li>
							<li class="full-width">
								<a class="orange-header-menu travel-header-menu">Travel <br class="visible-md visible-lg"/>Insurance</a>
							</li>
							<li class="full-width">
								<a class="orange-header-menu home-header-menu">Home <br class="visible-md visible-lg"/>Insurance</a>
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
						<a href="#login-button-mobile" class="list-group-item login-to-fwd padding-all" data-toggle="collapse" data-parent="#mobileMenu"><img src="assets/images/mobile-lock.png" class="lock">Log in to account</a>
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
						<a href="#" class="mobile-top-menu teaser-menu"><span><span class="free-offer">LIMITED OFFER</span>Savie Insurance</span></a>
						<a href="#" class="mobile-top-menu teaser-menu"><span><span class="free-offer">FREE OFFER</span>Flight Insurance</span></a>
						<a href="#" class="mobile-top-menu teaser-menu"><span>Working Holiday Insurance</span></a>			
						<a href="#" class="mobile-top-menu teaser-menu"><span>Travel Insurance</span></a>			
						<a href="#" class="mobile-top-menu teaser-menu"><span>Home Insurance</span></a>			
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