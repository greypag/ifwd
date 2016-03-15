<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.*"%>
<%@page import="com.ifwd.fwdhk.connector.response.savie.ServiceCentreResponse"%>
<%@page import="com.ifwd.fwdhk.connector.response.savie.ServiceCentreResult"%>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var languageP = "${language}";
</script>
<%!
	boolean isSaleActiveClass = false;
	boolean isEservicesActiveClass = false;
%>
<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps">
	<!-- HEADER -->
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
                       <ul class="common-steps-list five-steps nav nav-pills">
                           <li class="step-number" id="first-step"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i><fmt:message key="stepindicator.savie.selectplan" bundle="${msg}" /></button></li>
                          <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
                          <li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i><fmt:message key="stepindicator.savie.application" bundle="${msg}" /></button></li>
                          <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
                          <li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i><fmt:message key="stepindicator.savie.summary.declaration" bundle="${msg}" /></button></li>
                          <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
                          <li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i><fmt:message key="stepindicator.savie.sign" bundle="${msg}" /></button></li>
                          <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
                          <li class="step-number" id="last-steps"><button type="button" class="et-header-info-btn active"><span class="status">5</span><fmt:message key="stepindicator.savie.confirmation" bundle="${msg}" /></button></li>
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
                    <p id="step-of">5 of 5</p>
                    </div>
                 </div>
              </div>
           </div>
           <div class="container-fluid fwd-full-container mobile-step-indicator visible-xs visible-sm">
              <div class="step-indicator-container clearfix">
                  <ul class="common-step-indicator five-steps nav nav-pills">
                       <li id="first-step"><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
                       <li><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
                       <li><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
                       <li><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
                       <li id="last-step"><a href="#" class="active"><span class="step-no">5</span></a></li>
                  </ul>
                  <div class="step-line"></div>
              </div>
          </div>
	<div class="container-fluid fwd-full-container headerStick">
		<div class="fwd-container-limit clearfix sidebar">
			<div id="offline-signature-confirmation-page">
				<div class="row policy-number-panel">
					<div class="col-xs-12 cstm-md-col-1"><p class="panel-title"><fmt:message key="info.savie.confirmation.success.title" bundle="${msg}" /></p></div>
					<div class="col-xs-12 visible-xs visible-sm policy-number-wrapper">
						<span class="policy-number-label"><fmt:message key="label.policyno" bundle="${msg}" /></span>
						<span class="policy-number">${lifePolicy.policyNo }</span>
					</div>
					<div class="col-xs-12 cstm-md-col-2">
						<p><fmt:message key="info.savie.confirmation.success.copy1" bundle="${msg}" /></p>
						<p id="review-line"><fmt:message key="info.savie.confirmation.success.copy2" bundle="${msg}" /></p>
					</div>
					<div class="col-md-3 cstm-md-col-3 hidden-xs hidden-sm">
						<p class="policy-number-label"><fmt:message key="label.policyno" bundle="${msg}" /></p>
						<p class="policy-number">${lifePolicy.policyNo }</p>
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
					<div class="col-xs-12">
						<div class="appointment-details-note">
							<fmt:message key="info.visit.customer.service" bundle="${msg}" />
						</div>
					</div>
				</div>
				<hr>
				<div class="requirements-panel">
					<p class="requirements-panel-title visible-xs visible-sm">Please bring the following for your appointment at our service centre:</p>
					<p class="requirements-panel-title hidden-xs hidden-sm"><fmt:message key="info.savie.confirmation.signoff.procedure" bundle="${msg}" /></p>
					<div class="row requirements-list">
						<div class="col-xs-12 col-md-6">
							<div class="requirment-img-wrapper"><img src="<%=request.getContextPath()%>/resources/images/savie-2016/customer-service-center.png" /></div>
							<div class="requirement-text-wrapper">
								<p><fmt:message key="label.visit.selected.service.centre" bundle="${msg}" /><br>
							</div>
						</div>
						<hr class="visible-xs visible-sm">
						<div class="col-xs-12 col-md-6">
							<div class="requirment-img-wrapper"><img src="<%=request.getContextPath()%>/resources/images/savie-2016/hkid-proof-of-address.png" /></div>
							<div class="requirement-text-wrapper"><p><fmt:message key="label.hkid.passport.proof.of.address.policy.number" bundle="${msg}" /></p></div>
						</div>
					</div>
					<!--<p class="note">In order to enjoy Ocean Park premium discount, please bring along your Ocean Park SmartFun Annual Pass (Gold or Silver) or purchase confirmation email for verification purpose.</p>-->
				</div>
				<hr>
				<!--<a href="#" class="visible-md visible-lg print-doc-link">
					<img src="<%=request.getContextPath()%>/resources/images/savie-2016/print-icon.png" />&nbsp;&nbsp;&nbsp;
					<span>Print this document</span>
				</a>-->
				<center><button type="button" class="btn btn-home savie-common-btn"><fmt:message key="button.back.to.home" bundle="${msg}" /></button></center>
			</div>
		</div>
	</div>
	<!-- FOOTER -->
</div>

<!-- JS INCLUDES -->
<script type="text/javascript">
	var language = "en";
	$('.savie-common-btn').click(function() {
		 window.location = '<%=request.getContextPath()%>/${language}/savings-insurance';
	});
</script>
