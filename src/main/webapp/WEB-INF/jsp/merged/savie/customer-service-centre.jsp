<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!--<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />-->
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />-->


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
	function gotoCenter(){
		window.location.href = "<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow2}";
	}
	
	function gotoAppForm(){
		window.location.href = "<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow}";
	}
</script>
	<%!
		boolean isSaleActiveClass = false;
		boolean isEservicesActiveClass = false;
	%>
	<div class="fwd-savie-wrapper">			
			<div id="set-appointment" class="container-fluid fwd-full-container">
				<div class="application-page-header">
					<div class="row">
						<div class="col-xs-12 orange-section">
							<div class="clearfix position">
								<div class="description-desktop">
									<span><fmt:message key="savie.customerServiceCentre.orangeStickyBar" bundle="${msg}" /></span>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="application-flux customer-service">
					<div id="service-centre" class="container-fluid fwd-container page-application">
						<h2><fmt:message key="savie.customerServiceCentre.headerText1" bundle="${msg}" /></h2>
						<form>
							<div class="row">
								<div class="col-xs-12 col-md-6">
									<div class="row">
										<div class="col-xs-12 col-md-4"><label for="centre"><fmt:message key="savie.customerServiceCentre.center" bundle="${msg}" /></label></div>
										<div class="col-xs-12 col-md-8">
											<div class="selectDiv">
												<!-- <span class="icon-chevron-thin-down orange-caret" id="centre-orange-caret"></span> -->
												<select name="centre" id="centre" class="selectpicker">
													<option value="1">Tsim Sha Tsui</option>
													<option value="2">Quarry Bay</option>
													<option value="3">Sheung Wan</option>
													<option value="4">Kwun Tong</option>
													<option value="5">Shatin</option>
												</select>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-12 col-md-4"><label for="preferred-date"><fmt:message key="savie.customerServiceCentre.date" bundle="${msg}" /></label></div>
										<div class="col-xs-12 col-md-8">
											<div id="date" class="selectDiv preferred-date">
												<input type="text" class="date" name="preferred-date" id="preferred-date" value="09-09-2015" readonly="">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-12 col-md-4"><label for="preferred-time"><fmt:message key="savie.customerServiceCentre.time" bundle="${msg}" /></label></div>
										<div class="col-xs-12 col-md-8">
											<div class="selectDiv timeslot">
												<span class="icon-chevron-thin-down orange-caret" id="time-orange-caret"></span>
												<input type="text" name="preferred-time" id="preferred-time" value="10:30">
											</div>
										</div>
									</div>
									<p class="confirm-call"><fmt:message key="savie.customerServiceCentre.confirmCall" bundle="${msg}" /></p>
								</div>
								
								<div class="col-md-6 hidden-xs hidden-sm">
									<div id="centre-1" class="centre-info">
										<img src="<%=request.getContextPath()%>/resources/images/savie/tsimshatsui.jpg" class="img-responsive" />
										<h4><fmt:message key="savie.customerServiceCentre.address" bundle="${msg}" /></h4>
										<p><fmt:message key="savie.customerServiceCentre.fontaine" bundle="${msg}" /></p>
									</div>
									<div id="centre-2" class="centre-info hidden">
										<img src="<%=request.getContextPath()%>/resources/images/savie/quarry_bay.jpg" class="img-responsive" />
										<h4><fmt:message key="savie.customerServiceCentre.address" bundle="${msg}" /></h4>
										<p><fmt:message key="savie.customerServiceCentre.devon" bundle="${msg}" /></p>
									</div>
									<div id="centre-3" class="centre-info hidden">
										<img src="<%=request.getContextPath()%>/resources/images/savie/sheung_wan.jpg" class="img-responsive" />
										<h4><fmt:message key="savie.customerServiceCentre.address" bundle="${msg}" /></h4>
										<p><fmt:message key="savie.customerServiceCentre.fwdfinancialCentre" bundle="${msg}" /></p>
									</div>
									<div id="centre-4" class="centre-info hidden">
										<img src="<%=request.getContextPath()%>/resources/images/savie/kwuntong.jpg" class="img-responsive" />
										<h4><fmt:message key="savie.customerServiceCentre.address" bundle="${msg}" /></h4>
										<p><fmt:message key="savie.customerServiceCentre.legendTower" bundle="${msg}" /></p>
									</div>
									<div id="centre-5" class="centre-info hidden">
										<img src="<%=request.getContextPath()%>/resources/images/savie/shatin.jpg" class="img-responsive" />
										<h4><fmt:message key="savie.customerServiceCentre.address" bundle="${msg}" /></h4>
										<p><fmt:message key="savie.customerServiceCentre.shatin" bundle="${msg}" /></p>
									</div>
								</div>
							</div>
							
							<div class="text-center">
								<button class="btn next confirm-appointment" type="button" id="btn-cstmr-srvc-cnter"><fmt:message key="savie.customerServiceCentre.confirmBtn" bundle="${msg}" /></button>
							</div>
						</form>
					</div>
				</div>
			</div>
	</div>
	
			<!--Modal in Customer Service Centre-->
			<div class="modal fade" role="dialog" aria-labelledby="pickAnotherCentre" id="pickAnotherCentre">
				<div class="modal-dialog teaserSurvey" role="document">
					<div class="modal-content teaserSurvey">
						<div class="modal-header teaserSurvey">
							<!--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>-->
							<h2><fmt:message key="savie.customerServiceCentre.modalheader" bundle="${msg}" /></h2>
						</div>
						<div class="modal-body teaserSurvey">
							<p class="registered"><fmt:message key="savie.customerServiceCentre.modalothertimeslots" bundle="${msg}" /></p>
							
							<!--<button type="submit" class="btn btn-white btn-thank-you" id="teaser-mmodal-submit">Submit</button>-->
							<button type="submit" class="btn btn-orange" id="pick-another-centre-btn"><fmt:message key="savie.customerServiceCentre.modalPickAnotherCenter" bundle="${msg}" /></button>
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal-dialog -->	
			</div><!-- /.modal -->
			
			<!--Modal in Customer Service Centre-->
			<div class="modal fade" role="dialog" aria-labelledby="fullyBooked" id="fullyBooked">
				<div class="modal-dialog teaserSurvey" role="document">
					<div class="modal-content teaserSurvey">
						<div class="modal-header teaserSurvey">
							<!--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>-->
							<h2><fmt:message key="savie.customerServiceCentre.fullyBookmodalheader" bundle="${msg}" /></h2>
						</div>
						<div class="modal-body teaserSurvey">
							<p class="registered"><fmt:message key="savie.customerServiceCentre.fullyBookmodalbody" bundle="${msg}" /></p>
							
							<!--<button type="submit" class="btn btn-white btn-thank-you" id="teaser-mmodal-submit">Submit</button>-->
							<button type="submit" class="btn btn-orange" id="pick-another-centre-btn"><fmt:message key="savie.customerServiceCentre.fullyBookmodalbtnTxt" bundle="${msg}" /></button>
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal-dialog -->	
			</div><!-- /.modal -->

	
	<!-- JS INCLUDES -->
		
		<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/bootstrap-datepicker.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/jasny-bootstrap.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/bootstrap-select.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/jquery.touchSwipe.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/bootstrapValidator.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/custom.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/fwd-validation.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/placeholders.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/date.format.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/jquery.timepicker.min.js"></script>
		<script>
			$(function() {
				//$('#fullyBooked').modal('show');
				//console.log($('#fullyBooked').length);
				
				$('#pick-another-centre-btn').click(function(){
					$('#pickAnotherCentre').modal('hide');
				});
				
				$('#btn-cstmr-srvc-cnter').click(function(){
					$('#fullyBooked').modal('show');
				});
				
				$('#preferred-time').timepicker({
					appendTo: '.timeslot',
					timeFormat: 'H:i',
				});
				
				// temp fixes
				$('#time-orange-caret').click(function(){
					$('#preferred-time').click();
				});

				$('#preferred-date').datepicker({
					format: "mm-dd-yyyy",
					container: "#date",
					startDate: new Date(),
				});
				// fix by tommy
				$('#centre').selectpicker();
				$('button[data-id="centre"]').on('click', function() {
               var $self = $(this);
               var $warp = $self.parent('.bootstrap-select');
					$warp.toggleClass('open');
				});
				$('#centre').on('change', function() {
					var centre = $('#centre option:selected').val();
					// display corresponding info
					$('.centre-info').addClass('hidden');
					$('#centre-' + centre).removeClass('hidden');
					
					//display modal 
					$('#pickAnotherCentre').modal('show');
				});
			});
		</script>
