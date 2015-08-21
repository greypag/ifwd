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
									<span><fmt:message key="savie.servicecenter.header" bundle="${msg}" /></span>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="application-flux customer-service">
					<div id="service-centre" class="container-fluid fwd-container page-application">
						<h2><fmt:message key="savie.servicecenter.title" bundle="${msg}" /></h2>
						<form>
							<div class="row">
								<div class="col-xs-12 col-md-6">
									<div class="row">
										<div class="col-xs-12 col-md-4"><label for="centre"><fmt:message key="savie.servicecenter.center" bundle="${msg}" /></label></div>
										<div class="col-xs-12 col-md-8">
											<div class="selectDiv">
												<span class="icon-chevron-thin-down orange-caret"></span>
												<select name="centre" id="centre" class="form-control gray-dropdown">
											        <c:forEach var="list" items="${serviceCentre.serviceCentres}">
											            <option value="${list.serviceCentreCode }">${list.serviceCentreName }</option>
											        </c:forEach>
												</select>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-12 col-md-4"><label for="preferred-date"><fmt:message key="savie.servicecenter.preferreddate" bundle="${msg}" /></label></div>
										<div class="col-xs-12 col-md-8">
											<div id="date" class="selectDiv preferred-date">
												<input type="text" class="date" name="preferred-date" id="preferred-date" value="" readonly="">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-12 col-md-4"><label for="preferred-time"><fmt:message key="savie.servicecenter.preferredtime" bundle="${msg}" /></label></div>
										<div class="col-xs-12 col-md-8">
											<div class="selectDiv timeslot">
												<span class="icon-chevron-thin-down orange-caret"></span>
												<input type="text" name="preferred-time" id="preferred-time" value="">
											</div>
										</div>
									</div>
									<p class="confirm-call"><fmt:message key="savie.servicecenter.callyouback" bundle="${msg}" /></p>
								</div>
								
								<div class="col-md-6 hidden-xs hidden-sm">
							        <c:forEach varStatus="l" var="list" items="${serviceCentre.serviceCentres}">
							            <div id="centre-${list.serviceCentreCode }" class="centre-info ${l.first?'':'hidden' }">
										    <c:if test="${list.serviceCentreCode=='TST' }"><img src="<%=request.getContextPath()%>/resources/images/savie/tsimshatsui.jpg" class="img-responsive" /></c:if>
										    <c:if test="${list.serviceCentreCode=='QB' }"><img src="<%=request.getContextPath()%>/resources/images/savie/quarry_bay.jpg" class="img-responsive" /></c:if>
										    <c:if test="${list.serviceCentreCode=='SW' }"><img src="<%=request.getContextPath()%>/resources/images/savie/sheung_wan.jpg" class="img-responsive" /></c:if>
										    <c:if test="${list.serviceCentreCode=='KT' }"><img src="<%=request.getContextPath()%>/resources/images/savie/kwuntong.jpg" class="img-responsive" /></c:if>
										    <c:if test="${list.serviceCentreCode=='ST' }"><img src="<%=request.getContextPath()%>/resources/images/savie/shatin.jpg" class="img-responsive" /></c:if>
										    
										    <h4>Address</h4>
										    <p>${list.address }</p>
									    </div>
							        </c:forEach>
								</div>
							</div>
							
							<div class="text-center">
								<button class="btn next confirm-appointment" type="button" id="btn-cstmr-srvc-cnter"><fmt:message key="savie.servicecenter.confirm" bundle="${msg}" /></button>
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
							<h2>Sorry all the centers are fully booked at the moment.</h2>
						</div>
						<div class="modal-body teaserSurvey">
							<p class="registered">Please come again tomorrow more  available timeslots.</p>
							<button type="submit" class="btn btn-orange" id="pick-another-centre-btn">Back to home</button>
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal-dialog -->	
			</div><!-- /.modal -->
	</form>
</div>
<%-- <script src="<%=request.getContextPath()%>/resources/js/bootstrap-datepicker.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/locales/bootstrap-datepicker.zh-TW.js"></script> --%>
<script src="<%=request.getContextPath()%>/resources/js/savie/fwd-teaser.js"></script>

<script src="<%=request.getContextPath()%>/resources/js/savie/jquery.timepicker.min.js"></script>

<script>
	var startDate= new Date((new Date()).getTime() + 3*24*60*60*1000);
	var endDate= new Date((new Date()).getTime() + 22*24*60*60*1000);
	$(function() {
		$.ajax({     
		    url:context+'/ajax/savie/savings-insurance/getAllAvailableTimeSlot',     
		    type:'post',  
		    error:function(){       
		    },     
		    success:function(data){
		    	if(data.serviceCentres == null){
					$('#fullyBooked').modal('show');
		    	}
		    	
		    }  
		});
		
		$('#pick-another-centre-btn').click(function(){
			$('#pickAnotherCentre').modal('hide');
		});
		
		$('#preferred-time').timepicker({
			appendTo: '.timeslot',
			timeFormat: 'H:i',
		});
		$('#preferred-date').datepicker({
			format: "mm-dd-yyyy",
			container: "#date",
			startDate: startDate,
			endDate: endDate,
		});
		$('#centre').on('change', function() {
			var centre = $('#centre option:selected').val();
			// display corresponding info
			$('.centre-info').addClass('hidden');
			$('#centre-' + centre).removeClass('hidden');
			
			getTimeSlot();
		});
		
		$('#centre').change(function(){
			getTimeSlot();
		});
		
		$('#btn-cstmr-srvc-cnter').click(function(){
			var csCenter = $("#centre").val();
			var perferredDate = $("#preferred-date").val();
			var perferredTime = $("#preferred-time").val();
			
			$.ajax({     
			    url:context+'/ajax/savie/savings-insurance/upsertAppointment',     
			    type:'post',     
			    data:{    
			    	"csCenter": csCenter,
			        "perferredDate":perferredDate,
			        "perferredTime":perferredTime
		   		},     
			    error:function(){       
			    },     
			    success:function(data){  
			    	if(data.errMsgs == null){
				    	$("#serviceCenterForm").attr("action", context + "/" + language + "/savings-insurance/appointment-success");
				    	$('#serviceCenterForm').submit();
			    	}else{
			    		alert(data.errMsgs);
			    	}
			    }  
			});
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