<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<%!
	boolean isSaleActiveClass = true;
	boolean isEservicesActiveClass = false;
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/styles-fwdiscover.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/styles.css" />
		<div class="fwd-savie-wrapper fwdiscover-wrapper">			
			<!--Top Header-->
			<div class="page-fwdiscover">
				<div class="breadcrumbs-holder">
					<div class="fwd-container container-fluid hidden-xs hidden-sm clearfix">
						<div class="breadcrumbs pull-left">
							<ol class="breadcrumb breadcrumbs-product-details breadcrumbs-landing">
								<li><a href="#"><fmt:message key="breadcrumb.home" bundle="${msg}" /></a></li>
								<li class="divider"><i class="fa fa-play"></i></li>
								<li><a href="#"><fmt:message key="breadcrumb.fwdiscover.category" bundle="${msg}" /></a></li>
								<li class="divider last"><i class="fa fa-play"></i></li>
								<li class="active-bc"><fmt:message key="breadcrumb.fwdiscover.product" bundle="${msg}" /></li>
							</ol>
						</div>
					</div>
				</div>
				<div class="fwdiscover-info clearfix">
					<div class="fwd-full-container container-fluid fwdiscover-banner clearfix">
						<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/page-banner-mobile.jpg" class="img-responsive hidden-md hidden-lg">
						<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/page-banner-desktop.jpg" class="img-responsive hidden-sm hidden-xs">

						<div class="banner-title">
							<p class="welcome"><fmt:message key="jumbo.fwdiscover1" bundle="${msg}" /></p>
							<p class="fwdiscover"><fmt:message key="jumbo.fwdiscover2" bundle="${msg}" /></p>
						</div>
					</div>

					<div class="clearfix fwdiscover-container">
						<div class="fwdiscover-description">
							<p><fmt:message key="Fanfare.landingpage.description1.part1" bundle="${msg}" /></p>
							<p><fmt:message key="Fanfare.landingpage.description1.part2" bundle="${msg}" />
								<span class="grab"><fmt:message key="Fanfare.landingpage.description1.part3" bundle="${msg}" /></span>
							</p>
							<p class="register">
								<fmt:message key="Fanfare.landingpage.description2.part1" bundle="${msg}" /> <a href="<%=request.getContextPath()%><fmt:message key="link.register" bundle="${msg}" />"><fmt:message key="Fanfare.landingpage.description2.part2" bundle="${msg}" /></a> <fmt:message key="Fanfare.landingpage.description2.part3" bundle="${msg}" />
							</p>
						</div>

						<div class="fwdiscover-timer pull-right">
							<p class="hurry"><fmt:message key="Fanfare.landingpage.timerword" bundle="${msg}" /></p>
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
									<span class="desc text-center"><fmt:message key="Fanfare.landingpage.timer1" bundle="${msg}" /></span>
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
										<span class="desc text-center"><fmt:message key="Fanfare.landingpage.timer2" bundle="${msg}" /></span>
									</div>

									<div class="timer-holder right">
										<div class="bg">
											<div class="clearfix">
												<span class="number pull-left" id="countdown-hours">20</span>
											</div>
											<span class="line"></span>
										</div>
										<span class="desc text-center"><fmt:message key="Fanfare.landingpage.timer3" bundle="${msg}" /></span>
									</div>

									<div class="timer-holder right">
										<div class="bg">
											<div class="clearfix">
												<span class="number pull-left" id="countdown-minutes">42</span>
											</div>
											<span class="line"></span>
										</div>
										<span class="desc text-center"><fmt:message key="Fanfare.landingpage.timer4" bundle="${msg}" /></span>
									</div>

									<div class="timer-holder right">
										<div class="bg">
											<div class="clearfix">
												<span class="number pull-left" id="countdown-seconds">28</span>
											</div>
											<span class="line"></span>
										</div>
										<span class="desc text-center"><fmt:message key="Fanfare.landingpage.timer5" bundle="${msg}" /></span>
									</div>
								</div>
								<!-- end DAY HOUR MINS SECS -->
							</div>
						</div>
					</div>
				</div>


	            <div id="myCarousel-fwdiscover" class="carousel slide fwdiscover-container">
	                
	                <!-- Carousel items -->
	                <div class="carousel-inner clearfix">
	                    <div class="item active">
	                        <div class="row">
	                            <div class="col-xs-4">
	                            	<a href="#offer1"><img src="<%=request.getContextPath()%>/resources/images/fwdiscover/annualtravel.png" class="img-responsive"></a>
	                            	<div class="gray-hover hidden hidden-xs hidden-sm">
	                            		<p class="price"><fmt:message key="Fanfare.landingpage.thumbnail1.price" bundle="${msg}" /></p>
	                            		<p class="discount"><fmt:message key="Fanfare.landingpage.thumbnail1.copy" bundle="${msg}" /></p>
	                            	</div>
	                            	<span class="text-center">
	                            		<p><fmt:message key="Fanfare.landingpage.thumbnail1" bundle="${msg}" /></p>
	                            	</span>
	                            </div>
	                            <div class="col-xs-4">
	                            	<a href="#offer2"><img src="<%=request.getContextPath()%>/resources/images/fwdiscover/single-trip.png" class="img-responsive"></a>
	                            	<div class="gray-hover hidden hidden-xs hidden-sm">
	                            		<p class="price"><fmt:message key="Fanfare.landingpage.thumbnail2.price" bundle="${msg}" /></p>
	                            		<p class="discount"><fmt:message key="Fanfare.landingpage.thumbnail2.copy" bundle="${msg}" /></p>
	                            	</div>
	                            	<span class="text-center">
	                            		<p><fmt:message key="Fanfare.landingpage.thumbnail2" bundle="${msg}" /></p>
	                            	</span>
	                            </div>
	                            <div class="col-xs-4">
	                            	<a href="#offer3"><img src="<%=request.getContextPath()%>/resources/images/fwdiscover/4daysingletrave.png" class="img-responsive"></a>
	                            	<div class="gray-hover hidden hidden-xs hidden-sm">
	                            		<p class="price"><fmt:message key="Fanfare.landingpage.thumbnail3.price" bundle="${msg}" /></p>
	                            		<p class="discount"><fmt:message key="Fanfare.landingpage.thumbnail3.copy" bundle="${msg}" /></p>
	                            	</div>
	                            	<span class="text-center">
	                            		<p><fmt:message key="Fanfare.landingpage.thumbnail3" bundle="${msg}" /></p>
	                            	</span>
	                            </div>
	                        </div>
	                        <!--/row-->
	                    </div>	

	                    <div class="item">
	                        <div class="row">
	                            <div class="col-xs-4">
	                            	<a href="#offer4"><img src="<%=request.getContextPath()%>/resources/images/fwdiscover/1yearhomeplan.jpg" class="img-responsive"></a>
	                            	<div class="gray-hover hidden hidden-xs hidden-sm">
	                            		<p class="price"><fmt:message key="Fanfare.landingpage.thumbnail4.price" bundle="${msg}" /></p>
	                            		<p class="discount"><fmt:message key="Fanfare.landingpage.thumbnail4.copy" bundle="${msg}" /></p>
	                            	</div>
	                            	<span class="text-center">
	                            		<p><fmt:message key="Fanfare.landingpage.thumbnail4" bundle="${msg}" /></p>
	                            	</span>
	                            </div>
	                            <div class="col-xs-4">
	                            	<a href="#offer5"><img src="<%=request.getContextPath()%>/resources/images/fwdiscover/1yearworkingholiday.jpg" class="img-responsive"></a>
	                            	<div class="gray-hover hidden hidden-xs hidden-sm">
	                            		<p class="price"><fmt:message key="Fanfare.landingpage.thumbnail5.price" bundle="${msg}" /></p>
	                            		<p class="discount"><fmt:message key="Fanfare.landingpage.thumbnail5.copy" bundle="${msg}" /></p>
	                            	</div>
	                            	<span class="text-center">
	                            		<p><fmt:message key="Fanfare.landingpage.thumbnail5" bundle="${msg}" /></p>
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
	                		<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/carousel-left.png" class="img-responsive">
	                	</div>
	                </a>

	                <a class="right carousel-control hidden-md hidden-lg" href="#myCarousel-fwdiscover" data-slide="next">
	                	<div class="img-holder">
	                		<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/carousel-right.png" class="img-responsive">
	                	</div>
	                </a>
	            </div>
	            <!--/myCarousel-->
				
				<!-- PLANS -->
				<div class="plans-holder fwdiscover-container">
					<!-- first plan -->
					<div class="fwdiscover-plan">
						<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/plan-annualtravel.jpg" class="img-responsive hidden-lg hidden-md">
						<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/plan-annualtravel-desktop.jpg" class="img-responsive hidden-xs hidden-sm">

						<div class="plan-details-box gray-bg left">
							<div class="plan-desc">
								<div class="upper-desc">
									<p class="title"><fmt:message key="Fanfare.landingpage.offer1" bundle="${msg}" /></p>
									<p class="promo"><fmt:message key="Fanfare.landingpage.offer2" bundle="${msg}" /> <span class="price"><fmt:message key="Fanfare.landingpage.offer3" bundle="${msg}" /></span> <span class="italic"><fmt:message key="Fanfare.landingpage.offer4" bundle="${msg}" /></span></p>
								</div>
								<div class="lower-desc">
									<ul>
										<li><fmt:message key="Fanfare.landingpage.offer1.bullet1" bundle="${msg}" /></li>
										<li><fmt:message key="Fanfare.landingpage.offer1.bullet2" bundle="${msg}" /></li>
										<li><fmt:message key="Fanfare.landingpage.offer1.bullet3" bundle="${msg}" /></li>
										<li><fmt:message key="Fanfare.landingpage.offer1.bullet4" bundle="${msg}" /></li>
										<li><fmt:message key="Fanfare.landingpage.offer1.bullet5" bundle="${msg}" /></li>
									</ul>
								</div>
							</div>

							<div class="desc-and-button-holder clearfix">
								<div class="promo-desc text-center">
									<div class="clearfix">
										<div class="holder">
											<p class="title"><fmt:message key="Fanfare.landingpage.offer1.box1" bundle="${msg}" /></p>
											<p class="value">20</p>
										</div>
										<div class="holder date">
											<p class="title"><fmt:message key="Fanfare.landingpage.offer1.box2" bundle="${msg}" /></p>
											<p class="value date">NOV</p>
											<p class=" value date day">19</p>
										</div>
									</div>
								</div>

								<div class="details-button-holder text-center" name="offer1">
									<button class="details-btn" id="first-plan"><fmt:message key="Fanfare.landingpage.offer1.button" bundle="${msg}" /></button>
								</div>
							</div>
						</div>
					</div>
					<!-- end first plan -->
					<!-- second plan -->
					<div class="fwdiscover-plan">
						<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/plan-14dayssingletrip.jpg" class="img-responsive hidden-md hidden-lg">
						<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/plan-14dayssingletrip-desktop.jpg" class="img-responsive hidden-xs hidden-sm">
						<div class="plan-details-box blue-bg right">
							<div class="plan-desc">
								<div class="upper-desc">
									<p class="title"><fmt:message key="Fanfare.landingpage.offer2" bundle="${msg}" /></p>
									<p class="promo"><fmt:message key="Fanfare.landingpage.offer2.subtitle1" bundle="${msg}" /> <span class="price"><fmt:message key="Fanfare.landingpage.offer2.subtitle2" bundle="${msg}" /></span> <span class="italic"><fmt:message key="Fanfare.landingpage.offer2.subtitle3" bundle="${msg}" /></span></p>
								</div>
								<div class="lower-desc">
									<ul>
										<li><fmt:message key="Fanfare.landingpage.offer2.bullet1" bundle="${msg}" /></li>
										<li><fmt:message key="Fanfare.landingpage.offer2.bullet2" bundle="${msg}" /></li>
										<li><fmt:message key="Fanfare.landingpage.offer2.bullet3" bundle="${msg}" /></li>
										<li><fmt:message key="Fanfare.landingpage.offer2.bullet4" bundle="${msg}" /></li>
									</ul>
								</div>
							</div>

							<div class="desc-and-button-holder clearfix">
								<div class="promo-desc text-center">
									<div class="clearfix">
										<div class="holder">
											<p class="title"><fmt:message key="Fanfare.landingpage.offer2.box1" bundle="${msg}" /></p>
											<p class="value">10</p>
										</div>
										<div class="holder date">
											<p class="title"><fmt:message key="Fanfare.landingpage.offer2.box2" bundle="${msg}" /></p>
											<p class="value date">NOV</p>
											<p class=" value date day">19</p>
										</div>
									</div>
								</div>

								<div class="details-button-holder text-center" name="offer2">
									<button class="details-btn" id="second-plan"><fmt:message key="Fanfare.landingpage.offer2.button" bundle="${msg}" /></button>
								</div>
							</div>
						</div>
					</div>
					<!-- end second plan -->
					<!-- third plan -->
					<div class="fwdiscover-plan">
						<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/plan-4daysingletravel.jpg" class="img-responsive hidden-md hidden-lg">
						<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/plan-4daysingletravel-desktop.jpg" class="img-responsive hidden-xs hidden-sm">

						<div class="plan-details-box orange-bg left">
							<div class="plan-desc">
								<div class="upper-desc">
									<p class="title"><fmt:message key="Fanfare.landingpage.offer3" bundle="${msg}" /></p>
									<p class="promo"><fmt:message key="Fanfare.landingpage.offer3.subtitle1" bundle="${msg}" /> <span class="price"><fmt:message key="Fanfare.landingpage.offer3.subtitle2" bundle="${msg}" /></span> <span class="second-line"><fmt:message key="Fanfare.landingpage.offer3.subtitle3" bundle="${msg}" /></span></p>
								</div>
								<div class="lower-desc">
									<ul>
										<li><fmt:message key="Fanfare.landingpage.offer3.bullet1" bundle="${msg}" /></li>
										<li><fmt:message key="Fanfare.landingpage.offer3.bullet2" bundle="${msg}" /></li>
										<li><fmt:message key="Fanfare.landingpage.offer3.bullet3" bundle="${msg}" /></li>
										<li><fmt:message key="Fanfare.landingpage.offer3.bullet4" bundle="${msg}" /></li>
									</ul>
								</div>
							</div>

							<div class="desc-and-button-holder clearfix">
								<div class="promo-desc text-center">
									<div class="clearfix">
										<div class="holder">
											<p class="title"><fmt:message key="Fanfare.landingpage.offer3.box1" bundle="${msg}" /></p>
											<p class="value">20</p>
										</div>
										<div class="holder date">
											<p class="title"><fmt:message key="Fanfare.landingpage.offer3.box2" bundle="${msg}" /></p>
											<p class="value date">NOV</p>
											<p class=" value date day">19</p>
										</div>
									</div>
								</div>

								<div class="details-button-holder text-center" name="offer3">
									<button class="details-btn" id="third-plan"><fmt:message key="Fanfare.landingpage.offer3.button" bundle="${msg}" /></button>
								</div>
							</div>
						</div>
					</div>
					<!-- end third plan -->
					<!-- fourth plan -->
					<div class="fwdiscover-plan">
						<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/plan-1yearhome.jpg" class="img-responsive hidden-md hidden-lg">
						<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/plan-1yearhome-desktop.jpg" class="img-responsive hidden-xs hidden-sm">

						<div class="plan-details-box light-blue-bg right">
							<div class="plan-desc">
								<div class="upper-desc">
									<p class="title"><fmt:message key="Fanfare.landingpage.offer4" bundle="${msg}" /></p>
									<p class="promo"><fmt:message key="Fanfare.landingpage.offer4.subtitle1" bundle="${msg}" /> <span class="price"><fmt:message key="Fanfare.landingpage.offer4.subtitle2" bundle="${msg}" /></span> <span class="italic"><fmt:message key="Fanfare.landingpage.offer4.subtitle3" bundle="${msg}" /></p>
								</div>
								<div class="lower-desc">
									<ul>
										<li><fmt:message key="Fanfare.landingpage.offer4.bullet1" bundle="${msg}" /></li>
										<li><fmt:message key="Fanfare.landingpage.offer4.bullet2" bundle="${msg}" /></li>
										<li><fmt:message key="Fanfare.landingpage.offer4.bullet3" bundle="${msg}" /></li>
									</ul>
								</div>
							</div>

							<div class="desc-and-button-holder clearfix">
								<div class="promo-desc text-center">
									<div class="clearfix">
										<div class="holder">
											<p class="title"><fmt:message key="Fanfare.landingpage.offer4.box1" bundle="${msg}" /></p>
											<p class="value">10</p>
										</div>
										<div class="holder date">
											<p class="title"><fmt:message key="Fanfare.landingpage.offer4.box2" bundle="${msg}" /></p>
											<p class="value date">NOV</p>
											<p class=" value date day">19</p>
										</div>
									</div>
								</div>

								<div class="details-button-holder text-center" name="offer4">
									<button class="details-btn" id="fourth-plan"><fmt:message key="Fanfare.landingpage.offer4.button" bundle="${msg}" /></button>
								</div>
							</div>
						</div>
					</div>
					<!-- end fourth plan -->
					<!-- fiffth plan -->
					<div class="fwdiscover-plan">
						<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/plan-workingholiday.jpg" class="img-responsive hidden-md hidden-lg">
						<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/plan-workingholiday-desktop.jpg" class="img-responsive hidden-xs hidden-sm">

						<div class="plan-details-box red-bg left">
							<div class="plan-desc">
								<div class="upper-desc">
									<p class="title two-lines"><fmt:message key="Fanfare.landingpage.offer5" bundle="${msg}" /></p>
									<p class="promo"><fmt:message key="Fanfare.landingpage.offer5.subtitle1" bundle="${msg}" /> <span class="price"><fmt:message key="Fanfare.landingpage.offer5.subtitle2" bundle="${msg}" /></span> <span class="italic"><fmt:message key="Fanfare.landingpage.offer5.subtitle3" bundle="${msg}" /></p>
								</div>
								<div class="lower-desc">
									<ul>
										<li><fmt:message key="Fanfare.landingpage.offer5.bullet1" bundle="${msg}" /></li>
										<li><fmt:message key="Fanfare.landingpage.offer5.bullet2" bundle="${msg}" /></li>
										<li><fmt:message key="Fanfare.landingpage.offer5.bullet3" bundle="${msg}" /></li>
									</ul>
								</div>
							</div>

							<div class="desc-and-button-holder clearfix">
								<div class="promo-desc text-center">
									<div class="clearfix">
										<div class="holder">
											<p class="title"><fmt:message key="Fanfare.landingpage.offer5.box1" bundle="${msg}" /></p>
											<p class="value">20</p>
										</div>
										<div class="holder date">
											<p class="title"><fmt:message key="Fanfare.landingpage.offer5.box2" bundle="${msg}" /></p>
											<p class="value date">NOV</p>
											<p class=" value date day">19</p>
										</div>
									</div>
								</div>

								<div class="details-button-holder text-center" name="offer5">
									<button class="details-btn"><fmt:message key="Fanfare.landingpage.offer5.button" bundle="${msg}" /></button>
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
                            		<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/footer-image.jpg" class="img-responsive">
                            	</div>
                            	<div class="footer-image-info-holder">
                            		<div class="sponsor-logo">
		                				<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/footer-agoda.png" class="img-responsive">
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
                            		<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/footer-image.jpg" class="img-responsive">
                            	</div>
                            	<div class="footer-image-info-holder">
                            		<div class="sponsor-logo">
		                				<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/footer-agoda.png" class="img-responsive">
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
                            		<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/footer-image.jpg" class="img-responsive">
                            	</div>
                            	<div class="footer-image-info-holder">
                            		<div class="sponsor-logo">
		                				<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/footer-agoda.png" class="img-responsive">
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
                            		<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/footer-image.jpg" class="img-responsive">
                            	</div>
                            	<div class="footer-image-info-holder">
                            		<div class="sponsor-logo">
		                				<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/footer-agoda.png" class="img-responsive">
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
                            		<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/footer-image.jpg" class="img-responsive">
                            	</div>
                            	<div class="footer-image-info-holder">
                            		<div class="sponsor-logo">
		                				<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/footer-agoda.png" class="img-responsive">
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
                            		<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/footer-image.jpg" class="img-responsive">
                            	</div>
                            	<div class="footer-image-info-holder">
                            		<div class="sponsor-logo">
		                				<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/footer-agoda.png" class="img-responsive">
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
		                		<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/carousel-left.png" class="img-responsive">
		                	</div>
		                </a>

		                <a class="right carousel-control hidden-md hidden-lg" href="#myCarousel-footer" data-slide="next">
		                	<div class="img-holder">
		                		<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/carousel-right.png" class="img-responsive">
		                	</div>
		                </a>
		            </div>
		            <!--/myCarousel-->

		            <!-- terms and cond -->
	            	<div class="terms-and-condition">
	            		<p class="message">Terms & Conditions 
	            			<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/terms-and-cond.png" class="img-responsive mobile">
	            			<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/terms-and-cond-desktop.png" class="img-responsive desktop">
	            		</p>
	            	</div>
		            <!-- end terms and cond -->

		            <!-- partners -->
		            <div class="our-partners">
		            	<div class="partners-holder">
		            		<p class="text-center">Our Partners</p>
		            		<div class="clearfix">
			            		<div class="partner-image-holder">
			            			<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/partner-agoda.png" class="img-responsive agoda hidden">
			            		</div>
			            		<div class="partner-image-holder">
			            			<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/partner-y5.png" class="img-responsive y5">
			            		</div>
			            		<div class="partner-image-holder">
			            			<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/partner-boconcept.png" class="img-responsive boconcept hidden">
			            		</div>
			            		<div class="partner-image-holder last">
			            			<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/partner-pricerite.png" class="img-responsive pricerite hidden">
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
								<button class="details-btn" id="modal-grab-button"><fmt:message key="Fanfare.clickdetail.lightbox1.button" bundle="${msg}" /></button>
							</div>

							<div class="terms-and-condition">
								<p class="title"><fmt:message key="Fanfare.clickdetail.lightbox.terms" bundle="${msg}" /></p>
								<p class="content">
									<li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet1" bundle="${msg}" /></li>
									<li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet2" bundle="${msg}" /></li>
									<li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet3" bundle="${msg}" /></li>
									<li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet4" bundle="${msg}" /></li>
									<li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet5" bundle="${msg}" /></li>
									<li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet6" bundle="${msg}" /></li>
								</p>
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
								<p class="text-center congrats"><fmt:message key="Fanfare.clickdetail.lightbox3.subtitle1" bundle="${msg}" /></p>
								<p class="code">FWD987654321</p>
								<p class="note"><fmt:message key="Fanfare.clickdetail.lightbox3.subtitle2" bundle="${msg}" /></p>
							</div>

							<div class="details-button-holder text-center">
								<button class="details-btn"><fmt:message key="Fanfare.clickdetail.lightbox3.button" bundle="${msg}" /></button>
							</div>

							<div class="terms-and-condition offer-details">
								<p class="title"><fmt:message key="Fanfare.clickdetail.lightbox.terms" bundle="${msg}" /></p>
								<p class="content">
									<li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet1" bundle="${msg}" /></li>
									<li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet2" bundle="${msg}" /></li>
									<li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet3" bundle="${msg}" /></li>
									<li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet4" bundle="${msg}" /></li>
									<li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet5" bundle="${msg}" /></li>
									<li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet6" bundle="${msg}" /></li>
								</p>
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
								<p><fmt:message key="Fanfare.clickdetail.lightbox5.subtitle1" bundle="${msg}" /></p>
								<p class="lower"><fmt:message key="Fanfare.clickdetail.lightbox5.subtitle2" bundle="${msg}" /></p>
							</div>
							
							<div class="terms-and-condition">
								<p class="title"><fmt:message key="Fanfare.clickdetail.lightbox.terms" bundle="${msg}" /></p>
								<p class="content">
									<li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet1" bundle="${msg}" /></li>
									<li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet2" bundle="${msg}" /></li>
									<li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet3" bundle="${msg}" /></li>
									<li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet4" bundle="${msg}" /></li>
									<li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet5" bundle="${msg}" /></li>
									<li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet6" bundle="${msg}" /></li>
								</p>
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
								<p><fmt:message key="Fanfare.clickdetail.lightbox4.subtitle1" bundle="${msg}" /></p>
								<p class="lower"><fmt:message key="Fanfare.clickdetail.lightbox4.subtitle2" bundle="${msg}" /></p>
							</div>
							
							<div class="terms-and-condition">
								<p class="title"><fmt:message key="Fanfare.clickdetail.lightbox.terms" bundle="${msg}" /></p>
								<p class="content">
									<li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet1" bundle="${msg}" /></li>
									<li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet2" bundle="${msg}" /></li>
									<li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet3" bundle="${msg}" /></li>
									<li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet4" bundle="${msg}" /></li>
									<li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet5" bundle="${msg}" /></li>
									<li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet6" bundle="${msg}" /></li>
								</p>
							</div>

							<p class="close-modal">Close</p>
						</div>
					</div>
				</div>

				<a href="#" id="gotop" class="go-top go-top-default"><img src="<%=request.getContextPath()%>/resources/images/fwdiscover/to-top.jpg"></a> 
			</div>
			<!-- FOOTER -->
		</div>
		<!-- JS INCLUDES -->
		<script src="<%=request.getContextPath()%>/resources/js/custom.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/fwdiscover/jquery.countdown.min.js"></script>
		<script type="text/javascript">

		
		if(getWidth() > 991) {
			$('.page-fwdiscover .fwdiscover-footer .terms-and-condition .message img.mobile').addClass('hidden');
		} else {
			$('.page-fwdiscover .fwdiscover-footer .terms-and-condition .message img.desktop').addClass('hidden');
		}
		
		$("#myCarousel-fwdiscover .carousel-inner .item a").click(function(){
			var temp = $(this).attr('href');
			var des = temp.substring(1, temp.length);

			if(getWidth()<992) {
	        	$('html, body').animate({
					scrollTop: $('[name="'+des+'"]').offset().top - ($('[name="'+des+'"]').parents('.fwdiscover-plan').find('.plan-details-box').height()-60)
				}, 1000);
			}
			else {
				$('html, body').animate({
					scrollTop: $('[name="'+des+'"]').offset().top - ($('[name="'+des+'"]').parents('.fwdiscover-plan').find('.plan-details-box').height()+60 + $('.navbar-fixed-top').height())
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
		
		
		//modals
		<%String username = (String) session.getAttribute("username");%>		
		$('#modal-grab-button').click(function(){
			$('.modal').modal('hide');
			$('#offer-details-promotion-code').modal('show');
		});

		$("#first-plan").on('click', function(){
			if('<%=username%>' == 'null') {
				$('#loginpopup').modal('show');
			}
			else {
	        	$('#offer-details').modal('show');
			}
	    });
	    $("#second-plan").on('click', function(){
	    	if('<%=username%>' == 'null') {
				$('#loginpopup').modal('show');
			}
			else {
	        	$('#offer-details-promotion-code').modal('show');
			}
	    });
	    $("#third-plan").on('click', function(){
	    	if('<%=username%>' == 'null') {
				$('#loginpopup').modal('show');
			}
			else {
	        	$('#offer-details-promotion-code-error-once').modal('show');
			}
	    });
	    $("#fourth-plan").on('click', function(){
	    	if('<%=username%>' == 'null') {
				$('#loginpopup').modal('show');
			}
			else {
	        	$('#offer-details-promotion-code-error-sold').modal('show');
			}
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