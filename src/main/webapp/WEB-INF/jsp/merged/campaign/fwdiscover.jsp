<%@page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<%@include file="includes/head2.jsp" %>
	</head>
	<body>
		<%!
			boolean isSaleActiveClass = true;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper fwdiscover-wrapper">			
			<!--Top Header-->
			<%@include file="includes/header-block-fwdiscover.jsp" %>
		
			<div class="page-fwdiscover">
				<div class="fwd-container container-fluid hidden-xs hidden-sm clearfix breadcrumbs-holder">
					<div class="breadcrumbs pull-left">
						<ol class="breadcrumb breadcrumbs-product-details breadcrumbs-landing">
							<li><a href="#">Home</a></li>
							<li class="divider"><i class="fa fa-play"></i></li>
							<li><a href="#">Enjoy</a></li>
							<li class="divider last"><i class="fa fa-play"></i></li>
							<li class="active-bc">FWDiscover</li>
						</ol>
					</div>
				</div>
				<div class="fwdiscover-info clearfix">
					<div class="fwd-full-container container-fluid fwdiscover-banner clearfix">
						<img src="assets2/images/fwdiscover/page-banner-mobile.jpg" class="img-responsive hidden-md hidden-lg">
						<img src="assets2/images/fwdiscover/page-banner-desktop.jpg" class="img-responsive hidden-sm hidden-xs">

						<div class="banner-title">
							<p class="welcome">Welcome to</p>
							<p class="fwdiscover">FWDiscover</p>
						</div>
					</div>

					<div class="clearfix">
						<div class="fwdiscover-description">
							<p>FWDiscover is a fun way to bag a bargain.</p>
							<p>For a limited time every month, discover discounted coverage, great travel offers, lifestyle accessories and more. But like all great things in life, the early birds get the goods! <span class="grab">So grab this month’s deals before they’re gone.</span></p>
							<p class="register">Exclusive offers for FWD members. Not yet a member? <a href="#">Register now</a>.</p>
						</div>

						<div class="fwdiscover-timer pull-right">
							<p class="hurry">HURRY – Offers ends in</p>
							<div class="clearfix">
								<!-- month -->
								<div class="timer-holder month-holder">
									<div class="bg gray-bg">
										<div class="clearfix">
											<span class="number pull-left">25</span>
											<span class="month pull-right">DEC</span>
										</div>
										<span class="line line-gray"></span>
									</div>
									<span class="desc text-center">DATE</span>
								</div>
								<!-- end month -->

								<!-- DAY HOUR MINS SECS -->
								<div class="day-hour-min-sec" id="countdown">
									<div class="timer-holder right">
										<div class="bg">
											<div class="clearfix">
												<span class="number pull-left" id="countdown-days">03</span>
											</div>
											<span class="line"></span>
										</div>
										<span class="desc text-center">DAYS</span>
									</div>

									<div class="timer-holder right">
										<div class="bg">
											<div class="clearfix">
												<span class="number pull-left" id="countdown-hours">20</span>
											</div>
											<span class="line"></span>
										</div>
										<span class="desc text-center">HOURS</span>
									</div>

									<div class="timer-holder right">
										<div class="bg">
											<div class="clearfix">
												<span class="number pull-left" id="countdown-minutes">42</span>
											</div>
											<span class="line"></span>
										</div>
										<span class="desc text-center">MINUTES</span>
									</div>

									<div class="timer-holder right">
										<div class="bg">
											<div class="clearfix">
												<span class="number pull-left" id="countdown-seconds">28</span>
											</div>
											<span class="line"></span>
										</div>
										<span class="desc text-center">SECONDS</span>
									</div>
								</div>
								<!-- end DAY HOUR MINS SECS -->
							</div>
						</div>
					</div>
				</div>


	            <div id="myCarousel-fwdiscover" class="carousel slide">
	                
	                <!-- Carousel items -->
	                <div class="carousel-inner">
	                    <div class="item active">
	                        <div class="row">
	                            <div class="col-xs-4">
	                            	<a href="#offer1"><img src="assets2/images/fwdiscover/annualtravel.png" class="img-responsive"></a>
	                            	<div class="gray-hover hidden hidden-xs hidden-sm">
	                            		<p class="price">$260</p>
	                            		<p class="discount">(80% off)</p>
	                            	</div>
	                            	<span class="text-center">
	                            		<p>Annual Travel Plan</p>
	                            	</span>
	                            </div>
	                            <div class="col-xs-4">
	                            	<a href="#offer2"><img src="assets2/images/fwdiscover/single-trip.png" class="img-responsive"></a>
	                            	<div class="gray-hover hidden hidden-xs hidden-sm">
	                            		<p class="price">$55</p>
	                            		<p class="discount">(80% off)</p>
	                            	</div>
	                            	<span class="text-center">
	                            		<p>14-day Single Trip Travel Plan</p>
	                            	</span>
	                            </div>
	                            <div class="col-xs-4">
	                            	<a href="#offer3"><img src="assets2/images/fwdiscover/4daysingletrave.png" class="img-responsive"></a>
	                            	<div class="gray-hover hidden hidden-xs hidden-sm">
	                            		<p class="price">FREE</p>
	                            		<p class="discount">(w/ pocket wi-fi)</p>
	                            	</div>
	                            	<span class="text-center">
	                            		<p>4-day Single Trip Travel Plan</p>
	                            	</span>
	                            </div>
	                        </div>
	                        <!--/row-->
	                    </div>	

	                    <div class="item">
	                        <div class="row">
	                            <div class="col-xs-4">
	                            	<a href="#offer4"><img src="assets2/images/fwdiscover/1yearhomeplan.jpg" class="img-responsive"></a>
	                            	<div class="gray-hover hidden hidden-xs hidden-sm">
	                            		<p class="price">$210</p>
	                            		<p class="discount">(50% off)</p>
	                            	</div>
	                            	<span class="text-center">
	                            		<p>1-year Home Insurance Plan</p>
	                            	</span>
	                            </div>
	                            <div class="col-xs-4">
	                            	<a href="#offer5"><img src="assets2/images/fwdiscover/1yearworkingholiday.jpg" class="img-responsive"></a>
	                            	<div class="gray-hover hidden hidden-xs hidden-sm">
	                            		<p class="price">$2,100</p>
	                            		<p class="discount">(40% off)</p>
	                            	</div>
	                            	<span class="text-center">
	                            		<p>1-year Working Holiday Plan</p>
	                            	</span>
	                            </div>
	                            <div class="col-xs-4">
	                            	
	                            </div>
	                        </div>
	                        <!--/row-->
	                    </div>	

	                </div>
	                <!--/carousel-inner--> 
	                <a class="left carousel-control hidden-md hidden-lg" href="#myCarousel-fwdiscover" data-slide="prev">
	                	<div class="img-holder">
	                		<img src="assets2/images/fwdiscover/carousel-left.png" class="img-responsive">
	                	</div>
	                </a>

	                <a class="right carousel-control hidden-md hidden-lg" href="#myCarousel-fwdiscover" data-slide="next">
	                	<div class="img-holder">
	                		<img src="assets2/images/fwdiscover/carousel-right.png" class="img-responsive">
	                	</div>
	                </a>
	            </div>
	            <!--/myCarousel-->
				
				<!-- PLANS -->
				<div class="plans-holder">
					<!-- first plan -->
					<div class="plan">
						<img src="assets2/images/fwdiscover/plan-annualtravel.jpg" class="img-responsive hidden-lg hidden-md">
						<img src="assets2/images/fwdiscover/plan-annualtravel-desktop.jpg" class="img-responsive hidden-xs hidden-sm">

						<div class="plan-details-box gray-bg left">
							<div class="plan-desc">
								<div class="upper-desc">
									<p class="title">Annual Travel Plan</p>
									<p class="promo">now <span class="price">HK$260</span> <span class="italic">(80% off)</span></p>
								</div>
								<div class="lower-desc">
									<ul>
										<li>Original price: HK$1,300</li>
										<li>Year-round coverage up to 90 days per trip...</li>
									</ul>
								</div>
							</div>

							<div class="desc-and-button-holder clearfix">
								<div class="promo-desc text-center">
									<div class="clearfix">
										<div class="holder">
											<p class="title">Quota</p>
											<p class="value">20</p>
										</div>
										<div class="holder date">
											<p class="title">Ends</p>
											<p class="value date">NOV</p>
											<p class=" value date day">19</p>
										</div>
									</div>
								</div>

								<div class="details-button-holder text-center" name="offer1">
									<button class="details-btn" id="first-plan">Details</button>
								</div>
							</div>
						</div>
					</div>
					<!-- end first plan -->
					<!-- second plan -->
					<div class="plan">
						<img src="assets2/images/fwdiscover/plan-14dayssingletrip.jpg" class="img-responsive hidden-md hidden-lg">
						<img src="assets2/images/fwdiscover/plan-14dayssingletrip-desktop.jpg" class="img-responsive hidden-xs hidden-sm">
						<div class="plan-details-box blue-bg right">
							<div class="plan-desc">
								<div class="upper-desc">
									<p class="title">14-day Single Trip Travel Plan</p>
									<p class="promo">now <span class="price">HK$55</span> <span class="italic">(80% off)</span></p>
								</div>
								<div class="lower-desc">
									<ul>
										<li>Original price: HK$273</li>
										<li>Valid for one individual...</li>
									</ul>
								</div>
							</div>

							<div class="desc-and-button-holder clearfix">
								<div class="promo-desc text-center">
									<div class="clearfix">
										<div class="holder">
											<p class="title">Quota</p>
											<p class="value">10</p>
										</div>
										<div class="holder date">
											<p class="title">Ends</p>
											<p class="value date">NOV</p>
											<p class=" value date day">19</p>
										</div>
									</div>
								</div>

								<div class="details-button-holder text-center" name="offer2">
									<button class="details-btn" id="second-plan">Details</button>
								</div>
							</div>
						</div>
					</div>
					<!-- end second plan -->
					<!-- third plan -->
					<div class="plan">
						<img src="assets2/images/fwdiscover/plan-4daysingletravel.jpg" class="img-responsive hidden-md hidden-lg">
						<img src="assets2/images/fwdiscover/plan-4daysingletravel-desktop.jpg" class="img-responsive hidden-xs hidden-sm">

						<div class="plan-details-box orange-bg left">
							<div class="plan-desc">
								<div class="upper-desc">
									<p class="title">4-day Single Trip Travel Plan</p>
									<p class="promo">now <span class="price">FREE</span> <span class="second-line">plus 3-day pocket wi-fi</span></p>
								</div>
								<div class="lower-desc">
									<ul>
										<li>Original price: HK$135</li>
										<li>Pocket wifi provided by Y5buddy worth up...</li>
									</ul>
								</div>
							</div>

							<div class="desc-and-button-holder clearfix">
								<div class="promo-desc text-center">
									<div class="clearfix">
										<div class="holder">
											<p class="title">Quota</p>
											<p class="value">20</p>
										</div>
										<div class="holder date">
											<p class="title">Ends</p>
											<p class="value date">NOV</p>
											<p class=" value date day">19</p>
										</div>
									</div>
								</div>

								<div class="details-button-holder text-center" name="offer3">
									<button class="details-btn" id="third-plan">Details</button>
								</div>
							</div>
						</div>
					</div>
					<!-- end third plan -->
					<!-- fourth plan -->
					<div class="plan">
						<img src="assets2/images/fwdiscover/plan-1yearhome.jpg" class="img-responsive hidden-md hidden-lg">
						<img src="assets2/images/fwdiscover/plan-1yearhome-desktop.jpg" class="img-responsive hidden-xs hidden-sm">

						<div class="plan-details-box light-blue-bg right">
							<div class="plan-desc">
								<div class="upper-desc">
									<p class="title">1-year Home Insurance Plan</p>
									<p class="promo">now <span class="price">HK$210</span> <span class="italic">(50% off)</p>
								</div>
								<div class="lower-desc">
									<ul>
										<li>Original price: HK$420</li>
										<li>Applicable to any home below net floor area...</li>
									</ul>
								</div>
							</div>

							<div class="desc-and-button-holder clearfix">
								<div class="promo-desc text-center">
									<div class="clearfix">
										<div class="holder">
											<p class="title">Quota</p>
											<p class="value">10</p>
										</div>
										<div class="holder date">
											<p class="title">Ends</p>
											<p class="value date">NOV</p>
											<p class=" value date day">19</p>
										</div>
									</div>
								</div>

								<div class="details-button-holder text-center" name="offer4">
									<button class="details-btn" id="fourth-plan">Details</button>
								</div>
							</div>
						</div>
					</div>
					<!-- end fourth plan -->
					<!-- fiffth plan -->
					<div class="plan">
						<img src="assets2/images/fwdiscover/plan-workingholiday.jpg" class="img-responsive hidden-md hidden-lg">
						<img src="assets2/images/fwdiscover/plan-workingholiday-desktop.jpg" class="img-responsive hidden-xs hidden-sm">

						<div class="plan-details-box red-bg left">
							<div class="plan-desc">
								<div class="upper-desc">
									<p class="title two-lines">1-year Working Holiday Plan</p>
									<p class="promo">now <span class="price">HK$2,100</span> <span class="italic">(40% off)</p>
								</div>
								<div class="lower-desc">
									<ul>
										<li>Original price: HK$3,500</li>
										<li>Enjoy full/partial refund if unable to continue...</li>
									</ul>
								</div>
							</div>

							<div class="desc-and-button-holder clearfix">
								<div class="promo-desc text-center">
									<div class="clearfix">
										<div class="holder">
											<p class="title">Quota</p>
											<p class="value">20</p>
										</div>
										<div class="holder date">
											<p class="title">Ends</p>
											<p class="value date">NOV</p>
											<p class=" value date day">19</p>
										</div>
									</div>
								</div>

								<div class="details-button-holder text-center" name="offer5">
									<button class="details-btn">Details</button>
								</div>
							</div>
						</div>
					</div>
					<!-- end fifth plan -->
				</div>
				<!-- end PLANS -->

				<!-- fwdiscover footer -->
				<div class="fwdiscover-footer">
					<div id="myCarousel-footer" class="carousel slide hidden"> 
						<ol class="carousel-indicators hidden-md hidden-lg">
					    <li data-target="#myCarousel-footer" data-slide-to="0" class="active"></li>
					    <li data-target="#myCarousel-footer" data-slide-to="1"></li>
					    <li data-target="#myCarousel-footer" data-slide-to="2"></li>
					    <li data-target="#myCarousel-footer" data-slide-to="3"></li>
					    <li data-target="#myCarousel-footer" data-slide-to="4"></li>
					    <li data-target="#myCarousel-footer" data-slide-to="5"></li>
					  </ol>
		                <!-- Carousel items -->
		                <div class="carousel-inner">
		                    <div class="item active clearfix">
		                    	<div class="footer-image-holder">
                            		<img src="assets2/images/fwdiscover/footer-image.jpg" class="img-responsive">
                            	</div>
                            	<div class="footer-image-info-holder">
                            		<div class="sponsor-logo">
		                				<img src="assets2/images/fwdiscover/footer-agoda.png" class="img-responsive">
		                			</div>

		                			<div class="promo-info-holder">
		                				<div class="clearfix">
				                			<p class="save">SAVE <span>UP TO</span></p>
				                			<p class="percent">75%</p>
				                		</div>
				                		<p class="hotels">on 525,000+ hotels with Agoda</p>
		                			</div>
		                		</div>
		                    </div>			  
		                    <div class="item clearfix">
		                    	<div class="footer-image-holder">
                            		<img src="assets2/images/fwdiscover/footer-image.jpg" class="img-responsive">
                            	</div>
                            	<div class="footer-image-info-holder">
                            		<div class="sponsor-logo">
		                				<img src="assets2/images/fwdiscover/footer-agoda.png" class="img-responsive">
		                			</div>

		                			<div class="promo-info-holder">
		                				<div class="clearfix">
				                			<p class="save">SAVE <span>UP TO</span></p>
				                			<p class="percent">75%</p>
				                		</div>
				                		<p class="hotels">on 525,000+ hotels with Agoda</p>
		                			</div>
		                		</div>
		                    </div>	   
		                    <div class="item clearfix">
		                    	<div class="footer-image-holder">
                            		<img src="assets2/images/fwdiscover/footer-image.jpg" class="img-responsive">
                            	</div>
                            	<div class="footer-image-info-holder">
                            		<div class="sponsor-logo">
		                				<img src="assets2/images/fwdiscover/footer-agoda.png" class="img-responsive">
		                			</div>

		                			<div class="promo-info-holder">
		                				<div class="clearfix">
				                			<p class="save">SAVE <span>UP TO</span></p>
				                			<p class="percent">75%</p>
				                		</div>
				                		<p class="hotels">on 525,000+ hotels with Agoda</p>
		                			</div>
		                		</div>
		                    </div>
		                    <div class="item clearfix">
		                    	<div class="footer-image-holder">
                            		<img src="assets2/images/fwdiscover/footer-image.jpg" class="img-responsive">
                            	</div>
                            	<div class="footer-image-info-holder">
                            		<div class="sponsor-logo">
		                				<img src="assets2/images/fwdiscover/footer-agoda.png" class="img-responsive">
		                			</div>

		                			<div class="promo-info-holder">
		                				<div class="clearfix">
				                			<p class="save">SAVE <span>UP TO</span></p>
				                			<p class="percent">75%</p>
				                		</div>
				                		<p class="hotels">on 525,000+ hotels with Agoda</p>
		                			</div>
		                		</div>
		                    </div>
		                    <div class="item clearfix">
		                    	<div class="footer-image-holder">
                            		<img src="assets2/images/fwdiscover/footer-image.jpg" class="img-responsive">
                            	</div>
                            	<div class="footer-image-info-holder">
                            		<div class="sponsor-logo">
		                				<img src="assets2/images/fwdiscover/footer-agoda.png" class="img-responsive">
		                			</div>

		                			<div class="promo-info-holder">
		                				<div class="clearfix">
				                			<p class="save">SAVE <span>UP TO</span></p>
				                			<p class="percent">75%</p>
				                		</div>
				                		<p class="hotels">on 525,000+ hotels with Agoda</p>
		                			</div>
		                		</div>
		                    </div>
		                    <div class="item clearfix">
		                    	<div class="footer-image-holder">
                            		<img src="assets2/images/fwdiscover/footer-image.jpg" class="img-responsive">
                            	</div>
                            	<div class="footer-image-info-holder">
                            		<div class="sponsor-logo">
		                				<img src="assets2/images/fwdiscover/footer-agoda.png" class="img-responsive">
		                			</div>

		                			<div class="promo-info-holder">
		                				<div class="clearfix">
				                			<p class="save">SAVE <span>UP TO</span></p>
				                			<p class="percent">75%</p>
				                		</div>
				                		<p class="hotels">on 525,000+ hotels with Agoda</p>
		                			</div>
		                		</div>
		                    </div>               
		                </div>
		                <!--/carousel-inner--> 
		                <a class="left carousel-control hidden-md hidden-lg" href="#myCarousel-footer" data-slide="prev">
		                	<div class="img-holder">
		                		<img src="assets2/images/fwdiscover/carousel-left.png" class="img-responsive">
		                	</div>
		                </a>

		                <a class="right carousel-control hidden-md hidden-lg" href="#myCarousel-footer" data-slide="next">
		                	<div class="img-holder">
		                		<img src="assets2/images/fwdiscover/carousel-right.png" class="img-responsive">
		                	</div>
		                </a>
		            </div>
		            <!--/myCarousel-->

		            <!-- terms and cond -->
	            	<div class="terms-and-condition">
	            		<p class="message">Terms & Conditions 
	            			<img src="assets2/images/fwdiscover/terms-and-cond.png" class="img-responsive hidden-md hidden-lg">
	            			<img src="assets2/images/fwdiscover/terms-and-cond-desktop.png" class="img-responsive hidden-xs hidden-sm">
	            		</p>
	            	</div>
		            <!-- end terms and cond -->

		            <!-- partners -->
		            <div class="our-partners">
		            	<div class="partners-holder">
		            		<p class="text-center">Our Partners</p>
		            		<div class="clearfix">
			            		<div class="partner-image-holder">
			            			<img src="assets2/images/fwdiscover/partner-agoda.png" class="img-responsive agoda hidden">
			            		</div>
			            		<div class="partner-image-holder">
			            			<img src="assets2/images/fwdiscover/partner-y5.png" class="img-responsive y5">
			            		</div>
			            		<div class="partner-image-holder">
			            			<img src="assets2/images/fwdiscover/partner-boconcept.png" class="img-responsive boconcept hidden">
			            		</div>
			            		<div class="partner-image-holder last">
			            			<img src="assets2/images/fwdiscover/partner-pricerite.png" class="img-responsive pricerite hidden">
			            		</div>
			            	</div>
		            	</div>
		            </div>
		            <!-- end partners -->
				</div>
				<!-- end fwdiscover footer -->

				<!-- MODALS -->
				<div class="modal fade fwdiscover-modal" id="offer-details" role="dialog" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<p class="title">Annual Travel Plan</p>
							<p class="promo">now <span class="price">HK$260</span> <span class="italic">(80% off)</span></p>

							<ul>
								<li>Original price: HK$1,300</li>
								<li>Year-round coverage up to 90 days per trip</li>
								<li>Covers medical expenses, baggage loss/damage, personal liability etc.</li>
							</ul>

							<div class="details-button-holder text-center">
								<button class="details-btn">Grab!</button>
							</div>

							<div class="terms-and-condition">
								<p class="title">Terms & Conditions</p>
								<p class="content">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam non velit id enim porttitor sagittis at id urna. Phasellus vehicula vulputate elit vel fermentum. Donec libero turpis, consectetur id porttitor at, mollis ac felis. Nulla condimentum vulputate condimentum. In hac habitasse platea dictumst. Cras sed nibh molestie, pharetra ipsum lobortis, sodales sapien. Maecenas urna ipsum, placerat et tincidunt sagittis, malesuada eget nunc.</p>
							</div>

							<p class="close-modal">Close</p>
						</div>
					</div>
				</div>

				<div class="modal fade fwdiscover-modal" id="offer-details-promotion-code" role="dialog" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<p class="title">Annual Travel Plan</p>
							<p class="promo">now <span class="price">HK$260</span> <span class="italic">(80% off)</span></p>

							<div class="promo-code-holder">
								<p class="text-center congrats">Congratulations!</p>
								<p class="code">FWD987654321</p>
								<p class="note">Use this offer by entering the above promotion code</p>
							</div>

							<div class="details-button-holder text-center">
								<button class="details-btn">Buy now!</button>
							</div>

							<div class="terms-and-condition offer-details">
								<p class="title">Terms & Conditions</p>
								<p class="content">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam non velit id enim porttitor sagittis at id urna. Phasellus vehicula vulputate elit vel fermentum. Donec libero turpis, consectetur id porttitor at, mollis ac felis. Nulla condimentum vulputate condimentum. In hac habitasse platea dictumst. Cras sed nibh molestie, pharetra ipsum lobortis, sodales sapien. Maecenas urna ipsum, placerat et tincidunt sagittis, malesuada eget nunc.</p>
							</div>

							<p class="close-modal">Close</p>
						</div>
					</div>
				</div>

				<div class="modal fade fwdiscover-modal" id="offer-details-promotion-code-error-once" role="dialog" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<p class="title">Annual Travel Plan</p>

							<div class="error-message">
								<p>You may only get the promotion code once for each offer.</p>
								<p class="lower">Say tuned to our next wave of FWDiscover offers.</p>
							</div>
							
							<div class="terms-and-condition">
								<p class="title">Terms & Conditions</p>
								<p class="content">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam non velit id enim porttitor sagittis at id urna. Phasellus vehicula vulputate elit vel fermentum. Donec libero turpis, consectetur id porttitor at, mollis ac felis. Nulla condimentum vulputate condimentum. In hac habitasse platea dictumst. Cras sed nibh molestie, pharetra ipsum lobortis, sodales sapien. Maecenas urna ipsum, placerat et tincidunt sagittis, malesuada eget nunc.</p>
							</div>

							<p class="close-modal">Close</p>
						</div>
					</div>
				</div>

				<div class="modal fade fwdiscover-modal" id="offer-details-promotion-code-error-sold" role="dialog" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<p class="title">Annual Travel Plan</p>

							<div class="error-message">
								<p>Unfortunately the offer you have selected is already sold out.</p>
								<p class="lower">Say tuned to our next wave of FWDiscover offers.</p>
							</div>
							
							<div class="terms-and-condition">
								<p class="title">Terms & Conditions</p>
								<p class="content">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam non velit id enim porttitor sagittis at id urna. Phasellus vehicula vulputate elit vel fermentum. Donec libero turpis, consectetur id porttitor at, mollis ac felis. Nulla condimentum vulputate condimentum. In hac habitasse platea dictumst. Cras sed nibh molestie, pharetra ipsum lobortis, sodales sapien. Maecenas urna ipsum, placerat et tincidunt sagittis, malesuada eget nunc.</p>
							</div>

							<p class="close-modal">Close</p>
						</div>
					</div>
				</div>

				<a href="#" id="gotop" class="go-top go-top-default"><img src="assets2/images/fwdiscover/to-top.jpg"></a> 
			</div>
			<!-- FOOTER -->
			<%@include file="includes/footer-block.jsp" %>
		</div>
		<!-- JS INCLUDES -->
		<%@include file="includes/js-include.jsp" %>		
		<script src="assets2/js/jquery.countdown.min.js"></script>
		<script type="text/javascript">

		$("#myCarousel-fwdiscover .carousel-inner .item a").click(function(){
			var temp = $(this).attr('href');
			var des = temp.substring(1, temp.length);

			if(getWidth()<992) {
	        	$('html, body').animate({
					scrollTop: $('[name="'+des+'"]').offset().top - ($('[name="'+des+'"]').parents('.plan').find('.plan-details-box').height()-60)
				}, 1000);
			}
			else {
				$('html, body').animate({
					scrollTop: $('[name="'+des+'"]').offset().top - ($('[name="'+des+'"]').parents('.plan').find('.plan-details-box').height()+60 + $('.navbar-fixed-top').height())
				}, 1000);
			}
    	});

    	$("#myCarousel-fwdiscover .carousel-inner .item .gray-hover").click(function(){
    		$(this).parent().find('a').trigger('click');
    	});

		$("#myCarousel-fwdiscover .carousel-inner .item a").mouseover(function() {
			$("#myCarousel-fwdiscover .carousel-inner .item .gray-hover").addClass('hidden');
			$(this).next('.gray-hover').removeClass('hidden');
		});

		$("#myCarousel-fwdiscover .carousel-inner .item .gray-hover").mouseleave(function() {
			$(this).addClass('hidden');
		});

		$("#first-plan").on('click', function(){
	        $('#offer-details').modal('show');
	    });
	    $("#second-plan").on('click', function(){
	        $('#offer-details-promotion-code').modal('show');
	    });
	    $("#third-plan").on('click', function(){
	        $('#offer-details-promotion-code-error-once').modal('show');
	    });
	    $("#fourth-plan").on('click', function(){
	        $('#offer-details-promotion-code-error-sold').modal('show');
	    });

	    $(".fwdiscover-modal .close-modal").on('click', function(){
	    	$('.modal').modal('hide');
	    });

	    $("#countdown")
		   .countdown("2015/12/25", function(event) {
		    $('#countdown-days').text(
		      event.strftime('%D')
		    );

		    $('#countdown-hours').text(
		      event.strftime('%H')
		    );

		    $('#countdown-minutes').text(
		      event.strftime('%M')
		    );

		    $('#countdown-seconds').text(
		      event.strftime('%S')
		    );

	   });
		
		$(window).load(function () {
			if(msieversion() < 1) {
				carouselImgHeight();
			}
		});

		if(getWidth()>991) {
			$('#myCarousel-fwdiscover').removeClass('carousel slide');
			$('#myCarousel-fwdiscover .carousel-inner .item .row').children().addClass('desktop-img-align');
			$('#myCarousel-fwdiscover .carousel-inner .item .row').children().removeClass('col-xs-4');
			$('#myCarousel-fwdiscover .carousel-inner .item').children().removeClass('row');
		

			$('#myCarousel-footer').removeClass('carousel slide');
			$('#myCarousel-footer .carousel-inner').children().wrap('<div class="col-md-4"></div>');
		}

		function carouselImgHeight() {
			if(getWidth()<992) {
				var list = new Array();
				$('#myCarousel-fwdiscover .carousel-inner .item.active .col-xs-4 img').each(function() {
					var height = $(this).height();
					list.push(height);
				});
				var newHeight = Math.min.apply( Math, list );
				$('#myCarousel-fwdiscover .carousel-inner .item .col-xs-4 img').css('height',newHeight+"px");
			}
		}
		</script>
	</body>
</html>