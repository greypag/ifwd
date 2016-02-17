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
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#application-after-days">Application After 30 days Modal</button>

			<div class="modal fade common-welcome-modal" id="application-after-days" tabindex="-1" role="dialog">
			  <div class="modal-dialog">
			    <div class="modal-content">
			    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			     	<p class="text-center description-msg">The application must be completed within 30 days upon submission. The application has been expired. For any enquiry, please contact our 24-hour customer service hotline 3123-3123.</p>
			     	<center><button class="btn savie-common-btn" id="back-to-home-btn">Back to home</button></center>
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