<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ifwd.fwdhk.model.PlanDetails"%>
<%@page import="com.ifwd.fwdhk.model.FlightQuoteDetails"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--/#main-Content-->

<section>
 <div id="cn" class="container">
    <div class="row">
      <form  action="flight-plan-details" method="post">
       <input type="hidden" name="totalAdultTraveller" id="totalAdultTraveller" value="${planDetails.getTotalAdultTraveller()}">
       <input type="hidden" name="totalChildTraveller" id="totalChildTraveller" value="${planDetails.getTotalChildTraveller()}">
       <input type="hidden" name="totalOtherTraveller" id="totalOtherTraveller" value="${planDetails.getTotalOtherTraveller()}">
       <input type="hidden" name="returnDate" id="returnDate" value="${planDetails.getReturnDate()}">
       <input type="hidden" name="departureDate" id="departureDate" value="${planDetails.getDepartureDate()}">
       <input type="hidden" name="days" value="${days}">
       <input type="hidden" name="travellerCount" value="${planDetails.getTravellerCount()}">
       <input type="hidden" name="ToalDue" value="${flightQuoteDetails.getToalDue()}">
        <input type="hidden" name="planSelected" value="${planDetails.getPlanSelected()}">
        <ol class="breadcrumb pad-none">
          <li><a href="#">主頁</a> <i class="fa fa-caret-right"></i></li>
          <li><a href="#">航空保險 </a > </li>
          <li class="active "><i class="fa fa-caret-right"></i> 您的選擇 </li>
        </ol>
        <div class="container ">
          <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12  shop-tracking-status">
            <div class="center wow fadeInDown animated" style="visibility: visible;">
              <h2>您的選擇</h2>
            </div>
            <br>
            <br>
            <div class="order-status">
              <div class="order-status-timeline-new">
								<!--
								There can be n '.order-status-timeline-completion'
								dots-inactive and dots-active color the dots -->
								<div class="order-status-timeline-completion dots-inactive"></div>
								<div class="order-status-timeline-completion dots-inactive"></div>
								
							</div>
              <div class="image-order-status image-order-status-new active  img-circle">
                <div class="icon">1</div>
                <span class="status">您的選擇</span> </div>
              <div class="image-order-status image-order-status-active disabled  img-circle">
                <div class="icon">2</div>
                <span class="status"> 個人資料</span> </div>
              <div class="image-order-status image-order-status-intransit disabled  img-circle">
                <div class="icon">3</div>
                <span class="status min-left">確認保單</span> </div>
            </div>
          </div>
        </div>
        <br>
        <br>
        <br>
        <div class="container pad-none bdr ur-opt-content">
          <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
            <h2 class="h2-3-choose hidden-sm hidden-xs"> 您的選擇</h2>
            <%
            
            try {
        		PlanDetails planDetails = (PlanDetails)request.getAttribute("planDetails"); 
            	if(planDetails.getPlanSelected().equalsIgnoreCase("personal"))
            	{
            		planDetails.setTotalAdultTraveller(0);
            		planDetails.setTotalChildTraveller(0);
	    			planDetails.setTotalOtherTraveller(0);
	    			System.out.println("rest to 0");
	    		}
            } catch (Exception e) {
            	e.printStackTrace();
            }
           
            	for(int planCount=1;planCount<=1;planCount++)
            	{
            %>
            <div class="plan-box plan-box-flight">
              <div class="col-lg-9 col-md-9 col-sm-6">
                <h2>航空意外保險<br>
                免費 <br>
                 <span>只適用於優惠期內</span></h2>
            
              </div>
              <div class="col-lg-3 col-md-3 col-sm-4 col-xs-4"> <br>
                <div class="h4"><!-- 港幣 --><br>
                  <div class="flightcare-hk"> <%--  ${flightQuoteDetails.getToalDue()} --%> </div>
                </div>
              </div>
              <div class="clearfix"></div>
              <div>
              </div>
            </div>
            
            
               <!--Full coverage -->
              <div class="fwdpanel">
              <div class="fwdpanel-heading">
                <h4 class="fwdpanel-title h4-4-full">
	 <%} %>
                  <span><a href="#" class="fwdpanel-minimize"><i class="fa fa-plus"></i> 更多保障詳情 </a> </span>
                </h4>
              </div>
              <div class="fwdpanel-body" style="display: none;">
                <div class="row">
	                  <div class="col-md-12">
			             <h4 class="h4-3-b">產品特點:</h4> 
			            <ol class="major-exc">
			                <li>提供500,000 港元之人身意外死亡保障。</li>
			                <li>航空意外保險之每人最高賠償額為500,000 港元。</li>
			                <li>可配合其他旅遊保險。</li>
			             </ol>        
			                <br>
			                <h4 class="h4-3-b">受保資格:</h4> 
			               <ul class="major-exc">
			                <li>只適用於香港身份證持有人。</li>
			                <li>受保人須為年滿6星期至85歲的人仕。</li>
			               </ul>        
	                  </div>
	                  <!-- / col-md-12 -->
                </div>
                <!-- /row -->
              </div>
              
           <!--   <h4 class="h4-4"><a href="">Download Brochure</a></h4>-->
              </div>
             <!--Full coverage end -->
             <h4 class="h4-3-b">主要條款及細則：</h4>
              <ol class="major-exc">
                <li>只適用於受保人以付款乘客身份乘坐任何公共航空交通工具期間因遭受意外而死亡的情況，並不包括承包，特許或私人營運商，以及主要向乘客提供觀光服務及消閒娛樂的營運商。</li>
                <li>受保的行程須由香港出發，並以香港為回程終點。</li>
                <li>行程中的航班數目並沒有限制。</li>
                <li>保險期可長達連續30天。</li>
                <li>受保的旅程須於投保申請日之30天內出發。</li>
                <li>不適用於機組人員、任何營運商、導遊、領隊或軍事行動。</li>
              </ol>
              
          </div>
          <div class="col-lg-5 col-md-5 gray-bg pad-none hidden-sm hidden-xs" >
            <div class="wd2">
              <div class="pull-left">
                <h2 class="h2-3-choose">航空意外保險</h2>
                <h4>計劃概覽</h4>
              </div>
              <div class="pull-right">
                <div class="text-left pad-right1 h2-2 h2">
                  <div class="hk"><!-- 港幣 -->
                    <div class="flightcare-hk"><%-- ${flightQuoteDetails.getToalDue()} --%></div>
                  </div>
                </div>
              </div>
            </div>
            <div class="clearfix"></div>
            <div class="orange-bdr"></div>
            <div class="form-container">
              <h3>出發日期</h3>
              <div class="form-group">
                <div class="input-group wd2">
                  <input type="text" class="datepicker form-control bcg-trans"  value='<c:out value="${planDetails.getDepartureDate()}"/>' readonly>
                </div>
              </div>
              <h3>回程日期</h3>
              <div class="form-group">
                <div class="input-group wd2">
                  <input type="text" class="datepicker form-control bcg-trans" value="<c:out value="${planDetails.getReturnDate()}"/>" readonly>
                </div>
              </div>
              <h3>同行人數</h3>
              <div class="form-group likeDatePicker bcg-trans">
                <!-- <input type="text" class="form-control placeholder-fl" value="2位成人, 1位子女" readonly> -->
             <!--  <input type="text" class="form-control placeholder-fl" value="<c:if test="${planDetails.getTotalAdultTraveller() !=0 }">父母 :${planDetails.getTotalAdultTraveller()} </c:if> <c:if test="${planDetails.getTotalChildTraveller() !=0 }">孩子 :${planDetails.getTotalChildTraveller()}</c:if> <c:if test="${planDetails.getTotalOtherTraveller() !=0}">其他 :${planDetails.getTotalOtherTraveller()}</c:if> <c:if test="${planDetails.getTravellerCount() !=0}">旅客  :${planDetails.getTravellerCount()}</c:if>" readonly>  --> 
              <!-- <input type="text" class="form-control placeholder-fl" value="
              <c:if test="${planDetails.getTotalAdultTraveller() !=0 }">父母: ${planDetails.getTotalAdultTraveller()} <br></c:if> 
              <c:if test="${planDetails.getTotalChildTraveller() !=0 }">孩子: ${planDetails.getTotalChildTraveller()} <br></c:if> 
              <c:if test="${planDetails.getTotalOtherTraveller() !=0}">其他: ${planDetails.getTotalOtherTraveller()} <br></c:if> 
              <c:if test="${planDetails.getTravellerCount() !=0}">旅客: ${planDetails.getTravellerCount()}</c:if>" readonly>  -->
                <div class="input-group wd2 datepicker form-control"> 
                  <c:if test="${planDetails.getTotalAdultTraveller() !=0 }">父母: ${planDetails.getTotalAdultTraveller()} <br></c:if> 
                  <c:if test="${planDetails.getTotalChildTraveller() !=0 }">孩子: ${planDetails.getTotalChildTraveller()} <br></c:if> 
                  <c:if test="${planDetails.getTotalOtherTraveller() !=0}">其他: ${planDetails.getTotalOtherTraveller()} <br></c:if> 
                  <c:if test="${planDetails.getTravellerCount() !=0}">旅客: ${planDetails.getTravellerCount()}</c:if> 
                </div>
              </div>
              
                           
              
              <h3>合共<span>${days}</span>天</h3>
            </div>
            <div class="orange-bdr"></div><br/><br/>
            <h3 class="h4-1-orange-b col-lg-6 col-md-6"><!-- 所需保費 --></h3>
            <h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right"><%-- ${flightQuoteDetails.getToalDue()} --%> &nbsp;</h3>
            
              <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-left">
              <a href="/FWDHKPH1A/flight" onclick="BackMe();" class="bdr-curve btn btn-primary bck-btn">上一頁 </a> </div>
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-right"> 
            <input type="submit" class="bdr-curve-none btn btn-primary btn-next" Value="下一頁"  />
             </div>
            
           
            <div class="clearfix"></div>
            <br>
            <br>
          </div>
          <div class="clearfix"></div>
        </div>
        <p class="padding1 hidden-sm hidden-xs">以上資料只作參考用途。詳情請查看<a class="sub-link" href="resources/policy-provisions-pdf/FlightCare_Provisions_Mar_2015.pdf" target="_blank">保單條款</a>。有關條款細則的詳細資料,請聯絡您的理財顧問或致電我們的24小時熱線3123 3123與客戶服務主任聯絡。</p>
      </form>
    </div>
    <!--/.row--> 
  </div>
  <!--/.container--> 
</section>
<div class="hidden-lg hidden-md text-center">
	<div class="btn-box">
		<h3 class="text-center marg-t">
			<a href="flight-plan-details">下一頁</a>
		</h3>
	</div>
</div>
<!--/end Main Content-->

<!--/#bottom-->
<!-- <div class="bottom hidden-sm hidden-xs ">
  <div class="container">
    <div class="row">
      <div class="col-sm-7 pull-left pad-none">
        <ul class="nav nav-pills">
          <li><a href="http://www.fwd.com.hk/en-US/home/security.html" target="_blank">網上保安</a></li>
          <li> | </li>
          <li><a href="http://www.fwd.com.hk/en-US/home/disclaimer.html" target="_blank">免責聲明</a></li>
          <li> | </li>
          <li><a href="http://www.fwd.com.hk/en-US/home/pdo.html" target="_blank">個人資料保護政策及執行</a></li>
        </ul>
      </div>
      <div class="col-sm-5 pull-right text-right">
        <p> &copy; 2015 富衛香港 版權所有 不得轉載</p>
      </div>
    </div>
  </div>
</div>-->
<!--/#bottom--> 

<!--Get promotion code popup-->
<div class="modal fade bs-promo-modal-lg " tabindex="-1" role="dialog"  aria-hidden="true" style="display: none;" >
  <div class="modal-dialog modal-lg">
			<div class="modal-content plan-modal">
				<div class="login-form" id="sendmailofpromocode">
					<form>
					<div class="form-container">
						<h2>不要有一個促销代碼？输入您的電子郵件地址，我們會送你一個</h2>
						<h4>電子郵件 </h4>
						<div class="form-group">
							<input type="text" class="form-control" placeholder=""
								name="emailToSendPromoCode" id="emailToSendPromoCode">
						</div>
						<span id="errPromoEmail" class="text-red"></span> <br>
						<div class="row">
							<div class="col-lg-6 col-md-6">
								<a class="bdr-curve btn btn-primary btn-lg wd5" href="#"
									onclick="return sendEmail()">Submit</a>
							</div>
							<div class="col-md-2">
								<br>
							</div>
							<div class="col-lg-4 col-md-4">
								<!-- <a class="bdr-curve btn btn-primary btn-lg promo-pop-close wd5" href="#" data-dismiss="modal">Close </a>  -->
							</div>
							<br> <br>
							<div class="col-lg-12 col-md-12">
								<p>我同意提交我的電子郵件地址作為接收富衛的推廣編號之用，並在未來接收其他優惠資訊。</p>
							</div>
						</div>
					</div>
				</form>
				</div>
				
				
			</div>
		</div>
</div>
<!--/ Get promotion code popup--> 

<script type="text/javascript">
function BackMe() {
	window.history.back();
}
function sendEmail() {
	if (get_promo_val()) {
		$.ajax({
			type : "POST",
			url : "sendEmail",
			data : $("#sendmailofpromocode form").serialize(),
			async : false,
			success : function(data) {
				alert(data);
				if (data == 'success') {
				}  else {
					
				}

			},
			error : function() {
			}
		});
	}
	return false;
} 
</script>
