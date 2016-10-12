<%@page import="com.ifwd.fwdhk.model.PlanDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<script type="text/javascript">

  // personal or family
  var traveller;  
  
  // personal
  var personalTraveller = parseInt("${planDetails.totalPersonalTraveller}");
  // family
  var familyAdult = parseInt("${planDetails.totalAdultTraveller}");
  var familyChild = parseInt("${planDetails.totalChildTraveller}");
  var familyOther = parseInt("${planDetails.totalOtherTraveller}");
  var familyTraveller = parseInt(familyAdult) + parseInt(familyChild) + parseInt(familyOther);
 
//bmg inline variable
  var updateQuoteFlag = true;
  var tempPersonalTraveller = personalTraveller;
  var tempAdultTraveller = familyAdult;
  var tempChildTraveller = familyChild;
  var tempOtherTraveller = familyOther;

  var tempTotalTraveller = 0;
  if(personalTraveller>familyTraveller){
      tempTotalTraveller=personalTraveller;
  }else{
      tempTotalTraveller=familyTraveller;
  }
  //bmg inline variable
  
  perventRedirect=true;
  
  $(document).ready(function() {
		 // update quote area to show headcounts
	    if("${planDetails.planSelected}".toLowerCase() == "family"){
	        if (familyTraveller > 0){
	            $('#family_plan_desk_spinner').show();
	            $('#family_plan_btm_spinner').show();
	            $('#family_plan_mob_spinner').show();
	        } 
	        traveller = familyTraveller;
	    }else{
	      traveller = personalTraveller;
	    }
		 
		 // inline changes for 3 departure date and traveller numbers
	    $("#inline-change-1").click(function() {
	          $('#dp1').datepicker('show');
	    });
	    $("#inline-change-2").click(function() {
	         $('#dp2').datepicker('show');
	    });
	    $("#inline-change-3").click(function() {
	    	$(this).hide();
	    	$('#myFWDropdown .dropdown-toggle').toggleClass('disabled');
            $('#myFWDropdown').toggleClass('hide-html');
            $("#show-traveller").hide();
	    });

    });
  
  function submitPlan(){
	    $('#loading-overlay').modal({backdrop: 'static',keyboard: false});
	    
	    setTimeout(function(){
	    	if(chkClubMember()){
	            $("#frmFlightPlan").submit();
	        }else{
	            $('#loading-overlay').modal('hide');
	        }	    	
	    }, 500);
	}

  function chkClubMember() {
	    $(".errDue").html('');
	    var flag = true;        
	    var the_club_member_check_box = document.getElementById("the-club-member-toggle").checked;
	    var the_club_membership_no = document.getElementById("theClubMembershipNo").value; 
	    if (the_club_member_check_box) {
	        if (the_club_membership_no == "<fmt:message key="club.membership.number" bundle="${msg}" />" || the_club_membership_no == "" || /^\s*$/.test(the_club_membership_no)) {
	        	$("#errClubMemberID").html("<fmt:message key="club.member.empty" bundle="${msg}" />") ;
	            document.getElementById("theClubMembershipNo").focus();
	            $("#theClubMembershipNo").addClass("invalid-field");
	            
	            flag = false;
	        }else if (the_club_membership_no != ""){
                if(/^8/.test(the_club_membership_no) == false){
                    $("#errClubMemberID").html("<fmt:message key="club.member.firstdigit" bundle="${msg}" />") ;
                    document.getElementById("theClubMembershipNo").focus();
                    $("#theClubMembershipNo").addClass("invalid-field");
                    flag = false;
                }else if(/^[0-9]{10}$/.test(the_club_membership_no) == false){
                    $("#errClubMemberID").html("<fmt:message key="club.member.digitchk" bundle="${msg}" />") ;
                    document.getElementById("theClubMembershipNo").focus();
                    $("#theClubMembershipNo").addClass("invalid-field");
                    flag = false;                   
                }
            }
	    }
	    return flag;
	}  
  
  
  function updateFlightQuote() {
	  if(updateQuoteFlag){
		  $('#loading-overlay').modal({
              backdrop: 'static',
              keyboard: false
          })
          updateQuoteFlag = false;
          
          $('#lblCountDesk').html(tempTotalTraveller);
          $("#totalPersonalTraveller").val(tempPersonalTraveller);
          $("#totalAdultTraveller").val(tempAdultTraveller);
          $("#totalChildTraveller").val(tempChildTraveller);
          $("#totalOtherTraveller").val(tempOtherTraveller);
          
          $('#myFWDropdown').toggleClass('open');
          console.log($('#frmFlightPlan input').serialize());
	      $.ajax({
	          type : 'POST',
	          url : '<%=request.getContextPath()%>/updateFlightQuote',
	          data : $('#frmFlightPlan input').serialize(),
	          success : function(data) {
	        	  $('#loading-overlay').modal('hide');
	        	  updateQuoteFlag = true;
	        	  
	              var json = JSON.parse(data);
	              promoData = json;
	              $("#totalTravellingDays").val(json.totalDays);
	              $("#totalTravellingDaysSpan").html(json.totalDays);
	              $("#days").val(json.totalDays);
	          }
	      });
	  }
  }
</script>
<%
  String PersonalPlanChecked = "";
  String FamilyPlanChecked = "";
  String personalSpinnerStyle = "style='display:none'";
  String familySpinnerStyle = "style='display:none'";
  PlanDetails planDetails = (PlanDetails)request.getAttribute("planDetails");
    if(planDetails.getPlanSelected().equalsIgnoreCase("personal")){
      PersonalPlanChecked = "checked";
      personalSpinnerStyle = "style='display:block'";
    }
    else if(planDetails.getPlanSelected().equalsIgnoreCase("family")){
    FamilyPlanChecked = "checked";
      //personalSpinnerStyle = "style='display:none'";
      familySpinnerStyle = "style='display:block'";
    } 
%>

<!--/#main-Content-->
<section>
	<div id="cn" class="container">
		<div class="row">
			<form name="frmFlightPlan" id="frmFlightPlan" action="<%=request.getContextPath()%>/${language}/flight-insurance/user-details" method="post">
				<!-- <input type="hidden" name="totalAdultTraveller" id="totalAdultTraveller" value="${planDetails.getTotalAdultTraveller()}"> --> 
				<!-- <input type="hidden" name="totalChildTraveller" id="totalChildTraveller"value="${planDetails.getTotalChildTraveller()}"> -->
				<!-- <input type="hidden" name="totalOtherTraveller" id="totalOtherTraveller" value="${planDetails.getTotalOtherTraveller()}"> -->
				<!-- <input type="hidden" name="returnDate" id="returnDate" value="${planDetails.getReturnDate()}"> -->
				<!-- <input type="hidden" name="departureDate" id="departureDate"value="${planDetails.getDepartureDate()}"> -->
			    <input type="hidden" id="days" name="days" value="${days}">
			     <!-- <input type="hidden" name="travellerCount" value="${planDetails.getTravellerCount()}"> --> 
			     <input type="hidden" name="ToalDue" value="${flightQuoteDetails.toalDue}"> 
			     <!-- <input type="hidden" name="planSelected" value="${planDetails.getPlanSelected()}"> -->
			     
			


				<div class="container ">
					<div id="tr-steps" class="col-md-12 col-lg-12 col-sm-12 col-xs-12  shop-tracking-status">
						<div class="center wow fadeInDown animated" style="visibility: visible;">
							<h2><fmt:message key="flight.quote.jumbo" bundle="${msg}" /></h2>
						</div>
						<br>
						<div class="col-lg-12 col-md-12">
                            <div class="shop-tracking-status">
								<div class="order-status" style="margin-top: 30px;position: relative;margin-bottom: 30px;">
									<div class="order-status-timeline-new">
										<!--
										There can be n '.order-status-timeline-completion'
										dots-inactive and dots-active color the dots -->
										<div class="order-status-timeline-completion dots-inactive"></div>
										<div class="order-status-timeline-completion dots-inactive"></div>
										
									</div>
									<div
										class="image-order-status image-order-status-new active  img-circle">
										<div class="icon">1</div>
										<span class="status"><fmt:message key="flight.breadcrumb2.item1" bundle="${msg}" /></span>
									</div>
									<div
										class="image-order-status image-order-status-active img-circle">
										<div class="icon">2</div>
										<span class="status"><fmt:message key="flight.breadcrumb2.item2" bundle="${msg}" /></span>
									</div>
									<div
										class="image-order-status image-order-status-intransit img-circle">
										<div class="icon">3</div>
										<span class="status min-left"><fmt:message key="flight.breadcrumb2.item3" bundle="${msg}" /></span>
									</div>
								</div>
					        </div>
						</div>
					</div>
				</div>
                <ol class="breadcrumb pad-none">
                    <li><fmt:message key="flight.breadcrumb1.item1" bundle="${msg}" /><i class="fa fa-caret-right"></i></li>
                    <li><fmt:message key="flight.breadcrumb1.item2" bundle="${msg}" /> </li>
                    <li class="active "><i class="fa fa-caret-right"></i> <fmt:message key="flight.breadcrumb1.item3" bundle="${msg}" /></li>
                </ol>				
				<div class="container pad-none bdr ur-opt-content">
					<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 pad-none">
					   <div class="workingholiday-plan-margin form-wrap">
						<h2 class="h2-3-choose hidden-sm hidden-xs"><fmt:message key="flight.quote.choose" bundle="${msg}" /></h2>
						<%
							for (int planCount = 1; planCount <= 1; planCount++) {
						%>
						<div class="plan-box plan-box-flight">
							<div class="col-md-7 col-sm-6">
								<h2>
									<fmt:message key="flight.quote.plan" bundle="${msg}" /><br> 
								</h2>
							</div>
							<div class="col-md-5 col-sm-6">
								
								<h2>
									<%-- HK$ <br>
									<div class="flightcare-hk">${flightQuoteDetails.getToalDue()}
									</div> --%>
									<fmt:message key="flight.quote.price" bundle="${msg}" />
									<br> <span><fmt:message key="flight.quote.price.desc" bundle="${msg}" /></span>
								</h2>
							</div>
							<div class="clearfix"></div>
							
						</div>

						<!--Full coverage -->
                        <div class="fwdpanel">
                            <div class="fwdpanel-heading">
                                <h4 class="fwdpanel-title h4-4-full">
                                    <%
                                        }
                                    %>
                                    <span><a href="#" class="fwdpanel-minimize"><i
                                            class="fa fa-plus"></i> <fmt:message key="flight.quote.fullDetails.heading" bundle="${msg}" /> </a> </span>
                                </h4>
                            </div>
                            <div class="fwdpanel-body" style="display: none;">
                                <div class="row">
                                    <div class="col-md-12">
                                        <h4 class="h4-3-b"><fmt:message key="flight.quote.fullDetails.keyFeature" bundle="${msg}" /></h4>
                                        <ol class="major-exc">
                                            <li><fmt:message key="flight.quote.fullDetails.keyFeature.desc1" bundle="${msg}" /></li>
                                            <li><fmt:message key="flight.quote.fullDetails.keyFeature.desc2" bundle="${msg}" /></li>
                                            <li><fmt:message key="flight.quote.fullDetails.keyFeature.desc3" bundle="${msg}" /></li>
                                            
                                        </ol>
                                        <br>
                                        <h4 class="h4-3-b"><fmt:message key="flight.quote.fullDetails.eligibility" bundle="${msg}" /></h4>
                                         <ul class="major-exc">
                                            <li><fmt:message key="flight.quote.fullDetails.eligibility.desc1" bundle="${msg}" /></li>
                                            <li><fmt:message key="flight.quote.fullDetails.eligibility.desc2" bundle="${msg}" /></li>
                                        </ul>
                                    </div>
                                    <!-- / col-md-12 -->
                                </div>
                                <!-- /row -->
                            </div>

                        </div>
                        
                        <!--Full coverage end -->
                        <h4 class="h4-3-b"><fmt:message key="flight.quote.other.tnc" bundle="${msg}" /></h4>
                        <ol class="major-exc">
                            <li><fmt:message key="flight.quote.other.tnc.desc1" bundle="${msg}" /></li>
                            <li><fmt:message key="flight.quote.other.tnc.desc2" bundle="${msg}" /></li>
                            <li><fmt:message key="flight.quote.other.tnc.desc3" bundle="${msg}" /></li>
                            <li><fmt:message key="flight.quote.other.tnc.desc4" bundle="${msg}" /></li>
                            <li><fmt:message key="flight.quote.other.tnc.desc5" bundle="${msg}" /></li>
                            <li><fmt:message key="flight.quote.other.tnc.desc6" bundle="${msg}" /></li>
                        </ol>
                        <br>
                        </div>
					</div>
					<div class="col-lg-4 col-md-4 gray-bg col-sm-12 col-xs-12 pad-none">
					   <div class="hidden-sm hidden-xs">
							<div class="wd2">
								<div class="pull-left" style="width:150px;">
									<h2 class="h2-3-choose" style="padding-left:0px;font-size: 24px;"><fmt:message key="flight.quote.summary.product" bundle="${msg}" /></h2>
									<h4 style="padding-left:0px;line-height: 0px;font-size: 16px;"><fmt:message key="flight.quote.summary.desc" bundle="${msg}" /> </h4>
								</div>
								<div class="pull-right" style="padding-top: 45px;">
									<div class="text-left pad-right1 h2-2 h2" style="margin-top:0px;margin-bottom:0px;">
										<div class="hk" style="font-size: 18px;">
											<!-- HK$ -->
											<div style="font-weight: bold;font-size: 28px;" class="flightcare-hk">
												<%-- ${flightQuoteDetails.getToalDue()} --%>
												&nbsp;
											</div>
										</div>
									</div>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="clearfix"></div>
							<div class="orange-bdr"></div>
							<div class="form-container" style="padding: 0px !important;">
							  <div style="width: 80%;margin-left: 10%;">
							  <!-- departure date start -->
								<!-- <h3><fmt:message key="flight.quote.summary.option1" bundle="${msg}" /> <span class="span2 uline">
									<a href="${pageContext.request.contextPath}/${language}/flight-insurance"><fmt:message key="flight.details.summary.change" bundle="${msg}" /></a></span>
								</h3>
								
								 <div class="form-group">
									<div class="input-group wd2">
										<input name="departureDate" type="text" class="datepicker form-control bcg-trans"
											value='<c:out value="${planDetails.getDepartureDate()}"/>'readonly>
											 
									</div>
								</div> -->
								<h3><fmt:message key="flight.quote.summary.option1" bundle="${msg}" />
								
								<!-- <span class="span2 uline">
	                                <a id="inline-change-1" class="inline-change"><fmt:message key="flight.details.summary.change" bundle="${msg}" /></a></span> -->
	                                
	                            </h3>
	                            
								<!-- <div class="input-group date bmg-flight-inline-dp1" id="dp1"> <span class="input-group-addon in border-radius"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
				                  <input name="departureDate" type="text" class="datepicker form-control border-radius" id="txtStartDateDesk" onblur="chkValidFlightDepartureDate(this, 'startDateDeskIn', '');" value="${planDetails.getDepartureDate()}" readonly>
				                </div> -->
				                
				                <div class="input-group date"> <span class="input-group-addon in border-radius"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
	                              <input name="departureDate" type="text" class="datepicker form-control border-radius" value="${planDetails.departureDate}" readonly>
	                            </div>
				               <!-- departure date end  -->
				               <!-- return date start  -->
								<!-- <h3><fmt:message key="flight.quote.summary.option2" bundle="${msg}" /> <span class="span2 uline">
									<a href="${pageContext.request.contextPath}/${language}/flight-insurance"><fmt:message key="flight.details.summary.change" bundle="${msg}" /></a></span></h3>
									<div class="form-group">
										<div class="input-group wd2">
											<input type="text" class="datepicker form-control bcg-trans"
												value="<c:out value="${planDetails.getReturnDate()}"/>"
												readonly>
										</div>
									</div> -->
									 
							  <h3><fmt:message key="flight.quote.summary.option2" bundle="${msg}" />
							  
							  <!-- <span class="span2 uline">
	                                <a id="inline-change-2" class="inline-change"><fmt:message key="flight.details.summary.change" bundle="${msg}" /></a></span> -->
	                                
	                                </h3>
							  
	                              <!-- <div class="input-group date bmg-flight-inline-dp2" id="dp2"> <span class="input-group-addon in"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt="calendar"></span></span>
							        <input type="text" name="returnDate" class="datepicker form-control" id="txtEndDateMob" onblur="chkValidFlightDate(this, 'endDateMobIn', 'Return Date', 'txtStartDateMob', 'startDateMobIn', '');" value="${planDetails.getReturnDate()}" readonly>
							      </div> -->
							      
							      <div class="input-group date"> <span class="input-group-addon in"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt="calendar"></span></span>
	                                <input type="text" name="returnDate" class="datepicker form-control" value="${planDetails.returnDate}" readonly>
	                              </div>
	                              
								<!-- return date end  -->
								
	                            
	                            <!--
	                            <div class="form-group">
									
										<c:if test="${planDetails.getTotalAdultTraveller() !=0 }">Parent :${planDetails.getTotalAdultTraveller()},</c:if>
										<c:if test="${planDetails.getTotalChildTraveller() !=0 }">Child :${planDetails.getTotalChildTraveller()}, </c:if>
										<c:if test="${planDetails.getTotalOtherTraveller() !=0}">Others :${planDetails.getTotalOtherTraveller()}</c:if>
										<c:if test="${planDetails.getTravellerCount() !=0}"> Travellers :${planDetails.getTravellerCount()}</c:if>
									
								</div>
								-->
								<!-- stay days starts -->
								<div id="numOfDays">
	                                <fmt:message key="flight.quote.summary.option4" bundle="${msg}" /> <span id="totalTravellingDaysSpan">${days}</span> 
	                                <fmt:message key="flight.quote.summary.option5" bundle="${msg}" />
	                            </div>
	                            <!-- stay days ends -->
								<!-- traveller start -->
								<h3><fmt:message key="flight.quote.summary.option3" bundle="${msg}" />
								
								<!-- <span class="span2 uline">
	                                <a id="inline-change-3" class="inline-change"><fmt:message key="flight.details.summary.change" bundle="${msg}" /></a></span> -->
	                                
	                            </h3>
	                            
	                            <span class="text-grey" id="loadingUpdate" style="display:none;"><fmt:message key="loading.text" bundle="${msg}" /></span>
	                            
	                            <!-- bmg inline change 
	                            <div class="dropdown  form-group drop-down wh-bg input-group-div marg-b2 dropup hide-html" id="myFWDropdown">
	                              <a class="dropdown-toggle col-lg-12 col-md-12 disabled" data-toggle="dropdown">  <label class="select-label"><fmt:message key="flight.main.quote.plan1.type" bundle="${msg}" />:</label>&nbsp;<label id="lblCountDesk"></label> <i class="fa fa-caret-down pull-right"></i> </a>
	                              <div class="dropdown-menu bdr1">
	                                <div class="drop-content">
	                                  <div class="col-lg-6">
	                                    <label class="radio radio-warning radio-inline">
	                                      <input type="radio" name="planSelected" id="personal_plan_inline" data-id="desk" class="plan flight-inline-plan" value="personal"  <%=PersonalPlanChecked%> >
	                                      <label for="personal_plan_inline"><fmt:message key="flight.main.quote.plan1" bundle="${msg}" /> </label>
	                                     </label> 
	                                  </div>
	                                  <div class="col-lg-6">
	                                   <label class="radio radio-warning radio-inline">
	                                      <input type="radio" name="planSelected" id="family_plan_inline" data-id="desk" class="plan flight-inline-plan" value="family" <%=FamilyPlanChecked %>>
	                                      <label for="family_plan_inline"><fmt:message key="flight.main.quote.plan2" bundle="${msg}" /> </label>
	                                      </label>
	                                  </div>
	                                  <div class="clearfix"></div>
	                                  <hr>
	                                  <div class="plan_spinner_desk" id="personal_plan_inline_spinner" <%=personalSpinnerStyle%>>
	                                    <div class="col-lg-6">
	                                      <h4><fmt:message key="flight.main.quote.plan1.type" bundle="${msg}" /> </h4>
	                                    </div>
	                                    <div class="col-lg-6">
	                                      <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
	                                        <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number flight-inline-btn-number" data-type="minus" data-field="txtTravellersInline" data-parent="personal"> <span class="glyphicon glyphicon-minus"></span> </button>
	                                        </span>
	                                        <div class="text-center drop-down-plus wd4 input-number">${planDetails.getTotalPersonalTraveller()}</div>
	                                        <span class="input-group-btn data-up ">
	                                        <button class="btn btn-default btn-info drop-down-bg btn-new btn-number flight-inline-btn-number" data-type="plus" data-field="txtTravellersInline" data-parent="personal"> <span class="glyphicon glyphicon-plus"></span> </button>
	                                        </span> </div>
	                                    </div>
	                                  </div>
	                                  <div class="clearfix"></div>
	                                  
	                                  <div class="plan_spinner_desk" id="family_plan_inline_spinner" <%=familySpinnerStyle%>>
	                                    <div class="col-lg-6">
	                                      <h4><fmt:message key="flight.main.quote.plan2.type1" bundle="${msg}" /> </h4>
	                                    </div>
	                                    <div class="col-lg-6">
	                                      <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
	                                        <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number flight-inline-btn-number" data-type="minus" data-field="txtAdultsInline" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
	                                        </span>
	                                        <div class="text-center drop-down-plus wd4 input-number">${planDetails.getTotalAdultTraveller()}</div>
	                                        <span class="input-group-btn data-up ">
	                                        <button class="btn btn-default btn-info drop-down-bg btn-new btn-number flight-inline-btn-number" data-type="plus" data-field="txtAdultsInline" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
	                                        </span> </div>
	                                    </div>
	                                    <div class="clearfix"></div>
	                                    <div class="col-lg-6">
	                                      <h4><fmt:message key="flight.main.quote.plan2.type2" bundle="${msg}" /></h4>
	                                    </div>
	                                    <div class="col-lg-6">
	                                      <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
	                                        <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number flight-inline-btn-number" data-type="minus" data-field="txtChildInline" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
	                                        </span>
	                                        <div class="text-center drop-down-plus wd4 input-number">${planDetails.getTotalChildTraveller()}</div>
	                                        <span class="input-group-btn data-up ">
	                                        <button class="btn btn-default btn-info drop-down-bg btn-new btn-number flight-inline-btn-number" data-type="plus" data-field="txtChildInline" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
	                                        </span> </div>
	                                    </div>
	                                    <div class="clearfix"></div>
	                                    <div class="col-lg-6">
	                                      <h4><fmt:message key="flight.main.quote.plan2.type3" bundle="${msg}" /></h4>
	                                    </div>
	                                    <div class="col-lg-6">
	                                      <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
	                                        <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number flight-inline-btn-number" data-type="minus" data-field="txtOtherInline" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
	                                        </span>
	                                        <div class="text-center drop-down-plus wd4 input-number">${planDetails.getTotalOtherTraveller()}</div>
	                                        <span class="input-group-btn data-up ">
	                                        <button class="btn btn-default btn-info drop-down-bg btn-new btn-number flight-inline-btn-number" data-type="plus" data-field="txtOtherInline" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
	                                        </span> </div>
	                                    </div>
	                                    <div class="col-lg-12 child-notes">
				                            <h4><fmt:message key="flight.main.quote.childnotes" bundle="${msg}" /></h4>
				                        </div>
	                                  </div>
	                                  
	                                  <div class="clearfix"></div>
	                           
			                           <hr>
			                           
			                           <div class="col-lg-5 col-md-5">
			                                <div class="btn-confirm-inline-change pointer" onclick="updateFlightQuote()"><span><fmt:message key="travel.action.apply" bundle="${msg}" /></span></div>
			                           </div>
	                                  <div class="clearfix"></div>
	                                </div>
	                              </div>
	                              <div class="clearfix"></div>
	                            </div>
	                            -->
	                            
	                            <input type="hidden" name="totalPersonalTraveller" data-min="1" data-max="15" id="txtTravellersInline" value="${planDetails.totalPersonalTraveller}"/>
	                            <input type="hidden" name="" id="family_desk_count" value="${planDetails.totalFamilyTravellers}">
	                            <input type="hidden" name="totalAdultTraveller" id="txtAdultsInline" data-min="1" data-max="2" value="${planDetails.totalAdultTraveller}"/>
	                            <input type="hidden" name="totalChildTraveller" id="txtChildInline" data-min="1" data-max="14" value="${planDetails.totalChildTraveller}"/>
	                            <input type="hidden" name="totalOtherTraveller" id="txtOtherInline" data-min="0" data-max="14" value="${planDetails.totalOtherTraveller}"/>
	                            
	                            <div id="show-traveller" class="form-group likeDatePicker bcg-trans">
	                                <div class="input-group wd2 datepicker form-control" style="width:100% !important;margin: 0px !important;"> 
	                                <%-- <input type="text" class="datepicker form-control" value=" --%>
	                                <c:if test="${planDetails.totalAdultTraveller !=0 }"><fmt:message key="flight.sidebar.summary.label.family.parent" bundle="${msg}" />: ${planDetails.totalAdultTraveller} <br></c:if>
	                                <c:if test="${planDetails.totalChildTraveller !=0 }"><fmt:message key="flight.sidebar.summary.label.family.child" bundle="${msg}" />: ${planDetails.totalChildTraveller} <br></c:if>
	                                <c:if test="${planDetails.totalOtherTraveller !=0}"><fmt:message key="flight.sidebar.summary.label.family.others" bundle="${msg}" />: ${planDetails.totalOtherTraveller} <br></c:if>
	                                <c:if test="${planDetails.totalPersonalTraveller !=0}"><fmt:message key="flight.sidebar.summary.label.personal" bundle="${msg}" />: ${planDetails.totalPersonalTraveller}</c:if><!-- readonly> --> 
	                                    
	                            </div>
	                            </div>
	                            <!-- traveller end -->
								
								
								</div>
							</div>
	
							<!-- <h3 class="h4-1-orange-b col-lg-6 col-md-6">Amount due </h3> -->
							<%-- <h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right">
								&nbsp;
								${flightQuoteDetails.getToalDue()}
							</h3> --%>
						</div>
						<div class="col-xs-12 pad-none">
                          <div style="width: 80%;margin-left: 10%;">
                            <br>
                            <div class="checkbox" style="margin-top: 0; margin-bottom: 20px; font-size: 14px;">
                              <input type="checkbox" id="the-club-member-toggle" name="hasTheClubMembershipNo" /> <label for="the-club-member-toggle"><a class="sub-link" href="" data-toggle="modal" data-target=".bs-theclub-modal-lg"><img src="<%=request.getContextPath()%>/resources/images/partner_theclub.png" height="12" /> <fmt:message key="club.membership.confirm" bundle="${msg}" /></a></label>
                            </div>
                            <span class="text-red" id="errClubMemberID"></span>
                            <div class="form-group" style="margin-top: 0; margin-bottom: 20px; display: none;">
                                <div class="input-group" style="display:inital; width:100%;">
                                    <input type="text" id="theClubMembershipNo" name="theClubMembershipNo" class="form-control bmg_custom_placeholder" style="display:inline-block;width:100%;" onfocus="placeholderOnFocus(this,'<fmt:message key="club.membership.number" bundle="${msg}" />');" onblur="placeholderOnBlur(this,'<fmt:message key="club.membership.number" bundle="${msg}" />');" value="<fmt:message key="club.membership.number" bundle="${msg}" />" />
                                </div>
                            </div>
                          </div>
                        </div>
                        <div class="hidden-sm hidden-xs">
	                        <div class="clearfix"></div>
	                        <div class="orange-bdr"></div>
						</div>
						<div class="col-xs-12 hidden-sm hidden-xs pad-none">
	                          <div style="width: 80%;margin-left: 10%;">
	                            <div class="top35 pull-left pad-none" style="width:47%">
	                                <a class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;BackMe();"><fmt:message key="flight.details.action.back" bundle="${msg}" /> </a>
	                            </div>
	                            <div class="top35 pull-right pad-none" style="width:47%">
	                                <c:choose>
	<c:when test="${language=='en'}">
	<input type="button" class="bdr-curve btn btn-primary nxt-btn" onclick="javascript:kenshoo_conv('Registration_Step1','','','Regis_Flight_Step1 EN','USD');perventRedirect=false;submitPlan();" Value="<fmt:message key="flight.details.action.next" bundle="${msg}" />" />
	</c:when>
	<c:otherwise>
	<input type="button" class="bdr-curve btn btn-primary nxt-btn" onclick="javascript:kenshoo_conv('Registration_Step1','','','Regis_Flight_Step1 ZH','USD');perventRedirect=false;submitPlan();" Value="<fmt:message key="flight.details.action.next" bundle="${msg}" />" />
</c:otherwise>
</c:choose>
	                                
	                                
	                            </div>
	                            <div class="clearfix"></div>
	                            <div class="col-xs-14"><span class="text-red errDue"></span></div>
	                            <br>  <br>
	                        </div>
	                    </div>



						<!--       <h3 class="back-to-travel col-lg-6 col-md-6 text-right"><a href="flight.html">Back to travel</a> </h3>
            <div class="col-lg-6 col-md-6 text-right"> <a href="flight-plan-details.html" class="bdr-curve btn btn-primary nxt-btn ">Next</a> </div>-->
						<div class="col-xs-12 hidden-sm hidden-xs pad-none">
						  <div class="clearfix"></div>
						  <br> <br>
						</div>
					</div>
					<!-- dummy -->
					<span id="divPersonsDesk"></span>
					<span id="lblDaysDesk" style="display: none"></span>
					<div id="quote-wrap" class="clearfix"></div>
				</div>
				
				<p class="padding1 workingholiday-plan-disclaimer">
				<fmt:message key="flight.quote.other.disclaimer.part1" bundle="${msg}" /> <a class="sub-link"
						href="https://home.fwd.com.hk/gidoc/policyprovisions/FlightCare_JacketLatest.pdf"
						target="_blank"><fmt:message key="flight.quote.other.disclaimer.part2" bundle="${msg}" /></a> <fmt:message key="flight.quote.other.disclaimer.part3" bundle="${msg}" /> <br>
                        <fmt:message key="flight.quote.other.disclaimer.part4" bundle="${msg}" />
					</p>
					
					<!--mob-#bottom-->					
					<div class="col-xs-12 hidden-md hidden-lg pad-none">
					   <div style="width: 80%;margin-left: 10%;margin-bottom: 40px;">
					        <div class="top35 pull-left pad-none" style="width:47%">
	                            <!-- <a href="${pageContext.request.contextPath}/${language}/flight-insurance" onclick="perventRedirect=false;" class="bdr-curve btn btn-primary bck-btn">
	                                <fmt:message key="flight.details.action.back" bundle="${msg}" /> 
	                            </a> -->
	                            
	                            <a class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;BackMe();"><fmt:message key="flight.details.action.back" bundle="${msg}" /> </a>
	                        </div>
	                        <div class="top35 pull-right pad-none" style="width:47%">
	                            <c:choose>
	<c:when test="${language=='en'}">
	<input type="button" class="bdr-curve btn btn-primary nxt-btn" onclick="javascript:kenshoo_conv('Registration_Step1','','','Regis_Flight_Step1 EN','USD');perventRedirect=false;submitPlan();" Value="<fmt:message key="flight.details.action.next" bundle="${msg}" />" />
	</c:when>
	<c:otherwise>
	<input type="button" class="bdr-curve btn btn-primary nxt-btn" onclick="javascript:kenshoo_conv('Registration_Step1','','','Regis_Flight_Step1 ZH','USD');perventRedirect=false;submitPlan();" Value="<fmt:message key="flight.details.action.next" bundle="${msg}" />" />
</c:otherwise>
</c:choose>
	                            
	                            
	                        </div>
					        <div class="clearfix"></div>
					    </div>
					</div>
					<!--/mob-#bottom-->
			</form>
		</div>
		<!--/.row-->
	</div>
	<!--/.container-->
</section>

<!--/end- Main Content-->


<!--Get promotion code popup-->
<div class="modal fade bs-promo-modal-lg " tabindex="-1" role="dialog"
	aria-hidden="true" style="display: none;">
	<div class="modal-dialog modal-lg">
		<div class="modal-content plan-modal">
			<div class="login-form" id="sendmailofpromocode">
				<form>
					<div class="form-container">
						<h2><fmt:message key="promotion.get.code" bundle="${msg}" /></h2>
						<h4><fmt:message key="promotion.get.code.email" bundle="${msg}" /></h4>
						<div class="form-group">
							<input type="email" class="form-control" placeholder=""
								name="emailToSendPromoCode" id="emailToSendPromoCode">
								
								
								
						</div>
						<span id="errPromoEmail" class="text-red"></span> <br>
						<div class="row">
							<div class="col-lg-6 col-md-6">
								<a class="bdr-curve btn btn-primary btn-lg wd5" href="#"
									onclick="return sendEmail()"><fmt:message key="promotion.get.code.action" bundle="${msg}" /></a>
							</div>
							<div class="col-md-2">
								<br>
							</div>
							<div class="col-lg-4 col-md-4">
								<!-- <a class="bdr-curve btn btn-primary btn-lg promo-pop-close wd5" href="#" data-dismiss="modal">Close </a>  -->
							</div>
							<br> <br>
							<div class="col-lg-12 col-md-12">
								<p><fmt:message key="promotion.get.code.disclaimer" bundle="${msg}" /></p>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!--/ Get promotion code popup-->

<!-- The Club Membership popup -->
<div class="modal fade bs-theclub-modal-lg " tabindex="-1" role="dialog"  aria-hidden="true" style="display: none;" >
    <div class="modal-dialog modal-lg">
        <div class="modal-content plan-modal">
            <div class="login-form">
                <div style="overflow: hidden;"><a id="getPromotionClose" class="close" aria-label="Close" data-dismiss="modal">
                    <span aria-hidden="true" style="font-size:30px;">×</span>
                    </a>
                </div>
                <div class="form-container">
                    <div class="row">
                        <div class="col-xs-12">   
                            <p><fmt:message key="flight.club.membership.pop.up" bundle="${msg}" /><fmt:message key="partner.the.club.3x.period" bundle="${msg}" /></p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <p><a href="<fmt:message key="theclub.register.link" bundle="${msg}" />" target="_blank"><fmt:message key="club.membership.join" bundle="${msg}" /></a></p>             
                        </div>
                    </div>
                </div>
            </div>        
        </div>
    </div>
</div>
<!--/ The Club Membership popup -->

<div class="scroll-to-top">
    <a title="Scroll to top" href="#">
        <img src="<%=request.getContextPath()%>/resources/images/up-arrow.png" alt="Scroll to top"  />
    </a>
</div>


<script type="text/javascript">
	function sendEmail() {
		if (get_promo_val()) {
			console.log($("#sendmailofpromocode form").serialize());
			$.ajax({
				type : "POST",
				url : "<%=request.getContextPath()%>/sendEmail",
				data : $("#sendmailofpromocode form").serialize(),
				async : false,
				success : function(data) {
					console.log(data);
					if (data == 'success') {
					} else {
						console.log(data);
					}

				},
				error : function() {
				}
			});
		}
		return false;
	}
   $(document).ready(function() {
        $('#the-club-member-toggle').on('change', function() {
            if ($(this).is(':checked')) {
                $('#theClubMembershipNo').closest('.form-group').show();
            } else {
                $('#theClubMembershipNo').closest('.form-group').hide();
            }
        }).change();
    });
</script>