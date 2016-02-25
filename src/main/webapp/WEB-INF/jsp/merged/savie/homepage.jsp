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
		<div class="fwd-savie-wrapper">			
			<!-- HEADER -->
			<%@include file="includes/header-block.jsp" %>
			
			<div id="savie-online">
				<div class="hero-banner">
					<div class="hidden-xs hidden-sm">
						<img src="assets/images/savie-2016/hero.jpg" class="img-responsive banner-image" />
					</div>
					<div class="hidden-md hidden-lg">
						<img src="assets/images/savie-2016/hero-mobile.png" class="img-responsive banner-image" />
					</div>
					<div class="banner-text">
						<p>Discover a</p>
						<p class="lower-text">new experience</p>
					</div>
				</div>
				<div class="product-list">
					<div class="content-container row fwd-container-limit">
						<div class="psa-divider col-sm-12 col-xs-12 col-md-4 col-lg-4">
							<button class="btn psa-btn" type="button" data-toggle="collapse" data-target="#psa-collapse-1" aria-expanded="false"><span class="psa-title">Protect</span><img class="hidden-lg hidden-md psa-plus" src="assets/images/savie-2016/plus-slim.png" />
							</button>
							<div class="collapse psa-collapse-content" id="psa-collapse-1">
							  <div class="psa-content">
								<p class="description">From health, accident and disability cover, to home, travel and car insurance, our policies are designed with one thing in mind - to enable you to live your life to the full, without hesitation.</p>
								<div class="psa-link-content">
									<img class="psa-arrow" src="assets/images/savie-2016/arrow-circle.png" />
									<ul class="psa-ul">
										<li><a href="#">Elite Term <i class="fa fa-caret-right orange-caret-right"></i></a></li>
										<li><a href="#">FlightCare <i class="fa fa-caret-right orange-caret-right"></i></a></li>
										<li><a href="#">TravelCare <i class="fa fa-caret-right orange-caret-right"></i></a></li>
										<li><a href="#">Working HolidaysCare <i class="fa fa-caret-right orange-caret-right"></i></a></li>
										<li><a href="#">Easy HomeCare <i class="fa fa-caret-right orange-caret-right"></i></a></li>
									</ul>
								</div>
							  </div>
							</div>
						</div>
						<div class="psa-divider col-sm-12 col-xs-12 col-md-4 col-lg-4">
							<button class="btn psa-btn" type="button" data-toggle="collapse" data-target="#psa-collapse-2" aria-expanded="false"><span class="psa-title">Save</span><img class="hidden-lg hidden-md psa-plus" src="assets/images/savie-2016/plus-slim.png" />
							</button>
							<div class="collapse psa-collapse-content" id="psa-collapse-2">
							  <div class="psa-content">
								<p class="description">Whether it’s for you, your family or your business, set your signhts on smart investment products made simple, with cover designed to protect what's really important to you.</p>
								<div class="psa-link-content">
									<img class="psa-arrow" src="assets/images/savie-2016/arrow-circle.png" />
									<ul class="psa-ul">
										<li><a href="#">Savie insurance <i class="fa fa-caret-right orange-caret-right"></i></a></li>
									</ul>
								</div>
							  </div>
							</div>
						</div>
						<div class="psa-divider col-sm-12 col-xs-12 col-md-4 col-lg-4">
							<button class="btn psa-btn" type="button" data-toggle="collapse" data-target="#psa-collapse-3" aria-expanded="false"><span class="psa-title">Enjoy</span><img class="hidden-lg hidden-md psa-plus" src="assets/images/savie-2016/plus-slim.png" />
							</button>
							<div class="collapse psa-collapse-content" id="psa-collapse-3">
							  <div class="psa-content">
								<p class="description save">The future always seems a long way off, but the sooner you start planning for it the better the return when it does come around. Our saving plans are easy, flexible and designed to work for you overtime. So you can focus on the now and let us take care of the future!</p>
								<div class="psa-link-content">
									<img class="psa-arrow" src="assets/images/savie-2016/arrow-circle.png" />
									<ul class="psa-ul">
										<li><a href="#">FWDiscover <i class="fa fa-caret-right orange-caret-right"></i></a></li>
										<li><a href="#">Partners &amp; Offers <i class="fa fa-caret-right orange-caret-right"></i></a></li>
									</ul>
								</div>
							  </div>
							</div>
						</div>
					</div>					
					<div class="see-more text-center hidden-sm hidden-xs">
						<p id="see-all-product-btn">See all our products <i class="fa fa-caret-right"></i></p>
					</div>
				</div>
				<div class="fna fwd-full-container container-fluid">
					<div class="fna-body fwd-container-limit clearfix">
						<img class="img-responsive pull-right fna-img hidden-sm hidden-xs" src="assets/images/savie-2016/FNA_desktop.png" />
						<img class="img-responsive pull-right fna-img hidden-lg hidden-md" src="assets/images/savie-2016/FNA_mobile.png" />
						<!--<div class="fna-box text-left">
							<h3>Financial Needs Analysis</h3>
							<div class="fna-box-hr"></div>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi blandit pretium metus. Suspendisse sagittis mi id iaculis eleifend. Integer ullamcorper nisi eget elit molestie mattis.</p>
							<button class="btn savie-common-btn get-btn">Get Started</button>
						</div>-->
						<button id="btn-fna-cta" class="btn common-yellow-btn get-btn">Let's get started</button>
					</div>
					<div class="fna-icons-body text-center clearfix">
						<div class="fwd-container-limit" id="nav-holder">
							<ul class="nav nav-tabs row so-fna-row visible-xs visible-sm" role="tablist">
								<li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li active" id="nav-title-1">
									<a href="#navtabs-1" role="tab" data-toggle="tab" class="navtabs-title first-fna">Here when you need us</a>
								</li>
								<li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li" id="nav-title-2">
									<a href="#navtabs-2" role="tab" data-toggle="tab" class="navtabs-title">Convenience to reach</a>
								</li>
								<li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li" id="nav-title-3">
									<a href="#navtabs-3" role="tab" data-toggle="tab" class="navtabs-title">Make claims easy</a>
								</li>
								<li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li" id="nav-title-4">
									<a href="#navtabs-4" role="tab" data-toggle="tab" class="navtabs-title last-fna">eService app available</a>
								</li>
							</ul>
							<div class="fna-carousel" id="so-carousel">
								<div class="tab-content">
									<div role="tabpanel" class="fna-tab-content tab-pane active" id="navtabs-1">
										<div class="so-fna-content">
											<div class="fna-icon-circle">
												<span class="fa fa-commenting-o fa-3x"></span>
											</div>
											<h3 class="visible-md visible-lg  tab-head">Here when you need us</h3>
											<p>Our 24x7 call centre support, 5 drop-in locations across Hong Kong and our <a href="#" class="eserv-link">eServices</a></p>
										</div>
									</div>
									<div role="tabpanel" class="fna-tab-content tab-pane" id="navtabs-2">
										<div class="so-fna-content">
											<div class="fna-icon-circle">
												<img src="assets/images/savie-2016/fna-2.png" />
											</div>
											<h3 class="visible-md visible-lg tab-head">Convenience to reach</h3>
											<p> Our 5 drip-in location across Hong Kong, Kowloon &amp; New territories</p>
										</div>
									</div>
									<div role="tabpanel" class="fna-tab-content tab-pane" id="navtabs-3">
										<div class="so-fna-content">
											<div class="fna-icon-circle">
												<img src="assets/images/savie-2016/fna-3.png" />
											</div>
											<h3 class="visible-md visible-lg tab-head">Make claims easy</h3>
											<p> For any claims, simply send the completed claim form to our office within 30 days of the expiry of the policy (except personal liability related claims). Refer to our Claims section or download the claim form.</p>
										</div>
									</div>
									<div role="tabpanel" class="fna-tab-content tab-pane" id="navtabs-4">
										<div class="so-fna-content">
											<div class="fna-icon-circle">
												<img src="assets/images/savie-2016/fna-4.png" />
											</div>
											<h3 class="visible-md visible-lg  tab-head">eService app available</h3>
											<p>Download our <a href="#" class="eserv-link ui-link">eService App</a> App and get the support you need, when you need it.</p>
										</div>
									</div>
								</div>
								<!-- Carousel -->
								<a class="left carousel-control hidden-lg hidden-md" href="#so-carousel" role="button" data-slide="prev">
								</a>
								<a class="right carousel-control hidden-lg hidden-md" href="#so-carousel" role="button" data-slide="next">
								</a>
							</div>
						</div>
					</div>
					<!-- <a href="#">
						<div class="dropup text-center fna-top-btn">
							<span style="" class="caret"></span><p>TOP</p>
						</div>
					</a> -->
					<div class="read-blog text-center fwd-container-limit">
						<div class="blog-img-container hidden-lg hidden-md">
							<img class="img-responsive blog-img" src="assets/images/savie-2016/blog-img.png" />
							<div class="transparent-overlay"></div>
							<p class="blog-img-text">7 musts before a long vacation</p>
						</div>
						<p class="savie-common-btn visible-md visible-lg read-more-btn">Read more from our blog</p>
						<button class="savie-common-btn btn read-more-btn  read-more-btn-mb ui-btn ui-shadow">Read more from our blog</button>
						<hr class="hidden-sm hidden-xs" />
						<p class="hidden-sm hidden-xs">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi blandit pretium metus. Suspendisse sagittis mi id iaculis eleifend. Integer ullamcorper nisi eget elit molestie mattis.</p>
					</div>
				</div>
				<!-- Products Gallery -->
				<div class="container-products hidden-sm hidden-xs">
					<div class="li-container">
						<ul>
							<li><a href="#">All</a></li>
							<li><a href="#">Save</a></li>
							<li><a href="#">Working Holiday</a></li>
							<li><a href="#">Travel</a></li>
							<li><a href="#">Home</a></li>
						</ul>
					</div>
					<div class="row row-products">
						<div class="products-first-block">
							<div class="col-lg-3 col-md-3 portfolio-item">	
								<div class="caption">
									<h4>Kala Patthar</h4>
									<h5 class="show-travel">TRAVEL</h5>
									<p class="show-sentence">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
									<button class="btn-readnow" rel="tooltip">Read now</button>
								</div>
								<img class="img-responsive img-container" src="assets/images/savie-2016/Layer-21.png" />
							</div>
							<div class="col-lg-3 col-md-3 portfolio-item">
								<div class="caption">
									<h4>Kala Patthar</h4>
									<h5 class="show-travel">TRAVEL</h5>
									<p class="show-sentence">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
									<button class="btn-readnow" rel="tooltip">Read now</button>
								</div>
								<img class="img-responsive img-container" src="assets/images/savie-2016/Layer-22.png" />
							</div>
							<div class="col-lg-3 col-md-3 portfolio-item">
								<div class="caption">
									<h4>Kala Patthar</h4>
									<h5 class="show-travel">TRAVEL</h5>
									<p class="show-sentence">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
									<button class="btn-readnow" rel="tooltip">Read now</button>
								</div>
								<img  class="img-responsive img-container" src="assets/images/savie-2016/Layer-23.png" />
							</div>
							<div class="col-lg-3 col-md-3 portfolio-item">
								<div class="caption">
									<h4>Kala Patthar</h4>
									<h5 class="show-travel">TRAVEL</h5>
									<p class="show-sentence">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
									<button class="btn-readnow" rel="tooltip">Read now</button>
								</div>
								<img class="img-responsive img-container" src="assets/images/savie-2016/Layer-24.png" />	
							</div>
						</div>
						<div class="products-first-block">
							<div class="col-md-3 col-lg-3 portfolio-item">	
								<div class="caption">
									<h4>Kala Patthar</h4>
									<h5 class="show-travel">TRAVEL</h5>
									<p class="show-sentence">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
									<button class="btn-readnow" rel="tooltip">Read now</button>
								</div>
								<img class="img-responsive img-container" src="assets/images/savie-2016/Layer-25.png" />
							</div>
							<div class="col-md-3 col-lg-3 portfolio-item">
								<div class="caption">
									<h4>Kala Patthar</h4>
									<h5 class="show-travel">TRAVEL</h5>
									<p class="show-sentence">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
									<button class="btn-readnow" rel="tooltip">Read now</button>
								</div>
								<img class="img-responsive img-container" src="assets/images/savie-2016/Layer-26.png" />
							</div>
							<div class="col-md-3 col-lg-3 portfolio-item">
								<div class="caption">
									<h4>Kala Patthar</h4>
									<h5 class="show-travel">TRAVEL</h5>
									<p class="show-sentence">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
									<button class="btn-readnow" rel="tooltip">Read now</button>
								</div>
								<img class="img-responsive img-container" src="assets/images/savie-2016/Layer-27.png" />
							</div>
							<div class="col-md-3 col-lg-3 portfolio-item">
								<div class="caption">
									<h4 class="caption-h4">Kala Patthar</h4>
									<h5 class="show-travel">TRAVEL</h5>
									<p class="show-sentence">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
									<button class="btn-readnow" rel="tooltip">Read now</button>
								</div>
								<img class="img-responsive img-container" src="assets/images/savie-2016/Layer-28.png" />
							</div>
						</div>	
					</div>
				</div>
				<div class="container-information hidden-sm hidden-xs">
					<p>The information provided in the blog is for reference only. While FWD Life Insurance Company (Bermuda) Limited and its affiliates ("FWD") use all reasonable efforts to ensure the information is accurate, FWD makes no warranties or representations as to the accuracy or completeness of any of the information and assumes no liability for any errors or omissions thereof. FWD shall not be liable for any direct, incidental, consequential, indirect or punitive damages arising out of access to, use of or inability to use the information, or any errors or omissions in the content of this material. Users should carefully evaluate the information.</p>
				</div>
				<!-- Business Partners -->
				<div class="bg-business-partners">
					<div id="business-partners-container" class="container-fluid content-container">
					   <h2 class="text-center">Partners</h2>				   
					   <div class="bp-divider"></div>				   
					   <div id="business-partners" class="row">
						  <!--<div class="hidden-xs hidden-sm col-xs-1"></div>-->
						  <div id="bp-agoda" class="col-xs-6 text-center">
							 <div class="desktop-center clearfix">
								<img src="assets/images/savie-2016/partner_agoda.png">
								<a href="#" class="hidden-md hidden-lg">Enjoy 8% </a>
								<p class="hidden-xs hidden-sm">Enjoy 8%  <a href="#">Agoda</a> discount on all travel products upon successful registration of FWD online membership.</p>
							</div>
						  </div>
						  <div id="bp-pricerite" class="col-xs-6 text-center">
							 <div class="desktop-center clearfix">
								<img src="assets/images/savie-2016/partner_pricerite.png">
								<a href="#" class="hidden-md hidden-lg">HK$ 50 e-coupon from </a>
								<p class="hidden-xs hidden-sm">HK$ 50 e-coupon from  <a href="#">Pricerite</a> for every successful referral.</p>
							</div>
						  </div>
					   </div>
					</div>
				</div>								
			</div>

			<!-- FOOTER -->
			<%@include file="includes/footer-block.jsp" %>
		</div>
		
		<!-- Review FNA modal  -->
		<div class="modal fade common-welcome-modal" id="review-fna-modal" tabindex="-1" role="dialog">
		  <div class="modal-dialog">
			<div class="modal-content">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
				<h4 class="text-center welcome-msg">Welcome back! Chan Tai Man</h4>
				<p class="text-center description-msg">You have already completed a Financial Needs Analysis previously, you may review and edit your FNA for an updated Product Recommendation.</p>
				<center><button class="btn savie-common-btn" id="review-fna-btn">Review FNA</button></center>
			</div>
		  </div>
		</div>
		
		<!-- JS INCLUDES -->
		<%@include file="includes/js-include.jsp" %>
		<script type="text/javascript" src="assets/js/savie-2016/jquery.mobile-1.4.5.min.js"></script>
		<script type="text/javascript">
			var language = "en";
			$(function() {
				
				// To show review fna modal when clicking FNA CTA button
				$('#btn-fna-cta').click(function() {
					var hasDoneFNA = true;
					
					// Review FNA modal will only show if a user has done FNA before
					if(hasDoneFNA) {
						$('#review-fna-modal').modal('show');
					}
				});
				
				$("#so-carousel").swiperight(function() {
				   $(this).carousel('prev');
				});
				$("#so-carousel").swipeleft(function() {
				   $(this).carousel('next');  
				});
			});
		</script>
		
	</body>
</html>