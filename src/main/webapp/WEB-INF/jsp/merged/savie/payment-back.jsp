<%@page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<link rel="stylesheet" href="assets/css/material.min.css" />
		<%@include file="includes/head.jsp" %>
		<meta name="apple-mobile-web-app-capable" content="yes" />
	</head>
	<body>
		<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps" id="payment-page">
			<!-- HEADER -->
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
			<div class="container-fluid fwd-full-container headerStick">
				<div class="fwd-container-limit clearfix sidebar">
					<div class="payment-content-wrapper">					
						<p class="panel-title">Payment</p>
						<form id="paymentForm" action="" method="post">
							<div class="radio-group clearfix">
							   <div class="radio-button-group">
								  <div class="clearfix desktop-align left cstm-md-col">
									 <div class="pull-left radio-holder">
										<input type="radio" id="payment-debit" name="payment" checked="checked"> <label for="payment-debit"></label>
									 </div>
									 <div class="pull-left desc">
										Direct debit
									 </div>
								  </div>
								  <div class="clearfix below desktop-align">
									 <div class="pull-left radio-holder">
										<input type="radio" id="payment-later" name="payment"> <label for="payment-later"></label>
									 </div>
									 <div class="pull-left desc">
										Pay later
										<span>(Pay at Customer Service Center)</span>
									 </div>
								  </div>
							   </div>
							</div>
							<div id="direct-debit-panel">
								<div class="row">
									<div class="col-xs-12 col-md-6">
										<div class="info-wrapper">
											<p class="info-label">Amount</p>
											<p class="info-value">HK$ 100.00</p>
										</div>
										<div class="info-wrapper">
											<p class="info-label">Payment method</p>
											<p class="info-value">Direct debit</p>
										</div>
										<div class="info-wrapper">
											<p class="info-label">Bank account holder name</p>
											<p class="info-value">CHAN TAI MAN</p>
										</div>
									</div>
									<div class="col-xs-12 col-md-6">
										<div class="payment-select-wrapper">
											<p class="bank-info-select-label">Bank name (code)</p>
											<div class="selectDiv centreDiv gray-text-bg">
												<select name="bank_code" id="bank_code" class="form-control gray-dropdown">
													<option selected disabled value="">Bank name (code)</option>
													<option value="001">001</option>
													<option value="002">002</option>
												</select>
												<img src="assets/images/orange-caret.png" class="orange-caret-bg">
											 </div>
										</div>
										<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
											<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="bankAccountNo" name="bankAccountNo">
											<label class="mdl-textfield__label" for="bankAccountNo">Account no.</label>
										</div>
										<div class="payment-select-wrapper">
											<p class="bank-info-select-label">Bank name (code)</p>
											<div class="selectDiv centreDiv gray-text-bg">
												<select name="bank_name" id="bank_name" class="form-control gray-dropdown">
													<option selected disabled value="">Branch name (code)</option>
													<option value="option1">Option 1</option>
													<option value="option2">Option 2</option>
												</select>
												<img src="assets/images/orange-caret.png" class="orange-caret-bg">
											</div>
										</div>
									</div>
								</div>
								<div class="form-group payment-policy-wrapper">
									<input type="checkbox" id="payment_confirm_authorize" name="payment_confirm_authorize">
									<label for="payment_confirm_authorize"></label>
									<p class="policy-text">I, as Policy owner, confirm that I am not acting on behalf of any other person, that the above payment is made on my own behalf, and that I authorize FWD Life Insurance Company (Bermuda) Limited, until further written notice, to debit the account listed above to pay the insurance premium.</p>
								</div>
								<center>
									<button type="button" class="btn btn-payment">Back to application summary</button>
									<a href="#" class="save-link visible-xs visible-sm">Save and continue later</a>
								</center>
							</div>
						</form>
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
				$("input[type='radio']").on('click', function() {
					if($('#payment-debit:checked').length > 0 ) {
						$('#direct-debit-panel').removeClass('hidden');
					} else {
						$('#direct-debit-panel').addClass('hidden');
					}
				});
				
				$('span.icon-chevron-thin-down.orange-caret').on('click', function() {
					var selectId = $(this).attr('data-selectId');
					open($('#' + selectId));
				});
				
				$('.form-control.gray-dropdown').focus(function() {
					$(this).parent('.selectDiv').siblings('.bank-info-select-label').attr('style', 'color: #ff8200;');
				}).on('blur', function () {
					$(this).parent('.selectDiv').siblings('.bank-info-select-label').removeAttr('style');
				});
			});
			
			function open(elem) {
				if (document.createEvent) {
					var e = document.createEvent("MouseEvents");
					e.initMouseEvent("mousedown", true, true, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
					elem[0].dispatchEvent(e);
				} else if (element.fireEvent) {
					elem[0].fireEvent("onmousedown");
				}
			}
		</script>
	</body>
</html>