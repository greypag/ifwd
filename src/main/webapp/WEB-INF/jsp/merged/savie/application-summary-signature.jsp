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
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#fna-signature-modal">Application Summary Signature</button>

			<div class="modal fade common-welcome-modal" id="fna-signature-modal" tabindex="-1" role="dialog">
			  <div class="modal-dialog">
			    <div class="modal-content">
			    	<button type="button" class="close visible-xs visible-sm" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			    	<h4 class="text-center visible-xs visible-sm">Financial Needs Analysis</h4>
			     	<div id="pdf">
	        			<!--<object id="pdf-object" data="assets/pdf/SavieProposalTemplateEng20150810.pdf" type="application/pdf" width="100%" height="100%" internalinstanceid="10" title="">
	        				<p>It appears you don't have Adobe Reader or PDF support in this web browser. <a href="assets/pdf/SavieProposalTemplateEng20150810.pdf">Click here to download the PDF</a></p>
						</object>-->
						<iframe src="http://docs.google.com/gview?url=http://52.74.209.219:8080/savie-fwd-2016/assets/pdf/SavieProposalTemplateEng20150810.pdf&embedded=true"  frameborder="0"></iframe>
	        		</div>
	        		<div class="text-center">
			     		<button class="btn savie-common-btn disabled-gray-btn" id="review-btn">Review and agree (<span id="timer">8</span>)</button>
			     	</div>	
			    </div>
			  </div>
			</div>
		</div>
		
		<!-- JS INCLUDES -->
		<%@include file="includes/js-include.jsp" %>
		<script type="text/javascript">
			window.onload = function (){
				var pdfFile = $('#pdf-object').attr('data');
				var success = new PDFObject({ url: pdfFile }).embed();
			};
			var sec = 8;
			$('#fna-signature-modal').on('shown.bs.modal', function () {
				var interval = setInterval(function() {
					sec -= 1;
					updateSecond(sec);
				}, 1000);

				function updateSecond(second) {
					if(second == 0) {
						clearInterval(interval);
						$('#review-btn').text('Review and agree').removeClass('disabled-gray-btn');
					}
					$('#timer').text(second);
				}
			});
			
		</script>
		
	</body>
</html>