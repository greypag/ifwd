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
				<div class="application-page-header et-header-browse">
					<div class="et-back-arrow hidden-xs hidden-sm">
						<a href="#" class="et-back-arrow-link">
							<span class="icon-arrow-left2 arrow-left"></span>
						</a>
				    </div>
					<div class="row reset-margin hidden-xs hidden-sm">
		                  <div class="col-md-4 reset-padding">
		                      <button type="button" class="et-header-info-btn et-bind-btn-header no-hover" id="plan-detail" data-et-section-target="et-select-plan-section">Plan details</button>
		                  </div>
		                  <div class="col-md-4 reset-padding">
		                      <button type="button" class="et-header-info-btn et-bind-btn-header active" id="make-appointment" data-et-section-target="et-application-section">Make appointment</button>
		                  </div>
		                  <div class="col-md-4 reset-padding">
		                      <button type="button" class="et-header-info-btn et-bind-btn-header no-hover" id="confirmation" data-et-section-target="et-dec-sign-section">Confirmation</button>
		                  </div>
              		</div>
					<div class="et-mobile-header-info hidden-md hidden-lg">
						<div class="clearfix">
							<div class="et-back-arrow">
								<a href="#" class="et-back-arrow-link">
									<span class="icon-arrow-left2 arrow-left"></span>
								</a>
							</div>
							<div class="et-header-tex">
								<h3 id="et-active-section-label">Make appointment</h3>
							</div>
						</div>
					</div>
				</div>
				
				<div class="application-flux customer-service">
					<div id="service-centre" class="container-fluid fwd-container page-application">
						<div class="fwd-container hidden-xs hidden-sm clearfix">
								<div class="breadcrumbs pull-left">
									<ol class="breadcrumb breadcrumbs-product-details breadcrumbs-landing">
										<li><a href="#"><fmt:message key="savie.planDetails.Save" bundle="${msg}" /></a></li>
										<li class="divider"><i class="fa fa-play"></i></li>
										<li><a href="#">Evergreen</a></li>
										<li class="divider last"><i class="fa fa-play"></i></li>
										<li class="active-bc">Make appointment</li>
									</ol>
								</div>
							</div>
						<h2><fmt:message key="savie.customerServiceCentre.headerText1" bundle="${msg}" /></h2>
						<form>
							<div class="row">
								<div class="col-xs-12 col-md-6">
									<div class="row">
										<div class="col-xs-12 col-md-4"><label for="centre"><fmt:message key="savie.customerServiceCentre.center" bundle="${msg}" /></label></div>
										<div class="col-xs-12 col-md-8">
											<div class="selectDiv">
												<span class="icon-chevron-thin-down orange-caret"></span>
                                                <div class="centre-holder">
                                                    <select name="centre" id="centre" class="form-control gray-dropdown">
                                                        <c:forEach var="list" items="${serviceCentre.serviceCentres}">
                                                            <option value="${list.serviceCentreCode }" <c:if test="${list.serviceCentreCode == csCenter }">selected="selected"</c:if>>${list.serviceCentreName }</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-12 col-md-4"><label for="preferred-date"><fmt:message key="savie.customerServiceCentre.date" bundle="${msg}" /></label></div>
										<div class="col-xs-12 col-md-8">
											<div id="date" class="selectDiv preferred-date">
												<input type="text" class="date" name="preferred-date" id="preferred-date" value="${perferredDate }" readonly="">
												<input type="hidden" id="preferred-date-mirror" value="${perferredDate }">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-12 col-md-4"><label for="preferred-time"><fmt:message key="savie.customerServiceCentre.time" bundle="${msg}" /></label></div>
										<div class="col-xs-12 col-md-8">
											<div class="selectDiv timeslot">
												<span class="icon-chevron-thin-down orange-caret" id="time-orange-caret"></span>
												<!-- <input type="text" name="preferred-time" id="preferred-time" value=""> -->
                                                <div class="centre-holder">
                                                    <select name="preferred-time" id="preferred-time" onclick="putTimeSession();" class="form-control gray-dropdown">
                                                        <option value=""></option>
                                                    </select>
                                                </div>
											</div>
										</div>
									</div>
									<p class="confirm-call"><fmt:message key="saviee.appointment.remarks" bundle="${msg}" /></p>
								</div>
								
								<div class="col-xs-12 col-md-6">
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
										    <a href="url" class="map-link" target="_blank" >View map</a>
									    </div>
							        </c:forEach>
								</div>
							</div>
							
							<div class="text-center">
								<button class="btn next confirm-appointment" type="button" id="btn-cstmr-srvc-cnter"><fmt:message key="saviee.appointment.submit" bundle="${msg}" /></button>
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
							<button type="button" class="btn btn-orange" id="pick-another-centre-btn"><fmt:message key="savie.customerServiceCentre.modalPickAnotherCenter" bundle="${msg}" /></button>
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
							<button type="button" class="btn btn-orange" id="fullyBooked-button"><fmt:message key="savie.customerServiceCentre.fullyBookmodalbtnTxt" bundle="${msg}" /></button>
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal-dialog -->	
			</div><!-- /.modal -->
			
			<!--Modal in Customer Service Centre (access code had been used)-->
			<div class="modal fade" role="dialog" aria-labelledby="accessCodeUsed" id="accessCodeUsed">
				<div class="modal-dialog teaserSurvey" role="document">
					<div class="modal-content teaserSurvey">
						<div class="modal-header teaserSurvey">
							<h2><fmt:message key="savie.customerServiceCentre.accessCodeUsedheader" bundle="${msg}" /></h2>
						</div>
						<div class="modal-body teaserSurvey">
							<p class="registered"><fmt:message key="savie.customerServiceCentre.accessCodeUsedbody" bundle="${msg}" /></p>
							<button type="submit" class="btn btn-orange" id="back-to-home-btn"><fmt:message key="savie.customerServiceCentre.accessCodeUsedbtnTxt" bundle="${msg}" /></button>
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal-dialog -->	
			</div><!-- /.modal -->
			
			<!--Modal in Customer Service Centre-->
			<div class="modal fade" role="dialog" aria-labelledby="perferredTimeIsNull" id="perferredTimeIsNull">
				<div class="modal-dialog teaserSurvey" role="document">
					<div class="modal-content teaserSurvey">
						<div class="modal-header teaserSurvey">
							<!--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>-->
							<h2><fmt:message key="savie.customerServiceCentre.perferredTimeIsNull" bundle="${msg}" /></h2>
						</div>
						<div class="modal-body teaserSurvey">
							<p class="registered"><fmt:message key="savie.customerServiceCentre.perferredTimeIsNullContext" bundle="${msg}" /></p>
							
							<!--<button type="submit" class="btn btn-white btn-thank-you" id="teaser-mmodal-submit">Submit</button>-->
							<button type="button" class="btn btn-orange" id="perferredTimeIsNull-btn"><fmt:message key="savie.customerServiceCentre.modalPickAnotherCenter" bundle="${msg}" /></button>
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal-dialog -->	
			</div><!-- /.modal -->
			
			<!--Modal in Customer Service Centre (Reservation Invalid)-->
			<div class="modal fade" role="dialog" aria-labelledby="reservationInvalid" id="reservationInvalid">
				<div class="modal-dialog teaserSurvey" role="document">
					<div class="modal-content teaserSurvey">
						<div class="modal-header teaserSurvey">
							<h2><fmt:message key="savie.customerServiceCentre.reservationInvalid" bundle="${msg}" /></h2>
						</div>
						<div class="modal-body teaserSurvey">
							<p class="registered"><fmt:message key="savie.customerServiceCentre.reservationInvalid.body" bundle="${msg}" /></p>
							<button type="button" class="btn btn-orange" id="reservationInvalid-btn"><fmt:message key="savie.customerServiceCentre.modalPickAnotherCenter" bundle="${msg}" /></button>
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal-dialog -->	
			</div><!-- /.modal -->
	</form>
</div>
<%-- 
<script src="<%=request.getContextPath()%>/resources/js/locales/bootstrap-datepicker.zh-TW.js"></script> --%>
<script src="<%=request.getContextPath()%>/resources/js/savie/fwd-teaser.js"></script>

<script src="<%=request.getContextPath()%>/resources/js/vendor/bootstrap-datepicker.min.js"></script>

<script>
	var startDate= new Date((new Date()).getTime() + 3*24*60*60*1000);
	var endDate= new Date((new Date()).getTime() + 22*24*60*60*1000);
	$(function() {
		//daysOfWeekDisabled: [0]
		$('#preferred-date').datepicker({
			format: "dd-mm-yyyy",
			container: "#date",
			startDate: startDate,
			endDate: endDate,
			autoclose: true
		}).on('changeDate', function (ev) {
			if(ev.date != null){
				$("#preferred-date-mirror").val($("#preferred-date").val().trim());
			}
			else{
				$('#preferred-date').datepicker('update', $("#preferred-date-mirror").val().trim());
			}
			if($("#centre").val().trim() != "" && $("#preferred-date").val().trim() != ""){
				getTimeSlot('${perferredTime }');
			}
			else{
				$("#preferred-time").empty();
				$("#preferred-time").prepend("<option value=''></option>");
			}
		});
		
		var serviceCentreCode = '${csCenter }';
		//var perDate = '${perferredDate }';
		//$("#preferred-date").datepicker("setDate", perDate.split('-')[0] +'-'+ perDate.split('-')[1] + '-' + perDate.split('-')[2]);
		
		$('.centre-info').addClass('hidden');
		$('#centre-' + serviceCentreCode).removeClass('hidden');
		if($("#centre").val().trim() != "" && $("#preferred-date").val().trim() != ""){
			getTimeSlot('${perferredTime }');
		}
		
		$('#pick-another-centre-btn').click(function(){
			$('#pickAnotherCentre').modal('hide');
		});
		$('#fullyBooked-button').click(function(){
			$('#fullyBooked').modal('hide');
		});
		$('#perferredTimeIsNull-btn').click(function(){
			$('#perferredTimeIsNull').modal('hide');
		});
		$('#reservationInvalid-btn').click(function(){
			$('#reservationInvalid').modal('hide');
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
			if(perferredTime == null || perferredTime.trim() == ""){
				$('#perferredTimeIsNull').modal('show');
			}
			else{
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
				    	}
				    	else if(data.errMsgs == "Access code has already been used"){
				    		$('#accessCodeUsed').modal('show');
				    		console.log(data.errMsgs);
				    	}
				    	else if(data.errMsgs == "Reservation is invalid"){
				    		$('#reservationInvalid').modal('show');
				    		console.log(data.errMsgs);
				    	}
				    }  
				});
			}
		});
		$('#back-to-home-btn').click(function(){
    		$("#serviceCenterForm").attr("action", context + "/" + language + "/savings-insurance");
	    	$("#serviceCenterForm").submit();
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
		
