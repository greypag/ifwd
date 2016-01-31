<%@page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<%@include file="includes/head.jsp" %>
	</head>
	<body>
		<%!
			boolean isSaleActiveClass = true;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper savie-orange-header">			
			<%@include file="includes/header-block-two.jsp" %>
			
			<div class="container-fluid fwd-full-container">
				<div class="application-page-header">
					<div class="row">
						<div class="hidden-md hidden-lg">
							<div class="orange-section left">
								<a href="#" class="et-back-arrow-link"> 
									<span class="icon-arrow-left2 arrow-left"></span>
								</a>
							</div>
							<div class="orange-section">
								<span class="current">Plan details</span>
							</div>
						</div>

						<div class="hidden-xs hidden-sm clearfix">
							<div class="orange-section">
								<a href="#" class="et-back-arrow-link"> 
									<span class="icon-arrow-left2 arrow-left"></span>
								</a>
							</div>
							<div class="row desktop-menu-top">
			                    <div class="col-md-4 reset-padding">
			                      <button type="button" class="et-header-info-btn et-bind-btn-header active" id="select-plan" data-et-section-target="et-select-plan-section">Plan details</button>
			                    </div>
			                    <div class="col-md-4 reset-padding">
			                      <button type="button" class="et-header-info-btn et-bind-btn-header" id="application" data-et-section-target="et-application-section">Make an appointment</button>
			                    </div>
			                    <div class="col-md-4 reset-padding">
			                      <button type="button" class="et-header-info-btn et-bind-btn-header" id="payment" data-et-section-target="et-dec-sign-section">Confirmation</button>
			                    </div>
			              	</div>
			            </div>
					</div>
				</div>
			</div>
			
			<div class="application-flux savie-regular-plan-details">
				<div class="fwd-container-limit">
					<ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs hidden-sm hidden-xs">
		               <li><a href="#">Save</a></li>
		               <li class="divider"><i class="fa fa-play"></i></li>
		               <li><a href="#">Save Insurance Plan </a></li>
		               <li class="divider last"><i class="fa fa-play"></i></li>
		               <li class="active-bc" id="et-active-bc-menu">Plan details</li>
	            	</ol>
	            </div>
	            <h2 class="text-center hidden-xs hidden-sm desktop-title">Plan details</h2>
				<div id="illustration-filters" class="fwd-full-container container-fluid clearfix">
					<form class="fwd-container-limit">
						<div id="triangle"></div>
						<img class="money" src="assets/images/savie/money-logo.png">
						<div id="investment-amount" class="one-off">    
							<div id="desktop-left">
								<h3 class="saving">Payment mode<button id="payment-button-tooltip" type="button" class="btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="" data-original-title=" ">
										<img src="assets/images/savie/sprite-icons-info-2.png">
									</button></h3>
								<div class="selectDiv centreDiv gray-text-bg payment-select">
			                        <select class="form-control gray-dropdown" id="payment-mode">
			                           <option value="one-off" selected>One-off premium</option>
			                           <option value="regular">Regular payment</option>
			                        </select>
			                        <img src="assets/images/ie-orange-caret.png" class="orange-caret-bg" />
			                    </div>
			                    <div class="one-off-premium">
				                    <div class="clearfix">
										<h3 class="pull-right total"><span id="range">200,000</span></h3>
										<label id="hkd" class="pull-right total">HK$</label>
									</div>
									<input type="text" class="span2" name="amount" value="" data-slider-min="30000" data-slider-max="400000" data-slider-step="100" data-slider-value="60000" data-slider-id="RC" id="R" data-slider-tooltip="hide" data-slider-handle="square" />
									
									<div class="clearfix min-max">
										<div class="pull-left text-center">
											<p>Min</p>
											<p>$30,000</p>
										</div>
			
										<div class="pull-right text-center">
											<p>Max</p>
											<p>$400,000</p>
										</div>
									</div>
								</div>
								<div class="regular-payment amount hidden">
									<h3 class="saving">Amount (HK$)</h3>
									<div class="selectDiv centreDiv gray-text-bg payment-select">
				                        <select class="form-control gray-dropdown">
				                           <option value="" selected>1,000</option>
				                           <option value="">2,000</option>
				                        </select>
				                        <img src="assets/images/orange-caret.png" class="orange-caret-bg">
				                    </div>
								</div>
							</div>
	
							<div id="desktop-right">
								<img class="promo-code hidden-xs hidden-sm" src="assets/images/savie/bday-icon.png">
								<h2 id="promo">Date of birth</h2>
								<div id="birthday">
									<!-- <div class="hidden-md hidden-lg">
										<input placeholder="yyyy-mm-dd" type="date" name="mobile-date" id="mobile-date"/> 
									</div> -->
									<div class="input-group input-append date" id="datePicker">
										<input type="text" class="date" name="dob" id="sales-illu-dob" placeholder="15-10-1997" onfocusin="" readonly />
										<span class="input-group-addon add-on"><img class="arrow" src="assets/images/orange-caret.png"></span>                        
									</div>
									<!-- <span class="error-msg-dob hideSpan" id="promo-code-dateOfBirth">Invalid date of birth. You must be 19 and above to apply.</span>
									<span class="error-msg-promo hideSpan" id="promo-code-dateOfBirthEmpty">Please input date of birth.</span> -->
								</div>
								<div class="regular-payment hidden last" id="total-payment-years">
									<h3 class="saving">Total payment years</h3>
									<div class="selectDiv centreDiv gray-text-bg payment-select last">
				                        <select class="form-control gray-dropdown">
				                           <option value="" selected>7</option>
				                           <option value="">8</option>
				                        </select>
				                        <img src="assets/images/orange-caret.png" class="orange-caret-bg">
				                    </div>
								</div>
							</div>
	
						<!-- <p id="crediting-rate">Guaranteed crediting rates: 3%, 3%, 4%</p> -->
						</div>
	
						<div id="information">							
							<div id="pictures">
								<img id="birthday" src="assets/images/savie/promo-img.png">
							</div>
	
							<h2>Promo code</h2>
							<input name="promocode" type="text" placeholder="IF APPLICABLE" class="promocode" id="promocode">
							<span class="error-msg-promo promo-code-error hideSpan" id="promo-code-errmsg">Invalid promo code. Try again?</span>
						</div>
						
						<div class="calculate-holder">
							<button class="btn btn-orange calculate" type="button" id="sales-illu-apply-now">Calculate<span class="icon icon-chevron-thin-right"></span></button>
						</div>
					</form>
				</div>
				
				<!-- Investment Summary and Table Block-->
				<div class="fwd-full-container container-fluid investment">		
					<div class="fwd-container-limit investment-summary-and-table">
						<div id="sales-contents" class="tab-content credits">
							<div>
								<div class="container-fluid summary-tab-max-width">
									<div class="investment-table-desktop clearfix">
										<h2>Summary</h2>
										<div class="clearfix">
											<h3>First 3 policy years (HK$)</h3>
											<br class="hidden-lg hidden-md" />
											<p class="desc text-center">You will receive HK$220,649 at the end of 3rd policy year</p>
										</div>
									</div>
									<div class="rate-table">
										<table class="table table-hover">
											<thead>
											<tr>
												<th class="left-border"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="End of policy year"></button>End of policy year
												</th>
												<th class="desktop-only">Guaranteed annual crediting rate %
													<!--<button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="Guaranteed crediting rate"></button>-->
												</th>
												<th class="premium"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="Total premium paid"></button>Total premium paid
												</th>
												<th class="desktop-only"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="Account value"></button>Account value
												</th>
												<th class="right-border"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="Surrender benefit"></button>Surrender benefit
												</th>
											</tr>
											</thead>
											<tbody>
												<tr>    <td class="left-border">1</td> <td class="black-text desktop-only"><span>3%</span></td>  <td class="black-text"><span>$</span> 100,000</td> <td class="black-text desktop-only"><span>$</span> 100,000</td>    <td class="black-text right-border"><span>$</span> 100,000</td>    </tr>
												<tr>    <td class="left-border">2</td> <td class="black-text desktop-only"><span>3%</span></td> <td class="black-text"><span>$</span> 100,000</td> <td class="black-text desktop-only"><span>$</span> 100,000</td>    <td class="black-text right-border"><span>$</span> 100,000</td>    </tr>
												<tr class="bottom-border">  <td class="left-border">3</td> <td class="black-text desktop-only"><span>4%</span></td> <td class="black-text"><span>$</span> 100,000</td> <td class="black-text desktop-only"><span>$</span> 100,000</td>    <td class="black-text right-border"><span>$</span> 100,000</td>    </tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div>   
							
							<div class="after-3-years-btn" id="after-3-years-div">
								<button type="button" class="btn btn-white see-more" id="see-more-3-years">See more after 3 years</button>
							</div>
								<div class="container-fluid summary-tab-max-width hidden" id="after-3-years">
									<div class="investment-summary-title-desktop clearfix">
										<div class="row percent-buttons" >
											<div class="col-md-6 col-xs-12 after-year-three">
												<h3>After year 3 non guaranteed (HK$)</h3>
												<p class="hidden-md hidden-lg text-center">Click to see projections based on different rates</p>
												<p class="hidden-xs hidden-sm text-left">You can choose to terminate the policy and get all your account value back OR stay with us to earn annual crediting rates determined by FWD at that moment.</p>

											</div>  
											<div class="col-md-6 col-xs-12 fwd-chart-col">
												<p class="hidden-xs hidden-sm text-right">Click to see projections based on different rates</p>
												<div class="clearfix right-side">
													<div class="left-side chart-button-left">
														<button id="zero-rate" type="button">0%</button>
													</div>
													<div class="left-side chart-button-left">
														<button id="two-rate" type="button" >2%</button>
													</div>
													<div class="left-side chart-button-right">
														<button id="three-rate" class="active" type="button">3%</button>
													</div>
													<div class="left-side chart-button-right">
														<button id="four-rate" type="button">3.3%</button>
													</div>
												</div>
											</div>
										</div>                                
									</div>
									<!--<div class="investment-summary">
										<p class="surrender-benefit">Surrender <span>benefit</span> (HK$ ‘000)</p>
										<div id="illustration-chart"></div>
										<div class="drag-more">
											<div>
												<span class="drag-more-text">Drag to<br />view more <span class="glyphicon glyphicon-play"></span></span>
											</div>
										</div>
									</div>-->
									<div class="rate-table">
										<table class="table table-hover">
											<thead>
											<tr>
												<th class="left-border"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="End of policy year"></button>End of policy year
												</th>
												<th class="desktop-only">Annual crediting rate %
													<!--<button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="Guaranteed crediting rate"></button>-->
												</th>
												<th class="premium"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="Total premium paid"></button>Total premium paid
												</th>
												<th class="desktop-only"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="Account value"></button>Account value
												</th>
												<th class="right-border"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="Surrender benefit"></button>Surrender benefit
												</th>
											</tr>
											</thead>
											<tbody>
												<tr>    <td class="left-border">5</td> <td class="black-text desktop-only"><span>3%</span></td>  <td class="black-text"><span>$</span> 100,000</td> <td class="black-text desktop-only"><span>$</span> 100,000</td>    <td class="black-text right-border"><span>$</span> 100,000</td>    </tr>
												<tr>    <td class="left-border">10</td> <td class="black-text desktop-only"><span>3%</span></td> <td class="black-text"><span>$</span> 100,000</td> <td class="black-text desktop-only"><span>$</span> 100,000</td>    <td class="black-text right-border"><span>$</span> 100,000</td>    </tr>
												<tr class="bottom-border">  <td class="left-border">Age 100</td> <td class="black-text desktop-only"><span>4%</span></td> <td class="black-text"><span>$</span> 100,000</td> <td class="black-text desktop-only"><span>$</span> 100,000</td>    <td class="black-text right-border"><span>$</span> 100,000</td>    </tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<!-- Login, create account, Proceed buttons -->
				<div class="fwd-container container-fluid proceed-block text-center clearfix">
					<button type="button" class="btn btn-orange create-account">Create account</button>
					<p>Or, <span class="login" id="login-trigger">Login</span> <span>to proceed</span></p>
					<!-- <button id="made-decision-next-btn" type="button" class="btn btn-orange proceed-btn">Proceed</button> -->
				</div>
				
				<!--Explanation Block-->
				<div class="fwd-container container-fluid reset-padding explanation-block">
					<button class="btn btn-gray explanation-button" type="button" data-toggle="collapse" data-target="#collapseExplanation" aria-expanded="false" aria-controls="collapseExplanation" id="explanation-button">
						Notes
					</button>
					<span class="explanation">Notes:</span>
					<div class="collapse" id="collapseExplanation">
						<ul class="explanation-list">
							<li class="explanation-li">
								<p class="expl-txt">The above is only a summary illustration of the major benefits of your Policy. You should refer to the Company for more information or, if appropriate, a more detailed proposal.</p>
							</li>
							<li class="explanation-li">
								<p class="expl-txt">The Basic Plan Illustration in Section 1 and 2 relates only to your Basic Plan and assumes that all premiums are paid in full when due without exercising skip premium option (premium holiday) and the current scale of charges remain unchanged.</p>
							</li>
							<li class="explanation-li">
								<p class="expl-txt">Death Benefit is equal to the sum of initial sum insured and account value throughout the policy term. Besides Death Benefit, an additional accidental death benefit equivalent to 100% of the Account Value or HK$400,000, whichever is lower, will be offered.</p>
							</li>							
						</ul>
					</div>
				</div>
				
				<a href="#" id="gotop" class="go-top go-top-default"><img src="assets/images/back-to-top.png"></a> 
				<!--Login Modal-->
				<div class="modal fade login-modal" id="planDetailsLoginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false" data-keyboard="false">
					<div class="modal-dialog plan-details">
						<div class="modal-content plan-details">
							<div class="modal-header">
									<button type="button" class="close plan-details" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h4 class="h4-plan-details" id="myModalLabel">Log in to FWD</h4>
							</div>
							<div class="modal-body plan-details">
								<form>
									<div class="form-group">
										<div class="clearfix">
											<div class="pull-left txt">Username</div>
											<div class="pull-right border-bottom ">
												<a title="Forgot Username | FWD Hong Kong" href="https://i.fwd.com.hk/en/forgotUserName" class="link-plan-details">Forgot username?</a>
												</div>
											</div>
											<input class="form-control input-gray" id="planDetailsUsername" type="text" placeholder="Username">
										</div>
										<div class="form-group">
											<div class="clearfix">
												<div class="pull-left txt">Password</div>
												<div class="pull-right"><a title="Forgot Password | FWD Hong Kong" href="https://i.fwd.com.hk/en/forgotPassword" class="border-bottom link-plan-details">Forgot password?</a></div>
											</div>
											<input class="form-control input-gray" id="planDetailsPassword" type="password" placeholder="Password">
										</div>
									</form>
								</div>
								<div class="modal-footers">
									<p class="hidden-md hidden-lg plan-details mobile-txt">For the purpose of purchasing a specified insurance plan through this website (“the Plan”), I hereby consent the transfer of my personal data from FWD eServices to the issuer of the Plan.</p>
									<div class="row">
										<div class="col-md-6 col-sm-12">
											<button type="submit" class="btn btn-white btn-login-plan-details" data-dismiss="modal" id="planDetailsLogin">Log In</button>
										</div>
										<div class="col-md-5 col-sm-12 mobile-register">
											<h6 class="new-member">New Member?</h6>
											<a href="#" data-dismiss="modal" class="register">Register here</a>
										</div>					
									</div>
									<p class="hidden-xs hidden-sm plan-details txt">For the purpose of purchasing a specified insurance plan through this website (“the Plan”), I hereby consent the transfer of my personal data from FWD eServices to the issuer of the Plan.</p>
								</div>
							</div>
						</div>
					</div>
					
				</div>
			</div>
			
			<!-- FOOTER -->
			<%@include file="includes/footer-block.jsp" %>
		</div>
		
		<!-- JS INCLUDES -->
		<%@include file="includes/js-include.jsp" %>
		<script type="text/javascript" src="assets/js/savie/bootstrap-slider.js"></script>
		<script type="text/javascript">
			$(window).bind('scroll', function() {
				stickApplicationOrangeBar();
			});

			$(function() {
				var dob_end_date = new Date();
				dob_end_date.setFullYear(dob_end_date.getFullYear()-18);

				// 70 year ago date
				var dob_start_date = new Date();
				dob_start_date.setFullYear(dob_start_date.getFullYear()-70);
				dob_start_date.setDate(dob_start_date.getDate()+1);

				$('#datePicker').datepicker({
					format: "dd-mm-yyyy",
					startView: "decade",
					startDate: dob_start_date,
					endDate: dob_end_date,
					autoclose: true,
					startView: 2
				});
				$('#see-more-3-years').click(function(){
					$('#after-3-years-div').addClass('hidden');
					$('#after-3-years').removeClass('hidden');
				});

				$(document).on('click','#login-trigger',function(){
					$('#planDetailsLoginModal').modal('show');
				});

				$(document).on('click','.fwd-chart-col button',function(){
					$('.fwd-chart-col button').removeClass('active');
					$(this).addClass('active');
				});

				$(document).on('change','#payment-mode',function(){
					console.log($(this).val());

					if($(this).val()=="regular") {
						$('.regular-payment').removeClass('hidden');
						$('.one-off-premium').addClass('hidden');
						$('#promo').addClass('dob-reg-payment');
						$('#investment-amount').removeClass('one-off');
					}
					else {
						$('.regular-payment').addClass('hidden');
						$('.one-off-premium').removeClass('hidden');
						$('#promo').removeClass('dob-reg-payment');
						$('#investment-amount').addClass('one-off');
					}
				});

				$(".btn-tooltip-clear").tooltip();

				$(document).on('change','#sales-illu-dob',function(){
					if($(this).val()!="" && $('#payment-mode').val()=="regular") {
						$('#total-payment-years').css('display','block');
					}
				});

				$("#payment-button-tooltip").tooltip().on('show.bs.tooltip', function() { 
					setTimeout(function(){
						$("#payment-button-tooltip").next().html('<div class="tooltip-arrow"></div><div class="tooltip-inner"><p class="title">One-off premium</p><p class="content">You may have a one-off premium payment on savie insurance</p><p class="title below">Regular payment</p><p class="content">You may have set up direct debit to pay premium on a monthly basis</p></div>'); 
						var css = $("#payment-button-tooltip").next().attr('style')+"top:-50px;";
						$("#payment-button-tooltip").next().removeAttr('style');
						$("#payment-button-tooltip").next().attr('style',css);
					}, 1);
				});
			});
		</script>
		
	</body>
</html>