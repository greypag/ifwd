<%@page import="com.ifwd.fwdhk.model.TravelQuoteBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--   Main Content-->

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
  <!--Mobilebanner--> 
  <img src="resources/images/slider/travel_cn_m.jpg" alt="" class="img-responsive hidden-lg hidden-md"  /> 
  <!--Mobilebanner-->
<div class="carousel slide hidden-xs hidden-sm">
<div class="carousel-inner">
<div class="item active">

<!--/#middle-->
        <img src="resources/images/slider/travel_cn.jpg" alt=""  /> </div>
      <!--/.item--> 
    </div>
    <!--/.carousel inner--> 
  </div>
  <!--/.carousel--> 
</section>

<form name="frmTravelGetQuote" id="frmTravelGetQuote" commandName="travelQuote" action="getTravelQuote" method="post" onsubmit="return flightValidateDeskTravel();">
<section id="middle" class="hidden-sm hidden-xs fixed-content">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 col-md-12 pad-none slide-form">
        <h2>立即申請富衛旅遊保險</h2>
      		      <table class="table activation-form3">
			        <tbody>
			        	<tr>
			        		<td><h3>出發日期</h3></td>
			        		<td><h3>回程日期</h3></td>
			        		<td><h3>同行人數</h3></td>
			        		<td><div id="divPersonsDesk" style="visibility:hidden;">
			             <h3 class="h3-i">
			               <label id="lblPeopleDesk">0</label>
			                                   人數 <br>
			                                   旅行
			               <label id="lblDaysDesk">0</label>
			               	日 </h3>
			           </div></td>
			        	</tr>
			          <tr>
			            <td class="col-md-3  ">
			              <div class="input-group date" id="dp1"> <span class="input-group-addon in border-radius"><span><img src="resources/images/calendar.png" alt=""></span></span>
			                <input name="trLeavingDate" type="text" class="datepicker form-control border-radius" id="txtStartDateDesk" value="${travelQuote.getTrLeavingDate()}" readonly>
			              </div>
			              </td>
			            <td class="col-md-3 ">
			              <div class="input-group date" id="dp2"> <span class="input-group-addon in border-radius"><span><img src="resources/images/calendar.png" alt=""></span></span>
			                <input name="trBackDate" type="text" class="datepicker form-control border-radius" id="txtEndDateDesk" value="${travelQuote.getTrBackDate()}" readonly>
			              </div>
			              </td>
			            <td class="col-md-3">
			              <div class="dropdown  form-group drop-down wh-bg input-group-div marg-b2 dropup" id="myFWDropdown">
			                
			                <a href="#" class="dropdown-toggle col-lg-12 col-md-12" data-toggle="dropdown"> <label id="lblCountDesk"></label> <i class="fa fa-caret-down pull-right"></i> </a>
			                <div class="dropdown-menu bdr1">
			                  <div class="drop-content">
			                    <div class="col-lg-6 col-md-6">
			                      <label class="radio radio-warning radio-inline">
			                        <input type="radio" name="planSelected" id="personal_plan_desk" data-id="desk" class="plan" value="personal"  <%=PersonalPlanChecked%> >
			                        <label for="personal_plan_desk"> 個人計劃</label></label>
			                    </div>
			                    <div class="col-lg-6 col-md-6">
			                      <label class="radio radio-warning radio-inline">
			                        <input type="radio" name="planSelected" id="family_plan_desk" data-id="desk" class="plan" value="family" <%=FamilyPlanChecked %>>
			                      <label for="family_plan_desk">  家庭計劃</label></label>
			                    </div>
			                    <div class="clearfix"></div>
			                    <hr>
			                    <!-- start of personal plan bottom spinner-->
			                 <input type="hidden" name="familyPlan" id="family_desk_count" value="">
			                 <div class="plan_spinner_desk" id="personal_plan_desk_spinner">
			                   <div class="col-lg-6">
			                     <h4>旅客</h4>
			                   </div>
			                   <div class="col-lg-6">
			                     <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
			                       <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtTravellersDesk" disabled="disabled" data-parent="personal"> <span class="glyphicon glyphicon-minus"></span> </button>
			                       </span>
<div class="text-center drop-down-plus wd4 input-number">${travelQuote.getTotalPersonalTraveller()}</div>
			                       <input type="hidden" name="totalPersonalTraveller" id="txtTravellersDesk" data-min="1" data-max="15" value="${travelQuote.getTotalPersonalTraveller()}"/>
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
			                     <h4>成人</h4>
			                   </div>
			                   <div class="col-lg-6">
			                     <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
			                       <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtAdultsDesk" disabled="disabled" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
			                       </span>
			                       <div class="text-center drop-down-plus wd4 input-number">1</div>
			                       <input type="hidden" name="totalAdultTraveller" id="txtAdultsDesk" data-min="1" data-max="2" value="1"/>
			                       <span class="input-group-btn data-up ">
			                       <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtAdultsDesk" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
			                       </span> </div>
			                   </div>
			                   <div class="clearfix"></div>
			                   <div class="col-lg-6">
			                     <h4>子女</h4>
			                   </div>
			                   <div class="col-lg-6">
			                     <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
			                       <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtChildDesk" disabled="disabled" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
			                       </span>
			                       <div class="text-center drop-down-plus wd4 input-number">1</div>
			                       <input type="hidden" name="totalChildTraveller" id="txtChildDesk" data-min="1" data-max="15" value="1"/>
			                       <span class="input-group-btn data-up ">
			                       <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtChildDesk" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
			                       </span> </div>
			                   </div>
			                   <div class="clearfix"></div>
			                   <div class="col-lg-6">
			                     <h4>其他旅客</h4>
			                   </div>
			                   <div class="col-lg-6">
			                     <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
			                       <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtOtherDesk" disabled="disabled" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
			                       </span>
			                       <div class="text-center drop-down-plus wd4 input-number">0</div>
			                       <input type="hidden" name="totalOtherTraveller" id="txtOtherDesk" data-min="0" data-max="15" value="0"/>
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
			         <td class="col-md-2 ">
			        	     <button type="submit" class="border-radius btn btn-primary get-btn wd2">立即報價</button>
			           <!-- 	<a href="flight-plan-cn.html" class="border-radius btn btn-primary  get-btn marg-t2" onclick="return flightValidateDeskTravel()">立即報價</a> -->
			        </td>
			       </tr>
			       <tr>
			       	<td><span id="startDateDeskIn" class="text-red"> </span></td>
			       	<td><span id="endDateDeskIn" class="text-red"> </span></td>
			       	<td><span id="travelCountDeskIn"  style="display:none">
			           <label class="text-red">请输入信息旅行者</label>
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
<form name="frmTravelGetQuote" id="frmTravelGetQuote" commandName="travelQuote" action="getTravelQuote" method="post" onsubmit="return flightValidateMobTravel();">
  <div class="form-container">
    <h2>立即取得TravelCare旅遊保險</h2>
    <h4>出發日期 </h4>
    <div class="form-group">
      <div class="input-group date" id="dp3"> <span class="input-group-addon in"><span><img src="resources/images/calendar.png" alt=""></span></span>
        <input name="trLeavingDate" type="text" class="datepicker form-control" id="txtStartDateMob" value="${travelQuote.getTrLeavingDate()}">
      </div>
    </div>
    <span id="startDateMobIn" style="color:red"> </span>
    <h4>回程日期</h4>
    <div class="form-group">
      <div class="input-group date" id="dp4"> <span class="input-group-addon in"><span><img src="resources/images/calendar.png" alt=""></span></span>
        <input name="trBackDate" type="text" class="datepicker form-control" id="txtEndDateMob" value="${travelQuote.getTrBackDate()}">
      </div>
    </div>
    <span id="endDateMobIn" style="color:red"> </span>
    <h4>同行人數</h4>
    <div class="dropdown  form-group drop-down" id="myFWDropdownMob">
      
      <a href="#" class="dropdown-toggle col-sm-12 col-xs-12" data-toggle="dropdown"> <label id="lblCountMob"></label> <i class="fa fa-caret-down pull-right"></i> </a>
      <div class="dropdown-menu bdr1 wd2">
        <div class="drop-content">
          <div class="col-xs-6 col-sm-6">
            <label class="radio radio-warning radio-inline">
             <input type="radio" name="plan_mob" id="personal_plan_mob"  data-id="mob" class="plan" value="personal" <%=PersonalPlanChecked%>>
          <label for="personal_plan_mob"> 個人計劃</label></label>
          </div>
          <div class="col-xs-6 col-sm-6">
            <label class="radio radio-warning radio-inline">
              <input type="radio"  name="plan_mob" id="family_plan_mob"  data-id="mob" class="plan" value="family" <%=FamilyPlanChecked %>>
             <label for="family_plan_mob">  家庭計劃</label> </label>
          </div>
          <div class="clearfix"></div>
          <hr>
          <!-- Start of personal plan mobile spinner-->
          <input type="hidden" name="" id="family_mob_count" value="">
          <div class="plan_spinner_mob" id="personal_plan_mob_spinner">

          <div class="col-xs-8 col-sm-8">
            <h4>旅客</h4>
          </div>
           <div class="col-xs-4 col-sm-4">
            <div class="input-group number-spinner none-bd "> 
              <span class="input-group-btn data-dwn">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="minus" data-field="txtTravellersMob" disabled="disabled" data-parent="personal">
                      <span class="glyphicon glyphicon-minus"></span>
                </button>
              </span>
              <div class="text-center drop-down-plus wd4 input-number">1</div>
              <input type="hidden" name="totalPersonalTraveller" id="txtTravellersMob" data-min="1" data-max="15" value="1"/>
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

           <div class="col-xs-8 col-sm-8">
            <h4>位成人</h4>
          </div>
           <div class="col-xs-4 col-sm-4">
            <div class="input-group number-spinner none-bd "> 
              <span class="input-group-btn data-dwn">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="minus" data-field="txtAdultsMob" disabled="disabled" data-parent="family">
                      <span class="glyphicon glyphicon-minus"></span>
                </button>
              </span>
              <div class="text-center drop-down-plus wd4 input-number">0</div>
              <input type="hidden" id="txtAdultsMob" data-min="0" data-max="15" value="0"/>
              <span class="input-group-btn data-up ">
                 <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtAdultsMob" data-parent="family">
                   <span class="glyphicon glyphicon-plus"></span>
                 </button>
              </span>
           </div>
          </div>
         <div class="clearfix"></div>

          <div class="col-xs-8 col-sm-8">
            <h4>位子女</h4>
          </div>
           <div class="col-xs-4 col-sm-4">
            <div class="input-group number-spinner none-bd "> 
              <span class="input-group-btn data-dwn">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="minus" data-field="txtChildMob" disabled="disabled" data-parent="family">
                      <span class="glyphicon glyphicon-minus"></span>
                </button>
              </span>              
              <div class="text-center drop-down-plus wd4 input-number">0</div>
              <input type="hidden" id="txtChildMob" data-min="0" data-max="15" value="0"/>
              <span class="input-group-btn data-up ">
                 <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtChildMob" data-parent="family">
                   <span class="glyphicon glyphicon-plus"></span>
                 </button>
              </span>
           </div>
          </div>
         <div class="clearfix"></div>

          <div class="col-xs-8 col-sm-8">
            <h4>Other</h4>
          </div>
           <div class="col-xs-4 col-sm-4">
            <div class="input-group number-spinner none-bd "> 
              <span class="input-group-btn data-dwn">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="minus" data-field="txtOtherMob" disabled="disabled" data-parent="family">
                      <span class="glyphicon glyphicon-minus"></span>
                </button>
              </span>
              <div class="text-center drop-down-plus wd4 input-number">0</div>
              <input type="hidden" id="txtOtherMob" data-min="0" data-max="15" value="0"/>
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
    <label class="text-red">请输入信息旅行者</label>
    </span> <br>
    <span id="travelCountMobIn" style="display:none">
    <label style="color:red">Traveller count which is blank</label>
    </span>
    <div id="divPersonsMob" style="visibility:hidden;"> <br>
      <small>
      <label id="lblPeopleMob">0</label>
      	人數 旅行
      <label id="lblDaysMob">0</label>
      	日 </small> <br>
    </div>
  </div>
  
  <div class="btn-box text-center">
    <h3 class="text-center"> 
  		<!-- <a href="#" class="border-radius get-btn" onclick="return flightValidateMobTravel()">立即申請免費保障! </a>  -->
  		<button type="submit" class="bdr-curve-none btn btn-primary btn-lg ">
             	立即申請免費保障! 
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
<h2 class="hidden-sm hidden-xs">出外旅遊，有可靠的旅遊保障是您的最佳後盾！</h2>
<!--end desktop--> 

<!--Mobile-->
<h2 class="hidden-lg hidden-md feature-ttl">
<br>
出外旅遊，有可靠的旅遊保障是您的最佳後盾</h2>
<!--end Mobile-->
</div>

<!--desktop Features-->
<div class="hidden-xs hidden-sm">
    <div class="col-lg-12 col-md-12 home-features pad-none"  >
    <div class="col-md-6 col-lg-6 text-center"> <img src="resources/images/home1.png" alt="" /> </div>
    <div class="col-md-6 col-lg-6">
      <div>
        <h2>敢想敢做，無牽無掛</h2>
        <p class="details-text">放膽玩，盡情跳！富衛旅遊保險承保您的活動，由夏日海灘散步到笨豬跳、水肺潛水、冬季運動等, 點玩都一樣放心。</p>
        <a href="" class="h4-4 scrollToTop">了解更多</a> </div>
    </div>
    <div class="clearfix"></div>
    <br>
    <div class="col-md-6 col-lg-6">
      <div>
        <h2>想去邊、幾時去，由您話事 </h2>
        <p class="details-text">從香港到泰國、英國、瓦努阿圖或其他地方，富衛旅遊保險為未滿85歲投保人仕提供全球保障！</p>
        <a href="" class="h4-4 scrollToTop">了解更多</a> </div>
    </div>
    <div class="col-md-6 col-lg-6 text-center">  <img src="resources/images/home2.png" alt=""  /> </div>
    <div class="clearfix"></div>
    <br>
    <div class="col-md-6 col-lg-6 text-center"> <img src="resources/images/home3.png" alt=""  /> </div>
    <div class="col-md-6 col-lg-6">
      <div>
        <h2>最佳支援，為您隨時候命</h2>
        <p class="details-text">若有不時之需，得到適切支援至為重要！富衛旅遊保險與全球領先的醫療、救援和安全服務公司國際SOS合作，在全球700多個地點提供24小時服務，確保您有需要時，我們都可以隨時為您解決燃眉之急。</p>
        <a href="#" class="h4-4 scrollToTop">了解更多</a> </div>
    </div>
    <div class="clearfix"></div>
  </div>
  
  <!--mobile Features--> 
  
  <!--/.row--> 
</div>

<!--mob Features-->
<div class="mob-features hidden-lg hidden-md">
  <div class="col-xs-4 col-sm-4 text-center"> <img class="img-responsive" src="resources/images/home1.png" alt=""  /> </div>
  <div class="col-xs-8 col-sm-8">
    <div>
      <h2 class="h2-3">敢想敢做，無牽無掛</h2>
      <p class="details-text">放膽玩，開心跳！OR有膽無膽，話跳就跳！OR想做就做，話跳就跳！OR想玩就玩，開心到彈起！富衛旅遊保險承保任何活動，由夏日海灘散步到冬季運動、笨豬跳、登山、攀岩、騎馬、乘坐熱氣球，點玩都一樣放心。詳情</p>
      <a href="" class="h4-4 scrollToTop">了解更多</a> </div>
  </div>
  <div class="clearfix"></div>
  <br>
  <div class="col-xs-4 col-sm-4 text-center"> <img class="img-responsive" src="resources/images/home2.png" alt=""  /> </div>
  <div class="col-xs-8 col-sm-8">
    <div>
      <h2 class="h2-3">想去邊、幾時去，由您話事</h2>
      <p class="details-text">從香港到泰國、英國、留尼旺島或其他地方，富衛旅遊保險為未滿85歲投保人仕提供全球保障！</p>
      <a href="" class="h4-4 scrollToTop">了解更多</a> </div>
  </div>
  <div class="clearfix"></div>
  <br>
  <div class="col-xs-4 col-sm-4 text-center"> <img class="img-responsive" src="resources/images/home3.png" alt=""  /> </div>
  <div class="col-xs-8 col-sm-8">
    <div>
      <h2 class="h2-3">最佳支援，為您隨時候命</h2>
      <p class="details-text">若有不時之需，得到適切支援至為重要！富衛旅遊保險與全球領先的醫療、救援和安全服務公司國際SOS合作，在全球700多個地點提供24小時服務，確保您有需要時，我們都可以隨時為您解決燃眉之急。</p>
      <a href="" class="h4-4 scrollToTop">了解更多</a> </div>
  </div>
  <div class="clearfix"></div>
</div>
<div class="other-benefits col-lg-12">
  <h3 class="h4-2">其他保障:</h3>
  <ul class="bullets">
    <li>
      <p class="h4-5">不用自陶腰包 – 提供全額保障,無需額外自負額*</p>
    </li>
    <li>
      <p class="h4-5">*承擔租車保險的自負額費用高達港幣5,000。</p>
    </li>
    <li>
      <p class="h4-5">個人意外保障高達港幣1,200,000。</p>
    </li>
	<li>
      <p class="h4-5">於Y5Buddy租用流動Wi-Fi數據機可享八五折優惠。</p>
    </li>
	<li>
      <p class="h4-5">每次成功推薦一位朋友購買富衛旅遊保險即享一次Agoda九五折優惠</p>
    </li>
  </ul>
  <div class="spacer3"></div>
  <p class="h4-6">以上資料只作參考用途。詳情請查看<a href="resources/policy-provisions-pdf/TravelCare_Provisions_Mar_2015.pdf" target="_blank">保單條款。</a></p>
  
  <p class="h4-6"> 有關條款細則的詳細資料，請聯絡您的理財顧問或致電我們的24小時熱線3123 3123與客戶服務主任聯絡。</p>
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
          <div class="recent-work-inner"> <img src="resources/images/time.png" alt=""  />
            <h1>常在您左右</h1>
              <p>富衛提供全天候24小時熱線支援，另設有5間分佈全港的客戶服務中心，加上富衛流動 <a href="http://www.fwd.com.hk/zh-HK/fwd-n-you/e_services_app.html" target="_blank" > 應用程式</a> ，隨時為您解答任何查詢。</p>

          </div>
        </div>
      </div>
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
        <div class="recent-work-wrap-mid wrap text-center">
          <div class="recent-work-inner"> <img src="resources/images/secure.png" alt=""  />
            <h1>安全，可靠</h1>
            <p>富衛香港的壽險及一般保險營運機構均獲國際評級機構授予卓越的財務實力評級 -- 其中獲「穆迪」 評為A3級 及「惠譽國際」評為A級。<br>
              <br>
            </p>
          </div>
        </div>
      </div>
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
        <div class="recent-work-wrap wrap text-center">
          <div class="recent-work-inner"> <img src="resources/images/rewards.png" alt=""  />
            <h1>賞您所想</h1>
            <p>富衛不斷為您提供各種獎賞及優惠，令您的保險計劃更吸引，例如將來的保費折扣及其他商户提供的優惠等。</p>
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
              <div class="recent-work-inner"> <img src="resources/images/time.png" alt=""  />
                <h2>賞您所想</h2>
                <p>富衛提供全天候24小時熱線支援，另設有5間分佈全港的客戶服務中心，加上富衛流動 <a href="http://www.fwd.com.hk/zh-HK/fwd-n-you/e_services_app.html" target="_blank" > 應用程式</a> ，隨時為您解答任何查詢。</p>
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
              <div class="recent-work-inner"> <img src="resources/images/$.png" alt=""  /> 
              <h2>安全，可靠</h2>
                <p>富衛香港的壽險及一般保險營運機構均獲國際評級機構授予卓越的財務實力評級 -- 其中獲「穆迪」 評為A3級 及「惠譽國際」評為A級。</p>
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
              <h2>賞您所想</h2>
                <p>富衛不斷為您提供各種獎賞及優惠，令您的保險計劃更吸引，例如將來的保費折扣及其他商户提供的優惠等。</p>
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
        <h2>顧客親身體驗</h2>
      </div>
      <div class="col-lg-5 col-md-5 pad-none pull-left">
        <div class="testimonials-wrap text-center">
          <div class="testimonials-inner text-center">
            <div class="h1-1"> <blockquote class="testimonial"></blockquote></div>
            <p>我選擇FWD旅遊保險因為佢地24小時都有人聽電話，最緊要係放工時間和身處外國都可以搵到人。</p>
            <div class="hr1"></div>
            <h2>楊先生</h2>
            <h4>(30歲)</h4>
          </div>
        </div>
      </div>
      <div class="col-lg-5 col-md-5 pad-none pull-right">
        <div class="testimonials-wrap text-center">
          <div class="testimonials-inner text-center">
            <div class="h1-1"> <blockquote class="testimonial"></blockquote></div>
            <p>我是一個背包客。富衛旅遊保及國際SOS緊急救援電話是我每次流浪時隨身必備的幫手 – 因為你永遠無法想像會在亞馬遜叢林遇上甚麼驚喜。</p>
            <div class="hr1"></div>
            <h2>龔先生 </h2>
            <h4>(26歲)</h4>
          </div>
        </div>
      </div>
      <br>
      <div class="clearfix"></div>
      <p class="pad-none p1"><br>
       以上意見及觀點純屬客戶意見，並不代表富衛人壽保險（百慕達）有限公司或其下公司（“富衛”）之意見。 富衛不需要承擔任何有關之責任及其準確性或完整性。 </p>
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
        <h2>顧客親身體驗</h2>
 </div>

    <div class="carousel-inner">
      <div class="item active">
        <div class="container">
          <div class="row slide-margin">
            <div class="testimonials-wrap text-center">
              <div class="testimonials-inner travel-testimonial text-center">
                <blockquote class="testimonial"></blockquote>
                <p>我選擇FWD旅遊保險因為佢地24小時都有人聽電話，最緊要係放工時間和身處外國都可以搵到人。</p>
                <div class="hr1"></div>
                <h2>楊先生</h2>
                <h4>楊先生(30歲)</h4>
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
                <p>我是一個背包客。富衛旅遊保及國際SOS緊急救援電話是我每次流浪時隨身必備的幫手 – 因為你永遠無法想像會在亞馬遜叢林遇上甚麼驚喜。</p>
                <div class="hr1"></div>
                <h2>龔先生</h2>
                <h4>龔先生 (26歲)</h4>
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
      <h2>閱讀更多</h2>
    </div>
    <div class="col-lg-12 pad-none">
      <div class="col-lg-4 col-md-4 pad-none">
        <div class="services-wrap service-bx1">
          <div> <a href="http://blog.fwd.com.hk/zh_HK/2015/03/17/7-musts-before-a-long-vacation/" target="_blank"><img class="bdr-img" src="resources/images/home4.png" alt=""></a>
            <h3> <a href="http://blog.fwd.com.hk/zh_HK/2015/03/17/7-musts-before-a-long-vacation/" target="_blank">放長假前必做七件事  <i class="fa fa-caret-right"></i> </a></h3>
         
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-4 pad-none">
        <div class="services-wrap service-bx2">
          <div> <a href="http://blog.fwd.com.hk/zh_HK/2015/03/17/staying-connected-while-travelling-abroad/" target="_blank"><img class="bdr-img" src="resources/images/home5.png" alt=""></a>
            <h3><a href="http://blog.fwd.com.hk/zh_HK/2015/03/17/staying-connected-while-travelling-abroad/" target="_blank"> 外出旅遊，連繫無間  <i class="fa fa-caret-right"></i> </a></h3>
         
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-4 pad-none">
        <div class="services-wrap service-bx3">
          <div> <a href="http://blog.fwd.com.hk/zh_HK/2015/03/19/tips-for-traveling-with-children-2/" target="_blank"><img class="bdr-img" src="resources/images/home6.png" alt=""></a>
            <h3> <a href="http://blog.fwd.com.hk/zh_HK/2015/03/19/tips-for-traveling-with-children-2/" target="_blank">親子旅行小貼士  <i class="fa fa-caret-right"></i> </a></h3>
           
          </div>
        </div>
      </div>
    </div>
    <!--/.row--> 
     <p>博客資料謹供參考，富衛人壽保險(百慕達)有限公司及其聯繫公司 (“富衛”)雖然已盡力確保所載的資料正確無誤，但富衛並不就資料的準確性或完整性作出任何保證或陳述。富衛將不會因無法或不能使用任何資料或任何此博客所載之資料的錯誤或遺漏而負上任何直接、附帶、後果性、間接或懲罰性的損失的責任，使用者應自行小心評估資料。</p>
    
   
   
  </div>
  <!--/.container--> 
</section>
<!--/#services-->

<section id="bottom-form" class="hidden-sm hidden-xs">
  <div class="container">
    <div class="row">
    <form name="frmTravelGetQuote" id="frmTravelGetQuote" commandName="travelQuote" action="getTravelQuote" method="post" onsubmit="return flightValidateBtmTravel();">
      <div class="col-lg-12 col-md-12 pad-none">
        <h2>立即申請富衛旅遊保險</h2>
        <table class="table activation-form3">
          <tbody>
          <tr>
          	<td><h3>出發日期</h3></td>
          	<td><h3>回程日期</h3></td>
          	<td><h3>同行人數</h3></td>
          	<td><div id="divPersonsBtm" style="visibility:hidden;">
                  <h3 class="h3-i">
                    <label id="lblPeopleBtm">0</label>
                                                人數 <br>
                                                旅行
                    <label id="lblDaysBtm">0</label>

                    	日 </h3>
                </div>
             </td>
          </tr>
            <tr>
              <td class="col-md-3  ">
                <div class="input-group date" id="dp5"> <span class="input-group-addon in border-radius"><span><img src="resources/images/calendar.png" alt=""></span></span>
                  <input type="text" name="trLeavingDate"  class="datepicker form-control border-radius" id="txtStartDateBtm" value="${travelQuote.getTrLeavingDate()}" readonly>
                </div>
                </td>
              <td class="col-md-3 ">
                <div class="input-group date" id="dp6"> <span class="input-group-addon in border-radius"><span><img src="resources/images/calendar.png" alt=""></span></span>
                  <input type="text" name="trBackDate" class="datepicker form-control border-radius" id="txtEndDateBtm" value="${travelQuote.getTrBackDate()}" readonly>
                </div>
                </td>
              <td class="col-md-3 ">
                <div class="dropdown  form-group drop-down wh-bg input-group-div marg-b2 dropup" id="myFWDropdownBtm">
                 
                  <a href="#" class="dropdown-toggle col-lg-12 col-md-12" data-toggle="dropdown">  <label id="lblCountBtm"></label> <i class="fa fa-caret-down pull-right"></i> </a>
                  <div class="dropdown-menu bdr1">
                    <div class="drop-content">
                      <div class="col-lg-6">
                         <label class="radio radio-warning radio-inline">
                          <input type="radio" name="planSelected" id="personal_plan_btm" data-id="btm" class="plan" value="personal"  <%=PersonalPlanChecked%> > <label for="personal_plan_btm"> 個人計劃  </label></label>


                      </div>
                      <div class="col-lg-6">
                          <label class="radio radio-warning radio-inline">
                          <input type="radio" name="planSelected" id="family_plan_btm" data-id="btm" class="plan" value="family" <%=FamilyPlanChecked %>> <label for="family_plan_btm"> 家庭計劃 </label></label>


                      </div>
                      <div class="clearfix"></div>
                      <hr>
                      <!-- start of personal plan bottom spinner-->
                      <input type="hidden" name="" id="family_btm_count" value="">
                      <div class="plan_spinner_btm" id="personal_plan_btm_spinner">
                        <div class="col-lg-6">
                          <h4>旅客</h4>

                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtTravellersBtm" disabled="disabled" data-parent="personal"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <div class="text-center drop-down-plus wd4 input-number">${travelQuote.getTotalPersonalTraveller()}</div>
                            <input type="hidden" name="totalPersonalTraveller" id="txtTravellersBtm" data-min="1" data-max="15" value="${travelQuote.getTotalPersonalTraveller()}"/>
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
                          <h4>成人</h4>

                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtAdultsBtm" disabled="disabled" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <div class="text-center drop-down-plus wd4 input-number">1</div>
                            <input type="hidden" name="totalAdultTraveller" id="txtAdultsBtm" data-min="1" data-max="2" value="1"/>
                            <span class="input-group-btn data-up ">
                            <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtAdultsBtm" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                            </span> </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-lg-6">
                          <h4>子女</h4>

                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtChildBtm" disabled="disabled" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <div class="text-center drop-down-plus wd4 input-number">1</div>
                            <input type="hidden" name="totalChildTraveller" id="txtChildBtm" data-min="1" data-max="15" value="1"/>
                            <span class="input-group-btn data-up ">
                            <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtChildBtm" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                            </span> </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-lg-6">
                          <h4>其他旅客</h4>

                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtOtherBtm" disabled="disabled" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <div class="text-center drop-down-plus wd4 input-number">0</div>
                            <input type="hidden" name="totalOtherTraveller" id="txtOtherBtm" data-min="0" data-max="15" value="0"/>
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
                  <button type="submit" class="border-radius btn btn-primary get-btn  wd2">立即報價</button>
                 </td>
            </tr>
            <tr>
	          	<td><span id="startDateBtmIn" style="color:red"> </span></td>
	          	<td><span id="endDateBtmIn" style="color:red"> </span></td>
	          	<td><span id="travelCountBtmIn" style="display: none;">
                <label class="text-red">請輸入信息旅行者</label>
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