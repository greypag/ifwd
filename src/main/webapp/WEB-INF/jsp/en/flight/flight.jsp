<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

<!--Main Content-->
<section id="main-slider" class="no-margin"> 
<!--Mobile banner--> 
<img src="resources/images/slider/flight_en_m.jpg" alt="" class="img-responsive hidden-lg hidden-md"  /> 
  <!--Mobile banner-->
  <div class="carousel slide hidden-xs hidden-sm">
    <div class="carousel-inner">
      <div class="item active">
     
        <img src="resources/images/slider/flight_en.jpg" alt="">
         </div>
      <!--/.item--> 
    </div>
    <!--/.carousel-inner--> 
  </div>
  <!--/.carousel--> 
</section>

<!-- flight top form -->
  <section id="middle" class="hidden-sm hidden-xs fixed-content">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 col-md-12 pad-none slide-form">
      <form name="freeFlight" method="post"   onsubmit="return flightValidateDesk()" action="getFlightDate">    
        <h2>Get your flight insurance now</h2>
       
             <table class="table activation-form3">
          <tbody>
            <tr>
              <td class="col-md-3 pad-none"><h3>When are you leaving?</h3>
                <div class="input-group date" id="dp1"> <span class="input-group-addon in border-radius"><span><img src="resources/images/calendar.png" alt=""></span></span>
                  <input name="departureDate" type="text" class="datepicker form-control border-radius" id="txtStartDateDesk">
                </div>
                <span id="startDateDeskIn" class="text-red" > </span>
                </td>
              <td class="col-md-3 pad-none"><h3>When will you be back?</h3>
                <div class="input-group date" id="dp2"> <span class="input-group-addon in border-radius"><span><img src="resources/images/calendar.png" alt=""></span></span>
                  <input name="returnDate" type="text" class="datepicker form-control border-radius" id="txtEndDateDesk">
                </div>
             	<span id="endDateDeskIn"  class="text-red" > </span>
             </td>
              <td class="col-md-3 pad-none"><h3>Who's travelling?&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</h3>
                <div class="dropdown  form-group drop-down wh-bg input-group-div marg-b2 dropup" id="myFWDropdown">
                 
                  <a href="#" class="dropdown-toggle col-lg-12 col-md-12" data-toggle="dropdown">  <label id="lblCountDesk"></label> <i class="fa fa-caret-down pull-right"></i> </a>
                  <div class="dropdown-menu bdr1">
                    <div class="drop-content">
                      <div class="col-lg-6">
                        <label class="radio radio-warning radio-inline">
                          <input type="radio" name="planSelected" id="personal_plan_desk" data-id="desk" class="plan" value="personal"  checked="" >
                          <label for="personal_plan_desk"> Personal <br>    Plan </label>
                         </label> 
                      </div>
                      <div class="col-lg-6">
                       <label class="radio radio-warning radio-inline">
                          <input type="radio" name="planSelected" id="family_plan_desk" data-id="desk" class="plan" value="family" >
                          <label for="family_plan_desk"> Family <br>  Plan </label>
                          </label>
                      </div>
                      <div class="clearfix"></div>
                      <hr>
                      <!-- start of personal plan desk spinner-->
                      <input type="hidden" name="" id="family_desk_count" value="">
                      <div class="plan_spinner_desk" id="personal_plan_desk_spinner">
                        <div class="col-lg-6">
                          <h4>Travellers</h4>
                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtTravellersDesk" disabled="disabled" data-parent="personal"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <input type="text" name="travellerCount" class="form-control text-center drop-down-plus wd4 input-number" value="0" data-min="0" data-max="15" id="txtTravellersDesk" readonly>
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
                            <input type="text" name="totalAdultTraveller" class="form-control text-center drop-down-plus wd4 input-number" value="1" data-min="1" data-max="2" id="txtAdultsDesk" readonly>
                            <span class="input-group-btn data-up ">
                            <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtAdultsDesk" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                            </span> </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-lg-6">
                          <h4>Child</h4>
                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtChildDesk" disabled="disabled" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <input type="text" name="totalChildTraveller" class="form-control text-center drop-down-plus wd4 input-number" value="0" data-min="0" data-max="14" id="txtChildDesk" readonly>
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
                            <input type="text" name="totalOtherTraveller" class="form-control text-center drop-down-plus wd4 input-number" value="0" data-min="0" data-max="14" id="txtOtherDesk" readonly>
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
                <span id="travelCountDeskIn" style="display:none">
              <label class="text-red">Please enter Traveller's information</label>
              </span>
                </td>
              <td class="col-md-2 pad-none"><div id="divPersonsDesk" style="visibility:hidden;">
                  <h3 class="h3-i">
                    <label id="lblPeopleDesk">0</label>
                    people <br>
                    travelling
                    <label id="lblDaysDesk">0</label>
                    day(s) </h3>
                </div>
                <button  type="submit" class="bdr-curve-none btn btn-primary marg-t2 btn-lg">
            	Apply for Free Now!
             </button> 
              </td>
              
        
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
 <form name="freeFlight" method="post"   onsubmit="return flightValidateMob()" action="getFlightDate">
  <div class="form-container">
    <h2>FlightCare</h2>
    <h4>When are you leaving? </h4>
    <div class="form-group">
      <div class="input-group date" id="dp3"> <span class="input-group-addon in"><span><img src="resources/images/calendar.png" alt="calendar"></span></span>
        <input type="text" name="departureDate" class="datepicker form-control" id="txtStartDateMob">
      </div>
    </div>
    <span id="startDateMobIn"  class="text-red"> </span>
    <h4>When will you be back? </h4>
    <div class="form-group">
      <div class="input-group date" id="dp4"> <span class="input-group-addon in"><span><img src="resources/images/calendar.png" alt="calendar"></span></span>
        <input type="text" name="returnDate" class="datepicker form-control" id="txtEndDateMob">
      </div>
    </div>
    <span id="endDateMobIn" class="text-red"> </span>
    <h4>Who’s travelling?</h4>
    <div class="dropdown  form-group drop-down dropup" id="myFWDropdownMob">
     <a href="#" class="dropdown-toggle  col-sm-12 col-xs-12"  data-toggle="dropdown"> <label id="lblCountMob"></label> <i class="fa fa-caret-down pull-right"></i> </a>
      <div class="dropdown-menu bdr1 wd2">
        <div class="drop-content">
          <div class="col-xs-6 col-sm-6">
            <label class="radio radio-warning radio-inline">
              <input type="radio"  name="planSelected" id="personal_plan_mob"  data-id="mob" class="plan" value="personal" checked="">
              <label for="personal_plan_mob"> Personal <br>Plan </label>
            </label>  
          </div>
          <div class="col-xs-6 col-sm-6">
            <label class="radio radio-warning radio-inline">
              <input type="radio"   name="planSelected" id="family_plan_mob"  data-id="mob" class="plan" value="family" >
              <label for="family_plan_mob">  Family <br>Plan </label>
           </label> 
          </div>
          <div class="clearfix"></div>
          <hr>
          <!-- Start of personal plan mobile spinner-->
          <input type="hidden" name="familyPlan" id="family_mob_count" value="">
          <div class="plan_spinner_mob" id="personal_plan_mob_spinner">
            <div class="col-xs-6 col-sm-6">
              <h4>Travellers</h4>
            </div>
            <div class="col-xs-6 col-sm-6">
              <div class="input-group number-spinner none-bd "> <span class="input-group-btn data-dwn" >
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="minus" data-field="txtTravellersMob" disabled="disabled" data-parent="personal"> <span class="glyphicon glyphicon-minus"></span> </button>
                </span>
                <input type="text" name="travellerCount" class="form-control text-center drop-down-plus input-number" value="0" data-min="0" data-max="15" id="txtTravellersMob" readonly />
                <span class="input-group-btn data-up ">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtTravellersMob" data-parent="personal"> <span class="glyphicon glyphicon-plus"></span> </button>
                </span> </div>
            </div>
          </div>
          <!-- End of personal plan mobile spinner--> 
          <!-- Start of family plan mobile spinner-->
          <div class="plan_spinner_mob" id="family_plan_mob_spinner">
            <div class="col-xs-6 col-sm-6">
              <h4>Parent</h4>
            </div>
            <div class="col-xs-6 col-sm-6">
              <div class="input-group number-spinner none-bd "> <span class="input-group-btn data-dwn" >
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="minus" data-field="txtAdultsMob" disabled="disabled" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                </span>
                <input type="text" name="totalAdultTraveller" class="form-control text-center drop-down-plus input-number" value="1" data-min="1" data-max="2" id="txtAdultsMob" readonly />
                <span class="input-group-btn data-up ">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtAdultsMob" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                </span> </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-xs-6 col-sm-6">
              <h4>Child</h4>
            </div>
            <div class="col-xs-6 col-sm-6">
              <div class="input-group number-spinner none-bd "> <span class="input-group-btn data-dwn" >
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="minus" data-field="txtChildMob" disabled="disabled" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                </span>
                <input type="text" name="totalChildTraveller" class="form-control text-center drop-down-plus input-number" value="0" data-min="0" data-max="14" id="txtChildMob"  readonly=""/>
                <span class="input-group-btn data-up ">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtChildMob" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                </span> </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-xs-6 col-sm-6">
              <h4>Other</h4>
            </div>
            <div class="col-xs-6 col-sm-6">
              <div class="input-group number-spinner none-bd "> <span class="input-group-btn data-dwn" >
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="minus" data-field="txtOtherMob" disabled="disabled" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                </span>
                <input type="text" name="totalOtherTraveller" class="form-control text-center drop-down-plus input-number" value="0" data-min="0" data-max="14" id="txtOtherMob" readonly/>
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
    <span id="travelCountMobIn" style="display:none">
    <label class="text-red">Please enter Traveller's information</label>
    </span>
    <div id="divPersonsMob" style="visibility:hidden;"> <br>
      <small>
      <label id="lblPeopleMob">0</label>
      people travelling
      <label id="lblDaysMob">0</label>
      day(s) </small> <br>
    </div>
  </div>
  <div class="btn-box">
    <h3 class="text-center"> 
  <button type="submit"  class="bdr-curve-none btn btn-primary btn-lg ">Apply for Free Now</button>
  </h3> 
  </div>
  </form>
</div>
<!--Mobile-form--> 

<!--/#main-slider-->

<section id="feature" >
  <div class="container pad-none">
    <div class="center"> 
      <!--desktop-->
      <h2 class="hidden-sm hidden-xs">Enjoy flight coverage on round trips and connecting flights originating from Hong Kong ... for free!</h2>
      <!--end-desktop--> 
      
      <!--Mobile-->
      <h2 class="hidden-lg hidden-md feature-ttl"> <br> Enjoy flight coverage on round trips and connecting flights originating from Hong Kong ... for free!</h2>
      <!--end mobile--> 
    </div>
    
    <!--desktop Features-->
    <div class="hidden-xs hidden-sm">
      <div class="col-lg-12 col-md-12 pad-none home-features">
        <div class="col-md-6 col-lg-6 text-center pad-none"> <img src="resources/images/home-flight1.png" alt=""  /> </div>
        <div class="col-md-6 col-lg-6 pad-none">
          <div class="content">
            <h2>Extra Peace of Mind for FREE</h2>
            <p class="h4-3">We're offering to boost your loved ones' support in the event of accidental death whilst you’re in the air with free HK$500,000 coverage. With this in your armoury you can relax knowing the financial support is there.</p>
            <a href="" class="h4-4 scrollToTop">Get a quote to learn more</a> </div>
        </div>
        <div class="clearfix"></div>
        <br>
        <div class="col-md-6 col-lg-6 pad-none">
          <div class="content">
            <h2>As Simple As 1, 2, Fly!</h2>
            <p class="h4-3">Our application is quick & easy. Just tell us when you’re travelling and you’re done! If you’re the spontaneous kind, you can even apply just before boarding!</p>
            <a href="" class="h4-4 scrollToTop">Get a quote to learn more</a> </div>
        </div>
        <div class="col-md-6 col-lg-6 text-center pad-none"> <img src="resources/images/home-flight-mob-2.png" alt=""  /> </div>
        <div class="clearfix"></div>
        <br>
        <div class="col-md-6 col-lg-6 text-center pad-none"> <img src="resources/images/home-flight3.png" alt=""  /> </div>
        <div class="col-md-6 col-lg-6">
          <div class="content">
            <h2>Make It A Combo In A Snap</h2>
            <p class="h4-3">FWD FlightCare fits well with any travel insurance plan you might already have, and if you don’t, a top-up to a comprehensive TravelCare is just one click away!</p>
            <a href="" class="h4-4 scrollToTop">Get a quote to learn more</a> </div>
        </div>
        <div class="clearfix"></div>
        <div class="other-benefits col-lg-12 col-md-12 pad-none">
          <h3 class="h4-2">Major Terms & Conditions:</h3>
          <ul class="bullets">
            <li>
              <p class="h4-5"> Applicable only when the insured is riding as a fare-paying passenger in or on any public transport or carriers (excluding contractor, chartered or private carriers, and     any carriers which are operated primarily for sight-seeing service and amusement of the passengers).</p>
            </li>
            <li>
              <p class="h4-5"> Applicable journey must originate from and return to Hong Kong. </p>
            </li>
            <li>
              <p class="h4-5"> No restriction on the number of flights during a journey.</p>
            </li>
            <li>
              <p class="h4-5"> Maximum period of insurance must be  30 consecutive calendar days.</p>
            </li>
            <li>
              <p class="h4-5"> The application date must be within 30 days of the departure date.</p>
            </li>
            <li>
              <p class="h4-5"> Not applicable to crew member or an operator of any carrier, tour guide or tour escort, and armed force service. </p>
            </li>
          </ul>
          <div class="spacer3"></div>
          <p class="h4-6">The features above are indicative only. Please refer to the  <a href="policy-provisions-pdf/FlightCare_Provisions_Mar_2015.pdf" target="_blank" class="sub-link-underline">Policy Provisions</a>   for details. </p>
          <p class="h4-6">For a complete explanation of the terms and conditions, feel free to contact an adviser or our 24-hour hotline at 3123 3123 for more details.</p>
        </div>
      </div>
    </div>
    
    <!--mobile-Features-->
    <div class="row hidden-lg hidden-md mob-features">
      <div class="col-xs-4 col-sm-4 text-center"> <img class="img-responsive" src="resources/images/home-flight1.png" alt=""  /> </div>
      <div class="col-xs-8 col-sm-8">
        <div>
          <h2 class="h2-3">Extra Peace of Mind for FREE</h2>
          <p class="h4-3">We're offering to boost your loved ones' support in the event of accidental death whilst you’re in the air with free HK$500,000 coverage. With this in your armoury you can relax knowing the financial support is there. </p>
          <a href="" class="h4-4 scrollToTop">Get a quote to learn more</a> </div>
      </div>
      <div class="clearfix"></div>
      <br>
      <div class="col-xs-4 col-sm-4 text-center"> <img class="img-responsive" src="resources/images/home-flight-mob-2.png" alt=""  /> </div>
      <div class="col-xs-8 col-sm-8">
        <div>
          <h2 class="h2-3">As Simple As 1, 2, Fly!</h2>
          <p class="h4-3">Our application is as quick as finishing a couple of biscuits. Just tell us when you’re travelling and you’re done! If you’re the spontaneous kind, you can even apply just before boarding!</p>
          <a href="" class="h4-4 scrollToTop">Get a quote to learn more</a> </div>
      </div>
      <div class="clearfix"></div>
      <br>
      <div class="col-xs-4 col-sm-4 text-center"> <img class="img-responsive" src="resources/images/home-flight3.png" alt=""  /> </div>
      <div class="col-xs-8 col-sm-8">
        <div>
          <h2 class="h2-3">Make It A Combo In A Snap</h2>
          <p class="h4-3">Our Free Flight policy fits well with any travel insurance plan you might already have, and if you don’t, a top-up to TravelCare is just one click away!</p>
          <a href="" class="h4-4 scrollToTop">Get a quote to learn more</a> </div>
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
          <div class="recent-work-inner"> <img src="resources/images/time.png" alt=""  />
            <h1>Here When<br>
              You Need Us</h1>
            <p>
            	Our 24x7 call centre support, 5 drop-in locations across Hong Kong and our <a href=" http://www.fwd.com.hk/en-US/fwd-n-you/e_services_app.html" target="_blank">app </a>  ensures you get the support you need, when you need it.
            </p>
            </div>
        </div>
      </div>
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
        <div class="recent-work-wrap-mid wrap  text-center">
          <div class="recent-work-inner"> <img src="resources/images/secure.png" alt=""  />
            <h1>Secure &amp; <br>
              Stable</h1>
          	  <p>We have been assigned strong financial strength ratings by international rating agencies -- we have been rated "A3" by Moody's and "A" by Fitch.<br>
              <br>
            </p>
          </div>
        </div>
      </div>
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
        <div class="recent-work-wrap wrap  text-center">
          <div class="recent-work-inner"> <img src="resources/images/rewards.png" alt=""  />
            <h1>Rewards &amp;<br>
              Benefits</h1>
            <p>We continue to find you great rewards and benefits that let you get more from your insurance - discounts on future insurance, special offers from partners and more.</p>
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
              <div class="recent-work-inner"> <img src="resources/images/time.png" alt=""  />
                <h2>Here When You Need Us</h2>
                <p>Our 24x7 call center support. 5 drop-in locations across the island and our <a  href=" http://www.fwd.com.hk/en-US/fwd-n-you/e_services_app.html" target="_blank">app </a> ensures you get the support you need, when you need it.</p>
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
                <h2>Secure & Stable</h2>
                <p>We have been assigned strong financial strength ratings by international rating agencies -- we have been rated "A3" by Moody's and "A" by Fitch.</p>
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
                <h2>Rewards &amp; Benefits</h2>
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
<section class="blog-item hidden-sm hidden-xs">
  <div class="container pad-none">
    <div class="center">
      <h2>Read more from our blog</h2>
    </div>
     <div>
     <div class="col-lg-4 col-md-4 pad-none">
        <div class="services-wrap service-bx1">
          <div> <img class="bdr-img" src="resources/images/home4.png" alt="">
            <h3><a href="http://blog.fwd.com.hk/" target="_blank"> 6 Musts Before a Long Vacation <i class="fa fa-caret-right"></i></a> </h3>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-4 pad-none">
        <div class="services-wrap service-bx2">
          <div> <img class="bdr-img" src="resources/images/home5.png" alt="">
             <h3><a href="http://blog.fwd.com.hk/"  target="_blank"> Staying Connected While travelling Abroad <i class="fa fa-caret-right"></i> </a></h3>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-4 pad-none">
        <div class="services-wrap service-bx3">
          <div> <img class="bdr-img" src="resources/images/home6.png" alt="">
           <h3><a href="http://blog.fwd.com.hk/" target="_blank">Tips for travelling with Children <i class="fa fa-caret-right"></i></a> </h3>
         
          </div>
        </div>
      </div>

      <div class="clearfix"></div>
    </div>
    
    <p>The information provided in the blogs is for reference only.  While FWD Life Insurance Company (Bermuda) Limited and its affiliates (“FWD”) use reasonable efforts to ensure the information is accurate, FWD makes no warranties or representations as to the accuracy or completeness of any of the information and assumes no liability for any errors or omissions thereof.  FWD shall not be liable for any direct, incidental, consequential, indirect or punitive damages arising out of access to, use of or inability to use the information, or any errors or omissions in the content of this material.  Users should carefully evaluate the information.</p>


    <!--/.row--> 
  </div>
  <!--/.container--> 
</section>
<!--/#services-->


<section id="bottom-form" class="hidden-sm hidden-xs">
  <div class="container">
    <div class="row">
     <form name="freeFlight" method="post"   onsubmit="return flightValidateBtm()" action="getFlightDate">
      <div class="col-lg-12 col-md-12 pad-none slide-form">
        <h2>Get your flight insurance now</h2>
        <table class="table activation-form3">
          <tbody>
            <tr>
              <td class="col-md-3 pad-none"><h3>When are you leaving?</h3>
                <div class="input-group date" id="dp5"> <span class="input-group-addon in border-radius"><span><img src="resources/images/calendar.png" alt=""></span></span>
                  <input name="departureDate" type="text" class="datepicker form-control border-radius" id="txtStartDateBtm">
                </div>
                 <span id="startDateBtmIn" class="text-red"> </span></td>
              <td class="col-md-3 pad-none"><h3>When will you be back?</h3>
                <div class="input-group date" id="dp6"> <span class="input-group-addon in border-radius"><span><img src="resources/images/calendar.png" alt=""></span></span>
                  <input name="returnDate" type="text" class="datepicker form-control border-radius" id="txtEndDateBtm">
                </div>
                <span id="endDateBtmIn" class="text-red"> </span></td>
              <td class="col-md-3 pad-none"><h3>Who's travelling?</h3>
                 <div class="dropdown  form-group drop-down wh-bg input-group-div marg-b2 dropup" id="myFWDropdownBtm">
                 
                  <a href="#" class="dropdown-toggle col-lg-12 col-md-12" data-toggle="dropdown">  <label id="lblCountBtm"></label> <i class="fa fa-caret-down pull-right"></i> </a>
                  <div class="dropdown-menu bdr1">
                    <div class="drop-content">
                      <div class="col-lg-6">
                        <label class="radio radio-warning radio-inline">
                          <input type="radio" name="planSelected" id="personal_plan_btm" data-id="btm" class="plan" value="personal"  checked="" >
                          <label for="personal_plan_btm"> Personal <br>    Plan </label>
                         </label> 
                      </div>
                      <div class="col-lg-6">
                       <label class="radio radio-warning radio-inline">
                          <input type="radio" name="planSelected" id="family_plan_btm" data-id="btm" class="plan" value="family" >
                          <label for="family_plan_btm"> Family <br>  Plan </label>
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
                            <input type="text" name="travellerCount" class="form-control text-center drop-down-plus wd4 input-number" value="0" data-min="0" data-max="15" id="txtTravellersBtm" readonly>
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
                            <input type="text" name="totalAdultTraveller"  class="form-control text-center drop-down-plus wd4 input-number" value="1" data-min="1" data-max="2" id="txtAdultsBtm" readonly>
                            <span class="input-group-btn data-up ">
                            <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtAdultsBtm" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                            </span> </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-lg-6">
                          <h4>Child</h4>
                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtChildBtm" disabled="disabled" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <input type="text" name="totalChildTraveller" class="form-control text-center drop-down-plus wd4 input-number" value="0" data-min="0" data-max="15" id="txtChildBtm" readonly>
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
                <span id="travelCountBtmIn" style="visibility:hidden;">
                <label class="text-red">Please enter Traveller's information</label>
                </span>
                </td>
              <td class="col-md-2 pad-none"><div id="divPersonsBtm" style="visibility:hidden;">
                  <h3 class="h3-i">
                    <label id="lblPeopleBtm">0</label>
                    people <br>
                    travelling
                    <label id="lblDaysBtm">0</label>
                    <input type="hidden" id="lblDaysBtm" name="daysJsp">
day(s) </h3> 
                </div>
                <!--  <input type="submit" class="border-radius btn btn-primary get-btn marg-t2" value="Apply for Free Now!"> -->
                 <button  type="submit" class="bdr-curve-none btn btn-primary marg-t2 btn-lg">
            	Apply for Free Now!
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