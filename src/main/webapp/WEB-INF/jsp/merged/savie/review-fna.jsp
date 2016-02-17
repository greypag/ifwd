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
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#review-fna-modal">Review FNA Modal</button>

			<div class="modal fade common-welcome-modal" id="review-fna-modal" tabindex="-1" role="dialog">
			  <div class="modal-dialog">
			    <div class="modal-content">
			    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			     	<h4 class="text-center welcome-msg">Welcome back! Chan Tai Man</h4>
			     	<p class="text-center description-msg">You have already completed a Financial Needs Analysis previously, you may review and edit your FNA for an updated Product Recommendation.</p>
			     	<center><button class="btn savie-common-btn" id="review-fna-btn">Review FNA</button></center>
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