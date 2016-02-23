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
				<!--<div class="fwd-container-limit clearfix sidebar page-application">-->
				<div class="fwd-container-limit clearfix sidebar">
					<div class="payment-content-wrapper">
						<p class="panel-title">Payment</p>						
						<form action="" id="paymentForm" method="post">
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
										<div class="form-group">
											<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
												<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="bankAccountNo" name="bankAccountNo">
												<label class="mdl-textfield__label" for="bankAccountNo">Account no.</label>
											</div>
											<span class="error-msg" id="bankAccountNoErMsg"></span>
										</div>
										<div class="payment-select-wrapper">
											<p class="bank-info-select-label">Branch name (code)</p>
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
							</div>
							
							<!-- merge with pay later -->
							<div id="pay-later-page" class="hidden">
								<div class="make-an-appointment clearfix">
									<div class="col-xs-12 col-md-6" id="left-side-form">
										<h5>Please choose service centre</h5>
										<p class="confirm-call">Appointment can be made up to 20 days in advance.</p>
										<div class="form-group">
											<div class="payment-select-wrapper">
												<p class="bank-info-select-label">Customer Service Centre</p>
												<div class="selectDiv centreDiv gray-text-bg">
													<select name="customerServiceCentre" id="customerServiceCentre" class="form-control gray-dropdown">
														<!--<option value="" disabled="disabled" selected="selected">Customer Service Centre</option>-->
														<option value="1" selected="selected">Tsim Sha Tsui</option>
														<option value="2">Quarry Bay</option>
														<option value="3">Sheung Wan</option>
														<option value="4">Kwun Tong</option>
														<option value="5">Shatin</option>
													</select>
													<img src="assets/images/orange-caret.png" class="orange-caret-bg">
												</div>
											</div>
											<span class="error-msg" id="customerServiceCentreErMsg"></span>
										</div>
										
										<div class="centre-info visible-xs visible-sm" id="centre-info">
											<img src="assets/images/savie-2016/timshatsui.jpg" class="img-centre img-responsive" /><h4>Address</h4><p class="centre-address">G/F, Fontaine Building, 18 Mody Road, Tsim Sha Tsui</p>
											<a class="address-link" href="#">View map</a>
										</div>
										
										<div class="form-group">
											<div class="payment-select-wrapper so-mdl-textfield">
												<label class="mdl-textfield__label">Date</label>
												<div id="date" class="selectDiv preferred-date gray-text-bg">
													<input type="text" class="date preferred-date form-control gray-dropdown" name="preferredDate" id="preferredDate" value="">
													<img src="assets/images/orange-caret.png" class="orange-caret-bg">
												</div>
											</div>
											<span class="error-msg" id="preferredDateErMsg"></span>
										</div>
										
										<div class="form-group">
											<div class="payment-select-wrapper so-mdl-textfield">
												<label class="mdl-textfield__label">Time</label>
												<div class="selectDiv timeslot gray-text-bg">
													<input type="text" class="form-control gray-dropdown" name="preferred-time" id="preferred-time" value="">
													<img src="assets/images/orange-caret.png" class="orange-caret-bg">
												</div>
											</div>
											<span class="error-msg" id="preferredTimeErMsg"></span>
										</div>
									</div>
									<div class="col-xs-12 col-md-6" id="right-side-form">
										<div class="centre-info visible-md visible-lg" id="centre-info">
											<img src="assets/images/savie-2016/timshatsui.jpg" class="img-centre img-responsive" /><h4>Address</h4><p class="centre-address">G/F, Fontaine Building, 18 Mody Road, Tsim Sha Tsui</p>
											<a class="address-link" href="#">View map</a>
										</div>
									</div>
								</div>
							</div>
							
							<center>
								<!--<button type="button" class="btn btn-payment">Back to application summary</button>-->
								<button type="submit" id="btn-next" class="btn btn-payment">Next</button>
								<br /><a href="#" class="save-link" id="payment-save-and-con">Save and continue later</a>
								<button type="button" id="btn-back" class="btn btn-payment hidden">Back to application summary</button>
							</center>
						</form>
					</div>
				</div>
			</div>
			<!-- FOOTER -->
			<%@include file="includes/footer-block.jsp" %>
		</div>
		<!-- Save and continue modal -->
		<div class="modal fade common-welcome-modal" id="save-and-continue-modal" tabindex="-1" role="dialog">
		  <div class="modal-dialog">
			<div class="modal-content save-con-modal-content">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
				<h4 class="text-center welcome-msg">Would you like to save your application and continue later?</h4>
				<p class="text-center description-msg">You may save your application progress up to (previous page). You will receive an email with a link of your saved application progress, you may continue the application within 30 days.</p>
				<div class="save-con-btns clearfix">
					<button class="btn savie-common-btn save-exit-btn1 col-sm-6 col-xs-6 col-lg-6 col-md-6">Keep going</button>
					<button class="btn savie-common-btn save-exit-btn2 col-sm-6 col-xs-6 col-lg-6 col-md-6">Save and exit</button>
				</div>
			</div>
		  </div>
		</div>
		<!-- Save and continue batch 5 modal -->
		<div class="modal fade common-welcome-modal save-con-modal-b5" id="save-and-continue-batch5-modal" tabindex="-1" role="dialog">
		  <div class="modal-dialog">
			<div class="modal-content save-con-modal-content">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
				<h4 class="text-center welcome-msg">Would you like to save your application and continue later?</h4>
				<p class="text-center description-msg">You will receive an email with a link of your saved application progress, you may continue the application within 30 days.</p>
				<div class="save-con-btns clearfix">
					<center><button class="btn savie-common-btn" id="keep-going-btn">Keep going</button><button class="btn savie-common-btn disabled-gray-btn" id="save-exit-btn">Save and exit</button></center>
				</div>
			</div>
		  </div>
		</div>
		<!-- JS INCLUDES -->
		<%@include file="includes/js-include.jsp" %>
		<script type="text/javascript">
			var language = "en";
			
			$(document).ready(function() {
				
				// button to show
				// dummy condition
				if(true) {
					$('#btn-back').addClass('hidden');
					$('#btn-next').removeClass('hidden');
				} else {
					$('#btn-next').addClass('hidden');
					$('#btn-back').removeClass('hidden');
				}
				
				paymentFormValidation();
				
				$("input[type='radio']").on('click', function() {
					if($('#payment-debit:checked').length > 0 ) {
						$('#pay-later-page').addClass('hidden');
						$('#direct-debit-panel').removeClass('hidden');
						$('.save-link').removeClass('hidden');
					} else {
						$('#direct-debit-panel').addClass('hidden');
						$('.save-link').addClass('hidden');
						$('#pay-later-page').removeClass('hidden');
					}
				});
				
				$('span.icon-chevron-thin-down.orange-caret').on('click', function() {
					var selectId = $(this).attr('data-selectId');
					open($('#' + selectId));
				});
				
				$('#payment-save-and-con').on('click', function (e) {
                    if($('#paymentForm').data('bootstrapValidator').isValid()) {
						$('#save-and-continue-batch5-modal').modal('show');
                    } else {
						$('#save-and-continue-modal').modal('show');
                    }
                });
				
				$('.form-control.gray-dropdown').focus(function() {
					$(this).parent('.selectDiv').siblings('.bank-info-select-label').attr('style', 'color: #ff8200;');
					$(this).parent('.selectDiv').parent('.so-mdl-textfield').addClass('is-focused');
					$(this).parent('.selectDiv').parent('.so-mdl-textfield').removeClass('is-not-active');
				}).on('blur', function () {
					$(this).parent('.selectDiv').siblings('.bank-info-select-label').removeAttr('style');
					$(this).parent('.selectDiv').parent('.so-mdl-textfield').removeClass('is-focused');
					$(this).parent('.selectDiv').parent('.so-mdl-textfield').addClass('is-not-active');
					 if($(this).val() == '') {
					   $(this).parent('.selectDiv').parent('.so-mdl-textfield').removeClass('is-not-active');
					}
				});
								
				/** temporary code **/
				 $('.so-mdl-textfield-input').focus(function () {
					   $(this).parent('.so-mdl-textfield').removeClass('is-not-active');
					   $(this).parent('.so-mdl-textfield').addClass('is-active');
			   }).on('blur', function () {
					   $(this).parent('.so-mdl-textfield').addClass('is-not-active');
					   $(this).parent('.so-mdl-textfield').removeClass('is-active');
					   if($(this).val() == '') {
						   $(this).parent('.so-mdl-textfield').removeClass('is-not-active');
					   }
			   });
			   /*****************/
			   
			   $('#preferredDate').on('changeDate show', function(e) {
					$(this).parent('.selectDiv').parent('.so-mdl-textfield').addClass('is-not-active');
					 if($(this).val() == '') {
					   $(this).parent('.selectDiv').parent('.so-mdl-textfield').removeClass('is-not-active');
					}
					
					$('#paymentForm')
						.data('bootstrapValidator')
						.updateStatus('preferredDate', 'NOT_VALIDATED', null)
						.validateField('preferredDate');
			   });
			   
			   $('#preferred-time').on('change', function() {
				   $('#paymentForm')
						.data('bootstrapValidator')
						.updateStatus('preferred-time', 'NOT_VALIDATED', null)
						.validateField('preferred-time');
			   });
			});
			
			// Payment form validation
			function paymentFormValidation() {
				$('#paymentForm').bootstrapValidator({
					//excluded: [':disabled', ':hidden', ':not(:visible)'],
					excluded: [':disabled'],
					fields: {
						bankAccountNo: {
						   container: '#bankAccountNoErMsg',
						   validators: {
							  notEmpty: {
								 message: "Please enter account number."
							  },
							   regexp: {
								  regexp: /^[0-9]*$/,
								  message: "Bank account number is invalid."
							   }
						   }
						},
						customerServiceCentre: {
						   container: '#customerServiceCentreErMsg',
						   validators: {
							  notEmpty: {
								 message: "Please select customer service centre."
							  }
						   }
						},
						"preferredDate": {
						   container: '#preferredDateErMsg',
						   validators: {
							  notEmpty: {
								 message: "Please specify a date."
							  }
						   }
						},
						"preferred-time": {
						   container: '#preferredTimeErMsg',
						   validators: {
							  notEmpty: {
								 message: "Please specify a time."
							  }
						   }
						}
					}
				}).on('success.form.bv', function(e) {
						e.preventDefault();
				}).on('error.form.bv', function(e) {
				});
			}
			
			function open(elem) {
				if (document.createEvent) {
					var e = document.createEvent("MouseEvents");
					e.initMouseEvent("mousedown", true, true, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
					elem[0].dispatchEvent(e);
				} else if (element.fireEvent) {
					elem[0].fireEvent("onmousedown");
				}
			}
			
			// related to pay later
			$(window).bind('scroll', function() {
				stickHeaderBrowse();
			 });

			 $('#preferred-time').timepicker({
				appendTo: '.timeslot',
				timeFormat: 'H:i',
			 });
			 $('#preferredDate').datepicker({
				format: "mm-dd-yyyy",
				//format: 'yy-mm-dd',
				container: "#date",
				startDate: new Date(),
				autoclose: true
			 });

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

			 var centre = $('#customerServiceCentre option:selected').val();
		   
			 $('#customerServiceCentre').on('change', function() {
				var centre = $('#customerServiceCentre option:selected').val();
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
			 console.log($('.ui-select > #centre-button > span').text());
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
			 
			 function onchangeDate(val) {
				 $(val).parent('.selectDiv').parent('.so-mdl-textfield').addClass('is-not-active');
				 if(val.value == '') {
				   $(val).parent('.selectDiv').parent('.so-mdl-textfield').removeClass('is-not-active');
				}
				
				// Revalidate it
				//$('#paymentForm').bootstrapValidator('revalidateField', 'preferred-date');
			}
		</script>
	</body>
</html>