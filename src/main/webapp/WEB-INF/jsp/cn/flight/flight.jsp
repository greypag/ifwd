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
			      <h2>立即申請富衛航空意外保險</h2>
			      <table class="table activation-form3 hor-padding">
			        <tbody>
			        	<tr>
			        		<td><h3>出發日期</h3></td>
			        		<td><h3>回程日期</h3></td>
			        		<td><h3>同行人數</h3></td>
			        		<td><div id="divPersonsDesk" style="visibility:hidden;">
			             <h3 class="h3-i">
			               <label id="lblPeopleDesk">0</label>
			               people <br>
			               travelling
			               <label id="lblDaysDesk">0</label>
			               days </h3>
			           </div></td>
			        	</tr>
			          <tr>
			            <td class="col-md-3  ">
			              <div class="input-group date" id="dp1"> <span class="input-group-addon in border-radius"><span><img src="resources/images/calendar.png" alt=""></span></span>
			                <input name="departureDate" type="text" class="datepicker form-control border-radius" id="txtStartDateDesk">
			              </div>
			              </td>
			            <td class="col-md-3 ">
			              <div class="input-group date" id="dp2"> <span class="input-group-addon in border-radius"><span><img src="resources/images/calendar.png" alt=""></span></span>
			                <input name="returnDate" type="text" class="datepicker form-control border-radius" id="txtEndDateDesk">
			              </div>
			              </td>
			            <td class="col-md-3">
			              <div class="dropdown  form-group drop-down wh-bg input-group-div marg-b2 dropup" id="myFWDropdown">
			                
			                <a href="#" class="dropdown-toggle col-lg-12 col-md-12" data-toggle="dropdown"> <label id="lblCountDesk"></label> <i class="fa fa-caret-down pull-right"></i> </a>
			                <div class="dropdown-menu bdr1">
			                  <div class="drop-content">
			                    <div class="col-lg-6">
			                      <label class="radio radio-warning radio-inline">
			                        <input type="radio" name="planSelected" id="personal_plan_desk" data-id="desk" class="plan" value="personal"  checked="" >
			                        <label for="personal_plan_desk"> 個人計劃</label></label>
			                    </div>
			                    <div class="col-lg-6">
			                      <label class="radio radio-warning radio-inline">
			                        <input type="radio" name="planSelected" id="family_plan_desk" data-id="desk" class="plan" value="family" >
			                      <label for="family_plan_desk">  家庭計劃</label></label>
			                    </div>
			                    <div class="clearfix"></div>
			                    <hr>
			                    <!-- start of personal plan bottom spinner-->
			                 <input type="hidden" name="" id="family_desk_count" value="">
			                 <div class="plan_spinner_desk" id="personal_plan_desk_spinner">
			                   <div class="col-lg-6">
			                     <h4>旅客</h4>
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
			                       <input type="text" class="form-control text-center drop-down-plus wd4 input-number" value="1" data-min="1" data-max="2" name="totalAdultTraveller" id="txtAdultsDesk" readonly>
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
			                       <input type="text" class="form-control text-center drop-down-plus wd4 input-number" value="0" data-min="0" name="totalChildTraveller" data-max="14" id="txtChildDesk" readonly>
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
			                       <input type="text" name="totalOtherTraveller" class="form-control text-center drop-down-plus wd4 input-number" value="0" data-min="0" data-max="14" name="totalOtherTraveller" id="txtOtherDesk" readonly>
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
			        	   <button type="submit" class="border-radius btn btn-primary  get-btn" >立即申請免費保障!</button>
			           <!-- 	<a href="flight-plan-cn.html" class="border-radius btn btn-primary  get-btn marg-t2" onclick="return flightValidateDeskTravel()">立即申請免費保障!</a> -->
			        </td>
			       </tr>
			     		<tr>
			     			<td><span id="startDateDeskIn" class="text-red"> </span></td>
			     			<td><span id="endDateDeskIn" class="text-red"> </span></td>
			     			<td><span id="travelCountDeskIn"  style="display:none">
			           <label class="text-red">請輸入信息旅行者</label>
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
    <h2>立即申請富衛航空意外保險</h2>
    <h4>出發日期 </h4>


    <div class="form-group">
      <div class="input-group date" id="dp3"> <span class="input-group-addon in"><span><img src="resources/images/calendar.png" alt=""></span></span>
        <input type="text" name="departureDate" class="datepicker form-control" id="txtStartDateMob">
      </div>
    </div>
   <span id="startDateMobIn" class="text-red"> </span>
    <h4>回程日期</h4>

    <div class="form-group">
      <div class="input-group date" id="dp4"> <span class="input-group-addon in"><span><img src="resources/images/calendar.png" alt=""></span></span>
        <input type="text" name="returnDate" class="datepicker form-control" id="txtEndDateMob">
      </div>
    </div>
   <span id="endDateMobIn" class="text-red"> </span>
    <h4>同行人數</h4>

    <div class="dropdown  form-group drop-down dropup" id="myFWDropdownMob">
     
      <a href="#" class="dropdown-toggle col-sm-12 col-xs-12" data-toggle="dropdown"> <label id="lblCountMob"></label>  <i class="fa fa-caret-down pull-right"></i> </a>
      <div class="dropdown-menu bdr1 wd2">
        <div class="drop-content">
          <div class="col-xs-6 col-sm-6">
            <label class="radio radio-warning radio-inline">
              <input type="radio" name="planSelected" id="personal_plan_mob"  data-id="mob" class="plan" value="personal" checked=""> <label for="personal_plan_mob">個人計劃  </label></label>


          </div>
          <div class="col-xs-6 col-sm-6">
           <label class="radio radio-warning radio-inline">
              <input type="radio"  name="planSelected" id="family_plan_mob"  data-id="mob" class="plan" value="family" >
            <label for="family_plan_mob"> 家庭計劃 </label></label>

          </div>
          <div class="clearfix"></div>
          <hr>
          <!-- Start of personal plan mobile spinner-->
          <input type="hidden" name="" id="family_mob_count" value="">
          <div class="plan_spinner_mob" id="personal_plan_mob_spinner">
            <div class="col-xs-6 col-sm-6">
              <h4>旅客</h4>

            </div>
            <div class="col-xs-6 col-sm-6">
              <div class="input-group number-spinner none-bd "> <span class="input-group-btn data-dwn">
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
              <h4>成人</h4>
            </div>
            <div class="col-xs-6 col-sm-6">
              <div class="input-group number-spinner none-bd "> <span class="input-group-btn data-dwn">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="minus" data-field="txtAdultsMob" disabled="disabled" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                </span>
                <input type="text" name="totalAdultTraveller" class="form-control text-center drop-down-plus input-number" value="1" data-min="1" data-max="2" id="txtAdultsMob" readonly />
                <span class="input-group-btn data-up ">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtAdultsMob" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                </span> </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-xs-6 col-sm-6">
              <h4>子女</h4>
            </div>
            <div class="col-xs-6 col-sm-6">
              <div class="input-group number-spinner none-bd "> <span class="input-group-btn data-dwn">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="minus" data-field="txtChildMob" disabled="disabled" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                </span>
                <input type="text" name="totalChildTraveller" class="form-control text-center drop-down-plus input-number" value="0" data-min="0" data-max="14" id="txtChildMob"  readonly=""/>
                <span class="input-group-btn data-up ">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtChildMob" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                </span> </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-xs-6 col-sm-6">
              <h4>其他旅客</h4>
            </div>
            <div class="col-xs-6 col-sm-6">
              <div class="input-group number-spinner none-bd "> <span class="input-group-btn data-dwn">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="minus" data-field="txtOtherMob" disabled="disabled" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                </span>
                <input type="text" name="totalOtherTraveller" class="form-control text-center drop-down-plus input-number" value="0" data-min="0" data-max="14" id="txtOtherMob" readonly/>
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
    <label class="text-red">請輸入信息旅行者</label>
    </span>
    <div id="divPersonsMob" style="visibility:hidden;"> <br>
      <small>
      <label id="lblPeopleMob">0</label>
      people travelling
      <label id="lblDaysMob">0</label>
      days </small> <br>
    </div>
  </div>
  <div class="btn-box text-center">
    <h3 class="text-center"> 
      <button type="submit" class="bdr-curve-none btn btn-primary btn-lg " >立即申請免費保障!</button>
      
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
      <h2 class="hidden-sm hidden-xs">享受由香港出發來回及中轉航班<br>的航空意外保險，費用全免！</h2>


      <!--end-desktop--> 
      
      <!--Mobile-->
      <h2 class="hidden-lg hidden-md feature-ttl"><br>享受由香港出發來回及中轉航班的航空意外保險，費用全免！</h2>


      <!--end Mobile--> 
    </div>
    
    <!--desktop-Features-->
    <div class="hidden-xs hidden-sm">
       <div class="col-lg-12 col-md-12 home-features pad-none"  >
        <div class="col-md-6 col-lg-6 text-center"> <img src="resources/images/home-flight1.png" alt=""  /> </div>
        <div class="col-md-6 col-lg-6">
          <div class="content">
            <h2>零保費，全面安心</h2>
            <p class="h4-3">假如您在航程中不幸意外身亡，我們將為您的摯親免費提供港幣$500,000體恤金。能夠讓家人有此穩靠保障，四圍飛都無後顧之憂。</p>



            <a href="" class="h4-4 scrollToTop">了解更多</a> </div>
        </div>
        <div class="clearfix"></div>
        <br>
        <div class="col-md-6 col-lg-6">
          <div class="content">
            <h2>一、二、飛！就係咁簡單！</h2>
            <p class="h4-3">投保申請非常簡單，您只需要通知我們幾時出發就大功告成。而且富衛深信旅遊要即興才好玩，所以就算去到登機前一刻先申請都無問題！</p>



            <a href="" class="h4-4 scrollToTop">了解更多</a> </div>
        </div>
        <div class="col-md-6 col-lg-6 text-center">  <img src="resources/images/home-flight2.png" alt=""  /> </div>
        <div class="clearfix"></div>
        <br>
        <div class="col-md-6 col-lg-6 text-center">  <img src="resources/images/home-flight3.png" alt=""  /> </div>
        <div class="col-md-6 col-lg-6">
          <div class="content">
            <h2>瞬間提升保險組合</h2>
            <p class="h4-3">富衛的航空意外保與您現有的任何旅遊保險計劃都同樣匹配！不論您已購買旅遊保險與否，亦可免費申請從而獲得額外保障！</p>


            <a href="" class="h4-4 scrollToTop">了解更多</a> </div>
        </div>
        <div class="clearfix"></div>
        <div class="other-benefits col-lg-12">
          <h3 class="h4-2">主要條款及細則：</h3>

         <ul class="bullets">
            <li>
              <p class="h4-5"> 只適用於受保人以付款乘客身份乘坐任何公共航空交通工具期間因遭受意外而死亡的情況，並不包括承包，特許或私人營運商，以及主要向乘客提供觀光服務及消閒娛樂的營運商。</p>

            </li>
            <li>
              <p class="h4-5"> 受保的行程須由香港出發，並以香港為回程終點。</p>

            </li>
            <li>
              <p class="h4-5"> 行程中的航班數目並沒有限制。</p>

            </li>
            <li>
              <p class="h4-5"> 保險期可長達連續30天。</p>

            </li>
            <li>
              <p class="h4-5"> 受保的旅程須於投保申請日之30天內出發。</p>

            </li>
            <li>
              <p class="h4-5"> 不適用於機組人員、任何營運商、導遊、領隊或軍事行動。</p>

            </li>
          </ul>
          <div class="spacer3"></div>
          <p class="h4-6">以上資料只作參考用途。詳情請查看 <a href="resources/policy-provisions-pdf/FlightCare_Provisions_Mar_2015.pdf" target="_blank" class="sub-link-underline">保單條款 </a>。有關條款細則的詳細資料,請聯絡您的理財顧問或致電我們的24小時熱線3123 3123與客戶服務主任聯絡。</p>

        </div>
      </div>
    </div>
    
    <!--mobile-Features-->
    <div class="hidden-lg hidden-md mob-features">
      <div class="col-xs-4 col-sm-4 text-center"> <img class="img-responsive" src="resources/images/home-flight1.png" alt=""  /> </div>
      <div class="col-xs-8 col-sm-8">
        <div>
          <h2 class="h2-3">零保費，全面安心</h2>
          <p class="h4-3">假如您在航程中不幸意外身亡，我們將為您的摯親免費提供港幣$500,000體恤金。能夠讓家人有此穩靠保障，四圍飛都無後顧之憂。</p>


          <a href="" class="h4-4 scrollToTop">了解更多</a> </div>
      </div>
      <div class="clearfix"></div>
      <br>
      <div class="col-xs-4 col-sm-4 text-center"> <img class="img-responsive" src="resources/images/home-flight2.png" alt=""  /> </div>
      <div class="col-xs-8 col-sm-8">
        <div>
          <h2 class="h2-3">一、二、飛！就係咁簡單！</h2>
          <p class="h4-3">投保申請非常簡單，您只需要通知我們幾時出發就大功告成。而且富衛深信旅遊要即興才好玩，所以就算去到登機前一刻先申請都無問題！</p>


          <a href="" class="h4-4 scrollToTop">了解更多</a> </div>
      </div>
      <div class="clearfix"></div>
      <br>
      <div class="col-xs-4 col-sm-4 text-center"> <img class="img-responsive" src="resources/images/home-flight3.png" alt=""  /> </div>
      <div class="col-xs-8 col-sm-8">
        <div>
          <h2 class="h2-3">瞬間提升保險組合</h2>
          <p class="h4-3">富衛的航空意外保與您現有的任何旅遊保險計劃都同樣匹配！不論您已購買旅遊保險與否，亦可免費申請從而獲得額外保障！</p>


          <a href="" class="h4-4 scrollToTop">了解更多</a> </div>
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
            <h1>常在您左右</h1>
            <p>富衛提供全天候24小時熱線支援，另設有5間分佈全港的客戶服務中心，加上富衛流動  <a href="http://www.fwd.com.hk/zh-HK/fwd-n-you/e_services_app.html" target="_blank">應用程式</a>，隨時為您解答任何查詢。</p>



          </div>
        </div>
      </div>
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
        <div class="recent-work-wrap-mid wrap  text-center">
          <div class="recent-work-inner"> <img src="resources/images/secure.png" alt=""  />
            <h1>安全，可靠</h1>
            <p>富衛香港的壽險及一般保險營運機構均獲國際評級機構授予卓越的財務實力評級 -- 其中獲「穆迪」 評為A3級 及「惠譽國際」評為A級。<br>



              <br>
            </p>
          </div>
        </div>
      </div>
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
        <div class="recent-work-wrap wrap  text-center">
          <div class="recent-work-inner"> <img src="resources/images/rewards.png" alt=""  />
            <h1>賞您所想</h1>
            <p>富衛不斷為您提供各種獎賞及優惠，令您的保險計劃更吸引，例如將來的保費折扣及其他商户提供的優惠等。</p>
            




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
                <h2>常在您左右</h2>
                <p>富衛提供全天候24小時熱線支援，另設有5間分佈全港的客戶服務中心，加上富衛流動 <a href="http://www.fwd.com.hk/zh-HK/fwd-n-you/e_services_app.html" target="_blank">應用程式</a>，隨時為您解答任何查詢。</p>


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
    <!--/.carousel inner--> 
  </div>
  <!--/.carousel--> 
  <a class="prev" href="#recent-works-mob" data-slide="prev"> <i class="fa fa-chevron-left"></i> </a> <a class="next" href="#recent-works-mob" data-slide="next"> <i class="fa fa-chevron-right"></i> </a> </section>
<section class="blog-item hidden-sm hidden-xs">
  <div class="container">

    <div class="center">
      <h2>閱讀更多</h2>

    </div>
    <div class="col-lg-12 pad-none">
      <div class="col-lg-4 col-md-4 pad-none">
        <div class="services-wrap service-bx1">
          <div> <a href="http://blog.fwd.com.hk/zh_HK/2015/03/17/7-musts-before-a-long-vacation/" target="_blank"><img class="bdr-img" src="resources/images/home4.png" alt=""></a>
            <h3> <a href="http://blog.fwd.com.hk/zh_HK/2015/03/17/7-musts-before-a-long-vacation/" target="_blank"> 放長假前必做六件事  <i class="fa fa-caret-right"></i> </a></h3>
         
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
    <form name="freeFlight" method="post" onsubmit="return flightValidateBtm()" action="getFlightDate">
      <div class="col-lg-12 col-md-12 pad-none slide-form">
        <h2>立即申請富衛航空意外保險</h2>
         

        <table class="table activation-form3 hor-padding">
          <tbody>
          	<tr>
          		<td><h3>出發日期</h3></td>
          		<td><h3>回程日期</h3></td>
          		<td><h3>同行人數</h3></td>
          		<td>
          			<div id="divPersonsBtm" style="visibility:hidden;">
	                  <h3 class="h3-i">
	                    <label id="lblPeopleBtm">0</label>
	                    people <br>
	                    travelling
	                    <label id="lblDaysBtm">0</label>
	
	                    days </h3>
	                </div>
          		</td>
          	</tr>
            <tr>
              <td class="col-md-3  ">
                <div class="input-group date" id="dp5"> <span class="input-group-addon in border-radius"><span><img src="resources/images/calendar.png" alt=""></span></span>
                  <input type="text" name="departureDate"  class="datepicker form-control border-radius" id="txtStartDateBtm">
                </div>
               </td>
              <td class="col-md-3 ">
                <div class="input-group date" id="dp6"> <span class="input-group-addon in border-radius"><span><img src="resources/images/calendar.png" alt=""></span></span>
                  <input type="text" name="returnDate" class="datepicker form-control border-radius" id="txtEndDateBtm">
                </div>
              </td>
              <td class="col-md-3 ">
                <div class="dropdown  form-group drop-down wh-bg input-group-div marg-b2 dropup" id="myFWDropdownBtm">
                 
                  <a href="#" class="dropdown-toggle col-lg-12 col-md-12" data-toggle="dropdown">  <label id="lblCountBtm"></label> <i class="fa fa-caret-down pull-right"></i> </a>
                  <div class="dropdown-menu bdr1">
                    <div class="drop-content">
                      <div class="col-lg-6">
                         <label class="radio radio-warning radio-inline">
                          <input type="radio" name="planSelected" id="personal_plan_btm" data-id="btm" class="plan" value="personal"  checked="" > <label for="personal_plan_btm"> 個人計劃  </label></label>


                      </div>
                      <div class="col-lg-6">
                          <label class="radio radio-warning radio-inline">
                          <input type="radio" name="planSelected" id="family_plan_btm" data-id="btm" class="plan" value="family" > <label for="family_plan_btm"> 家庭計劃 </label></label>


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
                          <h4>成人</h4>

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
                          <h4>子女</h4>

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
                          <h4>其他旅客</h4>

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
                

              <td class="col-md-2 ">
                <button type="submit" class="border-radius btn btn-primary  get-btn">
                立即申請免費保障!
                </button>
                 </td>
            </tr>
            <tr>
            	<td><span id="startDateBtmIn" class="text-red"> </span></td>
            	<td><span id="endDateBtmIn" class="text-red"> </span></td>
            	<td><span id="travelCountBtmIn" style="display:none ;">
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


       
       
       