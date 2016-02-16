<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/savie-regular-styles.css">
	
	<div class="fwd-savie-wrapper ">
		<div class="fwd-container container-fluid breadcrumbs savie-regular-pay-breadcrumbs">
				<div class="breadcrumb-container">
	                <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
	                  <li><a href="#"><fmt:message key="breadcrumb.home" bundle="${msg}" /></a></li>
	                  <li class="divider"><i class="fa fa-angle-right"></i></li>
	                  <li><a href="#"><fmt:message key="breadcrumb.savie.category" bundle="${msg}" /> </a></li>
	                  <li class="divider"><i class="fa fa-angle-right"></i></li>
	                  <li class="active-bc" id="et-active-bc-menu"><fmt:message key="breadcrumb.savie.product" bundle="${msg}" /></li>
					 </ol>
				</div>
			</div>
	</div>

	<!--<div id="landing-calculator" class="fwd-full-container container-fluid">
		<img class="img-responsive hidden-xs" src="assets/images/bg-mini-calcu.png" />
		<img class="img-responsive hidden-sm hidden-md hidden-lg" src="assets/images/mini-mobile.png" />
	</div>-->
	<!--<iframe src="http://192.168.1.128:8080/mini-calculator/" class="full-calcu"></iframe>-->
	<div class="savie-regular-container savie-regular-landing">
		<div class="whole-banner">
        	<div class="page-banner">
        		<img src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/sav-landing-bg-mobile.jpg" class="img-responsive hidden-md hidden-lg">
        		<img src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/sav-landing-bg-desktop.jpg" class="img-responsive hidden-xs hidden-sm">
        		<div class="fwd-container-limit">
        		
        		<form id="o2o-landing-form" action="<%=request.getContextPath()%>/${language}/savings-insurance/plan-details-rp" method="post">
	        		<div class="img-banner-text savie-landing">
	        			<h2 class="savie-sweeter"><fmt:message key="savierp.landing.banner" bundle="${msg}" /> <span><fmt:message key="savierp.landing.always" bundle="${msg}" /></span></h2>
	        			<button id="op-buy-now-O2O-mobile" class="savie-regular-btn start-btn"><fmt:message key="savierp.landing.start" bundle="${msg}" /></button>
        			<div class="savie-product">
						<a href="<%=request.getContextPath()%>/<fmt:message key="link.brochure.savie" bundle="${msg}" />" target="_blank"><fmt:message key="general.product.brochure" bundle="${msg}" /></a> | <a href="<%=request.getContextPath()%>/<fmt:message key="link.provisions.savie.rp" bundle="${msg}" />" target="_blank"><fmt:message key="general.product.provisions" bundle="${msg}" /></a>
					</div>
	        		</div>
	        	</form>
	        	</div>
        	</div>
        </div>
						
		<div class="payment-mode">
       		<div class="desktop-inline">
        		<div class="payment-inline">
	        		<h4 class="text-center"><fmt:message key="savierp.landing.payment.mode" bundle="${msg}" /></h4>
	        		<div class="payment-options clearfix">
	        			<div class="left">
	        				<button id="regular-button" class="active"><fmt:message key="savierp.landing.regular" bundle="${msg}" /></button>
	        			</div>
	        			<div class="right">
	        				<button id="one-off-button"><fmt:message key="savierp.landing.oneoff" bundle="${msg}" /></button>
	        			</div>
	        		</div>
	        	</div>
        	</div>
        	<div class="desktop-inline rate-holder">
        		<div class="rate">
        			<h4 class="text-center"><fmt:message key="savierp.landing.guaranteed" bundle="${msg}" /> <span><fmt:message key="savierp.landing.annual" bundle="${msg}" /></span></h4>
        			<ul class="clearfix">
        				<li><span class="percent">3%</span> [1st year]</li>
        				<li class="with-padding"><span class="percent">3%</span> [2nd year]</li>
        				<li class="with-padding"><span class="percent">3.3%</span> [3rd year]</li>
        			</ul>
        		</div>
       		</div>
       		<div class="gray-divide"></div>
       		<p class="availability-notice text-center"><fmt:message key="savierp.landing.holders" bundle="${msg}" /> <span><fmt:message key="savierp.landing.Insurance" bundle="${msg}" /></span>
       		</p>

       		<!-- <h5 class="hidden-sm hidden-xs product-options text-center">
				<a href="#"><fmt:message key="savie.interestGather.banner.product.brochure" bundle="${msg}" /></a> | <a href="#"><fmt:message key="savie.interestGather.banner.product.provisions" bundle="${msg}" /></a>
			</h5> -->
		</div>
		
        <div class="fwd-container-limit">
        		<div class="usp row">
        			<div class="usp-item clearfix col-xs-12 col-md-4">
        				<h5 class="hidden-xs hidden-sm"><fmt:message key="savierp.landing.payment.options" bundle="${msg}" /></h5>
        				<img src="<%=request.getContextPath()%><fmt:message key="img.big.savings-mobile" bundle="${msg}" />" class="">
        				<div class="item-desc">
        					<h5 class="hidden-md hidden-lg"><fmt:message key="savierp.landing.payment.options" bundle="${msg}" /></h5>
        					<p><fmt:message key="savierp.landing.payment.options.content" bundle="${msg}" /></p>
        				</div>
        			</div>
        			<div class="usp-item clearfix col-xs-12 col-md-4">
        				<h5 class="hidden-xs hidden-sm"><fmt:message key="savierp.landing.free" bundle="${msg}" /></h5>
        				<img src="<%=request.getContextPath()%><fmt:message key="img.no.commitment-mobile" bundle="${msg}" />" class="">
        				<div class="item-desc">
        					<h5 class="hidden-md hidden-lg"><fmt:message key="savierp.landing.free" bundle="${msg}" /></h5>
        					<p class="padded"><fmt:message key="savierp.landing.free.content" bundle="${msg}" /></p>
        				</div>
        			</div>
        			<div class="usp-item clearfix col-xs-12 col-md-4">
        				<h5 class="hidden-xs hidden-sm"><fmt:message key="savierp.landing.extra" bundle="${msg}" /></h5>
        				<img src="<%=request.getContextPath()%><fmt:message key="img.free.additional-mobile" bundle="${msg}" />" class="">
        				<div class="item-desc">
        					<h5 class="hidden-md hidden-lg"><fmt:message key="savierp.landing.extra" bundle="${msg}" /></h5>
        					<p class="padded"><fmt:message key="savierp.landing.extra.content" bundle="${msg}" /></p>
        					<p class="accumulation padded"><fmt:message key="savierp.landing.extra.accumulation" bundle="${msg}" /></p>
        				</div>
        			</div>
        		</div>
        	</div>
        	<div class="hidden-xs hidden-sm">
        		<h3 class="benefits-desktop text-center"><fmt:message key="savierp.landing.benefits" bundle="${msg}" /></h3>
        		<div class="gray-divide"></div>
        	</div>
       		<div class="regular-benefit">
       			<div class="hidden-md hidden-lg">
        			<h4 class="text-center"><fmt:message key="savierp.landing.benefits" bundle="${msg}" /></h4>
        			<div class="gray-divide"></div>
        		</div>
       			<div class="fwd-container-limit">
        			<div class="benefits-holder">
        				<div class="hidden-md hidden-lg">
		        			<div class="row">
		        				<div class="col-xs-6 text-center annualTravel_policy_item">
		        					<img src="<%=request.getContextPath()%>/resources/images/savie-regular/benefit-1.png">
		        					<span><fmt:message key="product.details.savie.group1.section1.title" bundle="${msg}" /></span>
									<div class="hidden-benefits benefits-content">
										<img src="<%=request.getContextPath()%>/resources/images/savie-regular/benefit-1.png" />
										<div class="info hidden-benefits-info">
											<h3 class="hidden-benefits-info"><fmt:message key="product.details.savie.group1.section1.title" bundle="${msg}" /></h3>
											<p class="hidden-benefits-info"><fmt:message key="product.details.savie1.summary" bundle="${msg}" />  </p>
										</div>
									</div>
		        				</div>
		        				<div class="col-xs-6 text-center annualTravel_policy_item">
		        					<img src="<%=request.getContextPath()%>/resources/images/savie-regular/benefit-2.png">
		        					<span><fmt:message key="product.details.savie.group2.section1.title" bundle="${msg}" /></span>
									<div class="hidden-benefits benefits-content">
										<img src="<%=request.getContextPath()%>/resources/images/savie-regular/benefit-2.png" />
										<div class="info hidden-benefits-info">
											<h3 class="hidden-benefits-info"><fmt:message key="product.details.savie.group2.section1.title" bundle="${msg}" /></h3>
											<p class="hidden-benefits-info"><fmt:message key="product.details.savie2.summary" bundle="${msg}" />  </p>
										</div>
									</div>
		        				</div>
		        			</div>
		        			<div class="row">
	        				<!--<div class="col-xs-6 text-center annualTravel_policy_item">
		        					<img src="<%=request.getContextPath()%>/resources/images/savie-regular/benefit-3.png">
		        					<span class="two-lines"><fmt:message key="savierp.landing.partnership" bundle="${msg}" /></span>
									<div class="hidden-benefits benefits-content">
										<img src="<%=request.getContextPath()%>/resources/images/savie-regular/benefit-3.png" />
										<div class="info hidden-benefits-info">
											<h3 class="hidden-benefits-info"><fmt:message key="savierp.landing.partnership" bundle="${msg}" /></h3>
											<p class="hidden-benefits-info"><fmt:message key="savierp.landing.partnership.content1" bundle="${msg}" />  </p>
										</div>
									</div>
		        				</div>-->
		        				<div class="col-xs-6 text-center annualTravel_policy_item">
		        					<img src="<%=request.getContextPath()%>/resources/images/savie-regular/benefit-4.png">
		        					<span class="two-lines"><fmt:message key="product.details.savie.group4.section1.title" bundle="${msg}" /></span>
									<div class="hidden-benefits benefits-content">
										<img src="<%=request.getContextPath()%>/resources/images/savie-regular/benefit-4.png" />
										<div class="info hidden-benefits-info">
											<h3 class="hidden-benefits-info"><fmt:message key="product.details.savie.group4.section1.title" bundle="${msg}" /></h3>
											<p class="hidden-benefits-info"><fmt:message key="product.details.savie4.summary" bundle="${msg}" />  </p>
										</div>
									</div>
		        				</div>
		        				<div class="col-xs-6 text-center annualTravel_policy_item">
		        					<img src="<%=request.getContextPath()%>/resources/images/savie-regular/benefit-6.png">
		        					<span class="two-lines"><fmt:message key="product.details.savie.group6.section1.title" bundle="${msg}" /></span>
									<div class="hidden-benefits benefits-content">
										<img src="<%=request.getContextPath()%>/resources/images/savie-regular/benefit-6.png" />
										<div class="info">
											<h3 class="hidden-benefits-info"><fmt:message key="product.details.savie.group6.section1.title" bundle="${msg}" /></h3>
											<p class="hidden-benefits-info"><fmt:message key="product.details.savie6.summary" bundle="${msg}" />  </p>
										</div>
									</div>
		        				</div>
		        			</div>
		        			<!-- <div class="row">
		        				<div class="col-xs-6 text-center annualTravel_policy_item">
		        					<img src="<%=request.getContextPath()%>/resources/images/savie-regular/benefit-5.png">
		        					<span class="two-lines"><fmt:message key="savierp.landing.hotline" bundle="${msg}" /></span>
									<div class="hidden-benefits benefits-content">
										<img src="<%=request.getContextPath()%>/resources/images/savie-regular/benefit-5.png" />
										<div class="info hidden-benefits-info">
											<h3 class="hidden-benefits-info"><fmt:message key="savierp.landing.partnership" bundle="${msg}" /></h3>
											<p class="hidden-benefits-info"><fmt:message key="savierp.landing.partnership.content1" bundle="${msg}" />  </p>
										</div>
									</div>
		        				</div>
		        			</div>
		        			-->
		        		</div>
		        		<div class="hidden-xs hidden-sm">
		        			<div class="" id="benefits-nav-holder">
								<ul class="nav nav-tabs row so-fna-row" role="tablist">
									<li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li active" id="benefits-nav-title-1">
										<a href="#benefits-navtabs-1" role="tab" data-toggle="tab" class="navtabs-title first-fna ui-link text-center"><fmt:message key="product.details.savie.group1.section1.title" bundle="${msg}" /> </a>
									</li>
									<li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li" id="benefits-nav-title-2">
										<a href="#benefits-navtabs-2" role="tab" data-toggle="tab" class="navtabs-title ui-link text-center"><fmt:message key="product.details.savie.group2.section1.title" bundle="${msg}" /> </a>
									</li>
									<!--  <li role="presentation" class="col-lg-2 col-md-2 col-sm-2 col-xs-2 navtabs-li" id="benefits-nav-title-3">
										<a href="#benefits-navtabs-3" role="tab" data-toggle="tab" class="navtabs-title ui-link text-center"><fmt:message key="savierp.landing.navtabs.withdrawal" bundle="${msg}" /> <span><fmt:message key="savierp.landing.navtabs.without" bundle="${msg}" /></span></a>
									</li> -->
									<li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li last" id="benefits-nav-title-4">
										<a href="#benefits-navtabs-4" role="tab" data-toggle="tab" class="navtabs-title last-fna ui-link text-center"><fmt:message key="product.details.savie.group4.section1.title" bundle="${msg}" /> </a>
									</li>
									<!-- <li role="presentation" class="col-lg-2 col-md-2 col-sm-2 col-xs-2 navtabs-li last" id="benefits-nav-title-5">
										<a href="#benefits-navtabs-5" role="tab" data-toggle="tab" class="navtabs-title last-fna ui-link text-center"><fmt:message key="savierp.landing.navtabs.hours" bundle="${msg}" /> <span><fmt:message key="savierp.landing.navtabs.hotline" bundle="${msg}" /></span></a>
									</li>-->
									<li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li last" id="benefits-nav-title-6">
										<a href="#benefits-navtabs-6" role="tab" data-toggle="tab" class="navtabs-title last-fna ui-link text-center"><fmt:message key="product.details.savie.group6.section1.title" bundle="${msg}" /></a>
									</li>
								</ul>
								<div class="fna-carousel carousel slide" id="benefits-carousel" data-ride="carousel" data-interval="false">
									<div class="tab-content carousel-inner clearfix" role="listbox">
												<div role="tabpanel" class="fna-tab-content tab-pane item active" id="benefits-navtabs-1">
													<div class="benefits-content clearfix">
														<img src="<%=request.getContextPath()%>/resources/images/savie-regular/new-benefit-1.png">
														<div class="info">
															<h3><fmt:message key="product.details.savie.group1.section1.title" bundle="${msg}" /></h3>
															<p><fmt:message key="product.details.savie1.summary" bundle="${msg}" />  </p>
														</div>
													</div>
												</div>
												<div role="tabpanel" class="fna-tab-content tab-pane item" id="benefits-navtabs-2">
													<div class="benefits-content clearfix">
														<img src="<%=request.getContextPath()%>/resources/images/savie-regular/benefit-2.png">
														<div class="info">
															<h3><fmt:message key="product.details.savie.group2.section1.title" bundle="${msg}" /></h3>
															<p><fmt:message key="product.details.savie2.summary" bundle="${msg}" />  </p>
														</div>
													</div>
												</div>
												<!--  <div role="tabpanel" class="fna-tab-content tab-pane item" id="benefits-navtabs-3">
													<div class="benefits-content clearfix">
														<img src="<%=request.getContextPath()%>/resources/images/savie-regular/benefit-3.png">
														<div class="info">
															<h3><fmt:message key="savierp.landing.earning" bundle="${msg}" /></h3>
															<p><fmt:message key="savierp.landing.earning.content1" bundle="${msg}" />  </p>
														</div>
													</div>
												</div> -->
												<div role="tabpanel" class="fna-tab-content tab-pane item" id="benefits-navtabs-4">
													<div class="benefits-content clearfix">
														<img src="<%=request.getContextPath()%>/resources/images/savie-regular/benefit-4.png">
														<div class="info">
															<h3><fmt:message key="product.details.savie.group4.section1.title" bundle="${msg}" /></h3>
															<p><fmt:message key="product.details.savie4.summary" bundle="${msg}" />  </p>
														</div>
													</div>
												</div>
												<!-- <div role="tabpanel" class="fna-tab-content tab-pane item" id="benefits-navtabs-5">
													<div class="benefits-content clearfix">
														<img src="<%=request.getContextPath()%>/resources/images/savie-regular/benefit-5.png">
														<div class="info">
															<h3><fmt:message key="savierp.landing.payment" bundle="${msg}" /></h3>
															<p><fmt:message key="savierp.landing.payment.content1" bundle="${msg}" />  </p>
														</div>
													</div>
												</div> -->
												<div role="tabpanel" class="fna-tab-content tab-pane item" id="benefits-navtabs-6">
													<div class="benefits-content clearfix">
														<img src="<%=request.getContextPath()%>/resources/images/savie-regular/benefit-6.png">
														<div class="info">
															<h3><fmt:message key="product.details.savie.group6.section1.title" bundle="${msg}" /></h3>
															<p><fmt:message key="product.details.savie6.summary" bundle="${msg}" />  </p>
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
        				<img src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/crediting_rates-en-1.jpg" class="hidden">
	        				<div class="hidden-xs hidden-sm fwd-full-container container-fluid o2o-landing saving-plans">
							<div id="savings-carousel" class="carousel slide" data-ride="carousel">
								<!-- Wrapper for slides -->
								<div class="carousel-inner" role="listbox">
									<div class="item active">
										<div class="savings-banner">
											<img src="<%=request.getContextPath()%>/resources/images/savie-regular/FWD_savie_banner_fwd-Savie-icon-eng-1.jpg" class="img-responsive en-banner-img">
											<img src="<%=request.getContextPath()%>/resources/images/savie-regular/FWD_savie_banner_fwd-Savie-icon-chi-4.jpg" class="img-responsive ch-banner-img">
										</div>
									</div>
									<div class="item">
										<div class="savings-banner">
											<img src="<%=request.getContextPath()%>/resources/images/savie-regular/FWD_savie_banner_fwd-Savie-icon-eng-4.jpg" class="img-responsive en-banner-img">
											<img src="<%=request.getContextPath()%>/resources/images/savie-regular/FWD_savie_banner_fwd-Savie-icon-chi-1.jpg" class="img-responsive ch-banner-img">
										</div>
									</div>
									<div class="item">
										<div class="savings-banner">
											<img src="<%=request.getContextPath()%>/resources/images/savie-regular/FWD_savie_banner_fwd-Savie-icon-eng-5.jpg" class="img-responsive">
										</div>
									</div>
								</div>
							</div>
							
							<div class="savings-nav rp-nav">
								<div class="prev">
									<a class="pull-right disabled" href="#savings-carousel" role="button" data-slide="prev">
									<span class="icon icon-chevron-thin-left">
										<span class="sr-only">Previous</span>
									</span>
									</a>
								</div>
								
								<div class="next">
									<a class="pull-left active" href="#savings-carousel" role="button" data-slide="next">
									<span class="icon icon-chevron-thin-right">
										<span class="sr-only">Next</span>
									</span>
									</a>
								</div>
							</div>
						</div>
	        		</div>

       		<div class="partners">
       			<h4 class="text-center"><fmt:message key="savierp.landing.partners" bundle="${msg}" /></h4>
       			<div class="gray-divide" id="bar-exclusive"></div>
       			<div class="row partners-holder">
       				<div class="col-xs-6 text-center">
       					<div class="desktop-center clearfix">
        					<img src="<%=request.getContextPath()%>/resources/images/savie-regular/partner_agoda.png">
        					<a href="#" class="hidden-md hidden-lg"><fmt:message key="savierp.landing.discount" bundle="${msg}" /></a>
        					<p class="hidden-xs hidden-sm"><fmt:message key="savierp.landing.enjoy" bundle="${msg}" /> <a href="#"><fmt:message key="savierp.landing.agoda" bundle="${msg}" /></a> <fmt:message key="savierp.landing.membership" bundle="${msg}" /></p>
       					</div>
       				</div>
       				<div class="col-xs-6 text-center">
       					<div class="desktop-center clearfix">
        					<img src="<%=request.getContextPath()%>/resources/images/savie-regular/partner_pricerite.png">
        					<a href="#" class="hidden-md hidden-lg"><fmt:message key="savierp.landing.coupon" bundle="${msg}" /></a>
        					<p class="hidden-xs hidden-sm"><fmt:message key="savierp.landing.from" bundle="${msg}" /> <a href="#"><fmt:message key="savierp.landing.pricerite" bundle="${msg}" /></a> <fmt:message key="savierp.landing.savierp.landing.referral" bundle="${msg}" /></p>
       					</div>
       				</div>
       			</div>
       		</div>
       		<div class="fna-icons-body text-center clearfix">
				<div class="fwd-container-limit" id="nav-holder">
					<ul class="nav nav-tabs row so-fna-row visible-xs visible-sm" role="tablist">
						<li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li active" id="nav-title-1">
							<a href="#navtabs-1" role="tab" data-toggle="tab" class="navtabs-title first-fna ui-link"><fmt:message key="savierp.landing.presentation.here" bundle="${msg}" /></a>
						</li>
						<li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li" id="nav-title-2">
							<a href="#navtabs-2" role="tab" data-toggle="tab" class="navtabs-title ui-link"><fmt:message key="savierp.landing.presentation.convenience" bundle="${msg}" /></a>
						</li>
						<li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li" id="nav-title-3">
							<a href="#navtabs-3" role="tab" data-toggle="tab" class="navtabs-title ui-link"><fmt:message key="savierp.landing.presentation.make" bundle="${msg}" /></a>
						</li>
						<li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li last" id="nav-title-4">
							<a href="#navtabs-4" role="tab" data-toggle="tab" class="navtabs-title last-fna ui-link"><fmt:message key="savierp.landing.presentation.eservice" bundle="${msg}" /></a>
						</li>
					</ul>
					<div class="fna-carousel carousel slide" id="so-carousel" data-ride="carousel" data-interval="false">
						<div class="tab-content carousel-inner clearfix" role="listbox">
							<div role="tabpanel" class="fna-tab-content tab-pane item active" id="navtabs-1" next-target="nav-title-2">
								<div class="so-fna-content">
									<div class="fna-icon-circle">
										<img src="<%=request.getContextPath()%>/resources/images/savie-regular/fna-1.png">
									</div>
									<h3 class="visible-md visible-lg  tab-head"><fmt:message key="savierp.landing.presentation.here" bundle="${msg}" /></h3>
									 <p><fmt:message key="savierp.landing.presentation.here.content" bundle="${msg}" /> <!--<a href="#" class="eserv-link ui-link">eServices</a>--></p>
								</div>
							</div>
							<div role="tabpanel" class="fna-tab-content tab-pane item" id="navtabs-2" next-target="nav-title-3">
								<div class="so-fna-content">
									<div class="fna-icon-circle">
										<img src="<%=request.getContextPath()%>/resources/images/savie-regular/fna-2.png">
									</div>
									<h3 class="visible-md visible-lg tab-head"><fmt:message key="savierp.landing.presentation.convenience" bundle="${msg}" /></h3>
									<p> <fmt:message key="savierp.landing.presentation.convenience.content" bundle="${msg}" /></p>
								</div>
							</div>
							<div role="tabpanel" class="fna-tab-content tab-pane item" id="navtabs-3" next-target="nav-title-4">
								<div class="so-fna-content">
									<div class="fna-icon-circle">
										<img src="<%=request.getContextPath()%>/resources/images/savie-regular/fna-3.png">
									</div>
									<h3 class="visible-md visible-lg tab-head"><fmt:message key="Overseas.Landing.Platformpillar2.headline" bundle="${msg}" /></h3>
									<p><fmt:message key="savierp.landing.presentation.make.content" bundle="${msg}" /></p>
								</div>
							</div>
							<div role="tabpanel" class="fna-tab-content tab-pane item" id="navtabs-4" next-target="nav-title-1">
								<div class="so-fna-content">
									<div class="fna-icon-circle">
										<img src="<%=request.getContextPath()%>/resources/images/savie-regular/fna-4.png">
									</div>
									<h3 class="visible-md visible-lg  tab-head"><fmt:message key="savierp.landing.presentation.eservice" bundle="${msg}" /></h3>
									<p><fmt:message key="savierp.landing.presentation.eservice.content1" bundle="${msg}" /> <a href="http://www.fwd.com.hk/en-US/fwd-n-you/e_services_app.html" class="eserv-link ui-link"><fmt:message key="savierp.landing.presentation.eservice.content2" bundle="${msg}" /></a> <fmt:message key="savierp.landing.presentation.eservice.content3" bundle="${msg}" /></p>
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
		
		<!-- OUR BLOG -->
		<div class="blog">
				<div class="hidden-md hidden-lg">
					<div class="mini-banner-holder">
						<img src="<%=request.getContextPath()%>/resources/images/savie-regular/read-our-blog.jpg" class="img-responsive">
						<div class="black-overlay"></div>
						<h5 class="text-center"><fmt:message key="savierp.landing.blog.save" bundle="${msg}" /></h5>
					</div>
					<div class="btn-holder">
						<button class="savie-regular-btn"><fmt:message key="blog.headline" bundle="${msg}" /></button>
					</div>
				</div>
				<div class="hidden-xs hidden-sm">
					<h3 class="text-center"><fmt:message key="blog.headline" bundle="${msg}" /></h3>
					<div class="gray-divide"></div>
					<p class="definition text-center"><fmt:message key="savierp.landing.blog.lorem" bundle="${msg}" /> <span><fmt:message key="savierp.landing.blog.integer" bundle="${msg}" /></span></p>

					<div class="blogs-holder clearfix fwd-container-limit">
						<div class="blogs first">
							<img src="<%=request.getContextPath()%>/resources/images/savie-regular/blog-1.jpg" class="img-responsive">
							<div class="orange-overlay text-center">
								<p class="title"><fmt:message key="savierp.landing.blog.title3" bundle="${msg}" /></p>
								<span><fmt:message key="savierp.landing.blog.span3" bundle="${msg}" /></span>
								<p class="definition"><fmt:message key="savierp.landing.blog.definition3" bundle="${msg}" /></p>
								<a class="btn-read-now" href="http://blog.fwd.com.hk/zh_HK/2016/01/11/power-start-up/"><fmt:message key="savierp.landing.blog.read.now" bundle="${msg}" /></a>
							</div>
						</div>
						<div class="blogs">
							<img src="<%=request.getContextPath()%>/resources/images/savie-regular/blog-2.jpg" class="img-responsive">
							<div class="orange-overlay text-center">
								<p class="title"><fmt:message key="savierp.landing.blog.title2" bundle="${msg}" /></p>
								<span><fmt:message key="savierp.landing.blog.span2" bundle="${msg}" /></span>
								<p class="definition"><fmt:message key="savierp.landing.blog.definition3" bundle="${msg}" /></p>
								<a class="btn-read-now" href="http://blog.fwd.com.hk/zh_HK/2015/12/30/do-holidays-have-to-be-saving-traps/"><fmt:message key="savierp.landing.blog.read.now" bundle="${msg}" /></a>
							</div>
						</div>
						<div class="blogs">
							<img src="<%=request.getContextPath()%>/resources/images/savie-regular/blog-3.jpg" class="img-responsive">
							<div class="orange-overlay text-center">
								<p class="title"><fmt:message key="savierp.landing.blog.title2" bundle="${msg}" /></p>
								<span><fmt:message key="savierp.landing.blog.span2" bundle="${msg}" /></span>
								<p class="definition"><fmt:message key="savierp.landing.blog.definition3" bundle="${msg}" /></p>
								<a class="btn-read-now" href="http://blog.fwd.com.hk/zh_HK/2015/12/17/busting-the-myths-of-saving-traps/"><fmt:message key="savierp.landing.blog.read.now" bundle="${msg}" /></a>
							</div>
						</div>
						<div class="blogs last">
							<img src="<%=request.getContextPath()%>/resources/images/savie-regular/blog-4.jpg" class="img-responsive">
							<div class="orange-overlay text-center">
								<p class="title"><fmt:message key="savierp.landing.blog.title2" bundle="${msg}" /></p>
								<span><fmt:message key="savierp.landing.blog.span2" bundle="${msg}" /></span>
								<p class="definition"><fmt:message key="savierp.landing.blog.definition3" bundle="${msg}" /></p>
								<a class="btn-read-now" href="http://blog.fwd.com.hk/zh_HK/2015/12/09/%E9%80%99%E6%A8%A3%E5%81%9A%E5%B0%B1%E5%B0%8D%E4%BA%86%E3%80%80coupon%E5%B9%AB%E6%82%A8%E6%85%B3%E5%A4%A7%E9%8C%A2/"><fmt:message key="savierp.landing.blog.read.now" bundle="${msg}" /></a>
							</div>
						</div>
					</div>

					<div class="fwd-container-limit">
						<p class="blog-notice"><fmt:message key="savierp.landing.blog.notice" bundle="${msg}" /></p>
					</div>
				</div>
			</div>
			
			<a href="#" id="gotop-rp" class="go-top go-top-default rp"><img src="<%=request.getContextPath()%>/resources/images/savie-regular/to-top.jpg"></a>
		
		<!-- Customer Center Modal -->
		<div class="modal fade" role="dialog" aria-labelledby="customerCenter" id="customerCenter">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h2><fmt:message key="savie.o2o.landing.Getting.started" bundle="${msg}" /><br><fmt:message key="savie.o2o.landing.Just.follow" bundle="${msg}" /><br><fmt:message key="savie.o2o.landing.complete.your" bundle="${msg}" /></h2>
					</div>
					<div class="modal-body">
						<img src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/infographic-steps.jpg" />
					</div>
					<div class="modal-footer">
						<div class="top-section">
							<h2><fmt:message key="savie.o2o.landing.Congratulations" bundle="${msg}" /></h2>
							<h4><fmt:message key="savie.o2o.landing.Your.application" bundle="${msg}" /></h4>
							<p><fmt:message key="savie.o2o.landing.Can't.make" bundle="${msg}" /></p>
						</div>
						
						<div class="bottom-section">
							<button type="button" class="btn" data-dismiss="modal"><fmt:message key="savie.o2o.landing.Continue" bundle="${msg}" /></button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var language = "en";
		$("#one-off-button").click(function(){
			$("#one-off-button").addClass('clicked-button');
			window.location = "<%=request.getContextPath()%>/" + lang +"/savings-insurance/single-premium";
		});
		$("#regular-button").click(function(){
			$("#regular-button").addClass('clicked-button');
			window.location = "<%=request.getContextPath()%>/" + lang +"/savings-insurance/regular-premium";
		});
		$('#so-carousel').bind('slide.bs.carousel', function (e) {
		    var slideFrom = $(this).find('.active');
			$('#nav-holder .so-fna-row li').removeClass('active')
		    $('#'+slideFrom.attr('next-target')).addClass('active');
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

		$('#op-buy-now-O2O-mobile').click(function(e){
			getAppointmentAccessCode();
		});

		// Access Code Confirmation
		function getAppointmentAccessCode(){
			$.ajax({
			        type: "POST",
			        url:'<%=request.getContextPath()%>/ajax/savings-evergreen-insurance/getAppointmentAccessCode',
			        async:false,         
			        success:function(data){
						if(data.errMsgs != null && data.errMsgs != ''){
						}
						else{
							$('#o2o-landing-form').submit();
						}
			        },
					error:function(){
					    console.log('error');     
				    }
			    });
		};
	</script>
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
	<script src="<%=request.getContextPath()%>/resources/js/custom.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/savie/jquery.animateSprite.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/savie/jquery-ui.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/savie/jquery.ui.touch-punch.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/savie/jquery.loadImages.1.1.0.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/savie/index.js"></script>
