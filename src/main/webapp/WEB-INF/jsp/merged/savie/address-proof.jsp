<!DOCTYPE html>
<html lang="en">
<head>
 
  <%@include file="includes/head.jsp" %>
  
</head>
<body>
<div class="fwd-savie-wrapper">
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".modal-address-prof">Large modal</button>

	<div class="modal fade modal-address-prof" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
	  <div class="modal-dialog" id="dialog-address-prof">
		<div class="modal-content common-welcome-modal" id="modal-content-addressprof">	
			 <div class="modal-header">
			 <button type="button" class="close" id="close-address-prof" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<p>Address proof</p>
			 </div>
			 <div class="modal-body" id="modal-body-addressprof">
				<ol>
					  <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus nec felis ipsum. Vivamus nec dolor vitae neque 
					  maximus elementum ut ac ex.</li>
					  <li>Vivamus porta nisl vitae metus aliquet, id tempus mi egestas. Nulla in felis enim. Nam augue enim, accumsan nec 
					  tortor et, pellentesque mollis elit. Nunc tempor nisi eu metus sodales dictum. Nunc non ligula commodo est gravida ornare. 
					  In molestie mattis magna at dictum. Mauris vel urna lacus.</li>
					  <li id="thrid-li">Vestibulum et libero justo. Etiam nisl ex, fringilla vel ultricies et, dignissim viverra purus. Nulla at felis luctus, 
					  sodales diam ac, congue urna. Phasellus ac malesuada enim, eget condimentum lacus. Fusce ut ex erat. Etiam ut lobortis elit,
					  vel commodo risus. </li>
					</ol>
			 </div>
		 </div>
	  </div>
	</div>
 </div>
 
	
	<%@include file="includes/js-include.jsp" %>
</body>
</html>