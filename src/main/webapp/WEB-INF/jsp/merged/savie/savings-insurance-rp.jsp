<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/savie-regular-styles.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/material.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/savie/savie-discount.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/savie/savie-ocean-park.css" />
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
  "image":"${scriptImg}",
  "description":"${scriptDescription}",
  "brand":{
    "@type":"Insurance",
    "name":"${scriptChildName}"
  },
  "offers":{
    "@type":"AggregateOffer",
    "lowPrice":"1000",
    "highPrice":"10000",
    "priceCurrency":"HKD"
  }
}
</script>

	<div class="fwd-savie-wrapper ">
		<div class="fwd-container container-fluid breadcrumbs savie-regular-pay-breadcrumbs">
				<div class="breadcrumb-container">
	                <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
	                  <li><a href="#"><fmt:message key="breadcrumb.home" bundle="${msg}" /></a></li>
	                  <li class="divider"><i class="fa fa-angle-right"></i></li>
	                  <li><a href="#"><fmt:message key="breadcrumb.savie.category" bundle="${msg}" /> </a></li>
	                  <li class="divider"><i class="fa fa-angle-right"></i></li>
	                  <li class="active-bc" id="et-active-bc-menu"><fmt:message key="navbar.category2.group2.group1.item1" bundle="${msg}" /></li>
					 </ol>
				</div>
			</div>
	</div>

	
	
	<div class="savie-regular-container savie-regular-landing rp-only">
		<div class="whole-banner">
        	<div class="page-banner">
        		<img src="<%=request.getContextPath()%>/<fmt:message key="savie.online.hero.image.mobile" bundle="${msg}" />" class="img-responsive hidden-md hidden-lg">
        		<img src="<%=request.getContextPath()%>/<fmt:message key="savie.online.hero.image" bundle="${msg}" />" class="img-responsive hidden-xs hidden-sm">
				<%--<a class="img-bg" href="#vModal" data-toggle="modal">
					<img class="play-btn" src="<%=request.getContextPath()%>/resources/images/savie-2016/videoplay.png">
				</a> --%>
				<div class="fwd-container-limit">

        		<form id="o2o-landing-form" action="<%=request.getContextPath()%>/${language}/savings-insurance/plan-details-rp" method="post">
	        		<div class="img-banner-text savie-landing">
	        			<div id="clearfix-height-rp">
	        				<button id="op-buy-now-O2O-mobile" class="savie-regular-btn start-btn"><fmt:message key="button.start" bundle="${msg}" /></button>
	        			</div>
        			<div class="savie-product text-bold">
						<a href="<%=request.getContextPath()%>/<fmt:message key="link.brochure.savie.rp" bundle="${msg}" />" target="_blank"><fmt:message key="label.product.brochure" bundle="${msg}" /></a> | <a href="<%=request.getContextPath()%>/<fmt:message key="link.provisions.savie.rp" bundle="${msg}" />" target="_blank"><fmt:message key="label.product.provisions" bundle="${msg}" /></a>
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
	        				<button id="regular-button" class="active"><fmt:message key="label.savie.payment.mode.savie.regular.monthly" bundle="${msg}" /></button>
	        			</div>
	        			<div class="right">
	        				<button id="one-off-button"><fmt:message key="label.savie.payment.mode.savie.regular.pay" bundle="${msg}" /></button>
	        			</div>
	        		</div>
	        	</div>
        	</div>
		        	<div class="desktop-inline rate-holder">
		        		<div class="rate">
		        			<!--h4 class="text-center"><fmt:message key="custom.save.credit.rate.title" bundle="${msg}" /></h4>
		        			<ul class="clearfix">
		        				<li><fmt:message key="custom.savie.credit.rate.rate1" bundle="${msg}" /></li>
		        				<li class="with-padding"><fmt:message key="custom.savie.credit.rate.rate2" bundle="${msg}" /></li>
		        				<li class="with-padding"><fmt:message key="custom.savie.credit.rate.rate3" bundle="${msg}" /></li>
		        			</ul-->
							<!-- Ocean Park Discount -->
							<h4 class="text-center"><fmt:message key="savie.online.home.ocean.park.rate.title" bundle="${msg}" /></h4>
							<ul class="clearfix">
								<li><fmt:message key="savie.online.home.ocean.park.rate" bundle="${msg}" /></li>
							</ul>
		        		</div>
	        		</div>

	        <!-- Savie Discount Start -->
					<div class="ocean-park-wrapper">
						<div class="text-center">
							<p class="txt-discount"><fmt:message key="savie.online.home.ocean.park.tagline" bundle="${msg}" /><br class="visible-xs"/><br class="visible-xs"/><a href="#ocean-park-wrapper-inner-anchor" class="btn-ocean-park-start hidden"><fmt:message key="savie.online.home.ocean.park.btn.promotion.detail" bundle="${msg}" /></a> </p>
						</div>
						<div id="ocean-park-wrapper-inner-anchor"></div>
						<div class="ocean-park-wrapper-inner">
							<table class="tbl-ocean-park hidden-xs">
								<tr>
									<th rowspan="2"><fmt:message key="savie.online.home.ocean.park.card.holder" bundle="${msg}" /></th>
									<td class="card-head premium-head"><fmt:message key="savie.online.home.ocean.park.card.premium" bundle="${msg}" /><div class='arrow'></div></td>
									<td class="card-head gold-head"><fmt:message key="savie.online.home.ocean.park.card.gold" bundle="${msg}" /><div class='arrow'></div></td>
									<td class="card-head silver-head"><fmt:message key="savie.online.home.ocean.park.card.silver" bundle="${msg}" /><div class='arrow'></div></td>
								</tr>
								<tr>
									<td class="card-img premium-img"><img src="<%=request.getContextPath()%>/resources/images/savie/savie-ocean-park/premiumpass.jpg" class="img-responsive"></td>
									<td class="card-img gold-img"><img src="<%=request.getContextPath()%>/resources/images/savie/savie-ocean-park/goldpass.jpg" class="img-responsive"></td>
									<td class="card-img silver-img"><img src="<%=request.getContextPath()%>/resources/images/savie/savie-ocean-park/silverpass.jpg" class="img-responsive"></td>
								</tr>
								<tr>
									<th><fmt:message key="savie.online.home.ocean.park.initial.premium" bundle="${msg}" /></th>
									<td class="premium-1"><fmt:message key="savie.online.home.discount.price.prefix" bundle="${msg}" /> 2,185<fmt:message key="savie.online.home.discount.price.suffix" bundle="${msg}" /></td>
									<td class="gold-1"><fmt:message key="savie.online.home.discount.price.prefix" bundle="${msg}" /> 1,035<fmt:message key="savie.online.home.discount.price.suffix" bundle="${msg}" /></td>
									<td class="silver-1"><fmt:message key="savie.online.home.discount.price.prefix" bundle="${msg}" /> 798<fmt:message key="savie.online.home.discount.price.suffix" bundle="${msg}" /></td>
								</tr>
								<tr>
									<th>
										<fmt:message key="savie.online.home.ocean.park.oneoff.premium" bundle="${msg}" />
										<div class="min-amount"><fmt:message key="savie.online.home.ocean.park.min.amount" bundle="${msg}" /></div>
									</th>
									<td class="premium-2"><fmt:message key="savie.online.home.discount.price.prefix" bundle="${msg}" /> 400,000<fmt:message key="savie.online.home.discount.price.suffix" bundle="${msg}" /></td>
									<td class="gold-2"><fmt:message key="savie.online.home.ocean.park.larger.sign" bundle="${msg}" /><fmt:message key="savie.online.home.discount.price.prefix" bundle="${msg}" /> 100,000<fmt:message key="savie.online.home.discount.price.suffix" bundle="${msg}" /></td>
									<td class="silver-2"><fmt:message key="savie.online.home.ocean.park.larger.sign" bundle="${msg}" /><fmt:message key="savie.online.home.discount.price.prefix" bundle="${msg}" /> 100,000<fmt:message key="savie.online.home.discount.price.suffix" bundle="${msg}" /></td>
								</tr>
								<tr>
									<th>
										<fmt:message key="savie.online.home.ocean.park.monthly" bundle="${msg}" />
										<div class="min-amount"><fmt:message key="savie.online.home.ocean.park.min.amount" bundle="${msg}" /></div>
									</th>
									<td class="premium-3"><fmt:message key="savie.online.home.ocean.park.not.available" bundle="${msg}" /></td>
									<td class="gold-3"><fmt:message key="savie.online.home.ocean.park.larger.sign" bundle="${msg}" /><fmt:message key="savie.online.home.discount.price.prefix" bundle="${msg}" /> 10,000<fmt:message key="savie.online.home.discount.price.suffix" bundle="${msg}" /></td>
									<td class="silver-3"><fmt:message key="savie.online.home.ocean.park.larger.sign" bundle="${msg}" /><fmt:message key="savie.online.home.discount.price.prefix" bundle="${msg}" /> 10,000<fmt:message key="savie.online.home.discount.price.suffix" bundle="${msg}" /></td>
								</tr>
							</table>
							<div class="tbl-ocean-park-mobile visible-xs clearfix">
								<div class="sticky-header">
									<table>
										<tr>
											<th rowspan="2"><fmt:message key="savie.online.home.ocean.park.card.holder" bundle="${msg}" /></th>
										</tr>
										<tr></tr>
										<tr>
											<th><fmt:message key="savie.online.home.ocean.park.initial.premium" bundle="${msg}" /></th>
										</tr>
										<tr>
											<th>
												<fmt:message key="savie.online.home.ocean.park.oneoff.premium" bundle="${msg}" />
												<div class="min-amount"><fmt:message key="savie.online.home.ocean.park.min.amount" bundle="${msg}" /></div>
											</th>
										</tr>
										<tr>
											<th>
												<fmt:message key="savie.online.home.ocean.park.monthly" bundle="${msg}" />
												<div class="min-amount"><fmt:message key="savie.online.home.ocean.park.min.amount" bundle="${msg}" /></div>
											</th>
										</tr>
									</table>
								</div>
								<div class="sticky-btns">
									<a href="javascript:void(0);" class="btn-left"><i class="fa fa-caret-left" aria-hidden="true"></i></a>
									<a href="javascript:void(0);" class="btn-right"><i class="fa fa-caret-right" aria-hidden="true"></i></a>
								</div>
								<div class="overflow-body">
									<table>
										<tr>
											<td class="card-head premium-head"><fmt:message key="savie.online.home.ocean.park.card.premium" bundle="${msg}" /><div class='arrow'></div></td>
											<td class="card-head gold-head"><fmt:message key="savie.online.home.ocean.park.card.gold" bundle="${msg}" /><div class='arrow'></div></td>
											<td class="card-head silver-head"><fmt:message key="savie.online.home.ocean.park.card.silver" bundle="${msg}" /><div class='arrow'></div></td>
										</tr>
										<tr>
											<td class="card-img premium-img"><img src="<%=request.getContextPath()%>/resources/images/savie/savie-ocean-park/premiumpass.jpg" class="img-responsive"></td>
											<td class="card-img gold-img"><img src="<%=request.getContextPath()%>/resources/images/savie/savie-ocean-park/goldpass.jpg" class="img-responsive"></td>
											<td class="card-img silver-img"><img src="<%=request.getContextPath()%>/resources/images/savie/savie-ocean-park/silverpass.jpg" class="img-responsive"></td>
										</tr>
										<tr>
											<td class="premium-1"><fmt:message key="savie.online.home.discount.price.prefix" bundle="${msg}" /> 2,185<fmt:message key="savie.online.home.discount.price.suffix" bundle="${msg}" /></td>
											<td class="gold-1"><fmt:message key="savie.online.home.discount.price.prefix" bundle="${msg}" /> 1,035<fmt:message key="savie.online.home.discount.price.suffix" bundle="${msg}" /></td>
											<td class="silver-1"><fmt:message key="savie.online.home.discount.price.prefix" bundle="${msg}" /> 798<fmt:message key="savie.online.home.discount.price.suffix" bundle="${msg}" /></td>
										</tr>
										<tr>
											<td class="premium-2"><fmt:message key="savie.online.home.discount.price.prefix" bundle="${msg}" /> 400,000<fmt:message key="savie.online.home.discount.price.suffix" bundle="${msg}" /></td>
											<td class="gold-2"><fmt:message key="savie.online.home.ocean.park.larger.sign" bundle="${msg}" /><fmt:message key="savie.online.home.discount.price.prefix" bundle="${msg}" /> 100,000<fmt:message key="savie.online.home.discount.price.suffix" bundle="${msg}" /></td>
											<td class="silver-2"><fmt:message key="savie.online.home.ocean.park.larger.sign" bundle="${msg}" /><fmt:message key="savie.online.home.discount.price.prefix" bundle="${msg}" /> 100,000<fmt:message key="savie.online.home.discount.price.suffix" bundle="${msg}" /></td>
										</tr>
										<tr>
											<td class="premium-3"><fmt:message key="savie.online.home.ocean.park.not.available" bundle="${msg}" /></td>
											<td class="gold-3"><fmt:message key="savie.online.home.ocean.park.larger.sign" bundle="${msg}" /><fmt:message key="savie.online.home.discount.price.prefix" bundle="${msg}" /> 10,000<fmt:message key="savie.online.home.discount.price.suffix" bundle="${msg}" /></td>
											<td class="silver-3"><fmt:message key="savie.online.home.ocean.park.larger.sign" bundle="${msg}" /><fmt:message key="savie.online.home.discount.price.prefix" bundle="${msg}" /> 10,000<fmt:message key="savie.online.home.discount.price.suffix" bundle="${msg}" /></td>
										</tr>
									</table>
								</div>
							</div>
							<div class="text-center pans">
								<div class="won-panel">
									<a href="<%=request.getContextPath()%>/${language}/savings-insurance/plan-details-sp" class="btn-ocean-park btn-spd-next"><fmt:message key="savie.online.home.discount.btn.start" bundle="${msg}" /></a>
								</div>
							</div>
							<ul>
								<li class="remarks grey"><fmt:message key="savie.online.home.ocean.park.tnc1" bundle="${msg}" /></li>
								<li class="remarks grey"><fmt:message key="savie.online.home.ocean.park.tnc2.prefix" bundle="${msg}" /> <a href="<%=request.getContextPath()%>/<fmt:message key="savie.online.home.ocean.park.tnc2.url" bundle="${msg}" />" target="_blank"><fmt:message key="savie.online.home.ocean.park.tnc2.linktext" bundle="${msg}" /></a><fmt:message key="savie.online.home.ocean.park.tnc2.suffix" bundle="${msg}" /></li>
							</ul>
						</div>
					</div>
				<!-- Savie Discount End -->

     		<ul class="availability-notice" style="padding-left: 10px;">
  			<%--<li><fmt:message key="product.detail.savie.remark.copy1_4" bundle="${msg}" /></li> --%>
  			<%--<li><fmt:message key="product.detail.savie.remark.copy1_8" bundle="${msg}" /></li> --%>
  			<%--<li><fmt:message key="product.detail.savie.remark.copy1_5" bundle="${msg}" /></li> --%>
            <%--<li><fmt:message key="product.detail.savie.remark.copy1_6" bundle="${msg}" /></li> --%>
  			<%--<li><fmt:message key="product.detail.savie.remark.copy1_7" bundle="${msg}" /></li> --%>
  				<li><fmt:message key="product.detail.savie.remark.copy1_9" bundle="${msg}" /></li>
  				<li><fmt:message key="product.detail.savie.remark.copy1_10" bundle="${msg}" /></li>
  				<li><fmt:message key="product.detail.savie.remark.copy1_11" bundle="${msg}" /></li>
  				<li><fmt:message key="product.detail.savie.remark.copy1_12" bundle="${msg}" /></li>
  				<li><fmt:message key="product.detail.savie.remark.copy1_13" bundle="${msg}" /></li>
  			</ul>

       		<!-- <h5 class="hidden-sm hidden-xs product-options text-center">
				<a href="#"><fmt:message key="savie.interestGather.banner.product.brochure" bundle="${msg}" /></a> | <a href="#"><fmt:message key="savie.interestGather.banner.product.provisions" bundle="${msg}" /></a>
			</h5> -->
		</div>

        <div class="fwd-container-limit">
        		<div class="usp row">
        			<div class="usp-item clearfix col-xs-12 col-md-4">
        				<h5 class="hidden-xs hidden-sm"><fmt:message key="savie.online.usp.savie1.title" bundle="${msg}" /></h5>
        				<img src="<%=request.getContextPath()%><fmt:message key="img.big.savings-mobile" bundle="${msg}" />" class="">
        				<div class="item-desc">
        					<h5 class="hidden-md hidden-lg"><fmt:message key="savie.online.usp.savie1.title" bundle="${msg}" /></h5>
        					<p><fmt:message key="savie.online.usp.savie1.copy" bundle="${msg}" /></p>
        				</div>
        			</div>
        			<div class="usp-item clearfix col-xs-12 col-md-4">
        				<h5 class="hidden-xs hidden-sm"><fmt:message key="savie.online.usp.savie2.title" bundle="${msg}" /></h5>
        				<img src="<%=request.getContextPath()%><fmt:message key="img.no.commitment-mobile" bundle="${msg}" />" class="">
        				<div class="item-desc">
        					<h5 class="hidden-md hidden-lg"><fmt:message key="savie.online.usp.savie2.title" bundle="${msg}" /></h5>
        					<p class="padded"><fmt:message key="usp.savie2.copy" bundle="${msg}" /></p>
        				</div>
        			</div>
        			<div class="usp-item clearfix col-xs-12 col-md-4">
        				<h5 class="hidden-xs hidden-sm"><fmt:message key="savie.online.usp.savie3.title" bundle="${msg}" /></h5>
        				<img src="<%=request.getContextPath()%><fmt:message key="img.free.additional-mobile" bundle="${msg}" />" class="">
        				<div class="item-desc">
        					<h5 class="hidden-md hidden-lg"><fmt:message key="savie.online.usp.savie3.title" bundle="${msg}" /></h5>
        					<p class="padded"><fmt:message key="savie.online.usp.savie3.copy" bundle="${msg}" /></p>
        					<p class="accumulation padded"><fmt:message key="savie.online.usp.savie3.copy2" bundle="${msg}" /></p>
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
		        				<!-- <div class="col-xs-6 text-center annualTravel_policy_item">
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
		        					<img src="<%=request.getContextPath()%>/resources/images/savie-regular/benefit-7.png">
		        					<span><fmt:message key="product.details.savie.group7.section1.title" bundle="${msg}" /></span>
									<div class="hidden-benefits benefits-content">
										<img src="<%=request.getContextPath()%>/resources/images/savie-regular/benefit-7.png" />
										<div class="info hidden-benefits-info">
											<h3 class="hidden-benefits-info"><fmt:message key="product.details.savie.group7.section1.title" bundle="${msg}" /></h3>
											<p class="hidden-benefits-info"><fmt:message key="product.details.savie7.summary" bundle="${msg}" />  </p>
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
										<!-- <li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li active" id="benefits-nav-title-1">
											<a href="#benefits-navtabs-1" role="tab" data-toggle="tab" class="navtabs-title first-fna ui-link text-center"><fmt:message key="product.details.savie.group1.section1.title" bundle="${msg}" /> </a>
										</li>-->
									<li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li active" id="benefits-nav-title-7">
										<a href="#benefits-navtabs-7" role="tab" data-toggle="tab" class="navtabs-title first-fna ui-link text-center"><fmt:message key="product.details.savie.group7.section1.title" bundle="${msg}" /> </a>
									</li>
									<li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li" id="benefits-nav-title-6">
										<a href="#benefits-navtabs-6" role="tab" data-toggle="tab" class="navtabs-title last-fna ui-link text-center"><fmt:message key="product.details.savie.group6.section1.title" bundle="${msg}" /></a>
									</li>
									<li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li" id="benefits-nav-title-2">
										<a href="#benefits-navtabs-2" role="tab" data-toggle="tab" class="navtabs-title ui-link text-center"><fmt:message key="product.details.savie.group2.section1.title" bundle="${msg}" /> </a>
									</li>
										<!--  <li role="presentation" class="col-lg-2 col-md-2 col-sm-2 col-xs-2 navtabs-li" id="benefits-nav-title-3">
											<a href="#benefits-navtabs-3" role="tab" data-toggle="tab" class="navtabs-title ui-link text-center"><fmt:message key="savie.online.landing.navtabs.withdrawal" bundle="${msg}" /> <span><fmt:message key="savie.online.landing.navtabs.without" bundle="${msg}" /></span></a>
										</li> -->
									<li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li last" id="benefits-nav-title-4">
										<a href="#benefits-navtabs-4" role="tab" data-toggle="tab" class="navtabs-title last-fna ui-link text-center"><fmt:message key="product.details.savie.group4.section1.title" bundle="${msg}" /> </a>
									</li>
										<!-- <li role="presentation" class="col-lg-2 col-md-2 col-sm-2 col-xs-2 navtabs-li last" id="benefits-nav-title-5">
											<a href="#benefits-navtabs-5" role="tab" data-toggle="tab" class="navtabs-title last-fna ui-link text-center"><fmt:message key="savie.online.landing.navtabs.hours" bundle="${msg}" /> <span><fmt:message key="savie.online.landing.navtabs.hotline" bundle="${msg}" /></span></a>
										</li>-->
								</ul>
								<div class="fna-carousel carousel slide" id="benefits-carousel" data-ride="carousel" data-interval="false">
									<div class="tab-content carousel-inner clearfix" role="listbox">
											<!--  <div role="tabpanel" class="fna-tab-content tab-pane item active" id="benefits-navtabs-1">
												<div class="benefits-content clearfix">
													<img src="<%=request.getContextPath()%>/resources/images/savie-regular/new-benefit-1.png">
													<div class="info">
														<h3><fmt:message key="product.details.savie.group1.section1.title.ocean" bundle="${msg}" /></h3>
														<p><fmt:message key="product.details.savie1.summary" bundle="${msg}" />  </p>
													</div>
												</div>
											</div>-->
										<div role="tabpanel" class="fna-tab-content tab-pane item active" id="benefits-navtabs-7">
											<div class="benefits-content clearfix">
												<img src="<%=request.getContextPath()%>/resources/images/savie-regular/benefit-7.png">
												<div class="info">
													<h3><fmt:message key="product.details.savie.group7.title" bundle="${msg}" /></h3>
													<p><fmt:message key="product.details.savie7.summary" bundle="${msg}" />  </p>
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
									<!-- Carousel
									<a class="left carousel-control hidden-lg hidden-md ui-link" href="#so-carousel" role="button" data-slide="prev">
									</a>
									<a class="right carousel-control hidden-lg hidden-md ui-link" href="#so-carousel" role="button" data-slide="next">
									</a>
									-->
								</div>
							</div>
		        		</div>
        			</div>
        		</div>
       		</div>

       		<div class="ice-cream-banner hidden-xs hidden-sm">
	        				<div class="hidden-xs hidden-sm fwd-full-container container-fluid o2o-landing saving-plans">
							<div id="savings-carousel" class="carousel slide" data-ride="carousel">
								<!-- Wrapper for slides -->
								<div class="carousel-inner" role="listbox">
									<div class="item active">
										<div class="savings-banner">
											<img src="<%=request.getContextPath()%>/<fmt:message key="infographic.savie.landing.part1" bundle="${msg}" />" class="img-responsive">
										</div>
									</div>
									<div class="item">
										<div class="savings-banner">
											<img src="<%=request.getContextPath()%>/<fmt:message key="infographic.savie.landing.part2" bundle="${msg}" />" class="img-responsive en-banner-img">
										</div>
									</div>
									<div class="item">
										<div class="savings-banner">
											<img src="<%=request.getContextPath()%>/<fmt:message key="infographic.savie.landing.part3" bundle="${msg}" />" class="img-responsive">
										</div>
									</div>
									<div class="item">
										<div class="savings-banner">
											<img src="<%=request.getContextPath()%>/<fmt:message key="infographic.savie.landing.part4" bundle="${msg}" />" class="img-responsive">
										</div>
									</div>
									<div class="item">
										<div class="savings-banner">
											<img src="<%=request.getContextPath()%>/<fmt:message key="infographic.savie.landing.part5" bundle="${msg}" />" class="img-responsive">
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
       					<div class="desktop-center clearfix">
							<img src="<%=request.getContextPath()%>/resources/images/savie-regular/partner_agoda.png" class="img-responsive">
<!--         					<div class="partner-desc"> -->
<%--         						<fmt:message key="partner.agoda.desc1.part1" bundle="${msg}" /> <a href="<fmt:message key="agoda.promo2.link" bundle="${msg}" />" target="_blank"><fmt:message key="partner.agoda.desc1.part2" bundle="${msg}" /></a> <fmt:message key="partner.agoda.desc1.part3" bundle="${msg}" /> <a href="<%=request.getContextPath()%>/<fmt:message key="agoda.tnc.link" bundle="${msg}" />" target="_blank"><fmt:message key="partner.agoda.desc1.part4" bundle="${msg}" /></a> <fmt:message key="partner.agoda.desc1.part5" bundle="${msg}" /> --%>
<!--         					</div> -->
       					</div>
       				</div>
    		       			<div class="col-xs-4 col-md-4 col-lg-4 text-center">
		       					<div class="desktop-center clearfix">
									<img src="<%=request.getContextPath()%>/resources/images/savie-2016/theclub-logo.png" class="img-responsive" id="the-club-logo">

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

		<div class="content-disclaimer">
			<p><fmt:message key="Home.Landing.Disclaimer" bundle="${msg}" /></p>
		</div>

		<!-- OUR BLOG -->
		<div class="blog">
				<div class="hidden-md hidden-lg">
					<div class="mini-banner-holder">
						<img src="<%=request.getContextPath()%>/resources/images/savie-regular/read-our-blog.jpg" class="img-responsive">
						<div class="black-overlay"></div>
						<h5 class="text-center"><fmt:message key="blog.savie.description.mobile" bundle="${msg}" /></h5>
					</div>
					<div class="btn-holder">
						<button id="btn-blog-link" class="savie-regular-btn"><fmt:message key="blog.home.title" bundle="${msg}" /></button>
					</div>
				</div>
				<div class="hidden-xs hidden-sm">
						<h3 class="text-center"><fmt:message key="blog.headline" bundle="${msg}" /></h3>
						<div class="gray-divide"></div>
						<p class="definition text-center"><fmt:message key="blog.savie.description" bundle="${msg}" /></p>

						<div class="blogs-holder clearfix fwd-container-limit">
							<div class="blogs first">
								<img src="<%=request.getContextPath()%>/resources/images/savie-regular/blog-1.jpg" class="img-responsive">
								<div class="orange-overlay text-center">
									<p class="title"><fmt:message key="blog.savie.post1.title" bundle="${msg}" /></p>
									<span><fmt:message key="blog.label.save" bundle="${msg}" /></span>
									<p class="definition"></p>
									<a class="btn-read-now" href="<fmt:message key="blog.savie.post1.link" bundle="${msg}" />" target="_blank"><fmt:message key="button.read.more.article" bundle="${msg}" /></a>
								</div>
							</div>
							<div class="blogs">
								<img src="<%=request.getContextPath()%>/resources/images/savie-regular/blog-2.jpg" class="img-responsive">
								<div class="orange-overlay text-center">
									<p class="title"><fmt:message key="blog.savie.post2.title" bundle="${msg}" /></p>
									<span><fmt:message key="blog.label.save" bundle="${msg}" /></span>
									<p class="definition"></p>
									<a class="btn-read-now" href="<fmt:message key="blog.savie.post2.link" bundle="${msg}" />" target="_blank"><fmt:message key="button.read.more.article" bundle="${msg}" /></a>
								</div>
							</div>
							<div class="blogs">
								<img src="<%=request.getContextPath()%>/resources/images/savie-regular/blog-3.jpg" class="img-responsive">
								<div class="orange-overlay text-center">
									<p class="title"><fmt:message key="blog.savie.post3.title" bundle="${msg}" /></p>
									<span><fmt:message key="blog.label.save" bundle="${msg}" /></span>
									<p class="definition"></p>
									<a class="btn-read-now" href="<fmt:message key="blog.savie.post3.link" bundle="${msg}" />" target="_blank"><fmt:message key="button.read.more.article" bundle="${msg}" /></a>
								</div>
							</div>
							<div class="blogs last">
								<img src="<%=request.getContextPath()%>/resources/images/savie-regular/blog-4.jpg" class="img-responsive">
								<div class="orange-overlay text-center">
									<p class="title"><fmt:message key="blog.savie.post4.title" bundle="${msg}" /></p>
									<span><fmt:message key="blog.label.save" bundle="${msg}" /></span>
									<p class="definition"></p>
									<a class="btn-read-now" href="<fmt:message key="blog.savie.post4.link" bundle="${msg}" />" target="_blank"><fmt:message key="button.read.more.article" bundle="${msg}" /></a>
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

				$('#btn-blog-link').click(function(){
						window.location.href='<fmt:message key="link.blog" bundle="${msg}" />';
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


<!--Modal in Forbid Landing of RP-->
<div class="modal fade" role="dialog" aria-labelledby="forbid-landing" id="forbid-landing" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog teaserSurvey forbid-landing" role="document">
		<div class="modal-content teaserSurvey">
			<div class="modal-header teaserSurvey"></div>
			<div class="modal-body teaserSurvey forbid-landing">
				<img src="<%=request.getContextPath()%>/<fmt:message key="forbid.landing.modal.image.mobile" bundle="${msg}" />" class="img-responsive hidden-md hidden-lg">
				<img src="<%=request.getContextPath()%>/<fmt:message key="forbid.landing.modal.image" bundle="${msg}" />" class="img-responsive hidden-xs hidden-sm">
				<button type="button" class="btn btn-orange" id="forbid-landing-button"><fmt:message key="forbid.landing.modal.button" bundle="${msg}" /></button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

	<script src="<%=request.getContextPath()%>/resources/js/custom.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/savie/jquery.animateSprite.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/savie/jquery-ui.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/savie/jquery.ui.touch-punch.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/savie/jquery.loadImages.1.1.0.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/savie/index.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/savie/savie-discount.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/savie/savie-ocean-park.js"></script>

<!-- video Modal -->
<!--div id="vModal" class="vModal modal fade">
	<div class="modal-dialog">
		<a href="#close-video" class="close-btn" data-dismiss="modal" aria-hidden="true">
				<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Layer_1" x="0px" y="0px" width="44px" height="44px" viewBox="-1 3 44 44" enable-background="new -1 3 44 44" xml:space="preserve">
					<g>
						<line fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" x1="11" y1="15" x2="31" y2="35"></line>
						<line fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" x1="31" y1="15" x2="11" y2="35"></line>
					</g>
				</svg>
		</a>
		<div class="embed-container">
			<iframe id="ifwdVideo" src="<fmt:message key="savie.online.home.youtube" bundle="${msg}" />" frameborder="0" allowfullscreen=""></iframe>
		</div>
	</div>
</div-->
<script>
$(document).ready(function(){
	//var url = $("#ifwdVideo").attr('src');
	////stop playing youtube because autoplay just start when press play button
	//$("#ifwdVideo").attr('src', '');
	//$("#vModal").on('hide.bs.modal', function(){
	//	$("#ifwdVideo").attr('src', '');
	//});
	//$("#vModal").on('show.bs.modal', function(){
	//	$("#ifwdVideo").attr('src', url);
	//});
});
</script>
