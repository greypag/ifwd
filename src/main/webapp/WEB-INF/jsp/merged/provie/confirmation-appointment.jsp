<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="enhance" uri="http://pukkaone.github.com/jsp" %>
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

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/provie/provie-styles.css">

<div id="make-an-appointment-page" class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps provie-plan-appointment">			
<!-- Breadcrumb Component Start-->
<link href="<%=request.getContextPath()%>/resources/css_dir/breadcrumb.css" rel="stylesheet">
<div class="comp breadcrumb">
	<div class="breadcrumb__container">
	   <ul class="breadcrumb__list breadcrumb__list--none">
			<li class="breadcrumb__item">Home</li><li class="breadcrumb__divider"><i class="fa fa-play"></i></li><li class="breadcrumb__item">Save</li><li class="breadcrumb__divider"><i class="fa fa-play"></i></li><li class="breadcrumb__item">Provie Insurance Plan</li><li class="breadcrumb__divider breadcrumb__divider--active"><i class="fa fa-play"></i></li><li class="breadcrumb__item breadcrumb__item--active">Confirmation</li>
	   </ul>
	</div>
</div>

		<!-- Breadcrumb Component End-->

		<!-- StepIndicator Component Start-->

	    <!--<div class="container-fluid fwd-full-container browse-holder">-->
		        
<link href="<%=request.getContextPath()%>/resources/css_dir/stepIndicator.css" rel="stylesheet">

<div class="comp stepIndicator stepIndicator--desktop hidden-xs hidden-sm">
   <div class="stepIndicator__container">
      <ul class="stepIndicator__list stepIndicator__list--none">
         <li class="stepIndicator__item pad-none"><button class="stepIndicator__step"><span class="stepIndicator__number stepIndicator__number--completed"><i class="fa fa-check"></i></span><span class="stepIndicator__content stepIndicator__content--completed">Select plan</span></button></li><li class="stepIndicator__divider"><img class="browse-arrow" src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png"></li><li class="stepIndicator__item pad-none"><button class="stepIndicator__step"><span class="stepIndicator__number stepIndicator__number--completed"><i class="fa fa-check"></i></span><span class="stepIndicator__content stepIndicator__content--completed">Make appointment</span></button></li><li class="stepIndicator__divider"><img class="browse-arrow" src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png"></li><li class="stepIndicator__item pad-none"><button class="stepIndicator__step"><span class="stepIndicator__number stepIndicator__number--active">3</span><span class="stepIndicator__content stepIndicator__content--active">Confirmation</span></button></li>
      </ul>
   </div>
  
</div>

<div class="comp stepIndicator stepIndicator--mobile hidden-lg hidden-md js-sticky-bar sticky-bar" style="top: 0px;">
   <div class="stepIndicator__container">
      <div class="stepIndicator__arrow"><a href="#"><span class="icon-arrow-left2"></span></a></div>
      <div class="stepIndicator__content">Make appointment</div><span class="stepIndicator__stepof">2 out of 3</span>
   </div>
</div>

<div class="comp stepIndicator stepIndicator--numberOnly hidden-lg hidden-md">
   <div class="stepIndicator__container">
      <ul class="stepIndicator__list"><li class="stepIndicator__item "><a class="stepIndicator__number stepIndicator__number--completed" href="#"><i class="fa fa-check"></i></a></li><li class="stepIndicator__item "><a class="stepIndicator__number stepIndicator__number--active" href="#"><span>2</span></a></li><li class="stepIndicator__item stepIndicator__item--last"><a class="stepIndicator__number " href="#"><span>3</span></a></li></ul><div class="stepIndicator__stepLine"></div>
   </div>
</div>


<script>

$(function() {
   $(window).bind('scroll', function() {
      stickToHeader();
   });
});

function stickToHeader() {
   if ($('.js-sticky-bar').length > 0 ) { // check if flux div exists
      
      var stickyTarget = $('.logobox &gt; .navbar-header');
      var stickySource = $('.js-sticky-bar');
      var thresholdHeight = stickySource.height() + $('.breadcrumbs').height(); //min scroll height to trigger sticky behavior

      if ($(window).scrollTop() >= (thresholdHeight)) {
         stickySource.addClass('sticky-bar');
         stickySource.css('top', stickyTarget.height() + 'px');
      } else {
         stickySource.removeClass('sticky-bar');
         stickySource.removeAttr('style');
         stickySource.removeAttr('style');
      }
   }
}

</script>

     <!--</div>-->
		<!-- StepIndicator Component End-->

       <div class="container-fluid fwd-full-container headerStick">
		<div class="fwd-container-limit clearfix sidebar">

			<div id="appointment-confirmation-page">
				<div class="row policy-number-panel">
					<div class="col-xs-12 cstm-md-col-1"><p class="text-bold panel-title">Thank you for your interest in Provie Insurance Plan</p></div>
					<div class="col-xs-12 visible-xs visible-sm policy-number-wrapper">
						<span class="text-bold policy-number-label">Reference no.</span>
						<span class="policy-number">CVVLVA</span>
					</div>
					<div class="col-xs-12 cstm-md-col-2">
						<p>You will receive an email confirmation regarding your appointment details. Please visit your selected Customer Service Centre at the scheduled date and time.<br><br>Please bring along the required documents for your Savie application.</p>
					</div>
					<div class="col-md-3 cstm-md-col-3 hidden-xs hidden-sm">
						<p class="text-bold policy-number-label">Reference no.</p>
						<p class="policy-number">CVVLVA</p>
					</div>
				</div>
				<hr>
				<div class="row appointment-details-panel">
					<div class="col-xs-12"><p class="text-bold panel-title">Appointment details</p></div>
					<div class="col-xs-12 cstm-md-col-1">
						<div>
							<p class="text-bold details-label">Date</p>
							<p>08-07-2016</p>
						</div>
						<div>
							<p class="text-bold details-label">Time</p>
							<p>11:30</p>
						</div>
					</div>
					<div class="col-xs-12 cstm-md-col-2">
						<p class="text-bold details-label">Branch</p>
						<p><span class="branch-address">Tsim Sha Tsui</span></p>
					</div>
					<div class="col-xs-12 cstm-md-col-3">
						<p class="text-bold details-label">Operating Hours</p>
						<p>
							Mon - Sat 10:00am to 8:00pm Closed on Sun &amp; Public Holidays
							<span class="phone-num">
								<span aria-hidden="true" class="glyphicon glyphicon-earphone"></span> 3123 3123
							</span>
						</p>
					</div>				
				</div>
				<hr>
				<div class="requirements-panel">
					<p class="text-bold requirements-panel-title">Please bring the following for your appointment at our Customer Service Centre:</p>

					<div class="row requirements-list">
						<div class="col-xs-12 cstm-md-col-1">
							<div class="requirment-img-wrapper"><img src="/resources/images/savie-2016/hkid.png"></div>
							<div class="requirement-text-wrapper">
								<p>Your HKID card and passport<br><span class="small">(for non-permanent resident only)</span></p>
							</div>
						</div>
						<hr class="visible-xs visible-sm">
						<div class="col-xs-12 cstm-md-col-2">
							<div class="requirment-img-wrapper"><img src="/resources/images/savie-2016/proof-of-address.png"></div>
							<div class="requirement-text-wrapper"><p>A valid proof of address within the last 3 months. Click <a href="/resources/address_proof.pdf">here</a></p></div>
						</div>
						<hr class="visible-xs visible-sm">
						<div class="col-xs-12 cstm-md-col-3">
							<div class="requirment-img-wrapper">
								<img class="visible-xs visible-sm" src="/resources/images/savie-2016/check-or-bank-info.png">
								<img class="hidden-xs hidden-sm" src="/resources/images/savie-2016/check-or-bank-info-desktop.png">
							</div>
							<div class="requirement-text-wrapper"><p>Your cheque or Bank of Communications FWD Credit Card for first 2 months' regular premium payment; and Bank information for completing the direct debit authorization form for future premium payment.</p></div>
						</div>
					</div>
					
					<!--p class="note">In order to enjoy Ocean Park premium discount, please bring along your Ocean Park SmartFun Annual Pass (Gold or Silver) or purchase confirmation email for verification purpose.</p-->
				</div>
				<hr>
				<a class="visible-md visible-lg print-doc-link" href="javascript:window.print()">
					<img src="/resources/images/savie-2016/print-icon.png">&nbsp;&nbsp;&nbsp;
					<span>Print this document</span>
				</a>
				<center>
					<a href="https://i.fwd.com.hk/en">
						<button class="text-bold btn btn-home savie-common-btn" type="button">Back to home</button>
					</a>
				</center>
			</div>
		</div>
	</div>
	<!-- FOOTER -->
		<!--Modal in Customer Service Centre-->
		<div id="pickAnotherCentre" aria-labelledby="pickAnotherCentre" role="dialog" class="modal fade">
			<div role="document" class="modal-dialog teaserSurvey">
				<div class="modal-content teaserSurvey">
					<div class="modal-header teaserSurvey">
						<!--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>-->
						<h2>Sorry, the center or date/time you selected is not available.</h2>
					</div>
					<div class="modal-body teaserSurvey">
						<p class="registered">Please select another center or try again tomorrow.</p>
						
						<!--<button type="submit" class="btn btn-white btn-thank-you" id="teaser-mmodal-submit">Submit</button>-->
						<button id="pick-another-centre-btn" class="btn btn-orange" type="button">Try again</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->	
		</div><!-- /.modal -->
		
		<!--Modal in Customer Service Centre-->
		<div data-keyboard="false" data-backdrop="static" id="fullyBooked" aria-labelledby="fullyBooked" role="dialog" class="modal fade">
			<div role="document" class="modal-dialog teaserSurvey">
				<div class="modal-content teaserSurvey">
					<div class="modal-header teaserSurvey">
						<!--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>-->
						<h2>Sorry, no available timeslot at Customer Service Centres at the moment.</h2>
					</div>
					<div class="modal-body teaserSurvey">
						<p class="registered">You may wish to consider the online application for Savie One-off premium plan. Please note that you are required to complete an online Financial Needs Analysis to assess your suitability for Savie prior to the application.</p>
						
						<!--<button type="submit" class="btn btn-white btn-thank-you" id="teaser-mmodal-submit">Submit</button>-->
						<button id="fullyBooked-button" class="btn btn-orange" type="button">Go to Financial Needs Analysis</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->	
		</div><!-- /.modal -->
		
		<!--Modal in Customer Service Centre (access code had been used)-->
		<div id="accessCodeUsed" aria-labelledby="accessCodeUsed" role="dialog" class="modal fade">
			<div role="document" class="modal-dialog teaserSurvey">
				<div class="modal-content teaserSurvey">
					<div class="modal-header teaserSurvey">
						<h2>You have submitted an appointment.</h2>
					</div>
					<div class="modal-body teaserSurvey">
						<p class="registered">Please start it over if you need to setup another one.</p>
						<button id="back-to-home-btn" class="btn btn-orange" type="button">Back to home</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->	
		</div><!-- /.modal -->
		
		<!--Modal in Customer Service Centre-->
		<div id="perferredTimeIsNull" aria-labelledby="perferredTimeIsNull" role="dialog" class="modal fade">
			<div role="document" class="modal-dialog teaserSurvey">
				<div class="modal-content teaserSurvey">
					<div class="modal-header teaserSurvey">
						<!--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>-->
						<h2>Sorry, the center or date/time you selected is not available.</h2>
					</div>
					<div class="modal-body teaserSurvey">
						<p class="registered">Please select another center or try again tomorrow.</p>
						
						<!--<button type="button" class="btn btn-white btn-thank-you" id="teaser-mmodal-submit">Submit</button>-->
						<button id="perferredTimeIsNull-btn" class="btn btn-orange" type="button">Try again</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->	
		</div><!-- /.modal -->
		
		<!--Modal in Customer Service Centre (Reservation Invalid)-->
		<div id="reservationInvalid" aria-labelledby="reservationInvalid" role="dialog" class="modal fade">
			<div role="document" class="modal-dialog teaserSurvey">
				<div class="modal-content teaserSurvey">
					<div class="modal-header teaserSurvey">
						<h2>Sorry, the center or date/time you selected is not available.</h2>
					</div>
					<div class="modal-body teaserSurvey">
						<p class="registered">Please select another center or try again tomorrow.</p>
						<button id="reservationInvalid-btn" class="btn btn-orange" type="button">Try again</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->	
		</div><!-- /.modal -->
		
		<!--Modal in Customer Service Centre (More than 2 tries)-->
		<div data-keyboard="false" data-backdrop="static" id="moreThan2Tries" aria-labelledby="moreThan2Tries" role="dialog" class="modal fade cs-modal">
			<div role="document" class="modal-dialog teaserSurvey cs-modal-dialog">
				<div class="modal-content teaserSurvey cs-modal-content">
					<div class="modal-header teaserSurvey cs-modal-header">
						<h2 class="cs-modal-h2">Sorry, you can make no more than 2 appointments in advance.</h2>
					</div>
					<div class="modal-body teaserSurvey cs-modal-body">
						<p class="registered cs-modal-p">For any enquiries, please call our Customer Hotline at 3123 3123.</p>
						<button id="moreThan2Tries-button" class="btn btn-orange cs-modal-btn" type="button">Back to Plan Options</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->	
		</div><!-- /.modal -->
</div>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/provie/provie-app-uifn.js"></script>
