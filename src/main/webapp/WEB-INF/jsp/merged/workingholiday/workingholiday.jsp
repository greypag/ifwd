<%@page import="com.ifwd.fwdhk.model.WorkingHolidayQuoteBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<!--   Main Content-->

<script type="text/javascript">
  // personal or family
  var workingholidayer;  
  // personal
  var personalworkingholidayer = parseInt("${workingholidayQuote.getTotalPersonalWorkingHolidayer()}");
  // family
  var familyAdult = "${workingholidayQuote.getTotalAdultWorkingHolidayer()}";
  var familyChild = "${workingholidayQuote.getTotalChildWorkingHolidayer()}";
  var familyOther = "${workingholidayQuote.getTotalOtherWorkingHolidayer()}";  
  var familyworkingholidayer = parseInt(familyAdult) + parseInt(familyChild) + parseInt(familyOther);

  if("${workingholidayQuote.getPlanSelected()}".toLowerCase() == "family"){
    workingholidayer = familyworkingholidayer;
  }else{
    workingholidayer = personalworkingholidayer;
  }

    function reset_submit()
    {        
      if(document.getElementById("family_plan_desk").checked)
      {
    	  $('#txtworkingholidayersDesk').val(0);
      }
      else if (document.getElementById("personal_plan_desk").checked)
      {
        $('#txtAdultsDesk').val(0);
        $('#txtOtherDesk').val(0);
        $('#txtChildDesk').val(0);
      }
      
      var frm = document.getElementById("frmWorkingGetQuote");
      //alert("reset_submit");
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
  String personalSpinnerStyle = "";
  String familySpinnerStyle = "style='display:none'";
  WorkingHolidayQuoteBean workingholidayQuote = (WorkingHolidayQuoteBean)request.getAttribute("workingholidayQuote"); 
    if(workingholidayQuote.getPlanSelected().equalsIgnoreCase("personal")){
      PersonalPlanChecked = "checked";
    }
    else if(workingholidayQuote.getPlanSelected().equalsIgnoreCase("family")){      
      FamilyPlanChecked = "checked";
      personalSpinnerStyle = "style='display:none'";
      familySpinnerStyle = "";
    } 
%>
<section id="main-slider" class="no-margin"> 
  <!--Mobilebanner--> 
  <img src="<%=request.getContextPath()%>/<fmt:message key="workingholiday.hero.image.mobile" bundle="${msg}" />" alt="" class="img-responsive hidden-lg hidden-md"  /> 
  <!--Mobilebanner-->
<div class="carousel slide hidden-xs hidden-sm">
<div class="carousel-inner">
<div class="item active">

<!--/#middle-->
        <img src="<%=request.getContextPath()%>/<fmt:message key="workingholiday.hero.image" bundle="${msg}" />" alt=""  />
         </div>
      <!--/.item--> 
    </div>
    <!--/.carousel inner--> 
  </div>
  <!--/.carousel--> 
</section>
<form name="frmWorkingGetQuote" id="frmWorkingGetQuote" commandName="workingholidayQuote" action="<%=request.getContextPath()%>/${language}/workingholiday-insurance/quote" method="post" onsubmit="return flightValidateDeskWorkingHoliday();">
<section id="middle" class="hidden-sm hidden-xs">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 col-md-12 pad-none slide-form">
        <!-- <h2><fmt:message key="workingholiday.main.quote.top.heading" bundle="${msg}" /></h2> -->
                <table class="table activation-form3">
              <tbody>
                <tr>
                  <td><h3><fmt:message key="workingholiday.main.quote.q1" bundle="${msg}" /></h3></td>
                  <td><h3><fmt:message key="workingholiday.main.quote.q2" bundle="${msg}" /></h3></td>
                  <td><h3><fmt:message key="workingholiday.main.quote.q3" bundle="${msg}" /></h3></td>
                  <td><div id="divPersonsDesk" style="visibility:hidden;">
                   <h3 class="h3-i">
                      <label id="lblPeopleDesk">0</label>
                    <fmt:message key="workingholiday.main.quote.total.people" bundle="${msg}" />
                      <label id="lblDaysDesk">0</label>
                    <fmt:message key="workingholiday.main.quote.total.days" bundle="${msg}" /></h3>
                  </div></td>
                </tr>
                  <tr>
                  <td class="col-md-3 pad-none">
                    <div class="input-group date" id="dp1"> <span class="input-group-addon in border-radius"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
                      <input name="trLeavingDate" type="text" class="datepicker form-control border-radius" id="txtStartDateDesk" value="${workingholidayQuote.getTrLeavingDate()}" readonly>
                    </div>
                    </td>
                  <td class="col-md-3 pad-none">
                    <div class="input-group date" id="dp2"> <span class="input-group-addon in border-radius"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
                      <input name="trBackDate" type="text" class="datepicker form-control border-radius" id="txtEndDateDesk" value="${workingholidayQuote.getTrBackDate()}" readonly>
                    </div>
                    </td>
                  <td class="col-md-3 pad-none">
                    <div class="dropdown  form-group drop-down wh-bg input-group-div marg-b2 dropup" id="myFWDropdown">
                      <a href="#" class="dropdown-toggle col-lg-12 col-md-12" data-toggle="dropdown"> <label id="lblCountDesk"></label> <i class="fa fa-caret-down pull-right"></i> </a>
                      <div class="dropdown-menu bdr1">
                        <div class="drop-content">
                          <div class="col-lg-6 col-md-6">
                            <label class="radio radio-warning radio-inline">
                              <input type="radio" name="planSelected" id="personal_plan_desk" data-id="desk" class="plan" value="personal"  <%=PersonalPlanChecked%> >
                              <label for="personal_plan_desk"><fmt:message key="workingholiday.main.quote.plan1" bundle="${msg}" /></label></label>
                          </div>
                          <div class="col-lg-6 col-md-6">
                            <label class="radio radio-warning radio-inline">
                              <input type="radio" name="planSelected" id="family_plan_desk" data-id="desk" class="plan" value="family" <%=FamilyPlanChecked %>>
                            <label for="family_plan_desk"><fmt:message key="workingholiday.main.quote.plan2" bundle="${msg}" /></label></label>
                          </div>
                          <div class="clearfix"></div>
                          <hr>
                          <!-- start of personal plan bottom spinner-->
                       <input type="hidden" name="familyPlan" id="family_desk_count" value="${workingholidayQuote.getTotalWorkingHolidayer()}">
                       <div class="plan_spinner_desk" id="personal_plan_desk_spinner" <%=personalSpinnerStyle%>>
                         <div class="col-lg-6">
                           <h4><fmt:message key="workingholiday.main.quote.plan1.type" bundle="${msg}" /></h4>
                         </div>
                         <div class="col-lg-6">
                           <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                             <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtworkingholidayersDesk" disabled="disabled" data-parent="personal"> <span class="glyphicon glyphicon-minus"></span> </button>
                             </span>
                  <div class="text-center drop-down-plus wd4 input-number">${workingholidayQuote.getTotalPersonalWorkingHolidayer()}</div>
                             <input type="hidden" name="totalPersonalworkingholidayer" id="txtworkingholidayersDesk" data-min="1" data-max="15" value="${workingholidayQuote.getTotalPersonalWorkingHolidayer()}"/>
                             <span class="input-group-btn data-up ">
                             <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtworkingholidayersDesk" data-parent="personal"> <span class="glyphicon glyphicon-plus"></span> </button>
                             </span> </div>
                         </div>
                       </div>
                       <!-- end of personal plan bottom spinner-->
                       <div class="clearfix"></div>

                       <!-- start of family plan bottom spinner-->
                       <div class="plan_spinner_desk" id="family_plan_desk_spinner" <%=familySpinnerStyle%>>
                         <div class="col-lg-6">
                           <h4><fmt:message key="workingholiday.main.quote.plan2.type1" bundle="${msg}" /></h4>
                         </div>
                         <div class="col-lg-6">
                           <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                             <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtAdultsDesk" disabled="disabled" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                             </span>
                             <div class="text-center drop-down-plus wd4 input-number">${workingholidayQuote.getTotalAdultWorkingHolidayer()}</div>
                             <input type="hidden" name="totalAdultworkingholidayer" id="txtAdultsDesk" data-min="1" data-max="2" value="${workingholidayQuote.getTotalAdultWorkingHolidayer()}"/>
                             <span class="input-group-btn data-up ">
                             <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtAdultsDesk" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                             </span> </div>
                         </div>
                         <div class="clearfix"></div>
                         <div class="col-lg-6">
                           <h4><fmt:message key="workingholiday.main.quote.plan2.type2" bundle="${msg}" /></h4>
                         </div>
                         <div class="col-lg-6">
                           <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                             <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtChildDesk" disabled="disabled" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                             </span>
                             <div class="text-center drop-down-plus wd4 input-number">${workingholidayQuote.getTotalChildWorkingHolidayer()}</div>
                             <input type="hidden" name="totalChildworkingholidayer" id="txtChildDesk" data-min="1" data-max="15" value="${workingholidayQuote.getTotalChildWorkingHolidayer()}"/>
                             <span class="input-group-btn data-up ">
                             <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtChildDesk" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                             </span> </div>
                         </div>
                         <div class="clearfix"></div>
                         <div class="col-lg-6">
                           <h4><fmt:message key="workingholiday.main.quote.plan2.type3" bundle="${msg}" /></h4>
                         </div>
                         <div class="col-lg-6">
                           <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                             <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtOtherDesk" disabled="disabled" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                             </span>
                             <div class="text-center drop-down-plus wd4 input-number">${workingholidayQuote.getTotalOtherWorkingHolidayer()}</div>
                             <input type="hidden" name="totalOtherworkingholidayer" id="txtOtherDesk" data-min="0" data-max="15" value="${workingholidayQuote.getTotalOtherWorkingHolidayer()}"/>
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
                <button type="submit" class="border-radius btn btn-primary get-btn wd2" onclick="reset_submit()"><fmt:message key="workingholiday.main.quote.top.action" bundle="${msg}" /></button>
                 <!--   <a href="flight-plan-cn.html" class="border-radius btn btn-primary  get-btn marg-t2" onclick="return flightValidateDeskWorkingHoliday()">立即報價</a> -->
              </td>
             </tr>
             <tr>
              <td><span id="startDateDeskIn" class="text-red"> </span></td>
              <td><span id="endDateDeskIn" class="text-red"> </span></td>
              <td><span id="workingholidayCountDeskIn"  style="display:none">
                 <label class="text-red"><fmt:message key="workingholiday.main.quote.q3.error" bundle="${msg}" /></label>
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

<!--Mobileform-->
<div class="slider-form hidden-lg hidden-md">
<form name="frmWorkingGetQuote" id="frmWorkingGetQuote" commandName="workingholidayQuote" action="getWorkingHolidayQuote" method="post" onsubmit="return flightValidateMobWorkingHoliday();">
  <div class="form-container">
    <h2><fmt:message key="workingholiday.main.quote.top.heading" bundle="${msg}" /></h2>
    <h4><fmt:message key="workingholiday.main.quote.q1" bundle="${msg}" /> </h4>
    <div class="form-group">
      <div class="input-group date" id="dp3"> <span class="input-group-addon in"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
        <input name="trLeavingDate" type="text" class="datepicker form-control" id="txtStartDateMob" value="${workingholidayQuote.getTrLeavingDate()}" readonly>
      </div>
    </div>
    <span id="startDateMobIn" style="color:red"> </span>
    <h4><fmt:message key="workingholiday.main.quote.q2" bundle="${msg}" /></h4>
    <div class="form-group">
      <div class="input-group date" id="dp4"> <span class="input-group-addon in"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
        <input name="trBackDate" type="text" class="datepicker form-control" id="txtEndDateMob" value="${workingholidayQuote.getTrBackDate()}" readonly>
      </div>
    </div>
    <span id="endDateMobIn" style="color:red"> </span>
    <h4><fmt:message key="workingholiday.main.quote.q3" bundle="${msg}" /></h4>
    <div class="dropdown  form-group drop-down" id="myFWDropdownMob">
      
      <a href="#" class="dropdown-toggle col-sm-12 col-xs-12" data-toggle="dropdown"> <label id="lblCountMob"></label> <i class="fa fa-caret-down pull-right"></i> </a>
      <div class="dropdown-menu bdr1 wd2">
        <div class="drop-content">
          <div class="col-xs-6 col-sm-6">
            <label class="radio radio-warning radio-inline">
             <input type="radio" name="planSelected" id="personal_plan_mob"  data-id="mob" class="plan" value="personal" <%=PersonalPlanChecked%>>
          <label for="personal_plan_mob"><fmt:message key="workingholiday.main.quote.plan1" bundle="${msg}" /></label></label>
          </div>
          <div class="col-xs-6 col-sm-6">
            <label class="radio radio-warning radio-inline">
              <input type="radio"  name="planSelected" id="family_plan_mob"  data-id="mob" class="plan" value="family" <%=FamilyPlanChecked %>>
             <label for="family_plan_mob"><fmt:message key="workingholiday.main.quote.plan2" bundle="${msg}" /></label> </label>
          </div>
          <div class="clearfix"></div>
          <hr>
          <!-- Start of personal plan mobile spinner-->
          <input type="hidden" name="" id="family_mob_count" value="${workingholidayQuote.getTotalWorkingHolidayer()}">
          <div class="plan_spinner_mob" id="personal_plan_mob_spinner" <%=personalSpinnerStyle%>>

          <div class="col-xs-6 col-sm-8">
            <h4><fmt:message key="workingholiday.main.quote.plan1.type" bundle="${msg}" /></h4>
          </div>
           <div class="col-xs-6 col-sm-4">
            <div class="input-group number-spinner none-bd "> 
              <span class="input-group-btn data-dwn">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="minus" data-field="txtworkingholidayersMob" disabled="disabled" data-parent="personal">
                      <span class="glyphicon glyphicon-minus"></span>
                </button>
              </span>
              <div class="text-center drop-down-plus wd4 input-number">${workingholidayQuote.getTotalPersonalWorkingHolidayer()}</div>
              <input type="hidden" name="totalPersonalworkingholidayer" id="txtworkingholidayersMob" data-min="1" data-max="15" value="${workingholidayQuote.getTotalPersonalWorkingHolidayer()}"/>
              <span class="input-group-btn data-up ">
                 <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtWorkingHolidaylersMob" data-parent="personal">
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
            <h4><fmt:message key="workingholiday.main.quote.plan2.type1" bundle="${msg}" /></h4>
          </div>
           <div class="col-xs-6 col-sm-4">
            <div class="input-group number-spinner none-bd "> 
              <span class="input-group-btn data-dwn">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="minus" data-field="txtAdultsMob" disabled="disabled" data-parent="family">
                      <span class="glyphicon glyphicon-minus"></span>
                </button>
              </span>
              <div class="text-center drop-down-plus wd4 input-number">${workingholidayQuote.getTotalAdultWorkingHolidayer()}</div>
              <input type="hidden" name="totalAdultworkingholidayer" id="txtAdultsMob" data-min="1" data-max="2" value="${workingholidayQuote.getTotalAdultWorkingHolidayer()}"/>
              <span class="input-group-btn data-up ">
                 <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtAdultsMob" data-parent="family">
                   <span class="glyphicon glyphicon-plus"></span>
                 </button>
              </span>
           </div>
          </div>
         <div class="clearfix"></div>

          <div class="col-xs-6 col-sm-8">
            <h4><fmt:message key="workingholiday.main.quote.plan2.type2" bundle="${msg}" /></h4>
          </div>
           <div class="col-xs-6 col-sm-4">
            <div class="input-group number-spinner none-bd "> 
              <span class="input-group-btn data-dwn">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="minus" data-field="txtChildMob" disabled="disabled" data-parent="family">
                      <span class="glyphicon glyphicon-minus"></span>
                </button>
              </span>
              <div class="text-center drop-down-plus wd4 input-number">${workingholidayQuote.getTotalChildWorkingHolidayer()}</div>
              <input type="hidden" name="totalChildworkingholidayer" id="txtChildMob" data-min="1" data-max="15" value="${workingholidayQuote.getTotalChildWorkingHolidayer()}"/>
              <span class="input-group-btn data-up ">
                 <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtChildMob" data-parent="family">
                   <span class="glyphicon glyphicon-plus"></span>
                 </button>
              </span>
           </div>
          </div>
         <div class="clearfix"></div>

          <div class="col-xs-6 col-sm-8">
            <h4><fmt:message key="workingholiday.main.quote.plan2.type3" bundle="${msg}" /></h4>
          </div>
           <div class="col-xs-6 col-sm-4">
            <div class="input-group number-spinner none-bd "> 
              <span class="input-group-btn data-dwn">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="minus" data-field="txtOtherMob" disabled="disabled" data-parent="family">
                      <span class="glyphicon glyphicon-minus"></span>
                </button>
              </span>
              <div class="text-center drop-down-plus wd4 input-number">${workingholidayQuote.getTotalOtherWorkingHolidayer()}</div>
              <input type="hidden" name="totalOtherworkingholidayer" id="txtOtherMob" data-min="0" data-max="15" value="${workingholidayQuote.getTotalOtherWorkingHolidayer()}"/>
              <span class="input-group-btn data-up ">
                 <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtOtherMob" data-parent="family">
                   <span class="glyphicon glyphicon-plus"></span>
                 </button>
              </span>
           </div>
          </div>
           </div>
           <!-- End of family plan mobile spinner -->
          <div class="clearfix"></div>
        </div>
      </div>
      <div class="clearfix"></div>
    </div>
    <span id="workingholidayCountMobIn" style="display:none">
    <label class="text-red"><fmt:message key="workingholiday.main.quote.q3.error" bundle="${msg}" /></label>
    </span>
<!--     <span id="workingholidayCountMobIn" style="display:none"> -->
<!--     <label style="color:red">workingholidayer count which is blank</label> -->
<!--     </span> -->
    <div class="text-center" id="divPersonsMob" style="visibility:hidden;">
      <small>
      <label id="lblPeopleMob">0</label>
        <fmt:message key="workingholiday.main.quote.total.people" bundle="${msg}" />
      <label id="lblDaysMob">0</label>
        <fmt:message key="workingholiday.main.quote.total.days" bundle="${msg}" /></small>
    </div>
  </div>
  
  <div class="btn-box text-center">
    <h3 class="text-center"> 
      <!-- <a href="#" class="border-radius get-btn" onclick="return flightValidateMobWorkingHoliday()">立即申請免費保障! </a>  -->
      <button type="submit" class="bdr-curve-none btn btn-primary btn-lg ">
              <fmt:message key="workingholiday.main.quote.top.action" bundle="${msg}" /> 
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
<h2 class="hidden-sm hidden-xs"><fmt:message key="workingholiday.main.desc1" bundle="${msg}" /></h2>
<!--end desktop--> 

<!--Mobile-->
<h2 class="col-xs-12 hidden-lg hidden-md feature-ttl">
<fmt:message key="workingholiday.main.mobile.desc1" bundle="${msg}" />
<fmt:message key="workingholiday.main.mobile.desc2" bundle="${msg}" />
<fmt:message key="workingholiday.main.mobile.desc3" bundle="${msg}" />
</h2>
<!--end Mobile-->
</div>

<!--desktop Features-->
<div class="hidden-xs hidden-sm">
    <div class="col-md-10 col-md-offset-1 home-features"  >
    <div class="col-md-6 col-lg-6 text-center"> <img src="<%=request.getContextPath()%>/resources/images/home1.png" alt="" /> </div>
    <div class="col-md-6 col-lg-6">
      <div class="content">
        <h2><fmt:message key="workingholiday.main.feature1.heading1" bundle="${msg}" /> <br/>
          <fmt:message key="workingholiday.main.feature1.heading2" bundle="${msg}" /></h2>
        <p class="details-text"><fmt:message key="workingholiday.main.feature1.paragraph" bundle="${msg}" /></p>
        <a href="" class="h4-4 scrollToTop"><fmt:message key="workingholiday.main.feature.getquote" bundle="${msg}" /></a> </div>
    </div>
    <div class="clearfix"></div>
    <br>
    <div class="col-md-6 col-lg-6">
      <div class="content">
        <h2><fmt:message key="workingholiday.main.feature2.heading1" bundle="${msg}" /> <br/>
          <fmt:message key="workingholiday.main.feature2.heading2" bundle="${msg}" /></h2>
        <p class="details-text"><fmt:message key="workingholiday.main.feature2.paragraph" bundle="${msg}" /></p>
        <a href="" class="h4-4 scrollToTop"><fmt:message key="workingholiday.main.feature.getquote" bundle="${msg}" /></a> </div>
    </div>
    <div class="col-md-6 col-lg-6 text-center">  <img src="<%=request.getContextPath()%>/resources/images/home2.png" alt=""  /> </div>
    <div class="clearfix"></div>
    <br>
    <div class="col-md-6 col-lg-6 text-center"> <img src="<%=request.getContextPath()%>/resources/images/home3.png" alt=""  /> </div>
    <div class="col-md-6 col-lg-6">
      <div class="content">
        <h2><fmt:message key="workingholiday.main.feature3.heading" bundle="${msg}" /></h2>
        <p class="details-text"><fmt:message key="workingholiday.main.feature3.paragraph" bundle="${msg}" /></p>
        <a href="#" class="h4-4 scrollToTop"><fmt:message key="workingholiday.main.feature.getquote" bundle="${msg}" /></a> </div>
    </div>
    <div class="clearfix"></div>
  </div>
  
  <!--mobile Features--> 
  
  <!--/.row--> 
</div>

<!--mob Features-->
<div class="mob-features hidden-lg hidden-md">
  <div class="col-xs-4 col-sm-4 text-center"> <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/home1.png" alt=""  /> </div>
  <div class="col-xs-8 col-sm-8">
    <div>
      <h2 class="h2-3"><fmt:message key="workingholiday.main.feature1.heading1" bundle="${msg}" /><br/>
                <fmt:message key="workingholiday.main.feature1.heading2" bundle="${msg}" /></h2>
      <p class="details-text"><fmt:message key="workingholiday.main.feature1.paragraph" bundle="${msg}" /></p>
      <a href="" class="h4-4 scrollToTop"><fmt:message key="workingholiday.main.feature.getquote" bundle="${msg}" /></a> </div>
  </div>
  <div class="clearfix"></div>
  <br>
  <div class="col-xs-4 col-sm-4 text-center"> <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/home2.png" alt=""  /> </div>
  <div class="col-xs-8 col-sm-8">
    <div>
      <h2 class="h2-3"><fmt:message key="workingholiday.main.feature2.heading1" bundle="${msg}" /><br/>
      <fmt:message key="workingholiday.main.feature2.heading2" bundle="${msg}" /></h2>
      <p class="details-text"><fmt:message key="workingholiday.main.feature2.paragraph" bundle="${msg}" /></p>
      <a href="" class="h4-4 scrollToTop"><fmt:message key="workingholiday.main.feature.getquote" bundle="${msg}" /></a> </div>
  </div>
  <div class="clearfix"></div>
  <br>
  <div class="col-xs-4 col-sm-4 text-center"> <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/home3.png" alt=""  /> </div>
  <div class="col-xs-8 col-sm-8">
    <div>
      <h2 class="h2-3"><fmt:message key="workingholiday.main.feature3.heading" bundle="${msg}" /></h2>
      <p class="details-text"><fmt:message key="workingholiday.main.feature3.paragraph" bundle="${msg}" /></p>
      <a href="" class="h4-4 scrollToTop"><fmt:message key="workingholiday.main.feature.getquote" bundle="${msg}" /></a> </div>
  </div>
  <div class="clearfix"></div>
</div>
<div class="clearfix"></div>
<div class="other-benefits col-lg-12">
  <h3 class="h4-2"><fmt:message key="workingholiday.main.other.benefit" bundle="${msg}" /></h3>
  <ul class="bullets">
    <li>
      <p class="h4-5"><fmt:message key="workingholiday.main.other.benefit.desc1" bundle="${msg}" /></p>
    </li>
    <li>
      <p class="h4-5"><fmt:message key="workingholiday.main.other.benefit.desc2" bundle="${msg}" /></p>
    </li>
    <li>
      <p class="h4-5"><fmt:message key="workingholiday.main.other.benefit.desc3" bundle="${msg}" /></p>
    </li>
  <li>
      <p class="h4-5"><fmt:message key="workingholiday.main.other.benefit.desc4" bundle="${msg}" /></p>
    </li>
  <li>
      <p class="h4-5"><fmt:message key="workingholiday.main.other.benefit.desc5" bundle="${msg}" /></p>
    </li>
  </ul>
  <div class="spacer3"></div>
  <p class="h4-6"><fmt:message key="workingholiday.main.other.disclaimer.part1" bundle="${msg}" /> <a href="<%=request.getContextPath()%>/<fmt:message key="workingholiday.provision.link" bundle="${msg}" />" target="_blank"> <fmt:message key="workingholiday.main.other.disclaimer.part2" bundle="${msg}" /></a><fmt:message key="workingholiday.main.other.disclaimer.part3" bundle="${msg}" /></p>
  
  <p class="h4-6"><fmt:message key="workingholiday.main.other.disclaimer.part4" bundle="${msg}" /></p>
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
            <h1><fmt:message key="workingholiday.main.highlight1.heading.line1" bundle="${msg}" /><br/>
              <fmt:message key="workingholiday.main.highlight1.heading.line2" bundle="${msg}" />
            </h1>
              <p><fmt:message key="workingholiday.main.highlight1.desc.part1" bundle="${msg}" /> <a href="<fmt:message key="app.download.link" bundle="${msg}" />" target="_blank" ><fmt:message key="workingholiday.main.highlight1.desc.part2" bundle="${msg}" /></a> <fmt:message key="workingholiday.main.highlight1.desc.part3" bundle="${msg}" /></p>

          </div>
        </div>
      </div>
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
        <div class="recent-work-wrap-mid wrap text-center">
          <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/secure.png" alt=""  />
            <h1><fmt:message key="workingholiday.main.highlight2.heading.line1" bundle="${msg}" /><br/>
              <fmt:message key="workingholiday.main.highlight2.heading.line2" bundle="${msg}" /></h1>
              <p><fmt:message key="workingholiday.main.highlight2.desc" bundle="${msg}" /><br>
              <br>
            </p>
          </div>
        </div>
      </div>
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
        <div class="recent-work-wrap wrap text-center">
          <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/rewards.png" alt=""  />
            <h1><fmt:message key="workingholiday.main.highlight3.heading.line1" bundle="${msg}" /><br/>
              <fmt:message key="workingholiday.main.highlight3.heading.line2" bundle="${msg}" /></h1>
            <p><fmt:message key="workingholiday.main.highlight3.desc" bundle="${msg}" /></p>
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
                <h2><fmt:message key="workingholiday.main.highlight1.heading.line1" bundle="${msg}" /><br/>
                  <fmt:message key="workingholiday.main.highlight1.heading.line2" bundle="${msg}" /></h2>
                <p><fmt:message key="workingholiday.main.highlight1.desc.part1" bundle="${msg}" /> <a href="<fmt:message key="app.download.link" bundle="${msg}" />" target="_blank" ><fmt:message key="workingholiday.main.highlight1.desc.part2" bundle="${msg}" /></a> <fmt:message key="workingholiday.main.highlight1.desc.part3" bundle="${msg}" /></p>
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
              <h2><fmt:message key="workingholiday.main.highlight2.heading.line1" bundle="${msg}" /> <fmt:message key="workingholiday.main.highlight2.heading.line2" bundle="${msg}" /></h2>
                <p><fmt:message key="workingholiday.main.highlight2.desc" bundle="${msg}" /></p>
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
              <h2><fmt:message key="workingholiday.main.highlight3.heading.line1" bundle="${msg}" /> <fmt:message key="workingholiday.main.highlight3.heading.line2" bundle="${msg}" /></h2>
                <p><fmt:message key="workingholiday.main.highlight3.desc" bundle="${msg}" /></p>
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
        <h2><fmt:message key="workingholiday.main.testimonial.heading" bundle="${msg}" /></h2>
      </div>
      <div class="col-lg-5 col-md-5 pad-none pull-left">
        <div class="testimonials-wrap text-center">
          <div class="testimonials-inner text-center">
            <div class="h1-1"> <blockquote class="testimonial"></blockquote></div>
            <p><fmt:message key="workingholiday.main.testimonial.customer1.feedback" bundle="${msg}" /></p>
            <div class="hr1"></div>
            <h2><fmt:message key="workingholiday.main.testimonial.customer1.name" bundle="${msg}" /></h2>
            <h4><fmt:message key="workingholiday.main.testimonial.customer1.age" bundle="${msg}" /></h4>
          </div>
        </div>
      </div>
      <div class="col-lg-5 col-md-5 pad-none pull-right">
        <div class="testimonials-wrap text-center">
          <div class="testimonials-inner text-center">
            <div class="h1-1"> <blockquote class="testimonial"></blockquote></div>
            <p><fmt:message key="workingholiday.main.testimonial.customer2.feedback" bundle="${msg}" /></p>
            <div class="hr1"></div>
            <h2><fmt:message key="workingholiday.main.testimonial.customer2.name" bundle="${msg}" /> </h2>
            <h4><fmt:message key="workingholiday.main.testimonial.customer2.age" bundle="${msg}" /></h4>
          </div>
        </div>
      </div>
      <br>
      <div class="clearfix"></div>
      <p class="pad-none p1"><br>
      <fmt:message key="workingholiday.main.testimonial.disclaimer" bundle="${msg}" /></p>
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
        <h2><fmt:message key="workingholiday.main.testimonial.heading" bundle="${msg}" /></h2>
 </div>

    <div class="carousel-inner">
      <div class="item active">
        <div class="container">
          <div class="row slide-margin">
            <div class="testimonials-wrap text-center">
              <div class="testimonials-inner travel-testimonial text-center">
                <blockquote class="testimonial"></blockquote>
                <p><fmt:message key="workingholiday.main.testimonial.customer1.feedback" bundle="${msg}" /></p>
                <div class="hr1"></div>
                <h2><fmt:message key="workingholiday.main.testimonial.customer1.name" bundle="${msg}" /></h2>
                <h4><fmt:message key="workingholiday.main.testimonial.customer1.age" bundle="${msg}" /></h4>
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
                <p><fmt:message key="workingholiday.main.testimonial.customer2.feedback" bundle="${msg}" /></p>
                <div class="hr1"></div>
                <h2><fmt:message key="workingholiday.main.testimonial.customer2.name" bundle="${msg}" /></h2>
                <h4><fmt:message key="workingholiday.main.testimonial.customer2.age" bundle="${msg}" /></h4>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--/.carousel-inner--> 
  </div>
  <!--/.carousel--> 
  <a class="prev" href="#testimonials-mob" data-slide="prev"> <i class="fa fa-chevron-left"></i> </a> <a class="next" href="#testimonials-mob" data-slide="next"> <i class="fa fa-chevron-right"></i> </a> </section>
<!--/#testiomonials mob-->

<section class="blog-item hidden-sm hidden-xs">
  <div class="container">
    <div class="center">
      <h2><fmt:message key="workingholiday.main.blog.heading" bundle="${msg}" /></h2>
    </div>
    <div class="col-lg-12 pad-none">
      <div class="col-lg-4 col-md-4 pad-none">
        <div class="services-wrap service-bx1">
          <div> <a href="<fmt:message key="workingholiday.blog.post1.link" bundle="${msg}" />" target="_blank"><img class="bdr-img" src="<%=request.getContextPath()%>/resources/images/home4.png" alt=""></a>
            <h3> <a href="<fmt:message key="workingholiday.blog.post1.link" bundle="${msg}" />" target="_blank"><fmt:message key="workingholiday.main.blog.subheading1" bundle="${msg}" /> <i class="fa fa-caret-right"></i> </a></h3>
         
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-4 pad-none">
        <div class="services-wrap service-bx2">
          <div> <a href="<fmt:message key="workingholiday.blog.post2.link" bundle="${msg}" />" target="_blank"><img class="bdr-img" src="<%=request.getContextPath()%>/resources/images/home5.png" alt=""></a>
            <h3><a href="<fmt:message key="workingholiday.blog.post2.link" bundle="${msg}" />" target="_blank"><fmt:message key="workingholiday.main.blog.subheading2" bundle="${msg}" /> <i class="fa fa-caret-right"></i> </a></h3>
         
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-4 pad-none">
        <div class="services-wrap service-bx3">
          <div> <a href="<fmt:message key="workingholiday.blog.post3.link" bundle="${msg}" />" target="_blank"><img class="bdr-img" src="<%=request.getContextPath()%>/resources/images/home6.png" alt=""></a>
            <h3> <a href="<fmt:message key="workingholiday.blog.post3.link" bundle="${msg}" />" target="_blank"><fmt:message key="workingholiday.main.blog.subheading3" bundle="${msg}" /> <i class="fa fa-caret-right"></i> </a></h3>
           
          </div>
        </div>
      </div>
    </div>
    <!--/.row--> 
     <p><fmt:message key="workingholiday.main.blog.disclaimer" bundle="${msg}" /></p>
    
   
   
  </div>
  <!--/.container--> 
</section>
<!--/#services-->

<section id="bottom-form" class="hidden-sm hidden-xs">
  <div class="container">
    <div class="row">
    <form name="frmWorkingGetQuote" id="frmWorkingGetQuote" commandName="workingholidayQuote" action="getworkingholidayQuote" method="post" onsubmit="return flightValidateBtmWorkingHoliday();">
      <div class="col-lg-12 col-md-12 pad-none">
        <h2><fmt:message key="workingholiday.main.quote.bottom.heading" bundle="${msg}" /></h2>
        <table class="table activation-form3">
          <tbody>
          <tr>
            <td><h3><fmt:message key="workingholiday.main.quote.q1" bundle="${msg}" /></h3></td>
            <td><h3><fmt:message key="workingholiday.main.quote.q2" bundle="${msg}" /></h3></td>
            <td><h3><fmt:message key="workingholiday.main.quote.q3" bundle="${msg}" /></h3></td>
            <td><div id="divPersonsBtm" style="visibility:hidden;">
                  <h3 class="h3-i">
                    <label id="lblPeopleBtm">0</label>
            <fmt:message key="workingholiday.main.quote.total.people" bundle="${msg}" />
                    <label id="lblDaysBtm">0</label>
            <fmt:message key="workingholiday.main.quote.total.days" bundle="${msg}" /></h3>
                </div>
             </td>
          </tr>
            <tr>
              <td class="col-md-3  ">
                <div class="input-group date" id="dp5"> <span class="input-group-addon in border-radius"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
                  <input type="text" name="trLeavingDate"  class="datepicker form-control border-radius" id="txtStartDateBtm" value="${workingholidayQuote.getTrLeavingDate()}" readonly>
                </div>
                </td>
              <td class="col-md-3 ">
                <div class="input-group date" id="dp6"> <span class="input-group-addon in border-radius"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
                  <input type="text" name="trBackDate" class="datepicker form-control border-radius" id="txtEndDateBtm" value="${workingholidayQuote.getTrBackDate()}" readonly>
                </div>
                </td>
              <td class="col-md-3 ">
                <div class="dropdown  form-group drop-down wh-bg input-group-div marg-b2 dropup" id="myFWDropdownBtm">
                 
                  <a href="#" class="dropdown-toggle col-lg-12 col-md-12" data-toggle="dropdown">  <label id="lblCountBtm"></label> <i class="fa fa-caret-down pull-right"></i> </a>
                  <div class="dropdown-menu bdr1">
                    <div class="drop-content">
                      <div class="col-lg-6">
                         <label class="radio radio-warning radio-inline">
                          <input type="radio" name="planSelected" id="personal_plan_btm" data-id="btm" class="plan" value="personal"  <%=PersonalPlanChecked%> > <label for="personal_plan_btm"><fmt:message key="workingholiday.main.quote.plan1" bundle="${msg}" /></label></label>


                      </div>
                      <div class="col-lg-6">
                          <label class="radio radio-warning radio-inline">
                          <input type="radio" name="planSelected" id="family_plan_btm" data-id="btm" class="plan" value="family" <%=FamilyPlanChecked %>> <label for="family_plan_btm"><fmt:message key="workingholiday.main.quote.plan2" bundle="${msg}" /></label></label>


                      </div>
                      <div class="clearfix"></div>
                      <hr>
                      <!-- start of personal plan bottom spinner-->
                      <input type="hidden" name="" id="family_btm_count" value="${workingholidayQuote.getTotalWorkingHolidayer()}">
                      <div class="plan_spinner_btm" id="personal_plan_btm_spinner" <%=personalSpinnerStyle%>>
                        <div class="col-lg-6">
                          <h4><fmt:message key="workingholiday.main.quote.plan1.type" bundle="${msg}" /></h4>

                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtworkingholidayersBtm" disabled="disabled" data-parent="personal"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <div class="text-center drop-down-plus wd4 input-number">${workingholidayQuote.getTotalPersonalWorkingHolidayer()}</div>
                            <input type="hidden" name="totalPersonalworkingholidayer" id="txtworkingholidayersBtm" data-min="1" data-max="15" value="${workingholidayQuote.getTotalPersonalWorkingHolidayer()}"/>
                            <span class="input-group-btn data-up ">
                            <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtworkingholidayersBtm" data-parent="personal"> <span class="glyphicon glyphicon-plus"></span> </button>
                            </span> </div>
                        </div>
                      </div>
                      <!-- end of personal plan bottom spinner-->
                      <div class="clearfix"></div>
                      
                      <!-- start of family plan bottom spinner-->
                      <div class="plan_spinner_btm" id="family_plan_btm_spinner" <%=familySpinnerStyle%>>
                        <div class="col-lg-6">
                          <h4><fmt:message key="workingholiday.main.quote.plan2.type1" bundle="${msg}" /></h4>

                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtAdultsBtm" disabled="disabled" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <div class="text-center drop-down-plus wd4 input-number">${workingholidayQuote.getTotalAdultWorkingHolidayer()}</div>
                            <input type="hidden" name="totalAdultworkingholidayer" id="txtAdultsBtm" data-min="1" data-max="2" value="${workingholidayQuote.getTotalAdultWorkingHolidayer()}"/>
                            <span class="input-group-btn data-up ">
                            <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtAdultsBtm" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                            </span> </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-lg-6">
                          <h4><fmt:message key="workingholiday.main.quote.plan2.type2" bundle="${msg}" /></h4>

                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtChildBtm" disabled="disabled" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <div class="text-center drop-down-plus wd4 input-number">${workingholidayQuote.getTotalChildWorkingHolidayer()}</div>
                            <input type="hidden" name="totalChildworkingholidayer" id="txtChildBtm" data-min="1" data-max="15" value="${workingholidayQuote.getTotalChildWorkingHolidayer()}"/>
                            <span class="input-group-btn data-up ">
                            <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtChildBtm" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                            </span> </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-lg-6">
                          <h4><fmt:message key="workingholiday.main.quote.plan2.type3" bundle="${msg}" /></h4>

                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtOtherBtm" disabled="disabled" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <div class="text-center drop-down-plus wd4 input-number">${workingholidayQuote.getTotalOtherWorkingHolidayer()}</div>
                            <input type="hidden" name="totalOtherworkingholidayer" id="txtOtherBtm" data-min="0" data-max="15" value="${workingholidayQuote.getTotalOtherWorkingHolidayer()}"/>
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
                
        </td>
              <td class="col-md-2 ">
                  <button type="submit" class="border-radius btn btn-primary get-btn  wd2"><fmt:message key="workingholiday.main.quote.bottom.action" bundle="${msg}" /></button>
                 </td>
            </tr>
            <tr>
              <td><span id="startDateBtmIn" style="color:red"> </span></td>
              <td><span id="endDateBtmIn" style="color:red"> </span></td>
              <td><span id="workingholidayCountBtmIn" style="display: none;">
                <label class="text-red"><fmt:message key="workingholiday.main.quote.q3.error" bundle="${msg}" /></label>
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