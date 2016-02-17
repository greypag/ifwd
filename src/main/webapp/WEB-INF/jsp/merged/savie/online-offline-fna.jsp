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
		<div class="fwd-savie-wrapper">			
	
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#offline-online-modal">Online Offline Modal</button>

			<div class="modal fade common-welcome-modal" id="offline-online-modal" tabindex="-1" role="dialog">
			  <div class="modal-dialog">
			    <div class="modal-content">
			    	<div class="row">
			    		<div class="col-xs-2 col-md-1 numbering-holder">
			    			<img src="assets/images/savie-2016/dk-numbering.png" class="visible-md visible-lg" />
			    			<img src="assets/images/savie-2016/mb-numbering.png" class="visible-xs visible-sm" />
			    		</div>
			    		<div class="col-xs-10 col-md-10" id="steps-holder">
			    			<h4 class="text-center">Thank you for your interest on this product</h4>
			    			<div id="step-1" class="step">
			    				<div class="media">
			    					<div class="media-left" id="step1-img-holder">
			    						 <img class="media-object" src="assets/images/savie-2016/book-icon.png" />
			    					</div>
			    					<div class="media-body">
			    						<p class="procedure">According to the Hong Kong Federation of Insurers’ guidelines, insurance companies should carry out Financial Need Analysis(FNA) before selling insurance products. Our professional Customer Service Representatives will provide suitable product options for your comparison after FNA.</p>
			    					</div>
			    				</div>
			    			</div>
			    			<div id="step-2" class="step">
			    				<div class="media">
			    					<div class="media-left" id="step2-img-holder">
			    						  <img class="media-object" src="assets/images/savie-2016/note-icon.png" />
			    					</div>
			    					<div class="media-body">
			    						<p class="procedure">Once FNA and the product comparison confirmed Savie is suitable for you, you may begin the application process immediately at the customer service centre.</p>
			    					</div>
			    				</div>
			    			</div>
			    			<div class="row" id="on-of-holder">
			    				<div class="col-md-6 col-xs-12" id="step-online">
			    					<div class="step">
					    				<div class="media">
					    					<div class="media-left" id="stepon-img-holder">
					    						 <img class="media-object" src="assets/images/savie-2016/pc-icon.png" />
					    					</div>
					    					<div class="media-body">
					    						<p class="procedure"><span class="bold-head">Online procedure</span> <span class="hidden-dash">-</span><br class="visible-md visible-lg" />  You may proceed both FNA and application on this platform, you may take your time to fill in the information, we provide a “Save for later” function available at the application section, you may save your application progress and come back to complete later. </p>
					    						<button class="btn savie-common-btn" id="online-application-btn">Online application</button>
					    					</div>
					    				</div>
			    					</div>
			    				</div>
			    				<div class="or-word">
			    					<div id="or-mobile"><img src="assets/images/savie-2016/or-mobile.png" />
			    					</div>
			    				</div>
			    				<div class="col-md-6 col-xs-12" id="step-offline">
			    					<div class="step">
					    				<div class="media">
					    					<div class="media-left">
					    						 <img class="media-object" src="assets/images/savie-2016/clockfold-icon.png" />
					    					</div>
					    					<div class="media-body">
					    						<p class="procedure"><span class="bold-head">Offline procedure</span> <span class="hidden-dash">-</span><br class="visible-md visible-lg" /> To maintain a high service quality standard, the FNA and application process (if applicable) will take about 30 to 45 minutes. Please choose your preferred timeslot and customer service centre for the appointment. </p>
					    						<button class="btn savie-common-btn" id="offline-application-btn">Offline application</button>
					    					</div>
					    				</div>
			    					</div>
			    				</div>
			    			</div>
			    		</div>
			    	</div>
			    </div>
			  </div>
			</div>

		</div>
		
		<!-- JS INCLUDES -->
		<%@include file="includes/js-include.jsp" %>
		<script type="text/javascript">
			var language = "en";
		</script>
		
	</body>
</html>