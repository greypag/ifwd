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
								<span class="current">Confirmation</span>
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
			                      <button type="button" class="et-header-info-btn et-bind-btn-header" id="select-plan" data-et-section-target="et-select-plan-section">Plan details</button>
			                    </div>
			                    <div class="col-md-4 reset-padding">
			                      <button type="button" class="et-header-info-btn et-bind-btn-header" id="application" data-et-section-target="et-application-section">Make an appointment</button>
			                    </div>
			                    <div class="col-md-4 reset-padding">
			                      <button type="button" class="et-header-info-btn et-bind-btn-header active" id="payment" data-et-section-target="et-dec-sign-section">Confirmation</button>
			                    </div>
			              	</div>
			            </div>
					</div>
				</div>
			</div>
			
			<div class="application-flux">
				<div class="container-fluid fwd-container thank-you-container savie-regular-confirmation">
					<ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs hidden-sm hidden-xs">
		               <li><a href="#">Save</a></li>
		               <li class="divider"><i class="fa fa-play"></i></li>
		               <li><a href="#">Save Insurance Plan </a></li>
		               <li class="divider last"><i class="fa fa-play"></i></li>
		               <li class="active-bc" id="et-active-bc-menu">Confirmation</li>
		            </ol>
					<h1>You have You have <span>successfully registered!</span></h1>				
					<div class="details-container details-full" id="printable-area">
						<div class="row">
							<div class="col-xs-12">
								<h2 class="bring-things"><span class="hidden-md hidden-lg">Things to bring</span><span class="hidden-xs hidden-sm">Offline procedure</span></h2>
								<div class="gray-divider hidden-md hidden-lg"></div>
								<div class="row offline-procedure-row">
									<div class="col-xs-12 col-md-4">
										<div class="offline-procedure text-center">
											<span class="step">1</span>
											<p>Your HKID card</p>
											<p class="small-text">and passport (for non-permanent resident only)</p>
											<div class="icon"><img src="assets/images/savie-regular/confirmation-1.png" class="img-responsive" /></div>
										</div>
									</div>
									<div class="col-xs-12 col-md-4">
										<div class="offline-procedure text-center">
											<span class="step">2</span>
											<p class="hidden-md hidden-lg">A valid address proof within the last 3 months. Click <a href="#">here</a> for details.
											</p>
											<p class="hidden-xs hidden-sm">Bring address proof</p>
											<div class="icon below"><img src="assets/images/savie-regular/confirmation-2.png" class="img-responsive" /></div>
										</div>
									</div>
									<div class="col-xs-12 col-md-4">
										<div class="offline-procedure procedure-3 text-center">
											<span class="step">3</span>
											<p class="hidden-md hidden-lg">Applicant's bank information to set up direct debit authorization</p>
											<p class="small-text hidden-xs hidden-sm">Applicant's bank information to set up direct debit authorization</p>
											<div class="icon below"><img src="assets/images/savie-regular/confirmation-3.png" class="img-responsive" /></div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-12">
								<h2 class="what-next"><span class="hidden-md hidden-lg">What happens next</span>
									<span class="hidden-xs hidden-sm">What is next?</span>
								</h2>
								<div class="gray-divider hidden-md hidden-lg"></div>
								<div class="whats-next">
									<ol>	
										<li>You will receive a confirmation email from us regarding your appointment details.</li>
										<li>Visit the selected Customer Service Centre at the scheduled date and time.</li>
										<li>Bring along the required documents for the application purpose.</li>
										<li>We accept bank direct debit for regular monthly premium payments. You can decide how much lump sum premium to apply during the application process.</li>
									</ol>
								</div>
							</div>
							<div class="col-xs-12">
								<div class="detail">
									<h2>Appointment details</h2>
									<div class="gray-divider hidden-md hidden-lg"></div>
									<div class="appointment-detail-holder">
										<div class="appointment-detail clearfix">
											<label class="pull-left">Date</label>
											<span class="pull-left">30-10-2015</span>
										</div>
										<div class="appointment-detail clearfix">
											<label class="pull-left">Time</label>
											<span class="pull-left">10:30am</span>
										</div>
										<div class="appointment-detail clearfix">
											<label class="pull-left">Branch</label>
											<span class="pull-left">Sheung Wan</span>
										</div>
										<div class="appointment-detail clearfix">
											<label class="pull-left">Address</label>
											<span class="pull-left">1/F, FWD Financial Centre, 308 Des Voeux Road Central, Sheung Wan</span>
										</div>
										<div class="appointment-detail clearfix">
											<label class="pull-left">Reference no.</label>
											<span class="pull-left">DVCAAS001010</span>
										</div>
										<div class="appointment-detail clearfix">
											<label class="pull-left">Phone no.</label>
											<span class="pull-left">063-2323-123</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-12 print-document hidden-xs hidden-sm">
								<a href="" id="print-this-page"><img src="assets/images/savie/print-logo.png" class="img-responsive" />Print this document</a>
							</div>
						</div>
					</div>
					
					<!-- <div class="share-container text-center">
						<p>Follow us</p>
						<div class="clearfix">
							<a href="#"><i class="fa fa-facebook"></i></a>
							<a href="#"><i class="fa fa-twitter"></i></a>
							<a href="#"><i class="fa fa-google-plus"></i></a>
						</div>
					</div> -->
					
					<button id="back-home-btn" type="button" class="btn next">Back to home</button>
				</div>
			</div>
			
			<!-- FOOTER -->
			<%@include file="includes/footer-block.jsp" %>
		</div>
		
		<!-- JS INCLUDES -->
		<%@include file="includes/js-include.jsp" %>
		<script type="text/javascript">
			$(function() {
				$('#print-this-page').click(function(){
					w=window.open();
					w.document.write($('#printable-area').html());
					w.print();
					w.close();
				});
				
			});

			$(window).bind('scroll', function() {
				stickApplicationOrangeBar();
			});
		</script>
		
	</body>
</html>