<%@page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<%@include file="includes/head.jsp" %>
      
		<meta name="apple-mobile-web-app-capable" content="yes" />
	</head>
	<body>
		<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps" id="pay-later-page">			
			<%@include file="includes/header-block.jsp" %>

         <div class="fwd-container container-fluid breadcrumbs">
            <div class="breadcrumb-container">
               <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
                   <li><a href="#">Home</a></li>
				   <li class="divider"><i class="fa fa-play"></i></li>
				   <li><a href="#">Save </a></li>
				   <li class="divider"><i class="fa fa-play"></i></li>
				   <li><a href="#">Savie </a></li>
				   <li class="divider last"><i class="fa fa-play"></i></i></li>
				   <li class="active-bc" id="et-active-bc-menu">Application</li>
               </ol>
            </div>
         </div>
         <!-- STEPS -->
         <div class="container-fluid fwd-full-container browse-holder">
            <div class="application-page-header et-header-browse">
               <div class="browse-container">
                  <div class="row reset-margin hidden-xs hidden-sm">
                     <ul class="common-steps-list nav nav-pills">
                        <li class="step-number" id="first-step"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Select plan</button></li>
                        <li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
                        <li class="step-number"><button type="button" class="et-header-info-btn active"><span class="status">2</span>Application &amp; Payment</button></li>
                        <li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
                        <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">3</span>Confirmation</button></li>
                     </ul>
                 </div>
               </div>  
               <div class="et-mobile-header-info hidden-md hidden-lg">
                  <div class="clearfix">
                     <div class="pull-left">
                        <div class="et-back-arrow">
                           <a href="#" class="back-arrow-link">
                              <span class="icon-arrow-left2 arrow-left"></span>
                           </a>
                        </div>
                        <div class="et-header-tex">
                           <h3 id="">Application &amp; payment</h3>
                        </div>
                     </div>
                     <span id="step-of">2 out of 3</span>
                  </div>
               </div>
            </div>
         </div>
			<div class="container-fluid fwd-full-container mobile-step-indicator visible-xs visible-sm">
            <div class="step-indicator-container clearfix">
                  <ul class="common-step-indicator three-steps nav nav-pills">
                     <li id="first-step"><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
                     <li><a href="#" class="active"><span class="step-no">2</span></a></li>
                     <li id="last-step"><a href="#"><span class="step-no">3</span></a></li>
                 </ul>
                 <div class="step-line"></div>
            </div>
         </div>
         <div class="container-fluid fwd-container make-an-appointment headerStick">
           <div class="row" id="appointment-form-holder">
               <div class="radio-group clearfix">
                  <h4>Payment</h4>
                  <div class="radio-button-group">
                     <div class="clearfix desktop-align left">
                        <div class="pull-left radio-holder">
                           <input type="radio" id="payment-debit" name="payment"> <label for="payment-debit"></label>
                        </div>
                        <div class="pull-left desc">
                           Direct debit
                        </div>
                     </div>
                     <div class="clearfix below desktop-align">
                        <div class="pull-left radio-holder">
                           <input type="radio" id="payment-later" name="payment" checked> <label for="payment-later"></label>
                        </div>
                        <div class="pull-left desc">
                           Pay later
                           <span>(Pay at Customer Service Center)</span>
                        </div>
                     </div>
                  </div>
               </div>
               <form>
                  <div class="col-xs-12 col-md-6" id="left-side-form">
                     <h5>Please choose service centre</h5>
					 <p class="confirm-call">Appointment can be made up to 20 days in advance.</p>
                     <div class="selectDiv centreDiv gray-text-bg">
                        <select name="centre" id="centre" class="form-control gray-dropdown">
                           <option value="" disabled selected>Customer Service Centre</option>
                           <option value="1">Tsim Sha Tsui</option>
                           <option value="2">Quarry Bay</option>
                           <option value="3">Sheung Wan</option>
                           <option value="4">Kwun Tong</option>
                           <option value="5">Shatin</option>
                        </select>
                        <img src="assets/images/orange-caret.png" class="orange-caret-bg">
                     </div>
                     <div class="centre-info visible-xs visible-sm" id="centre-info">
                        <img src="assets/images/savie-2016/timshatsui.jpg" class="img-centre img-responsive" /><h4>Address</h4><p class="centre-address">G/F, Fontaine Building, 18 Mody Road, Tsim Sha Tsui</p>
						<a class="address-link" href="#">View map</a>
                     </div>
                     <div id="date" class="selectDiv preferred-date gray-text-bg">
                        <input type="text" class="date preferred-date" name="preferred-date" id="preferred-date" value="Date" readonly="">
                        <img src="assets/images/orange-caret.png" class="orange-caret-bg">
                     </div>
                      <div class="selectDiv timeslot gray-text-bg">
                        <input type="text" name="preferred-time" id="preferred-time" value="Time">
                        <img src="assets/images/orange-caret.png" class="orange-caret-bg">
                     </div>
                  </div>
                  <div class="col-xs-12 col-md-6" id="right-side-form">
                     <div class="centre-info visible-md visible-lg" id="centre-info">
                        <img src="assets/images/savie-2016/timshatsui.jpg" class="img-centre img-responsive" /><h4>Address</h4><p class="centre-address">G/F, Fontaine Building, 18 Mody Road, Tsim Sha Tsui</p>
						<a class="address-link" href="#">View map</a>
                     </div>
                  </div>
                  <div class="col-xs-12">
                      <div class="text-center clearfix">
                        <button class="btn savie-common-btn" type="button" id="btn-cstmr-srvc-cnter">Next</button>
                     </div>
                  </div>   
               </form>
           </div>
         </div>
			<!-- FOOTER -->
			<%@include file="includes/footer-block.jsp" %>
		</div>
		
		<!-- JS INCLUDES -->
		<%@include file="includes/js-include.jsp" %>
		<script type="text/javascript">
			var language = "en";

         $(window).bind('scroll', function() {
            stickHeaderBrowse();
         });

         $('#preferred-time').timepicker({
            appendTo: '.timeslot',
            timeFormat: 'H:i',
         });
         $('#preferred-date').datepicker({
            format: "mm-dd-yyyy",
            //format: 'yy-mm-dd',
            container: "#date",
            startDate: new Date(),
            autoclose: true
         });

         //var img1 = "assets/images/savie-2016/tsimshatsui2.jpg";
		 var img1 = "assets/images/savie-2016/timshatsui.jpg";
         var img2 = "assets/images/savie-2016/quarry_bay.jpg";
         var img3 = "assets/images/savie-2016/sheung_wan.jpg";
         var img4 = "assets/images/savie-2016/kwuntong.jpg";
         var img5 = "assets/images/savie-2016/shatin.jpg";
         var addr1 = "G/F, Fontaine Building, 18 Mody Road, Tsim Sha Tsui";
         var addr2 = "13/F, Devon House, Taikoo Place, 979 King’s Road, Quarry Bay";
         var addr3 = "1/F, FWD Financial Centre, 308 Des Voeux Road Central, Sheung Wan";
         var addr4 = "Office E, 12/F, Legend Tower, No.7 Shing Yip Street, Kwun Tong";
         var addr5 = "Unit 1720 -21, Level 17, Tower II, Grand Central Plaza, Shatin";

         var centre = $('#centre option:selected').val();
       
         $('#centre').on('change', function() {
            var centre = $('#centre option:selected').val();
            if(centre == 1) {
               $('.centre-info').html('<img src="'+img1+'" class="img-centre img-responsive" /><h4>Address</h4><p class="centre-address">'+addr1+'</p><a class="address-link" href="#">View map</a>');
            }
            if(centre == 2) {
              $('.centre-info').html('<img src="'+img2+'" class="img-centre img-responsive" /><h4>Address</h4><p class="centre-address">'+addr2+'</p><a class="address-link" href="#">View map</a>');
            }
            if(centre == 3) {
              $('.centre-info').html('<img src="'+img3+'" class="img-centre img-responsive" /><h4>Address</h4><p class="centre-address">'+addr3+'</p><a class="address-link" href="#">View map</a>');
            }
            if(centre == 4) {
               $('.centre-info').html('<img src="'+img4+'" class="img-centre img-responsive" /><h4>Address</h4><p class="centre-address">'+addr4+'</p><a class="address-link" href="#">View map</a>');
            }
            if(centre == 5) {
              $('.centre-info').html('<img src="'+img5+'" class="img-centre img-responsive" /><h4>Address</h4><p class="centre-address">'+addr5+'</p><a class="address-link" href="#">View map</a>');
            }
         });
         $('.selectDiv').find('span').remove();
         
         $('#centre-button > span').remove();
         applicationCentre();
         function applicationCentre() {
            if(getWidth()>=992) {
               var inner_centre_html = $('#inline-centre').html();

               $('#inline-centre').addClass('hidden');
               $('#right-centre').append(inner_centre_html).removeClass('hidden');
               $('#inline-centre').html('');

            }
            else {
               var inner_centre_html = $('#right-centre').html();

               $('#inline-centre').append(inner_centre_html).removeClass('hidden');
               $('#right-centre').html('');
            }
         }
		</script>
		
		
	</body>
</html>