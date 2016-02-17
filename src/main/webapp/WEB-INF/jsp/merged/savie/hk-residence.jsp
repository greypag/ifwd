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
		<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps hk-residence-page" id="upload-document-page">	   <!-- HEADER -->
			<%@include file="includes/header-block.jsp" %>
			<!-- BREADCRUMBS -->
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
							<li class="step-number"><button type="button" class="et-header-info-btn active"><span class="status">5</span>Document upload</button></li>
							<li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
							<li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">6</span>Confirmation</button></li>
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
							   <h3>Document upload</h3>
							</div>
						 </div>
						 <span id="step-of">5 out of 6</span>
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
						 <li><a href="#" class="active"><span class="step-no">5</span></a></li>
						 <li id="last-step"><a href="#"><span class="step-no">6</span></a></li>
					</ul>
					<div class="step-line"></div>
				</div>
			</div>
			<!-- UPLOAD DOCUMENT BLOCK -->
			<div id="so-upload-document-section">
				<div class="container-fluid fwd-container up-doc-page headerStick">
					<div class="fwd-container-limit clearfix sidebar personal-info-widget page-application et-application-page document-upload">
						<div id="radio-checkbox-holder">
							<h4 class="so-h4">Please select the document upload options</h4>
							<div class="radio-group clearfix">
							  	<div class="radio-button-group">
									<div class="clearfix desktop-align left">
										<div class="pull-left radio-holder">
										   <input type="radio" id="upload-now-radio" class="upload-now-radio" name="upload" checked /> <label for="upload-now-radio"></label>
										</div>
										<div class="pull-left desc">
										   Upload now
										   <span>Upload your HKID and proof of address</span>
										</div>
									</div>
									<div class="clearfix below desktop-align">
										<div class="pull-left radio-holder">
										   <input type="radio" id="upload-later-radio" class="upload-later-radio" name="upload" /> <label for="upload-later-radio"></label>
										</div>
										<div class="pull-left desc">
										   Upload later
										   <span>Go to your profile and upload from there, later!</span>
										</div>
									</div>
							  	</div>
						  	</div>						
							<div class="upload-now-section" id="upload-now-section">
								<div class="clearfix">
									<div class="left-desktop check-box">
									   <div class="checkbox-section">
										  <div class="clearfix">
											 <div class="pull-left left-checkbox">
												<input type="checkbox" value="None" id="hkPermanentRes" name="hkPermanentRes"  onclick="return hkPermanentResCheckbox();" checked />
												<label for="hkPermanentRes"></label>
											 </div>
											 <div class="pull-left right-checkbox">
												<span class="checkbox-text">I’m Hong Kong permanent resident</span>
											 </div>
										  </div>
									   </div>
									</div>
								</div>
							</div>
						</div>	
						<div class="row upload-now" id="step-holder">
							<div class="col-xs-12 col-md-4 step-container">
								<p class="bold-label">Your HKID</p>
								<p class="small-gray">Upload your HKID</p>
								<div class="completed-step" id="your-hkid">
									<div class="done-upload-check">
										<img src="assets/images/savie-2016/done-check.png" />
									</div>
								</div>
							</div>
							<div class="col-xs-12 col-md-4 step-container">
								<p class="bold-label">Your passport copy</p>
								<p class="small-gray">If you are a non-permanent resident</p>
								<div class="completed-step" id="your-passport">
									<div class="done-upload-check">
										<img src="assets/images/savie-2016/done-check.png" />
									</div>
								</div>
							</div>
							<div class="col-xs-12 col-md-4 step-container">
								<p class="bold-label">Proof of address</p>
								<p class="small-gray">Upload your current residential address copy</p>
								<p id="valid-address-link"><a href="#">Valid address proof</a> (within 3 months)</p>
								<div class="completed-step" id="address-proof">
									<div class="done-upload-check">
										<img src="assets/images/savie-2016/done-check.png" />
									</div>
								</div>
							</div>
						</div>		
						<div class="upload-later hidden" id="upload-later-section">
							<div class="description">
								<p class="first-desc">You may upload the document when you have all of them ready from either the following:</p>
								<ol>
									<li class="second-desc">We will send you a confirmation email embeded with a upload link, you may access directly;</p>
									<li class="second-desc">You may login to your <span class="bold">eService</span> membership account, and upload the document under <span class="bold">Purchase History</span> section.</p>
								</ol>
							</div>
						</div>
						<div class="text-center">
							<button type="button" class="btn savie-common-btn" id="complete-btn">Complete</button>
						</div>
					</div>
				</div>
			</div>
			<!-- FOOTER -->
			<%@include file="includes/footer-block.jsp" %>
		</div>
		
		<!-- JS INCLUDES -->
		<%@include file="includes/js-include.jsp" %>
		<script type="text/javascript">
			var language = "en";
			$(document).ready(function () {
				if($('#hkPermanentRes').is(':checked')) {
					$('#your-passport').parent('.step-container').removeClass('hidden');
				} else {
					$('#your-passport').parent('.step-container').addClass('hidden');
				}
				$('#hkPermanentRes').on('change', function () {
					if($(this).is(':checked')) {
						$('#your-passport').parent('.step-container').removeClass('hidden');
					} else {
						$('#your-passport').parent('.step-container').addClass('hidden');
					}
				});
				$('.upload-later-radio').on('change', function() {
					if($(this).is(':checked')) {
						console.log('cehck');
						$('.upload-now').addClass('hidden');
						$('.upload-later').removeClass('hidden');
						$('#complete-btn').css('margin-top', '0');
					}
				});
				$('.upload-now-radio').on('change', function() {
					if($(this).is(':checked')) {
						console.log('cehck');
						$('.upload-later').addClass('hidden');
						$('.upload-now').removeClass('hidden');
						$('#complete-btn').css('margin-top', '61px');
					}
				});
			});
		</script>
		
	</body>
</html>