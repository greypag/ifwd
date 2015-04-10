<%@page import="com.ifwd.fwdhk.model.TravelQuoteBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--   Main Content-->
<!--Main Content-->

<script type="text/javascript">

	// personal or family
	var traveller;	
	// personal
	var personalTraveller = parseInt("${travelQuote.getTotalPersonalTraveller()}");
	// family
	var familyAdult = "${travelQuote.getTotalAdultTraveller()}";
	var familyChild = "${travelQuote.getTotalChildTraveller()}";
	var familyOther = "${travelQuote.getTotalOtherTraveller()}";	
 	var familyTraveller = parseInt(familyAdult) + parseInt(familyChild) + parseInt(familyOther);

 	if("${travelQuote.getPlanSelected()}".toLowerCase() == "family"){
 		traveller = familyTraveller;
 	}else{
 		traveller = personalTraveller;
 	}
	
    $(document).ready(function(){
         // personal was selected by default
         if("${travelQuote.getPlanSelected()}".toLowerCase() == "family"){
     		$(".plan").trigger("change");
 //         	//reset to defalut value
 //         	totalAdult = '1';
 //         	totalChild = '0';
 //         	totalOther = '0';
 //         	totalTraveller = 1;	     		
         }
     });
</script>

<%
   	String PersonalPlanChecked = "";
	String FamilyPlanChecked = "";
	TravelQuoteBean travelQuote = (TravelQuoteBean)request.getAttribute("travelQuote"); 
    if(travelQuote.getPlanSelected().equalsIgnoreCase("personal")){
  		PersonalPlanChecked = "checked";
    }
    else if(travelQuote.getPlanSelected().equalsIgnoreCase("family")){   		
   		FamilyPlanChecked = "checked";   		
    } 
%>

<section id="main-slider" class="no-margin"> 
  <!--Mobile banner--> 
  <img src="resources/images/slider/travel_en_m.jpg" alt="" class="img-responsive hidden-lg hidden-md"  /> 
  <div class="carousel slide hidden-xs hidden-sm">
    <div class="carousel-inner">
      <div class="item active">

        <img src="resources/images/slider/travel_en.jpg" alt=""  /> </div>
      <!--/.item--> 
    </div>
    <!--/.carousel inner--> 
  </div>
  <!--/.carousel--> 
</section>
<form name="frmTravelGetQuote" id="frmTravelGetQuote" action="getTravelQuote" method="post" onsubmit="return flightValidateDeskTravel();">
<section id="middle" class="hidden-sm hidden-xs fixed-content">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 col-md-12 pad-none slide-form">
        <h2 style="margin-bottom: 20px;">Get your TravelCare insurance now</h2>
        <table class="table activation-form3">
          <tbody>
          <tr>
          	<td><h3>When are you leaving?</h3></td>
          	<td><h3>When will you be back?</h3></td>
          	<td><h3>Who's travelling?&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</h3> </td>
          	<td>
          		<div id="divPersonsDesk" style="visibility:hidden;">
                  <h3 class="h3-i">
                    <label id="lblPeopleDesk">0</label>
                    people <br>
                    travelling
                    <label id="lblDaysDesk">0</label>
                    day(s) </h3>
                </div>
          	</td>
          </tr>
          <tr>
              <td class="col-md-3 pad-none">
                <div class="input-group date" id="dp1"> <span class="input-group-addon in border-radius"><span><img src="resources/images/calendar.png" alt=""></span></span>
                   <input name="trLeavingDate" type="text" class="datepicker form-control border-radius" id="txtStartDateDesk" onblur="chkValidDate(this, 'startDateDeskIn', 'Depature Date');" value="${travelQuote.getTrLeavingDate()}" readonly/>
                </div>
                
                </td>
              <td class="col-md-3 pad-none">
                <div class="input-group date" id="dp2"> <span class="input-group-addon in border-radius"><span><img src="resources/images/calendar.png" alt=""></span></span>
                  <input name="trBackDate" type="text" class="datepicker form-control border-radius" id="txtEndDateDesk" onblur="chkValidDate(this, 'endDateDeskIn', 'Return Date');" value="${travelQuote.getTrBackDate()}" readonly/>
                </div>
              
             </td>
             
             
			<td class="col-md-3 pad-none">
                <div class="dropdown  form-group drop-down wh-bg input-group-div marg-b2 dropup" id="myFWDropdown">
                 
                  <a href="#" class="dropdown-toggle col-lg-12 col-md-12" data-toggle="dropdown">  <label id="lblCountDesk"></label> <i class="fa fa-caret-down pull-right"></i> </a>
                  <div class="dropdown-menu bdr1">
                    <div class="drop-content">
                      <div class="col-lg-6 col-md-6">
                        <label class="radio radio-warning radio-inline">
                           <input type="radio" name="planSelected" id="personal_plan_desk" data-id="desk" class="plan" value="personal" <%=PersonalPlanChecked%>  >
                          <label for="personal_plan_desk"> Personal  Plan </label>
                         </label> 
                      </div>
                      <div class="col-lg-6 col-md-6">
                       <label class="radio radio-warning radio-inline">
                          <input type="radio" name="planSelected" id="family_plan_desk" data-id="desk" class="plan" value="family" <%=FamilyPlanChecked %>>
                          <label for="family_plan_desk"> Family Plan </label>
                          </label>
                      </div>
                      <div class="clearfix"></div>
                      <hr>
                      <!-- start of personal plan desk spinner-->
                      <input type="hidden" name="familyPlan" id="family_desk_count" value="">
                      <div class="plan_spinner_desk" id="personal_plan_desk_spinner">
                        <div class="col-lg-6">
                          <h4>Travellers</h4>
                        </div>
                        <div class="col-lg-6 ">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtTravellersDesk" disabled="disabled" data-parent="personal"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <input type="text" class="form-control text-center drop-down-plus wd4 input-number" name="totalPersonalTraveller" value="${travelQuote.getTotalPersonalTraveller()}" data-min="1" data-max="15" id="txtTravellersDesk" readonly>
                            <span class="input-group-btn data-up ">
                            <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtTravellersDesk" data-parent="personal"> <span class="glyphicon glyphicon-plus"></span> </button>
                            </span> </div>
                        </div>
                      </div>
                      <!-- end of personal plan desk spinner-->
                      <div class="clearfix"></div>
                      
                      <!-- start of family plan desk spinner-->
                      <div class="plan_spinner_desk" id="family_plan_desk_spinner">
                        <div class="col-lg-6">
                          <h4>Parent</h4>
                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtAdultsDesk" disabled="disabled" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <input type="text" class="form-control text-center drop-down-plus wd4 input-number" name="totalAdultTraveller" value="1" data-min="1" data-max="2" id="txtAdultsDesk" readonly>
                            <span class="input-group-btn data-up ">
                            <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtAdultsDesk" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                            </span> </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-lg-6">

                          <h4>Children</h4>
                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtChildDesk" disabled="disabled" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <input type="text" class="form-control text-center drop-down-plus wd4 input-number"  name="totalChildTraveller" value="1" data-min="1" data-max="15" id="txtChildDesk" readonly>
                            <span class="input-group-btn data-up ">
                            <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtChildDesk" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                            </span> </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-lg-6">
                          <h4>Other</h4>
                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtOtherDesk" disabled="disabled" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <input type="text" name="totalOtherTraveller" class="form-control text-center drop-down-plus wd4 input-number" value="0" data-min="0" data-max="15" id="txtOtherDesk" readonly>
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
              
                <button type="submit" class="border-radius btn btn-primary get-btn wd2">Get Quote</button>
                </td>
            </tr>
            <tr>
            	<td><span id="startDateDeskIn" class="text-red" > </span></td>
            	<td><span id="endDateDeskIn"  class="text-red" > </span></td>
            	<td><span id="travelCountDeskIn" style="display:none">
                <label style="color:red">Please enter Treveller's information</label>
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


<!--Mobile-form-->
<div class="slider-form hidden-lg hidden-md">
<form name="frmTravelGetQuote " id="" commandName="travelQuote" action="getTravelQuote" method="post" onsubmit="return flightValidateMobTravel();">
  <div class="form-container">
    <h2>Get your travel insurance</h2>
    <h4>When are you leaving? </h4>
    <div class="form-group">
      <div class="input-group date" id="dp3"> <span class="input-group-addon in"><span><img src="resources/images/calendar.png" alt=""></span></span>
        <input name="trLeavingDate" type="text" class="datepicker form-control" id="txtStartDateMob" onblur="chkValidDate(this, 'startDateMobIn', 'Depature Date');" value="${travelQuote.getTrLeavingDate()}">
      </div>
    </div>
    <span id="startDateMobIn" style="color:red"> </span>
    <h4>When will you be back? </h4>
    <div class="form-group">
      <div class="input-group date" id="dp4"> <span class="input-group-addon in"><span><img src="resources/images/calendar.png" alt=""></span></span>
        <input name="trBackDate" type="text" class="datepicker form-control" id="txtEndDateMob" onblur="chkValidDate(this, 'endDateMobIn', 'Return Date');" value="${travelQuote.getTrBackDate()}">
      </div>
    </div>
    <span id="endDateMobIn" style="color:red"> </span>
    <h4>Who's travelling?</h4>
    <div class="dropdown  form-group drop-down dropup" id="myFWDropdownMob">
       <a href="#" class="dropdown-toggle col-sm-12 col-xs-12" data-toggle="dropdown"> <label id="lblCountMob"></label>  <i class="fa fa-caret-down pull-right"></i> </a>
      <div class="dropdown-menu bdr1 wd2">
        <div class="drop-content">
          <div class="col-xs-6 col-sm-6">
            <label class="radio radio-warning radio-inline">
               <input type="radio" name="plan_mob" id="personal_plan_mob"  data-id="mob" class="plan" value="personal" <%=PersonalPlanChecked%>>
              <label for="personal_plan_mob">  Personal Plan </label>

           </label>
          </div>
          <div class="col-xs-6 col-sm-6">
            <label class="radio radio-warning radio-inline">
              <input type="radio"  name="plan_mob" id="family_plan_mob"  data-id="mob" class="plan" value="family" <%=FamilyPlanChecked %>>
               <label for="family_plan_mob">  Family Plan </label>
          </label>
          </div>
          <div class="clearfix"></div>
          <hr>
         <!-- Start of personal plan mobile spinner-->
          <input type="hidden" name="" id="family_mob_count" value="">
          <div class="plan_spinner_mob" id="personal_plan_mob_spinner">

          <div class="col-xs-6 col-sm-6">
            <h4>Travellers</h4>
          </div>
          <div class="col-xs-6 col-sm-6">
            <div class="input-group number-spinner none-bd "> 
              <span class="input-group-btn data-dwn">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="minus" data-field="txtTravellersMob" disabled="disabled" data-parent="personal">
                      <span class="glyphicon glyphicon-minus"></span>
                </button>
              </span>
              <input type="text" class="form-control text-center drop-down-plus input-number" value="1" data-min="1" data-max="15" id="txtTravellersMob" readonly />
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
         <div class="plan_spinner_mob" id="family_plan_mob_spinner">

          <div class="col-xs-6 col-sm-6">
            <h4>Parent</h4>
          </div>
          <div class="col-xs-6 col-sm-6">
            <div class="input-group number-spinner none-bd "> 
              <span class="input-group-btn data-dwn">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="minus" data-field="txtAdultsMob" disabled="disabled" data-parent="family">
                      <span class="glyphicon glyphicon-minus"></span>
                </button>
              </span>
              <input type="text" class="form-control text-center drop-down-plus input-number" value="1" data-min="1" data-max="2" id="txtAdultsMob" readonly />
              <span class="input-group-btn data-up ">
                 <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtAdultsMob" data-parent="family">
                   <span class="glyphicon glyphicon-plus"></span>
                 </button>
              </span>
           </div>
          </div>
         <div class="clearfix"></div>

         <div class="col-xs-6 col-sm-6">
            <h4>Children</h4>
          </div>
          <div class="col-xs-6 col-sm-6">
            <div class="input-group number-spinner none-bd "> 
              <span class="input-group-btn data-dwn">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="minus" data-field="txtChildMob" disabled="disabled" data-parent="family">
                      <span class="glyphicon glyphicon-minus"></span>
                </button>
              </span>
              <input type="text" class="form-control text-center drop-down-plus input-number" value="0" data-min="0" data-max="14" id="txtChildMob"  readonly=""/>
              <span class="input-group-btn data-up ">
                 <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtChildMob" data-parent="family">
                   <span class="glyphicon glyphicon-plus"></span>
                 </button>
              </span>
           </div>
          </div>
         <div class="clearfix"></div>

         <div class="col-xs-6 col-sm-6">
            <h4>Other</h4>
          </div>
          <div class="col-xs-6 col-sm-6">
            <div class="input-group number-spinner none-bd "> 
              <span class="input-group-btn data-dwn">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="minus" data-field="txtOtherMob" disabled="disabled" data-parent="family">
                      <span class="glyphicon glyphicon-minus"></span>
                </button>
              </span>
              <input type="text" class="form-control text-center drop-down-plus input-number" value="1" data-min="0" data-max="14" id="txtOtherMob" readonly/>
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
    <span id="travelCountMobIn" style="display:none">
    <label class="text-red">Please enter Treveller's information</label>
    </span> <br>
    <!--<span id="travelCountMobIn" style="display:none">
    <label style="color:red">Traveller count which is blank</label>
    </span>-->
    <div id="divPersonsMob" style="visibility:hidden;"> <br>
      <small>
      <label id="lblPeopleMob">0</label>
      people travelling
      <label id="lblDaysMob">0</label>
      day(s) </small> <br>
    </div>
  </div>
  <div class="btn-box text-center">
    <h3 class="text-center">
    <button type="submit" class="bdr-curve-none btn btn-primary btn-lg ">
             Get Quote
             </button>
     <!-- <a href="#" class="border-radius get-btn" onclick="return flightValidateMobTravel()"> Get Quote </a>  --></h3>
  </div>
  </form>
</div>
<!--Mobile-form--> 
<!--/#main-slider-->
<section id="feature" >
  <div class="container pad-none">
    <div class="center"> 
      <!--desktop-->
<h2 class="hidden-sm hidden-xs">Embark on an adventure abroad with a reliable<br>
  travel protection companion</h2>
<!--end-desktop--> 

<!--Mobile-->
<h2 class="hidden-lg hidden-md feature-ttl">
<br>
Embark on an adventure<br>
  abroad with a reliable<br>
  travel protection companion</h2>
<!--end Mobile-->
</div>

<!--desktop Features-->
<div class="hidden-xs hidden-sm">
  <div class="col-lg-12  home-features">
  <div class="row">
    <div class="col-md-6 col-lg-6 text-center pad-none"> <img src="resources/images/home3.png" alt=""  /> </div>
    <div class="col-md-6 col-lg-6 pad-none">
      <div class="content">
        <h2>Do The Things You Want<br>
          To Do, Worryfree</h2>
        <p class="details-text">Go crazy and jump for joy! We cover your activities: from summer walks along the beach to bungee jumping, scuba diving and even winter sports. Our travel protection works for the thing you want to do.</p>
        <a href="" class="h4-4 scrollToTop">Get a quote to learn more</a> </div>
    </div>
    <div class="clearfix"></div>
    <br>
    <div class="col-md-6 col-lg-6 pad-none">
      <div  class="content">
        <h2>Go Wherever You Want,<br>
          When You Want </h2>
        <p class="details-text">From Hong Kong to Thailand, the UK, Vanuatu and beyond! The ever-ready TravelCare provides travel insurance for anyone, up to 85 years old, worldwide! </p>
        <a href="" class="h4-4 scrollToTop">Get a quote to learn more</a> </div>
    </div>
    <div class="col-md-6 col-lg-6 text-center pad-none"> <img src="resources/images/home2.png" alt=""  /> </div>
    <div class="clearfix"></div>
    <br>
    <div class="col-md-6 col-lg-6 text-center"> <img src="resources/images/home1.png" alt=""  /> </div>
    <div class="col-md-6 col-lg-6 pad-none">
      <div  class="content">
        <h2>Best-In-Class Support</h2>
        <p class="details-text">When things go wrong it's important you have the right support. We are supported by the International SOS - the world's leading medical and travel security services company.</p>
        <a href="" class="h4-4 scrollToTop">Get a quote to learn more</a> </div>
    </div>
    <div class="clearfix"></div>
  </div>
  </div>
  <!--mobile Features--> 
  
  <!--/.row--> 
</div>

<!--mob Features-->
<div class="mob-features hidden-lg hidden-md">
  <div class="col-xs-4 col-sm-4 text-center"> <img class="img-responsive" src="resources/images/home1.png" alt=""  /> </div>
  <div class="col-xs-8 col-sm-8">
    <div>
      <h2 class="h2-3">Do The Things You Want<br>
        To Do, Worryfree</h2>
      <p class="details-text">Go crazy and jump for joy! We cover all your activities: from summer walks along the beach to winter sports. Our travel protection works for the thing you want to do. </p>
      <a href="" class="h4-4 scrollToTop">Get a quote to learn more</a> </div>
  </div>
  <div class="clearfix"></div>
  <br>
  <div class="col-xs-4 col-sm-4 text-center"> <img class="img-responsive" src="resources/images/home2.png" alt=""  /> </div>
  <div class="col-xs-8 col-sm-8">
    <div>
      <h2 class="h2-3">Go Wherever You Want,<br>
        When You Want</h2>
      <p class="details-text">From Hong Kong to Thailand, the UK, Reunion and beyond! The ever-ready TravelCare provides travel insurance for anyone, up to 85 years old, worldwide!</p>
      <a href="" class="h4-4 scrollToTop">Get a quote to learn more</a> </div>
  </div>
  <div class="clearfix"></div>
  <br>
  <div class="col-xs-4 col-sm-4 text-center"> <img class="img-responsive" src="resources/images/home3.png" alt=""  /> </div>
  <div class="col-xs-8 col-sm-8">
    <div>
      <h2 class="h2-3">Best-In-Class Support</h2>
      <p class="details-text">When things go wrong it's important you have the right support. We are supported by the International SOS - the world's leading medical and travel security services company.</p>
      <a href="" class="h4-4 scrollToTop">Get a quote to learn more</a> </div>
  </div>
  <div class="clearfix"></div>
</div>
<div class="other-benefits col-lg-12 col-md-12">
  <h3 class="h4-2">Other benefits</h3>
  <ul class="bullets">
    <li>
      <p class="h4-5">No out-of-pocket expenses - full cover with no excess  </p>
    </li>
    <li>
      <p class="h4-5">Rental Vehicle Excess - Up to HK$5,000 reimbursement of out-of-pocket expenses arising from car accidents, loss or damage</p>
    </li>
    <li>
      <p class="h4-5">Up to HK$1.2million personal accident coverage</p>
    </li>
<li>
      <p class="h4-5">15% off pocket wifi rental with Y5Buddy</p>
    </li>
<li>
      <p class="h4-5">5% Agoda discount for every successful referral</p>
    </li>
  </ul>
  <div class="spacer3"></div>
  <p class="h4-6">The features above are indicative only. Please refer to the <a href="resources/policy-provisions-pdf/TravelCare_Provisions_Mar_2015.pdf" class="sub-link" target="_blank">Policy Provisions</a> for details. </p>
  <p class="h4-6">For a complete explanation of the terms and conditions, feel free to contact an adviser or our 24-hour hotline at 3123 3123 for more details.</p>
</div>
<!--/.container-->
</div>
</section>
<!--/#feature-->
<section id="recent-works" class="hidden-xs hidden-sm">
  <div class="container pad-none">
    
      <div class="col-lg-4 col-md-4 pad-none">
        <div class="recent-work-wrap wrap text-center">
          <div class="recent-work-inner"> <img src="resources/images/time.png" alt=""  />
            <h1>Here When<br>
              You Need Us</h1>
            <p>
              Our 24x7 call centre support, 5 drop-in locations across Hong Kong and our eServices <a href="http://www.fwd.com.hk/en-US/fwd-n-you/e_services_app.html" target="_blank" >app  </a> ensures you get the support you need, when you need it.

            </p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-4 pad-none">
        <div class="recent-work-wrap-mid wrap text-center">
          <div class="recent-work-inner"> <img src="resources/images/secure.png" alt=""  />
            <h1>Secure <br> &amp;
              Stable</h1>
            <p>We have been assigned strong financial strength ratings by international rating agencies -- we have been rated "A3" by Moody's and "A" by Fitch.
            
              <br>
            </p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-4 pad-none">
        <div class="recent-work-wrap wrap text-center">
          <div class="recent-work-inner"> <img src="resources/images/rewards.png" alt=""  />
            <h1>Rewards <br> &amp; Benefits</h1>
             
            <p>We continue to find you great rewards and benefits that let you get more from your insurance - discounts on future insurance, special offers from partners and more.</p>
            </div>
        </div>
      </div>

    <!--End-Desktop-Support--> 
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
              <div class="recent-work-inner"> <img src="resources/images/time.png" alt=""  />
                <h1>Here When<br>
              You Need Us</h1>
            <p>  Our 24x7 call centre support, 5 drop-in locations across Hong Kong and our eServices <a href="http://www.fwd.com.hk/en-US/fwd-n-you/e_services_app.html" target="_blank" >App </a> ensures you get the support you need, when you need it.</p>
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
              <div class="recent-work-inner"> <img src="resources/images/secure.png" alt=""  />
                <h1>Secure &amp; 
              Stable</h1>
            <p>We have been assigned strong financial strength ratings by international rating agencies -- we have been rated "A3" by Moody's and "A" by Fitch.
                        <br>
               </p>
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
              <div class="recent-work-inner"> <img src="resources/images/rewards.png" alt=""  />
               <h1>Rewards &amp;
              Benefits</h1>
            <p>We continue to find you great rewards and benefits that let you get more from your insurance - discounts on future insurance, special offers from partners and more.</p>
           
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
  <div class="container pad-none"> 
    <!--desktop-testimonials-->
    <div class="hidden-sm hidden-xs">
      <div class="center">
        <h2>Customer testimonials</h2>
      </div>
      <div class="col-lg-5 col-md-5 pad-none pull-left">
        <div class="testimonials-wrap text-center">
          <div class="testimonials-inner text-center">
            <div class="h1-1"> <blockquote class="testimonial"></blockquote></div>
            <p class="pad-none">I always go for FWD Travel Insurance because there is always someone to pick up my calls, 24/7, which is particularly important after office hours and while I am travelling overseas. </p>
            <div class="hr1"></div>
            <h2>William</h2>
            <h4>(aged 30)</h4>
          </div>
        </div>
      </div>
       <div class="col-lg-5 col-md-5 pad-none pull-right">
        <div class="testimonials-wrap text-center">
          <div class="testimonials-inner text-center">
            <div class="h1-1"> <blockquote class="testimonial"></blockquote></div>
            <p class="pad-none">I am a backpacker. The only 2 things I carry with me are my FWD TravelCare policy no. and ISOS emergency number – especially when you don’t know what to expect in the Amazon jungle.
</p>
            <div class="hr1"></div>
            <h2>Gabriel</h2>
            <h4>(aged 26)</h4>
          </div>
        </div>
      </div>
      
      <div class="clearfix"></div>
      
      <br>
      <P class="pad-none p1"><br>
      The opinion and view expressed here are entirely the writer’s own and do not represent the views of FWD Life Insurance Company (Bermuda) Limited or its affiliates (“FWD”). FWD does not take any responsibility for that opinion and view, nor endorse their accuracy or completeness.</P>
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
        <h2>Customer testimonials</h2>
      </div>
    <div class="carousel-inner">
      <div class="item active">
        <div class="container">
          <div class="slide-margin">
            <div class="testimonials-wrap text-center">
              <div class="testimonials-inner travel-testimonial text-center">
                <div class="h1-1"> <blockquote class="testimonial"></blockquote></div>
                 <p>I always go for FWD Travel Insurance because there is always someone to pick up my calls, 24/7, which is particularly important after office hours and while I am travelling overseas. </p>
                <div class="hr1"></div>
                <h2>William</h2>
                <h4>(aged 30)</h4>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--/.item-->
      <div class="item" >
        <div class="container">
          <div class="slide-margin">
            <div class="testimonials-wrap text-center">
              <div class="testimonials-inner travel-testimonial text-center">
                <div class="h1-1"> <blockquote class="testimonial"></blockquote></div>
            <p>I am a backpacker. The only 2 things I carry with me are my FWD TravelCare policy no. and ISOS emergency number – especially when you don’t know what to expect in the Amazon jungle.</p>
                <div class="hr1"></div>
                <h2>Gabriel</h2>
                <h4>(aged 26)</h4>
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
  <div class="container pad-none">
    <div class="center">
      <h2>Read more from our blog</h2>
    </div>
    <div>
      <div class="col-lg-4 col-md-4 pad-none">
        <div class="services-wrap service-bx1">
          <div><a href="http://blog.fwd.com.hk/en_US/2015/03/17/7-musts-before-a-long-vacation/" target="_blank"><img class="img-responsive bdr-img" src="resources/images/home4.png" alt=""></a>
            <h3><a href="http://blog.fwd.com.hk/en_US/2015/03/17/7-musts-before-a-long-vacation/" target="_blank"> Things to do before<br> a long vacation <i class="fa fa-caret-right"></i></a> </h3>
      
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-4 pad-none">
        <div class="services-wrap service-bx2">
          <div> <a href="http://blog.fwd.com.hk/en_US/2015/03/17/staying-connected-while-travelling-abroad/"  target="_blank"><img class="img-responsive bdr-img" src="resources/images/home5.png" alt=""></a>
            <h3><a href="http://blog.fwd.com.hk/en_US/2015/03/17/staying-connected-while-travelling-abroad/"  target="_blank"> How to access internet while<br> travelling abroad <i class="fa fa-caret-right"></i> </a></h3>
            
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-4 pad-none">
        <div class="services-wrap service-bx3">
          <div><a href="http://blog.fwd.com.hk/en_US/2015/03/19/tips-for-traveling-with-children/" target="_blank"><img class="img-responsive bdr-img" src="resources/images/home6.png" alt=""></a>
            <h3><a href="http://blog.fwd.com.hk/en_US/2015/03/19/tips-for-traveling-with-children/" target="_blank"> Travelling with children <i class="fa fa-caret-right"></i></a> </h3>
         
          </div>
        </div>
      </div>
      
      <div class="clearfix"></div>
    </div>
    
    <p>The information provided in the blogs is for reference only.  While FWD Life Insurance Company (Bermuda) Limited and its affiliates (“FWD”) use reasonable efforts to ensure the information is accurate, FWD makes no warranties or representations as to the accuracy or completeness of any of the information and assumes no liability for any errors or omissions thereof.  FWD shall not be liable for any direct, incidental, consequential, indirect or punitive damages arising out of access to, use of or inability to use the information, or any errors or omissions in the content of this material.  Users should carefully evaluate the information</p>
    
    
    <!--/.row--> 
  </div>
  <!--/.container--> 
</section>
<!--/#services-->
<form name="frmTravelGetQuote" id="frmTravelGetQuote" action="getTravelQuote" method="post" onsubmit="return flightValidateBtmTravel();">
<section id="bottom-form" class="hidden-sm hidden-xs">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 col-md-12 pad-none slide-form">
        <h2>Get your TravelCare insurance now</h2>
        <table class="table activation-form3">
          <tbody>
          	<tr>
          		<td><h3>When are you leaving?</h3></td>
          		<td><h3>When will you be back?</h3></td>
          		<td><h3>Who's travelling?</h3></td>
          		<td><div id="divPersonsBtm" style="visibility:hidden;">
                  <h3 class="h3-i">
                    <label id="lblPeopleBtm">0</label>
                    people <br>
                    travelling
                    <label id="lblDaysBtm">0</label>
                    day(s) </h3>
                </div></td>
          	</tr>
            <tr>
              <td class="col-md-3 pad-none">
                <div class="input-group date" id="dp5"> <span class="input-group-addon in border-radius"><span><img src="resources/images/calendar.png" alt=""></span></span>
                  <input name="trLeavingDate" type="text" class="datepicker form-control border-radius" id="txtStartDateBtm" onblur="chkValidDate(this, 'startDateBtmIn', 'Departure Date');" value="${travelQuote.getTrLeavingDate()}" readonly>
                </div>
                </td>
              
                
              <td class="col-md-3 pad-none">
                <div class="input-group date" id="dp6"> <span class="input-group-addon in border-radius"><span><img src="resources/images/calendar.png" alt=""></span></span>
                  <input name="trBackDate" type="text" class="datepicker form-control border-radius" id="txtEndDateBtm" onblur="chkValidDate(this, 'endDateBtmIn', 'Return Date');" value="${travelQuote.getTrBackDate()}" readonly>
                </div>
                </td>
            
            
              <td class="col-md-3 pad-none">
                <div class="dropdown  form-group drop-down wh-bg input-group-div marg-b2 dropup" id="myFWDropdownBtm">
                 
                  <a href="#" class="dropdown-toggle col-lg-12 col-md-12" data-toggle="dropdown">  <label id="lblCountBtm"></label> <i class="fa fa-caret-down pull-right"></i> </a>
                  <div class="dropdown-menu bdr1">
                    <div class="drop-content">
                      <div class="col-lg-6">
                        <label class="radio radio-warning radio-inline">
                          <input type="radio" name="planSelected" id="personal_plan_btm" data-id="btm" class="plan" value="personal"  <%=PersonalPlanChecked%> >
                          <label for="personal_plan_btm"> Personal Plan </label>
                         </label> 
                      </div>
                      <div class="col-lg-6">
                       <label class="radio radio-warning radio-inline">
                          <input type="radio" name="planSelected" id="family_plan_btm" data-id="btm" class="plan" value="family" <%=FamilyPlanChecked %>>
                          <label for="family_plan_btm"> Family  Plan </label>
                          </label>
                      </div>
                      <div class="clearfix"></div>
                      <hr>
                      <!-- start of personal plan bottom spinner-->
                      <input type="hidden" name="" id="family_btm_count" value="">
                      <div class="plan_spinner_btm" id="personal_plan_btm_spinner">
                        <div class="col-lg-6">
                          <h4>Travellers</h4>
                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtTravellersBtm" disabled="disabled" data-parent="personal"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <input type="text" name="totalPersonalTraveller" class="form-control text-center drop-down-plus wd4 input-number" value="${travelQuote.getTotalPersonalTraveller()}" data-min="1" data-max="15" id="txtTravellersBtm" readonly>
                            <span class="input-group-btn data-up ">
                            <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtTravellersBtm" data-parent="personal"> <span class="glyphicon glyphicon-plus"></span> </button>
                            </span> </div>
                        </div>
                      </div>
                      <!-- end of personal plan bottom spinner-->
                      <div class="clearfix"></div>
                      
                      <!-- start of family plan bottom spinner-->
                      <div class="plan_spinner_btm" id="family_plan_btm_spinner">
                        <div class="col-lg-6">
                          <h4>Parent</h4>
                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtAdultsBtm" disabled="disabled" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <input type="text" name="totalAdultTraveller" class="form-control text-center drop-down-plus wd4 input-number" value="1" data-min="1" data-max="2" id="txtAdultsBtm" readonly>
                            <span class="input-group-btn data-up ">
                            <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtAdultsBtm" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                            </span> </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-lg-6">

                          <h4>Children</h4>
                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtChildBtm" disabled="disabled" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <input type="text" name="totalChildTraveller" class="form-control text-center drop-down-plus wd4 input-number" value="1" data-min="1" data-max="15" id="txtChildBtm" readonly>
                            <span class="input-group-btn data-up ">
                            <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtChildBtm" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                            </span> </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-lg-6">
                          <h4>Other</h4>
                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtOtherBtm" disabled="disabled" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <input type="text" name="totalOtherTraveller" class="form-control text-center drop-down-plus wd4 input-number" value="0" data-min="0" data-max="15" id="txtOtherBtm" readonly>
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
                
                
              <td class="col-md-2 pad-none">
                 <button type="submit" class="border-radius btn btn-primary get-btn wd2">Get Quote</button>
                
                
                </td>
            </tr>
            <tr>
          		<td><span id="startDateBtmIn" style="color:red"> </span></td>
          		<td><span id="endDateBtmIn" style="color:red"> </span></td>
          		<td><span id="travelCountBtmIn" style="display: none">
                <label class="text-red">Please enter Treveller's information</label>
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