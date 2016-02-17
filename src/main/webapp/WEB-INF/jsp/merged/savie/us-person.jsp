<!DOCTYPE html>
<html lang="en">
<head>
 
  <%@include file="includes/head.jsp" %>
  
</head>
<body>
<div class="fwd-savie-wrapper">
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".modal-us-person">Large modal</button>

	<div class="modal fade modal-us-person" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
	  <div class="modal-dialog" id="dialog-us-person">
		<div class="modal-content common-welcome-modal" id="modal-content-usperson">	
			 <div class="modal-header">
			 <button type="button" class="close" id="close-usopen" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					
			 </div>
			 <div class="modal-body" id="modal-body-usperson">
				<p> A United States person, being a U.S. citizen, U.S. resident for U.S. 
				federal income tax purposes or U.S. Resident Alien 
				</p>
				<span>(i.e. a so-called U.S. green card holder).</span>
			 </div>
		 </div>
	  </div>
	</div>
 </div>
 
	
	<%@include file="includes/js-include.jsp" %>
</body>
</html>