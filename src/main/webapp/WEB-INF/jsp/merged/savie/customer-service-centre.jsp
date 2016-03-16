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
	boolean isSaleActiveClass = false;
	boolean isEservicesActiveClass = false;
%>
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

<!-- JS INCLUDES -->
<script type="text/javascript">
	var language = "en";
	var getpath = "<%=request.getContextPath()%>";
	
	var startDate= new Date((new Date()).getTime() + 3*24*60*60*1000);
	var endDate= new Date((new Date()).getTime() + 24*24*60*60*1000);
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
			autoclose: true,
			beforeShowDay:function(Date){
			    var curr_date = Date.toJSON().substring(0,10);
			    if (data<%=entry.getKey()%>.indexOf(curr_date)>-1){
			    	return false;        
			    }
			}
		}).on('changeDate', function (ev) {
			if(ev.date != null){
				$("#preferred-date-mirror").val($("#preferred-date-<%=entry.getKey()%>").val().trim());
				$("#preferred-date").val($("#preferred-date-<%=entry.getKey()%>").val().trim());
			}
			else{
				$('#preferred-date').datepicker('update', $("#preferred-date-mirror").val().trim());
			}
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
		setCentre(serviceCentreCode);
		
		if($("#centre").val().trim() != "" && $("#preferred-date-" + serviceCentreCode).val().trim() != ""){
			getTimeSlot('${perferredTime }');
		}
	});
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
           $('.centre-info').html('<img src="<%=request.getContextPath()%>/resources/images/savie/<%=entity.getPhoto() %>" class="img-centre img-responsive" /><h4><fmt:message key="label.address" bundle="${msg}" /></h4><p class="centre-address"><%=entity.getAddress() %></p><a target="_blank" class="viewmap-link" href="<%=entity.getMap() %>"><fmt:message key="label.view.map" bundle="${msg}" /></a>');
        }
        <%
            }
        }
        %>
    }
</script>
