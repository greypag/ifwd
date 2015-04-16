<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--/#main-Content-->
<section>
   <div id="cn" class="container">
    <div class="row">
      <form>
        <ol class="breadcrumb pad-none">
          <li><a href="#">##travel.breadcrumb1.item1@@</a> <i class="fa fa-caret-right"></i></li>
          <li><a href="#">##travel.breadcrumb1.item2@@ </a > <i class="fa fa-caret-right"></i></li>
          <li><a href="#">##travel.breadcrumb1.item3@@</a> <i class="fa fa-caret-right"></i></li>
          <li><a href="#">##travel.breadcrumb1.item4@@ </a> <i class="fa fa-caret-right"></i></li>
           <li><a href="#">##travel.breadcrumb1.item5@@ </a> </li>
          <li class="active "><i class="fa fa-caret-right"></i>  ##travel.breadcrumb1.item6@@</li>
        </ol>
        <div class="container ">
          <div class="col-md-12 shop-tracking-status">
            <div class="center wow fadeInDown animated" style="visibility: visible;">
              <h2> ##travel.confirmation.jumbo@@</h2>
            </div>
            <br>
            <br>
            <div id="tr-wizard" class="shop-tracking-status">
  <div class="order-status">
        <div class="order-status-timeline1"> 
          <!-- class names: c0 c1 c2 c3 and c4 -->
          <div class="c0"></div>
        </div>
        <div class="image-order-status image-order-status-new active img-circle"> <span class="status color3"> ##travel.breadcrumb2.item1@@</span>
          <div class="icon">1</div>
        </div>
        
        <div class="image-order-status image-order-status-intransit  img-circle "> <span class="status color3">##travel.breadcrumb2.item2@@</span>
          <div class="icon">2</div>
        </div>
        <div class="image-order-status image-order-status-delivered  img-circle"> <span class="status color3"> ##travel.breadcrumb2.item3@@</span>
          <div class="icon">3</div>
        </div>
        <div class="image-order-status image-order-status-completed  img-circle act"> <span class="status lst-status"> ##travel.breadcrumb2.item4@@</span>
          <div class="icon">4</div>
        </div>
      </div>
</div>
          </div>
        </div>
        <br>
        <br>
      <c:if test="${not empty errormsg}"><div id="confirm-error-msg" class="alert alert-danger hide"
												role="alert">${errormsg}</div></c:if>
        <br>
        <div class="container pad-none bdr">
          <div class="col-sm-12 gray-bg1" >

		  <h3>
          ##travel.confirmation.msg.part1@@ 
          ##travel.confirmation.msg.part2@@
          ##travel.confirmation.msg.part3@@
          ##travel.confirmation.msg.part4@@
          ##travel.confirmation.msg.part5@@
          <strong>${emailAddress}</strong>
          ##travel.confirmation.msg.part6@@
      </h3>
            <!--<h3>You have successfully completed your purchase of <strong>TravelCare</strong> travel insurance with <strong>FWD</strong>. An email has been sent to <strong>john.doe@gmail.com</strong> with the details of your policy.</h3>-->
            <h4>##travel.confirmation.policyNo@@<span> ${policyNo}</span></h4>
            <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
            <h5>##travel.confirmation.referalCode.member@@ <span>${referralCode}</span></h5>

            <div class="h4-3-b margin-left">##travel.confirmation.referalCode.desc1@@<span class="orange-star">*</span></div>
            </div>
              <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
              <img src="resources/images/agoda.png" alt="" >	
              </div>
               <div class="clearfix"></div><br><br>

         <div class="h4-2 margin-left">##travel.confirmation.referalCode.desc2.member@@</div>
         
         <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 pad-none">
         <div class=" wht-bg1 text-center">http://i.fwd.com.hk/tc/travel-insurance?${referralCode} </div>
              </div>
              <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 pad-none"> 
              
                      <div class="copy-link pull-left">##travel.referral.copy@@</div>
                <div class="addthis_sharing_toolbox" data-url="http://support.addthis.com/customer/portal/articles/125634-setting-the-url-title-to-share" data-title="THE TITLE"></div>
               <!-- <div class="pad-none text-center">
                <a class="sub-link other-share">其他途徑分享</a>
              </div>-->
                </div>
                
              	<div class="clearfix"></div>
                <br>
              <div class="col-lg-12 col-md-12 travel-b">
              <div class="declaration-content1"> <b><span class="orange-star">*</span> ##travel.referral.disclaimer@@</b>
                <p>
                  ##travel.referral.disclaimer.section1.header@@
                  <br>
                  - ##travel.referral.disclaimer.section1.desc1@@<br>
                  - ##travel.referral.disclaimer.section1.desc2@@<br>

                  ##travel.referral.disclaimer.section2.header@@<br>
                  - ##travel.referral.disclaimer.section2.desc1@@<br>

                 ##travel.referral.disclaimer.section3.desc.part1@@<a href="http://i.fwd.com.hk/downloads/iFWD_HK_Referral_Campaign_T_Cs.pdf" class="sub-link">##travel.referral.disclaimer.section3.desc.part2@@</a>##travel.referral.disclaimer.section3.desc.part3@@
                </p></div>
              </div>
        
          </div>
          <div class="clearfix"></div>
        </div>
        <div class="spacer2"></div>
        <div class="container pad-none hidden-sm hidden-xs">
          <div class="row-fluid">
            <div class="center " style="visibility: visible;">
              <h4 class="center-h2">##travel.confirmation.heading@@</h4><br><br>
             <div class="col-md-3 col-lg-3 text-left pad-none"> <img src="resources/images/home7.png" alt=""> </div>
             <div class="col-md-8 col-lg-8 text-left col-xs-offset-travel">
          <div>
            <div class="h2-32"><strong>##travel.confirmation.subheading@@</strong></div>
            <br>

           <p class="h4-5">##travel.confirmation.subheading.desc@@</p><br>
				<a href="#" class="border-radius btn btn-primary  get-btn" >##travel.confirmation.getQuote@@</a>
            </div>
        </div>
              <br>
            </div>
            
            
          </div>
        </div>
        <br>
      </form>
    </div>
    <!--/.row--> 
  </div>
  <!--/.container-->
</section>

<!--/end- Main Content-->
