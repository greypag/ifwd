<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="enhance" uri="http://pukkaone.github.com/jsp" %>
<c:set var="context" value="<%=request.getContextPath()%>"/>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<c:set var="langLink" value="${language == 'tc' ? 'zh-HK' : 'en-US'}" />
<c:set var="captchaLang" value="${language == 'tc' ? 'zh-TW' : 'en'}" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var language = "${language}";
var affiliate = "${affiliate}";
var home_url = "<%=request.getContextPath()%>";
</script>
<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper fwd-savie-eg-wrapper">
			<div class="teaser-container">
			<!-- Access Code Cover Div -->
			<!--<div class="hunger-selling-container container-fluid" id="myAccessCode">
				<div class="hunger-selling-content">
					<div class="hunger-selling-header text-center">
						<button id="close-cover" type="button" class="close"><span aria-hidden="true">&times;</span></button>
						<h4 class="hunger-selling-title">Please enter the access code as shown in your email.</h4>
					</div>
					<div class="hunger-selling-body">
						<form>
							<input placeholder="Access code" type="text" name="accessCodeConfirm" id="accessCodeConfirm" />
							<span class="validation-msg hidden-error-msg">The code is invalid or has been used.</span>
							<button type="submit" id="hunger-btn" class="btn hunger-btn">Submit</button>
						</form>
					</div>
				</div>
			</div>-->

			<div class="text-center o2o-landing banner-widget hunger-selling container-fluid">
				<img class="mobile-banner" src="<%=request.getContextPath()%><fmt:message key="oceanpark.landing.hero.mobile" bundle="${msg}" />" />
				<img class="desktop-banner" src="<%=request.getContextPath()%><fmt:message key="oceanpark.landing.hero.desktop" bundle="${msg}" />" />
            <div class="fwd-container container-fluid breadcrumbs op-breadcrumbs-container hidden-xs hidden-sm">
                <ol class="breadcrumb breadcrumbs-product-details breadcrumbs-landing op-breadcrumbs">
						  <li><a href="#"><fmt:message key="breadcrumb.home" bundle="${msg}" /></a></li>
                    <li class="divider"><!-- <i class="fa fa-chevron-right"></i> -->></li>
						  <li><a href="#"><fmt:message key="breadcrumb.savie.category" bundle="${msg}" /></a></li>
                    <li class="divider">></li>
                    <li><a href="#" class="active"><fmt:message key="breadcrumb.savie.product" bundle="${msg}" /></a></li>
					 </ol>
				</div>

				<div class="hunger-text-section">
				   <img class="op-logo hidden-md hidden-lg" src="<%=request.getContextPath()%><fmt:message key="oceanpark.landing.logo" bundle="${msg}" />" />
					<p class="hunger-selling-text text-1"><fmt:message key="jumbo.savie.oceanpark" bundle="${msg}" /></p>
				</div>
			</div>

			<div class="fwd-full-container container-fluid o2o-landing teaser op-div">
				<div class="fwd-container-limit">
					<div class="teaser-banner-text">
						<p class="additional top hidden-md hidden-lg"><fmt:message key="jumbo.savie.oceanpark.copy1.mobile" bundle="${msg}" /></p>
						<p class="additional top desktop hidden-xs hidden-sm"><fmt:message key="jumbo.savie.oceanpark.copy1" bundle="${msg}" /></p>
						<p class="bottom-text"><fmt:message key="jumbo.savie.oceanpark.copy2" bundle="${msg}" /></p>
                  <form action="${pageContext.request.contextPath}/${language}/savings-insurance/${nextPageFlow}" method="post">
                      <input type="hidden" name="accessCodeConfirm" value=""/>
                      <div class="get-started-holder op-align">
                          <button id="op-buy-now-O2O-mobile" class="get-started"><fmt:message key="cta.start" bundle="${msg}" /></button>
                      	  <img class="op-logo-desktop hidden-xs hidden-sm" src="<%=request.getContextPath()%><fmt:message key="oceanpark.landing.logo" bundle="${msg}" />" />
                      </div>
                      <p class="bottom-text lower hidden-md hidden-lg" style="margin-top: 20px">
	                  	<fmt:message key="disclaimer.jumbo.savie.oceanpark.copy1.part1" bundle="${msg}" /> <a href="<fmt:message key="link.provisions.oceanpark" bundle="${msg}" />" target="_blank"> <fmt:message key="disclaimer.jumbo.savie.oceanpark.copy1.part2" bundle="${msg}" /></a> <fmt:message key="disclaimer.jumbo.savie.oceanpark.copy1.part3" bundle="${msg}" />
	                  	<fmt:message key="disclaimer.jumbo.savie.oceanpark.copy2.part1" bundle="${msg}" /> <a href="<%=request.getContextPath()%>/<fmt:message key="link.tnc.oceanpark" bundle="${msg}" />" target="_blank"> <fmt:message key="disclaimer.jumbo.savie.oceanpark.copy2.part2" bundle="${msg}" /></a> <fmt:message key="disclaimer.jumbo.savie.oceanpark.copy2.part3" bundle="${msg}" />
	                  </p>
                  </form>
                  <p class="bottom-text lower hidden-sm hidden-xs">
                  	<fmt:message key="disclaimer.jumbo.savie.oceanpark.copy1.part1" bundle="${msg}" /> <a href="<fmt:message key="link.provisions.oceanpark" bundle="${msg}" />" target="_blank"> <fmt:message key="disclaimer.jumbo.savie.oceanpark.copy1.part2" bundle="${msg}" /></a> <fmt:message key="disclaimer.jumbo.savie.oceanpark.copy1.part3" bundle="${msg}" />
                  	<fmt:message key="disclaimer.jumbo.savie.oceanpark.copy2.part1" bundle="${msg}" /> <a href="<%=request.getContextPath()%>/<fmt:message key="link.tnc.oceanpark" bundle="${msg}" />" target="_blank"> <fmt:message key="disclaimer.jumbo.savie.oceanpark.copy2.part2" bundle="${msg}" /></a> <fmt:message key="disclaimer.jumbo.savie.oceanpark.copy2.part3" bundle="${msg}" />
                  </p>
					</div>
				</div>
			</div>

			<div class="fwd-full-container container-fluid o2o-landing teaser">
				<div class="fwd-container-limit">
					<div class="row">
						<div class="col-xs-12 col-md-6">
							<p class="additional top enjoy-guaranteed"><fmt:message key="custom.savie.credit.rate.title" bundle="${msg}" /></p>
						</div>
						<div class="col-xs-12 col-md-6">
							<ul class="crediting-rate-list clearfix">
								<li><span class="percent"><fmt:message key="custom.savie.credit.rate.rate1" bundle="${msg}" /></span><span class="year"><fmt:message key="custom.savie.credit.rate.year1" bundle="${msg}" /></span></li>
								<li class="middle"><div class="white"></div><span class="percent"><fmt:message key="custom.savie.credit.rate.rate2" bundle="${msg}" /></span><span class="year"><fmt:message key="custom.savie.credit.rate.year2" bundle="${msg}" /></span><div class="white right"></div></li>
								<li><span class="percent gold"><fmt:message key="custom.savie.credit.rate.rate3" bundle="${msg}" /></span><span class="year gold"><fmt:message key="custom.savie.credit.rate.year3" bundle="${msg}" /></li>
							</ul>
						</div>
						<div class="col-xs-12">
							<p class="disclaimer-center">
								<fmt:message key="disclaimer.savie.oceanpark.credit.rate.copy1" bundle="${msg}" />
								<br>
								<fmt:message key="disclaimer.savie.oceanpark.credit.rate.copy2" bundle="${msg}" />
							</p>
						</div >
						<div class="download-pdf hidden-xs hidden-sm col-md-12">
							<ul class="crediting-rate-list pdf">
								<li class="middle"><a class="year" href="<%=request.getContextPath()%>/<fmt:message key="link.brochure.savie" bundle="${msg}" />" target="_blank"><fmt:message key="general.product.brochure" bundle="${msg}" /></a></li>
								<li><a class="year" href="<%=request.getContextPath()%>/<fmt:message key="link.provisions.savie" bundle="${msg}" />" target="_blank"><fmt:message key="general.product.provisions" bundle="${msg}" /></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>

	        <div class="teaser-three-column O2O-landing">
					<div id="landing-three-column" class="fwd-container container-fluid three-column-widget O2O-landing">
						<div class="row row-top text-center">
							<div class="col-xs-12 col-md-4 fwd-col">
								<div class="col-content col-content-teaser">
									<div class="clearfix">
										<div class="pull-left mobile-image hidden-md hidden-lg">
											<img src="<%=request.getContextPath()%><fmt:message key="img.big.savings-mobile" bundle="${msg}" />" width="150" class="img-responsive">
										</div>
										<div class="right">
											<h2><fmt:message key="usp.savie1.title.part1" bundle="${msg}" /></h2>
											<h3><fmt:message key="usp.savie1.title.part2" bundle="${msg}" /></h3>
											<img src="<%=request.getContextPath()%><fmt:message key="img.big.savings" bundle="${msg}" />" height="170" class="hidden-xs hidden-sm">
											<p><fmt:message key="usp.savie1.copy" bundle="${msg}" /></p>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-12 col-md-4 fwd-col">
								<div class="col-content col-content-teaser">
									<div class="clearfix">
										<div class="pull-left mobile-image hidden-md hidden-lg">
											<img src="<%=request.getContextPath()%><fmt:message key="img.no.commitment-mobile" bundle="${msg}" />" width="150" class="img-responsive">
										</div>
										<div class="right">
											<h2><fmt:message key="usp.savie2.title.part1" bundle="${msg}" /></h2>
											<h3><fmt:message key="usp.savie2.title.part2" bundle="${msg}" /></h3>
											<img src="<%=request.getContextPath()%><fmt:message key="img.no.commitment" bundle="${msg}" />" height="170"  class="hidden-xs hidden-sm">
											<p><fmt:message key="usp.savie2.copy" bundle="${msg}" /></p>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-12 col-md-4 fwd-col">
								<div class="col-content col-content-teaser">
									<div class="clearfix">
										<div class="pull-left mobile-image hidden-md hidden-lg">
											<img src="<%=request.getContextPath()%><fmt:message key="img.free.additional-mobile" bundle="${msg}" />" width="150" class="img-responsive">
										</div>
										<div class="right">
											<h2><fmt:message key="usp.savie3.title.part1" bundle="${msg}" /></h2>
											<h3><fmt:message key="usp.savie3.title.part2" bundle="${msg}" /></h3>
											<img src="<%=request.getContextPath()%><fmt:message key="img.free.additional" bundle="${msg}" />" height="170" class="hidden-xs hidden-sm">
											<p><fmt:message key="usp.savie3.copy" bundle="${msg}" /></p>
											<p class="info-asterisk"><fmt:message key="usp.savie3.disclaimer" bundle="${msg}" /><p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="fwd-container container-fluid other-benefits-teaser O2O-landing">
						<!--<div id="other-benefits" class="row">
							<div class="clearfix">
								<div class="pull-left mobile-image hidden-md hidden-lg">
									<img src="<%=request.getContextPath()%><fmt:message key="img.other.benefits-mobile" bundle="${msg}" />">
								</div>
								<div class="right">
									<div class="col-xs-12 col-md-8 pull-right">
										<h2 class="text-center"><fmt:message key="feature.savie.title" bundle="${msg}" /></h2>
									</div>
									<div class="col-xs-12 col-md-4 fwd-col text-center left-clear">
										<img src="<%=request.getContextPath()%><fmt:message key="img.other.benefits" bundle="${msg}" />" class="hidden-xs hidden-sm">
									</div>
									<div class="col-xs-12 col-md-8 fwd-col">
										<ul>
											<li><p><fmt:message key="feature.savie.copy1" bundle="${msg}" /></p></li>
											<a class="read-more hidden-md hidden-lg" id="read-more-other-benefits"><fmt:message key="savie.landing.hidden.readmore" bundle="${msg}" /></a>
											<li class="hidden-xs hidden-sm other-benefits-list-mobile" id="other-benefits-list-0"><p><fmt:message key="feature.savie.copy2" bundle="${msg}" /></p></li>
											<li class="hidden-xs hidden-sm other-benefits-list-mobile" id="other-benefits-list-1"><p><fmt:message key="feature.savie.copy3" bundle="${msg}" /></p></li>
											<li class="hidden-xs hidden-sm other-benefits-list-mobile" id="other-benefits-list-2"><p><fmt:message key="feature.savie.copy4" bundle="${msg}" /></p></li>
											<li class="hidden-xs hidden-sm other-benefits-list-mobile" id="other-benefits-list-3"><p><fmt:message key="feature.savie.copy5" bundle="${msg}" /></p></li>
										</ul>
									</div>
								</div>
							</div>
						</div>-->

						<div class="btn-download-section hidden-md hidden-lg" style="text-align:left;">
							<a href="<%=request.getContextPath()%>/<fmt:message key="link.brochure.savie" bundle="${msg}" />" title="Download product brochure" class="fwd-btn-download-item" target="_blank">
								<img src="<%=request.getContextPath()%>/resources/images/elite-terms/download-icon.png" alt="download-icon.png" />
								<fmt:message key="general.product.brochure" bundle="${msg}" />
							</a>
							<a href="<%=request.getContextPath()%>/<fmt:message key="link.provisions.savie" bundle="${msg}" />" title="Download policy provisions" class="fwd-btn-download-item" target="_blank">
								<img src="<%=request.getContextPath()%>/resources/images/elite-terms/download-icon.png" alt="download-icon.png" />
								<fmt:message key="general.product.provisions" bundle="${msg}" />
							</a>
						</div>

						<!--  6 benefit coverage -->
						<div style="background-color:#FFFFFF;text-align:center;margin-top: 20px;padding-bottom: 20px;">
						    <div class="container pad-none">
						        <h2><fmt:message key="saviee.landing.coverage.headline" bundle="${msg}" /></h2>
						        <h4><strong></strong></h4>
						        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 eg-benefits-col">
						            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 annualTravel_policy_item">
						                <img class="eg-img" src="<%=request.getContextPath()%>/resources/images/annual_travel/eg-icon1.png">
						                <h5 class="bold eg-width-33"><fmt:message key="saviee.landing.coverage1.title" bundle="${msg}" /></h5>
						                <div class="hidden-content">
						                    <div class="col-xs-12 hidden-md hidden-lg"><img class="eg-img" src="<%=request.getContextPath()%>/resources/images/annual_travel/eg-icon1.png"></div>
						                    <div class="col-xs-12 hidden-content-title"><fmt:message key="saviee.landing.coverage1.title" bundle="${msg}" /></div>
						                    <div class="col-xs-12 hidden-content-p"><p><fmt:message key="saviee.landing.coverage1.copy" bundle="${msg}" /></p></div>
						                    <div class="col-xs-12 hidden-content-a"></div>
						                    <div class="clearfix"></div>
						                </div>
						            </div>
						            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 annualTravel_policy_item">
						                <img class="eg-img" src="<%=request.getContextPath()%>/resources/images/annual_travel/eg-icon2.png">
						                <h5 class="bold eg-width-33"><fmt:message key="saviee.landing.coverage2.title" bundle="${msg}" /></h5>
						                <div class="hidden-content">
						                    <div class="col-xs-12 hidden-md hidden-lg"><img class="eg-img" src="<%=request.getContextPath()%>/resources/images/annual_travel/eg-icon2.png"></div>
						                    <div class="col-xs-12 hidden-content-title"><fmt:message key="saviee.landing.coverage2.title" bundle="${msg}" /></div>
						                    <div class="col-xs-12 hidden-content-p"><p><fmt:message key="saviee.landing.coverage2.copy" bundle="${msg}" /></p></div>
						                    <div class="col-xs-12 hidden-content-a"></div>
						                    <div class="clearfix"></div>
						                </div>
						            </div>
						            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 annualTravel_policy_item">
						                <img class="eg-img" src="<%=request.getContextPath()%>/resources/images/annual_travel/eg-icon3.png">
						                <h5 class="bold"><fmt:message key="saviee.landing.coverage3.title" bundle="${msg}" /></h5>
						                <div class="hidden-content">
						                    <div class="col-xs-12 hidden-md hidden-lg"><img class="eg-img" src="<%=request.getContextPath()%>/resources/images/annual_travel/eg-icon3.png"></div>
						                    <div class="col-xs-12 hidden-content-title"><fmt:message key="saviee.landing.coverage3.title" bundle="${msg}" /></div>
						                    <div class="col-xs-12 hidden-content-p"><p><fmt:message key="saviee.landing.coverage3.copy" bundle="${msg}" /></p></div>
						                    <div class="col-xs-12 hidden-content-a"></div>
						                    <div class="clearfix"></div>
						                </div>
						            </div>
						            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 annualTravel_policy_item">
						                <img class="eg-img" src="<%=request.getContextPath()%>/resources/images/annual_travel/eg-icon4.png">
						                <h5 class="bold eg-width-22"><fmt:message key="saviee.landing.coverage4.title" bundle="${msg}" /></h5>
						                <div class="hidden-content">
						                    <div class="col-xs-12 hidden-md hidden-lg"><img class="eg-img" src="<%=request.getContextPath()%>/resources/images/annual_travel/eg-icon4.png"></div>
						                    <div class="col-xs-12 hidden-content-title"><fmt:message key="saviee.landing.coverage4.title" bundle="${msg}" /></div>
						                    <div class="col-xs-12 hidden-content-p"><p><fmt:message key="saviee.landing.coverage4.copy" bundle="${msg}" /></p></div>
						                    <div class="col-xs-12 hidden-content-a"></div>
						                    <div class="clearfix"></div>
						                </div>
						            </div>
						            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 annualTravel_policy_item">
						                <img class="eg-img" src="<%=request.getContextPath()%>/resources/images/annual_travel/eg-icon5.png">
						                <h5 class="bold eg-width-15"><fmt:message key="saviee.landing.coverage5.title" bundle="${msg}" /></h5>
						                <div class="hidden-content">
						                    <div class="col-xs-12 hidden-md hidden-lg"><img class="eg-img" src="<%=request.getContextPath()%>/resources/images/annual_travel/eg-icon5.png"></div>
						                    <div class="col-xs-12 hidden-content-title"><fmt:message key="saviee.landing.coverage5.title" bundle="${msg}" /></div>
						                    <div class="col-xs-12 hidden-content-p"><p><fmt:message key="saviee.landing.coverage5.copy" bundle="${msg}" /></p></div>
						                    <div class="col-xs-12 hidden-content-a"></div>
						                    <div class="clearfix"></div>
						                </div>
						            </div>
						            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 annualTravel_policy_item">
						                <img class="eg-img" src="<%=request.getContextPath()%>/resources/images/annual_travel/eg-icon6.png">
						                <h5 class="bold eg-width-22"><fmt:message key="saviee.landing.coverage6.title" bundle="${msg}" /></h5>
						                <div class="hidden-content">
						                    <div class="col-xs-12 hidden-md hidden-lg"><img class="eg-img" src="<%=request.getContextPath()%>/resources/images/annual_travel/eg-icon6.png"></div>
						                    <div class="col-xs-12 hidden-content-title"><fmt:message key="saviee.landing.coverage6.title" bundle="${msg}" /></div>
						                    <div class="col-xs-12 hidden-content-p"><p><fmt:message key="saviee.landing.coverage6.copy" bundle="${msg}" /></p></div>
						                    <div class="col-xs-12 hidden-content-a"><a href="<fmt:message key="evergreen.travel.learn.more.link" bundle="${msg}" />" target="_blank"><fmt:message key="evergreen.travel.learn.more" bundle="${msg}" /></a></div>
						                    <div class="clearfix"></div>
						                </div>
						            </div>
						            <div class="clearfix"></div>
						        </div>
						    </div>
						</div>
						<!-- Disclaimer and Policy Provisions -->
						<div class="disclaimer-policy-teaser teaser-policy">
							<!-- <p class="h4-6"><fmt:message key="saviee.landing.disclaimer.1" bundle="${msg}" /> <a href="<%=request.getContextPath()%>/<fmt:message key="saviee.landing.disclaimer.2.url" bundle="${msg}" />" target="_blank"> <u><fmt:message key="saviee.landing.disclaimer.2" bundle="${msg}" /></u></a> <fmt:message key="saviee.landing.disclaimer.3" bundle="${msg}" /> <a href="<%=request.getContextPath()%>/<fmt:message key="saviee.landing.disclaimer.4.url" bundle="${msg}" />" target="_blank"> <u><fmt:message key="saviee.landing.disclaimer.4" bundle="${msg}" /></u></a> <fmt:message key="saviee.landing.disclaimer.5" bundle="${msg}" /></p>-->
						</div>
					</div>

	            <div class="hidden-xs hidden-sm fwd-full-container container-fluid o2o-landing saving-plans">
					<div id="savings-carousel" class="carousel slide" data-ride="carousel">
						<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox">
							<div class="item active">
								<!--<div class="savings-banner-text">
									<p><fmt:message key="savie.o2o.landing.Guaranteed.crediting" bundle="${msg}" /></p>
								</div>-->
								<div class="savings-banner">
									<img class="mobile" src="<%=request.getContextPath()%><fmt:message key="savie.o2o.landing.infographic.slides.path" bundle="${msg}" /><fmt:message key="savie.o2o.landing.infographic.slide1.image.mobile" bundle="${msg}" />" />
									<img class="desktop" src="<%=request.getContextPath()%><fmt:message key="savie.o2o.landing.infographic.slides.path" bundle="${msg}" /><fmt:message key="savie.o2o.landing.infographic.slide1.image.desktop" bundle="${msg}" />" />
								</div>
							</div>
							<div class="item">
								<div class="savings-banner">
									<img class="mobile" src="<%=request.getContextPath()%><fmt:message key="savie.o2o.landing.infographic.slides.path" bundle="${msg}" /><fmt:message key="savie.o2o.landing.infographic.slide2.image.mobile" bundle="${msg}" />" />
									<img class="desktop" src="<%=request.getContextPath()%><fmt:message key="savie.o2o.landing.infographic.slides.path" bundle="${msg}" /><fmt:message key="savie.o2o.landing.infographic.slide2.image.desktop" bundle="${msg}" />" />
								</div>
							</div>
							<div class="item">
								<div class="savings-banner">
									<img class="mobile" src="<%=request.getContextPath()%><fmt:message key="savie.o2o.landing.infographic.slides.path" bundle="${msg}" /><fmt:message key="savie.o2o.landing.infographic.slide3.image.mobile" bundle="${msg}" />" />
									<img class="desktop" src="<%=request.getContextPath()%><fmt:message key="savie.o2o.landing.infographic.slides.path" bundle="${msg}" /><fmt:message key="savie.o2o.landing.infographic.slide3.image.desktop" bundle="${msg}" />" />
								</div>
							</div>
							<div class="item">
								<div class="savings-banner">
									<img class="mobile" src="<%=request.getContextPath()%><fmt:message key="savie.o2o.landing.infographic.slides.path" bundle="${msg}" /><fmt:message key="savie.o2o.landing.infographic.slide4.image.mobile" bundle="${msg}" />" />
									<img class="desktop" src="<%=request.getContextPath()%><fmt:message key="savie.o2o.landing.infographic.slides.path" bundle="${msg}" /><fmt:message key="savie.o2o.landing.infographic.slide4.image.desktop" bundle="${msg}" />" />
								</div>
							</div>
							<div class="item">
								<div class="savings-banner">
									<img class="mobile" src="<%=request.getContextPath()%><fmt:message key="savie.o2o.landing.infographic.slides.path" bundle="${msg}" /><fmt:message key="savie.o2o.landing.infographic.slide5.image.mobile" bundle="${msg}" />" />
									<img class="desktop" src="<%=request.getContextPath()%><fmt:message key="savie.o2o.landing.infographic.slides.path" bundle="${msg}" /><fmt:message key="savie.o2o.landing.infographic.slide5.image.desktop" bundle="${msg}" />" />
								</div>
							</div>
						</div>
					</div>

					<div class="savings-nav">
						<div class="prev">
							<a class="pull-right disabled" href="#savings-carousel" role="button" data-slide="prev">
							<span class="icon icon-chevron-thin-left">
								<span class="sr-only"><fmt:message key="savie.o2o.landing.Previous" bundle="${msg}" /></span>
							</span>
							</a>
						</div>

						<div class="next">
							<a class="pull-left active" href="#savings-carousel" role="button" data-slide="next">
							<span class="icon icon-chevron-thin-right">
								<span class="sr-only"><fmt:message key="savie.o2o.landing.Next" bundle="${msg}" /></span>
							</span>
							</a>
						</div>
					</div>

					<!--<div class="savings-menu row">
						<div class="col-xs-6 download">
							<a href="#">
								<div class="action-icon">
									<img src="assets/images/download-brochure-icon.png">
								</div>

								<div class="action-text">
									<h2>Download brochure</h2>
									<p>View product brochure for more details.</p>
								</div>
							</a>
						</div>

						<div class="col-xs-6 sign-up">
							<a href="#">
								<div class="action-icon">
									<img src="assets/images/signup-now-icon.png">
								</div>

								<div class="action-text">
									<h2>Sign up now</h2>
									<p>To get our limited offer</p>
								</div>
							</a>
						</div>
					</div>-->

					<!--<div class="fwd-action o2o-landing">
						<div class="fwd-action-container fwd-action-two">
							<button class="action-one talk-to-experts">
								<img src="assets/images/download-brochure-icon.png" class="img-responsive" />
								<div class="action-text">
									<h2>Download brochure</h2>
									<p>View product brochure for more details.</p>
								</div>
							</button>
							<button class="action-two download-brochure">
								<img src="assets/images/signup-now-icon.png" class="img-responsive" />
								<div class="action-text">
									<h2>Sign up now</h2>
									<p>To get our limited offer</p>
								</div>
							</button>
						</div>
					</div>-->

				</div>

	        </div>

			<!-- OUR BLOG -->
			<div id="landing-page-blog" class="fwd-container blog-widget container-fluid text-center">
				<div class="read-blog-desktop three-column-widget O2O-landing">
					<h2 class="hidden-xs hidden-sm"><fmt:message key="blog.headline" bundle="${msg}" /></h2>
					<h2 class="hidden-md hidden-lg"><fmt:message key="blog.headline.mobile" bundle="${msg}" /></h2>
					<div class="row text-left">
						<div class="col-xs-12 col-md-4 fwd-col">
							<a href="<fmt:message key="link.blog.savie.post1" bundle="${msg}" />" target="_blank">
								<img src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/power-1-percent-savings-interest.jpg"/>
							</a>
							<h3><a href="<fmt:message key="link.blog.savie.post1" bundle="${msg}" />" target="_blank"><fmt:message key="blog.savie.post1" bundle="${msg}" /><span class="glyphicon glyphicon-play" aria-hidden="true"></span></a></h3>
						</div>
						<div class="col-md-4 fwd-col hidden-xs hidden-sm">
							<a href="<fmt:message key="link.blog.savie.post2" bundle="${msg}" />" target="_blank">
								<img src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/saving-is-easier-than-you-think.jpg"/>
							</a>
							<h3><a href="<fmt:message key="link.blog.savie.post2" bundle="${msg}" />" target="_blank"><fmt:message key="blog.savie.post2" bundle="${msg}" /><span class="glyphicon glyphicon-play" aria-hidden="true"></span></a></h3>
						</div>
						<div class="col-md-4 fwd-col hidden-xs hidden-sm">
							<a href="<fmt:message key="link.blog.savie.post3" bundle="${msg}" />" target="_blank">
								<img src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/3-saving-tips-smart-parents.jpg"/>
							</a>
							<h3><a href="<fmt:message key="link.blog.savie.post3" bundle="${msg}" />" target="_blank"><fmt:message key="blog.savie.post3" bundle="${msg}" /><span class="glyphicon glyphicon-play" aria-hidden="true"></span></a></h3>
						</div>
					</div>
					<p class="text-left hidden-xs hidden-sm"><fmt:message key="disclaimer.blog" bundle="${msg}" /></p>
				</div>
			</div>


			<a class="btn btn-full hidden-md hidden-lg" href="<fmt:message key="fwd.blog.save.link" bundle="${msg}" />" target="_blank"><fmt:message key="savie.landing.hidden.readmore.mobile" bundle="${msg}" /></a>
			<div class="mobile-disclaimer">
				<p class="text-left hidden-md hidden-lg"><fmt:message key="savie.o2o.landing.The.information" bundle="${msg}" /></p>
			</div>

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
								<form id="o2o-landing-form" action="<%=request.getContextPath()%>/${language}/savings-insurance/plan-details" method="post">
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

		<script src="<%=request.getContextPath()%>/resources/js/vendor/jquery.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/vendor/bootstrap-datepicker.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/vendor/jasny-bootstrap.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/evergreen/bootstrap-select.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/evergreen/jquery.touchSwipe.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/vendor/bootstrapValidator.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/custom.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/fwd-validation.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/vendor/placeholders.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/evergreen/date.format.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/vendor/jquery.timepicker.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/evergreen/fwd-teaser.js"></script>

		<script type="text/javascript">
			var language = "en";

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
			if(isMobile){
					$(".annualTravel_policy_item").click(function(){
						itemTop = $(this).offset();
						var html=$(this).children('.hidden-content').children().clone();
						$("#modal_policy_container").html(html);
						$("#policyCoveragePopup").modal("show");
			            $("#policyCoveragePopup").on('show.bs.modal', function () {
			                $('body').css("position", "inital");
			                //$('body').css("position", "fixed");
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
