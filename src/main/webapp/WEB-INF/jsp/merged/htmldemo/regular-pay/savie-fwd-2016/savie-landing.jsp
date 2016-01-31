<%@page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<%@include file="includes/head.jsp" %>
      
		<meta name="apple-mobile-web-app-capable" content="yes" />
	</head>
	<body>
		<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper savie-orange-header">			
			<%@include file="includes/header-block-two.jsp" %>

			<div class="fwd-container container-fluid breadcrumbs savie-regular-pay-breadcrumbs no-margin">
	            <div class="breadcrumb-container">
	               <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
	                  <li><a href="#">Home</a></li>
	                  <li class="divider"><i class="fa fa-angle-right"></i></li>
	                  <li><a href="#">Save </a></li>
	                  <li class="divider"><i class="fa fa-angle-right"></i></i></li>
	                  <li class="active-bc" id="et-active-bc-menu">Savie Insurance Plan</li>
	               </ol>
	            </div>
	        </div>

	        <div class="savie-regular-container savie-regular-landing">
	        	<div class="whole-banner">
		        	<div class="page-banner">
		        		<img src="assets/images/savie-regular/sav-landing-bg-mobile.jpg" class="img-responsive hidden-md hidden-lg">
		        		<img src="assets/images/savie-regular/sav-landing-bg-desktop.jpg" class="img-responsive hidden-xs hidden-sm">
		        		<div class="fwd-container-limit">
			        		<div class="img-banner-text savie-landing">
			        			<h2 class="savie-sweeter">Savie is <span>always sweeter</span></h2>
			        			<button class="savie-regular-btn start-btn">Start</button>
		        			<div class="savie-product text-center">
								<a>Product brochure</a> | <a>Product provisions</a>
							</div>
			        		</div>
			        	</div>
		        	</div>
		        </div>
	        	<div class="payment-mode">
	        		<div class="desktop-inline">
		        		<div class="payment-inline">
			        		<h4 class="text-center">Payment mode:</h4>
			        		<div class="payment-options clearfix">
			        			<div class="left">
			        				<button class="active">Regular payment</button>
			        			</div>
			        			<div class="right">
			        				<button>One-off premium</button>
			        			</div>
			        		</div>
			        	</div>
		        	</div>
		        	<div class="desktop-inline rate-holder">
		        		<div class="rate">
		        			<h4 class="text-center">GUARANTEED <span>annual crediting rate:</span></h4>
		        			<ul class="clearfix">
		        				<li><span class="percent">3%</span> [1st year]</li>
		        				<li class="with-padding"><span class="percent">3%</span> [2nd year]</li>
		        				<li class="with-padding"><span class="percent">3.3%</span> [3rd year]</li>
		        			</ul>
		        		</div>
	        		</div>
	        		<div class="gray-divide"></div>
	        		<p class="availability-notice text-center">^This plan is only applicable to Hong Kong Identity card holders. <span>^The aggregate lump sum payment for each applicant cannot exceed HK$2,000,000 under all Savie Insurance Plan.</span>
	        		</p>

	        		<!-- <h5 class="hidden-sm hidden-xs product-options text-center">Product brochure | Product provisions</h5> -->

	        		<div class="fwd-container-limit">
		        		<div class="usp row">
		        			<div class="usp-item clearfix col-xs-12 col-md-4">
		        				<h5 class="hidden-xs hidden-sm">Flexible payment options</h5>
		        				<img src="assets/images/savie-regular/flexible-payment.png" class="hidden-md hidden-lg">
		        				<img src="assets/images/savie-regular/flexible-payment-desktop.png" class="hidden-xs hidden-sm">
		        				<div class="item-desc">
		        					<h5 class="hidden-md hidden-lg">Flexible payment options</h5>
		        					<p>Savie is now available in one-off premium payment and regular payment, you may choose your preferred payment option depends on your saving habit. We accept cheque or bank direct debit and Bank of Communication FWD Credits Card for one off payment; accept only bank direct debit for regular payment.</p>
		        				</div>
		        			</div>
		        			<div class="usp-item clearfix col-xs-12 col-md-4">
		        				<h5 class="hidden-xs hidden-sm">Flexible and free</h5>
		        				<img src="assets/images/savie-regular/flexible-free.png" class="hidden-md hidden-lg">
		        				<img src="assets/images/savie-regular/flexible-free-desktop.png" class="hidden-xs hidden-sm">
		        				<div class="item-desc">
		        					<h5 class="hidden-md hidden-lg">Flexible and free</h5>
		        					<p class="padded">Enjoy flexibility when you need it most - you can withdraw from your Savie account at NO charge!</p>
		        				</div>
		        			</div>
		        			<div class="usp-item clearfix col-xs-12 col-md-4">
		        				<h5 class="hidden-xs hidden-sm">Extra protection</h5>
		        				<img src="assets/images/savie-regular/extra-protection.png" class="hidden-md hidden-lg">
		        				<img src="assets/images/savie-regular/extra-protection-desktop.png" class="hidden-xs hidden-sm">
		        				<div class="item-desc">
		        					<h5 class="hidden-md hidden-lg">Extra protection</h5>
		        					<p class="padded">Receive death benefits at 105% of your account value* and accidental death benefit at 100%, until age 70 and up to a maximum amount of HK$400,000.</p>
		        					<p class="accumulation padded">* The accumulation of total premium paid plus interest, less partial withdrawal(s) if any.</p>
		        				</div>
		        			</div>
		        		</div>
		        	</div>

		        	<div class="hidden-xs hidden-sm">
		        		<h3 class="benefits-desktop text-center">Benefits</h3>
		        		<div class="gray-divide"></div>
		        	</div>
	        		<div class="regular-benefit">
	        			<div class="hidden-md hidden-lg">
		        			<h4 class="text-center">Benefits</h4>
		        			<div class="gray-divide"></div>
		        		</div>
	        			<div class="fwd-container-limit">
		        			<div class="benefits-holder">
		        				<div class="hidden-md hidden-lg">
				        			<div class="row">
				        				<div class="col-xs-6 text-center annualTravel_policy_item">
				        					<img src="assets/images/savie-regular/benefit-1.png">
				        					<span>Partnership offer</span>
											<div class="hidden-benefits benefits-content">
												<img src="assets/images/savie-regular/benefit-1.png" />
												<div class="info hidden-benefits-info">
													<h3 class="hidden-benefits-info">Partnership offer</h3>
													<p class="hidden-benefits-info">Savie while you play! <span>Gold & Silver members could enjoy premium discount of HK$560 & 740, respectively.</span></p>
												</div>
											</div>
				        				</div>
				        				<div class="col-xs-6 text-center annualTravel_policy_item">
				        					<img src="assets/images/savie-regular/benefit-2.png">
				        					<span>19 to 70 issue age</span>
											<div class="hidden-benefits benefits-content">
												<img src="assets/images/savie-regular/benefit-2.png" />
												<div class="info hidden-benefits-info">
													<h3 class="hidden-benefits-info">Partnership offer</h3>
													<p class="hidden-benefits-info">Savie while you play! <span>Gold & Silver members could enjoy premium discount of HK$560 & 740, respectively.</span></p>
												</div>
											</div>
				        				</div>
				        			</div>
				        			<div class="row">
				        				<div class="col-xs-6 text-center annualTravel_policy_item">
				        					<img src="assets/images/savie-regular/benefit-3.png">
				        					<span class="two-lines">Withdrawal without charges</span>
											<div class="hidden-benefits benefits-content">
												<img src="assets/images/savie-regular/benefit-3.png" />
												<div class="info hidden-benefits-info">
													<h3 class="hidden-benefits-info">Partnership offer</h3>
													<p class="hidden-benefits-info">Savie while you play! <span>Gold & Silver members could enjoy premium discount of HK$560 & 740, respectively.</span></p>
												</div>
											</div>
				        				</div>
				        				<div class="col-xs-6 text-center annualTravel_policy_item">
				        					<img src="assets/images/savie-regular/benefit-4.png">
				        					<span class="two-lines">Earning after 3 years</span>
											<div class="hidden-benefits benefits-content">
												<img src="assets/images/savie-regular/benefit-4.png" />
												<div class="info hidden-benefits-info">
													<h3 class="hidden-benefits-info">Partnership offer</h3>
													<p class="hidden-benefits-info">Savie while you play! <span>Gold & Silver members could enjoy premium discount of HK$560 & 740, respectively.</span></p>
												</div>
											</div>
				        				</div>
				        			</div>
				        			<div class="row">
				        				<div class="col-xs-6 text-center annualTravel_policy_item">
				        					<img src="assets/images/savie-regular/benefit-5.png">
				        					<span class="two-lines">24 hours service hotline</span>
											<div class="hidden-benefits benefits-content">
												<img src="assets/images/savie-regular/benefit-5.png" />
												<div class="info hidden-benefits-info">
													<h3 class="hidden-benefits-info">Partnership offer</h3>
													<p class="hidden-benefits-info">Savie while you play! <span>Gold & Silver members could enjoy premium discount of HK$560 & 740, respectively.</span></p>
												</div>
											</div>
				        				</div>
				        				<div class="col-xs-6 text-center annualTravel_policy_item">
				        					<img src="assets/images/savie-regular/benefit-6.png">
				        					<span class="two-lines">Payment options</span>
											<div class="hidden-benefits benefits-content">
												<img src="assets/images/savie-regular/benefit-6.png" />
												<div class="info">
													<h3 class="hidden-benefits-info">Partnership offer</h3>
													<p class="hidden-benefits-info">Savie while you play! <span>Gold & Silver members could enjoy premium discount of HK$560 & 740, respectively.</span></p>
												</div>
											</div>
				        				</div>
				        			</div>
				        		</div>
				        		<div class="hidden-xs hidden-sm">
				        			<div class="fwd-container-limit" id="benefits-nav-holder">
										<ul class="nav nav-tabs row so-fna-row" role="tablist">
											<li role="presentation" class="col-lg-2 col-md-2 col-sm-2 col-xs-2 navtabs-li active" id="benefits-nav-title-1">
												<a href="#benefits-navtabs-1" role="tab" data-toggle="tab" class="navtabs-title first-fna ui-link text-center">Partnership <span>offer</span></a>
											</li>
											<li role="presentation" class="col-lg-2 col-md-2 col-sm-2 col-xs-2 navtabs-li" id="benefits-nav-title-2">
												<a href="#benefits-navtabs-2" role="tab" data-toggle="tab" class="navtabs-title ui-link text-center">19 to 70 <span>issue age</span></a>
											</li>
											<li role="presentation" class="col-lg-2 col-md-2 col-sm-2 col-xs-2 navtabs-li" id="benefits-nav-title-3">
												<a href="#benefits-navtabs-3" role="tab" data-toggle="tab" class="navtabs-title ui-link text-center">Withdrawal <span>without charges</span></a>
											</li>
											<li role="presentation" class="col-lg-2 col-md-2 col-sm-2 col-xs-2 navtabs-li last" id="benefits-nav-title-4">
												<a href="#benefits-navtabs-4" role="tab" data-toggle="tab" class="navtabs-title last-fna ui-link text-center">Earning after <span>3 years</span></a>
											</li>
											<li role="presentation" class="col-lg-2 col-md-2 col-sm-2 col-xs-2 navtabs-li last" id="benefits-nav-title-5">
												<a href="#benefits-navtabs-5" role="tab" data-toggle="tab" class="navtabs-title last-fna ui-link text-center">24 hours <span>service hotline</span></a>
											</li>
											<li role="presentation" class="col-lg-2 col-md-2 col-sm-2 col-xs-2 navtabs-li last" id="benefits-nav-title-6">
												<a href="#benefits-navtabs-6" role="tab" data-toggle="tab" class="navtabs-title last-fna ui-link text-center">Payment <span>options</span></a>
											</li>
										</ul>
										<div class="fna-carousel carousel slide" id="benefits-carousel" data-ride="carousel" data-interval="false">
											<div class="tab-content carousel-inner clearfix" role="listbox">
												<div role="tabpanel" class="fna-tab-content tab-pane item active" id="benefits-navtabs-1">
													<div class="benefits-content clearfix">
														<img src="assets/images/savie-regular/new-benefit-1.png">
														<div class="info">
															<h3>Partnership offer</h3>
															<p>Savie while you play! <span>Gold & Silver members could enjoy premium discount of HK$560 & 740, respectively.</span></p>
														</div>
													</div>
												</div>
												<div role="tabpanel" class="fna-tab-content tab-pane item" id="benefits-navtabs-2">
													<div class="benefits-content clearfix">
														<img src="assets/images/savie-regular/benefit-2.png">
														<div class="info">
															<h3>Partnership offer</h3>
															<p>Savie while you play! <span>Gold & Silver members could enjoy premium discount of HK$560 & 740, respectively.</span></p>
														</div>
													</div>
												</div>
												<div role="tabpanel" class="fna-tab-content tab-pane item" id="benefits-navtabs-3">
													<div class="benefits-content clearfix">
														<img src="assets/images/savie-regular/benefit-3.png">
														<div class="info">
															<h3>Partnership offer</h3>
															<p>Savie while you play! <span>Gold & Silver members could enjoy premium discount of HK$560 & 740, respectively.</span></p>
														</div>
													</div>
												</div>
												<div role="tabpanel" class="fna-tab-content tab-pane item" id="benefits-navtabs-4">
													<div class="benefits-content clearfix">
														<img src="assets/images/savie-regular/benefit-4.png">
														<div class="info">
															<h3>Partnership offer</h3>
															<p>Savie while you play! <span>Gold & Silver members could enjoy premium discount of HK$560 & 740, respectively.</span></p>
														</div>
													</div>
												</div>
												<div role="tabpanel" class="fna-tab-content tab-pane item" id="benefits-navtabs-5">
													<div class="benefits-content clearfix">
														<img src="assets/images/savie-regular/benefit-5.png">
														<div class="info">
															<h3>Partnership offer</h3>
															<p>Savie while you play! <span>Gold & Silver members could enjoy premium discount of HK$560 & 740, respectively.</span></p>
														</div>
													</div>
												</div>
												<div role="tabpanel" class="fna-tab-content tab-pane item" id="benefits-navtabs-6">
													<div class="benefits-content clearfix">
														<img src="assets/images/savie-regular/benefit-6.png">
														<div class="info">
															<h3>Partnership offer</h3>
															<p>Savie while you play! <span>Gold & Silver members could enjoy premium discount of HK$560 & 740, respectively.</span></p>
														</div>
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
		        			</div>
		        		</div>
	        		</div>

	        		<div class="ice-cream-banner hidden-xs hidden-sm">
	        			<img src="assets/images/savie-regular/ice-cream-banner.jpg" class="img-responsive">
	        		</div>

	        		<div class="partners">
	        			<h4 class="text-center">Exclusive partner offers</h4>
	        			<div class="gray-divide" id="bar-exclusive"></div>
	        			<div class="row partners-holder">
	        				<div class="col-xs-6 text-center">
	        					<div class="desktop-center clearfix">
		        					<img src="assets/images/savie-2016/partner_agoda.png">
		        					<a href="#" class="hidden-md hidden-lg">Enjoy 8% discount</a>
		        					<p class="hidden-xs hidden-sm">Enjoy 8% <a href="#">Agoda</a> discount on all travel products upon successful registration of FWD online membership.</p>
	        					</div>
	        				</div>
	        				<div class="col-xs-6 text-center">
	        					<div class="desktop-center clearfix">
		        					<img src="assets/images/savie-2016/partner_pricerite.png">
		        					<a href="#" class="hidden-md hidden-lg">HK$ 50 e-coupon</a>
		        					<p class="hidden-xs hidden-sm">HK$ 50 e-coupon from <a href="#">Pricerite</a> for every successful referral.</p>
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
									<a href="#navtabs-2" role="tab" data-toggle="tab" class="navtabs-title ui-link">Convenience to reach</a>
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
									<div role="tabpanel" class="fna-tab-content tab-pane item active" id="navtabs-1">
										<div class="so-fna-content">
											<div class="fna-icon-circle">
												<span class="fa fa-commenting-o fa-3x"></span>
											</div>
											<h3 class="visible-md visible-lg  tab-head">Here when you need us</h3>
											 <p>Our 24 x 7 call centre support, to assistant you anytime you want! <!--<a href="#" class="eserv-link ui-link">eServices</a>--></p>
										</div>
									</div>
									<div role="tabpanel" class="fna-tab-content tab-pane item" id="navtabs-2">
										<div class="so-fna-content">
											<div class="fna-icon-circle">
												<img src="assets/images/savie-regular/fna-2.png">
											</div>
											<h3 class="visible-md visible-lg tab-head">Convenience to reach</h3>
											<p> Our  5 drop-in location across Hong Kong, Kowloon & New Territories!</p>
										</div>
									</div>
									<div role="tabpanel" class="fna-tab-content tab-pane item" id="navtabs-3">
										<div class="so-fna-content">
											<div class="fna-icon-circle">
												<img src="assets/images/savie-regular/fna-3.png">
											</div>
											<h3 class="visible-md visible-lg tab-head">Make claims easy</h3>
											<p>Simply send the completed claim form to our office within 30 days of the expiry of the policy (except personal liability related claims). Refer to claims section, or you can download the claim form here.</p>
										</div>
									</div>
									<div role="tabpanel" class="fna-tab-content tab-pane item" id="navtabs-4">
										<div class="so-fna-content">
											<div class="fna-icon-circle">
												<img src="assets/images/savie-regular/fna-4.png">
											</div>
											<h3 class="visible-md visible-lg  tab-head">eService app available</h3>
											<p>Download our <a href="#" class="eserv-link ui-link">eServices</a> App and get the support you need, when you need it.</p>
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

					<div class="blog">
						<div class="hidden-md hidden-lg">
							<div class="mini-banner-holder">
								<img src="assets/images/savie-regular/img-savie-blog.jpg" class="img-responsive">
								<div class="black-overlay"></div>
								<h5 class="text-center">Save before you spend</h5>
							</div>
							<div class="btn-holder">
								<button class="savie-regular-btn">Read more from our blog</button>
							</div>
						</div>
						<div class="hidden-xs hidden-sm">
							<h3 class="text-center">Read more from our blog</h3>
							<div class="gray-divide"></div>
							<p class="definition text-center">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi blandit pretium metus. Suspendisse sagittis mi id iaculis eleifend. <span>Integer ullamcorper nisi eget elit molestie mattis.</span></p>

							<div class="blogs-holder clearfix fwd-container-limit">
								<div class="blogs first">
									<img src="assets/images/savie-regular/blog-1.jpg" class="img-responsive">
									<div class="orange-overlay text-center">
										<p class="title">Saving is easier than you think!</p>
										<span>SAVE</span>
										<p class="definition">Spending yourself into a hole? You are not the only one</p>
										<a class="btn-read-now" href="http://blog.fwd.com.hk/zh_HK/2016/01/11/power-start-up/">Read now</a>
									</div>
								</div>
								<div class="blogs">
									<img src="assets/images/savie-regular/blog-2.jpg" class="img-responsive">
									<div class="orange-overlay text-center">
										<p class="title">Saving is easier than you think!</p>
										<span>SAVE</span>
										<p class="definition">Spending yourself into a hole? You are not the only one</p>
										<a class="btn-read-now" href="http://blog.fwd.com.hk/zh_HK/2015/12/30/do-holidays-have-to-be-saving-traps/">Read now</a>
									</div>
								</div>
								<div class="blogs">
									<img src="assets/images/savie-regular/blog-3.jpg" class="img-responsive">
									<div class="orange-overlay text-center">
										<p class="title">Saving is easier than you think!</p>
										<span>SAVE</span>
										<p class="definition">Spending yourself into a hole? You are not the only one</p>
										<a class="btn-read-now" href="http://blog.fwd.com.hk/zh_HK/2015/12/17/busting-the-myths-of-saving-traps/">Read now</a>
									</div>
								</div>
								<div class="blogs last">
									<img src="assets/images/savie-regular/blog-4.jpg" class="img-responsive">
									<div class="orange-overlay text-center">
										<p class="title">Saving is easier than you think!</p>
										<span>SAVE</span>
										<p class="definition">Spending yourself into a hole? You are not the only one</p>
										<a class="btn-read-now" href="http://blog.fwd.com.hk/zh_HK/2015/12/09/%E9%80%99%E6%A8%A3%E5%81%9A%E5%B0%B1%E5%B0%8D%E4%BA%86%E3%80%80coupon%E5%B9%AB%E6%82%A8%E6%85%B3%E5%A4%A7%E9%8C%A2/">Read now</a>
									</div>
								</div>
							</div>

							<div class="fwd-container-limit">
								<p class="blog-notice">The information provided in the blog is for reference only. While FWD Life Insurance Company (Bermuda) Limited and its affiliates ("FWD") use all reasonable efforts to ensure the information is accurate, FWD makes no warranties or representations as to the accuracy or completeness of any of the information and assumes no liability for any errors or omissions thereof. FWD shall not be liable for any direct, incidental, consequential, indirect or punitive damages arising out of access to, use of or inability to use the information, or any errors or omissions in the content of this material. Users should carefully evaluate the information.</p>
							</div>
						</div>
					</div>
	        	</div>
				<!-- Benefits modal for mobile -->
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

	        </div>
        
			<!-- FOOTER -->
			<%@include file="includes/footer-block.jsp" %>
		</div>
		
		<!-- JS INCLUDES -->
		<%@include file="includes/js-include.jsp" %>
		<script type="text/javascript" src="assets/js/savie-2016/jquery.mobile-1.4.5.min.js"></script>
		<script type="text/javascript">
			var language = "en";
			$(function() {
				$("#so-carousel").swiperight(function() {
				   $(this).carousel('prev');
				});
				$("#so-carousel").swipeleft(function() {
				   $(this).carousel('next');  
				});
			});
			$(document).ready(function() {
				if(isMobile) {
					$(".annualTravel_policy_item").click(function(){
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
				}
			});
		</script>
		
	</body>
</html>