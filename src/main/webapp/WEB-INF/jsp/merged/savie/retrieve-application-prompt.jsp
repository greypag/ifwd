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
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#retrieve-application-modal">Retrieve Application Modal</button>

			<div class="modal fade common-welcome-modal" id="retrieve-application-modal" tabindex="-1" role="dialog">
			  <div class="modal-dialog">
			    <div class="modal-content">
			    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			     	<h4 class="text-center welcome-msg">Welcome back! Chan Tai Man</h4>
			     	<p class="text-center description-msg">Do you want to resume your application or start over?</p>
			     	<center><button class="btn savie-common-btn" id="resume-btn">Resume</button><button class="btn savie-common-btn disabled-gray-btn" id="start-over-btn">Start over</button></center>
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