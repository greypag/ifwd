<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--/#main-Content-->
<section id="contact-page">
  <div class="container">
    <div class="row">
      <form>
        <ol class="breadcrumb pad-none">
          <li><a href="#">Home</a> <i class="fa fa-caret-right"></i></li>
          <li><a href="#">Travel </a > <i class="fa fa-caret-right"></i></li>
          <li><a href="#">Your options </a> <i class="fa fa-caret-right"></i></li>
          <li><a href="#">Your options </a> <i class="fa fa-caret-right"></i></li>
           <li><a href="#">Summary & payment </a> </li>
          <li class="active "><i class="fa fa-caret-right"></i> Confirmation</li>
        </ol>
        <div class="container ">
          <div class="col-md-12 shop-tracking-status">
            <div class="center wow fadeInDown animated" style="visibility: visible;">
              <h2>Confirmation</h2>
            </div>
            <br>
			<div id="tr-wizard" class="shop-tracking-status">
			  <div class="order-status has-four">
			        <div class="order-status-timeline-new">
						<div class="order-status-timeline-completion dots-active"></div>
						<div class="order-status-timeline-completion dots-active"></div>
						<div class="order-status-timeline-completion dots-active"></div>
					</div>
			        <div class="image-order-status image-order-status-new active img-circle first"> <span class="status color3">Your Options</span>
			          <div class="icon">1</div>
			        </div>
			        
			        <div class="image-order-status image-order-status-intransit  img-circle second"> <span class="status color3">Your Details</span>
			          <div class="icon">2</div>
			        </div>
			        <div class="image-order-status image-order-status-delivered  img-circle third"> <span class="status color3">Summary & Payment</span>
			          <div class="icon">3</div>
			        </div>
			        <div class="image-order-status image-order-status-completed  img-circle act fourth"> <span class="status color3">Confirmation</span>
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
            <h3>You have successfully completed your purchase of  <strong>TravelCare</strong> travel insurance with <strong>FWD</strong>.
             An email has been sent to  <strong>${emailAddress}</strong> with the details of your policy.</h3>
            <h4>Policy Number: <span> ${policyNo}</span></h4>
            <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
            <h5>Your unique promotion code is:<span> <%=session.getAttribute("myReferralCode")%></span></h5>
            <div class="h4-3-b margin-left">Share with your friends and get discounts from our partners!*</div>
            </div>
              <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
              <img src="resources/images/agoda.png" alt="" >	
              </div>
               <div class="clearfix"></div><br><br>
         <div class="h4-2 margin-left">Share your promotion code now to earn discounts and rewards</div>
         <div >
         	<div class="col-lg-6 col-md-6 col-sm-7 col-xs-12 pad-none">
         		<div class=" wht-bg1 text-center referral-url"><a class="padding6 h4-5-b " id="toBeCopied" href="" target="_blank">http://uat-ecom.i.fwd.com.hk/travel?promo=<%=session.getAttribute("myReferralCode")%></a></div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-5 col-xs-12 pad-none"> 
	        	<div class="copy-link pull-left" id="d_clip_button" title="Copy Link" data-clipboard-target="toBeCopied" data-clipboard-text="Default clipboard text from attribute">Copy Link</div>
	        	<!-- <button type="button" id="d_clip_button" class="my_clip_button" title="Click me to copy to clipboard." data-clipboard-target="fe_text" data-clipboard-text="Default clipboard text from attribute">Copy To Clipboard...</button> -->
                <div class="addthis_sharing_toolbox" data-url="https://uat-ecom.i.fwd.com.hk/FWDHKPH1A/" data-title="iFWD"></div>
           	</div>
         </div>
         
             
                
              
              <div class="clearfix"></div>
                <br>
               <div class="col-lg-12 col-md-12 travel-b">
              <div class="declaration-content1"> <b><span class="orange-star">*</span>Referral Program</b>
                <p>
                 	 Referrer will enjoy:  <br>
                  - 5% discount from Agoda<br>
                  - 30% discount on your next purchase of TravelCare<br>
                  Referee will enjoy 25% discount on TravelCare purchase.<br>
                  	Please review the detailed <a href="resources/policy-provisions-pdf/iFWD_HK_Referral_Campaign_T&Cs.pdf" target="_blank">terms and conditions</a> of the referral program.<br>
                 </p>
                 </div>
              </div>
        
          </div>
          <div class="clearfix"></div>
        </div>
        <div class="spacer2"></div>
		  <div class="container pad-none hidden-xs hidden-sm travel-homecare">
          <div class="row-fluid">
            <div class="center " style="visibility: visible;">
              <h4 class="center-h2">You may also be interested in</h4><br><br>
             <div class="col-md-3 col-lg-3 text-left pad-none"> <img src="resources/images/home7.png" alt="" > </div>
        <div class="col-md-8 col-lg-8 text-left col-xs-offset-travel">
          <div>
           		 <div class="h2-32">Easy HomeCare</div>
            	<p class="h4-5">Protect your home for around HK$1 a day, against loss or damage from fire, flood, bursting pipes, typhoon, theft, and accidents.</p>
      			 <a href="homecare" class="border-radius btn btn-primary  get-btn" >Get Quote</a>
            </div>
        </div>
              <br>
            </div>
          </div>
        </div>
      </form>
    </div>
    <!--/.row--> 
  </div>
  <!--/.container-->
  
</section>
<!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5506a5af18925186" async="async"></script>
<!--End of addthis -->