<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<!DOCTYPE html>
<html lang="en">
	<head>
      <script type="text/javascript" src="assets/js/pdfobject.js"></script>
		<meta name="apple-mobile-web-app-capable" content="yes" />
	</head>
	<body>
		<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps confirmation-full-online" id="upload-later-confirmation-page">
			<!--BREADCRUMBS-->
			<div class="fwd-container container-fluid breadcrumbs">
	            <div class="breadcrumb-container">
	               <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
						<li><a href="#"><fmt:message key="breadcrumb.home" bundle="${msg}" /></a></li>
						<li class="divider"><i class="fa fa-play"></i></li>
						<li><a href="#"><fmt:message key="breadcrumb.savie.category" bundle="${msg}" /> </a></li>
						<li class="divider"><i class="fa fa-play"></i></li>
						<li><a href="#"><fmt:message key="breadcrumb.savie.insurance.plan" bundle="${msg}" /> </a></li>
						<li class="divider last"><i class="fa fa-play"></i></i></li>
						<li class="active-bc" id="et-active-bc-menu"><fmt:message key="breadcrumb.savie.selectplan" bundle="${msg}" /></li>
	               </ol>
	            </div>
	        </div>
	         <!-- STEPS -->
	        <div class="container-fluid fwd-full-container browse-holder">
	            <div class="application-page-header et-header-browse">
	               <div class="browse-container">
	                  <div class="row reset-margin hidden-xs hidden-sm">
	                     <ul class="common-steps-list six-steps nav nav-pills">
							<li class="step-number" id="first-step"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i><fmt:message key="stepindicator.savie.selectplan" bundle="${msg}" /></button></li>
							<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
							<li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i><fmt:message key="stepindicator.savie.application" bundle="${msg}" /></button></li>
							<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
							<li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i><fmt:message key="stepindicator.savie.summary.declaration" bundle="${msg}" /></button></li>
							<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
							<li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i><fmt:message key="stepindicator.savie.sign" bundle="${msg}" /></button></li>
							<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
							<li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i><fmt:message key="stepindicator.savie.upload.document" bundle="${msg}" /></button></li>
							<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
							<li class="step-number"><button type="button" class="et-header-info-btn active"><span class="status">6</span><fmt:message key="stepindicator.savie.confirmation" bundle="${msg}" /></button></li>
						 </ul>
	                 </div>
	               </div>  
	               <div class="et-mobile-header-info hidden-md hidden-lg">
	                  <div class="clearfix">
	                     <div class="et-back-arrow">
	                        <a href="#" class="back-arrow-link">
	                           <span class="icon-arrow-left2 arrow-left"></span>
	                        </a>
	                     </div>
	                     <div class="et-header-tex">
	                        <h3 id=""><fmt:message key="stepindicator.savie.confirmation" bundle="${msg}" /></h3>
	                     </div>
	                     <p id="step-of">6 of 6</p>
	                  </div>
	               </div>
	            </div>
	        </div>
	        <div class="container-fluid fwd-full-container mobile-step-indicator visible-xs visible-sm">
				<div class="step-indicator-container clearfix">
					<ul class="common-step-indicator six-steps nav nav-pills">
						 <li id="first-step"><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
						 <li><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
						 <li><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
						 <li><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
						 <li><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
						 <li id="last-step"><a href="#" class="active"><span class="step-no">6</span></a></li>
					</ul>
					<div class="step-line"></div>
				</div>
			</div>
	        <div class="container-fluid fwd-full-container headerStick">
	        	<div class="fwd-container-limit clearfix sidebar">
	        		<div id="upload-later-confirmation-content">
	        			<div class="row">
	        				<div class="col-md-8" id="thankyou-message">
	        					<h3 class="heading-title"><fmt:message key="label.confirmation.successpurchase.title" bundle="${msg}" /></h3>
	        					<h3 class="visible-xs visible-sm" id="policy-no-mb"><fmt:message key="label.policyno" bundle="${msg}" /> <span class="policy-no">${lifePolicy.policyNo }</span></h3>
	        					<p id="success-purchase"><fmt:message key="information.successful.purchase.copy4" bundle="${msg}" /></p>
	        					<!--<p><fmt:message key="info.successful.purchase.copy2" bundle="${msg}" /></p> -->
	        					<div class="border-gray visible-xs visible-sm"></div>
	        				</div>
	        				<div class="col-md-4 visible-md visible-lg" id="policy-no-holder">
	        					<h2><fmt:message key="label.policyno" bundle="${msg}" /></h2>
	        					<h2 id="policy-no">${lifePolicy.policyNo }</h2>
	        				</div>
	        				<div class="col-md-12 border-gray visible-md visible-lg" id="border-desktop"></div>
	        			</div>
	        			<div class="row" id="partner-care-holder">
	        				<div class="col-md-6" id="care-holder">
	        					<div class="row">
	        						<h3 class="heading-title"><fmt:message key="label.you.may.interested.in" bundle="${msg}" /></h3>
	        						<div class="col-xs-6 col-md-12 care" id="care-1">
	        							<img src="<%=request.getContextPath()%>/resources/images/savie-2016/travel-care.jpg" class="img-responsive visible-md visible-lg" />
	        							<img src="<%=request.getContextPath()%>/resources/images/savie-2016/travel-care-mb.jpg" class="img-responsive visible-xs visible-sm care-img-mb" />
	        							<h3 class="care-title"><fmt:message key="product.suggestion.travel.care.title" bundle="${msg}" /></h3>
	        							<p><fmt:message key="product.suggestion.travel.care.copy" bundle="${msg}" /></p>
	        							<div class="clearfix"></div>
	        							<div class="get-qoute-holder  visible-md visible-lg">
	        								<a href="<fmt:message key="link.product.travel.care" bundle="${msg}" />"><button class="btn common-yellow-btn get-quote-btn"><fmt:message key="button.get.quote" bundle="${msg}" /></button></a>
	        							</div>
	        						</div>
	        						<div class="col-xs-6 col-md-12 care   " id="care-2">
	        							<img src="<%=request.getContextPath()%>/resources/images/savie-2016/homecare.jpg" class="img-responsive visible-md visible-lg" />
	        							<img src="<%=request.getContextPath()%>/resources/images/savie-2016/homecare-mb.jpg" class="img-responsive visible-xs visible-sm care-img-mb" />
	        							<h3 class="care-title"><fmt:message key="product.suggestion.home.title" bundle="${msg}" /></h3>
	        							<p><fmt:message key="product.suggestion.home.copy" bundle="${msg}" /></p>
	        							<div class="clearfix"></div>
	        							<div class="get-qoute-holder  visible-md visible-lg">
	        								<a href="<fmt:message key="link.product.easy.home" bundle="${msg}" />"><button class="btn common-yellow-btn get-quote-btn"><fmt:message key="button.get.quote" bundle="${msg}" /></button></a>
	        							</div>
	        						</div>
	        					</div>
	        					<div class="row visible-xs visible-sm" id="get-btns-holder">
	        						<div class="col-xs-6 col-md-12">
	        							<div class="get-qoute-holder">
	        								<a href="<fmt:message key="link.product.travel.care" bundle="${msg}" />"><button class="btn common-yellow-btn get-quote-btn"><fmt:message key="button.get.quote" bundle="${msg}" /></button></a>
	        							</div>
	        						</div>
	        						<div class="col-xs-6 col-md-12">
	        							<div class="get-qoute-holder">
	        								<a href="<fmt:message key="link.product.easy.home" bundle="${msg}" />"><button class="btn common-yellow-btn get-quote-btn"><fmt:message key="button.get.quote" bundle="${msg}" /></button></a>
	        							</div>
	        						</div>
	        					</div>
	        					<div class="border-gray visible-xs visible-sm"></div>
	        				</div>
	        				<div class="col-md-6 partners">
	        					<h3 class="heading-title"><fmt:message key="partner.savie.confirmation.title4" bundle="${msg}" /></h3>
	        					<div class="row partner">
	        						<div class="col-xs-4 logo-holder">
	        							<img src="<%=request.getContextPath()%>/resources/images/savie-2016/agoda-logo.png" class="img-responsive" /> 
	        						</div>
	        						<div class="col-xs-8">
	        							<p><fmt:message key="partner.offer.copy1" bundle="${msg}" /> <a href="<fmt:message key="link.partner.offer.copy1" bundle="${msg}" />"><fmt:message key="label.agoda.offer.copy" bundle="${msg}" /></a> <fmt:message key="label.agoda.offer.copy2" bundle="${msg}" /></p>
	        						</div>
	        					</div>
	        					<div class="row partner hidden">
	        						<div class="col-xs-4 logo-holder">
	        							<img src="<%=request.getContextPath()%>/resources/images/savie-2016/buddy-logo.png" class="img-responsive" /> 
	        						</div>
	        						<div class="col-xs-8">
	        							<p><fmt:message key="partner.offer.copy2.y5buddy" bundle="${msg}" /><a href="<fmt:message key="link.offer.link.y5buddy" bundle="${msg}" />"><fmt:message key="partner.offer.copy2.y5buddy1" bundle="${msg}" /></a></p>
	        						</div>
	        					</div>
	        					<div class="row partner hidden">
	        						<div class="col-xs-4 logo-holder">
	        							<img src="<%=request.getContextPath()%>/resources/images/savie-2016/boconcept-logo.png" class="img-responsive" /> 
	        						</div>
	        						<div class="col-xs-8">
	        							<p><fmt:message key="partner.offer.copy3" bundle="${msg}" /></p>
	        						</div>
	        					</div>
	        					<div class="row partner hidden">
	        						<div class="col-xs-4 logo-holder">
	        							<img src="<%=request.getContextPath()%>/resources/images/savie-2016/price-rite-logo.png" class="img-responsive" /> 
	        						</div>
	        						<div class="col-xs-8">
	        							<p><fmt:message key="partner.offer.copy4.pricerite1" bundle="${msg}" /><a href="<fmt:message key="link.partner.offer.copy.pricerite" bundle="${msg}" />"><fmt:message key="partner.offer.copy4.pricerite2" bundle="${msg}" /></a> <fmt:message key="link.offer.copy4.pricerite3" bundle="${msg}" /></p>
	        						</div>	
	        					</div>
	        					<div class="text-center">
	        						<a href="<fmt:message key="link.find.out.more" bundle="${msg}" />"><button class="btn common-yellow-btn" id="find-more-btn"><fmt:message key="button.find.out.more" bundle="${msg}" /></button></a>
	        					</div>
	        					<div class="border-gray visible-xs visible-sm"></div>	
	        				</div>
	        			</div>
	        			<div class="text-center">
    						<a href="<fmt:message key="link.find.out.more" bundle="${msg}" />"><button class="btn savie-common-btn" id="back-to-home-btn"><fmt:message key="button.back.to.home" bundle="${msg}" /></button>
    					</div>
	        		</div>
	        	</div>
	        </div>
		</div>
		<!-- JS INCLUDES -->
		<script type="text/javascript">
			window.onload = function (){
				var pdfFile = $('#pdf-object').attr('data');
				var success = new PDFObject({ url: pdfFile }).embed();
			};
        </script> 
	</body>
</html>	
