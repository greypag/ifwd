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
												<!-- <input type="text" name="preferred-time" id="preferred-time" value=""> -->
												<select name="preferred-time" id="preferred-time" class="form-control gray-dropdown">
											        <option value=""></option>
												</select>
											</div>
										</div>
									</div>
									<p class="confirm-call"><fmt:message key="savie.servicecenter.callyouback" bundle="${msg}" /></p>
								</div>
								
								<div class="col-md-6 hidden-xs hidden-sm">
							        <c:forEach varStatus="l" var="list" items="${serviceCentre.serviceCentres}">
							            <div id="centre-${list.serviceCentreCode }" class="centre-info ${l.first?'':'hidden' }">
										    <c:choose>
										        <c:when test="${list.photo != null && list.photo.toLowerCase().startsWith('http')}">
										            <img src="${list.photo}" class="img-responsive" />
										        </c:when>
										        <c:otherwise>
												    <img src="<%=request.getContextPath()%>/resources/images/savie/${list.photo}" class="img-responsive" />
												</c:otherwise>
										    </c:choose>
										    
										    <h4><fmt:message key="savie.servicecenter.address" bundle="${msg}" /></h4>
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
							<h2><fmt:message key="savie.servicecenter.pickedisfully" bundle="${msg}" /></h2>
						</div>
						<div class="modal-body teaserSurvey">
							<p class="registered"><fmt:message key="savie.servicecenter.availabletimeslots" bundle="${msg}" /></p>
							
							<!--<button type="submit" class="btn btn-white btn-thank-you" id="teaser-mmodal-submit">Submit</button>-->
							<button type="submit" class="btn btn-orange" id="pick-another-centre-btn"><fmt:message key="savie.servicecenter.pickanothercenter" bundle="${msg}" /></button>
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal-dialog -->	
			</div><!-- /.modal -->
			
			<!--Modal in Customer Service Centre-->
			<div class="modal fade" role="dialog" aria-labelledby="fullyBooked" id="fullyBooked">
				<div class="modal-dialog teaserSurvey" role="document">
					<div class="modal-content teaserSurvey">
						<div class="modal-header teaserSurvey">
							<h2><fmt:message key="savie.servicecenter.centersarefully" bundle="${msg}" /></h2>
						</div>
						<div class="modal-body teaserSurvey">
							<p class="registered"><fmt:message key="savie.servicecenter.availabletimeslots1" bundle="${msg}" /></p>
							<button type="submit" class="btn btn-orange" id="pick-another-centre-btn"><fmt:message key="savie.servicecenter.backtohome" bundle="${msg}" /></button>
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal-dialog -->	
			</div><!-- /.modal -->
	</form>
</div>
<%-- <script src="<%=request.getContextPath()%>/resources/js/vendor/bootstrap-datepicker.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/locales/bootstrap-datepicker.zh-TW.js"></script> --%>
<script src="<%=request.getContextPath()%>/resources/js/savie/fwd-teaser.js"></script>

<script src="<%=request.getContextPath()%>/resources/js/vendor/jquery.timepicker.min.js"></script>

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
		    	if(data != null && data.serviceCentres != null && data.serviceCentres != ''){
		    		var serviceCentreCode = data.serviceCentres[0].serviceCentreCode;
		    		var date = data.serviceCentres[0].dates[0].date;
		    		var timeSlot = data.serviceCentres[0].dates[0].timeSlots[0].timeSlot;
		    		var preferred_date = new Date()
		    		
		    		preferred_date.setTime(date)
		    		var year = preferred_date.getFullYear();
		    		var month = preferred_date.getMonth() + 1;
		    		var date = preferred_date.getDate();
		    		month = (month < 10) ? '0' + month : month;
		    		date = (date < 10) ? '0' + date : date;
		    		$("#centre").val(serviceCentreCode);
		    		$("#preferred-date").datepicker("setDate", month +'-'+ date + '-' + year);
		    		
		    		$('.centre-info').addClass('hidden');
					$('#centre-' + serviceCentreCode).removeClass('hidden');
					if($("#centre").val().trim() != "" && $("#preferred-date").val().trim() != ""){
						getTimeSlot();
					}
		    	}else {
					$('#fullyBooked').modal('show');
		    	}
		    	
		    }  
		});
		
		$('#pick-another-centre-btn').click(function(){
			$('#pickAnotherCentre').modal('hide');
		});
		
		/* $('#preferred-time').timepicker({
			appendTo: '.timeslot',
			disableTimeRanges: [['0:00', '24:00']],
			timeFormat: 'H:i',
		}); */
		
		$('#preferred-date').datepicker({
			format: "dd-mm-yyyy",
			container: "#date",
			startDate: startDate,
			endDate: endDate,
			autoclose: true,
			daysOfWeekDisabled: [0]
		}).on('changeDate', function (ev) {
			if($("#centre").val().trim() != "" && $("#preferred-date").val().trim() != ""){
				getTimeSlot();
			}
		});
		$('#centre').on('change', function() {
			var centre = $('#centre option:selected').val();
			// display corresponding info
			$('.centre-info').addClass('hidden');
			$('#centre-' + centre).removeClass('hidden');
			if($("#centre").val().trim() != "" && $("#preferred-date").val().trim() != ""){
				getTimeSlot();
			}
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
			    		//send email
			    		$.ajax({     
						    url:context+'/ajax/savie/service-center-confirm/email',     
						    type:'post',
						    data:{    
						    	"csCenter": csCenter,
						        "perferredDate":perferredDate,
						        "perferredTime":perferredTime
					   		}, 
						    success:function(data){
						    	if(data.errMsgs == null){
						    		console.log("send email success");
						    		$("#serviceCenterForm").attr("action", context + "/" + language + "/savings-insurance/confirmation");
							    	$("#serviceCenterForm").submit();
						    	}else{
						    		console.log(data.errMsgs);
						    	}
						    },
						    error:function(){       
						    }
						});
			    	}else{
			    		console.log(data.errMsgs);
			    	}
			    }  
			});
		});
	});
</script>
