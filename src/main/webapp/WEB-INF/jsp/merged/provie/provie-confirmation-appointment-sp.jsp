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
<fmt:setBundle basename="provie" var="provieMsg" />
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var language = "${language}";
</script>
<%!
	boolean isSaleActiveClass = false;
	boolean isEservicesActiveClass = false;
%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/provie/provie-styles.css">

<div id="make-an-appointment-page" class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps">			
<!-- Breadcrumb Component Start-->

	<c:set var="breadcrumbItems" value="breadcrumb.item.home"/>
	<c:set var="breadcrumbActive" value="0"/>

	<c:set var="breadcrumbItems">
		breadcrumb.item.home,breadcrumb.item.save,breadcrumb.item.provie,breadcrumb.item.appointment
	</c:set>
	<c:set var="breadcrumbActive">3</c:set>

	<jsp:include page="/WEB-INF/jsp/merged/comp/breadcrumb.jsp">
		<jsp:param name="breadcrumbItems" value="${breadcrumbItems}"/>
		<jsp:param name="breadcrumbActive" value="${breadcrumbActive}"/>
	</jsp:include>

	<!-- Breadcrumb Component End-->

	<!-- StepIndicator Component Start-->

	<c:set var="stepItems" value="stepindicator.selectplan"/>
	<c:set var="stepActive" value="0"/>

	<c:set var="stepItems">
		stepindicator.selectplan,stepindicator.appointment,stepindicator.confirmation
	</c:set>
	<c:set var="stepActive">2</c:set>

	<!--<div class="container-fluid fwd-full-container browse-holder">-->
	<jsp:include page="/WEB-INF/jsp/merged/comp/step-indicator.jsp">
		<jsp:param name="stepItems" value="${stepItems}"/>
		<jsp:param name="stepActive" value="${stepActive}"/>
	</jsp:include>
	<!--</div>-->


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
					<div class="col-xs-12 cstm-md-col-1"><p class="text-bold panel-title"><fmt:message key="provie.appoint.confirm.title" bundle="${provieMsg}" /></p></div>
					<div class="col-xs-12 visible-xs visible-sm policy-number-wrapper">
						<span class="text-bold policy-number-label"><fmt:message key="provie.appoint.refno" bundle="${provieMsg}" /></span>
						<span class="policy-number"></span>
					</div>
					<div class="col-xs-12 cstm-md-col-2">
						<p><fmt:message key="provie.appoint.confirm.text1" bundle="${provieMsg}" /><br><br><fmt:message key="provie.appoint.confirm.text2" bundle="${provieMsg}" /></p>
					</div>
					<div class="col-md-3 cstm-md-col-3 hidden-xs hidden-sm">
						<p class="text-bold policy-number-label"><fmt:message key="provie.appoint.refno" bundle="${provieMsg}" /></p>
						<p class="policy-number"></p>
					</div>
				</div>
				<hr>
				<div class="row appointment-details-panel">
					<div class="col-xs-12"><p class="text-bold panel-title"><fmt:message key="provie.appoint.confirm.details.title" bundle="${provieMsg}" /></p></div>
					<div class="col-xs-12 cstm-md-col-1">
						<div>
							<p class="text-bold details-label"><fmt:message key="provie.appoint.confirm.details.date" bundle="${provieMsg}" /></p>
							<p class="appointment-date"></p>
						</div>
						<div>
							<p class="text-bold details-label"><fmt:message key="provie.appoint.confirm.details.time" bundle="${provieMsg}" /></p>
							<p class="appointment-time">11:30</p>
						</div>
					</div>
					<div class="col-xs-12 cstm-md-col-2">
						<p class="text-bold details-label"><fmt:message key="provie.appoint.confirm.details.branch" bundle="${provieMsg}" /></p>
						<p><span class="branch-name">尖沙咀</span></p>
						<p class="branch-address"></p>
					</div>
					<div class="col-xs-12 cstm-md-col-3">
						<p class="text-bold details-label"><fmt:message key="provie.appoint.confirm.details.ophours" bundle="${provieMsg}" /></p>
						<p>
							<fmt:message key="provie.appoint.confirm.details.ophours2" bundle="${provieMsg}" />
							<span class="phone-num">
								<span aria-hidden="true" class="glyphicon glyphicon-earphone"></span> 3123 3123
							</span>
						</p>
					</div>				
				</div>
				<hr>
				<div class="requirements-panel">
					<p class="text-bold requirements-panel-title"><fmt:message key="provie.appoint.confirm.details.text1" bundle="${provieMsg}" /></p>

					<div class="row requirements-list">
						<div class="col-xs-12 cstm-md-col-1">
							<div class="requirment-img-wrapper"><img src="<%=request.getContextPath()%>/resources/images/savie-2016/hkid.png"></div>
							<div class="requirement-text-wrapper">
								<p><fmt:message key="provie.appoint.confirm.details.text2" bundle="${provieMsg}" /><br><span class="small"><fmt:message key="provie.appoint.confirm.details.text3" bundle="${provieMsg}" /></span></p>
							</div>
						</div>
						<hr class="visible-xs visible-sm">
						<div class="col-xs-12 cstm-md-col-2">
							<div class="requirment-img-wrapper"><img src="<%=request.getContextPath()%>/resources/images/savie-2016/proof-of-address.png"></div>
							<div class="requirement-text-wrapper"><p><fmt:message key="provie.appoint.confirm.details.text4" bundle="${provieMsg}" /> <a href="/resources/address_proof.pdf"><fmt:message key="provie.appoint.confirm.details.text5" bundle="${provieMsg}" /></a> <fmt:message key="provie.appoint.confirm.details.text6" bundle="${provieMsg}" /></p></div>
						</div>
						<hr class="visible-xs visible-sm">
						<div class="col-xs-12 cstm-md-col-3">
							<div class="requirment-img-wrapper">
								<img class="visible-xs visible-sm" src="<%=request.getContextPath()%>/resources/images/savie-2016/check-or-bank-info.png">
								<img class="hidden-xs hidden-sm" src="<%=request.getContextPath()%>/resources/images/savie-2016/check-or-bank-info-desktop.png">
							</div>
							<div class="requirement-text-wrapper"><p><fmt:message key="provie.appoint.confirm.details.text8" bundle="${provieMsg}" /></p></div>
						</div>
					</div>
					
					<!--p class="note">In order to enjoy Ocean Park premium discount, please bring along your Ocean Park SmartFun Annual Pass (Gold or Silver) or purchase confirmation email for verification purpose.</p-->
				</div>
				<hr>
				<a class="visible-md visible-lg print-doc-link" href="javascript:window.print()">
					<img src="<%=request.getContextPath()%>/resources/images/savie-2016/print-icon.png">&nbsp;&nbsp;&nbsp;
					<span><fmt:message key="provie.appoint.confirm.link.print" bundle="${provieMsg}" /></span>
				</a>
				<center>
					<a href="https://i.fwd.com.hk/en">
						<button class="text-bold btn btn-home savie-common-btn" type="button"><fmt:message key="provie.appoint.confirm.cta.back" bundle="${provieMsg}" /></button>
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
