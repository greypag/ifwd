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
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#sales-illustration-modal">Sales Illustration Lightbox</button>

			<div class="modal fade common-welcome-modal" id="sales-illustration-modal" tabindex="-1" role="dialog">
			  <div class="modal-dialog">
			    <div class="modal-content">
			    	<button type="button" class="close visible-xs visible-sm" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			     	<div id="pdf">
						<iframe src="http://docs.google.com/gview?url=http://52.74.209.219:8080/savie-fwd-2016/assets/pdf/SavieProposalTemplateEng20150810.pdf&embedded=true"  frameborder="0"></iframe>
	        		</div>
	        		<div class="text-center">
			     		<button class="btn savie-common-btn" data-dismiss="modal" id="close-btn">Close</button>
			     	</div>	
			    </div>
			  </div>
			</div>
		</div>
		
		<!-- JS INCLUDES -->
		<%@include file="includes/js-include.jsp" %>
		<script type="text/javascript">
			
		</script>
		
	</body>
</html>