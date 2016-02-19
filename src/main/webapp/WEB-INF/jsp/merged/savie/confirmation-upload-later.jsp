<%@page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<%@include file="includes/head.jsp" %>
        <script type="text/javascript" src="assets/js/pdfobject.js"></script>
        
		<meta name="apple-mobile-web-app-capable" content="yes" />
	</head>
	<body>
		<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps" id="upload-later-confirmation-page">
			<%@include file="includes/header-block.jsp" %>
			<!--BREADCRUMBS-->
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
	                     <ul class="common-steps-list six-steps nav nav-pills">
	                       	<li class="step-number" id="first-step"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Select plan</button></li>
							<li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
							<li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Applicaton &amp; payment</button></li>
							<li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
							<li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Summary &amp; declaration</button></li>
							<li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
							<li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Signature</button></li>
							<li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
							<li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Document upload</button></li>
							<li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
							<li class="step-number"><button type="button" class="et-header-info-btn active"><span class="status">6</span>Confirmation</button></li>
	                     </ul>
	                 </div>
	               </div>  
	               <div class="et-mobile-header-info hidden-md hidden-lg">
	                  <div class="clearfix">
	                     <div class="et-back-arrow">
	                        <a href="#" class="back-arrow-link">
	                           <span class="icon-arrow-left2 arrow-left"></span>
	                        </a>
	                     </div>
	                     <div class="et-header-tex">
	                        <h3 id="">Confirmation</h3>
	                     </div>
	                     <p id="step-of">6 of 6</p>
	                  </div>
	               </div>
	            </div>
	        </div>
	        <div class="container-fluid fwd-full-container mobile-step-indicator visible-xs visible-sm">
				<div class="step-indicator-container clearfix">
					<ul class="common-step-indicator six-steps nav nav-pills">
						 <li id="first-step"><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
						 <li><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
						 <li><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
						 <li><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
						 <li><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
						 <li id="last-step"><a href="#" class="active"><span class="step-no">6</span></a></li>
					</ul>
					<div class="step-line"></div>
				</div>
			</div>
	        <div class="container-fluid fwd-full-container headerStick">
	        	<div class="fwd-container-limit clearfix sidebar">
	        		<div id="upload-later-confirmation-content">
	        			<div class="row">
	        				<div class="col-md-8" id="thankyou-message">
	        					<h3 class="heading-title">Thank you for your purchase!</h3>
	        					<h3 class="visible-xs visible-sm" id="policy-no-mb">Policy no. <span class="policy-no">093KG35JH</span></h3>
	        					<p id="success-purchase">Your purchase has been successful!</p>
	        					<p>Please review the confirmation of your purchase as detailed here. We will send you an email with your application details. Please check your inbox or spam folder.</p>
	        					<p id="reminder">Please be reminded to upload your documents at the <a href="#">eServices page</a> to complete your application.</p>
	        					<div class="border-gray visible-xs visible-sm"></div>
	        				</div>
	        				<div class="col-md-4 visible-md visible-lg" id="policy-no-holder">
	        					<h2>Policy no.</h2>
	        					<h2 id="policy-no">093KG35JH</h2>
	        				</div>
	        				<div class="col-md-12 border-gray visible-md visible-lg" id="border-desktop"></div>
	        			</div>
	        			<div class="row" id="partner-care-holder">
	        				<div class="col-md-6" id="care-holder">
	        					<div class="row">
	        						<h3 class="heading-title">You may also be interesed in</h3>
	        						<div class="col-xs-6 col-md-12 care" id="care-1">
	        							<img src="assets/images/savie-2016/travel-care.jpg" class="img-responsive visible-md visible-lg" />
	        							<img src="assets/images/savie-2016/travel-care-mb.jpg" class="img-responsive visible-xs visible-sm care-img-mb" />
	        							<h3 class="care-title">TravelCare (Annual Cover)</h3>
	        							<p>Embark on an adventure abroad with a comprehensive travel protection companion.</p>
	        							<div class="clearfix"></div>
	        							<div class="get-qoute-holder visible-md visible-lg">
	        								<button class="btn common-yellow-btn get-quote-btn">Get quote</button>
	        							</div>
	        						</div>
	        						<div class="col-xs-6 col-md-12 care" id="care-2">
	        							<img src="assets/images/savie-2016/homecare.jpg" class="img-responsive visible-md visible-lg" />
	        							<img src="assets/images/savie-2016/homecare-mb.jpg" class="img-responsive visible-xs visible-sm care-img-mb" />
	        							<h3 class="care-title">Easy HomeCare</h3>
	        							<p>Protect your home for around HK$1 a day, against loss or damage from fire, flood, bursting pipes.</p>
	        							<div class="clearfix"></div>
	        							<div class="get-qoute-holder visible-md visible-lg">
	        								<button class="btn common-yellow-btn get-quote-btn">Get quote</button>
	        							</div>
	        						</div>
	        					</div>
	        					<div class="row visible-xs visible-sm" id="get-btns-holder">
	        						<div class="col-xs-6 col-md-12">
	        							<div class="get-qoute-holder">
	        								<button class="btn common-yellow-btn get-quote-btn">Get quote</button>
	        							</div>
	        						</div>
	        						<div class="col-xs-6 col-md-12">
	        							<div class="get-qoute-holder">
	        								<button class="btn common-yellow-btn get-quote-btn">Get quote</button>
	        							</div>
	        						</div>
	        					</div>
	        					<div class="border-gray visible-xs visible-sm"></div>
	        				</div>
	        				<div class="col-md-6 partners">
	        					<h3 class="heading-title">Exclusive partner offers</h3>
	        					<div class="row partner">
	        						<div class="col-xs-4 logo-holder">
	        							<img src="assets/images/savie-2016/agoda-logo.png" class="img-responsive" /> 
	        						</div>
	        						<div class="col-xs-8">
	        							<p>Enjoy 8% <a href="#">Agoda</a> discount on all travel products upon successful registration of FWD online membership.</p>
	        						</div>
	        					</div>
	        					<div class="row partner">
	        						<div class="col-xs-4 logo-holder">
	        							<img src="assets/images/savie-2016/buddy-logo.png" class="img-responsive" /> 
	        						</div>
	        						<div class="col-xs-8">
	        							<p>15% off pocket wifi rental with <a href="#">Y5Buddy</a></p>
	        						</div>
	        					</div>
	        					<div class="row partner">
	        						<div class="col-xs-4 logo-holder">
	        							<img src="assets/images/savie-2016/boconcept-logo.png" class="img-responsive" /> 
	        						</div>
	        						<div class="col-xs-8">
	        							<p>Enjoy 5% discount from BoConcept when you purchase an FWD Easy HomeCare Insurance Plan.</p>
	        						</div>
	        					</div>
	        					<div class="row partner">
	        						<div class="col-xs-4 logo-holder">
	        							<img src="assets/images/savie-2016/price-rite-logo.png" class="img-responsive" /> 
	        						</div>
	        						<div class="col-xs-8">
	        							<p>HK$ 50 e-coupon from <a href="#">Pricerite</a> for every successful referral.</p>
	        						</div>	
	        					</div>
	        					<div class="text-center">
	        						<button class="btn common-yellow-btn" id="find-more-btn">Find out more</button>
	        					</div>
	        					<div class="border-gray visible-xs visible-sm"></div>	
	        				</div>
	        			</div>
	        			<div class="text-center">
    						<button class="btn savie-common-btn" id="back-to-home-btn">Back to home </button>
    					</div>
	        		</div>
	        	</div>
	        </div>
	  		 <%@include file="includes/footer-block.jsp" %>
		</div>
		<!-- JS INCLUDES -->
		<%@include file="includes/js-include.jsp" %>
		<script type="text/javascript">

			window.onload = function (){
				var pdfFile = $('#pdf-object').attr('data');
				var success = new PDFObject({ url: pdfFile }).embed();
			};


        </script> 
	</body>
</html>	
