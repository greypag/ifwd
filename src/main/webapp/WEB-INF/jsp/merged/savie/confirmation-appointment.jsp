<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
               <li><a class="text-bold" href="#"><fmt:message key="breadcrumb.savie.category" bundle="${msg}" /> </a></li>
               <li class="divider"><i class="fa fa-play"></i></li>
               <li><a class="text-bold" href="#"><fmt:message key="breadcrumb.savie.insurance.plan" bundle="${msg}" /> </a></li>
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
					<li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i><fmt:message key="stepindicator.savie.make.appointment" bundle="${msg}" /></button></li>
					<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
					<li class="step-number"><button type="button" class="et-header-info-btn active"><span class="status">3</span><fmt:message key="stepindicator.savie.confirmation" bundle="${msg}" /></button></li>
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
					<h3 class="text-bold"><fmt:message key="stepindicator.savie.confirmation" bundle="${msg}" /></h3>
				 </div>
				 <p id="step-of">3 of 3</p>
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
					<div class="col-xs-12 cstm-md-col-1"><p class="text-bold panel-title"><fmt:message key="label.savie.confirmation.success.title" bundle="${msg}" /></p></div>
					<div class="col-xs-12 visible-xs visible-sm policy-number-wrapper">
						<span class="text-bold policy-number-label"><fmt:message key="label.referenceno" bundle="${msg}" /></span>
						<span class="policy-number">${applicationNumber }</span>
					</div>
					<div class="col-xs-12 cstm-md-col-2">
						<p><fmt:message key="info.savie.confirmation.success.copy" bundle="${msg}" /></p>
					</div>
					<div class="col-md-3 cstm-md-col-3 hidden-xs hidden-sm">
						<p class="text-bold policy-number-label"><fmt:message key="label.referenceno" bundle="${msg}" /></p>
						<p class="policy-number">${applicationNumber }</p>
					</div>
				</div>
				<hr>
				<div class="row appointment-details-panel">
					<div class="col-xs-12"><p class="text-bold panel-title"><fmt:message key="label.appointmentdetails" bundle="${msg}" /></p></div>
					<div class="col-xs-12 cstm-md-col-1">
						<div>
							<p class="text-bold details-label"><fmt:message key="label.savie.confirmation.date" bundle="${msg}" /></p>
							<p>${preferredDate}</p>
						</div>
						<div>
							<p class="text-bold details-label"><fmt:message key="label.savie.confirmation.time" bundle="${msg}" /></p>
							<p>${preferredTime}</p>
						</div>
					</div>
					<div class="col-xs-12 cstm-md-col-2">
						<p class="text-bold details-label"><fmt:message key="label.savie.confirmation.branch" bundle="${msg}" /></p>
						<p>${serviceCentre.serviceCentreName }<span class="branch-address">${serviceCentre.address }</span></p>
					</div>
					<div class="col-xs-12 cstm-md-col-3">
						<p class="text-bold details-label"><fmt:message key="label.openinghours" bundle="${msg}" /></p>
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
					<p class="text-bold requirements-panel-title"><fmt:message key="info.savie.confirmation.docs.to.bring" bundle="${msg}" /></p>

					<div class="row requirements-list">
						<div class="col-xs-12 cstm-md-col-1">
							<div class="requirment-img-wrapper"><img src="<%=request.getContextPath()%>/resources/images/savie-2016/hkid.png" /></div>
							<div class="requirement-text-wrapper">
								<p><fmt:message key="info.savie.confirmation.hkid.passport" bundle="${msg}" /></p>
							</div>
						</div>
						<hr class="visible-xs visible-sm">
						<div class="col-xs-12 cstm-md-col-2">
							<div class="requirment-img-wrapper"><img src="<%=request.getContextPath()%>/resources/images/savie-2016/proof-of-address.png" /></div>
							<div class="requirement-text-wrapper"><p><fmt:message key="info.addressproof" bundle="${msg}" /> <a href="<%=request.getContextPath()%>/<fmt:message key="link.address.proof" bundle="${msg}" />"><fmt:message key="info.click.here" bundle="${msg}" /></a></p></div>
						</div>
						<hr class="visible-xs visible-sm">
						<div class="col-xs-12 cstm-md-col-3">
							<div class="requirment-img-wrapper">
								<img src="<%=request.getContextPath()%>/resources/images/savie-2016/check-or-bank-info.png" class="visible-xs visible-sm"/>
								<img src="<%=request.getContextPath()%>/resources/images/savie-2016/check-or-bank-info-desktop.png" class="hidden-xs hidden-sm"/>
							</div>
							<div class="requirement-text-wrapper"><p><fmt:message key="info.savie.confirmation.bank.authorisation" bundle="${msg}" /></p></div>
						</div>
					</div>

					<!--p class="note"><fmt:message key="info.savie.confirmation.oceanpark.annualpass" bundle="${msg}" /></p-->
				</div>
				<hr>
				<a href="javascript:window.print()" class="visible-md visible-lg print-doc-link">
					<img src="<%=request.getContextPath()%>/resources/images/savie-2016/print-icon.png" />&nbsp;&nbsp;&nbsp;
					<span><fmt:message key="label.printthisdocument" bundle="${msg}" /></span>
				</a>
				<center>
					<a href="<fmt:message key="link.back.to.home" bundle="${msg}" />">
						<button type="button" class="text-bold btn btn-home savie-common-btn"><fmt:message key="button.back.to.home" bundle="${msg}" /></button>
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
