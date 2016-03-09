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
               <li><a href="#">Home</a></li>
               <li class="divider"><i class="fa fa-play"></i></li>
               <li><a href="#">Save </a></li>
               <li class="divider"><i class="fa fa-play"></i></li>
               <li><a href="#">Savie </a></li>
               <li class="divider last"><i class="fa fa-play"></i></i></li>
               <li class="active-bc" id="et-active-bc-menu">Application</li>
            </ol>
         </div>
    </div>
    <!-- STEPS -->
	<div class="container-fluid fwd-full-container browse-holder">
		<div class="application-page-header et-header-browse">
		   <div class="browse-container">
			  <div class="row reset-margin hidden-xs hidden-sm">
				 <ul class="common-steps-list three-steps nav nav-pills">
					<li class="step-number" id="first-step"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Select plan</button></li>
					<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
					<li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Make an appointment</button></li>
					<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
					<li class="step-number"><button type="button" class="et-header-info-btn active"><span class="status">3</span>Confirmation</button></li>
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
					<h3 id="">Confirmation</h3>
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
					<div class="col-xs-12 cstm-md-col-1"><p class="panel-title">Thank you for signing up with us</p></div>
					<div class="col-xs-12 visible-xs visible-sm policy-number-wrapper">
						<span class="policy-number-label">Policy no. </span>
						<span class="policy-number">${accessCode }</span>
					</div>
					<div class="col-xs-12 cstm-md-col-2">
						<p>Your application is being processed.</p>
						<p id="review-line">Please review the confirmation of your application as detailed here.</p>
					</div>
					<div class="col-md-3 cstm-md-col-3 hidden-xs hidden-sm">
						<p class="policy-number-label">Policy no.</p>
						<p class="policy-number">${accessCode }</p>
					</div>
				</div>
				<hr>
				<div class="row appointment-details-panel">
					<div class="col-xs-12"><p class="panel-title">Appointment details</p></div>
					<div class="col-xs-12 cstm-md-col-1">
						<div>
							<p class="details-label">Date</p>
							<p>${preferredDate}</p>
						</div>
						<div>
							<p class="details-label">Time</p>
							<p>${preferredTime}</p>
						</div>
					</div>
					<div class="col-xs-12 cstm-md-col-2">
						<p class="details-label">Branch</p>
						<p>${centerName}<span class="branch-address">${centerAddress}</span></p>
					</div>
					<div class="col-xs-12 cstm-md-col-3">
						<p class="details-label">Operating hours</p>
						<p>
							Mon - Sat 8:30am to 8:00pm<br>Closed on Sun & Public Holidays
							<span class="phone-num">
								<span class="glyphicon glyphicon-earphone" aria-hidden="true"></span> 063-2323-123
							</span>
						</p>
					</div>				
				</div>
				<hr>
				<div class="requirements-panel">
					<p class="requirements-panel-title">Please bring the following for your appointment at our service centre:</p>

					<div class="row requirements-list">
						<div class="col-xs-12 cstm-md-col-1">
							<div class="requirment-img-wrapper"><img src="<%=request.getContextPath()%>/resources/images/savie-2016/hkid.png" /></div>
							<div class="requirement-text-wrapper">
								<p>Your HKID card and passport<br>
								<span class="small">(for non-permanent resident only)</span></p>
							</div>
						</div>
						<hr class="visible-xs visible-sm">
						<div class="col-xs-12 cstm-md-col-2">
							<div class="requirment-img-wrapper"><img src="<%=request.getContextPath()%>/resources/images/savie-2016/proof-of-address.png" /></div>
							<div class="requirement-text-wrapper"><p>Proof of address</p></div>
						</div>
						<hr>
						<div class="requirements-panel">
							<p class="requirements-panel-title">Please bring the following for your appointment at our service centre:</p>

							<div class="row requirements-list">
								<div class="col-xs-12 cstm-md-col-1">
									<div class="requirment-img-wrapper"><img src="<%=request.getContextPath()%>/resources/images/savie-2016/hkid.png" /></div>
									<div class="requirement-text-wrapper">
										<p>Your HKID card and passport<br>
										<span class="small">(for non-permanent resident only)</span></p>
									</div>
								</div>
								<hr class="visible-xs visible-sm">
								<div class="col-xs-12 cstm-md-col-2">
									<div class="requirment-img-wrapper"><img src="<%=request.getContextPath()%>/resources/images/savie-2016/proof-of-address.png" /></div>
									<div class="requirement-text-wrapper"><p>A valid proof of address within the last 3 months. Click <a href="#">here</a> for details.</p></div>
								</div>
								<hr class="visible-xs visible-sm">
								<div class="col-xs-12 cstm-md-col-3">
									<div class="requirment-img-wrapper">
										<img src="<%=request.getContextPath()%>/resources/images/savie-2016/check-or-bank-info.png" class="visible-xs visible-sm"/>
										<img src="<%=request.getContextPath()%>/resources/images/savie-2016/check-or-bank-info-desktop.png" class="hidden-xs hidden-sm"/>
									</div>
									<div class="requirement-text-wrapper"><p>A cheque in the name of applicant or applicant's bank information for setting up direct debit authorization <span class="orange-note">or settle the premium with Bank of Communication FWD Credit Card</span></p></div>
								</div>
							</div>
							<div class="requirement-text-wrapper"><p>A cheque in the name of applicant or applicant's bank information for setting up direct debit authorization <span class="orange-note">or settle the premium with Bank of Communication FWD Credit Card</span></p></div>
						</div>
					</div>
					
					<p class="note">In order to enjoy Ocean Park premium discount, please bring along your Ocean Park SmartFun Annual Pass (Gold or Silver) or purchase confirmation email for verification purpose.</p>
				</div>
				<hr>
				<a href="#" class="visible-md visible-lg print-doc-link">
					<img src="<%=request.getContextPath()%>/resources/images/savie-2016/print-icon.png" />&nbsp;&nbsp;&nbsp;
					<span>Print this document</span>
				</a>
				<center><button type="button" class="btn btn-home savie-common-btn">Back to home</button></center>
			</div>
		</div>
	</div>
	<!-- FOOTER -->
</div>			

<!-- JS INCLUDES -->
<script type="text/javascript">
	var language = "en";
</script>
