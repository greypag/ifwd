<%
//	session = request.getSession();
//	String uatAuth = (String) session.getAttribute("uatAuth");
//	//System.out.println("uatAuth " + uatAuth);
//	if (uatAuth == null)
//		response.sendRedirect(request.getContextPath() + "/uatAuth");
%>





<%@page import="com.ifwd.fwdhk.model.TravelQuoteBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<!--   Main Content-->
<%
	TravelQuoteBean sessTravelQuoteBean = (TravelQuoteBean) session.getAttribute("corrTravelQuote");
	if( sessTravelQuoteBean != null ) {
		//System.out.println("------------------------------------------------------------");		
		//System.out.println( "sess Personal: " + sessTravelQuoteBean.getTotalPersonalTraveller() );
		//System.out.println( "sess Adult   : " + sessTravelQuoteBean.getTotalAdultTraveller() );
		//System.out.println( "sess Child   : " + sessTravelQuoteBean.getTotalChildTraveller() );
		//System.out.println( "sess Others  : " + sessTravelQuoteBean.getTotalOtherTraveller() );
		//System.out.println("------------------------------------------------------------");
	}
	else {
		//System.out.println("default session TravelQuote");
	}
%>
<script type="text/javascript">
  // personal or family
  var traveller;  
  // personal
  var personalTraveller = parseInt("${corrTravelQuote.getTotalPersonalTraveller()}");
  // family
  var familyAdult = "${corrTravelQuote.getTotalAdultTraveller()}";
  var familyChild = "${corrTravelQuote.getTotalChildTraveller()}";
  var familyOther = "${corrTravelQuote.getTotalOtherTraveller()}";  
  var familyTraveller = parseInt(familyAdult) + parseInt(familyChild) + parseInt(familyOther);
  
  var t1 = "${corrTravelQuote.getTotalAdultTraveller()}";
  var t2 = "${corrTravelQuote.getTotalChildTraveller()}";
  var t3 = "${corrTravelQuote.getTotalOtherTraveller()}";  
    
    function reset_desktop_submit()
    {        
     if(document.getElementById("family_plan_desk").checked)
     {
         $('#txtTravellersDesk').val(0);
     }
     else if (document.getElementById("personal_plan_desk").checked)
     {
         $('#txtAdultsDesk').val(0);
         $('#txtOtherDesk').val(0);
         $('#txtChildDesk').val(0);
     }
     
     var frm = document.getElementById("frmTravelGetQuote");
    }  
 
 function reset_mobile_submit()
 {        
  if(document.getElementById("family_plan_mob").checked)
  {
      $('#txtTravellersMob').val(0);
  }
  else if (document.getElementById("personal_plan_mob").checked)
  {
      $('#txtAdultsMob').val(0);
      $('#txtOtherMob').val(0);
      $('#txtChildMob').val(0);
  }
  
  var frm = document.getElementById("frmTravelGetQuote");
 }  
 
 function reset_bottom_submit()
 {        
  if(document.getElementById("family_plan_btm").checked)
  {
      $('#txtTravellersBtm').val(0);
  }
  else if (document.getElementById("personal_plan_btm").checked)
  {
      $('#txtAdultsBtm').val(0);
      $('#txtOtherBtm').val(0);
      $('#txtChildBtm').val(0);
  }
  
  var frm = document.getElementById("frmTravelGetQuote");
 }
    
</script>
<!-- Start fixed header -->
<script type='text/javascript'>
$(document).ready(function() {
    $(".navbar-inverse").addClass("product-header");
    
    // update quote area to show headcounts
    if("${corrTravelQuote.getPlanSelected()}".toLowerCase() == "family"){
    	if (familyTraveller > 0){
            $('#family_plan_desk_spinner').show();
            $('#family_plan_btm_spinner').show();
            $('#family_plan_mob_spinner').show();
        }
        traveller = familyTraveller;
     }else{
       traveller = personalTraveller;
     }
});
</script>
<!-- End fixed header -->
<%

	

    String PersonalPlanChecked = "";
  String FamilyPlanChecked = "";
  String personalSpinnerStyle = "";
  String familySpinnerStyle = "style='display:none'";
  if( sessTravelQuoteBean != null ) {
	  //System.out.println(sessTravelQuoteBean.getPlanSelected());
	    if(sessTravelQuoteBean.getPlanSelected().equalsIgnoreCase("personal")){
	      PersonalPlanChecked = "checked";
	    }
	    else if(sessTravelQuoteBean.getPlanSelected().equalsIgnoreCase("family")){
	      
	      FamilyPlanChecked = "checked";
	      personalSpinnerStyle = "style='display:none'";
	      familySpinnerStyle = "";
	    } 
	    //System.out.println(familySpinnerStyle);
	    //System.out.println(personalSpinnerStyle);
  }
%>
<section id="main-slider" class="no-margin"> 
  <!--Mobilebanner--> 
  <img src="<%=request.getContextPath()%>/<fmt:message key="travel.hero.image.mobile" bundle="${msg}" />" alt="" class="img-responsive hidden-lg hidden-md"  /> 
  <!--Mobilebanner-->
<div class="carousel slide hidden-xs hidden-sm">
<div class="carousel-inner">
<div class="item active">

<!--/#middle-->
        <img src="<%=request.getContextPath()%>/<fmt:message key="travel.hero.image" bundle="${msg}" />" alt=""  />
         </div>
      <!--/.item--> 
    </div>
    <!--/.carousel inner--> 
  </div>
  <!--/.carousel--> 
  <form name="frmTravelGetQuote" id="frmTravelGetQuote" commandName="travelQuote" action="<%=request.getContextPath()%>/${language}/travel-insurance/quote" method="post" onsubmit="return flightValidateDeskTravel();">
	<section id="middle" class="hidden-sm hidden-xs">
	  <div class="container">
	    <div class="row">
	      <div class="col-lg-12 col-md-12 pad-none slide-form">
	        <!-- <h2><fmt:message key="travel.main.quote.top.heading" bundle="${msg}" /></h2> -->
	                <table class="table activation-form3">
	              <tbody>
	                <tr class="hide-html">
	                  <td><h3><fmt:message key="travel.main.quote.q1" bundle="${msg}" /></h3></td>
	                  <td><h3><fmt:message key="travel.main.quote.q2" bundle="${msg}" /></h3></td>
	                  <td><h3><fmt:message key="travel.main.quote.q3" bundle="${msg}" /></h3></td>
	                  <td><div id="divPersonsDesk" style="visibility:hidden;">
	                   <h3 class="h3-i">
	                      <label id="lblPeopleDesk">0</label>
	                    <fmt:message key="travel.main.quote.total.people" bundle="${msg}" />
	                      <label id="lblDaysDesk">0</label>
	                    <fmt:message key="travel.main.quote.total.days" bundle="${msg}" /></h3>
	                  </div></td>
	                </tr>
	                  <tr>
	                  <td class="col-md-3 pad-none">
	                    <div class="input-group date" id="dp1"> <span class="input-group-addon in border-radius"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
	                      <input name="trLeavingDate" type="text" class="datepicker form-control border-radius" id="txtStartDateDesk" value="${corrTravelQuote.getTrLeavingDate()}" placeholder="<fmt:message key="flight.main.quote.q1" bundle="${msg}" />" readonly>
	                    </div>
	                    </td>
	                  <td class="col-md-3 pad-none">
	                    <div class="input-group date" id="dp2"> <span class="input-group-addon in border-radius"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
	                      <input name="trBackDate" type="text" class="datepicker form-control border-radius" id="txtEndDateDesk" value="${corrTravelQuote.getTrBackDate()}" placeholder="<fmt:message key="flight.main.quote.q2" bundle="${msg}" />" readonly>
	                    </div>
	                    </td>
	                  <td class="col-md-3 pad-none">
	                    <div class="dropdown  form-group drop-down wh-bg input-group-div marg-b2 dropup" id="myFWDropdown">
	                      <a href="#" class="dropdown-toggle col-lg-12 col-md-12" data-toggle="dropdown"> <label class="select-label"><fmt:message key="flight.main.quote.plan1.type" bundle="${msg}" />:</label> <label id="lblCountDesk"></label>&nbsp; <i class="fa fa-caret-down pull-right"></i> </a>
	                      <div class="dropdown-menu bdr1">
	                        <div class="drop-content">
	                          <div class="col-lg-6 col-md-6">
	                            <label class="radio radio-warning radio-inline">
	                              <input type="radio" name="planSelected" id="personal_plan_desk" data-id="desk" class="plan" value="personal"  <%=PersonalPlanChecked%> >
	                              <label for="personal_plan_desk"><fmt:message key="travel.main.quote.plan1" bundle="${msg}" /></label></label>
	                          </div>
	                          <div class="col-lg-6 col-md-6">
	                            <label class="radio radio-warning radio-inline">
	                              <input type="radio" name="planSelected" id="family_plan_desk" data-id="desk" class="plan" value="family" <%=FamilyPlanChecked %>>
	                            <label for="family_plan_desk"><fmt:message key="travel.main.quote.plan2" bundle="${msg}" /></label></label>
	                          </div>
	                          <div class="clearfix"></div>
	                          <hr>
	                          <!-- start of personal plan bottom spinner-->
	                       <input type="hidden" name="familyPlan" id="family_desk_count" value="${corrTravelQuote.getTotalFamilyTravellers()}">
	                       <div class="plan_spinner_desk" id="personal_plan_desk_spinner" <%=personalSpinnerStyle%>>
	                         <div class="col-lg-6">
	                           <h4><fmt:message key="travel.main.quote.plan1.type" bundle="${msg}" /></h4>
	                         </div>
	                         <div class="col-lg-6">
	                           <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
	                             <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtTravellersDesk"  data-parent="personal"> <span class="glyphicon glyphicon-minus"></span> </button>
	                             </span>
	                  <div class="text-center drop-down-plus wd4 input-number">${corrTravelQuote.getTotalPersonalTraveller()}</div>
	                             <input type="hidden" name="totalPersonalTraveller" id="txtTravellersDesk" data-min="1" data-max="15" value="${corrTravelQuote.getTotalPersonalTraveller()}"/>
	                             <span class="input-group-btn data-up ">
	                             <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtTravellersDesk" data-parent="personal"> <span class="glyphicon glyphicon-plus"></span> </button>
	                             </span> </div>
	                         </div>
	                       </div>
	                       <!-- end of personal plan bottom spinner-->
	                       <div class="clearfix"></div>
	
	                       <!-- start of family plan bottom spinner-->
	                       <div class="plan_spinner_desk" id="family_plan_desk_spinner" <%=familySpinnerStyle%>>
	                         <div class="col-lg-6">
	                           <h4><fmt:message key="travel.main.quote.plan2.type1" bundle="${msg}" /></h4>
	                         </div>
	                         <div class="col-lg-6">
	                           <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
	                             <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtAdultsDesk" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
	                             </span>
	                             <div class="text-center drop-down-plus wd4 input-number">${corrTravelQuote.getTotalAdultTraveller()}</div>
	                             <input type="hidden" name="totalAdultTraveller" id="txtAdultsDesk" data-min="1" data-max="2" value="${corrTravelQuote.getTotalAdultTraveller()}"/>
	                             <span class="input-group-btn data-up ">
	                             <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtAdultsDesk" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
	                             </span> </div>
	                         </div>
	                         <div class="clearfix"></div>
	                         <div class="col-lg-6">
	                           <h4><fmt:message key="travel.main.quote.plan2.type2" bundle="${msg}" /></h4>
	                         </div>
	                         <div class="col-lg-6">
	                           <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
	                             <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtChildDesk" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
	                             </span>
	                             <div class="text-center drop-down-plus wd4 input-number">${corrTravelQuote.getTotalChildTraveller()}</div>
	                             <input type="hidden" name="totalChildTraveller" id="txtChildDesk" data-min="1" data-max="15" value="${corrTravelQuote.getTotalChildTraveller()}"/>
	                             <span class="input-group-btn data-up ">
	                             <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtChildDesk" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
	                             </span> </div>
	                         </div>
	                         <div class="clearfix"></div>
	                         <div class="col-lg-6">
	                           <h4><fmt:message key="travel.main.quote.plan2.type3" bundle="${msg}" /></h4>
	                         </div>
	                         <div class="col-lg-6">
	                           <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
	                             <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtOtherDesk" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
	                             </span>
	                             <div class="text-center drop-down-plus wd4 input-number">${corrTravelQuote.getTotalOtherTraveller()}</div>
	                             <input type="hidden" name="totalOtherTraveller" id="txtOtherDesk" data-min="0" data-max="15" value="${corrTravelQuote.getTotalOtherTraveller()}"/>
	                             <span class="input-group-btn data-up ">
	                             <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtOtherDesk" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
	                             </span> </div>
	                         </div>
	                         <div class="col-lg-12 child-notes">
	                           <h4><fmt:message key="travel.main.quote.childnotes" bundle="${msg}" /></h4>
	                         </div>
	                       </div>
	                       
	                       <!-- start of family plan bottom spinner-->
	                       <div class="clearfix"></div>
	                     </div>
	                   </div>
	                   <div class="clearfix"></div>
	                 </div>
	                 </td>
	               <td class="col-md-2 pad-none">
	                <button type="submit" class="border-radius btn btn-primary get-btn " style="line-height:30px;" onclick="reset_desktop_submit()">
	                   <fmt:message key="travel.main.quote.top.action" bundle="${msg}" />
	                </button>
	                 <!--   <a href="flight-plan-cn.html" class="border-radius btn btn-primary  get-btn marg-t2" onclick="return flightValidateDeskTravel()">立即報價</a> -->
	              </td>
	             </tr>
	             <tr class="product-landing-error-wrap">
	              <td><span id="startDateDeskIn" class="text-red"> </span></td>
	              <td><span id="endDateDeskIn" class="text-red"> </span></td>
	              <td><span id="travelCountDeskIn"  style="display:none">
	                 <label class="text-red"><fmt:message key="travel.main.quote.q3.error" bundle="${msg}" /></label>
	                 </span></td>
	              <td></td>
	             </tr>
	           </tbody>
	         </table>
	      </div>
	      <!--/.col-sm-6--> 
	      
	    </div>
	    <!--/.row--> 
	  </div>
	  <!--/.container--> 
	</section>
	</form>
</section>


<!--Mobileform-->
<div class="slider-form hidden-lg hidden-md">
<form name="frmTravelGetQuote" id="frmTravelGetQuote" commandName="travelQuote" action="<%=request.getContextPath()%>/${language}/travel-insurance/quote" method="post" onsubmit="return flightValidateMobTravel();">
  <div class="form-container">
    <h2><fmt:message key="travel.main.quote.top.heading" bundle="${msg}" /></h2>
    <h4><fmt:message key="travel.main.quote.q1" bundle="${msg}" /> </h4>
    <div class="form-group">
      <div class="input-group date" id="dp3"> <span class="input-group-addon in"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
        <input name="trLeavingDate" type="text" class="datepicker form-control" id="txtStartDateMob" value="${corrTravelQuote.getTrLeavingDate()}" readonly>
      </div>
    </div>
    <span id="startDateMobIn" style="color:red"> </span>
    <h4><fmt:message key="travel.main.quote.q2" bundle="${msg}" /></h4>
    <div class="form-group">
      <div class="input-group date" id="dp4"> <span class="input-group-addon in"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
        <input name="trBackDate" type="text" class="datepicker form-control" id="txtEndDateMob" value="${corrTravelQuote.getTrBackDate()}" readonly>
      </div>
    </div>
    <span id="endDateMobIn" style="color:red"> </span>
    <h4><fmt:message key="travel.main.quote.q3" bundle="${msg}" /></h4>
    <div class="dropdown  form-group drop-down" id="myFWDropdownMob">
      
      <a href="#" class="dropdown-toggle col-sm-12 col-xs-12" data-toggle="dropdown"> <label id="lblCountMob"></label> <i class="fa fa-caret-down pull-right"></i> </a>
      <div class="dropdown-menu bdr1 wd2">
        <div class="drop-content">
          <div class="col-xs-6 col-sm-6">
            <label class="radio radio-warning radio-inline">
             <input type="radio" name="planSelected" id="personal_plan_mob"  data-id="mob" class="plan" value="personal" <%=PersonalPlanChecked%>>
          <label for="personal_plan_mob"><fmt:message key="travel.main.quote.plan1" bundle="${msg}" /></label></label>
          </div>
          <div class="col-xs-6 col-sm-6">
            <label class="radio radio-warning radio-inline">
              <input type="radio"  name="planSelected" id="family_plan_mob"  data-id="mob" class="plan" value="family" <%=FamilyPlanChecked %>>
             <label for="family_plan_mob"><fmt:message key="travel.main.quote.plan2" bundle="${msg}" /></label> </label>
          </div>
          <div class="clearfix"></div>
          <hr>
          <!-- Start of personal plan mobile spinner-->
          <input type="hidden" name="" id="family_mob_count" value="${corrTravelQuote.getTotalFamilyTravellers()}">
          <div class="plan_spinner_mob" id="personal_plan_mob_spinner" <%=personalSpinnerStyle%>>

          <div class="col-xs-6 col-sm-8">
            <h4><fmt:message key="travel.main.quote.plan1.type" bundle="${msg}" /></h4>
          </div>
           <div class="col-xs-6 col-sm-4">
            <div class="input-group number-spinner none-bd "> 
              <span class="input-group-btn data-dwn">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="minus" data-field="txtTravellersMob" data-parent="personal">
                      <span class="glyphicon glyphicon-minus"></span>
                </button>
              </span>
              <div class="text-center drop-down-plus wd4 input-number">${corrTravelQuote.getTotalPersonalTraveller()}</div>
              <input type="hidden" name="totalPersonalTraveller" id="txtTravellersMob" data-min="1" data-max="15" value="${corrTravelQuote.getTotalPersonalTraveller()}"/>
              <span class="input-group-btn data-up ">
                 <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtTravellersMob" data-parent="personal">
                   <span class="glyphicon glyphicon-plus"></span>
                 </button>
              </span>
           </div>
          </div>

         </div>
          <!-- End of personal plan mobile spinner-->
           <!-- Start of family plan mobile spinner-->
         <div class="plan_spinner_mob" id="family_plan_mob_spinner" <%=familySpinnerStyle%>>

           <div class="col-xs-6 col-sm-8">
            <h4><fmt:message key="travel.main.quote.plan2.type1" bundle="${msg}" /></h4>
          </div>
           <div class="col-xs-6 col-sm-4">
            <div class="input-group number-spinner none-bd "> 
              <span class="input-group-btn data-dwn">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="minus" data-field="txtAdultsMob" data-parent="family">
                      <span class="glyphicon glyphicon-minus"></span>
                </button>
              </span>
              <div class="text-center drop-down-plus wd4 input-number">${corrTravelQuote.getTotalAdultTraveller()}</div>
              <input type="hidden" name="totalAdultTraveller" id="txtAdultsMob" data-min="1" data-max="2" value="${corrTravelQuote.getTotalAdultTraveller()}"/>
              <span class="input-group-btn data-up ">
                 <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtAdultsMob" data-parent="family">
                   <span class="glyphicon glyphicon-plus"></span>
                 </button>
              </span>
           </div>
          </div>
         <div class="clearfix"></div>

          <div class="col-xs-6 col-sm-8">
            <h4><fmt:message key="travel.main.quote.plan2.type2" bundle="${msg}" /></h4>
          </div>
           <div class="col-xs-6 col-sm-4">
            <div class="input-group number-spinner none-bd "> 
              <span class="input-group-btn data-dwn">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="minus" data-field="txtChildMob" data-parent="family">
                      <span class="glyphicon glyphicon-minus"></span>
                </button>
              </span>
              <div class="text-center drop-down-plus wd4 input-number">${corrTravelQuote.getTotalChildTraveller()}</div>
              <input type="hidden" name="totalChildTraveller" id="txtChildMob" data-min="1" data-max="15" value="${corrTravelQuote.getTotalChildTraveller()}"/>
              <span class="input-group-btn data-up ">
                 <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtChildMob" data-parent="family">
                   <span class="glyphicon glyphicon-plus"></span>
                 </button>
              </span>
           </div>
          </div>
         <div class="clearfix"></div>

          <div class="col-xs-6 col-sm-8">
            <h4><fmt:message key="travel.main.quote.plan2.type3" bundle="${msg}" /></h4>
          </div>
           <div class="col-xs-6 col-sm-4">
            <div class="input-group number-spinner none-bd "> 
              <span class="input-group-btn data-dwn">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="minus" data-field="txtOtherMob" data-parent="family">
                      <span class="glyphicon glyphicon-minus"></span>
                </button>
              </span>
              <div class="text-center drop-down-plus wd4 input-number">${corrTravelQuote.getTotalOtherTraveller()}</div>
              <input type="hidden" name="totalOtherTraveller" id="txtOtherMob" data-min="0" data-max="15" value="${corrTravelQuote.getTotalOtherTraveller()}"/>
              <span class="input-group-btn data-up ">
                 <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtOtherMob" data-parent="family">
                   <span class="glyphicon glyphicon-plus"></span>
                 </button>
              </span>
           </div>
          </div>
          <div class="clearfix"></div>
          <div class="col-lg-12 child-notes">
               <h4><fmt:message key="travel.main.quote.childnotes" bundle="${msg}" /></h4>
             </div>
           </div>
           <!-- End of family plan mobile spinner -->
          <div class="clearfix"></div>
        </div>
      </div>
      <div class="clearfix"></div>
    </div>
    <span id="travelCountMobIn" style="display:none">
    <label class="text-red"><fmt:message key="travel.main.quote.q3.error" bundle="${msg}" /></label>
    </span>
<!--     <span id="travelCountMobIn" style="display:none"> -->
<!--     <label style="color:red">Traveller count which is blank</label> -->
<!--     </span> -->
    <div class="text-center" id="divPersonsMob" style="visibility:hidden;">
      <small>
      <label id="lblPeopleMob">0</label>
        <fmt:message key="travel.main.quote.total.people" bundle="${msg}" />
      <label id="lblDaysMob">0</label>
        <fmt:message key="travel.main.quote.total.days" bundle="${msg}" /></small>
    </div>
  </div>
  
  <div class="form-container">
    <h3 class="text-center"> 
      <!-- <a href="#" class="border-radius get-btn" onclick="return flightValidateMobTravel()">立即申請免費保障! </a>  -->
      <button type="submit" onclick="reset_mobile_submit()" class="bdr-curve btn btn-primary btn-lg btn-block">
              <fmt:message key="travel.main.quote.top.action" bundle="${msg}" /> 
             </button>
    </h3>
  </div>
  </form>
</div>
<!--Mobileform--> 

<!--/#main slider-->

<section id="feature" >
  <div class="container pad-none">
    <div class="center wow fadeInDown"> 
      <!--desktop-->
<h2 class="hidden-sm hidden-xs"><fmt:message key="travel.main.desc1" bundle="${msg}" /></h2>
<!--end desktop--> 

<!--Mobile-->
<h2 class="col-xs-12 hidden-lg hidden-md feature-ttl">
<fmt:message key="travel.main.mobile.desc1" bundle="${msg}" />
<fmt:message key="travel.main.mobile.desc2" bundle="${msg}" />
<fmt:message key="travel.main.mobile.desc3" bundle="${msg}" />
</h2>
<!--end Mobile-->
</div>

<!--desktop Features-->
<div class="hidden-xs hidden-sm">
    <div class="col-md-10 col-md-offset-1 home-features"  >
    <div class="col-md-6 col-lg-6 text-center"> <img src="<%=request.getContextPath()%>/resources/images/iFWD_travel_icon1.png" alt="" /> </div>
    <div class="col-md-6 col-lg-6">
      <div class="content">
        <h2><fmt:message key="travel.main.feature1.heading1" bundle="${msg}" /> <br/>
          <fmt:message key="travel.main.feature1.heading2" bundle="${msg}" /></h2>
        <p class="details-text"><fmt:message key="travel.main.feature1.paragraph" bundle="${msg}" /></p>
        <a href="" class="h4-4 scrollToTop"><fmt:message key="travel.main.feature.getquote" bundle="${msg}" /></a> </div>
    </div>
    <div class="clearfix"></div>
    <br>
    <div class="col-md-6 col-lg-6">
      <div class="content">
        <h2><fmt:message key="travel.main.feature2.heading1" bundle="${msg}" /> <br/>
          <fmt:message key="travel.main.feature2.heading2" bundle="${msg}" /></h2>
        <p class="details-text"><fmt:message key="travel.main.feature2.paragraph" bundle="${msg}" /></p>
        <a href="" class="h4-4 scrollToTop"><fmt:message key="travel.main.feature.getquote" bundle="${msg}" /></a> </div>
    </div>
    <div class="col-md-6 col-lg-6 text-center">  <img src="<%=request.getContextPath()%>/resources/images/iFWD_travel_icon2.png" alt=""  /> </div>
    <div class="clearfix"></div>
    <br>
    <div class="col-md-6 col-lg-6 text-center"> <img src="<%=request.getContextPath()%>/resources/images/iFWD_travel_icon3.png" alt=""  /> </div>
    <div class="col-md-6 col-lg-6">
      <div class="content">
        <h2><fmt:message key="travel.main.feature3.heading" bundle="${msg}" /></h2>
        <p class="details-text"><fmt:message key="travel.main.feature3.paragraph" bundle="${msg}" /></p>
        <a href="#" class="h4-4 scrollToTop"><fmt:message key="travel.main.feature.getquote" bundle="${msg}" /></a> </div>
    </div>
    <div class="clearfix"></div>
  </div>
  
  <!--mobile Features--> 
  
  <!--/.row--> 
</div>

<!--mob Features-->
<div class="mob-features hidden-lg hidden-md">
  <div class="col-xs-4 col-sm-4 text-center"> <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/iFWD_travel_icon1.png" alt=""  /> </div>
  <div class="col-xs-8 col-sm-8">
    <div>
      <h2 class="h2-3"><fmt:message key="travel.main.feature1.heading1" bundle="${msg}" /><br/>
                <fmt:message key="travel.main.feature1.heading2" bundle="${msg}" /></h2>
      <p class="details-text"><fmt:message key="travel.main.feature1.paragraph" bundle="${msg}" /></p>
      <a href="" class="h4-4 scrollToTop"><fmt:message key="travel.main.feature.getquote" bundle="${msg}" /></a> </div>
  </div>
  <div class="clearfix"></div>
  <br>
  <div class="col-xs-4 col-sm-4 text-center"> <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/iFWD_travel_icon2.png" alt=""  /> </div>
  <div class="col-xs-8 col-sm-8">
    <div>
      <h2 class="h2-3"><fmt:message key="travel.main.feature2.heading1" bundle="${msg}" /><br/>
      <fmt:message key="travel.main.feature2.heading2" bundle="${msg}" /></h2>
      <p class="details-text"><fmt:message key="travel.main.feature2.paragraph" bundle="${msg}" /></p>
      <a href="" class="h4-4 scrollToTop"><fmt:message key="travel.main.feature.getquote" bundle="${msg}" /></a> </div>
  </div>
  <div class="clearfix"></div>
  <br>
  <div class="col-xs-4 col-sm-4 text-center"> <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/iFWD_travel_icon3.png" alt=""  /> </div>
  <div class="col-xs-8 col-sm-8">
    <div>
      <h2 class="h2-3"><fmt:message key="travel.main.feature3.heading" bundle="${msg}" /></h2>
      <p class="details-text"><fmt:message key="travel.main.feature3.paragraph" bundle="${msg}" /></p>
      <a href="" class="h4-4 scrollToTop"><fmt:message key="travel.main.feature.getquote" bundle="${msg}" /></a> </div>
  </div>
  <div class="clearfix"></div>
</div>
<div class="clearfix"></div>
<div class="other-benefits col-lg-12 col-md-12 hidden-sm hidden-xs" style="margin-left:10px;">
  <h2><fmt:message key="travel.main.other.benefit" bundle="${msg}" /></h2>
  <ul class="bullets">
    <li>
      <p class="h4-5"><fmt:message key="travel.main.other.benefit.desc1" bundle="${msg}" /></p>
    </li>
    <li>
      <p class="h4-5"><fmt:message key="travel.main.other.benefit.desc2" bundle="${msg}" /></p>
    </li>
    <li>
      <p class="h4-5"><fmt:message key="travel.main.other.benefit.desc3" bundle="${msg}" /></p>
    </li>
  <li>
      <p class="h4-5"><fmt:message key="travel.main.other.benefit.desc4" bundle="${msg}" /></p>
    </li>
  <li>
      <p class="h4-5"><fmt:message key="travel.main.other.benefit.desc5" bundle="${msg}" /></p>
    </li>
  </ul>
  <div class="col-lg-12 col-md-12 col-xs-12 main-partner" style="">
  	<div class="main-partner-1">
    	<img src="<%=request.getContextPath()%>/resources/images/fwd_partner_3a.png" alt="" class="">
    </div>
    <div class="main-partner-2">
    	<img src="<%=request.getContextPath()%>/resources/images/fwd_partner_3c.png" alt="" class="">
    </div>
  </div>
  <div class="spacer3"></div>
  <p class="h4-6"><fmt:message key="travel.main.other.disclaimer.part1" bundle="${msg}" /> <a href="<%=request.getContextPath()%>/<fmt:message key="travel.provision.link" bundle="${msg}" />" target="_blank"> <u><fmt:message key="travel.main.other.disclaimer.part2" bundle="${msg}" /></u></a> <fmt:message key="travel.main.other.disclaimer.part5" bundle="${msg}" /> <a href="<fmt:message key="travel.brochure.link" bundle="${msg}" />" target="_blank"> <u><fmt:message key="travel.main.other.disclaimer.part6" bundle="${msg}" /></u></a> <fmt:message key="travel.main.other.disclaimer.part3" bundle="${msg}" /></p>
  
  <p class="h4-6"><fmt:message key="travel.main.other.disclaimer.part4" bundle="${msg}" /></p>
</div>

<div id="other-benefits-mob" class="other-benefits col-xs-12 col-sm-12 hidden-lg hidden-md">
  <h2 style="text-align: center;"><fmt:message key="workingholiday.main.other.benefit" bundle="${msg}" /></h2>
  <div class="carousel slide">
    <div class="carousel-inner">
      <div class="item active">
          <div class="slide-margin">
            <div class="other-benefits-wrap text-center">
              <div class="other-benefits-inner">
                <p style="font-size: 21px;"><fmt:message key="travel.main.other.benefit.desc1" bundle="${msg}" /></p>
              </div>
            </div>
          </div>
      </div>
      <!--/.item-->
      <div class="item" >
          <div class="slide-margin">
            <div class="other-benefits-wrap text-center">
              <div class="other-benefits-inner">
                <p style="font-size: 21px;"><fmt:message key="travel.main.other.benefit.desc2" bundle="${msg}" /></p>
              </div>
            </div>
          </div>
      </div>
      <!--/.item-->
      <div class="item" >
          <div class="slide-margin">
            <div class="other-benefits-wrap text-center">
              <div class="other-benefits-inner">
                <p style="font-size: 21px;"><fmt:message key="travel.main.other.benefit.desc3" bundle="${msg}" /></p>
              </div>
            </div>
          </div>
      </div>
      <!--/.item-->
      <div class="item" >
          <div class="slide-margin">
            <div class="other-benefits-wrap text-center">
              <div class="other-benefits-inner">
                <p style="font-size: 21px;"><fmt:message key="travel.main.other.benefit.desc4" bundle="${msg}" /></p>
              </div>
            </div>
          </div>
      </div>
      <!--/.item-->
      <div class="item" >
          <div class="slide-margin">
            <div class="other-benefits-wrap text-center">
              <div class="other-benefits-inner">
                <p style="font-size: 21px;"><fmt:message key="travel.main.other.benefit.desc5" bundle="${msg}" /></p>
              </div>
            </div>
          </div>
      </div>
      <!--/.item-->
    </div>
    <!--/.carousel-inner--> 
    <a class="prev" href="#other-benefits-mob" data-slide="prev"> <i class="fa fa-chevron-left"></i> </a>
    <a class="next" href="#other-benefits-mob" data-slide="next"> <i class="fa fa-chevron-right"></i> </a>
  </div>
  <!--/.carousel-->
  <div class="clearfix"></div>
  
  <div class="col-lg-12 col-md-12 col-xs-12 main-partner mob" style="">
  	<div class="col-lg-6 col-md-6 col-xs-6 main-partner-1">
    	<img src="<%=request.getContextPath()%>/resources/images/fwd_partner_3a.png" alt="" class="">
    </div>
    <div class="col-lg-6 col-md-6 col-xs-6 main-partner-2">
    	<img src="<%=request.getContextPath()%>/resources/images/fwd_partner_3c.png" alt="" class="">
    </div>
  </div>

  <div class="spacer3"></div>
  <p class="h4-6"><fmt:message key="travel.main.other.disclaimer.part1" bundle="${msg}" /> <a href="<%=request.getContextPath()%>/<fmt:message key="travel.provision.link" bundle="${msg}" />" target="_blank"> <u><fmt:message key="travel.main.other.disclaimer.part2" bundle="${msg}" /></u></a> <fmt:message key="travel.main.other.disclaimer.part5" bundle="${msg}" /> <a href="<fmt:message key="travel.brochure.link" bundle="${msg}" />" target="_blank"> <u><fmt:message key="travel.main.other.disclaimer.part6" bundle="${msg}" /></u></a> <fmt:message key="travel.main.other.disclaimer.part3" bundle="${msg}" /></p>
  
  <p class="h4-6"><fmt:message key="travel.main.other.disclaimer.part4" bundle="${msg}" /></p>
<!--/.container-->
</div>

<!--/.container-->
</div>
</section>
<!--/#feature-->
<section id="recent-works" class="hidden-xs hidden-sm">
  <div class="container">
    <div class="row hidden-sm hidden-xs">
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none">
        <div class="recent-work-wrap wrap text-center">
          <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/time.png" alt=""  />
            <h1><fmt:message key="travel.main.highlight1.heading.line1" bundle="${msg}" /><br/>
              <fmt:message key="travel.main.highlight1.heading.line2" bundle="${msg}" />
            </h1>
              <p><fmt:message key="travel.main.highlight1.desc.part1" bundle="${msg}" /> <a href="<fmt:message key="app.download.link" bundle="${msg}" />" target="_blank" ><u><fmt:message key="travel.main.highlight1.desc.part2" bundle="${msg}" /></u></a> <fmt:message key="travel.main.highlight1.desc.part3" bundle="${msg}" /></p>

          </div>
        </div>
      </div>
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
        <div class="recent-work-wrap-mid wrap text-center">
          <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/secure.png" alt=""  />
            <h1><fmt:message key="travel.main.highlight2.heading.line1" bundle="${msg}" /><br/>
              <fmt:message key="travel.main.highlight2.heading.line2" bundle="${msg}" /></h1>
              <p><fmt:message key="travel.main.highlight2.desc" bundle="${msg}" /><br>
              <br>
            </p>
          </div>
        </div>
      </div>
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
        <div class="recent-work-wrap wrap text-center">
          <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/rewards.png" alt=""  />
            <h1><fmt:message key="travel.main.highlight3.heading.line1" bundle="${msg}" /><br/>
              <fmt:message key="travel.main.highlight3.heading.line2" bundle="${msg}" /></h1>
            <p><fmt:message key="travel.main.highlight3.desc" bundle="${msg}" /></p>
            <!--<img src="resources/images/agoda-logo.png" alt=""/>--> </div>
        </div>
      </div>
    </div>
    <!--End Desktop Support--> 
    <!--/.row--> 
  </div>
  <!--/.container--> 
</section>
<!--/#recent-works-->

<section id="recent-works-mob" class="hidden-lg hidden-md"  >
  <div class="carousel slide">
    <div class="carousel-inner">
      <div class="item active">
        <div class="container">
          <div class="row slide-margin">
            <div class="recent-work-wrap text-center">
              <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/time.png" alt=""  />
                <h2><fmt:message key="travel.main.highlight1.heading.line1" bundle="${msg}" /><br/>
                  <fmt:message key="travel.main.highlight1.heading.line2" bundle="${msg}" /></h2>
                <p><fmt:message key="travel.main.highlight1.desc.part1" bundle="${msg}" /> <a href="<fmt:message key="app.download.link" bundle="${msg}" />" target="_blank" ><u><fmt:message key="travel.main.highlight1.desc.part2" bundle="${msg}" /></u></a> <fmt:message key="travel.main.highlight1.desc.part3" bundle="${msg}" /></p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--/.item-->
      <div class="item" >
        <div class="container">
          <div class="row slide-margin">
            <div class="recent-work-wrap-mid text-center">
              <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/secure.png" alt=""  /> 
              <h2><fmt:message key="travel.main.highlight2.heading.line1" bundle="${msg}" /> <fmt:message key="travel.main.highlight2.heading.line2" bundle="${msg}" /></h2>
                <p><fmt:message key="travel.main.highlight2.desc" bundle="${msg}" /></p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--/.item-->
      <div class="item">
        <div class="container">
          <div class="row slide-margin">
            <div class="recent-work-wrap text-center">
              <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/rewards.png" alt=""  /> 
              <h2><fmt:message key="travel.main.highlight3.heading.line1" bundle="${msg}" /> <fmt:message key="travel.main.highlight3.heading.line2" bundle="${msg}" /></h2>
                <p><fmt:message key="travel.main.highlight3.desc" bundle="${msg}" /></p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--/.item--> 
    </div>
    <!--/.carousel-inner--> 
  </div>
  <!--/.carousel--> 
  <a class="prev" href="#recent-works-mob" data-slide="prev"> <i class="fa fa-chevron-left"></i> </a> <a class="next" href="#recent-works-mob" data-slide="next"> <i class="fa fa-chevron-right"></i> </a> </section>

<!--/#testiomonials-->
<section id="testimonials" class="hidden-sm hidden-xs">
  <div class="container"> 
    <!--desktop-testimonials-->
    <div class="row hidden-sm hidden-xs">
      <div class="center">
        <h2><fmt:message key="travel.main.testimonial.heading" bundle="${msg}" /></h2>
      </div>
      <div class="col-lg-5 col-md-5 pad-none pull-left">
        <div class="testimonials-wrap text-center">
          <div class="testimonials-inner text-center">
            <div class="h1-1"> <blockquote class="testimonial"></blockquote></div>
            <p><fmt:message key="travel.main.testimonial.customer1.feedback" bundle="${msg}" /></p>
            <div class="hr1"></div>
            <h2><fmt:message key="travel.main.testimonial.customer1.name" bundle="${msg}" /></h2>
            <h4><fmt:message key="travel.main.testimonial.customer1.age" bundle="${msg}" /></h4>
          </div>
        </div>
      </div>
      <div class="col-lg-5 col-md-5 pad-none pull-right">
        <div class="testimonials-wrap text-center">
          <div class="testimonials-inner text-center">
            <div class="h1-1"> <blockquote class="testimonial"></blockquote></div>
            <p><fmt:message key="travel.main.testimonial.customer2.feedback" bundle="${msg}" /></p>
            <div class="hr1"></div>
            <h2><fmt:message key="travel.main.testimonial.customer2.name" bundle="${msg}" /> </h2>
            <h4><fmt:message key="travel.main.testimonial.customer2.age" bundle="${msg}" /></h4>
          </div>
        </div>
      </div>
      <br>
      <div class="clearfix"></div>
      <p class="pad-none p1"><br>
      <fmt:message key="travel.main.testimonial.disclaimer" bundle="${msg}" /></p>
    </div>
    <!--/.row--> 
    <!--/.desktop-testimonials--> 
    
  </div>
  <!--/.container--> 
</section>
<!--/#testiomonials--> 

<!--/#testiomonials mob-->
<section id="testimonials-mob" class="hidden-lg hidden-md">
  <div class="carousel slide">
  <div class="center">
        <h2><fmt:message key="travel.main.testimonial.heading" bundle="${msg}" /></h2>
 </div>

    <div class="carousel-inner">
      <div class="item active">
        <div class="container">
          <div class="row slide-margin">
            <div class="testimonials-wrap text-center">
              <div class="testimonials-inner travel-testimonial text-center">
                <blockquote class="testimonial"></blockquote>
                <p><fmt:message key="travel.main.testimonial.customer1.feedback" bundle="${msg}" /></p>
                <div class="hr1"></div>
                <h2><fmt:message key="travel.main.testimonial.customer1.name" bundle="${msg}" /></h2>
                <h4><fmt:message key="travel.main.testimonial.customer1.age" bundle="${msg}" /></h4>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--/.item-->
      <div class="item" >
        <div class="container">
          <div class="row slide-margin">
            <div class="testimonials-wrap text-center">
              <div class="testimonials-inner travel-testimonial text-center">
                <div class="h1-1"> <blockquote class="testimonial"></blockquote></div>
                <p><fmt:message key="travel.main.testimonial.customer2.feedback" bundle="${msg}" /></p>
                <div class="hr1"></div>
                <h2><fmt:message key="travel.main.testimonial.customer2.name" bundle="${msg}" /></h2>
                <h4><fmt:message key="travel.main.testimonial.customer2.age" bundle="${msg}" /></h4>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--/.carousel-inner--> 
  </div>
  <!--/.carousel--> 
  <a class="prev" href="#testimonials-mob" data-slide="prev"> <i class="fa fa-chevron-left"></i> </a> <a class="next" href="#testimonials-mob" data-slide="next"> <i class="fa fa-chevron-right"></i> </a>
  <p class="p1" style="padding:20px;"><br>
      <fmt:message key="travel.main.testimonial.disclaimer" bundle="${msg}" /></p>
  </section>
<!--/#testiomonials mob-->

<section class="blog-item hidden-sm hidden-xs">
  <div class="container">
    <div class="center">
      <h2><fmt:message key="travel.main.blog.heading" bundle="${msg}" /></h2>
    </div>
    <div class="col-lg-12 pad-none">
      <div class="col-lg-4 col-md-4 pad-none">
        <div class="services-wrap service-bx1">
          <div> <a href="<fmt:message key="travel.blog.post1.link" bundle="${msg}" />" target="_blank"><img class="bdr-img" src="<%=request.getContextPath()%>/resources/images/home4.png" alt=""></a>
            <h3> <a href="<fmt:message key="travel.blog.post1.link" bundle="${msg}" />" target="_blank"><fmt:message key="travel.main.blog.subheading1" bundle="${msg}" /> <i class="fa fa-caret-right"></i> </a></h3>
         
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-4 pad-none">
        <div class="services-wrap service-bx2">
          <div> <a href="<fmt:message key="travel.blog.post2.link" bundle="${msg}" />" target="_blank"><img class="bdr-img" src="<%=request.getContextPath()%>/resources/images/home5.png" alt=""></a>
            <h3><a href="<fmt:message key="travel.blog.post2.link" bundle="${msg}" />" target="_blank"><fmt:message key="travel.main.blog.subheading2" bundle="${msg}" /> <i class="fa fa-caret-right"></i> </a></h3>
         
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-4 pad-none">
        <div class="services-wrap service-bx3">
          <div> <a href="<fmt:message key="travel.blog.post3.link" bundle="${msg}" />" target="_blank"><img class="bdr-img" src="<%=request.getContextPath()%>/resources/images/home6.png" alt=""></a>
            <h3> <a href="<fmt:message key="travel.blog.post3.link" bundle="${msg}" />" target="_blank"><fmt:message key="travel.main.blog.subheading3" bundle="${msg}" /> <i class="fa fa-caret-right"></i> </a></h3>
           
          </div>
        </div>
      </div>
    </div>
    <!--/.row--> 
     <p><fmt:message key="travel.main.blog.disclaimer" bundle="${msg}" /></p>
    
   
   
  </div>
  <!--/.container--> 
</section>
<!--/#services-->

<section id="bottom-form" class="hidden-sm hidden-xs">
  <div class="container">
    <div class="row">
    <form name="frmTravelGetQuote" id="frmTravelGetQuote" commandName="travelQuote" action="<%=request.getContextPath()%>/${language}/travel-insurance/quote" method="post" onsubmit="return flightValidateBtmTravel();">
      <div class="col-lg-12 col-md-12 pad-none slide-form">
        <!-- <h2><fmt:message key="travel.main.quote.bottom.heading" bundle="${msg}" /></h2> -->
        <table class="table activation-form3">
          <tbody>
          <tr class="hide-html">
            <td><h3><fmt:message key="travel.main.quote.q1" bundle="${msg}" /></h3></td>
            <td><h3><fmt:message key="travel.main.quote.q2" bundle="${msg}" /></h3></td>
            <td><h3><fmt:message key="travel.main.quote.q3" bundle="${msg}" /></h3></td>
            <td><div id="divPersonsBtm" style="visibility:hidden;">
                  <h3 class="h3-i">
                    <label id="lblPeopleBtm">0</label>
            <fmt:message key="travel.main.quote.total.people" bundle="${msg}" />
                    <label id="lblDaysBtm">0</label>
            <fmt:message key="travel.main.quote.total.days" bundle="${msg}" /></h3>
                </div>
             </td>
          </tr>
            <tr>
              <td class="col-md-3 pad-none">
                <div class="input-group date" id="dp5"> <span class="input-group-addon in border-radius"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
                  <input type="text" name="trLeavingDate"  class="datepicker form-control border-radius" id="txtStartDateBtm" value="${corrTravelQuote.getTrLeavingDate()}" placeholder="<fmt:message key="flight.main.quote.q1" bundle="${msg}" />" readonly>
                </div>
                </td>
              <td class="col-md-3 pad-none">
                <div class="input-group date" id="dp6"> <span class="input-group-addon in border-radius"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
                  <input type="text" name="trBackDate" class="datepicker form-control border-radius" id="txtEndDateBtm" value="${corrTravelQuote.getTrBackDate()}" placeholder="<fmt:message key="flight.main.quote.q2" bundle="${msg}" />" readonly>
                </div>
                </td>
              <td class="col-md-3 pad-none">
                <div class="dropdown  form-group drop-down wh-bg input-group-div marg-b2 dropup" id="myFWDropdownBtm">
                 
                  <a href="#" class="dropdown-toggle col-lg-12 col-md-12" data-toggle="dropdown">  <label class="select-label"><fmt:message key="flight.main.quote.plan1.type" bundle="${msg}" />:</label> <label id="lblCountBtm"></label>&nbsp;<i class="fa fa-caret-down pull-right"></i> </a>
                  <div class="dropdown-menu bdr1">
                    <div class="drop-content">
                      <div class="col-lg-6">
                         <label class="radio radio-warning radio-inline">
                          <input type="radio" name="planSelected" id="personal_plan_btm" data-id="btm" class="plan" value="personal"  <%=PersonalPlanChecked%> > <label for="personal_plan_btm"><fmt:message key="travel.main.quote.plan1" bundle="${msg}" /></label></label>


                      </div>
                      <div class="col-lg-6">
                          <label class="radio radio-warning radio-inline">
                          <input type="radio" name="planSelected" id="family_plan_btm" data-id="btm" class="plan" value="family" <%=FamilyPlanChecked %>> <label for="family_plan_btm"><fmt:message key="travel.main.quote.plan2" bundle="${msg}" /></label></label>


                      </div>
                      <div class="clearfix"></div>
                      <hr>
                      <!-- start of personal plan bottom spinner-->
                      <input type="hidden" name="" id="family_btm_count" value="${corrTravelQuote.getTotalFamilyTravellers()}">
                      <div class="plan_spinner_btm" id="personal_plan_btm_spinner" <%=personalSpinnerStyle%>>
                        <div class="col-lg-6">
                          <h4><fmt:message key="travel.main.quote.plan1.type" bundle="${msg}" /></h4>

                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtTravellersBtm" data-parent="personal"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <div class="text-center drop-down-plus wd4 input-number">${corrTravelQuote.getTotalPersonalTraveller()}</div>
                            <input type="hidden" name="totalPersonalTraveller" id="txtTravellersBtm" data-min="1" data-max="15" value="${corrTravelQuote.getTotalPersonalTraveller()}"/>
                            <span class="input-group-btn data-up ">
                            <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtTravellersBtm" data-parent="personal"> <span class="glyphicon glyphicon-plus"></span> </button>
                            </span> </div>
                        </div>
                      </div>
                      <!-- end of personal plan bottom spinner-->
                      <div class="clearfix"></div>
                      
                      <!-- start of family plan bottom spinner-->
                      <div class="plan_spinner_btm" id="family_plan_btm_spinner" <%=familySpinnerStyle%>>
                        <div class="col-lg-6">
                          <h4><fmt:message key="travel.main.quote.plan2.type1" bundle="${msg}" /></h4>

                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtAdultsBtm" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <div class="text-center drop-down-plus wd4 input-number">${corrTravelQuote.getTotalAdultTraveller()}</div>
                            <input type="hidden" name="totalAdultTraveller" id="txtAdultsBtm" data-min="1" data-max="2" value="${corrTravelQuote.getTotalAdultTraveller()}"/>
                            <span class="input-group-btn data-up ">
                            <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtAdultsBtm" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                            </span> </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-lg-6">
                          <h4><fmt:message key="travel.main.quote.plan2.type2" bundle="${msg}" /></h4>

                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtChildBtm" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <div class="text-center drop-down-plus wd4 input-number">${corrTravelQuote.getTotalChildTraveller()}</div>
                            <input type="hidden" name="totalChildTraveller" id="txtChildBtm" data-min="1" data-max="15" value="${corrTravelQuote.getTotalChildTraveller()}"/>
                            <span class="input-group-btn data-up ">
                            <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtChildBtm" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                            </span> </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-lg-6">
                          <h4><fmt:message key="travel.main.quote.plan2.type3" bundle="${msg}" /></h4>

                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtOtherBtm" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <div class="text-center drop-down-plus wd4 input-number">${corrTravelQuote.getTotalOtherTraveller()}</div>
                            <input type="hidden" name="totalOtherTraveller" id="txtOtherBtm" data-min="0" data-max="15" value="${corrTravelQuote.getTotalOtherTraveller()}"/>
                            <span class="input-group-btn data-up ">
                            <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtOtherBtm" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                            </span> </div>
                        </div>
                        <div class="col-lg-12 child-notes">
                            <h4><fmt:message key="travel.main.quote.childnotes" bundle="${msg}" /></h4>
                        </div>
                      </div>
                      
                      <!-- start of family plan bottom spinner-->

                      <div class="clearfix"></div>
                    </div>
                  </div>
                  <div class="clearfix"></div>
                </div>
                
        </td>
              <td class="col-md-2 pad-none">
                  <button type="submit" onclick="reset_bottom_submit()" class="border-radius btn btn-primary get-btn" style="line-height:30px;"><fmt:message key="travel.main.quote.bottom.action" bundle="${msg}" /></button>
                 </td>
            </tr>
            <tr class="product-landing-error-wrap">
              <td><span id="startDateBtmIn" style="color:red"> </span></td>
              <td><span id="endDateBtmIn" style="color:red"> </span></td>
              <td><span id="travelCountBtmIn" class="hide-html">
                <label class="text-red"><fmt:message key="travel.main.quote.q3.error" bundle="${msg}" /></label>
                </span></td>
              <td></td>
            </tr>
          </tbody>
        </table>
      </div>
      <!--/.col-sm-6--> 
      </form>
    </div>
    <!--/.row--> 
  </div>
  <!--/.container--> 
</section>
<!--/#middle-->

<input type="hidden" id="refreshed" value="no">
<script type="text/javascript">
onload=function(){
    var e=$("#refreshed");
    if(e.val()=="no"){
        e.val("yes");
    }else{
        e.val("no");
        setGetParameter("refresh", "1")
    }
}

function setGetParameter(paramName, paramValue)
{
    var url = window.location.href;
    if (url.indexOf(paramName + "=") >= 0)
    {
        var prefix = url.substring(0, url.indexOf(paramName));
        var suffix = url.substring(url.indexOf(paramName));
        suffix = suffix.substring(suffix.indexOf("=") + 1);
        suffix = (suffix.indexOf("&") >= 0) ? suffix.substring(suffix.indexOf("&")) : "";
        url = prefix + paramName + "=" + paramValue + suffix;
    }
    else
    {
    if (url.indexOf("?") < 0)
        url += "?" + paramName + "=" + paramValue;
    else
        url += "&" + paramName + "=" + paramValue;
    }
    window.location.href = url;
}
</script>