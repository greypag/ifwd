<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta name="apple-mobile-web-app-capable" content="yes" />
		
		<!-- Bootstrap -->
		<link href="<%=request.getContextPath()%>/resources/css/savie/bootstrap.css" rel="stylesheet">
		<link href="<%=request.getContextPath()%>/resources/css/savie/jasny-bootstrap.min.css" rel="stylesheet">
		<link href="<%=request.getContextPath()%>/resources/css/savie/bootstrap-select.min.css" rel="stylesheet">
		<link href="<%=request.getContextPath()%>/resources/css/savie/styles.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/savie/datepicker3.min.css">
		
		<!--Font Awesome Css-->
		<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/savie/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/savie/bootstrap-slider.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/savie/icomoon.min.css">
		<link rel="stylesheet"  type="text/css" href="<%=request.getContextPath()%>/resources/css/savie/dropzone.css">
		
		
		<!--Mini Calculator Css-->
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/savie/jquery-ui.theme.min.css">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/savie/jquery-ui.min.css">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/savie/style.css">
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
	</head>
	<body>
		<%!
			boolean isSaleActiveClass = false;
		%>
		<div class="fwd-wrapper">			
		
			<div class="text-center banner-widget container-fluid">
				<div class="fwd-container container-fluid breadcrumbs">
					<ol class="breadcrumb breadcrumbs-product-details breadcrumbs-landing">
						<li><a href="#">Home</a></li>
						<li class="divider"><i class="fa fa-play"></i></li>
						<li><a href="#">Save</a></li>
						<li class="divider last"><i class="fa fa-play"></i></li>
						<li class="active-bc">Savie</li>
					</ol>
				</div>
				<div class="widget-title">
					<span class="first">Save</span>
					<span class="second">for</span>
					<span class="third">that</span>
					<span class="fourth">dream</span>
					<div class="widget-desc">
						Explore the world while working with total peace of mind
					</div>
				</div>		
				<div class="widget-btns">
					<a href="<%=request.getContextPath()%>/${language}/savie-illustration">Buy now</a>						
				</div>
				<div class="widget-link">
					<a href="#">Learn more</a>
				</div>
			</div>

			<!--<div id="landing-calculator" class="fwd-full-container container-fluid">
				<img class="img-responsive hidden-xs" src="assets/images/bg-mini-calcu.png" />
				<img class="img-responsive hidden-sm hidden-md hidden-lg" src="assets/images/mini-mobile.png" />
			</div>-->
			<!--<iframe src="http://192.168.1.128:8080/mini-calculator/" class="full-calcu"></iframe>-->
			<div class="mini-calculator">
				<div class="wrapper">
					<div class="levelSelectionDiv">
					</div>
					<div class="arrow_left" onclick="fwd.onClickLeft()">
						<div class="arrow_left_desc">Previous</div>
					</div>
					<div class="arrow_right" onclick="fwd.onClickRight()">
						<div class="arrow_right_desc">Next</div>
					</div>
					<div class="main_background">
						<div class="boy_figure young" onclick="fwd.sexSelection('manConfig')">
							<div class="animationDiv"></div>
							<div class="boy_figure_desc">Male</div>
						</div>
						<div class="girl_figure young" onclick="fwd.sexSelection('girlConfig')">
							<div class="animationDiv"></div>
							<div class="girl_figure_desc">Female</div>
						</div>
						<div id="smoke"></div>
						<div class="car middle">
							<div class="hand"></div>
							<div class="wheel"></div>
						</div>
						<div class="dreaming">
							<div class="car_dream_btn" onclick="fwd.onClickRight('car')">
				
							</div>
							<div class="saving_dream_btn" onclick="fwd.onClickRight('saving')">
				
							</div>
							<div class="wedding_dream_btn" onclick="fwd.onClickRight('wedding')">
				
							</div>
							<div class="trip_dream_btn" onclick="fwd.onClickRight('trip')">
				
							</div>
						</div>
				
						<div class="letgo_btn" onclick="fwd.onClickRight()">
						</div>
						<div class="dream_text">
							<div class="tilte">
								WHAT IS YOUR DREAM?
							</div>
							<div class="desc">
								what are xjeskxjeskxjeskxjeskxjeskxjeskxjeskxjeskxjeskxjeskxjeskxjeskx
							</div>
						</div>
						<div class="pageTitle">
							<div class="txtDialog">
								<div class="text">
									HOW OLD ARE YOU ?
								</div>
							</div>
						</div>
						<div class="calAge">
							<div class="sliderRange under"></div>
							<div id="slider" class="selectSlider">
							</div>
							<div class="sliderRange over"></div>
						</div>
					</div>
				</div>
			</div>
			
	        <div id="flux">
	            <div id="landing-three-column" class="fwd-container container-fluid three-column-widget">
	                <div class="row row-top text-center">
	                    <div class="col-xs-12 col-md-4 fwd-col">
	                        <div class="col-content">
	                            <h2>Simple yet</h2>
	                            <h3>big on savings</h3>
	                            <img src="<%=request.getContextPath()%>/resources/images/savie/big-on-savings.png">
	                            <p>SAVIE guarantees earnings of <span>3% interest per year</span>, giving simple and instant control so you can go big on your savings.</p>
	                        </div>
	                    </div>
	                    <div class="col-xs-12 col-md-4 fwd-col">
	                        <div class="col-content">
	                            <h2>No charges</h2>
	                            <h3>no commitment</h3>
	                            <img src="<%=request.getContextPath()%>/resources/images/savie/no-commitment.png">
	                            <p>Enjoy flexibility for when you need it most! You can <span>withdraw from your account at no charge</span>, for as many times as you want!</p>
	                        </div>
	                    </div>
	                    <div class="col-xs-12 col-md-4 fwd-col">
	                        <div class="col-content">
	                            <h2>Free</h2>
	                            <h3>additional protection</h3>
	                            <img src="<%=request.getContextPath()%>/resources/images/savie/free-additional.png">
	                            <p>Receive Accidental Death Benefit along with your savings, <span>insuring 100% of your account</span> value up to a maximum of HK$400,000.</p>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            
	            <div class="fwd-container container-fluid">     
	                <div id="other-benefits" class="row">
	                	<div class="col-xs-12 col-md-8 pull-right">
	                    	<h2 class="text-center">Other benefits</h2>
	                    </div>	                    
	                    <div class="col-xs-12 col-md-4 fwd-col text-center left-clear">
	                        <img src="<%=request.getContextPath()%>/resources/images/savie/other-benefits-img.png">
	                    </div>
	                    <div class="col-xs-12 col-md-8 fwd-col">
	                        <ul>
	                            <li><p>Unlimited number of withdrawals</p></li>
	                            <li><p>No withdrawal charges for the 4th Policy Year and onwards</p></li>
	                            <li><p>Premium cover for 365 days, to the exact length of your Working Holiday Scheme</p></li>
	                            <li><p>Death Benefit of HK$1,000 plus Account Value</p></li>
	                            <li><p>Accidental Death Benefit gives 100% of Account Value, in addition to Death Benefit Paid</p></li>
	                        </ul>
	                    </div>
	                </div>
	                <!-- Disclaimer and Policy Provisions -->
	                <div class="disclaimer-policy">
	                    <p>The features above are indicative only. Please refer to the <a href="#">Policy Provisions</a> for details.</p>
	                    <p>For a complete explanation of the terms and conditions, please contact your adviser or our customer service at 3123 3123 for more details.</p>
	                </div>
	            </div>
	            
	            <!-- FEATURES AND ACTIONS -->
	            <div class="fwd-full-container container-fluid fwd-action">
	                <div id="fwd-carousel" class="fwd-carousel carousel slide fwd-action-one" data-ride="carousel">
	                    <!-- Indicators -->
	                    <ol class="carousel-indicators">
	                        <li data-target="#fwd-carousel" data-slide-to="0" class="active"></li>
	                        <li data-target="#fwd-carousel" data-slide-to="1"></li>
	                        <li data-target="#fwd-carousel" data-slide-to="2"></li>
	                    </ol>

	                    <!-- Wrapper for slides -->
	                    <div class="carousel-inner" role="listbox">
	                        <div class="item active">
	                            <div>
	                                <div>
	                                    <h2>Power of saving</h2>
	                                    <p>Help aware people for new features</p>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="item">
	                            <div>
	                                <div>
	                                    <h2>Power of saving</h2>
	                                    <p>Help aware people for new features</p>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="item">
	                            <div>
	                                <div>
	                                    <h2>Power of saving</h2>
	                                    <p>Help aware people for new features</p>
	                                </div>
	                            </div>
	                        </div>
	                    </div>

	                    <!-- Controls -->
	                    <a class="left carousel-control disabled" href="#fwd-carousel" role="button" data-slide="prev">
	                        <span class="icon icon-chevron-thin-left">
	                        <span class="sr-only">Previous</span>
	                    </a>
	                    <a class="right carousel-control active" href="#fwd-carousel" role="button" data-slide="next">
	                        <span class="icon icon-chevron-thin-right">
	                        <span class="sr-only">Next</span>
	                    </a>
	                </div>
	                <div class="fwd-action-container fwd-action-two">
	                    <button class="action-one talk-to-experts">
	                        <img src="<%=request.getContextPath()%>/resources/images/savie/talk-to-one.png" class="img-responsive" />
	                        <div class="action-text">
	                            <h2>Still unclear?</h2>
	                            <p>Talk to one of our experts</p>
	                        </div>
	                    </button>
	                    <button class="action-two download-brochure">
	                        <img src="<%=request.getContextPath()%>/resources/images/savie/view-the-full.png" class="img-responsive" />
	                        <div class="action-text">
	                            <h2>Download brochure</h2>
	                            <p>View the full product brochure for more details.</p>
	                        </div>
	                    </button>
	                </div>
	                <button type="button" id="sticky-buy-now" class="btn btn-full btn-buy-now"><a href="<%=request.getContextPath()%>/${language}/savie-illustration">Buy now</a></button>
	            </div>
	        </div>
			
			<!-- OUR BLOG -->
			<div id="landing-page-blog" class="fwd-container blog-widget container-fluid text-center">
				<div class="read-blog-desktop three-column-widget">
					<h2 class="hidden-xs hidden-sm">Read more from our blog</h2>
					<h2 class="hidden-md hidden-lg">Our blog</h2>
					<div class="row text-left">
						<div class="col-xs-12 col-md-4 fwd-col">
							<img src="<%=request.getContextPath()%>/resources/images/savie/stay-connect.png"/>
							<h3><a href="#">Staying connected while travelling abroad <span class="glyphicon glyphicon-play" aria-hidden="true"></span></a></h3>
						</div>
						<div class="col-md-4 fwd-col hidden-xs hidden-sm">
							<img src="<%=request.getContextPath()%>/resources/images/savie/7-musts.png"/>
							<h3><a href="#">7 musts before a long vacation <span class="glyphicon glyphicon-play" aria-hidden="true"></span></a></h3>
						</div>
						<div class="col-md-4 fwd-col hidden-xs hidden-sm">
							<img src="<%=request.getContextPath()%>/resources/images/savie/top-tips.png"/>
							<h3><a href="#">Top tips for first-time home buyers <span class="glyphicon glyphicon-play" aria-hidden="true"></span></a></h3>
						</div>
					</div>
					<p class="text-left hidden-xs hidden-sm">The information provided in the blogs is for reference only.  Whil  e FWD Life Insurance Company (Bermuda) Limited and its affiliates (“FWD”) use reasonable efforts to ensure the information is accurate, FWD makes no warranties or representations as to the accuracy or completeness of any of the information and assumes no liability for any errors or omissions thereof.  FWD shall not be liable for any direct, incidental, consequential, indirect or punitive damages arising out of access to, use of or inability to use the information, or any errors or omissions in the content of this material.  Users should carefully evaluate the information</p>
				</div>			
			</div>
			<!--<button type="button" class="btn btn-full hidden-md hidden-lg">Read more</button>-->
			<a class="btn btn-full hidden-md hidden-lg" href="http://blog.fwd.com.hk/en_US/" target="_blank">Read more</a>

			<!-- FOOTER -->
		</div>
		
		<!-- JS INCLUDES -->
		
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="bower_components/bootstrap-sass/assets/javascripts/bootstrap.min.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/jasny-bootstrap.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/bootstrap-select.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/jquery.touchSwipe.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/custom.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/placeholders.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/date.format.js"></script>
		  
		<script src="<%=request.getContextPath()%>/resources/js/savie/jquery.animateSprite.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/jquery-ui.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/jquery.ui.touch-punch.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/jquery.loadImages.1.1.0.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/index.js"></script>
		
	</body>
</html>