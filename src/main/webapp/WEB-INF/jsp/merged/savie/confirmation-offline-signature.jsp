<%@page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta name="apple-mobile-web-app-capable" content="yes" />
	</head>
	<body>
		<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps">
			<!-- HEADER -->
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
                         <ul class="common-steps-list five-steps nav nav-pills">
                             <li class="step-number" id="first-step"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Select plan</button></li>
                            <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
                            <li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Application &amp; Payment</button></li>
                            <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
                            <li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Summary &amp; Declaration</button></li>
                            <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
                            <li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Signature</button></li>
                            <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
                            <li class="step-number" id="last-steps"><button type="button" class="et-header-info-btn active"><span class="status">5</span>Confirmation</button></li>
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
	                     <p id="step-of">5 of 5</p>
                      </div>
                   </div>
                </div>
             </div>
             <div class="container-fluid fwd-full-container mobile-step-indicator visible-xs visible-sm">
                <div class="step-indicator-container clearfix">
                    <ul class="common-step-indicator five-steps nav nav-pills">
                         <li id="first-step"><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
                         <li><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
                         <li><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
                         <li><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
                         <li id="last-step"><a href="#" class="active"><span class="step-no">5</span></a></li>
                    </ul>
                    <div class="step-line"></div>
                </div>
            </div>
			<div class="container-fluid fwd-full-container headerStick">
				<div class="fwd-container-limit clearfix sidebar">
					<div id="offline-signature-confirmation-page">
						<div class="row policy-number-panel">
							<div class="col-xs-12 cstm-md-col-1"><p class="panel-title">Thank you for signing up with us</p></div>
							<div class="col-xs-12 visible-xs visible-sm policy-number-wrapper">
								<span class="policy-number-label">Policy no. </span>
								<span class="policy-number">${eliteTermPolicy.policyNo }</span>
							</div>
							<div class="col-xs-12 cstm-md-col-2">
								<p>Your application is being processed.</p>
								<p id="review-line">Please review the confirmation of your application as detailed here.</p>
							</div>
							<div class="col-md-3 cstm-md-col-3 hidden-xs hidden-sm">
								<p class="policy-number-label">Policy no.</p>
								<p class="policy-number">${eliteTermPolicy.policyNo }</p>
							</div>
						</div>
						<hr>
						<div class="row appointment-details-panel">
							<div class="col-xs-12"><p class="panel-title">Appointment details</p></div>
							<div class="col-xs-12 cstm-md-col-1">
								<div>
									<p class="details-label">Date</p>
									<p>09-06-2015</p>
								</div>
								<div>
									<p class="details-label">Time</p>
									<p>10:30am</p>
								</div>
							</div>
							<div class="col-xs-12 cstm-md-col-2">
								<p class="details-label">Branch</p>
								<p>Sheung Wan<span class="branch-address">1/F, FWD Financial Centre, 308 Des<br>Voeux Road Central, Sheung Wan</span></p>
							</div>
							<div class="col-xs-12 cstm-md-col-3">
								<p class="details-label">Operating hours</p>
								<p>
									Mon - Sat 8:30am to 8:00pm<br>Closed on Sun & Public Holidays
									<span class="phone-num">
										<span class="glyphicon glyphicon-earphone" aria-hidden="true"></span> 063-2323-123
									</span>
								</p>
							</div>
							<div class="col-xs-12">
								<div class="appointment-details-note">
									<p>In order to complete your application, please visit the Customer Service Center at the appointment details.</p>
									<p>You are required to fulfilled your payment within <b>30 days.</b> </p>
									<p>The application will automatically expire if we have not received your payment within this time.</p>
								</div>
							</div>
						</div>
						<hr>
						<div class="requirements-panel">
							<p class="requirements-panel-title visible-xs visible-sm">Please bring the following for your appointment at our service centre:</p>
							<p class="requirements-panel-title hidden-xs hidden-sm">Offline procedure</p>

							<div class="row requirements-list">
								<div class="col-xs-12 col-md-6">
									<div class="requirment-img-wrapper"><img src="<%=request.getContextPath()%>/resources/images/savie-2016/customer-service-center.png" /></div>
									<div class="requirement-text-wrapper">
										<p>Visit the selected Customer Service Center at the appointed time above.<br>
									</div>
								</div>
								<hr class="visible-xs visible-sm">
								<div class="col-xs-12 col-md-6">
									<div class="requirment-img-wrapper"><img src="<%=request.getContextPath()%>/resources/images/savie-2016/hkid-proof-of-address.png" /></div>
									<div class="requirement-text-wrapper"><p>Please bring along a copy of your HKID, pass-port, proof of address and policy number</p></div>
								</div>
							</div>
							
							<!--<p class="note">In order to enjoy Ocean Park premium discount, please bring along your Ocean Park SmartFun Annual Pass (Gold or Silver) or purchase confirmation email for verification purpose.</p>-->
						</div>
						<hr>
						<!--<a href="#" class="visible-md visible-lg print-doc-link">
							<img src="<%=request.getContextPath()%>/resources/images/savie-2016/print-icon.png" />&nbsp;&nbsp;&nbsp;
							<span>Print this document</span>
						</a>-->
						<center><button type="button" class="btn btn-home savie-common-btn">Back to home</button></center>
					</div>
				</div>
			</div>
			<!-- FOOTER -->
		</div>			
		
		<!-- JS INCLUDES -->
		<script type="text/javascript">
			var language = "en";
		</script>
	</body>
</html>