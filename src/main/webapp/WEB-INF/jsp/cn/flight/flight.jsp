<%@page import="com.ifwd.fwdhk.model.PlanDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<noscript>
<iframe src="//www.googletagmanager.com/ns.html?id=GTMK7TX8B"
height="0" width="0" style="display:none;visibility:hidden"></iframe>
</noscript>
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTMK7TX8B')
;</script>
       
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

     $(document).ready(function(){
         // personal was selected by default
         if("${planDetails.getPlanSelected()}".toLowerCase() == "family"){
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
	PlanDetails planDetails = (PlanDetails)request.getAttribute("planDetails"); 
    if(planDetails.getPlanSelected().equalsIgnoreCase("personal")){
	   PersonalPlanChecked = "checked";
   	}
    else if(planDetails.getPlanSelected().equalsIgnoreCase("family")){   		
   		FamilyPlanChecked = "checked";   		
   	} 
%>

<!--Main Content-->
<section id="main-slider" class="no-margin"> 
  <!--Mobile banner--> 
  <img src="resources/images/slider/flight_cn_m.jpg" alt="" class="img-responsive hidden-lg hidden-md"  />

  <div class="carousel slide hidden-xs hidden-sm">
    <div class="carousel-inner">
      <div class="item active">

    	<img src="resources/images/slider/flight_cn.jpg" alt="">
     </div>
     <!--/.item--> 
   </div>
   <!--/.carousel-inner--> 
 </div>
 <!--/.carousel--> 
</section>

 <section id="middle" class="hidden-sm hidden-xs fixed-content">
              <form name="freeFlight" method="post" onsubmit="return flightValidateDesk();" action="getFlightDate">
			<div class="container">
			  <div class="row">
			    <div class="col-lg-12 col-md-12 pad-none slide-form">
			      <h2>Á´ãÂç≥≥ËÂØåË™Á©∫èÂ‰øùÈö™</h2>
			      <table class="table activation-form3">
			        <tbody>
			        	<tr>
			        		<td><h3>∫Áôº•Ê</h3></td>
			        		<td><h3>ûÁ•Ê</h3></td>
			        		<td><h3>åË‰∫∫Êï∏</h3></td>
			        		<td><div id="divPersonsDesk" style="visibility:hidden;">
			             <h3 class="h3-i">
			               <label id="lblPeopleDesk">0</label>
			                                   ‰∫∫Êï∏ <br>
			                                   ÖË
			               <label id="lblDaysDesk">0</label>
			               	</h3>
			           </div></td>
			        	</tr>
			          <tr>
			            <td class="col-md-3  ">
			              <div class="input-group date" id="dp1"> <span class="input-group-addon in border-radius"><span><img src="resources/images/calendar.png" alt=""></span></span>
			                <input name="departureDate" type="text" class="datepicker form-control border-radius" id="txtStartDateDesk" onblur="chkValidFlightDepartureDate(this, 'startDateDeskIn', '');" value="${planDetails.getDepartureDate()}" readonly>
			              </div>
			              </td>
			            <td class="col-md-3 ">
			              <div class="input-group date" id="dp2"> <span class="input-group-addon in border-radius"><span><img src="resources/images/calendar.png" alt=""></span></span>
			                <input name="returnDate" type="text" class="datepicker form-control border-radius" id="txtEndDateDesk" onblur="chkValidFlightDate(this, 'endDateDeskIn', 'Return Date', 'txtStartDateDesk', 'startDateDeskIn','');" value="${planDetails.getReturnDate()}" readonly>
			              </div>
			              </td>
			            <td class="col-md-3">
			              <div class="dropdown  form-group drop-down wh-bg input-group-div marg-b2 dropup" id="myFWDropdown">
			                
			                <a href="#" class="dropdown-toggle col-lg-12 col-md-12" data-toggle="dropdown"> <label id="lblCountDesk"></label> <i class="fa fa-caret-down pull-right"></i> </a>
			                <div class="dropdown-menu bdr1">
			                  <div class="drop-content">
			                    <div class="col-lg-6">
			                      <label class="radio radio-warning radio-inline">
			                        <input type="radio" name="planSelected" id="personal_plan_desk" data-id="desk" class="plan" value="personal" <%=PersonalPlanChecked%>>
			                        <label for="personal_plan_desk"> ã‰∫∫Ë®àÂ</label></label>
			                    </div>
			                    <div class="col-lg-6">
			                      <label class="radio radio-warning radio-inline">
			                        <input type="radio" name="planSelected" id="family_plan_desk" data-id="desk" class="plan" value="family" <%=FamilyPlanChecked %>>
			                      <label for="family_plan_desk">  ÂÆ∂Â∫≠Ë®àÂ</label></label>
			                    </div>
			                    <div class="clearfix"></div>
			                    <hr>
			                    <!-- start of personal plan bottom spinner-->
			                 <input type="hidden" name="" id="family_desk_count" value="">
			                 <div class="plan_spinner_desk" id="personal_plan_desk_spinner">
			                   <div class="col-lg-6">
			                     <h4>ÖÂÆ¢</h4>
			                   </div>
			                   <div class="col-lg-6">
			                     <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
			                       <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtTravellersDesk" data-parent="personal"> <span class="glyphicon glyphicon-minus"></span> </button>
			                       </span>
			                       <div class="text-center drop-down-plus wd4 input-number">${planDetails.getTravellerCount()}</div>
			                       <input type="hidden" name="travellerCount" data-min="1" data-max="15" id="txtTravellersDesk" value="${planDetails.getTravellerCount()}"/>
			                       <input type="text" class="form-control text-center drop-down-plus wd4 input-number" name="travellerCount" value="${planDetails.getTravellerCount()}" data-min="1" data-max="15" id="txtTravellersDesk" readonly/>
			                       <span class="input-group-btn data-up ">
			                       <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtTravellersDesk" data-parent="personal"> <span class="glyphicon glyphicon-plus"></span> </button>
			                       </span> </div>
			                   </div>
			                 </div>
			                 <!-- end of personal plan bottom spinner-->
			                 <div class="clearfix"></div>
			                 
			                 <!-- start of family plan bottom spinner-->
			                 <div class="plan_spinner_desk" id="family_plan_desk_spinner">
			                   <div class="col-lg-6">
			                     <h4>ê‰∫∫</h4>
			                   </div>
			                   <div class="col-lg-6">
			                     <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
			                       <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtAdultsDesk" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
			                       </span>
			                       <div class="text-center drop-down-plus wd4 input-number">1</div>
			                       <input type="hidden" name="totalAdultTraveller" id="txtAdultsDesk" data-min="1" data-max="2" value="1"/>
			                       <span class="input-group-btn data-up ">
			                       <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtAdultsDesk" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
			                       </span> </div>
			                   </div>
			                   <div class="clearfix"></div>
			                   <div class="col-lg-6">
			                     <h4>Â≠êÂ•≥</h4>
			                   </div>
			                   <div class="col-lg-6">
			                     <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
			                       <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtChildDesk" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
			                       </span>
			                       <div class="text-center drop-down-plus wd4 input-number">1</div>
			                       <input type="hidden" name="totalChildTraveller" id="txtChildDesk" data-min="1" data-max="14" value="1"/>
			                       <span class="input-group-btn data-up ">
			                       <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtChildDesk" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
			                       </span> </div>
			                   </div>
			                   <div class="clearfix"></div>
			                   <div class="col-lg-6">
			                     <h4>∂‰ÖÂÆ¢</h4>
			                   </div>
			                   <div class="col-lg-6">
			                     <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
			                       <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtOtherDesk" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
			                       </span>
			                       <div class="text-center drop-down-plus wd4 input-number">0</div>
			                       <input type="hidden" name="totalOtherTraveller" id="txtOtherDesk" data-min="0" data-max="14" value="0"/>
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
			           
			         <td class="col-md-2 ">
			        	   <button type="submit" class="border-radius btn btn-primary  get-btn" >Á´ãÂç≥≥ËçË≤ª‰øùÈ!</button>
			           <!-- 	<a href="flight-plan-cn.html" class="border-radius btn btn-primary  get-btn marg-t2" onclick="return flightValidateDeskTravel()">Á´ãÂç≥≥ËçË≤ª‰øùÈ!</a> -->
			        </td>
			       </tr>
			     		<tr>
			     			<td><span id="startDateDeskIn" class="text-red"> </span></td>
			     			<td><span id="endDateDeskIn" class="text-red"> </span></td>
			     			<td><span id="travelCountDeskIn"  style="display:none">
			           <label class="text-red">Ë´ãËº∏•‰ø°ØÊË°åËÄ/label>
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
			</form>
			</section>





<!--Mobile-form-->
<div class="slider-form hidden-lg hidden-md">
 <form name="freeFlight" method="post" onsubmit="return flightValidateMob()" action="getFlightDate">
  <div class="form-container">
    <h2>Á´ãÂç≥≥ËÂØåË™Á©∫èÂ‰øùÈö™</h2>
    <h4>∫Áôº•Ê </h4>


    <div class="form-group">
      <div class="input-group date" id="dp3"> <span class="input-group-addon in"><span><img src="resources/images/calendar.png" alt=""></span></span>
        <input type="text" name="departureDate" class="datepicker form-control" id="txtStartDateMob" onblur="chkValidFlightDepartureDate(this, 'startDateMobIn', '');" value="${planDetails.getDepartureDate()}" readonly>
      </div>
    </div>
   <span id="startDateMobIn" class="text-red"> </span>
    <h4>ûÁ•Ê</h4>

    <div class="form-group">
      <div class="input-group date" id="dp4"> <span class="input-group-addon in"><span><img src="resources/images/calendar.png" alt=""></span></span>
        <input type="text" name="returnDate" class="datepicker form-control" id="txtEndDateMob" onblur="chkValidFlightDate(this, 'endDateMobIn', 'Return Date', 'txtStartDateMob', 'startDateMobIn', '');" value="${planDetails.getReturnDate()}">
      </div>
    </div>
   <span id="endDateMobIn" class="text-red"> </span>
    <h4>åË‰∫∫Êï∏</h4>

    <div class="dropdown  form-group drop-down dropup" id="myFWDropdownMob">
     
      <a href="#" class="dropdown-toggle col-sm-12 col-xs-12" data-toggle="dropdown"> <label id="lblCountMob"></label>  <i class="fa fa-caret-down pull-right"></i> </a>
      <div class="dropdown-menu bdr1 wd2">
        <div class="drop-content">
          <div class="col-xs-6 col-sm-6">
            <label class="radio radio-warning radio-inline">
              <input type="radio" name="planSelected" id="personal_plan_mob"  data-id="mob" class="plan" value="personal" <%=PersonalPlanChecked%>> <label for="personal_plan_mob">ã‰∫∫Ë®àÂ  </label></label>


          </div>
          <div class="col-xs-6 col-sm-6">
           <label class="radio radio-warning radio-inline">
              <input type="radio"  name="planSelected" id="family_plan_mob"  data-id="mob" class="plan" value="family" <%=FamilyPlanChecked %>>
            <label for="family_plan_mob"> ÂÆ∂Â∫≠Ë®àÂ </label></label>

          </div>
          <div class="clearfix"></div>
          <hr>
          <!-- Start of personal plan mobile spinner-->
          <input type="hidden" name="" id="family_mob_count" value="">
          <div class="plan_spinner_mob" id="personal_plan_mob_spinner">
            <div class="col-xs-6 col-sm-6">
              <h4>ÖÂÆ¢</h4>

            </div>
            <div class="col-xs-6 col-sm-6">
              <div class="input-group number-spinner none-bd "> <span class="input-group-btn data-dwn">
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
          <div class="plan_spinner_mob" id="family_plan_mob_spinner">
            <div class="col-xs-6 col-sm-6">
              <h4>ê‰∫∫</h4>
            </div>
            <div class="col-xs-6 col-sm-6">
              <div class="input-group number-spinner none-bd "> <span class="input-group-btn data-dwn">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="minus" data-field="txtAdultsMob" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                </span>
				<div class="text-center drop-down-plus wd4 input-number">1</div>
                <input type="hidden" name="totalAdultTraveller" id="txtAdultsMob" data-min="1" data-max="2" value="1"/>
                <span class="input-group-btn data-up ">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtAdultsMob" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                </span> </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-xs-6 col-sm-6">
              <h4>Â≠êÂ•≥</h4>
            </div>
            <div class="col-xs-6 col-sm-6">
              <div class="input-group number-spinner none-bd "> <span class="input-group-btn data-dwn">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="minus" data-field="txtChildMob" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                </span>
				<div class="text-center drop-down-plus wd4 input-number">1</div>
                <input type="hidden" name="totalChildTraveller" id="txtChildMob" data-min="1" data-max="14" value="1"/>
                <span class="input-group-btn data-up ">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtChildMob" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                </span> </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-xs-6 col-sm-6">
              <h4>∂‰ÖÂÆ¢</h4>
            </div>
            <div class="col-xs-6 col-sm-6">
              <div class="input-group number-spinner none-bd "> <span class="input-group-btn data-dwn">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="minus" data-field="txtOtherMob" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                </span>
				<div class="text-center drop-down-plus wd4 input-number">0</div>
                <input type="hidden" name="totalOtherTraveller" id="txtOtherMob" data-min="0" data-max="14" value="0"/>
                <span class="input-group-btn data-up ">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtOtherMob" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                </span> </div>
            </div>

          </div>
          <!-- End of family plan mobile spinner -->
          <div class="clearfix"></div>
        </div>
      </div>
      <div class="clearfix"></div>
    </div>
    <span id="travelCountMobIn" style="display:none">
    <label class="text-red">Ë´ãËº∏•‰ø°ØÊË°åËÄ/label>
    </span>
    <div id="divPersonsMob" style="visibility:hidden;"> <br>
      <small>
      <label id="lblPeopleMob">0</label>
      	‰∫∫Êï∏ ÖË
      <label id="lblDaysMob">0</label>
      	</small> <br>
    </div>
  </div>
  <div class="btn-box text-center">
    <h3 class="text-center"> 
      <button type="submit" class="bdr-curve-none btn btn-primary btn-lg " >Á´ãÂç≥≥ËçË≤ª‰øùÈ!</button>
      
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
      <h2 class="hidden-sm hidden-xs">‰∫´Â±ÈÊ∏ØÂá∫º‰ûÂ‰∏≠Ë™Áè≠<br>ÑËà™Á©∫ÊÂ§ñ‰™ÔË≤ªÁî®®ÂÔº/h2>


      <!--end-desktop--> 
      
      <!--Mobile-->
      <h2 class="hidden-lg hidden-md feature-ttl"><br>‰∫´Â±ÈÊ∏ØÂá∫º‰ûÂ‰∏≠Ë™Áè≠ÑËà™Á©∫ÊÂ§ñ‰™ÔË≤ªÁî®®ÂÔº/h2>


      <!--end Mobile--> 
    </div>
    
    <!--desktop-Features-->
    <div class="hidden-xs hidden-sm">
       <div class="col-lg-12 col-md-12 home-features pad-none"  >
        <div class="col-md-6 col-lg-6 text-center"> <img src="resources/images/home-flight1.png" alt=""  /> </div>
        <div class="col-md-6 col-lg-6">
          <div class="content">
            <h2>∂‰Ë≤ªÔ®Èù¢ÂÆâÂ</h2>
            <p class="details-text">áÂ®Âú®™Á‰∏≠‰Âπ∏ÊÂ§ñË∫´‰∫°ÔëÂÄëÂ∫ÊÇ®ÑÊëØË¶™ÂË≤ªÊ‰æõÊ∏ØÂπ500,000È´îÊÅ§ë„ÄÇËÉΩÂ§†ËÂÆ∂‰∫∫âÊ≠§Á©©È‰øùÈÔºåÂçÈΩÁÑ°ÂæåÈ°ß‰πãÊ/p>



            <a href="" class="h4-4 scrollToTop">‰∫ÜËß£¥Â</a> </div>
        </div>
        <div class="clearfix"></div>
        <br>
        <div class="col-md-6 col-lg-6">
          <div class="content">
            <h2>‰∏ÄÅ‰ÅÈÔºÅÂ∞±‰øÇÂÁ∞°ÂñÆÔº/h2>
            <p class="details-text">ï‰≥ËûÂ∏∏Á∞°ÂñÆÔºåÊÇ®™ÈË¶ÅÈÄöÁü•ëÂÄëÂπæÇÂá∫ºÂ∞±Â§ßÂäÊÇËÄå‰ÂØåËÊ∑±‰ø°ÖÈË¶ÅÂç≥àÊÂ•ΩÁé©ÔºåÊ‰ª•Â∞±ÁÆóÂéª∞ÁôªÊ©üÂ‰∏ÄªÂ≥ËΩÁÑ°èÈÔº/p>



            <a href="" class="h4-4 scrollToTop">‰∫ÜËß£¥Â</a> </div>
        </div>
        <div class="col-md-6 col-lg-6 text-center">  <img src="resources/images/home-flight-mob-2.png" alt=""  /> </div>
        <div class="clearfix"></div>
        <br>
        <div class="col-md-6 col-lg-6 text-center">  <img src="resources/images/home-flight3.png" alt=""  /> </div>
        <div class="col-md-6 col-lg-6">
          <div class="content">
            <h2>¨ÈêÂ‰øùÈö™ÁµÑÂ</h2>
            <p class="details-text">ÂØåËÑËà™Á©∫ÊÂ§ñ‰áÊÇ®æÊÑ‰ªª‰ΩïÊä‰™ËÉÈÉΩåÊ®£πÈÔºÅ‰Ë´ñÊÇ®Â∑≤Ë≥ºË≤∑Êä‰™Ë¶Ô‰∫¶ÂèØçË≤ª≥ËÂæûËÄåÁç≤ÂæóÈÂ§ñ‰úÔ</p>


            <a href="" class="h4-4 scrollToTop">‰∫ÜËß£¥Â</a> </div>
        </div>
        <div class="clearfix"></div>
        <div class="other-benefits col-lg-12">
          <h3 class="h4-2">‰∏ªËÊ¢ùÊ¨æäÁ¥∞áÔ</h3>

         <ul class="bullets">
            <li>
              <p class="h4-5"> ™ÈÅ©®Êñºó‰‰∫∫‰ª•‰ªòÊ¨æ‰πòÂÆ¢Ë∫´‰ªΩ‰πòÂ‰ªª‰¨ÂÖ±™Á©∫‰∫§ÈÄöÂ∑•∑ÊìÂ≠ÂèÂåÊ≠ª‰∫°ÁÖÊÔºå‰∏¶‰∏çÂ¨ÊâøÖÔπË®±ñÁ‰∫∫ÁãÂÔºå‰ª•ä‰∏ªË¶ÅÂ‰πòÂÆ¢ê‰ËßÄâÊôÂÊ∂àÈÂ®õÊÑÁãÂ/p>

            </li>
            <li>
              <p class="h4-5"> ó‰ÑËÁ®ãÈ±ÈÊ∏ØÂá∫ºÔ‰∏¶‰ª•È¶ôÊ∏Ø∫ÂÁ®ãÁÈªû„Ä/p>

            </li>
            <li>
              <p class="h4-5"> Ë°åÁ‰∏≠Á™Áè≠∏ÁõÆ‰∏¶ÊâÈ∂„Ä/p>

            </li>
            <li>
              <p class="h4-5"> ‰øùÈö™üÂèØ∑È30Â§©„Ä/p>

            </li>
            <li>
              <p class="h4-5"> ó‰ÑÊÁ®ãÈºÊ‰øùÁî≥Ë´ãÊó•‰π0Â§©ÂÖß∫Áôº/p>

            </li>
            <li>
              <p class="h4-5"> ‰∏çÈÅ©®ÊñºÊ©üÁ‰∫∫Âì°Å‰ªª‰ΩïÁãÂÅÂä„ÄÅÈäÊËªç‰Ë°åÂ/p>

            </li>
          </ul>
          <div class="spacer3"></div>
          <p class="h4-6">‰ª•‰Ë≥áÊ™‰ÉËÄÉÁî®î„ÄÇË©≥ÖË•Á <a href="resources/policy-provisions-pdf/FlightCare_Provisions_Mar_2015.pdf" target="_blank" class="sub-link-underline">‰øùÂñÆÊ¢ùÊ¨æ </a>ÇÊúÊÊ¨æÁ¥∞áÁË©≥Á¥∞Ë≥áÊ,Ë´ãËÅØÁµ°ÊÇ®ÑÁË≤°È°ßèÊ¥ÈõªëÂÄëÁ24Â∞èÊ±Á3123 3123áÂÆ¢∂Êô‰∏ª‰ªªËÅØÁµ°„Ä/p>

        </div>
      </div>
    </div>
    
    <!--mobile-Features-->
    <div class="hidden-lg hidden-md mob-features">
      <div class="col-xs-4 col-sm-4 text-center"> <img class="img-responsive" src="resources/images/home-flight1.png" alt=""  /> </div>
      <div class="col-xs-8 col-sm-8">
        <div>
          <h2 class="h2-3">∂‰Ë≤ªÔ®Èù¢ÂÆâÂ</h2>
          <p class="details-text">áÂ®Âú®™Á‰∏≠‰Âπ∏ÊÂ§ñË∫´‰∫°ÔëÂÄëÂ∫ÊÇ®ÑÊëØË¶™ÂË≤ªÊ‰æõÊ∏ØÂπ500,000È´îÊÅ§ë„ÄÇËÉΩÂ§†ËÂÆ∂‰∫∫âÊ≠§Á©©È‰øùÈÔºåÂçÈΩÁÑ°ÂæåÈ°ß‰πãÊ/p>


          <a href="" class="h4-4 scrollToTop">‰∫ÜËß£¥Â</a> </div>
      </div>
      <div class="clearfix"></div>
      <br>
      <div class="col-xs-4 col-sm-4 text-center"> <img class="img-responsive" src="resources/images/home-flight-mob-2.png" alt=""  /> </div>
      <div class="col-xs-8 col-sm-8">
        <div>
          <h2 class="h2-3">‰∏ÄÅ‰ÅÈÔºÅÂ∞±‰øÇÂÁ∞°ÂñÆÔº/h2>
          <p class="details-text">ï‰≥ËûÂ∏∏Á∞°ÂñÆÔºåÊÇ®™ÈË¶ÅÈÄöÁü•ëÂÄëÂπæÇÂá∫ºÂ∞±Â§ßÂäÊÇËÄå‰ÂØåËÊ∑±‰ø°ÖÈË¶ÅÂç≥àÊÂ•ΩÁé©ÔºåÊ‰ª•Â∞±ÁÆóÂéª∞ÁôªÊ©üÂ‰∏ÄªÂ≥ËΩÁÑ°èÈÔº/p>


          <a href="" class="h4-4 scrollToTop">‰∫ÜËß£¥Â</a> </div>
      </div>
      <div class="clearfix"></div>
      <br>
      <div class="col-xs-4 col-sm-4 text-center"> <img class="img-responsive" src="resources/images/home-flight3.png" alt=""  /> </div>
      <div class="col-xs-8 col-sm-8">
        <div>
          <h2 class="h2-3">¨ÈêÂ‰øùÈö™ÁµÑÂ</h2>
          <p class="details-text">ÂØåËÑËà™Á©∫ÊÂ§ñ‰áÊÇ®æÊÑ‰ªª‰ΩïÊä‰™ËÉÈÉΩåÊ®£πÈÔºÅ‰Ë´ñÊÇ®Â∑≤Ë≥ºË≤∑Êä‰™Ë¶Ô‰∫¶ÂèØçË≤ª≥ËÂæûËÄåÁç≤ÂæóÈÂ§ñ‰úÔ</p>


          <a href="" class="h4-4 scrollToTop">‰∫ÜËß£¥Â</a> </div>
      </div>
      <div class="clearfix"></div>
    </div>
    
    <!--/.row--> 
  </div>
  <!--/.container--> 
</section>
<!--/#feature-->

<section id="recent-works" class="hidden-xs hidden-sm">
  <div class="container"> 
    <!--Desktop Support-->
    <div class="row hidden-sm hidden-xs">
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
        <div class="recent-work-wrap wrap  text-center">
          <div class="recent-work-inner"> <img src="resources/images/time.png" alt=""  />
            <h1>Â∏∏Âú®®Â∑¶/h1>
            <p>ÂØåËê‰®Â§©4Â∞èÊ±ÁØÊè¥ÔºåÂè¶Ë®≠Ê5ìÂ‰ΩàÂÖ®Ê∏ØÁÂÆ¢Êà∂çÂ‰∏≠ÂÔºåÂ‰∏äÂË°õÊ <a href="http://www.fwd.com.hk/zh-HK/fwd-n-you/e_services_app.html" target="_blank">âÁî®Á®ãÂ</a>ÔºåÈö®ÇÁÇ∫®Ëß£Á≠î‰ªª‰ΩïÊü•Ë©¢„Ä/p>



          </div>
        </div>
      </div>
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
        <div class="recent-work-wrap-mid wrap  text-center">
          <div class="recent-work-inner"> <img src="resources/images/secure.png" alt=""  />
            <h1>ÂÆâÂÖ®ÔºåÂèØ/h1>
            <p>ÂØåËÈ¶ôÊ∏ØÑÂ£Ω™Â‰∏Ä¨‰™ÁãÊÊßãÂ≤ÂõËÁ¥öÊÊßãÊ‰∫àÂË∂äÁË≤°ÂÂØ¶ÂË©ïÁ -- ∂‰∏≠≤„ÄåÁËø™„ÄË©ïÁÇ∫A3Á¥ä„ÄåÊË≠ΩÂõ„ÄçË∫AÁ¥ö„Äbr>



              <br>
            </p>
          </div>
        </div>
      </div>
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
        <div class="recent-work-wrap wrap  text-center">
          <div class="recent-work-inner"> <img src="resources/images/rewards.png" alt=""  />
            <h1>Ë≥ûÊÇ®Ä/h1>
            <p>ÂØåË‰∏çÊñ∑∫ÊÇ®ê‰ÑÁ®ÆéËäÂÑ™†Ô‰ª§ÊÇ®Ñ‰™ËÉÊõ¥∏ÂÔºå‰Â¶ÇÂ‰æÜÁ‰øùË≤ªòÊâ£äÂÖ∂‰ªñÂ∑Ê‰æõÁ™ÊÁ≠â„Ä/p>
            




        </div>
      </div>
    </div>
    <!--End Desktop Support--> 

    <!--/.row--> 
  </div>
  <!--/.container--> 
</section>
<!--/#recent works-->

<section id="recent-works-mob" class="hidden-lg hidden-md"  >
  <div class="carousel slide">
    <div class="carousel-inner">
      <div class="item active">
        <div class="container">
          <div class="row slide-margin">
            <div class="recent-work-wrap text-center">
              <div class="recent-work-inner"> <img src="resources/images/time.png" alt=""  />
                <h2>Â∏∏Âú®®Â∑¶/h2>
                <p>ÂØåËê‰®Â§©4Â∞èÊ±ÁØÊè¥ÔºåÂè¶Ë®≠Ê5ìÂ‰ΩàÂÖ®Ê∏ØÁÂÆ¢Êà∂çÂ‰∏≠ÂÔºåÂ‰∏äÂË°õÊ<a href="http://www.fwd.com.hk/zh-HK/fwd-n-you/e_services_app.html" target="_blank">âÁî®Á®ãÂ</a>ÔºåÈö®ÇÁÇ∫®Ëß£Á≠î‰ªª‰ΩïÊü•Ë©¢„Ä/p>


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
                <h2>ÂÆâÂÖ®ÔºåÂèØ/h2>
                <p>ÂØåËÈ¶ôÊ∏ØÑÂ£Ω™Â‰∏Ä¨‰™ÁãÊÊßãÂ≤ÂõËÁ¥öÊÊßãÊ‰∫àÂË∂äÁË≤°ÂÂØ¶ÂË©ïÁ -- ∂‰∏≠≤„ÄåÁËø™„ÄË©ïÁÇ∫A3Á¥ä„ÄåÊË≠ΩÂõ„ÄçË∫AÁ¥ö„Ä/p>


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
                <h2>Ë≥ûÊÇ®Ä/h2>
                <p>ÂØåË‰∏çÊñ∑∫ÊÇ®ê‰ÑÁ®ÆéËäÂÑ™†Ô‰ª§ÊÇ®Ñ‰™ËÉÊõ¥∏ÂÔºå‰Â¶ÇÂ‰æÜÁ‰øùË≤ªòÊâ£äÂÖ∂‰ªñÂ∑Ê‰æõÁ™ÊÁ≠â„Ä/p>


              </div>
            </div>
          </div>
        </div>
      </div>
      <!--/.item--> 
    </div>
    <!--/.carousel inner--> 
  </div>
  <!--/.carousel--> 
  <a class="prev" href="#recent-works-mob" data-slide="prev"> <i class="fa fa-chevron-left"></i> </a> <a class="next" href="#recent-works-mob" data-slide="next"> <i class="fa fa-chevron-right"></i> </a> </section>
<section class="blog-item hidden-sm hidden-xs">
  <div class="container">

    <div class="center">
      <h2>±Ë¥Â</h2>

    </div>
    <div class="col-lg-12 pad-none">
      <div class="col-lg-4 col-md-4 pad-none">
        <div class="services-wrap service-bx1">
          <div> <a href="http://blog.fwd.com.hk/zh_HK/2015/03/17/7-musts-before-a-long-vacation/" target="_blank"><img class="bdr-img" src="resources/images/home4.png" alt=""></a>
            <h3> <a href="http://blog.fwd.com.hk/zh_HK/2015/03/17/7-musts-before-a-long-vacation/" target="_blank">æÈï∑áÂÂøÖÂ‰∏É‰ª∂‰∫ <i class="fa fa-caret-right"></i> </a></h3>
         
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-4 pad-none">
        <div class="services-wrap service-bx2">
          <div> <a href="http://blog.fwd.com.hk/zh_HK/2015/03/17/staying-connected-while-travelling-abroad/" target="_blank"><img class="bdr-img" src="resources/images/home5.png" alt=""></a>
            <h3><a href="http://blog.fwd.com.hk/zh_HK/2015/03/17/staying-connected-while-travelling-abroad/" target="_blank"> Â§ñÂá∫ÖÈÔºåÈÄπ´°È  <i class="fa fa-caret-right"></i> </a></h3>
         
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-4 pad-none">
        <div class="services-wrap service-bx3">
          <div> <a href="http://blog.fwd.com.hk/zh_HK/2015/03/19/tips-for-traveling-with-children-2/" target="_blank"><img class="bdr-img" src="resources/images/home6.png" alt=""></a>
            <h3> <a href="http://blog.fwd.com.hk/zh_HK/2015/03/19/tips-for-traveling-with-children-2/" target="_blank">Ë¶™ÂÖËÂ∞èË≤ºÂ£ <i class="fa fa-caret-right"></i> </a></h3>
           
          </div>
        </div>
      </div>
    </div>
    <!--/.row--> 
    
     <p>öÂÆ¢Ë≥áÊË¨π‰ÉËÄÉÔÂØåË‰∫∫Â£Ω‰øùÈö™(æÊâÈ¨Âè∏äÂÖ∂ØÁπ´¨Âè∏ (úÂË°õ‚ÄñÁÑ∂Â∑≤Áõ°õÁ¢∫‰øùÊËºâÁË≥áÊÊ≠¢∫°Ë™§Ôºå‰ÂØåË‰∏¶‰Â∞±ËôÁÊ∫ñÁ¢∫ßÊÂÆåÊï¥ß‰∫‰ªª‰Ωï‰Ë≠âÊ≥Ëø∞ÇÂË°õÂ‰∏çÊ†ÁÑ°Ê≥ïÊ‰∏çËÉΩ‰ΩøÁî®‰ªª‰Ë≥áÊñ‰ªª‰ΩïÊ≠§öÂÆ¢ÄËºâ‰Ë≥áÊÑÈåØË™§Ê∫ÊåË‰∏ä‰ªª‰ΩïÁõ¥•„ÄÅÈÂ∏∂„ÄÅÂúÊÄß„ÄÅÈ•Ê≤ÁΩ∞ßÁçÂ§±ÑË≤¨‰ªªÔ‰ΩøÁî®ÖÊ™ËÂ∞èÂË©ï‰º∞Ë≥áÊ/p>




     </div>
  <!--/.container--> 
</section>
<!--/#services-->

<section id="bottom-form" class="hidden-sm hidden-xs">


  <div class="container">
    <div class="row">
    <form name="freeFlight" method="post" onsubmit="return flightValidateBtm()" action="getFlightDate">
      <div class="col-lg-12 col-md-12 pad-none slide-form">
        <h2>Á´ãÂç≥≥ËÂØåË™Á©∫èÂ‰øùÈö™</h2>
         

        <table class="table activation-form3 ">
          <tbody>
          	<tr>
          		<td><h3>∫Áôº•Ê</h3></td>
          		<td><h3>ûÁ•Ê</h3></td>
          		<td><h3>åË‰∫∫Êï∏</h3></td>
          		<td>
          			<div id="divPersonsBtm" style="visibility:hidden;">
	                  <h3 class="h3-i">
	                    <label id="lblPeopleBtm">0</label>
	                                               ‰∫∫Êï∏ <br>
	                                               ÖË
	                    <label id="lblDaysBtm">0</label>
	
	                       </h3>
	                </div>
          		</td>
          	</tr>
            <tr>
              <td class="col-md-3  ">
                <div class="input-group date" id="dp5"> <span class="input-group-addon in border-radius"><span><img src="resources/images/calendar.png" alt=""></span></span>
                  <input type="text" name="departureDate"  class="datepicker form-control border-radius" id="txtStartDateBtm" onblur="chkValidFlightDepartureDate(this, 'startDateBtmIn', '');" value="${planDetails.getDepartureDate()}" readonly>
                </div>
               </td>
              <td class="col-md-3 ">
                <div class="input-group date" id="dp6"> <span class="input-group-addon in border-radius"><span><img src="resources/images/calendar.png" alt=""></span></span>
                  <input type="text" name="returnDate" class="datepicker form-control border-radius" id="txtEndDateBtm" onblur="chkValidFlightDate(this, 'endDateBtmIn', 'Depature Date', 'txtStartDateBtm', 'startDateBtmIn', '');" value="${planDetails.getReturnDate()}" readonly>
                </div>
              </td>
              <td class="col-md-3 ">
                <div class="dropdown  form-group drop-down wh-bg input-group-div marg-b2 dropup" id="myFWDropdownBtm">
                 
                  <a href="#" class="dropdown-toggle col-lg-12 col-md-12" data-toggle="dropdown">  <label id="lblCountBtm"></label> <i class="fa fa-caret-down pull-right"></i> </a>
                  <div class="dropdown-menu bdr1">
                    <div class="drop-content">
                      <div class="col-lg-6">
                         <label class="radio radio-warning radio-inline">
                          <input type="radio" name="planSelected" id="personal_plan_btm" data-id="btm" class="plan" value="personal"  <%=PersonalPlanChecked%>> <label for="personal_plan_btm"> ã‰∫∫Ë®àÂ  </label></label>


                      </div>
                      <div class="col-lg-6">
                          <label class="radio radio-warning radio-inline">
                          <input type="radio" name="planSelected" id="family_plan_btm" data-id="btm" class="plan" value="family" <%=FamilyPlanChecked %>> <label for="family_plan_btm"> ÂÆ∂Â∫≠Ë®àÂ </label></label>


                      </div>
                      <div class="clearfix"></div>
                      <hr>
                      <!-- start of personal plan bottom spinner-->
                      <input type="hidden" name="" id="family_btm_count" value="">
                      <div class="plan_spinner_btm" id="personal_plan_btm_spinner">
                        <div class="col-lg-6">
                          <h4>ÖÂÆ¢</h4>

                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtTravellersBtm" data-parent="personal"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <input type="text" class="form-control text-center drop-down-plus wd4 input-number" name="travellerCount" value="${planDetails.getTravellerCount()}" data-min="1" data-max="15" id="txtTravellersBtm" readonly/>                           
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
                          <h4>ê‰∫∫</h4>

                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtAdultsBtm" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <div class="text-center drop-down-plus wd4 input-number">1</div>
                            <input type="hidden" name="totalAdultTraveller" id="txtAdultsBtm" data-min="1" data-max="2" value="1"/>
                            <span class="input-group-btn data-up ">
                            <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtAdultsBtm" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                            </span> </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-lg-6">
                          <h4>Â≠êÂ•≥</h4>

                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtChildBtm" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <div class="text-center drop-down-plus wd4 input-number">1</div>
                            <input type="hidden" name="totalChildTraveller" id="txtChildBtm" data-min="1" data-max="14" value="1"/>
                            <span class="input-group-btn data-up ">
                            <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtChildBtm" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                            </span> </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-lg-6">
                          <h4>∂‰ÖÂÆ¢</h4>

                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtOtherBtm" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <div class="text-center drop-down-plus wd4 input-number">0</div>
                            <input type="hidden" name="totalOtherTraveller" id="txtOtherBtm" data-min="0" data-max="14" value="0"/>
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
                

              <td class="col-md-2 ">
                <button type="submit" class="border-radius btn btn-primary  get-btn">
                Á´ãÂç≥≥ËçË≤ª‰øùÈ!
                </button>
                 </td>
            </tr>
            <tr>
            	<td><span id="startDateBtmIn" class="text-red"> </span></td>
            	<td><span id="endDateBtmIn" class="text-red"> </span></td>
            	<td><span id="travelCountBtmIn" style="display:none ;">
                <label class="text-red">Ë´ãËº∏•‰ø°ØÊË°åËÄ/label>
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


       
       
       