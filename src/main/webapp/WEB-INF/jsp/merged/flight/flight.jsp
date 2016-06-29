<%
//  session = request.getSession();
//  String uatAuth = (String) session.getAttribute("uatAuth");
//  //System.out.println("uatAuth " + uatAuth);
//  if (uatAuth == null)
//      response.sendRedirect(request.getContextPath() + "/uatAuth");
    
//  if (!uatAuth.equals("ifwdUser"))
//      response.sendRedirect(request.getContextPath() + "/uatAuth");
%>

<%@page import="com.ifwd.fwdhk.model.PlanDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />


<script>
    $(function() {
        $("[data-toggle='tooltip']").tooltip();
    });
</script>
<script type="application/ld+json">
{
  "@context":"http://schema.org/",
  "@type":"Product",
  "name":"${flightScriptName}",
  "image":"${flightScriptImg}",
  "description":"${flightScriptDescription}",
  "brand":{
    "@type":"Insurance",
    "name":"${flightScriptChildName}"
  },
  "offers":{
    "@type":"Offer",
    "priceCurrency":"HKD",
    "price":"0",
    "priceValidUntil":"2016-12-31",
    "availability":"http://schema.org/InStock",
    "seller":{
      "@type":"Organization",
      "name":"${flightScriptChildName}"
    }
  }
}
</script>
<script type="text/javascript">

  // personal or family
  var traveller;  
  
  // personal
  var personalTraveller = parseInt("${planDetails.totalPersonalTraveller}");
  // family
  var familyAdult = "${planDetails.totalAdultTraveller}";
  var familyChild = "${planDetails.totalChildTraveller}";
  var familyOther = "${planDetails.totalOtherTraveller}";  
  var familyTraveller = parseInt(familyAdult) + parseInt(familyChild) + parseInt(familyOther);

  
  
  /* default
  if("${planDetails.getPlanSelected()}".toLowerCase() == "family"){
    traveller = familyTraveller;
  }else{
    traveller = personalTraveller;
  }*/

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
      
      var frm = document.getElementById("freeFlight");
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
   
   var frm = document.getElementById("freeFlight");
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
   
   var frm = document.getElementById("freeFlight");
  }  
</script>
<!-- Start fixed header -->
<script type='text/javascript'>
$(document).ready(function() {
    $(".navbar-inverse").addClass("product-header");
    
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
    
});
</script>
<!-- End fixed header -->
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

<!--Main Content-->
<section id="main-slider" class="p_flight no-margin"> 
  <!--Mobile banner--> 
  <img src="<%=request.getContextPath()%>/<fmt:message key="flight.hero.image.mobile" bundle="${msg}" />" alt="<fmt:message key="flight.hero.image.alt" bundle="${msg}" />" class="img-responsive hidden-lg hidden-md"  /> 
  <div class="tagline-holder hidden-lg hidden-md">
      <img src="<%=request.getContextPath()%>/<fmt:message key="flight.hero.tagline" bundle="${msg}" />" class="img-responsive">
  </div>
  <!--Mobile banner-->
  <div class="carousel slide hidden-xs hidden-sm">
  <div class="col-lg-12 col-md-12 breadcrumb-wrapper">
     <ol class="breadcrumb container pad-none">
         <li><fmt:message key="home.breadcrumb1.item1" bundle="${msg}" /></li>
        <i class="fa fa-chevron-right"></i>
        <li class="active"><fmt:message key="home.breadcrumb1.flight" bundle="${msg}" /></li>
     </ol>
  </div>  
  <div class="carousel-inner">
    <div class="item active">
      <img src="<%=request.getContextPath()%>/<fmt:message key="flight.hero.image" bundle="${msg}" />" alt="<fmt:message key="flight.hero.image.alt" bundle="${msg}" />">
         </div>
      <!--/.item--> 
    </div>
    <!--/.carousel-inner--> 
  </div>
  <div class="tagline-holder">
      <img src="<%=request.getContextPath()%>/<fmt:message key="flight.hero.tagline" bundle="${msg}" />" class="img-responsive">
  </div>
  <!--/.carousel--> 
  <!-- flight top form -->
  <section id="middle" class="hidden-sm hidden-xs">
    <div class="container bmg_flighttravel_main_container">
    <div class="row">
      <div class="col-lg-12 col-md-12 pad-none-lg slide-form">
      
      <!-- -=============================================================  form ============================================================= -->
      
      <form id="freeFlight" name="freeFlight" method="post"   onsubmit="return flightValidateDesk()" action="<%=request.getContextPath()%>/${language}/flight-insurance/quote">    
        <!-- <h2><fmt:message key="flight.main.quote.top.heading" bundle="${msg}" /></h2> -->
       
             <table class="table activation-form3">
          <tbody>
          <tr class="hide-html">
              <td class="pad-left-none">
                <h3><fmt:message key="flight.main.quote.q1" bundle="${msg}" /></h3>
              </td>
              <td class="pad-left-none">
                <h3><fmt:message key="flight.main.quote.q2" bundle="${msg}" /></h3>
              </td>
              <td class="pad-left-none">
                <h3><fmt:message key="flight.main.quote.q3" bundle="${msg}" /></h3>
              </td>
              <td class="pad-left-none">
                <div id="divPersonsDesk" style="visibility:hidden;">
                  <h3 class="h3-i2">
                    <label id="lblPeopleDesk">0</label>
                    <fmt:message key="flight.main.quote.total.people" bundle="${msg}" /> 
                    <label id="lblDaysDesk">0</label>
                    <fmt:message key="flight.main.quote.total.days" bundle="${msg}" /> </h3>
                </div>
              </td>
            </tr>
            <tr>
              <td class="" style="min-width: 150px;">
              
          
              
              <!--====================================================== 出發日期 -->
              
                <div class="input-group date" id="dp1" style="display: inline-block;background-color:#eee;"> <span class="input-group-addon in border-radius" style="display:inline-block;width:25%;"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
                  <input name="departureDate" type="text" class="datepicker form-control border-radius" style="display:inline-block;width:70%;" id="txtStartDateDesk" onblur="chkValidFlightDepartureDate(this, 'startDateDeskIn', '');" value="${planDetails.departureDate}" placeholder="<fmt:message key="flight.main.quote.q1" bundle="${msg}" />" readonly>
                </div>
                
                </td>
              <td class="" style="min-width: 150px;">
                <div class="input-group date" id="dp2" style="display: inline-block;background-color:#eee;"> <span class="input-group-addon in border-radius" style="display:inline-block;width:25%;"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
                  <input name="returnDate" type="text" class="datepicker form-control border-radius" style="display:inline-block;width:70%;" id="txtEndDateDesk" onblur="chkValidFlightDate(this, 'endDateDeskIn', '', 'txtStartDateDesk', 'startDateDeskIn','');" value="${planDetails.returnDate}" placeholder="<fmt:message key="flight.main.quote.q2" bundle="${msg}" />" readonly>
                </div>
              
             </td>
              <td class="" style="min-width: 190px;">
                <div class="dropdown  form-group drop-down wh-bg input-group-div marg-b2 dropup" id="myFWDropdown">
                 
                  <a href="#" class="dropdown-toggle col-lg-12 col-md-12" data-toggle="dropdown">  <label class="select-label"><fmt:message key="flight.main.quote.plan1.type" bundle="${msg}" />:</label> <label id="lblCountDesk"></label>&nbsp;<i class="fa fa-caret-down pull-right"></i> </a>
                  <div class="dropdown-menu bdr1" style="width: 355px;">
                    <div class="drop-content">
                      <div class="col-lg-6 col-md-6">
                        <label class="radio radio-warning radio-inline">
                          <input type="radio" name="planSelected" id="personal_plan_desk" data-id="desk" class="plan" value="personal"  <%=PersonalPlanChecked%> >
                          <label for="personal_plan_desk"><fmt:message key="flight.main.quote.plan1" bundle="${msg}" /> </label>
                         </label> 
                      </div>
                      <div class="col-lg-6 col-md-6">
                       <label class="radio radio-warning radio-inline">
                          <input type="radio" name="planSelected" id="family_plan_desk" data-id="desk" class="plan" value="family" <%=FamilyPlanChecked %>>
                          <label for="family_plan_desk"><fmt:message key="flight.main.quote.plan2" bundle="${msg}" /><a
                        class="tool-tip show-inline-md"
                        data-toggle="tooltip" data-placement="bottom"
                        title="<fmt:message key="flight.main.quote.family.help" bundle="${msg}" />">
                        <img src="<%=request.getContextPath()%>/resources/images/ic.png"
                        alt="" style="height: 20px; width:20px;"></a></label>
                          </label>
                      </div>
                      <div class="clearfix"></div>
                      <hr>
                      <!-- start of personal plan desk spinner-->
                      <input type="hidden" name="" id="family_desk_count" value="${planDetails.totalFamilyTravellers}">
                      <div class="plan_spinner_desk" id="personal_plan_desk_spinner" <%=personalSpinnerStyle%>>
                        <div class="col-lg-6">
                          <h4><fmt:message key="flight.main.quote.plan1.type" bundle="${msg}" /> </h4>
                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtTravellersDesk" data-parent="personal"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <div class="text-center drop-down-plus wd4 input-number">${planDetails.totalPersonalTraveller}</div>
                            <input type="hidden" name="totalPersonalTraveller" data-min="1" data-max="15" id="txtTravellersDesk" value="${planDetails.totalPersonalTraveller}"/>
                            <span class="input-group-btn data-up ">
                            <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtTravellersDesk" data-parent="personal"> <span class="glyphicon glyphicon-plus"></span> </button>
                            </span> </div>
                        </div>
                      </div>
                      <!-- end of personal plan desk spinner-->
                      <div class="clearfix"></div>
                      
                      <!-- start of family plan desk spinner-->
                      <div class="plan_spinner_desk" id="family_plan_desk_spinner" <%=familySpinnerStyle%>>
                        <div class="col-lg-6">
                          <h4><fmt:message key="flight.main.quote.plan2.type1" bundle="${msg}" /></h4>
                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtAdultsDesk" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <div class="text-center drop-down-plus wd4 input-number">${planDetails.totalAdultTraveller}</div>
              <input type="hidden" name="totalAdultTraveller" id="txtAdultsDesk" data-min="1" data-max="2" value="${planDetails.totalAdultTraveller}"/>
                            <span class="input-group-btn data-up ">
                            <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtAdultsDesk" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                            </span> </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-lg-6">
                          <h4><fmt:message key="flight.main.quote.plan2.type2" bundle="${msg}" /></h4>
                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtChildDesk" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <div class="text-center drop-down-plus wd4 input-number">${planDetails.totalChildTraveller}</div>
              <input type="hidden" name="totalChildTraveller" id="txtChildDesk" data-min="1" data-max="14" value="${planDetails.totalChildTraveller}"/>
                            <span class="input-group-btn data-up ">
                            <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtChildDesk" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                            </span> </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-lg-6">
                          <h4><fmt:message key="flight.main.quote.plan2.type3" bundle="${msg}" /></h4>
                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtOtherDesk" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <div class="text-center drop-down-plus wd4 input-number">${planDetails.totalOtherTraveller}</div>
                            <input type="hidden" name="totalOtherTraveller" id="txtOtherDesk" data-min="0" data-max="14" value="${planDetails.totalOtherTraveller}"/>
                            <span class="input-group-btn data-up ">
                            <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtOtherDesk" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                            </span> </div>
                        </div>
                        <div class="col-lg-12 child-notes">
                            <h4><fmt:message key="flight.main.quote.childnotes" bundle="${msg}" /></h4>
                        </div>
                      </div>
                      
                      <!-- start of family plan bottom spinner-->
                      
                      <div class="clearfix"></div>
                    </div>
                  </div>
                  <div class="clearfix"></div>
                </div>
                
                </td>
              <td class="">
                <button  type="submit" class="bdr-curve btn btn-primary btn-lg marg-t2 pad-increase vwo-test-001 btn-color-ylw" onclick="reset_desktop_submit()">
              <fmt:message key="flight.main.quote.top.action" bundle="${msg}" />
             </button> 
              </td>
              
        
            </tr>
            
            <tr class="product-landing-error-wrap">
              <td><span id="startDateDeskIn" class="text-red" > </span></td>
              <td><span id="endDateDeskIn" class="text-red"> </span></td>
              <td>
                <span id="travelCountDeskIn" style="display:none" class="text-red">
                    <label class="text-red"><fmt:message key="flight.main.quote.q3.error" bundle="${msg}" /></label>
                </span>
            </td>
              <td></td>
            </tr>
          </tbody>
        </table>
            
            
          
        </form>
      </div>
      <!--/.col-sm-6--> 
      
    </div>
    <!--/.row--> 
  </div>
  <!--/.container--> 
</section>
<!-- flight form top end -->
</section>



<!--Mobile-form-->
<div class="slider-form hidden-lg hidden-md">
 <form id="freeFlight" name="freeFlight" method="post"   onsubmit="return flightValidateMob()" action="<%=request.getContextPath()%>/${language}/flight-insurance/quote">
  <div class="form-container">
    <h2><fmt:message key="flight.main.quote.top.heading" bundle="${msg}" /></h2>
    <h4><fmt:message key="flight.main.quote.q1" bundle="${msg}" /></h4>
    <div class="form-group">
      <div class="input-group date" id="dp3"> <span class="input-group-addon in"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt="calendar"></span></span>
        <input type="text" name="departureDate" class="datepicker form-control" id="txtStartDateMob" onblur="chkValidFlightDepartureDate(this, 'startDateMobIn', '');" value="${planDetails.departureDate}" readonly>
      </div>
    </div>
    <span id="startDateMobIn"  class="text-red"> </span>
    <h4><fmt:message key="flight.main.quote.q2" bundle="${msg}" /></h4>
    <div class="form-group">
      <div class="input-group date" id="dp4"> <span class="input-group-addon in"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt="calendar"></span></span>
        <input type="text" name="returnDate" class="datepicker form-control" id="txtEndDateMob" onblur="chkValidFlightDate(this, 'endDateMobIn', 'Return Date', 'txtStartDateMob', 'startDateMobIn', '');" value="${planDetails.returnDate}" readonly>
      </div>
    </div>
    <span id="endDateMobIn" class="text-red"> </span>
    <h4><fmt:message key="flight.main.quote.q3" bundle="${msg}" /></h4>
    <div class="dropdown  form-group drop-down dropup" id="myFWDropdownMob">
     <a href="#" class="dropdown-toggle  col-sm-12 col-xs-12"  data-toggle="dropdown"> <label id="lblCountMob"></label> <i class="fa fa-caret-down pull-right"></i> </a>
      <div class="dropdown-menu bdr1 wd2">
        <div class="drop-content">
          <div class="col-xs-6 col-sm-6">
            <label class="radio radio-warning radio-inline">
              <input type="radio"  name="planSelected" id="personal_plan_mob"  data-id="mob" class="plan" value="personal" <%=PersonalPlanChecked%>>
              <label for="personal_plan_mob">  <fmt:message key="flight.main.quote.plan1" bundle="${msg}" /> </label>
            </label>  
          </div>
          <div class="col-xs-6 col-sm-6">
            <label class="radio radio-warning radio-inline">
              <input type="radio"   name="planSelected" id="family_plan_mob"  data-id="mob" class="plan" value="family" <%=FamilyPlanChecked %>>
              <label for="family_plan_mob"><fmt:message key="flight.main.quote.plan2" bundle="${msg}" /><a
                        class="tool-tip show-inline-md"
                        data-toggle="tooltip" data-placement="bottom"
                        title="<fmt:message key="flight.main.quote.family.help" bundle="${msg}" />">
                        <img src="<%=request.getContextPath()%>/resources/images/ic.png"
                        alt="" style="height: 20px; width: 20px;"></a></label>
           </label> 
          </div>
          <div class="clearfix"></div>
          <hr>
          <!-- Start of personal plan mobile spinner-->
          <input type="hidden" name="familyPlan" id="family_mob_count" value="${planDetails.totalFamilyTravellers}">
          <div class="plan_spinner_mob" id="personal_plan_mob_spinner" <%=personalSpinnerStyle%>>
            <div class="col-xs-6 col-sm-6">
              <h4><fmt:message key="flight.main.quote.plan1.type" bundle="${msg}" /> </h4>
            </div>
            <div class="col-xs-6 col-sm-6">
              <div class="input-group number-spinner none-bd "> <span class="input-group-btn data-dwn" >
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="minus" data-field="txtTravellersMob" data-parent="personal"> <span class="glyphicon glyphicon-minus"></span> </button>
                </span>
                <div class="text-center drop-down-plus wd4 input-number">${planDetails.totalPersonalTraveller}</div>
                <input type="hidden" name="totalPersonalTraveller" id="txtTravellersMob" data-min="1" data-max="15" value="${planDetails.totalPersonalTraveller}"/>
                <span class="input-group-btn data-up ">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtTravellersMob" data-parent="personal"> <span class="glyphicon glyphicon-plus"></span> </button>
                </span> </div>
            </div>
          </div>
          <!-- End of personal plan mobile spinner--> 
          <!-- Start of family plan mobile spinner-->
          <div class="plan_spinner_mob" id="family_plan_mob_spinner" <%=familySpinnerStyle%>>
            <div class="col-xs-6 col-sm-6">
              <h4><fmt:message key="flight.main.quote.plan2.type1" bundle="${msg}" /></h4>
            </div>
            <div class="col-xs-6 col-sm-6">
              <div class="input-group number-spinner none-bd "> <span class="input-group-btn data-dwn" >
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="minus" data-field="txtAdultsMob" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                </span>
                <div class="text-center drop-down-plus wd4 input-number">${planDetails.totalAdultTraveller}</div>
                <input type="hidden" name="totalAdultTraveller" id="txtAdultsMob" data-min="1" data-max="2" value="${planDetails.totalAdultTraveller}"/>
                <span class="input-group-btn data-up ">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtAdultsMob" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                </span> </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-xs-6 col-sm-6">
              <h4><fmt:message key="flight.main.quote.plan2.type2" bundle="${msg}" /></h4>
            </div>
            <div class="col-xs-6 col-sm-6">
              <div class="input-group number-spinner none-bd "> <span class="input-group-btn data-dwn" >
               
               
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="minus" data-field="txtChildMob" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                </span>
                <div class="text-center drop-down-plus wd4 input-number">${planDetails.totalChildTraveller}</div>
                <input type="hidden" name="totalChildTraveller" id="txtChildMob" data-min="1" data-max="14" value="${planDetails.totalChildTraveller}"/>
                <span class="input-group-btn data-up ">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtChildMob" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                </span> </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-xs-6 col-sm-6">
              <h4><fmt:message key="flight.main.quote.plan2.type3" bundle="${msg}" /></h4>
            </div>
            <div class="col-xs-6 col-sm-6">
              <div class="input-group number-spinner none-bd "> <span class="input-group-btn data-dwn" >
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="minus" data-field="txtOtherMob" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                </span>
                <div class="text-center drop-down-plus wd4 input-number">${planDetails.totalOtherTraveller}</div>
                <input type="hidden" name="totalOtherTraveller" id="txtOtherMob" data-min="0" data-max="14" value="${planDetails.totalOtherTraveller}"/>
                <span class="input-group-btn data-up ">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtOtherMob" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                </span> </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-lg-12 child-notes">
                <h4><fmt:message key="flight.main.quote.childnotes" bundle="${msg}" /></h4>
            </div>
            <div class="clearfix"></div>
          </div>
          <!-- End of family plan mobile spinner -->
          <div class="clearfix"></div>
        </div>
      </div>
      <div class="clearfix"></div>
    </div>
    <span id="travelCountMobIn" style="display:none" class="text-red">
    <label class="text-red"><fmt:message key="flight.main.quote.q3.error" bundle="${msg}" /></label>
    </span>
    <div class="text-center" id="divPersonsMob" style="visibility:hidden;">
      <small>
      <label id="lblPeopleMob">0</label>
       <fmt:message key="flight.main.quote.total.people" bundle="${msg}" />
      <label id="lblDaysMob">0</label>
       <fmt:message key="flight.main.quote.total.days" bundle="${msg}" /> </small>
    </div>
  </div>
  <div class="form-container">
    <h3 class="text-center"> 
  <button type="submit" onclick="reset_mobile_submit()" class="bdr-curve btn btn-primary btn-lg btn-block vwo-test-001 btn-color-ylw"><fmt:message key="flight.main.quote.top.action" bundle="${msg}" /></button>
  </h3> 
  </div>
  </form>
</div>
<!--Mobile-form--> 

<!--/#main-slider-->

<section id="feature" style="margin-top:40px;">
  <div class="container pad-none">
    <div class="center wow fadeInDown"> 
      <!--desktop-->
      <h1 class="landing_h2 col-md-10 col-md-offset-1 hidden-sm hidden-xs"><fmt:message key="flight.main.desc" bundle="${msg}" /></h1>
      <!--end-desktop--> 
      
      <!--Mobile-->
      <h1 class="landing_h2 hidden-lg hidden-md feature-ttl"><fmt:message key="flight.main.desc" bundle="${msg}" /></h1>
      <!--end mobile--> 
    </div>
    
    <!--desktop Features-->
    <div class="center wow fadeInDown">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	        <div class="col-xs-12 col-sm-12 col-md-4 pad-none" style="padding:5px !important;">
	            <div style="border: 1px solid #D1D1D1; height:450px;margin-bottom: 20px;padding-left: 10%;padding-right: 10%;">
	              <h2 class="landing-feature-title">
	                <fmt:message key="flight.main.feature1.heading" bundle="${msg}" />
	              </h2>
	              <div style="margin-top:25px;">
	                   <img style="max-width:30%" src="<%=request.getContextPath()%>/resources/images/iFWD_flight_icon1.png" />
	              </div>
	              <div style="margin-top:10px;">
	                   <fmt:message key="flight.main.feature1.paragraph" bundle="${msg}" />
	              </div>
	              </div>
	          </div>
	          <div class="col-xs-12 col-sm-12 col-md-4 pad-none" style="padding:5px !important;">
	               <div style="border: 1px solid #D1D1D1; height:450px;margin-bottom: 20px;padding-left: 10%;padding-right: 10%;">
	              <h2 class="landing-feature-title">
	                 <fmt:message key="flight.main.feature2.heading" bundle="${msg}" />
	              </h2>
	              <div style="margin-top:25px;">
	                   <img style="max-width:30%" src="<%=request.getContextPath()%>/resources/images/iFWD_flight_icon2.png" />
	              </div>
	              <div style="margin-top:10px;">
	                    <fmt:message key="flight.main.feature2.paragraph" bundle="${msg}" />
	              </div>
	              </div>
	          </div>
	          <div class="col-xs-12 col-sm-12 col-md-4 pad-none" style="padding:5px !important;">
	              <div style="border: 1px solid #D1D1D1; height:450px;margin-bottom: 20px;padding-left: 10%;padding-right: 10%;">
	                   <h2 class="landing-feature-title">
	                     <fmt:message key="flight.main.feature3.heading" bundle="${msg}" />
	                  </h2>
	                  <div style="margin-top:25px;">
	                       <img style="max-width:30%" src="<%=request.getContextPath()%>/resources/images/iFWD_flight_icon3.png" />
	                  </div>
	                  <div style="margin-top:10px;">
	                      <fmt:message key="flight.main.feature3.paragraph" bundle="${msg}" />
	                  </div>
	              </div>
	          </div>
	          <div class="clearfix"></div>
	      </div>
	      <div class="clearfix"></div>
      </div>
      
	<div id="special-promotion" class="other-benefits col-lg-12 col-md-12 hidden-sm hidden-xs" style="margin-left:10px;">
	  <h2><fmt:message key="special.promotion.headline" bundle="${msg}" /></h2>
	  <ul class="bullets">
        <li>
          <p class="h4-5"><a href="<fmt:message key="theclub.link" bundle="${msg}" />" target="_blank"><fmt:message key="flight.main.other.tnc.desc9.part1" bundle="${msg}" /></a> <fmt:message key="flight.main.other.tnc.desc9.part2" bundle="${msg}" /> <a href="<fmt:message key="theclub.clubpoint.link" bundle="${msg}" />" target="_blank"><fmt:message key="flight.main.other.tnc.desc9.part3" bundle="${msg}" /></a> <fmt:message key="flight.main.other.tnc.desc9.part4" bundle="${msg}" /></p> 
        </li>	    
        <!--<li>
          <p class="h4-5"><a href="<fmt:message key="special.promotion.copy5.1.url" bundle="${msg}" />" target="_blank"><fmt:message key="special.promotion.copy5.1" bundle="${msg}" /></a><fmt:message key="special.promotion.copy5.2" bundle="${msg}" /><a href="<fmt:message key="special.promotion.copy5.3.url" bundle="${msg}" />" target="_blank"><fmt:message key="special.promotion.copy5.3" bundle="${msg}" /></a><fmt:message key="special.promotion.copy5.4" bundle="${msg}" /></p>
        </li>-->    
	  </ul>
	  
	  <div class="col-lg-12 col-md-12 col-xs-12 main-partner" style="">
	      <img src="<%=request.getContextPath()%>/resources/images/partner_theclub.png" alt="" class="">
	  </div>
	</div>    
    <div class="other-benefits col-lg-12 col-md-12 hidden-sm hidden-xs" style="margin-left:10px;">
          <h2><fmt:message key="flight.main.other.tnc" bundle="${msg}" /></h2>
          <ul class="bullets">
            <li>
              <p class="h4-5 "> <fmt:message key="flight.main.other.tnc.desc1" bundle="${msg}" /> </p>
            </li>
            <li>
              <p class="h4-5 "> <fmt:message key="flight.main.other.tnc.desc2" bundle="${msg}" /> </p>
            </li>
            <li>
              <p class="h4-5 ">  <fmt:message key="flight.main.other.tnc.desc3" bundle="${msg}" /></p>
            </li>
            <li>
              <p class="h4-5 "> <fmt:message key="flight.main.other.tnc.desc4" bundle="${msg}" /></p>
            </li>
            <li>
              <p class="h4-5 "> <fmt:message key="flight.main.other.tnc.desc5" bundle="${msg}" /></p>
            </li>
            <li>
              <p class="h4-5 "> <fmt:message key="flight.main.other.tnc.desc6" bundle="${msg}" /> </p>
            </li>
            <!--<li>
              <p class="h4-5"><fmt:message key="flight.main.other.tnc.desc7.part1" bundle="${msg}" /> <a href="<fmt:message key="y5buddy.link" bundle="${msg}" />" target="_blank"><fmt:message key="flight.main.other.tnc.desc7.part2" bundle="${msg}" /></a> <fmt:message key="flight.main.other.tnc.desc7.part3" bundle="${msg}" /></p>
            </li>
            <li>
              <p class="h4-5"><fmt:message key="flight.main.other.tnc.desc8.part1" bundle="${msg}" /> <a href="<fmt:message key="agoda.promo.link" bundle="${msg}" />" target="_blank"><fmt:message key="flight.main.other.tnc.desc8.part2" bundle="${msg}" /></a> <fmt:message key="flight.main.other.tnc.desc8.part3" bundle="${msg}" /></p>  
            </li>
            <li>
              <p class="h4-5"><fmt:message key="flight.main.other.tnc.desc9.part1" bundle="${msg}" /> <a href="<fmt:message key="theclub.link" bundle="${msg}" />" target="_blank"><fmt:message key="flight.main.other.tnc.desc9.part2" bundle="${msg}" /></a> <fmt:message key="flight.main.other.tnc.desc9.part3" bundle="${msg}" /> <a href="<fmt:message key="theclub.clubpoint.link" bundle="${msg}" />" target="_blank"><fmt:message key="flight.main.other.tnc.desc9.part4" bundle="${msg}" /></a> <fmt:message key="flight.main.other.tnc.desc9.part5" bundle="${msg}" /></p>  
            </li>             
          </ul>
          <div class="col-lg-12 col-md-12 col-xs-12 main-partner" style="">
	        <img src="<%=request.getContextPath()%>/resources/images/partner_agoda.png" alt="" class="" style="margin-right:15px;">
            <img src="<%=request.getContextPath()%>/resources/images/partner_y5.png" alt="" class="" style="margin-right:15px;">
	        <img src="<%=request.getContextPath()%>/resources/images/partner_theclub.png" alt="" class="" style="margin-right:15px;">   
		  </div>-->
          <div class="spacer3"></div>
          <p class="h4-6"><fmt:message key="flight.main.other.disclaimer.part1" bundle="${msg}" /> <a href="https://home.fwd.com.hk/gidoc/policyprovisions/FlightCare_JacketLatest.pdf" target="_blank" class=""><u><fmt:message key="flight.main.other.disclaimer.part2" bundle="${msg}" /></u></a> <fmt:message key="flight.main.other.disclaimer.part3" bundle="${msg}" /><fmt:message key="flight.main.other.disclaimer.part4" bundle="${msg}" />
          </p>
        </div>

<div id="other-offers-mob" class="other-benefits col-xs-12 col-sm-12 hidden-lg hidden-md">
  <h2 style="text-align: center;"><fmt:message key="special.promotion.headline" bundle="${msg}" /></h2>
  <div class="carousel slide">
    <div class="carousel-inner">
      <div class="item active" >
          <div class="slide-margin">
            <div class="other-benefits-wrap text-center">
              <div class="other-benefits-inner">
                <p style="font-size: 21px;"><a href="<fmt:message key="theclub.link" bundle="${msg}" />" target="_blank"><fmt:message key="flight.main.other.tnc.desc9.part1" bundle="${msg}" /></a> <fmt:message key="flight.main.other.tnc.desc9.part2" bundle="${msg}" /> <a href="<fmt:message key="theclub.clubpoint.link" bundle="${msg}" />" target="_blank"><fmt:message key="flight.main.other.tnc.desc9.part3" bundle="${msg}" /></a> <fmt:message key="flight.main.other.tnc.desc9.part4" bundle="${msg}" /></p>
              </div>
            </div>
          </div>
      </div>      
    </div>
    <!--/.carousel-inner--> 
    <!--<a class="prev" href="#other-offers-mob" data-slide="prev"> <i class="fa fa-chevron-left"></i> </a>
    <a class="next" href="#other-offers-mob" data-slide="next"> <i class="fa fa-chevron-right"></i> </a>-->
  </div>
  <!--/.carousel-->
  <div class="clearfix"></div>
          <div class="col-lg-12 col-md-12 col-xs-12 main-partner mob" style="text-align:center">
            <div class="col-sm-12 col-xs-12">
              <img src="<%=request.getContextPath()%>/resources/images/partner_theclub.png" alt="" class="" style="margin-bottom:15px;">
            </div>
          </div>  
</div>       
      <div id="other-benefits-mob" class="other-benefits col-xs-12 col-sm-12 hidden-lg hidden-md">
          <h2 style="text-align: center;"><fmt:message key="flight.main.other.tnc" bundle="${msg}" /></h2>
          <div class="carousel slide">
            <div class="carousel-inner">
              <div class="item active">
                  <div class="slide-margin">
                    <div class="other-benefits-wrap text-center">
                      <div class="other-benefits-inner">
                        <p style="font-size: 21px;"><fmt:message key="flight.main.other.tnc.desc1" bundle="${msg}" /></p>
                      </div>
                    </div>
                  </div>
              </div>
              <!--/.item-->
              <div class="item" >
                  <div class="slide-margin">
                    <div class="other-benefits-wrap text-center">
                      <div class="other-benefits-inner">
                        <p style="font-size: 21px;"><fmt:message key="flight.main.other.tnc.desc2" bundle="${msg}" /></p>
                      </div>
                    </div>
                  </div>
              </div>
              <!--/.item-->
              <div class="item" >
                  <div class="slide-margin">
                    <div class="other-benefits-wrap text-center">
                      <div class="other-benefits-inner">
                        <p style="font-size: 21px;"><fmt:message key="flight.main.other.tnc.desc3" bundle="${msg}" /></p>
                      </div>
                    </div>
                  </div>
              </div>
              <!--/.item-->
              <div class="item" >
                  <div class="slide-margin">
                    <div class="other-benefits-wrap text-center">
                      <div class="other-benefits-inner">
                        <p style="font-size: 21px;"><fmt:message key="flight.main.other.tnc.desc4" bundle="${msg}" /></p>
                      </div>
                    </div>
                  </div>
              </div>
              <!--/.item-->
              <div class="item" >
                  <div class="slide-margin">
                    <div class="other-benefits-wrap text-center">
                      <div class="other-benefits-inner">
                        <p style="font-size: 21px;"><fmt:message key="flight.main.other.tnc.desc5" bundle="${msg}" /></p>
                      </div>
                    </div>
                  </div>
              </div>
              <!--/.item-->
              <div class="item" >
                  <div class="slide-margin">
                    <div class="other-benefits-wrap text-center">
                      <div class="other-benefits-inner">
                        <p style="font-size: 21px;"><fmt:message key="flight.main.other.tnc.desc6" bundle="${msg}" /></p>
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
          
          <!--<div class="col-lg-12 col-md-12 col-xs-12 main-partner mob" style="text-align:center">
		        <div class="col-lg-12 col-md-12 col-xs-12">
              <img src="<%=request.getContextPath()%>/resources/images/partner_agoda.png" alt="" class="" style="margin-bottom:15px;">
            </div>
            <div class="col-lg-12 col-md-12 col-xs-12">
              <img src="<%=request.getContextPath()%>/resources/images/partner_y5.png" alt="" class="" style="margin-bottom:15px;">
            </div>
            <div class="col-lg-12 col-md-12 col-xs-12">
              <img src="<%=request.getContextPath()%>/resources/images/partner_theclub.png" alt="" class="" style="margin-bottom:15px;">
            </div>
          </div>-->

          <div class="spacer3"></div>
          <p class="h4-6"><fmt:message key="flight.main.other.disclaimer.part1" bundle="${msg}" /> <a href="https://home.fwd.com.hk/gidoc/policyprovisions/FlightCare_JacketLatest.pdf" target="_blank" class=""><u><fmt:message key="flight.main.other.disclaimer.part2" bundle="${msg}" /></u></a> <fmt:message key="flight.main.other.disclaimer.part3" bundle="${msg}" /><fmt:message key="flight.main.other.disclaimer.part4" bundle="${msg}" />
          </p>
        <!--/.container-->
        </div>
    
    <!--/.row--> 
  </div>
  <!--/.container--> 
</section>
<!--/#feature-->

<section id="recent-works" class="hidden-xs hidden-sm">
  <div class="container pad-none"> 
    <!--Desktop Support-->
    <div class="row hidden-sm hidden-xs">
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
        <div class="recent-work-wrap wrap  text-center">
          <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/time.png" alt=""  />
            <h1><fmt:message key="flight.main.highlight1.heading.line1" bundle="${msg}" /><br>
              <fmt:message key="flight.main.highlight1.heading.line2" bundle="${msg}" /></h1>
            <p>
              <fmt:message key="flight.main.highlight1.desc.part1" bundle="${msg}" /> <a href="<fmt:message key="app.download.link" bundle="${msg}" />" target="_blank"><u><fmt:message key="flight.main.highlight1.desc.part2" bundle="${msg}" /></u> </a>  <fmt:message key="flight.main.highlight1.desc.part3" bundle="${msg}" />
            </p>
            </div>
        </div>
      </div>
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
        <div class="recent-work-wrap-mid wrap  text-center">
          <div class="recent-work-inner less-padding-orange"> <img src="<%=request.getContextPath()%>/resources/images/secure.png" alt=""  />
            <h1><fmt:message key="flight.main.highlight2.heading.line1" bundle="${msg}" /><br>
              <fmt:message key="flight.main.highlight2.heading.line2" bundle="${msg}" /></h1>
              <p><fmt:message key="flight.main.highlight2.desc" bundle="${msg}" /><br>
              <br>
            </p>
          </div>
        </div>
      </div>
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
        <div class="recent-work-wrap wrap  text-center">
          <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/rewards.png" alt=""  />
             <h1><fmt:message key="flight.main.highlight3.heading.line1" bundle="${msg}" /><br>
              <fmt:message key="flight.main.highlight3.heading.line2" bundle="${msg}" /></h1>
            <p><fmt:message key="flight.main.highlight3.desc" bundle="${msg}" /></p>
          </div>
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
                <h2><fmt:message key="flight.main.highlight1.heading.line1" bundle="${msg}" /> <fmt:message key="flight.main.highlight1.heading.line2" bundle="${msg}" /></h2>
                <p><fmt:message key="flight.main.highlight1.desc.part1" bundle="${msg}" /> <a  href="<fmt:message key="app.download.link" bundle="${msg}" />" target="_blank"><u><fmt:message key="flight.main.highlight1.desc.part2" bundle="${msg}" /></u> </a> <fmt:message key="flight.main.highlight1.desc.part3" bundle="${msg}" /></p>
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
                <h2><fmt:message key="flight.main.highlight2.heading.line1" bundle="${msg}" /> <fmt:message key="flight.main.highlight2.heading.line2" bundle="${msg}" /></h2>
                <p><fmt:message key="flight.main.highlight2.desc" bundle="${msg}" /></p>
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
                <h2><fmt:message key="flight.main.highlight3.heading.line1" bundle="${msg}" /> <fmt:message key="flight.main.highlight3.heading.line2" bundle="${msg}" /></h2>
                <p><fmt:message key="flight.main.highlight3.desc" bundle="${msg}" /></p>
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

  <div class="content-disclaimer">
     <p><fmt:message key="Home.Landing.Disclaimer" bundle="${msg}" /></p>
  </div>

<section class="blog-item hidden-sm hidden-xs">
  <div class="container pad-none">
    <div class="center">
      <h2><fmt:message key="flight.main.blog.heading" bundle="${msg}" /></h2>
    </div>
      <div>
        <div class="col-lg-4 col-md-4 pad-none">
          <div class="services-wrap service-bx1">
            <div>
              <a href="<fmt:message key="flight.blog.post1.link" bundle="${msg}" />" target="_blank"><img class="img-responsive bdr-img"
                src="<%=request.getContextPath()%>/resources/images/home4.png" alt=""></a>
              <h3>
                <a href="<fmt:message key="flight.blog.post1.link" bundle="${msg}" />" target="_blank">  <fmt:message key="flight.main.blog.subheading1" bundle="${msg}" /> <i class="fa fa-caret-right"></i>
                </a>
              </h3>

            </div>
          </div>
        </div>
        <div class="col-lg-4 col-md-4 pad-none">
          <div class="services-wrap service-bx2">
            <div>
              <a href="<fmt:message key="flight.blog.post2.link" bundle="${msg}" />" target="_blank"><img class="img-responsive bdr-img"
                src="<%=request.getContextPath()%>/resources/images/home5.png" alt=""></a>
              <h3>
                <a href="<fmt:message key="flight.blog.post2.link" bundle="${msg}" />" target="_blank"> <fmt:message key="flight.main.blog.subheading2" bundle="${msg}" /> <i
                  class="fa fa-caret-right"></i>
                </a>
              </h3>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-md-4 pad-none">
          <div class="services-wrap service-bx3">
            <div>
              <a href="<fmt:message key="flight.blog.post3.link" bundle="${msg}" />" target="_blank"><img class="img-responsive bdr-img"
                src="<%=request.getContextPath()%>/resources/images/home6.png" alt=""></a>
              <h3>
                <a href="<fmt:message key="flight.blog.post3.link" bundle="${msg}" />" target="_blank"> <fmt:message key="flight.main.blog.subheading3" bundle="${msg}" /> <i class="fa fa-caret-right"></i>
                </a>
              </h3>
            </div>
          </div>
        </div>

        <div class="clearfix"></div>
      </div>
    
    <p><fmt:message key="flight.main.blog.disclaimer" bundle="${msg}" /></p>


    <!--/.row--> 
  </div>
  <!--/.container--> 
</section>
<!--/#services-->


<section id="bottom-form" class="hidden-sm hidden-xs">
  <div class="container bmg_flighttravel_main_container">
    <div class="row">
     <form id="freeFlight" name="freeFlight" method="post"   onsubmit="return flightValidateBtm()" action="<%=request.getContextPath()%>/${language}/flight-insurance/quote">
      <div class="col-lg-12 col-md-12 pad-none-lg slide-form">
        <!-- <h2><fmt:message key="flight.main.quote.bottom.heading" bundle="${msg}" /></h2> -->
        <table class="table activation-form3">
          <tbody>
          <tr class="hide-html">
            <td>
                <h3><fmt:message key="flight.main.quote.q1" bundle="${msg}" /></h3>
              </td>
              <td>
                <h3><fmt:message key="flight.main.quote.q2" bundle="${msg}" /></h3>
              </td>
              <td>
                <h3><fmt:message key="flight.main.quote.q3" bundle="${msg}" /></h3>
              </td>
            <td>
              <div id="divPersonsBtm" style="visibility:hidden;">
                  <h3 class="h3-i2">                    
                    <label id="lblPeopleBtm">0</label>
                    <fmt:message key="flight.main.quote.total.people" bundle="${msg}" />
                    <label id="lblDaysBtm">0</label>
                    <input type="hidden" id="lblDaysBtm" name="daysJsp">
					<fmt:message key="flight.main.quote.total.days" bundle="${msg}" /> </h3> 
                </div>
            </td>
          </tr>
            <tr>
              <td class="" style="min-width: 150px;">
                <div class="input-group date" id="dp5" style="display: inline-block;background-color:#eee;"> <span class="input-group-addon in border-radius" style="display:inline-block;width:25%;"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
                  <input name="departureDate" type="text" class="datepicker form-control border-radius" style="display:inline-block;width:70%;" id="txtStartDateBtm" onblur="chkValidFlightDepartureDate(this, 'startDateBtmIn', '');" value="${planDetails.departureDate}" placeholder="<fmt:message key="flight.main.quote.q1" bundle="${msg}" />" readonly>
                </div>
                 <span id="startDateBtmIn" class="text-red"> </span></td>
              <td class="" style="min-width: 150px;">
                <div class="input-group date" id="dp6" style="display: inline-block;background-color:#eee;"> <span class="input-group-addon in border-radius" style="display:inline-block;width:25%;"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
                  <input name="returnDate" type="text" class="datepicker form-control border-radius" style="display:inline-block;width:70%;" id="txtEndDateBtm" onblur="chkValidFlightDate(this, 'endDateBtmIn', '', 'txtStartDateBtm', 'startDateBtmIn', '');" value="${planDetails.returnDate}" placeholder="<fmt:message key="flight.main.quote.q2" bundle="${msg}" />" readonly>
                </div>
                <span id="endDateBtmIn" class="text-red"> </span></td>
              <td class="" style="min-width: 190px;">
                 <div class="dropdown  form-group drop-down wh-bg input-group-div marg-b2 dropup" id="myFWDropdownBtm">
                 
                  <a href="#" class="dropdown-toggle col-lg-12 col-md-12" data-toggle="dropdown">  <label class="select-label"><fmt:message key="flight.main.quote.plan1.type" bundle="${msg}" />:</label> <label id="lblCountBtm"></label>&nbsp;<i class="fa fa-caret-down pull-right"></i> </a>
                  <div class="dropdown-menu bdr1" style="width: 355px;">
                    <div class="drop-content">
                      <div class="col-lg-6 col-md-6">
                        <label class="radio radio-warning radio-inline">
                          <input type="radio" name="planSelected" id="personal_plan_btm" data-id="btm" class="plan" value="personal"  <%=PersonalPlanChecked%> >
                          <label for="personal_plan_btm"> <fmt:message key="flight.main.quote.plan1" bundle="${msg}" /> </label>
                         </label> 
                      </div>
                      <div class="col-lg-6 col-md-6">
                       <label class="radio radio-warning radio-inline">
                          <input type="radio" name="planSelected" id="family_plan_btm" data-id="btm" class="plan" value="family" <%=FamilyPlanChecked %>>
                          <label for="family_plan_btm"><fmt:message key="flight.main.quote.plan2" bundle="${msg}" /><a
                        class="tool-tip show-inline-md"
                        data-toggle="tooltip" data-placement="bottom"
                        title="<fmt:message key="flight.main.quote.family.help" bundle="${msg}" />">
                        <img src="<%=request.getContextPath()%>/resources/images/ic.png"
                        alt="" style="height: 20px; width: 20px;"></a></label>
                          </label>
                      </div>	
                      <div class="clearfix"></div>
                      <hr>
                      <!-- start of personal plan bottom spinner-->
                      <input type="hidden" name="" id="family_btm_count" value="${planDetails.totalFamilyTravellers}">
                      <div class="plan_spinner_btm" id="personal_plan_btm_spinner" <%=personalSpinnerStyle%>>
                        <div class="col-lg-6">
                          <h4><fmt:message key="flight.main.quote.plan1.type" bundle="${msg}" /></h4>
                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtTravellersBtm" data-parent="personal"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <div class="text-center drop-down-plus wd4 input-number">${planDetails.totalPersonalTraveller}</div>
                            <input type="hidden" name="totalPersonalTraveller" data-min="1" data-max="15" id="txtTravellersBtm" value="${planDetails.totalPersonalTraveller}"/>
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
                          <h4><fmt:message key="flight.main.quote.plan2.type1" bundle="${msg}" /></h4>
                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtAdultsBtm" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <div class="text-center drop-down-plus wd4 input-number">${planDetails.totalAdultTraveller}</div>
                            <input type="hidden" name="totalAdultTraveller" id="txtAdultsBtm" data-min="1" data-max="2" value="${planDetails.totalAdultTraveller}"/>
                            <span class="input-group-btn data-up ">
                            <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtAdultsBtm" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                            </span> </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-lg-6">
                          <h4><fmt:message key="flight.main.quote.plan2.type2" bundle="${msg}" /></h4>
                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtChildBtm" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <div class="text-center drop-down-plus wd4 input-number">${planDetails.totalChildTraveller}</div>
                            <input type="hidden" name="totalChildTraveller" id="txtChildBtm" data-min="1" data-max="14" value="${planDetails.totalChildTraveller}"/>
                            <span class="input-group-btn data-up ">
                            <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtChildBtm" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                            </span> </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-lg-6">
                          <h4><fmt:message key="flight.main.quote.plan2.type3" bundle="${msg}" /></h4>
                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtOtherBtm" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <div class="text-center drop-down-plus wd4 input-number">${planDetails.totalOtherTraveller}</div>
                            <input type="hidden" name="totalOtherTraveller" id="txtOtherBtm" data-min="0" data-max="14" value="${planDetails.totalOtherTraveller}"/>
                            <span class="input-group-btn data-up ">
                            <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtOtherBtm" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                            </span> </div>
                        </div>
                        <div class="col-lg-12 child-notes">
                            <h4><fmt:message key="flight.main.quote.childnotes" bundle="${msg}" /></h4>
                        </div>
                      </div>
                      
                      <!-- start of family plan bottom spinner-->
                      
                      <div class="clearfix"></div>
                    </div>
                  </div>
                  <div class="clearfix"></div>
                </div>
                <span id="travelCountBtmIn" class="text-red hide-html">
                <label class="text-red"><fmt:message key="flight.main.quote.q3.error" bundle="${msg}" /></label>
                </span>
                </td>
              <td class="">
                <!--  <input type="submit" class="border-radius btn btn-primary get-btn marg-t2" value="Apply for Free Now!"> -->
                 <button  type="submit" onclick="reset_bottom_submit()" class="bdr-curve btn btn-primary marg-t2 btn-lg pad-increase vwo-test-001 btn-color-ylw">
              <fmt:message key="flight.main.quote.bottom.action" bundle="${msg}" />
             </button> 
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
<style>
   @media screen and (max-width: 991px) {
   body {
      /* Hero image Position Fix*/
      padding-top: 50px;
   }
</style>
