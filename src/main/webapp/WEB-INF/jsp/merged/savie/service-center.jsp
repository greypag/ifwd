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
var affiliate = "${affiliate}";
</script>
<%!
	boolean isSaleActiveClass = true;
%>
<div>
    <form method="post" id="serviceCenterForm">
	    <div id="set-appointment" class="container-fluid fwd-full-container">
				<div class="application-page-header">
					<div class="row">
						<div class="col-xs-12 orange-section">
							<div class="clearfix position">
								<div class="description-desktop">
									<span>Make an appointment with us.</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="application-flux customer-service">
					<div id="service-centre" class="container-fluid fwd-container page-application">
						<h2>Please choose service centre</h2>
						<form>
							<div class="row">
								<div class="col-xs-12 col-md-6">
									<div class="row">
										<div class="col-xs-12 col-md-4"><label for="centre">CS center</label></div>
										<div class="col-xs-12 col-md-8">
											<div class="selectDiv">
												<span class="icon-chevron-thin-down orange-caret"></span>
												<select name="centre" id="centre" class="form-control gray-dropdown">
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
										<div class="col-xs-12 col-md-4"><label for="preferred-date">Preferred date</label></div>
										<div class="col-xs-12 col-md-8">
											<div id="date" class="selectDiv preferred-date">
												<input type="text" class="date" name="preferred-date" id="preferred-date" value="09-09-2015" readonly="">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-12 col-md-4"><label for="preferred-time">Preferred time</label></div>
										<div class="col-xs-12 col-md-8">
											<div class="selectDiv timeslot">
												<span class="icon-chevron-thin-down orange-caret"></span>
												<input type="text" name="preferred-time" id="preferred-time" value="10:30">
											</div>
										</div>
									</div>
									<p class="confirm-call">We will call you back to confirm your appointment.</p>
								</div>
								
								<div class="col-md-6 hidden-xs hidden-sm">
									<div id="centre-1" class="centre-info">
										<img src="assets/images/tsimshatsui.jpg" class="img-responsive" />
										<h4>Address</h4>
										<p>G/F, Fontaine Building, 18 Mody Road, Tsim Sha Tsui</p>
									</div>
									<div id="centre-2" class="centre-info hidden">
										<img src="assets/images/quarry_bay.jpg" class="img-responsive" />
										<h4>Address</h4>
										<p>13/F, Devon House, Taikoo Place, 979 King’s Road, Quarry Bay</p>
									</div>
									<div id="centre-3" class="centre-info hidden">
										<img src="assets/images/sheung_wan.jpg" class="img-responsive" />
										<h4>Address</h4>
										<p>1/F, FWD Financial Centre, 308 Des Voeux Road Central, Sheung Wan</p>
									</div>
									<div id="centre-4" class="centre-info hidden">
										<img src="assets/images/kwuntong.jpg" class="img-responsive" />
										<h4>Address</h4>
										<p>Office E, 12/F, Legend Tower, No.7 Shing Yip Street, Kwun Tong</p>
									</div>
									<div id="centre-5" class="centre-info hidden">
										<img src="assets/images/shatin.jpg" class="img-responsive" />
										<h4>Address</h4>
										<p>Unit 1720 -21, Level 17, Tower II, Grand Central Plaza, Shatin</p>
									</div>
								</div>
							</div>
							
							<div class="text-center">
								<button class="btn next confirm-appointment" type="button" id="btn-cstmr-srvc-cnter">Confirm</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			
			<!--Modal in Customer Service Centre-->
			<div class="modal fade" role="dialog" aria-labelledby="pickAnotherCentre" id="pickAnotherCentre">
				<div class="modal-dialog teaserSurvey" role="document">
					<div class="modal-content teaserSurvey">
						<div class="modal-header teaserSurvey">
							<!--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>-->
							<h2>Sorry the center you picked is fully booked at the moment.</h2>
						</div>
						<div class="modal-body teaserSurvey">
							<p class="registered">Please pick another center or come again tomorrow more available timeslots.</p>
							
							<!--<button type="submit" class="btn btn-white btn-thank-you" id="teaser-mmodal-submit">Submit</button>-->
							<button type="submit" class="btn btn-orange" id="pick-another-centre-btn">Pick another center</button>
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
							<h2>Sorry all the centers are fully booked at the moment.</h2>
						</div>
						<div class="modal-body teaserSurvey">
							<p class="registered">Please come again tomorrow more  available timeslots.</p>
							
							<!--<button type="submit" class="btn btn-white btn-thank-you" id="teaser-mmodal-submit">Submit</button>-->
							<button type="submit" class="btn btn-orange" id="pick-another-centre-btn">Back to home</button>
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal-dialog -->	
			</div><!-- /.modal -->
	</form>
</div>
<%-- <script src="<%=request.getContextPath()%>/resources/js/bootstrap-datepicker.min.js"></script> --%>
<script src="<%=request.getContextPath()%>/resources/js/locales/bootstrap-datepicker.zh-TW.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/savie/fwd-teaser.js"></script>

<script src="<%=request.getContextPath()%>/resources/js/savie/jquery.timepicker.min.js"></script>

<script>
	$(function() {
		$('#fullyBooked').modal('show');
		
		$('#pick-another-centre-btn').click(function(){
			$('#pickAnotherCentre').modal('hide');
		});
		
		$('#btn-cstmr-srvc-cnter').click(function(){
			//window.location = "confirmation-offline";
			console.log('ksdfj');
			$('#pickAnotherCentre').modal('show');
		});
		
		$('#preferred-time').timepicker({
			appendTo: '.timeslot',
			timeFormat: 'H:i',
		});
		$('#preferred-date').datepicker({
			format: "mm-dd-yyyy",
			container: "#date",
			startDate: new Date(),
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

<!-- <script type="text/javascript">
var startDate= new Date((new Date()).getTime() + 3*24*60*60*1000);
var endDate= new Date((new Date()).getTime() + 22*24*60*60*1000);
$('#datepicker').datepicker({
	startDate: startDate,
	endDate: endDate,
	autoclose: true,
	format: "mm-dd-yyyy",
	daysOfWeekDisabled: [0],
}).on('changeDate', function (ev) {
	if($("#csCenter").val().trim() != "" && $("#datepicker").val().trim() != ""){
		getTimeSlot();
	}
});
</script> -->