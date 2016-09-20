<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.*"%>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var language = "${language}";
</script>

<%!
	boolean isSaleActiveClass = false;
	boolean isEservicesActiveClass = false;
%>
<div class="fwd-savie-wrapper savie-online-container" id="appointment-confirmation-page-top">			
	<!-- HEADER -->
	<div class="fwd-container container-fluid breadcrumbs">
		<div class="breadcrumb-container">
            <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
               <li><a class="text-bold" href="#"><fmt:message key="breadcrumb.home" bundle="${msg}" /></a></li>
               <li class="divider"><i class="fa fa-play"></i></li>
               <li><a class="text-bold" href="#"><fmt:message key="breadcrumb.savie.category" bundle="${msg}" /></a></li>
               <li class="divider"><i class="fa fa-play"></i></li>
               <li><a class="text-bold" href="#"><fmt:message key="breadcrumb.savie.insurance.plan" bundle="${msg}" /></a></li>
               <li class="divider last"><i class="fa fa-play"></i></i></li>
               <li class="active-bc" id="et-active-bc-menu"><fmt:message key="breadcrumb.savie.confirmation" bundle="${msg}" /></li>
            </ol>
         </div>
    </div>
	
	<!-- STEPS -->
	<div class="container-fluid fwd-full-container browse-holder">
		<div class="application-page-header et-header-browse">
		   <div class="browse-container">
			  <div class="row reset-margin hidden-xs hidden-sm">
				 <ul class="common-steps-list three-steps nav nav-pills">
					<li class="step-number" id="first-step"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i><fmt:message key="stepindicator.savie.selectplan" bundle="${msg}" /></button></li>
					<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
					<li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i><fmt:message key="stepindicator.savie.application" bundle="${msg}" /></button></li>
					<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
					<li class="step-number"><button type="button" class="et-header-info-btn active"><span class="status">3</span><fmt:message key="stepindicator.savie.confirmation" bundle="${msg}" /></button></li>
				 </ul>
			 </div>
		   </div>  
		   <div class="et-mobile-header-info hidden-md hidden-lg">
			  <div class="clearfix">
				 <div class="pull-left">
					<div class="et-back-arrow">
					   <a href="#" class="back-arrow-link">
						  <span class="icon-arrow-left2 arrow-left"></span>
					   </a>
					</div>
					<div class="et-header-tex">
					   <h3 class="text-bold"><fmt:message key="stepindicator.savie.confirmation" bundle="${msg}" /></h3>
					</div>
				 </div>
				 <span id="step-of">3 out of 3</span>
			  </div>
		   </div>
		</div>
	</div>
    <div class="container-fluid fwd-full-container mobile-step-indicator visible-xs visible-sm">
		<div class="step-indicator-container clearfix">
			<ul class="common-step-indicator three-steps nav nav-pills">
				 <li id="first-step"><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
				 <li><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
				 <li id="last-step"><a href="#" class="active"><span class="step-no">3</span></a></li>
			</ul>
			<div class="step-line"></div>
		</div>
	</div>
	
	<div class="container-fluid fwd-full-container headerStick">
		<div class="fwd-container-limit clearfix sidebar">
			<div id="appointment-confirmation-page">
				<div class="row policy-number-panel">
					<div class="col-xs-12 cstm-md-col-1"><p class="panel-title"><fmt:message key="msg.confirmation.pay.later.savie.copy1" bundle="${msg}" /></p></div>
					<div class="col-xs-12 visible-xs visible-sm policy-number-wrapper">
						<span class="policy-number-label"><fmt:message key="label.referenceno" bundle="${msg}" /></span>
						<span class="policy-number">${applicationNumber }</span>
					</div>
					<div class="col-xs-12 cstm-md-col-2">
						<p><fmt:message key="msg.confirmation.pay.later.savie.copy2" bundle="${msg}" /></p>
						<!-- <p>Your application is being processed.</p>
						<p id="review-line">Please review the confirmation of your application as detailed here.</p>-->
					</div>
					<div class="col-md-3 cstm-md-col-3 hidden-xs hidden-sm">
						<p class="policy-number-label"><fmt:message key="label.referenceno" bundle="${msg}" /></p>
						<p class="policy-number">${applicationNumber }</p>
					</div>
				</div>
				<hr>
				<div class="row appointment-details-panel">
					<div class="col-xs-12"><p class="panel-title"><fmt:message key="label.appointmentdetails" bundle="${msg}" /></p></div>
					<div class="col-xs-12 cstm-md-col-1">
						<div>
							<p class="details-label"><fmt:message key="label.savie.confirmation.date" bundle="${msg}" /></p>
							<p>${preferredDate}</p>
						</div>
						<div>
							<p class="details-label"><fmt:message key="label.savie.confirmation.time" bundle="${msg}" /></p>
							<p>${preferredTime}</p>
						</div>
					</div>
					<div class="col-xs-12 cstm-md-col-2">
						<p class="details-label"><fmt:message key="label.savie.confirmation.branch" bundle="${msg}" /></p>
						<p>${serviceCentre.serviceCentreName}<span class="branch-address">${serviceCentre.address}</span></p>
					</div>
					<div class="col-xs-12 cstm-md-col-3">
						<p class="details-label"><fmt:message key="label.openinghours" bundle="${msg}" /></p>
						<p>
							${serviceCentre.operationHours }
							<span class="phone-num">
								<span class="glyphicon glyphicon-earphone" aria-hidden="true"></span> ${serviceCentre.phone }
							</span>
						</p>
					</div>				
				</div>
				<hr>
				<div class="requirements-panel">
					<p class="requirements-panel-title"><fmt:message key="info.savie.confirmation.docs.to.bring.payment" bundle="${msg}" /></p>

					<div class="row requirements-list">
						<div class="col-xs-12 cstm-md-col-1">
							<div class="requirment-img-wrapper"><img src="<%=request.getContextPath()%>/resources/images/savie-2016/hkid.png" /></div>
							<div class="requirement-text-wrapper">
								<p><fmt:message key="info.savie.confirmation.hkid.passport" bundle="${msg}" /></p>
								<!-- <p>Your HKID card and passport<br>
								<span class="small">(for non-permanent resident only)</span></p>-->
							</div>
						</div>
						<hr class="visible-xs visible-sm">
						<div class="col-xs-12 cstm-md-col-2">
							<div class="requirment-img-wrapper"><img src="<%=request.getContextPath()%>/resources/images/savie-2016/proof-of-address.png" /></div>
							<div class="requirement-text-wrapper"><p><fmt:message key="savie.label.addressproof.prefix" bundle="${msg}" /><a href="<%=request.getContextPath()%>/<fmt:message key="savie.label.addressproof.url" bundle="${msg}" />" target="_blank"><fmt:message key="savie.label.addressproof.url.text" bundle="${msg}" /></a><fmt:message key="savie.label.addressproof.suffix" bundle="${msg}" /></p></div>
						</div>
						<hr class="visible-xs visible-sm">
						<div class="col-xs-12 cstm-md-col-3">
							<div class="requirment-img-wrapper">
								<img src="<%=request.getContextPath()%>/resources/images/savie-2016/check-or-bank-info.png" class="visible-xs visible-sm"/>
								<img src="<%=request.getContextPath()%>/resources/images/savie-2016/check-or-bank-info-desktop.png" class="hidden-xs hidden-sm"/>
							</div>
							<div class="requirement-text-wrapper"><p><fmt:message key="info.savie.confirmation.bank.authorisation.payment" bundle="${msg}" /></p></div>
							<!-- <div class="requirement-text-wrapper"><p>A cheque in the name of applicant or applicant's bank information for setting up direct debit authorization <span class="orange-note">or settle the premium with Bank of Communication FWD Credit Card</span></p></div>-->
						</div>
					</div>
					<p class="note hidden"><fmt:message key="info.savie.confirmation.oceanpark.annualpass" bundle="${msg}" /></p>
				</div>
				<hr>
				<a href="#" class="visible-md visible-lg print-doc-link">
					<img src="<%=request.getContextPath()%>/resources/images/savie-2016/print-icon.png">&nbsp;&nbsp;&nbsp;
					<span><fmt:message key="label.print.document" bundle="${msg}" /></span>
				</a>
				<center>
					<a href="<fmt:message key="link.back.to.home" bundle="${msg}" />">
						<button type="button" class="text-bold btn btn-home savie-common-btn btn-home-pay-later"><fmt:message key="button.backtohome" bundle="${msg}" /></button>
					</a>
				</center>
			</div>
		</div>
	</div>
	<!-- FOOTER -->
</div>			

<!-- JS INCLUDES -->
<script type="text/javascript">
	var language = "en";
</script>
