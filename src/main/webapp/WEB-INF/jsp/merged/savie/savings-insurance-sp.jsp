<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="enhance" uri="http://pukkaone.github.com/jsp" %>
<c:set var="context" value="<%=request.getContextPath()%>"/>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<c:set var="langLink" value="${language == 'tc' ? 'zh-HK' : 'en-US'}" />
<c:set var="captchaLang" value="${language == 'tc' ? 'zh-TW' : 'en'}" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/savie-regular-styles.css">
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var language = "${language}";
var affiliate = "${affiliate}";
var home_url = "<%=request.getContextPath()%>";
</script>
<script type="application/ld+json">
{
  "@context":"http://schema.org/",
  "@type":"Product",
  "name":"${scriptName}",
  "image":"https://i.fwd.com.hk/resources/images/sharing/iFWD_fb-sharing_savie-sp_en.jpg",
  "description":"${scriptDescription}",
  "brand":{
    "@type":"Insurance",
    "name":"${scriptChildName}"
  },
  "offers":{
    "@type":"AggregateOffer",
    "lowPrice":"3000",
    "highPrice":"400000",
    "priceCurrency":"HKD"
  }
}
</script>
<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper ">
			<!--<div class="teaser-container">-->
			<!-- Access Code Cover Div -->
			<!--<div class="hunger-selling-container container-fluid" id="myAccessCode">
				<div class="hunger-selling-content">
					<div class="hunger-selling-header text-center">
						<button id="close-cover" type="button" class="close"><span aria-hidden="true">&times;</span></button>
						<h4 class="hunger-selling-title">Please enter the access code as shown in your email.</h4>
					</div>
					<div class="hunger-selling-body">
						<form>
							<input placeholder="Access code" type="text" autocomplete="off" name="accessCodeConfirm" id="accessCodeConfirm" />
							<span class="validation-msg hidden-error-msg">The code is invalid or has been used.</span>							
							<button type="submit" id="hunger-btn" class="btn hunger-btn">Submit</button>
						</form>
					</div>
				</div>
			</div>-->
			
			<div class="fwd-container container-fluid breadcrumbs savie-regular-pay-breadcrumbs">
				<div class="breadcrumb-container">
	                <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
	                  <li><a href="#"><fmt:message key="eliteTerms.breadcrumb.home" bundle="${msg}" /></a></li>
	                  <li class="divider"><i class="fa fa-angle-right"></i></li>
	                  <li><a href="#"><fmt:message key="breadcrumb.savie.category" bundle="${msg}" /> </a></li>
	                  <li class="divider"><i class="fa fa-angle-right"></i></li>
	                  <li class="active-bc" id="et-active-bc-menu"><fmt:message key="breadcrumb.savie.product" bundle="${msg}" /></li>
					 </ol>
				</div>
			</div>
			
			<div class="savie-regular-container savie-regular-landing">
				<div class="whole-banner">
              	<div class="page-banner">
              		<img src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/sav-landing-bg-mobile.jpg" class="img-responsive hidden-md hidden-lg">
              		<img src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/sav-landing-bg-desktop.jpg" class="img-responsive hidden-xs hidden-sm">
              		<div class="fwd-container-limit">
              		
              		<form id="o2o-landing-form" action="<%=request.getContextPath()%>/${language}/savings-insurance/plan-details-sp" method="post" >
      	        		<div class="img-banner-text savie-landing">
      	        			<h2 class="savie-sweeter"><fmt:message key="jumbo.savie.regularpay" bundle="${msg}" /></span></h2>
      	        			<div id="clearfix-height-rp">
      	        				<button id="op-buy-now-O2O-mobile" class="savie-regular-btn start-btn"><fmt:message key="button.start" bundle="${msg}" /></button>
      	        			</div>        			
              			<div class="savie-product text-bold">
      						<a href="<%=request.getContextPath()%>/<fmt:message key="link.brochure.savie" bundle="${msg}" />" target="_blank"><fmt:message key="label.product.brochure" bundle="${msg}" /></a> | <a href="<%=request.getContextPath()%>/<fmt:message key="link.provisions.savie" bundle="${msg}" />" target="_blank"><fmt:message key="label.product.provisions" bundle="${msg}" /></a>
      					</div>
      	        		</div>
      	        	</form>
      	        	</div>
              	</div>
				</div>
								
				<div class="payment-mode">
	        		<div class="desktop-inline">
		        		<div class="payment-inline">
			        		<h4 class="text-center"><fmt:message key="label.savie.payment.mode" bundle="${msg}" /></h4>
			        		<div class="payment-options clearfix">
			        			<div class="left">
			        				<button id="regular-button"><fmt:message key="label.savie.payment.mode.savie.regular.monthly" bundle="${msg}" /></button>
			        			</div>
			        			<div class="right">
			        				<button id="one-off-button" class="active"><fmt:message key="label.savie.payment.mode.savie.regular.pay" bundle="${msg}" /></button>
			        			</div>
			        		</div>
			        	</div>
		        	</div>
		        	<div class="desktop-inline rate-holder">
		        		<div class="rate">
		        			<h4 class="text-center"><fmt:message key="custom.save.credit.rate.title" bundle="${msg}" /></h4>
		        			<ul class="clearfix">
		        				<li><fmt:message key="custom.savie.credit.rate.rate1" bundle="${msg}" /></li>
		        				<li class="with-padding"><fmt:message key="custom.savie.credit.rate.rate2" bundle="${msg}" /></li>
		        				<li class="with-padding"><fmt:message key="custom.savie.credit.rate.rate3" bundle="${msg}" /></li>
		        			</ul>
		        		</div>
	        		</div>
	        	
	        		<p class="availability-notice text-center"><fmt:message key="product.detail.savie.remark.copy1" bundle="${msg}" /> <span></span>
       				</p>
				</div>
				
		         <div class="fwd-container-limit">
	        		<div class="usp row">
	        			<div class="usp-item clearfix col-xs-12 col-md-4">
	        				<h5 class="hidden-xs hidden-sm"><fmt:message key="usp.savie1.title" bundle="${msg}" /></h5>
	        				<img src="<%=request.getContextPath()%><fmt:message key="img.big.savings-mobile" bundle="${msg}" />" class="">
	        				<div class="item-desc">
	        					<h5 class="hidden-md hidden-lg"><fmt:message key="usp.savie1.title" bundle="${msg}" /></h5>
	        					<p><fmt:message key="usp.savie1.copy" bundle="${msg}" /></p>
	        				</div>
	        			</div>
	        			<div class="usp-item clearfix col-xs-12 col-md-4">
	        				<h5 class="hidden-xs hidden-sm"><fmt:message key="usp.savie2.title" bundle="${msg}" /></h5>
	        				<img src="<%=request.getContextPath()%><fmt:message key="img.no.commitment-mobile" bundle="${msg}" />" class="">
	        				<div class="item-desc">
	        					<h5 class="hidden-md hidden-lg"><fmt:message key="usp.savie2.title" bundle="${msg}" /></h5>
	        					<p class="padded"><fmt:message key="usp.savie2.copy" bundle="${msg}" /></p>
	        				</div>
	        			</div>
	        			<div class="usp-item clearfix col-xs-12 col-md-4">
	        				<h5 class="hidden-xs hidden-sm"><fmt:message key="usp.savie3.title" bundle="${msg}" /></h5>
	        				<img src="<%=request.getContextPath()%><fmt:message key="img.free.additional-mobile" bundle="${msg}" />" class="">
	        				<div class="item-desc">
	        					<h5 class="hidden-md hidden-lg"><fmt:message key="usp.savie3.title" bundle="${msg}" /></h5>
	        					<p class="padded"><fmt:message key="usp.savie3.copy" bundle="${msg}" /></p>
	        					<p class="accumulation padded"><fmt:message key="usp.savie3.copy2" bundle="${msg}" /></p>
	        				</div>
	        			</div>
	        		</div>
	        	</div>

	        		<div class="regular-benefit">
	        			        	<div class="hidden-xs hidden-sm">
	        		<h3 class="benefits-desktop text-center"><fmt:message key="savie.online.landing.benefits" bundle="${msg}" /></h3>
	        		<div class="gray-divide"></div>
	        	</div>
       			<div class="hidden-md hidden-lg">
        			<h4 class="text-center"><fmt:message key="savie.online.landing.benefits" bundle="${msg}" /></h4>
        			<div class="gray-divide"></div>
        		</div>
       			<div class="fwd-container-limit">
        			<div class="benefits-holder">
        				<div class="hidden-md hidden-lg">
		        			<div class="row">
		        				<!--<div class="col-xs-6 text-center annualTravel_policy_item">
		        					<img src="<%=request.getContextPath()%>/resources/images/savie-regular/benefit-1.png">
		        					<span><fmt:message key="product.details.savie.group1.section1.title.ocean" bundle="${msg}" /></span>
									<div class="hidden-benefits benefits-content">
										<img src="<%=request.getContextPath()%>/resources/images/savie-regular/benefit-1.png" />
										<div class="info hidden-benefits-info">
											<h3 class="hidden-benefits-info"><fmt:message key="product.details.savie.group1.section1.title" bundle="${msg}" /></h3>
											<p class="hidden-benefits-info"><fmt:message key="product.details.savie1.summary" bundle="${msg}" />  </p>
										</div>
									</div>
		        				</div>-->
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
		        			</div>
		        			<div class="row">
	        				<!--<div class="col-xs-6 text-center annualTravel_policy_item">
		        					<img src="<%=request.getContextPath()%>/resources/images/savie-regular/benefit-3.png">
		        					<span class="two-lines"><fmt:message key="savie.online.landing.partnership" bundle="${msg}" /></span>
									<div class="hidden-benefits benefits-content">
										<img src="<%=request.getContextPath()%>/resources/images/savie-regular/benefit-3.png" />
										<div class="info hidden-benefits-info">
											<h3 class="hidden-benefits-info"><fmt:message key="savie.online.landing.partnership" bundle="${msg}" /></h3>
											<p class="hidden-benefits-info"><fmt:message key="savie.online.landing.partnership.content1" bundle="${msg}" />  </p>
										</div>
									</div>
		        				</div>-->
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
		        					<span class="two-lines"><fmt:message key="savie.online.landing.hotline" bundle="${msg}" /></span>
									<div class="hidden-benefits benefits-content">
										<img src="<%=request.getContextPath()%>/resources/images/savie-regular/benefit-5.png" />
										<div class="info hidden-benefits-info">
											<h3 class="hidden-benefits-info"><fmt:message key="savie.online.landing.partnership" bundle="${msg}" /></h3>
											<p class="hidden-benefits-info"><fmt:message key="savie.online.landing.partnership.content1" bundle="${msg}" />  </p>
										</div>
									</div>
		        				</div>
		        			</div>
		        			-->
		        		</div>
		        		<div class="hidden-xs hidden-sm">
		        			<div class="" id="benefits-nav-holder">
								<ul class="nav nav-tabs row so-fna-row" role="tablist">
									<!--<li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li active" id="benefits-nav-title-1">
										<a href="#benefits-navtabs-1" role="tab" data-toggle="tab" class="navtabs-title first-fna ui-link text-center"><fmt:message key="product.details.savie.group1.section1.title" bundle="${msg}" /> </a>
									</li>-->
                                    <li role="presentation" class="col-lg-4 col-md-4 col-sm-4 col-xs-4 navtabs-li active" id="benefits-nav-title-6">
                                        <a href="#benefits-navtabs-6" role="tab" data-toggle="tab" class="navtabs-title last-fna ui-link text-center"><fmt:message key="product.details.savie.group6.section1.title" bundle="${msg}" /></a>
                                    </li>									
									<li role="presentation" class="col-lg-4 col-md-4 col-sm-4 col-xs-4 navtabs-li" id="benefits-nav-title-2">
										<a href="#benefits-navtabs-2" role="tab" data-toggle="tab" class="navtabs-title ui-link text-center"><fmt:message key="product.details.savie.group2.section1.title" bundle="${msg}" /> </a>
									</li>
									<!--  <li role="presentation" class="col-lg-2 col-md-2 col-sm-2 col-xs-2 navtabs-li" id="benefits-nav-title-3">
										<a href="#benefits-navtabs-3" role="tab" data-toggle="tab" class="navtabs-title ui-link text-center"><fmt:message key="savie.online.landing.navtabs.withdrawal" bundle="${msg}" /> <span><fmt:message key="savie.online.landing.navtabs.without" bundle="${msg}" /></span></a>
									</li> -->
									<li role="presentation" class="col-lg-4 col-md-4 col-sm-4 col-xs-4 navtabs-li last" id="benefits-nav-title-4">
										<a href="#benefits-navtabs-4" role="tab" data-toggle="tab" class="navtabs-title last-fna ui-link text-center"><fmt:message key="product.details.savie.group4.section1.title" bundle="${msg}" /> </a>
									</li>
									<!-- <li role="presentation" class="col-lg-2 col-md-2 col-sm-2 col-xs-2 navtabs-li last" id="benefits-nav-title-5">
										<a href="#benefits-navtabs-5" role="tab" data-toggle="tab" class="navtabs-title last-fna ui-link text-center"><fmt:message key="savie.online.landing.navtabs.hours" bundle="${msg}" /> <span><fmt:message key="savie.online.landing.navtabs.hotline" bundle="${msg}" /></span></a>
									</li>-->
								</ul>
								<div class="fna-carousel carousel slide" id="benefits-carousel" data-ride="carousel" data-interval="false">
									<div class="tab-content carousel-inner clearfix" role="listbox">
												<!--<div role="tabpanel" class="fna-tab-content tab-pane item active" id="benefits-navtabs-1">
													<div class="benefits-content clearfix">
														<img src="<%=request.getContextPath()%>/resources/images/savie-regular/new-benefit-1.png">
														<div class="info">
															<h3><fmt:message key="product.details.savie.group1.section1.title.ocean" bundle="${msg}" /></h3>
															<p><fmt:message key="product.details.savie1.summary" bundle="${msg}" />  </p>
														</div>
													</div>
												</div>-->
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
															<h3><fmt:message key="savie.online.landing.earning" bundle="${msg}" /></h3>
															<p><fmt:message key="savie.online.landing.earning.content1" bundle="${msg}" />  </p>
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
															<h3><fmt:message key="savie.online.landing.payment" bundle="${msg}" /></h3>
															<p><fmt:message key="savie.online.landing.payment.content1" bundle="${msg}" />  </p>
														</div>
													</div>
												</div> -->
												<div role="tabpanel" class="fna-tab-content tab-pane item active" id="benefits-navtabs-6">
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
											<img src="<%=request.getContextPath()%>/resources/images/savie-regular/FWD_savie_banner_fwd-Savie-icon-chi-1.jpg" class="img-responsive ch-banner-img">
										</div>
									</div>
									<div class="item">
										<div class="savings-banner">
											<img src="<%=request.getContextPath()%>/resources/images/savie-regular/FWD_savie_banner-3_fwd-Savie-icon-en-2.jpg" class="img-responsive en-banner-img">
											<img src="<%=request.getContextPath()%>/resources/images/savie-regular/FWD_savie_banner-3_fwd-Savie-icon-chi-2.jpg" class="img-responsive ch-banner-img">
										</div>
									</div>
									<div class="item">
										<div class="savings-banner">
											<img src="<%=request.getContextPath()%>/resources/images/savie-regular/FWD_savie_banner-3_fwd-Savie-icon-eng-3.jpg" class="img-responsive en-banner-img">
											<img src="<%=request.getContextPath()%>/resources/images/savie-regular/FWD_savie_banner-3_fwd-Savie-icon-chi-3.jpg" class="img-responsive ch-banner-img">
										</div>
									</div>
									<div class="item">
										<div class="savings-banner">
											<img src="<%=request.getContextPath()%>/resources/images/savie-regular/FWD_savie_banner_fwd-Savie-icon-eng-4.jpg" class="img-responsive en-banner-img">
											<img src="<%=request.getContextPath()%>/resources/images/savie-regular/FWD_savie_banner_fwd-Savie-icon-chi-4.jpg" class="img-responsive ch-banner-img">
										</div>
									</div>
									<div class="item">
										<div class="savings-banner">
											<img src="<%=request.getContextPath()%>/resources/images/savie-regular/FWD_savie_banner_fwd-Savie-icon-eng-5.jpg" class="img-responsive en-banner-img">
											<img src="<%=request.getContextPath()%>/resources/images/savie-regular/FWD_savie_banner_fwd-Savie-icon-chi-5.jpg" class="img-responsive ch-banner-img">
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
		       			<h4 class="text-center"><fmt:message key="partner.offer.exclusive" bundle="${msg}" /></h4>
		       			<div class="gray-divide" id="bar-exclusive"></div>
		       			<div class="row partners-holder">
		       				<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 text-center">&nbsp;</div>
		       				<div class="col-xs-4 col-md-4 col-lg-4 text-center">
		       					<div class="desktop-center clearfix" >
									<img src="<%=request.getContextPath()%>/resources/images/savie-regular/partner_agoda.png">
<!-- 		        					<div class="partner-desc"> -->
<%-- 		        						<fmt:message key="partner.agoda.desc1.part1" bundle="${msg}" /> <a href="<fmt:message key="agoda.promo2.link" bundle="${msg}" />" target="_blank"><fmt:message key="partner.agoda.desc1.part2" bundle="${msg}" /></a> <fmt:message key="partner.agoda.desc1.part3" bundle="${msg}" /> <a href="<%=request.getContextPath()%>/<fmt:message key="agoda.tnc.link" bundle="${msg}" />" target="_blank"><fmt:message key="partner.agoda.desc1.part4" bundle="${msg}" /></a> <fmt:message key="partner.agoda.desc1.part5" bundle="${msg}" /> --%>
<!-- 		        					</div> -->
		       					</div>
		       				</div>
		       				<div class="col-xs-4 col-md-4 col-lg-4 text-center">
		       					<div class="desktop-center clearfix" >
									<img src="<%=request.getContextPath()%>/resources/images/savie-regular/theclub-logo.png">
									
		       					</div>
		       				</div>		       				
		       				<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 text-center">&nbsp;</div>
		       			</div>
		       		</div>
	        		<div class="fna-icons-body text-center clearfix">
				<div class="fwd-container-limit" id="nav-holder">
					<ul class="nav nav-tabs row so-fna-row visible-xs visible-sm" role="tablist">
						<li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li active" id="nav-title-1">
							<a href="#navtabs-1" role="tab" data-toggle="tab" class="navtabs-title first-fna ui-link"><fmt:message key="pillar.support.title" bundle="${msg}" /></a>
						</li>
						<li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li" id="nav-title-2">
							<a href="#navtabs-2" role="tab" data-toggle="tab" class="navtabs-title ui-link"><fmt:message key="pillar.convenience.title" bundle="${msg}" /></a>
						</li>
						<li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li" id="nav-title-3">
							<a href="#navtabs-3" role="tab" data-toggle="tab" class="navtabs-title ui-link"><fmt:message key="pillar.claim.easy.title" bundle="${msg}" /></a>
						</li>
						<li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li last" id="nav-title-4">
							<a href="#navtabs-4" role="tab" data-toggle="tab" class="navtabs-title last-fna ui-link"><fmt:message key="pillar.eservice.app.title" bundle="${msg}" /></a>
						</li>
					</ul>
					<div class="fna-carousel carousel slide" id="so-carousel" data-ride="carousel" data-interval="false">
						<div class="tab-content carousel-inner clearfix" role="listbox">
							<div role="tabpanel" class="fna-tab-content tab-pane item active" id="navtabs-1" next-target="nav-title-2">
								<div class="so-fna-content">
									<div class="fna-icon-circle">
										<img src="<%=request.getContextPath()%>/resources/images/savie-regular/fna-1.png">
									</div>
									<h3 class="visible-md visible-lg  tab-head"><fmt:message key="pillar.support.title" bundle="${msg}" /></h3>
									 <p><fmt:message key="pillar.support.copy1" bundle="${msg}" /> <!--<a href="#" class="eserv-link ui-link">eServices</a>--></p>
								</div>
							</div>
							<div role="tabpanel" class="fna-tab-content tab-pane item" id="navtabs-2" next-target="nav-title-3">
								<div class="so-fna-content">
									<div class="fna-icon-circle">
										<img src="<%=request.getContextPath()%>/resources/images/savie-regular/fna-2.png">
									</div>
									<h3 class="visible-md visible-lg tab-head"><fmt:message key="pillar.convenience.title" bundle="${msg}" /></h3>
									<p> <fmt:message key="pillar.convenience.copy1" bundle="${msg}" /></p>
								</div>
							</div>
							<div role="tabpanel" class="fna-tab-content tab-pane item" id="navtabs-3" next-target="nav-title-4">
								<div class="so-fna-content">
									<div class="fna-icon-circle">
										<img src="<%=request.getContextPath()%>/resources/images/savie-regular/fna-3.png">
									</div>
									<h3 class="visible-md visible-lg tab-head"><fmt:message key="pillar.claim.easy.title" bundle="${msg}" /></h3>
									<p><fmt:message key="pillar.claim.easy.copy1.part1" bundle="${msg}" /> <a href="<fmt:message key="link.claims" bundle="${msg}" />" class="eserv-link ui-link" target="_blank"><fmt:message key="pillar.claim.easy.copy1.part2" bundle="${msg}" /></a> <fmt:message key="pillar.claim.easy.copy1.part3" bundle="${msg}" /></p>
								</div>
							</div>
							<div role="tabpanel" class="fna-tab-content tab-pane item" id="navtabs-4" next-target="nav-title-1">
								<div class="so-fna-content">
									<div class="fna-icon-circle">
										<img src="<%=request.getContextPath()%>/resources/images/savie-regular/fna-4.png">
									</div>
									<h3 class="visible-md visible-lg  tab-head"><fmt:message key="pillar.eservice.app.title" bundle="${msg}" /></h3>
									<p><fmt:message key="pillar.eservice.app.copy1.part1" bundle="${msg}" /> <a href="<fmt:message key="link.eservices" bundle="${msg}" />" class="eserv-link ui-link" target="_blank"><fmt:message key="pillar.eservice.app.copy1.part2" bundle="${msg}" /></a> <fmt:message key="pillar.eservice.app.copy1.part3" bundle="${msg}" /></p>
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
							<h5 class="text-center"><fmt:message key="savie.online.landing.blog.save" bundle="${msg}" /></h5>
						</div>
						<div class="btn-holder">
							<button id="btn-blog-link" class="savie-regular-btn"><fmt:message key="blog.headline" bundle="${msg}" /></button>
						</div>
					</div>
					<div class="hidden-xs hidden-sm">
						<h3 class="text-center"><fmt:message key="blog.headline" bundle="${msg}" /></h3>
						<div class="gray-divide"></div>
						<p class="definition text-center"><fmt:message key="blog.home.description" bundle="${msg}" /></p>
	
						<div class="blogs-holder clearfix fwd-container-limit">
							<div class="blogs first">
								<img src="<%=request.getContextPath()%>/resources/images/savie-regular/blog-1.jpg" class="img-responsive">
								<div class="orange-overlay text-center">
									<p class="title"><fmt:message key="savie.online.landing.blog.title3" bundle="${msg}" /></p>
									<span><fmt:message key="savie.online.landing.blog.span3" bundle="${msg}" /></span>
									<p class="definition"></p>
									<a class="btn-read-now" href="<fmt:message key="link.blog.savie.post4" bundle="${msg}" />" target="_blank"><fmt:message key="button.read.more.article" bundle="${msg}" /></a>
								</div>
							</div>
							<div class="blogs">
								<img src="<%=request.getContextPath()%>/resources/images/savie-regular/blog-2.jpg" class="img-responsive">
								<div class="orange-overlay text-center">
									<p class="title"><fmt:message key="savie.online.landing.blog.title2" bundle="${msg}" /></p>
									<span><fmt:message key="savie.online.landing.blog.span2" bundle="${msg}" /></span>
									<p class="definition"></p>
									<a class="btn-read-now" href="<fmt:message key="link.blog.savie.post5" bundle="${msg}" />" target="_blank"><fmt:message key="button.read.more.article" bundle="${msg}" /></a>
								</div>
							</div>
							<div class="blogs">
								<img src="<%=request.getContextPath()%>/resources/images/savie-regular/blog-3.jpg" class="img-responsive">
								<div class="orange-overlay text-center">
									<p class="title"><fmt:message key="blog.savie.post3.title" bundle="${msg}" /></p>
									<span><fmt:message key="savie.online.landing.blog.span2" bundle="${msg}" /></span>
									<p class="definition"></p>
									<a class="btn-read-now" href="<fmt:message key="link.blog.savie.post6" bundle="${msg}" />" target="_blank"><fmt:message key="button.read.more.article" bundle="${msg}" /></a>
								</div>
							</div>
							<div class="blogs last">
								<img src="<%=request.getContextPath()%>/resources/images/savie-regular/blog-4.jpg" class="img-responsive">
								<div class="orange-overlay text-center">
									<p class="title"><fmt:message key="blog.savie.post4.title" bundle="${msg}" /></p>
									<span><fmt:message key="savie.online.landing.blog.span2" bundle="${msg}" /></span>
									<p class="definition"></p>
									<a class="btn-read-now" href="<fmt:message key="link.blog.savie.post7" bundle="${msg}" />" target="_blank"><fmt:message key="button.read.more.article" bundle="${msg}" /></a>
								</div>
							</div>
						</div>
	
						<div class="fwd-container-limit">
							<p class="blog-notice"><fmt:message key="disclaimer.blog" bundle="${msg}" /></p>
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
									<h2><fmt:message key="Fanfare.clickdetail.lightbox3.subtitle1" bundle="${msg}" /></h2>
									<h4><fmt:message key="savie.o2o.landing.Your.application" bundle="${msg}" /></h4>
									<p><fmt:message key="savie.o2o.landing.Can't.make" bundle="${msg}" /></p>
								</div>
								
								<div class="bottom-section">
									<button type="button" class="btn" data-dismiss="modal"><fmt:message key="savie.planDetails.thank.you.btn.text" bundle="${msg}" /></button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!--Access Code Modal-->
			<div class="modal fade" role="dialog" aria-labelledby="accessCode" id="accessCodeO2O">
				<div class=" hunger-selling-container container-fluid modal-dialog" role="document">
					<div class="modal-content hunger-selling-content">
						<div class="hunger-selling-header text-center">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="hunger-selling-title"><fmt:message key="savie.o2o.landing.Please.enter" bundle="${msg}" /></h4>
						</div>
						<div class="modal-body hunger-selling-body">
							<div>
								<form id="o2o-landing-form" action="<%=request.getContextPath()%>/${language}/savings-insurance/plan-details-sp" method="post">
									<span class="validation-msg hidden-error-msg"><fmt:message key="savie.o2o.landing.The.code" bundle="${msg}" /></span>							
									<button type="submit" id="hunger-btn" class="btn hunger-btn"><fmt:message key="savie.o2o.landing.Submit" bundle="${msg}" /></button>
								</form>
							</div>
							<div class="disclaimer">
								<fmt:message key="savie.o2o.landing.Access.code.disclaimer.part1" bundle="${msg}" /> <a href="<%=request.getContextPath()%><fmt:message key="savie.o2o.landing.Access.code.disclaimer.link" bundle="${msg}" />" target="_blank"><fmt:message key="savie.o2o.landing.Access.code.disclaimer.link.text" bundle="${msg}" /></a> <fmt:message key="savie.o2o.landing.Access.code.disclaimer.part2" bundle="${msg}" />
							</div>
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal-dialog -->	
			</div><!-- /.modal -->
			
			<!--Signup Now Modal-->
			<div class="modal fade" role="dialog" aria-labelledby="signupnow" id="signup-now-modal">
				<div class=" hunger-selling-container container-fluid modal-dialog" role="document">
					<div class="modal-content hunger-selling-content">
						<div class="hunger-selling-header text-center">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="hunger-selling-title"><fmt:message key="savie.o2o.landing.waiting.list.title" bundle="${msg}" /></h4>
						</div>
						<div class="modal-body hunger-selling-body">
							<form method="post" id="teaserSignUpForm" action="">
								<div class="input-holder">
									<input placeholder="<fmt:message key="savie.o2o.landing.waiting.list.email.placeholder" bundle="${msg}" />" type="text" autocomplete="off" name="signupEmail" id="teaserEmail" maxlength="40" />
									<span id="emailErrMsg" class="error-email"><fmt:message key="savie.o2o.landing.waiting.list.email.error" bundle="${msg}" /></span>
									<input placeholder="<fmt:message key="savie.o2o.landing.waiting.list.phone.placeholder" bundle="${msg}" />" type="number" name="signupMobileNo" id="teaserPhoneNo" maxlength="8" oninput="maxLengthReview(this)" onkeydown="return isNumberKey(event)" />
									<span id="phoneErrMsg" class="error-email hideSpan">&nbsp;</span>
									<input type="hidden" name="affiliate" value="${affiliate}">
								</div>

								<div class="fwd-checkbox">
									<input type="checkbox" id="personal-information-statement-signup" name="isPics" value="pics">
									<label for="personal-information-statement-signup"></label>
									<p class="notice"><fmt:message key="savie.o2o.landing.waiting.list.personal.statement.part1" bundle="${msg}" /><a href="<fmt:message key="savie.interestGather.personal.collection.link" bundle="${msg}" />" target="_blank"><fmt:message key="savie.o2o.landing.waiting.list.personal.statement.link.text" bundle="${msg}" /></a><fmt:message key="savie.o2o.landing.waiting.list.personal.statement.part2" bundle="${msg}" /></p>
								</div>

								<div class="fwd-checkbox">
									<input type="checkbox" id="terms-condition-statement-signup" name="isTc" value="tc">
									<label for="terms-condition-statement-signup"></label>
									<p class="notice"><fmt:message key="savie.o2o.landing.waiting.list.terms.part1" bundle="${msg}" /><a href="<%=request.getContextPath()%>/<fmt:message key="savie.interestGather.terms.conditions.link" bundle="${msg}" />" target="_blank"><fmt:message key="savie.o2o.landing.waiting.list.terms.link.text" bundle="${msg}" /></a><fmt:message key="savie.o2o.landing.waiting.list.terms.part2" bundle="${msg}" /></p>
								</div>
								<span class="error-email chk hideSpan" id="checkboxErrorMessage">&nbsp;</span>					
								<button type="submit" id="signup-btn" class="btn hunger-btn"><fmt:message key="savie.o2o.landing.waiting.list.submit" bundle="${msg}" /></button>
							</form>
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal-dialog -->	
			</div><!-- /.modal -->
			<!-- FOOTER -->
		</div>
		
		
		<div class="modal fade" role="dialog" aria-labelledby="teaserSurvery"
			id="teaserSurvery">
			<div class="modal-dialog teaserSurvey" role="document">
				<div class="modal-content teaserSurvey">
					<div class="modal-header teaserSurvey">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h2><fmt:message key="savie.interestGather.survey.thank.you" bundle="${msg}" /></h2>
					</div>
					<div class="modal-body teaserSurvey">
						<p class="registered"><fmt:message key="savie.interestGather.survey.successfully.registered" bundle="${msg}" /></p>
						<p class="registered"><fmt:message key="savie.interestGather.survey.tell.more" bundle="${msg}" /></p>
		
						<div class="modal-divider"></div>
		
						<p class="question"><fmt:message key="savie.interestGather.survey.plan.save" bundle="${msg}" /></p>
		
						<form class="amount-to-save">
							<div class="teaser-select">
									<select class="form-control saveDropdown" name="amountToSave"
									id="amountToSave">
									<option selected disabled value=""><fmt:message key="savie.interestGather.survey.please.select" bundle="${msg}" /></option>
									<c:forEach var="savieAns" items="${savieAns}" varStatus="theCount">
										<enhance:out escapeXml="false">
										    <option value="${savieAns.itemCode }" class="options">${savieAns.itemDesc }</option>
										</enhance:out>
									</c:forEach>
								</select>
							</div>
							<button type="submit" class="btn btn-white btn-thank-you"
								id="teaser-mmodal-submit" onclick="sendStep2Email()"><fmt:message key="savie.interestGather.survey.submit" bundle="${msg}" /></button>
						</form>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
		
		<!-- JS INCLUDES -->
		
		<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/bootstrap-datepicker.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/jasny-bootstrap.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/evergreen/bootstrap-select.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/evergreen/jquery.touchSwipe.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/bootstrapValidator.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/custom.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/custom.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/fwd-validation.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/placeholders.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/evergreen/date.format.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/jquery.timepicker.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/evergreen/fwd-teaser.js"></script>
		
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
			
			$( window ).resize(function() {
				//bannerimg();
			});

			function bannerimg() {
				if(getWidth() >= 992 && getWidth() <= 1350) {
					$('#hero-img-desktop').attr('src','<%=request.getContextPath()%>/resources/images/savie/o2o-landing/landing-md-bg-desktopss.jpg');
				}
				else {
					$('#hero-img-desktop').attr('src','<%=request.getContextPath()%>/resources/images/savie-regular/landing-bg-desktop.jpg')
				}
			}
			function preventSwipe() {
				if(getWidth() > 991) {
					$("#so-carousel").on('swipeleft swiperight', '.selector', function(event) {
					 	event.stopPropagation();
					 	event.preventDefault();
					});
				}
			}

			// Access Code Cover
			$('#hunger-selling-buy-now-O2O').click(function(e){
				//$('.hunger-selling-container').removeClass('hidden');
				//$('#accessCodeO2O').modal('show');
				getAppointmentAccessCode();
			});
			$('#op-buy-now-O2O-mobile').click(function(e){
				//$('#accessCodeO2O').modal('show');
				getAppointmentAccessCode();
			});
            //
			// Access Code Cover Close
			//$('#close-cover').click(function(e){
			//	$('.hunger-selling-container').addClass('hidden');
			//});

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
								/* var url = '${pageContext.request.contextPath}/${language}/savings-insurance/${nextPageFlow}';
								$("#o2o-landing-form").attr("action", url); */
								$('#o2o-landing-form').submit();
							}
				        },
						error:function(){
						    console.log('error');     
					    }
				    });
			};

			// Sign up now validation
			$('#teaserSignUpForm').submit(function(e){
				e.preventDefault();				
				
				var errorMsg = false;
				var signupEmail = $('#signupEmail').val();
				var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
				var validEmail = re.test(signupEmail);
				var isPlaceholder = true;
				if (signupEmail == "" || !validEmail) {
					// $('#emailErrMsg').addClass('visible');
					$('#emailErrMsg').css('visibility', 'visible');
					errorMsg = true;
				}

				var phone = $('#teaserPhoneNo').val().length;
				if ($('#teaserPhoneNo').val() == $('#teaserPhoneNo').attr('placeholder')) {
					isPlaceholder=false;					
				} else if (phone > 0 && phone < 8) {
					$('#phoneErrMsg').html(getBundle(getBundleLanguage, "savie.interestgather.signupform.phoneNo.invalid.message")).removeClass('hideSpan');
					errorMsg = true;
				} else {
					$('#phoneErrMsg').addClass('hideSpan');

					var firstNum = $('#teaserPhoneNo').val().substr(0, 1);
					switch(firstNum) {
						case "1": case "2": case "3": case "4": case "7": case "0":
							$('#phoneErrMsg').html(getBundle(getBundleLanguage, "savie.interestgather.signupform.phoneNo.invalid.message")).removeClass('hideSpan');
							errorMsg = true;
					}
				}

				if(!isPlaceholder){
					$('#teaserPhoneNo').val('');
				}
				
			});
			
			// Sign up Now Button
			$('#signup').click(function(e){
				$('#signup-now-modal').modal('show');
			});
			
			$('#read-more-other-benefits').click(function(e){
				$('.other-benefits-list-mobile').removeClass('hidden-xs');
				$('.other-benefits-list-mobile').removeClass('hidden-sm');
				$('#read-more-other-benefits').hide();
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
				$(window).load(function(){
			        //Display thankyou popup
					//$('#thankyouPopup').modal('show');
					$('#thankyouPopup').modal({
						backdrop: 'static',
						keyboard: false
					});
			    });
				
				$('#btn-blog-link').click(function(){
					window.location.href='<fmt:message key="link.blog" bundle="${msg}" />';
				});

			});
		
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
