<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%@include file="includes/head.jsp" %>
  
</head>
<body>
<div class="fwd-savie-wrapper">
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".modal-app-save">Large modal</button>

	<div class="modal fade modal-app-save" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
	  <div class="modal-dialog" id="modal-save-app">
		<div class="modal-content modal-content-appsave common-welcome-modal">	
			 <div class="modal-header" id="modal-header-appsave">
			 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<p class="text-center">Your application has been saved. </p>
			 </div>
			 <div class="modal-body" id="moda-body-appsave">
				<p class="text-center">A saved application email has been sent to you, you may continue the application through 
				the application link embedded in the email or you may retrieve your progress from your eService 
				purchase history. </p>
				<div class="btn-appsave">
					<button href="#" class="center-block btn savie-common-btn" id="btn-app-save">Back to home</button>
				</div>
			 </div>
		 </div>
	  </div>
	</div>
 </div>
 
	
	<%@include file="includes/js-include.jsp" %>
</body>
</html>