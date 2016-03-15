<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page import="java.util.*"%>
<%@page import="com.ifwd.fwdhk.connector.response.savie.ServiceCentreResponse"%>
<%@page import="com.ifwd.fwdhk.connector.response.savie.ServiceCentreResult"%>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var language = "${language}";
</script>
<%!
	boolean isSaleActiveClass = true;
	boolean isSaleActiveClass = false;
	boolean isEservicesActiveClass = false;
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
		                      <button type="button" class="et-header-info-btn et-bind-btn-header no-hover" id="plan-detail" data-et-section-target="et-select-plan-section"><fmt:message key="stepindicator.plan_details" bundle="${msg}" /></button>
		                  </div>
		                  <div class="col-md-4 reset-padding">
		                      <button type="button" class="et-header-info-btn et-bind-btn-header active" id="make-appointment" data-et-section-target="et-application-section"><fmt:message key="stepindicator.appointment" bundle="${msg}" /></button>
		                  </div>
		                  <div class="col-md-4 reset-padding">
		                      <button type="button" class="et-header-info-btn et-bind-btn-header no-hover" id="confirmation" data-et-section-target="et-dec-sign-section"><fmt:message key="stepindicator.confirmation" bundle="${msg}" /></button>
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
								<h3 id="et-active-section-label"><fmt:message key="section.header.appointment" bundle="${msg}" /></h3>
							</div>
						</div>
					</div>
				</div>
<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps" id="make-an-appointment-page">			
       <div class="fwd-container container-fluid breadcrumbs">
          <div class="breadcrumb-container">
             <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
                 <li><a href="#"><fmt:message key="breadcrumb.home" bundle="${msg}" /></a></li>
		   <li class="divider"><i class="fa fa-play"></i></li>
		   <li><a href="#"><fmt:message key="breadcrumb.savie.category" bundle="${msg}" /> </a></li>
		   <li class="divider"><i class="fa fa-play"></i></li>
		   <li><a href="#"><fmt:message key="breadcrumb.savie.insurance.plan" bundle="${msg}" /> </a></li>
		   <li class="divider last"><i class="fa fa-play"></i></i></li>
		   <li class="active-bc" id="et-active-bc-menu"><fmt:message key="breadcrumb.savie.make.appointment" bundle="${msg}" /></li>
             </ol>
          </div>
       </div>
       <!-- STEPS -->
       <div class="container-fluid fwd-full-container browse-holder">
          <div class="application-page-header et-header-browse">
             <div class="browse-container">
                <div class="row reset-margin hidden-xs hidden-sm">
                   <ul class="common-steps-list nav nav-pills">
                      <li class="step-number" id="first-step"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i><fmt:message key="stepindicator.savie.selectplan" bundle="${msg}" /></button></li>
                      <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
                      <li class="step-number"><button type="button" class="et-header-info-btn active"><span class="status">2</span><fmt:message key="stepindicator.savie.make.appointment" bundle="${msg}" /></button></li>
                      <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
                      <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">3</span><fmt:message key="stepindicator.savie.confirmation" bundle="${msg}" /></button></li>
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
                      <h3 id=""><fmt:message key="stepindicator.savie.make.appointment" bundle="${msg}" /></h3>
                   </div>
                </div>
             </div>
          </div>
       </div>
       <div class="container-fluid fwd-full-container mobile-step-indicator visible-xs visible-sm">
          <div class="step-indicator-container clearfix">
             <ul class="common-step-indicator three-steps nav nav-pills">
                 <li id="first-step"><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
                 <li><a href="#" class="active"><span class="step-no">2</span></a></li>
                 <li id="last-step"><a href="#"><span class="step-no">3</span></a></li>
             </ul>
             <div class="step-line"></div>
          </div>
       </div>
       <div class="container-fluid fwd-container make-an-appointment headerStick">
         <div class="row" id="appointment-form-holder">
             <form action="" id="paymentForm" method="post">
               <div class="col-xs-12 col-md-6" id="left-side-form">
                   <h5><fmt:message key="label.service.centre.title" bundle="${msg}" /></h5>
					<p class="confirm-call"><fmt:message key="label.appointment" bundle="${msg}" /></p>
                   <div class="selectDiv centreDiv gray-text-bg">
                      <select name="centre" id="centre" class="form-control gray-dropdown">
                        <option value="" disabled selected><fmt:message key="Placeholder.centre" bundle="${msg}" /></option>
                         <c:choose>
					         <c:when test="${serviceCentre.serviceCentres.size() > 0}">
					             <c:forEach var="list" items="${serviceCentre.serviceCentres}">
                                     <option value="${list.serviceCentreCode }" <c:if test="${list.serviceCentreCode == csCenter }">selected="selected"</c:if>>${list.serviceCentreName }</option>
                                 </c:forEach>
					         </c:when>
					         <c:otherwise>
							     <option value="" ></option>
							 </c:otherwise>
					     </c:choose>
                      </select>
                      <img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
                   </div>
                   <div class="centre-info visible-xs visible-sm" id="centre-info">
                      
                   </div>
                   <div id="date" class="selectDiv preferred-date gray-text-bg">
                      <!-- <input type="text" class="date preferred-date" name="preferred-date" id="preferred-date" value="Date" readonly=""> -->
                      <%
					  Map results = (Map)request.getAttribute("datesMap");
					  Map.Entry<String, List> entry; 
					  Iterator i;
					  Boolean result = results.size() > 0; 
					  if(result) {
						  i = results.entrySet().iterator();
						  while(i.hasNext()){
							  entry=(Map.Entry<String, List>)i.next();
					  %>
					  <input type="text" class="date preferred-date form-control gray-dropdown" id="preferred-date-<%=entry.getKey()%>" value="${perferredDate }" style="display:none;" >
					  <%
						  }
					  }else {
					  %>
					  <input type="text" class="date preferred-date form-control gray-dropdown" id="full-date" value="">
					  <%
					  }
					  %>
					  <input type="hidden" name="preferred-date" id="preferred-date" value="${perferredDate }">
                      <img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
                   </div>
                    <div class="selectDiv timeslot gray-text-bg">
                      <select name="preferred-time" id="preferred-time" class="form-control gray-dropdown">
                          <option value=""></option>
                      </select>
                      <img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
                   </div>
                </div>
                <div class="col-xs-12 col-md-6" id="right-side-form">
                   <div class="centre-info visible-md visible-lg" id="centre-info">
                      
                   </div>
                </div>
                <div class="col-xs-12">
                    <div class="text-center clearfix">
                      <button class="btn savie-common-btn" type="button" id="btn-cstmr-srvc-cnter"><fmt:message key="button.next" bundle="${msg}" /></button>
                   </div>
                </div>   
             </form>
         </div>
       </div>
	<!-- FOOTER -->
</div>

				<div class="application-flux customer-service">
					<div id="service-centre" class="container-fluid fwd-container page-application">
						<div class="fwd-container hidden-xs hidden-sm clearfix">
								<div class="breadcrumbs pull-left">
									<ol class="breadcrumb breadcrumbs-product-details breadcrumbs-landing">
										<li><a href="#"><fmt:message key="breadcrumb.savie.category" bundle="${msg}" /></a></li>
										<li class="divider"><i class="fa fa-play"></i></li>
										<li><a href="#"><fmt:message key="breadcrumb.savie.product" bundle="${msg}" /></a></li>
										<li class="divider last"><i class="fa fa-play"></i></li>
										<li class="active-bc"><fmt:message key="breadcrumb.savie.appointment" bundle="${msg}" /></li>
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
												<input type="text" class="date" name="preferred-date" id="preferred-date" value="${perferredDate }" readonly>
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
										    <p><a href="${list.map }" title="" class="et-btn-download-item" target="_blank"><fmt:message key="general.view.map" bundle="${msg}" /></a></p>
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
<!-- JS INCLUDES -->
<script type="text/javascript">
	var language = "en";















































































































	
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

<script src="<%=request.getContextPath()%>/resources/js/bootstrap-datepicker.min.js"></script>

<script>
	var startDate= new Date((new Date()).getTime() + 3*24*60*60*1000);
	var endDate= new Date((new Date()).getTime() + 24*24*60*60*1000);
	$(function() {
		//daysOfWeekDisabled: [0]
		$('#preferred-date').datepicker({
			format: "dd-mm-yyyy",
	var sFullDate= new Date();
	var eFullDate= new Date((new Date()).getTime() - 24*60*60*1000);
	$(document).ready(function() {
		var csCenter = $("#centre").val();
		var perferredDate = $("#preferred-date").val();
		var perferredTime = $("#preferred-time").val();
		if(csCenter == "" && perferredDate == "" && perferredTime == "") {
			//$('#fullyBooked').modal('show');
		}
		<%
		if(!result) {
		%>
		$('#full-date').datepicker({
		 	format: "dd-mm-yyyy",

			container: "#date",








			startDate: sFullDate,
			endDate: eFullDate,
			autoclose: true,
		}).on('changeDate', function (ev) {
		});
		<%
		}
		%>
		<%
		results = (Map)request.getAttribute("datesMap");
		if(results != null) {
			i = results.entrySet().iterator();         
			while(i.hasNext()){
				entry=(Map.Entry<String, List>)i.next();
		%>
		var data<%=entry.getKey()%>='<%=entry.getValue()%>';
		$('#preferred-date-<%=entry.getKey()%>').datepicker({
		 	format: "dd-mm-yyyy",
			container: "#date",

			startDate: startDate,
			endDate: endDate,
			autoclose: true
			autoclose: true,
			beforeShowDay:function(Date){
			    var curr_date = Date.toJSON().substring(0,10);
			    if (data<%=entry.getKey()%>.indexOf(curr_date)>-1){
			    	return false;        
			    }
			}
		}).on('changeDate', function (ev) {
			if(ev.date != null){
				$("#preferred-date-mirror").val($("#preferred-date").val().trim());
				$("#preferred-date-mirror").val($("#preferred-date-<%=entry.getKey()%>").val().trim());
				$("#preferred-date").val($("#preferred-date-<%=entry.getKey()%>").val().trim());
			}
			else{
				$('#preferred-date').datepicker('update', $("#preferred-date-mirror").val().trim());
			}
			if($("#centre").val().trim() != "" && $("#preferred-date").val().trim() != ""){
			if($("#centre").val().trim() != "" && $("#preferred-date-<%=entry.getKey()%>").val().trim() != ""){
				getTimeSlot('${perferredTime }');
			}
			else{
				$("#preferred-time").empty();
				$("#preferred-time").prepend("<option value=''></option>");
			}
		});
		



		<%
			}
		}
		%>
		$("#preferred-date-${csCenter}").show();
		var serviceCentreCode = '${csCenter }';
		//var perDate = '${perferredDate }';
		//$("#preferred-date").datepicker("setDate", perDate.split('-')[0] +'-'+ perDate.split('-')[1] + '-' + perDate.split('-')[2]);
		
		setCentre(serviceCentreCode);
		
		$('.centre-info').addClass('hidden');
		$('#centre-' + serviceCentreCode).removeClass('hidden');
		if($("#centre").val().trim() != "" && $("#preferred-date").val().trim() != ""){
		if($("#centre").val().trim() != "" && $("#preferred-date-" + serviceCentreCode).val().trim() != ""){


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
				    url:context+'/ajax/savings-evergreen-insurance/upsertAppointment',     
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
							    url:context+'/ajax/savings-evergreen-insurance/service-center-confirm/email',     
							    type:'get',
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
		    url:context+'/ajax/savings-evergreen-insurance/putTimeSession',     
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
       $(window).bind('scroll', function() {
          stickHeaderBrowse();
       });

       $('#preferred-date').datepicker({
          format: "dd-mm-yyyy",
          //format: 'yy-mm-dd',
          container: "#date",
          startDate: new Date(),
          autoclose: true
       });

       $('#centre').on('change', function() {
           var centre = $('#centre option:selected').val();
           setCentre(centre);
        });
       $('.selectDiv').find('span').remove();
       console.log($('.ui-select > #centre-button > span').text());
       $('#centre-button > span').remove();
       applicationCentre();
       function applicationCentre() {
          if(getWidth()>=992) {
             var inner_centre_html = $('#inline-centre').html();

             $('#inline-centre').addClass('hidden');
             $('#right-centre').append(inner_centre_html).removeClass('hidden');
             $('#inline-centre').html('');

          }
          else {
             var inner_centre_html = $('#right-centre').html();

             $('#inline-centre').append(inner_centre_html).removeClass('hidden');
             $('#right-centre').html('');
          }
       }
       
       
    $("#btn-cstmr-srvc-cnter").on('click', function(){
      	//window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow}';
      	
    	var csCenter = $("#centre").val();
		var perferredDate = $("#preferred-date").val();
		var perferredTime = $("#preferred-time").val();
		if(csCenter == "" && perferredDate == "" && perferredTime == "") {
			//$('#fullyBooked').modal('show');
		}else if(perferredTime == null || perferredTime.trim() == ""){
			//$('#perferredTimeIsNull').modal('show');
		}else{
			$.ajax({     
			    url:context+'/ajax/savings-insurance/upsertAppointment',
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
			    		$("#paymentForm").attr("action", '<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow}');
				    	$("#paymentForm").submit();
			    	}else if(data.errMsgs == "Access code has already been used"){
			    		//$('#accessCodeUsed').modal('show');
			    		console.log(data.errMsgs);
			    	}else if(data.errMsgs == "Reservation is invalid"){
			    		//$('#reservationInvalid').modal('show');
			    		console.log(data.errMsgs);
			    	}
			    }  
			});
		}
   	});
    
    function setCentre(centre){
    	<%
        ServiceCentreResponse serviceCentre = (ServiceCentreResponse)request.getAttribute("serviceCentre");
        if(serviceCentre.getServiceCentres().size() > 0) {
            for(ServiceCentreResult entity : serviceCentre.getServiceCentres()) {
        %>
        if(centre == '<%=entity.getServiceCentreCode() %>') {
           $('.centre-info').html('<img src="<%=request.getContextPath()%>/resources/images/savie/<%=entity.getPhoto() %>" class="img-centre img-responsive" /><h4>Address</h4><p class="centre-address"><%=entity.getAddress() %></p><a target="_blank" class="viewmap-link" href="<%=entity.getMap() %>"><fmt:message key="label.view.map" bundle="${msg}" /></a>');
        }
        <%
            }
        }
        %>
    }
</script>
		
