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
			<!-- HEADER -->
			<%@include file="includes/header-block.jsp" %>
			
			<div id="savie-online">
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#save-and-continue-modal">Save and Continue Modal</button>

				<div class="modal fade common-welcome-modal" id="save-and-continue-modal" tabindex="-1" role="dialog">
				  <div class="modal-dialog">
					<div class="modal-content save-con-modal-content">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
						<h4 class="text-center welcome-msg">Would you like to save your application and continue later?</h4>
						<p class="text-center description-msg">You may save your application progress up to (previous page). You will receive an email with a link of your saved application progress, you may continue the application within 30 days.</p>
						<div class="save-con-btns clearfix">
							<button class="btn savie-common-btn save-exit-btn1 col-sm-6 col-xs-6 col-lg-6 col-md-6">Keep going</button>
							<button class="btn savie-common-btn save-exit-btn2 col-sm-6 col-xs-6 col-lg-6 col-md-6">Save and exit</button>
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
		<script src="assets/js/savie-online.js"></script>
		<script type="text/javascript">
			var language = "en";
		</script>
		
	</body>
</html>