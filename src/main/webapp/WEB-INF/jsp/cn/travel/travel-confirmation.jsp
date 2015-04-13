<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--/#main-Content-->
<section>
   <div id="cn" class="container">
    <div class="row">
      <form>
        <ol class="breadcrumb pad-none">
          <li><a href="#">主頁</a> <i class="fa fa-caret-right"></i></li>
          <li><a href="#">旅遊保險 </a > <i class="fa fa-caret-right"></i></li>
          <li><a href="#">您的選擇</a> <i class="fa fa-caret-right"></i></li>
          <li><a href="#">個人資料 </a> <i class="fa fa-caret-right"></i></li>
           <li><a href="#">總結及付款 </a> </li>
          <li class="active "><i class="fa fa-caret-right"></i>  確認保單</li>
        </ol>
        <div class="container ">
          <div class="col-md-12 shop-tracking-status">
            <div class="center wow fadeInDown animated" style="visibility: visible;">
              <h2> 確認保單</h2>
            </div>
            <br>
            <div id="tr-wizard" class="shop-tracking-status">
  			<div class="order-status has-four">
			        <div class="order-status-timeline-new">
						<div class="order-status-timeline-completion dots-active"></div>
						<div class="order-status-timeline-completion dots-active"></div>
						<div class="order-status-timeline-completion dots-active"></div>
					</div>
        <div class="image-order-status image-order-status-new active img-circle first"> <span class="status color3"> 您的選擇</span>
          <div class="icon">1</div>
        </div>
        
        <div class="image-order-status image-order-status-intransit  img-circle second"> <span class="status color3">個人資料</span>
          <div class="icon">2</div>
        </div>
        <div class="image-order-status image-order-status-delivered  img-circle third"> <span class="status color3"> 總結及付款</span>
          <div class="icon">3</div>
        </div>
        <div class="image-order-status image-order-status-completed  img-circle act fourth"> <span class="status lst-status"> 確認保單</span>
          <div class="icon">4</div>
        </div>
      </div>
</div>
          </div>
        </div>

        
      <c:if test="${not empty errormsg}"><br><div id="confirm-error-msg" class="alert alert-danger hide"
												role="alert">${errormsg}</div><br></c:if>
        
        <div class="container pad-none bdr">
          <div class="col-sm-12 gray-bg1" >

		  <h3>您已成功申請富衛旅遊保險。確認電郵將會發送至<strong>${emailAddress}</strong>，內附保單內容及細節。</h3>
            <!--<h3>You have successfully completed your purchase of <strong>TravelCare</strong> travel insurance with <strong>FWD</strong>. An email has been sent to <strong>john.doe@gmail.com</strong> with the details of your policy.</h3>-->
            <h4>保單編號:<span> ${policyNo}</span></h4>
            <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
            <h5>您的專屬推廣編號: <span><%=session.getAttribute("myReferralCode")%></span></h5>

            <div class="h4-3-b margin-left">與朋友分享，一同取得更多富衛合作夥伴之優惠!<span class="orange-star">*</span></div>
            </div>
              <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
              <img src="resources/images/agoda.png" alt="" >	
              </div>
               <div class="clearfix"></div><br><br>

         <div class="h4-2 margin-left">立即分享您的專屬推廣編號，尊享額外優惠!</div>
         
         <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 pad-none">
         <div class=" wht-bg1 text-center" id="toBeCopied">http://uat-ecom.i.fwd.com.hk/travel?promo=<%=session.getAttribute("myReferralCode")%></div>
              </div>
              <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 pad-none"> 
              
                      <div class="copy-link pull-left" id="d_clip_button" title="Copy Link" data-clipboard-target="toBeCopied" data-clipboard-text="Default clipboard text from attribute">複製</div>
                <div class="addthis_sharing_toolbox" data-url="https://uat-ecom.i.fwd.com.hk/FWDHKPH1A/" data-title="iFWD"></div>
               <!-- <div class="pad-none text-center">
                <a class="sub-link other-share">其他途徑分享</a>
              </div>-->
                </div>
                
              	<div class="clearfix"></div>
                <br>
              <div class="col-lg-12 col-md-12 travel-b">
              <div class="declaration-content1"> <b><span class="orange-star">*</span> 推薦計劃</b>
                <p>
                  推薦人獎賞： 
                  <br>
                  - Agoda 額外95折優惠訂購酒店<br>
                  - 7折購買富衛旅遊保險<br>

                  受薦人獎賞：<br>
                  - 75折購買富衛旅遊保險<br>

                 請参閱推薦計劃之<a href="resources/policy-provisions-pdf/iFWD_HK_Referral_Campaign_T&Cs.pdf" class="sub-link">條款及細則</a>。
                </p></div>
              </div>
        
          </div>
          <div class="clearfix"></div>
        </div>
        <div class="spacer2"></div>
        <div class="container pad-none hidden-xs hidden-sm travel-homecare">
          <div class="row-fluid">
            <div class="center " style="visibility: visible;">
              <h4 class="center-h2">您可能有興趣</h4><br><br>
             <div class="col-md-3 col-lg-3 text-left pad-none"> <img src="resources/images/home7.png" alt=""> </div>
             <div class="col-md-8 col-lg-8 text-left col-xs-offset-travel">
          <div>
            <div class="h2-32"><strong>易安心家居保</strong></div>
            <br>

           <p class="h4-5">每天只需約港幣$1,便可保障家居因火災、水浸、水渠爆裂、颱風、盜竊或意外導致的損失或毀壞。</p><br>
				<a href="#" class="border-radius btn btn-primary  get-btn" >立即報價</a>
            </div>
        </div>
              
            </div>
            
            
          </div>
        </div>
        
      </form>
    </div>
    <!--/.row--> 
  </div>
  <!--/.container-->
</section>

<!--/end- Main Content-->
<!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5506a5af18925186" async="async"></script>
<!--End of addthis -->