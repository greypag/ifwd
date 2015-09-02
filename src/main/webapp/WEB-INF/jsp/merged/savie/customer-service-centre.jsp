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
<div class="fwd-savie-wrapper">		
     <form method="post" id="serviceCenterForm">	
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
										<div class="col-xs-12 col-md-4"><label for="preferred-date"><fmt:message key="savie.customerServiceCentre.date" bundle="${msg}" /></label></div>
										<div class="col-xs-12 col-md-8">
											<div id="date" class="selectDiv preferred-date">
												<input type="text" class="date" name="preferred-date" id="preferred-date" value="" readonly="">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-12 col-md-4"><label for="preferred-time"><fmt:message key="savie.customerServiceCentre.time" bundle="${msg}" /></label></div>
										<div class="col-xs-12 col-md-8">
											<div class="selectDiv timeslot">
												<span class="icon-chevron-thin-down orange-caret" id="time-orange-caret"></span>
												<!-- <input type="text" name="preferred-time" id="preferred-time" value=""> -->
												<select name="preferred-time" id="preferred-time" onclick="putTimeSession();" class="form-control gray-dropdown">
											        <option value=""></option>
												</select>
											</div>
										</div>
									</div>
									<p class="confirm-call"><fmt:message key="savie.customerServiceCentre.confirmCall" bundle="${msg}" /></p>
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
								<button class="btn next confirm-appointment" type="button" id="btn-cstmr-srvc-cnter"><fmt:message key="savie.customerServiceCentre.confirmBtn" bundle="${msg}" /></button>
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
	</form>
</div>
<%-- <script src="<%=request.getContextPath()%>/resources/js/bootstrap-datepicker.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/locales/bootstrap-datepicker.zh-TW.js"></script> --%>
<script src="<%=request.getContextPath()%>/resources/js/savie/fwd-teaser.js"></script>

<script src="<%=request.getContextPath()%>/resources/js/jquery.timepicker.min.js"></script>

		<!-- <script>
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
		</script> -->
		
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
		    		if('${csCenter }' !=null && '${csCenter }' !=''){
		    			$("#centre").val('${csCenter }');
		    		}
		    		else{
		    			$("#centre").val(serviceCentreCode);
		    		}
		    		if('${perferredDate }' !=null && '${perferredDate }' !=''){
		    			var perDate = '${perferredDate }';
		    			$("#preferred-date").datepicker("setDate", perDate.split('-')[0] +'-'+ perDate.split('-')[1] + '-' + perDate.split('-')[2]);
		    		}
		    		else{
		    			$("#preferred-date").datepicker("setDate", month +'-'+ date + '-' + year);
		    		}
		    		
		    		$('.centre-info').addClass('hidden');
					$('#centre-' + serviceCentreCode).removeClass('hidden');
					if($("#centre").val().trim() != "" && $("#preferred-date").val().trim() != ""){
						getTimeSlot('${perferredTime }');
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
				getTimeSlot('${perferredTime }');
			}
		});
		$('#centre').on('change', function() {
			var centre = $('#centre option:selected').val();
			// display corresponding info
			$('.centre-info').addClass('hidden');
			$('#centre-' + centre).removeClass('hidden');
			if($("#centre").val().trim() != "" && $("#preferred-date").val().trim() != ""){
				getTimeSlot('${perferredTime }');
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
	
	function putTimeSession(){
		var perTime = $("#preferred-time").val();
		$.ajax({     
		    url:context+'/ajax/savie/savings-insurance/putTimeSession',     
		    type:'post',     
		    data:{    
		        "perferredTime":perTime
	   		},     
		    success:function(data){
		    },
	   		error:function(){       
		    }
		});
	}
</script>
		
