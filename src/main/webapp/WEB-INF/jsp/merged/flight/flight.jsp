<%@page import="com.ifwd.fwdhk.model.PlanDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<!-- Google Tag Manager -->
<noscript>
<iframe src="//www.googletagmanager.com/ns.html?id=GTM-MWPF25"
height="0" width="0" style="display:none;visibility:hidden"></iframe>
</noscript>
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-MWPF25');</script> 
<!-- End Google Tag Manager --> 

<script type="text/javascript">

  // personal or family
  var traveller;  
  
  // personal
  var personalTraveller = parseInt("${planDetails.getTravellerCount()}");
  // family
  var familyAdult = "${planDetails.getTotalAdultTraveller()}";
  var familyChild = "${planDetails.getTotalChildTraveller()}";
  var familyOther = "${planDetails.getTotalOtherTraveller()}";  
  var familyTraveller = parseInt(familyAdult) + parseInt(familyChild) + parseInt(familyOther);

  if("${planDetails.getPlanSelected()}".toLowerCase() == "family"){
    traveller = familyTraveller;
  }else{
    traveller = personalTraveller;
  }

     function reset_submit()
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
      //frm.submit();
     }  
</script>
<!-- Start fixed header -->
<script type='text/javascript'>
$(document).ready(function() {
    $(".navbar-inverse").addClass("product-header");
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
<section id="main-slider" class="no-margin"> 
<!--Mobile banner--> 
<img src="<%=request.getContextPath()%>/<fmt:message key="flight.hero.image.mobile" bundle="${msg}" />" alt="" class="img-responsive hidden-lg hidden-md"  /> 
  <!--Mobile banner-->
  <div class="carousel slide hidden-xs hidden-sm">
    <div class="carousel-inner">
      <div class="item active">
     
        <img src="<%=request.getContextPath()%>/<fmt:message key="flight.hero.image" bundle="${msg}" />" alt="">
         </div>
      <!--/.item--> 
    </div>
    <!--/.carousel-inner--> 
  </div>
  <!--/.carousel--> 
</section>

<!-- flight top form -->
  <section id="middle" class="hidden-sm hidden-xs">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 col-md-12 pad-none-lg slide-form">
      <form id="freeFlight" name="freeFlight" method="post"   onsubmit="return flightValidateDesk()" action="<%=request.getContextPath()%>/${language}/flight-insurance/quote">    
        <h2><fmt:message key="flight.main.quote.top.heading" bundle="${msg}" /></h2>
       
             <table class="table activation-form3">
          <tbody>
          <tr>
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
              <td class="col-md-3 pad-none">
                <div class="input-group date" id="dp1"> <span class="input-group-addon in border-radius"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
                  <input name="departureDate" type="text" class="datepicker form-control border-radius" id="txtStartDateDesk" onblur="chkValidFlightDepartureDate(this, 'startDateDeskIn', '');" value="${planDetails.getDepartureDate()}" readonly>
                </div>
                
                </td>
              <td class="col-md-3 pad-none">
                <div class="input-group date" id="dp2"> <span class="input-group-addon in border-radius"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
                  <input name="returnDate" type="text" class="datepicker form-control border-radius" id="txtEndDateDesk" onblur="chkValidFlightDate(this, 'endDateDeskIn', 'Return Date', 'txtStartDateDesk', 'startDateDeskIn','');" value="${planDetails.getReturnDate()}" readonly>
                </div>
              
             </td>
              <td class="col-md-3 pad-none">
                <div class="dropdown  form-group drop-down wh-bg input-group-div marg-b2 dropup" id="myFWDropdown">
                 
                  <a href="#" class="dropdown-toggle col-lg-12 col-md-12" data-toggle="dropdown">  <label id="lblCountDesk"></label> <i class="fa fa-caret-down pull-right"></i> </a>
                  <div class="dropdown-menu bdr1">
                    <div class="drop-content">
                      <div class="col-lg-6">
                        <label class="radio radio-warning radio-inline">
                          <input type="radio" name="planSelected" id="personal_plan_desk" data-id="desk" class="plan" value="personal"  <%=PersonalPlanChecked%> >
                          <label for="personal_plan_desk"><fmt:message key="flight.main.quote.plan1" bundle="${msg}" /> </label>
                         </label> 
                      </div>
                      <div class="col-lg-6">
                       <label class="radio radio-warning radio-inline">
                          <input type="radio" name="planSelected" id="family_plan_desk" data-id="desk" class="plan" value="family" <%=FamilyPlanChecked %>>
                          <label for="family_plan_desk"><fmt:message key="flight.main.quote.plan2" bundle="${msg}" /> </label>
                          </label>
                      </div>
                      <div class="clearfix"></div>
                      <hr>
                      <!-- start of personal plan desk spinner-->
                      <input type="hidden" name="" id="family_desk_count" value="${planDetails.getTotalFamilyTravellers()}">
                      <div class="plan_spinner_desk" id="personal_plan_desk_spinner" <%=personalSpinnerStyle%>>
                        <div class="col-lg-6">
                          <h4><fmt:message key="flight.main.quote.plan1.type" bundle="${msg}" /> </h4>
                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtTravellersDesk" data-parent="personal"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <div class="text-center drop-down-plus wd4 input-number">${planDetails.getTravellerCount()}</div>
                            <input type="hidden" name="travellerCount" data-min="1" data-max="15" id="txtTravellersDesk" value="${planDetails.getTravellerCount()}"/>
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
                          <h4><fmt:message key="flight.main.quote.plan2.type1" bundle="${msg}" /> </h4>
                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtAdultsDesk" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <div class="text-center drop-down-plus wd4 input-number">${planDetails.getTotalAdultTraveller()}</div>
              <input type="hidden" name="totalAdultTraveller" id="txtAdultsDesk" data-min="1" data-max="2" value="${planDetails.getTotalAdultTraveller()}"/>
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
                            <div class="text-center drop-down-plus wd4 input-number">${planDetails.getTotalChildTraveller()}</div>
              <input type="hidden" name="totalChildTraveller" id="txtChildDesk" data-min="1" data-max="14" value="${planDetails.getTotalChildTraveller()}"/>
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
                            <div class="text-center drop-down-plus wd4 input-number">${planDetails.getTotalOtherTraveller()}</div>
                            <input type="hidden" name="totalOtherTraveller" id="txtOtherDesk" data-min="0" data-max="14" value="${planDetails.getTotalOtherTraveller()}"/>
                            <span class="input-group-btn data-up ">
                            <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtOtherDesk" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                            </span> </div>
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
                <button  type="submit" class="bdr-curve-none btn btn-primary btn-lg marg-t2 pad-increase" onclick="reset_submit()">
              <fmt:message key="flight.main.quote.top.action" bundle="${msg}" />
             </button> 
              </td>
              
        
            </tr>
            
            <tr>
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

<!--Mobile-form-->
<div class="slider-form hidden-lg hidden-md">
 <form name="freeFlight" method="post"   onsubmit="return flightValidateMob()" action="<%=request.getContextPath()%>/${language}/flight-insurance/quote">
  <div class="form-container">
    <h2><fmt:message key="flight.main.quote.top.heading" bundle="${msg}" /></h2>
    <h4><fmt:message key="flight.main.quote.q1" bundle="${msg}" /></h4>
    <div class="form-group">
      <div class="input-group date" id="dp3"> <span class="input-group-addon in"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt="calendar"></span></span>
        <input type="text" name="departureDate" class="datepicker form-control" id="txtStartDateMob" onblur="chkValidFlightDepartureDate(this, 'startDateMobIn', '');" value="${planDetails.getDepartureDate()}" readonly>
      </div>
    </div>
    <span id="startDateMobIn"  class="text-red"> </span>
    <h4><fmt:message key="flight.main.quote.q2" bundle="${msg}" /></h4>
    <div class="form-group">
      <div class="input-group date" id="dp4"> <span class="input-group-addon in"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt="calendar"></span></span>
        <input type="text" name="returnDate" class="datepicker form-control" id="txtEndDateMob" onblur="chkValidFlightDate(this, 'endDateMobIn', 'Return Date', 'txtStartDateMob', 'startDateMobIn', '');" value="${planDetails.getReturnDate()}" readonly>
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
              <label for="family_plan_mob"> <fmt:message key="flight.main.quote.plan2" bundle="${msg}" /> </label>
           </label> 
          </div>
          <div class="clearfix"></div>
          <hr>
          <!-- Start of personal plan mobile spinner-->
          <input type="hidden" name="familyPlan" id="family_mob_count" value="${planDetails.getTotalFamilyTravellers()}">
          <div class="plan_spinner_mob" id="personal_plan_mob_spinner" <%=personalSpinnerStyle%>>
            <div class="col-xs-6 col-sm-6">
              <h4><fmt:message key="flight.main.quote.plan1.type" bundle="${msg}" /> </h4>
            </div>
            <div class="col-xs-6 col-sm-6">
              <div class="input-group number-spinner none-bd "> <span class="input-group-btn data-dwn" >
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="minus" data-field="txtTravellersMob" data-parent="personal"> <span class="glyphicon glyphicon-minus"></span> </button>
                </span>
                <div class="text-center drop-down-plus wd4 input-number">${planDetails.getTravellerCount()}</div>
                <input type="hidden" name="travellerCount" id="txtTravellersMob" data-min="1" data-max="15" value="${planDetails.getTravellerCount()}"/>
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
                <div class="text-center drop-down-plus wd4 input-number">${planDetails.getTotalAdultTraveller()}</div>
                <input type="hidden" name="totalAdultTraveller" id="txtAdultsMob" data-min="1" data-max="2" value="${planDetails.getTotalAdultTraveller()}"/>
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
                <div class="text-center drop-down-plus wd4 input-number">${planDetails.getTotalChildTraveller()}</div>
                <input type="hidden" name="totalChildTraveller" id="txtChildMob" data-min="1" data-max="14" value="${planDetails.getTotalChildTraveller()}"/>
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
                <div class="text-center drop-down-plus wd4 input-number">${planDetails.getTotalOtherTraveller()}</div>
                <input type="hidden" name="totalOtherTraveller" id="txtOtherMob" data-min="0" data-max="14" value="${planDetails.getTotalOtherTraveller()}"/>
                <span class="input-group-btn data-up ">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtOtherMob" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                </span> </div>
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
  <div class="btn-box">
    <h3 class="text-center"> 
  <button type="submit"  class="bdr-curve-none btn btn-primary btn-lg btn-block "><fmt:message key="flight.main.quote.top.action" bundle="${msg}" /></button>
  </h3> 
  </div>
  </form>
</div>
<!--Mobile-form--> 

<!--/#main-slider-->

<section id="feature" >
  <div class="container">
    <div class="center"> 
      <!--desktop-->
      <h2 class="col-md-10 col-md-offset-1 hidden-sm hidden-xs"><fmt:message key="flight.main.desc" bundle="${msg}" /></h2>
      <!--end-desktop--> 
      
      <!--Mobile-->
      <h2 class="hidden-lg hidden-md feature-ttl"><fmt:message key="flight.main.desc" bundle="${msg}" /></h2>
      <!--end mobile--> 
    </div>
    
    <!--desktop Features-->
    <div class="hidden-xs hidden-sm">
      <div class="col-md-10 col-md-offset-1 pad-none home-features">
        <div class="col-md-6 col-lg-6 text-center"> <img src="<%=request.getContextPath()%>/resources/images/home-flight1.png" alt=""  /> </div>
        <div class="col-md-6 col-lg-6">
          <div class="content">
            <h2><fmt:message key="flight.main.feature1.heading" bundle="${msg}" /></h2>
            <p class="details-text"><fmt:message key="flight.main.feature1.paragraph" bundle="${msg}" /></p>
            <a href="" class="h4-4 scrollToTop"><fmt:message key="flight.main.feature.getquote" bundle="${msg}" /></a> </div>
        </div>
        <div class="clearfix"></div>
        <br>
        <div class="col-md-6 col-lg-6">
          <div class="content">
            <h2><fmt:message key="flight.main.feature2.heading" bundle="${msg}" /></h2>
            <p class="details-text"><fmt:message key="flight.main.feature2.paragraph" bundle="${msg}" /></p>
            <a href="" class="h4-4 scrollToTop"><fmt:message key="flight.main.feature.getquote" bundle="${msg}" /></a> </div>
        </div>
        <div class="col-md-6 col-lg-6 text-center"> <img src="<%=request.getContextPath()%>/resources/images/home-flight-mob-2.png" alt=""  /> </div>
        <div class="clearfix"></div>
        <br>
        <div class="col-md-6 col-lg-6 text-center"> <img src="<%=request.getContextPath()%>/resources/images/home-flight3.png" alt=""  /> </div>
        <div class="col-md-6 col-lg-6">
          <div class="content">
            <h2><fmt:message key="flight.main.feature3.heading" bundle="${msg}" /></h2>
            <p class="details-text"><fmt:message key="flight.main.feature3.paragraph" bundle="${msg}" /></p>
            <a href="" class="h4-4 scrollToTop"><fmt:message key="flight.main.feature.getquote" bundle="${msg}" /></a> </div>
        </div>
        <div class="clearfix"></div>
        <div class="other-benefits col-lg-12 col-md-12">
          <h3 class="h4-2"><fmt:message key="flight.main.other.tnc" bundle="${msg}" /></h3>
          <ul class="bullets">
            <li>
              <p class="h4-5"> <fmt:message key="flight.main.other.tnc.desc1" bundle="${msg}" /> </p>
            </li>
            <li>
              <p class="h4-5"> <fmt:message key="flight.main.other.tnc.desc2" bundle="${msg}" /> </p>
            </li>
            <li>
              <p class="h4-5">  <fmt:message key="flight.main.other.tnc.desc3" bundle="${msg}" /></p>
            </li>
            <li>
              <p class="h4-5"> <fmt:message key="flight.main.other.tnc.desc4" bundle="${msg}" /></p>
            </li>
            <li>
              <p class="h4-5"> <fmt:message key="flight.main.other.tnc.desc5" bundle="${msg}" /></p>
            </li>
            <li>
              <p class="h4-5"> <fmt:message key="flight.main.other.tnc.desc6" bundle="${msg}" /> </p>
            </li>
          </ul>
          <div class="spacer3"></div>
          <p class="h4-6"><fmt:message key="flight.main.other.disclaimer.part1" bundle="${msg}" /> <a href="<%=request.getContextPath()%>/resources/policy-provisions-pdf/FlightCare_Provisions_Mar_2015.pdf" target="_blank" class="sub-link-underline"><fmt:message key="flight.main.other.disclaimer.part2" bundle="${msg}" /></a> <fmt:message key="flight.main.other.disclaimer.part3" bundle="${msg}" /></p>
          <p class="h4-6"><fmt:message key="flight.main.other.disclaimer.part4" bundle="${msg}" /></p>
        </div>
      </div>
    </div>
    
    <!--mobile-Features-->
    <div class="hidden-lg hidden-md mob-features">
      <div class="col-xs-4 col-sm-4 text-center"> <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/home-flight1.png" alt=""  /> </div>
      <div class="col-xs-8 col-sm-8">
        <div>
          <h2 class="h2-3"><fmt:message key="flight.main.feature1.heading" bundle="${msg}" /></h2>
          <p class="details-text"><fmt:message key="flight.main.feature1.paragraph" bundle="${msg}" /></p>
          <a href="" class="h4-4 scrollToTop"><fmt:message key="flight.main.feature.getquote" bundle="${msg}" /></a> </div>
      </div>
      <div class="clearfix"></div>
      <br>
      <div class="col-xs-4 col-sm-4 text-center"> <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/home-flight-mob-2.png" alt=""  /> </div>
      <div class="col-xs-8 col-sm-8">
        <div>
          <h2 class="h2-3"><fmt:message key="flight.main.feature2.heading" bundle="${msg}" /></h2>
          <p class="details-text"><fmt:message key="flight.main.feature2.paragraph" bundle="${msg}" /></p>
          <a href="" class="h4-4 scrollToTop"><fmt:message key="flight.main.feature.getquote" bundle="${msg}" /></a> </div>
      </div>
      <div class="clearfix"></div>
      <br>
      <div class="col-xs-4 col-sm-4 text-center"> <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/home-flight3.png" alt=""  /> </div>
      <div class="col-xs-8 col-sm-8">
        <div>
          <h2 class="h2-3"><fmt:message key="flight.main.feature3.heading" bundle="${msg}" /></h2>
          <p class="details-text"><fmt:message key="flight.main.feature3.paragraph" bundle="${msg}" /></p>
          <a href="" class="h4-4 scrollToTop"><fmt:message key="flight.main.feature.getquote" bundle="${msg}" /></a> </div>
      </div>
      <div class="clearfix"></div>
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
              <fmt:message key="flight.main.highlight1.desc.part1" bundle="${msg}" /> <a href="http://www.fwd.com.hk/en-US/fwd-n-you/e_services_app.html" target="_blank"><fmt:message key="flight.main.highlight1.desc.part2" bundle="${msg}" /> </a>  <fmt:message key="flight.main.highlight1.desc.part3" bundle="${msg}" />
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
                <p><fmt:message key="flight.main.highlight1.desc.part1" bundle="${msg}" /> <a  href=" http://www.fwd.com.hk/en-US/fwd-n-you/e_services_app.html" target="_blank"><fmt:message key="flight.main.highlight1.desc.part2" bundle="${msg}" /> </a> <fmt:message key="flight.main.highlight1.desc.part3" bundle="${msg}" /></p>
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
<section class="blog-item hidden-sm hidden-xs">
  <div class="container pad-none">
    <div class="center">
      <h2><fmt:message key="flight.main.blog.heading" bundle="${msg}" /></h2>
    </div>
      <div>
        <div class="col-lg-4 col-md-4 pad-none">
          <div class="services-wrap service-bx1">
            <div>
              <a href="http://blog.fwd.com.hk/en_US/2015/03/17/7-musts-before-a-long-vacation/" target="_blank"><img class="img-responsive bdr-img"
                src="<%=request.getContextPath()%>/resources/images/home4.png" alt=""></a>
              <h3>
                <a href="http://blog.fwd.com.hk/en_US/2015/03/17/7-musts-before-a-long-vacation/" target="_blank">  <fmt:message key="flight.main.blog.subheading1" bundle="${msg}" /> <i class="fa fa-caret-right"></i>
                </a>
              </h3>

            </div>
          </div>
        </div>
        <div class="col-lg-4 col-md-4 pad-none">
          <div class="services-wrap service-bx2">
            <div>
              <a href="http://blog.fwd.com.hk/en_US/2015/03/17/staying-connected-while-travelling-abroad/" target="_blank"><img class="img-responsive bdr-img"
                src="<%=request.getContextPath()%>/resources/images/home5.png" alt=""></a>
              <h3>
                <a href="http://blog.fwd.com.hk/en_US/2015/03/17/staying-connected-while-travelling-abroad/" target="_blank"> <fmt:message key="flight.main.blog.subheading2" bundle="${msg}" /> <i
                  class="fa fa-caret-right"></i>
                </a>
              </h3>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-md-4 pad-none">
          <div class="services-wrap service-bx3">
            <div>
              <a href="http://blog.fwd.com.hk/en_US/2015/03/19/tips-for-traveling-with-children/" target="_blank"><img class="img-responsive bdr-img"
                src="<%=request.getContextPath()%>/resources/images/home6.png" alt=""></a>
              <h3>
                <a href="http://blog.fwd.com.hk/en_US/2015/03/19/tips-for-traveling-with-children/" target="_blank"> <fmt:message key="flight.main.blog.subheading3" bundle="${msg}" /> <i class="fa fa-caret-right"></i>
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
  <div class="container">
    <div class="row">
     <form name="freeFlight" method="post"   onsubmit="return flightValidateBtm()" action="<%=request.getContextPath()%>/${language}/flight-insurance/quote">
      <div class="col-lg-12 col-md-12 pad-none-lg slide-form">
        <h2><fmt:message key="flight.main.quote.bottom.heading" bundle="${msg}" /></h2>
        <table class="table activation-form3">
          <tbody>
          <tr>
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
              <td class="col-md-3 pad-none">
                <div class="input-group date" id="dp5"> <span class="input-group-addon in border-radius"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
                  <input name="departureDate" type="text" class="datepicker form-control border-radius" id="txtStartDateBtm" onblur="chkValidFlightDepartureDate(this, 'startDateBtmIn', '');" value="${planDetails.getDepartureDate()}" readonly>
                </div>
                 <span id="startDateBtmIn" class="text-red"> </span></td>
              <td class="col-md-3 pad-none">
                <div class="input-group date" id="dp6"> <span class="input-group-addon in border-radius"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
                  <input name="returnDate" type="text" class="datepicker form-control border-radius" id="txtEndDateBtm" onblur="chkValidFlightDate(this, 'endDateBtmIn', 'Depature Date', 'txtStartDateBtm', 'startDateBtmIn', '');" value="${planDetails.getReturnDate()}" readonly>
                </div>
                <span id="endDateBtmIn" class="text-red"> </span></td>
              <td class="col-md-3 pad-none">
                 <div class="dropdown  form-group drop-down wh-bg input-group-div marg-b2 dropup" id="myFWDropdownBtm">
                 
                  <a href="#" class="dropdown-toggle col-lg-12 col-md-12" data-toggle="dropdown">  <label id="lblCountBtm"></label> <i class="fa fa-caret-down pull-right"></i> </a>
                  <div class="dropdown-menu bdr1">
                    <div class="drop-content">
                      <div class="col-lg-6">
                        <label class="radio radio-warning radio-inline">
                          <input type="radio" name="planSelected" id="personal_plan_btm" data-id="btm" class="plan" value="personal"  <%=PersonalPlanChecked%> >
                          <label for="personal_plan_btm"> <fmt:message key="flight.main.quote.plan1" bundle="${msg}" /> </label>
                         </label> 
                      </div>
                      <div class="col-lg-6">
                       <label class="radio radio-warning radio-inline">
                          <input type="radio" name="planSelected" id="family_plan_btm" data-id="btm" class="plan" value="family" <%=FamilyPlanChecked %>>
                          <label for="family_plan_btm"><fmt:message key="flight.main.quote.plan2" bundle="${msg}" /></label>
                          </label>
                      </div>
                      <div class="clearfix"></div>
                      <hr>
                      <!-- start of personal plan bottom spinner-->
                      <input type="hidden" name="" id="family_btm_count" value="${planDetails.getTotalFamilyTravellers()}">
                      <div class="plan_spinner_btm" id="personal_plan_btm_spinner" <%=personalSpinnerStyle%>>
                        <div class="col-lg-6">
                          <h4><fmt:message key="flight.main.quote.plan1.type" bundle="${msg}" /></h4>
                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtTravellersBtm" data-parent="personal"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <div class="text-center drop-down-plus wd4 input-number">${planDetails.getTravellerCount()}</div>
                            <input type="hidden" name="travellerCount" data-min="1" data-max="15" id="txtTravellersBtm" value="${planDetails.getTravellerCount()}"/>
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
                            <div class="text-center drop-down-plus wd4 input-number">${planDetails.getTotalAdultTraveller()}</div>
                            <input type="hidden" name="totalAdultTraveller" id="txtAdultsBtm" data-min="1" data-max="2" value="${planDetails.getTotalAdultTraveller()}"/>
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
                            <div class="text-center drop-down-plus wd4 input-number">${planDetails.getTotalChildTraveller()}</div>
                            <input type="hidden" name="totalChildTraveller" id="txtChildBtm" data-min="1" data-max="14" value="${planDetails.getTotalChildTraveller()}"/>
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
                            <div class="text-center drop-down-plus wd4 input-number">${planDetails.getTotalOtherTraveller()}</div>
                            <input type="hidden" name="totalOtherTraveller" id="txtOtherBtm" data-min="0" data-max="14" value="${planDetails.getTotalOtherTraveller()}"/>
                            <span class="input-group-btn data-up ">
                            <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtOtherBtm" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                            </span> </div>
                        </div>
                      </div>
                      
                      <!-- start of family plan bottom spinner-->
                      
                      <div class="clearfix"></div>
                    </div>
                  </div>
                  <div class="clearfix"></div>
                </div>
                <span id="travelCountBtmIn" style="display:none;" class="text-red">
                <label class="text-red"><fmt:message key="flight.main.quote.q3.error" bundle="${msg}" /></label>
                </span>
                </td>
              <td class="col-md-2 pad-none">
                <!--  <input type="submit" class="border-radius btn btn-primary get-btn marg-t2" value="Apply for Free Now!"> -->
                 <button  type="submit" class="bdr-curve-none btn btn-primary marg-t2 btn-lg pad-increase">
              <fmt:message key="flight.main.quote.bottom.action" bundle="${msg}" />
             </button> 
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