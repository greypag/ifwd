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
		<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps" id="unemployed-page">
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
	                        <li class="step-number"><button type="button" class="et-header-info-btn active"><span class="status">2</span>Application &amp; payment</button></li>
	                        <li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
	                        <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">3</span>Summary &amp; declaration</button></li>
	                        <li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
	                        <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">4</span>Signature</button></li>
	                        <li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
	                        <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">5</span>Document upload</button></li>
	                        <li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
	                        <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">6</span>Confirmation</button></li>
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
	                        <h3 id="">Application &amp; payment</h3>
	                     </div>
	                     <p id="step-of">2 of 6</p>
	                  </div>
	               </div>
	            </div>
	        </div>
	        <div class="container-fluid fwd-full-container mobile-step-indicator visible-xs visible-sm">
	        	<div class="step-indicator-container clearfix">
	               	<ul class="common-step-indicator six-steps nav nav-pills">
                     	<li id="first-step"><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
                     	<li><a href="#" class="active"><span class="step-no">2</span></a></li>
                     	<li><a href="#"><span class="step-no">3</span></a></li>
                     	<li><a href="#"><span class="step-no">4</span></a></li>
                     	<li><a href="#"><span class="step-no">5</span></a></li>
                     	<li id="last-step"><a href="#"><span class="step-no">6</span></a></li>
                    </ul>
                    <div class="step-line"></div>
	            </div>
	        </div>
	        <div class="container-fluid fwd-full-container headerStick" id="unemployed-page-body">
	        	<div class="fwd-container-limit clearfix sidebar">
	  				<div id="unemployed-content">
	  					<div class="row">
	  						<form id="unemployedForm" method="post" action="">
	  							<h3>Employment information &amp; education level </h3>
	  							<div class="col-xs-12 col-md-6" id="left-side">
									<div class="selectDiv centreDiv gray-text-bg">
										<select name="occupation" id="occupation" class="form-control gray-dropdown">
										   <option value="1" selected="selected">Housewife</option>
										   <option value="2">Secretary</option>
										   <option value="3">Engineer</option>
										   <option value="4">Fireman</option>
										   <option value="5">Policeman</option>
										</select>
										<img src="assets/images/orange-caret.png" class="orange-caret-bg">
									</div>
									<div class="form-group">
										<div class="selectDiv centreDiv gray-text-bg">
											<select name="otherIncomeAmount" id="otherIncomeAmount" class="form-control gray-dropdown">
											   <option value="" disabled="disabled" selected="selected">Amount of other source of income</option>
											   <option value="1">HK$10000</option>
											   <option value="2">HK$20000</option>
											   <option value="3">HK$30000</option>
											   <option value="4">HK$40000</option>
											</select>
											<img src="assets/images/orange-caret.png" class="orange-caret-bg">
										</div>
										<span class="error-msg" id="otherIncomeAmountErMsg"></span>
									</div>
	  							</div>
	  							<div class="col-xs-12 col-md-6" id="right-side">
									<div class="form-group">
										<div class="selectDiv centreDiv gray-text-bg">
											<select name="educationLevel" id="educationLevel" class="form-control gray-dropdown">
											   <option value="" disabled="disabled" selected="selected">Education level</option>
											   <option value="1">Bachelor</option>
											   <option value="2">Doctorate</option>
											</select>
											<img src="assets/images/orange-caret.png" class="orange-caret-bg">
										</div>
										<span class="error-msg" id="educationLevelErMsg"></span>
									</div>
									<div class="form-group">
										<div class="selectDiv centreDiv gray-text-bg">
											<select name="liquidAssetsAmount" id="liquidAssetsAmount" class="form-control gray-dropdown">
											   <option value="" disabled selected>Amount of liquid assets (HK$)</option>
											   <option value="1">HK$10000</option>
											   <option value="2">HK$20000</option>
											   <option value="3">HK$30000</option>
											   <option value="4">HK$40000</option>
											</select>
											<img src="assets/images/orange-caret.png" class="orange-caret-bg">
										</div>
										<span class="error-msg" id="liquidAssetsAmountErMsg"></span>
									</div>
	  							</div>
	  							<div class="col-xs-12 text-center">
	  								<button type="submit" class="btn savie-common-btn" id="next-btn">Next</button><br/>
	  								<a href="#" id="save-cont-link">Save and continue later</a>
	  								<button class="btn savie-common-btn hidden" id="back-summary-btn">Back to application summary</button> <!-- This button to be displayed when its not the first time for the user to fill in this form -->
	  							</div>	
	  						</form>
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
			
			$(document).ready(function() {
				
				// Form validation
				$('#unemployedForm').bootstrapValidator({
					excluded: [':disabled', ':hidden', ':not(:visible)'],
					fields: {
						otherIncomeAmount: {
						   container: '#otherIncomeAmountErMsg',
						   validators: {
							  notEmpty: {
								 message: "Please select amount of other source of income."
							  }
						   }
						},
						educationLevel: {
						   container: '#educationLevelErMsg',
						   validators: {
							  notEmpty: {
								 message: "Please select your education level."
							  }
						   }
						},
						liquidAssetsAmount: {
						   container: '#liquidAssetsAmountErMsg',
						   validators: {
							  notEmpty: {
								 message: "Please select amount of liquid assets."
							  }
						   }
						}
					}
				}).on('success.form.bv', function(e) {
						e.preventDefault();
				}).on('error.form.bv', function(e) {
				});
			});
		</script>
	</body>
</html>	
