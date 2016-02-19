<!DOCTYPE html>
<html lang="en">
<head>
 
  <%@include file="includes/head.jsp" %>
  
</head>
<body>
<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
	<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps headerStick" id="signature-offline">
	<!-- HEADER -->
		<%@include file="includes/header-block.jsp" %>
		 <div class="fwd-container container-fluid breadcrumbs">
			<div class="breadcrumb-container">
			   <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
				   <li><a href="#">Home</a></li>
				   <li class="divider"><i class="fa fa-play"></i></li>
				   <li><a href="#">Save </a></li>
				   <li class="divider"><i class="fa fa-play"></i></li>
				   <li><a href="#">Savie </a></li>
				   <li class="divider last"><i class="fa fa-play"></i></i></li>
				   <li class="active-bc" id="et-active-bc-menu">Application</li>
			   </ol>
			</div>
		 </div>
		 <!-- STEPS -->
		 <div class="container-fluid fwd-full-container browse-holder">
			<div class="application-page-header et-header-browse">
			   <div class="browse-container">
				  <div class="row reset-margin hidden-xs hidden-sm">
					 <ul class="common-steps-list six-steps nav nav-pills">
						<li class="step-number" id="first-step"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Select plan</button></li>
						<li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
						<li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Application &amp; Payment</button></li>
						<li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
						<li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Summary &amp; Declaration</button></li>
						<li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
						<li class="step-number"><button type="button" class="et-header-info-btn active"><span class="status">4</span>Signature</button></li>
						<li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
						<li class="step-number" id="last-steps"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">5</span>Document upload</button></li>
						<li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
						<li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">6</span>Confirmation</button></li>
					 </ul>
				 </div>
			   </div>  
			   <div class="et-mobile-header-info hidden-md hidden-lg">
				  <div class="clearfix">
					 <div class="et-back-arrow">
						<a href="#" class="back-arrow-link">
						   <span class="icon-arrow-left2 arrow-left"></span>
						</a>
					 </div>
					 <div class="et-header-tex">
						<h3 id="">Signature</h3>
					 </div>
				  </div>
				  <span id="step-of">4 out of 5</span>
			   </div>
			</div>
		 </div>
		 <div class="container-fluid fwd-full-container mobile-step-indicator visible-xs visible-sm">
			<div class="step-indicator-container clearfix">
				<ul class="common-step-indicator six-steps nav nav-pills">
					 <li id="first-step"><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
					 <li><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
					 <li><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
					 <li><a href="#" class="active"><span class="step-no">4</span></a></li>
					 <li><a href="#"><span class="step-no">5</span></a></li>
					  <li id="last-step"><a href="#"><span class="step-no">6</span></a></li>
				</ul>
				<div class="step-line"></div>
			</div>
		</div>
		<div class="container-fluid fwd-full-container  headerStick" id="container-signatureoffline">
			<div class="fwd-container-limit clearfix sidebar" id="fwd-container-signatureoffline">
				<p>Please review and confirm to accept the
				documents shown below:</p>
				<div class="form-signatureoffline-info">
					<div class="radio-group clearfix">
						 <div class="radio-button-group">
							  <div class="clearfix">
								 <div class="pull-left radio-holder">
									<input type="radio" id="digi-radio" name="sign-radio" checked /> <label for="digi-radio"></label>
								 </div>
								 <div class="pull-left desc" id="id-digi-sign">
									Digital signature
									 <span>Use your mouse or finger to sign the document</span>
								 </div>
							  </div>
							  <div class="clearfix" id="id-offline-signature">
								 <div class="pull-left radio-holder">
									<input type="radio" id="off-radio" name="sign-radio" /> <label for="off-radio"></label>
								 </div>
								 <div class="pull-left desc" id="id-off-sign">
									Offline signature
									 <span>Refer to customer service and sign documents there</span>
								 </div>
							  </div>
						</div>
					</div>
				</div>
				<!-- Digital Signature -->
				<form id="table-info" class="clearfix">
					<p class="table-info-p">Please review the signature below to make sure all signature is correct</p>
					<table class="table table-bordered table-hover">
						<tbody>
						  <tr>
							<td class="numbers">1</td>
							<td class="adjust-body-content">Financial
								Needs Analysis</td>
							<td id="signature-status-1" class="savie-status">
								<button class="btn savie-common-btn btn-table-savie" data-toggle="modal" data-target="#fna-signature-modal">Review now</button>
								<p class="table-desc-p p-status hidden" id="id-review">Reviewed <span class="signed-hidden-desktop">and signed</span></p>
							</td>
						  </tr>
						  <tr>
							<td class="numbers">2</td>
							<td  class="adjust-body-content">Sales illustration</td>
							<td id="signature-status-2" class="savie-status">
								<p class="table-desc-p pending">Pending review</p>
								<button class="btn savie-common-btn btn-table-savie hidden" data-toggle="modal" data-target="#sales-signature-modal">Review now</button>
								<p class="table-desc-p p-status hidden">Reviewed <span class="signed-hidden-desktop">and signed</span></p>
							</td>
						  </tr>
						  <tr>
							<td class="numbers">3</td>
							<td class="adjust-body-content">Policy replacement &amp; application form</td>
							<td id="signature-status-3" class="savie-status">
								<p class="table-desc-p pending">Pending review</p>
								<button class="btn savie-common-btn btn-table-savie hidden" data-toggle="modal" data-target="#policy-signature-modal">Review now</button>
								<p class="table-desc-p p-status hidden">Reviewed <span class="signed-hidden-desktop">and signed</span></p>
							</td>
						  </tr>
						</tbody>
					</table>
					<div class="col-xs-12" id="desktop-position-btn">
						  <div class="text-center clearfix">
							<button class="btn savie-common-btn disabled-gray-btn" type="button" id="btn-acctps-sign">Accept and sign</button>
							<a href="#" class="span-save-continue">
								<span>Save and continue later</span>
							</a>
						 </div>
					</div>
				</form>
				<!-- Offline Signature -->
				<form class="form-signatureoffline-info hidden" id="signoff-table">
					<div id="choose-service-centre">
						<div class="row">
							<h5>Please choose service centre</h5>
							<div class="col-xs-12 col-md-6" id="left-side-form">
								<div class="selectDiv">
								  <span class="icon-chevron-thin-down orange-caret"></span>
								   <select name="csid" id="csid" class="form-control gray-dropdown">
									   <option value="" disabled selected>Customer Service Centre</option>
									   <option value="1">Tsim Sha Tsui</option>
									   <option value="2">Quarry Bay</option>
									   <option value="3">Sheung Wan</option>
									   <option value="4">Kwun Tong</option>
									   <option value="5">Shatin</option>
									</select>
									<img src="assets/images/orange-caret.png" class="orange-caret-bg">
							   </div>
							   <div class="centre-info visible-xs visible-sm" id="centre-info">
									<img src="assets/images/savie-2016/timshatsui.jpg" class="img-centre img-responsive"><h4>Address</h4><p class="centre-address">G/F, Fontaine Building, 18 Mody Road, Tsim Sha Tsui</p>
									<a class="viewmap-link" href="#">View map</a>
							   </div>
							   <div id="date" class="selectDiv preferred-date gray-text-bg">
									<input type="text" class="date preferred-date" name="preferred-date" id="preferred-date" value="Date" readonly="">
									<img src="assets/images/orange-caret.png" class="orange-caret-bg">
								</div>
								<div id="time" class="selectDiv timeslot gray-text-bg">
									<input type="text" name="preferred-time" id="preferred-time" value="Time" class="time preferred-time" autocomplete="off">
									<img src="assets/images/orange-caret.png" class="orange-caret-bg">
								</div>
								<p id="confirm-call">Appointment can be made up to 20 days in advance.</p>
							</div>
							<div class="col-xs-12 col-md-6" id="right-side-form">
								<div class="centre-info visible-md visible-lg" id="centre-info">
									<img src="assets/images/savie-2016/timshatsui.jpg" class="img-centre img-responsive"><h4>Address</h4><p class="centre-address">G/F, Fontaine Building, 18 Mody Road, Tsim Sha Tsui</p>
									<a class="viewmap-link" href="#">View map</a>
								 </div>
							</div>
							<div class="col-xs-12" id="desktop-position-btn">
								<div class="text-center clearfix" id="btn-srv-center">
									<button class="btn savie-common-btn" type="button" id="btn-cstmr-srvc-cnter">Next</button>
								 </div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- FOOTER -->
		<%@include file="includes/footer-block.jsp" %>
	</div>
 </div>
 <!-- Signature light box -->
 <div id="signature-box-1" class="signature-box modal fade" role="dialog" aria-labelledby="signaturebox" aria-hidden="true" style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			  <div class="modal-header">
				 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
				 <p class="modal-title visible-xs visible-sm">Signature</p>
			  </div>
			  <div class="modal-body">
				<p class="modal-title hidden-xs hidden-sm">Signature</p>
				 <p>Please sign in the grey area</p>
				 <form action="">
					<div class="signature-parent">
						<div id="signature-1" class="signature-img so-signature"></div>
					</div>
					<div class="clearfix">
						<a id="link-clear-1" class="pull-left link-clear">Clear</a>
						<div class="pull-right">
							<div id="correct-signature-1" class="correct-signature hidden">
								<img src="assets/images/elite-terms/correct-signature.png" />
								<span>Correct Signature</span>
							</div>
							<p class="text-right">Signed in Hong Kong.</p>
						</div>
					</div>
					<center>
						<button class="btn savie-common-btn btn-confirm disabled-gray-btn" id="btn-confirm-1">Confirm</button>
					</center>
				 </form>
			  </div>
		</div>
	</div>
</div>
<!-- FNA light box -->
<div class="modal fade common-welcome-modal signature-offline-modal" id="fna-signature-modal" tabindex="-1" role="dialog">
  <div class="modal-dialog">
	<div class="modal-content">
		<button type="button" class="close visible-xs visible-sm" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
		<h4 class="text-center visible-xs visible-sm">Financial Needs Analysis</h4>
		<div class="pdf">
			<!--<object id="pdf-object" data="assets/pdf/SavieProposalTemplateEng20150810.pdf" type="application/pdf" width="100%" height="100%" internalinstanceid="10" title="">
				<p>It appears you don't have Adobe Reader or PDF support in this web browser. <a href="assets/pdf/SavieProposalTemplateEng20150810.pdf">Click here to download the PDF</a></p>
			</object>-->
			<iframe src="http://docs.google.com/gview?url=http://52.74.209.219:8080/savie-fwd-2016/assets/pdf/SavieProposalTemplateEng20150810.pdf&embedded=true"  frameborder="0"></iframe>
		</div>
		<div class="text-center">
			<button class="btn savie-common-btn disabled-gray-btn review-btn" id="review-btn-1">Review and agree (<span id="timer-1">8</span>)</button>
		</div>	
	</div>
  </div>
</div>
<!-- Sales Illustration light box -->
<div class="modal fade common-welcome-modal signature-offline-modal" id="sales-signature-modal" tabindex="-1" role="dialog">
  <div class="modal-dialog">
	<div class="modal-content">
		<button type="button" class="close visible-xs visible-sm" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
		<h4 class="text-center visible-xs visible-sm">Sales illustration</h4>
		<div class="pdf">
			<!--<object id="pdf-object" data="assets/pdf/SavieProposalTemplateEng20150810.pdf" type="application/pdf" width="100%" height="100%" internalinstanceid="10" title="">
				<p>It appears you don't have Adobe Reader or PDF support in this web browser. <a href="assets/pdf/SavieProposalTemplateEng20150810.pdf">Click here to download the PDF</a></p>
			</object>-->
			<iframe src="http://docs.google.com/gview?url=http://52.74.209.219:8080/savie-fwd-2016/assets/pdf/SavieProposalTemplateEng20150810.pdf&embedded=true"  frameborder="0"></iframe>
		</div>
		<div class="text-center">
			<button class="btn savie-common-btn disabled-gray-btn review-btn" id="review-btn-2">Review and agree (<span id="timer-2">8</span>)</button>
		</div>	
	</div>
  </div>
</div>
<!-- Policy light box -->
<div class="modal fade common-welcome-modal signature-offline-modal" id="policy-signature-modal" tabindex="-1" role="dialog">
  <div class="modal-dialog">
	<div class="modal-content">
		<button type="button" class="close visible-xs visible-sm" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
		<h4 class="text-center visible-xs visible-sm">Policy replacement &amp; application form</h4>
		<div class="pdf">
			<!--<object id="pdf-object" data="assets/pdf/SavieProposalTemplateEng20150810.pdf" type="application/pdf" width="100%" height="100%" internalinstanceid="10" title="">
				<p>It appears you don't have Adobe Reader or PDF support in this web browser. <a href="assets/pdf/SavieProposalTemplateEng20150810.pdf">Click here to download the PDF</a></p>
			</object>-->
			<iframe src="http://docs.google.com/gview?url=http://52.74.209.219:8080/savie-fwd-2016/assets/pdf/SavieProposalTemplateEng20150810.pdf&embedded=true"  frameborder="0"></iframe>
		</div>
		<div class="text-center">
			<button class="btn savie-common-btn disabled-gray-btn review-btn" id="review-btn-3">Review and agree (<span id="timer-3">8</span>)</button>
		</div>	
	</div>
  </div>
</div>

	<%@include file="includes/js-include.jsp" %>
	<script type="text/javascript">
		var language = "en";

		$('#digi-radio').click(function () {
			if ($(this).is(':checked')) {
				$('#table-info').removeClass('hidden');
				$('#signoff-table').addClass('hidden');
			}
		});
		$('#off-radio').click(function () {
			if ($(this).is(':checked')) {
				$('#signoff-table').removeClass('hidden');
				$('#table-info').addClass('hidden');
			}
		});
		
		$('#preferred-date').datepicker({
			format: "mm-dd-yyyy",
			//format: 'yy-mm-dd',
			container: "#date",
			startDate: new Date(),
			autoclose: true
		 });
		 $('#preferred-time').timepicker({
			appendTo: '.timeslot',
			timeFormat: 'H:i',
		 });
			 
		 var img1 = "assets/images/savie-2016/timshatsui.jpg";
         var img2 = "assets/images/savie-2016/quarry_bay.jpg";
         var img3 = "assets/images/savie-2016/sheung_wan.jpg";
         var img4 = "assets/images/savie-2016/kwuntong.jpg";
         var img5 = "assets/images/savie-2016/shatin.jpg";
         var addr1 = "G/F, Fontaine Building, 18 Mody Road, Tsim Sha Tsui";
         var addr2 = "13/F, Devon House, Taikoo Place, 979 King's Road, Quarry Bay";
         var addr3 = "1/F, FWD Financial Centre, 308 Des Voeux Road Central, Sheung Wan";
         var addr4 = "Office E, 12/F, Legend Tower, No.7 Shing Yip Street, Kwun Tong";
         var addr5 = "Unit 1720 -21, Level 17, Tower II, Grand Central Plaza, Shatin";
         var map1 = "#";
         var map2 = "#";
         var map3 = "#";
         var map4 = "#";
         var map5 = "#"; 
        
         var centre = $('#csid option:selected').val();
       
         $('#csid').on('change', function() {
            var centre = $('#csid option:selected').val();
            if(centre == 1) {
               $('.centre-info').html('<img src="'+img1+'" class="img-centre img-responsive" /><h4>Address</h4><p class="centre-address">'+addr1+'</p><a class="viewmap-link" href="'+map1+'">View map</a>');
            }
            if(centre == 2) {
              $('.centre-info').html('<img src="'+img2+'" class="img-centre img-responsive" /><h4>Address</h4><p class="centre-address">'+addr2+'</p><a class="viewmap-link" href="'+map2+'">View map</a>');
            }
            if(centre == 3) {
              $('.centre-info').html('<img src="'+img3+'" class="img-centre img-responsive" /><h4>Address</h4><p class="centre-address">'+addr3+'</p><a class="viewmap-link" href="'+map3+'">View map</a>');
            }
            if(centre == 4) {
               $('.centre-info').html('<img src="'+img4+'" class="img-centre img-responsive" /><h4>Address</h4><p class="centre-address">'+addr4+'</p><a class="viewmap-link" href="'+map4+'">View map</a>');
            }
            if(centre == 5) {
              $('.centre-info').html('<img src="'+img5+'" class="img-centre img-responsive" /><h4>Address</h4><p class="centre-address">'+addr5+'</p><a class="viewmap-link" href="'+map5+'">View map</a>');
            }
         });
         $('.selectDiv').find('span').remove();
         //console.log($('.ui-select > #centre-button > span').text());
         $('#centre-button > span').remove();
         applicationCentre();
         function applicationCentre() {
            if(getWidth()>=992) {
               var inner_centre_html = $('#inline-centre').html();

               $('#inline-centre').addClass('hidden');
               $('#right-centre').append(inner_centre_html).removeClass('hidden');
               $('#inline-centre').html('');
            } else {
               var inner_centre_html = $('#right-centre').html();

               $('#inline-centre').append(inner_centre_html).removeClass('hidden');
               $('#right-centre').html('');
            }
         }
		 
		// modal timer configuration
		window.onload = function () {
			var pdfFile = $('#pdf-object').attr('data');
			var success = new PDFObject({ url: pdfFile }).embed();
		};
		var sec1 = 8;
		var sec2 = 8;
		var sec3 = 8;
		$('#fna-signature-modal').on('shown.bs.modal', function () {
			var interval = setInterval(function() {
				sec1 -= 1;
				updateSecond(sec1);
			}, 1000);

			function updateSecond(second) {
				if(second == 0) {
					clearInterval(interval);
					$('#review-btn-1').text('Review and agree').removeClass('disabled-gray-btn');
				}
				$('#timer-1').text(second);
			}
		});
		$('#sales-signature-modal').on('shown.bs.modal', function () {
			var interval = setInterval(function() {
				sec2 -= 1;
				updateSecond(sec2);
			}, 1000);

			function updateSecond(second) {
				if(second == 0) {
					clearInterval(interval);
					$('#review-btn-2').text('Review and agree').removeClass('disabled-gray-btn');
				}
				$('#timer-2').text(second);
			}
		});
		$('#policy-signature-modal').on('shown.bs.modal', function () {
			var interval = setInterval(function() {
				sec3 -= 1;
				updateSecond(sec3);
			}, 1000);

			function updateSecond(second) {
				if(second == 0) {
					clearInterval(interval);
					$('#review-btn-3').text('Review and agree').removeClass('disabled-gray-btn');
				}
				$('#timer-3').text(second);
			}
		});
		 
		 $(document).ready(function() {			
			// Signature box configuration
			var mobile_canvas_height = '254';
			var dsktop_canvas_height = '274';
			var dsktop_canvas_width = '532';
			var $signatureFirstDiv = $('#signature-1');
			var $tmpSignature;
			var mobile_canvas_width = '412';
			var $signStatus1 = $('#signature-status-1');
			var $signStatus2 = $('#signature-status-2');
			var $signStatus3 = $('#signature-status-3');

			// Clearing the signature
			$('#link-clear-1').on('click', function() {
				$signatureFirstDiv.jSignature('reset');
				$('#btn-confirm-1').addClass('disabled-gray-btn');
				$('#correct-signature-1').addClass('hidden');
			});
			initSignature();
			$('#signature-box-1').on('show.bs.modal', function () {
				$tmpSignature = $signatureFirstDiv;
			
				$(window).resize(function(){
					window_width = $(window).width();
					if(window_width > 991) {					
					adjustCanvas(dsktop_canvas_height, dsktop_canvas_width);
				} else {
					adjustCanvas(mobile_canvas_height, mobile_canvas_width);
					}
				});
			});
			
			$signatureFirstDiv.on('change', function(e) {
				$('#correct-signature-1').removeClass('hidden');
				$('#btn-confirm-1').removeClass('disabled-gray-btn');
				$tmpSignature = $signatureFirstDiv;
			});
			
			// Submitting pdfs
			$('#review-btn-1').on('click', function(e) {
				e.preventDefault();
				if($(this).hasClass('disabled-gray-btn') == false) {
					$signStatus1.removeClass('savie-status').addClass('reviewed');
					$signStatus1.find('.pending').addClass('hidden');
					$signStatus1.find('.btn-table-savie').addClass('hidden');
					$signStatus1.find('.p-status').removeClass('hidden');
					$signStatus2.find('.btn-table-savie').removeClass('hidden');
					$signStatus2.find('.pending').addClass('hidden');
					$('#fna-signature-modal').modal('hide');
				}
			});
			$('#review-btn-2').on('click', function(e) {
				e.preventDefault();
				if($(this).hasClass('disabled-gray-btn') == false) {
					$signStatus2.removeClass('savie-status').addClass('reviewed');
					$signStatus2.find('.pending').addClass('hidden');
					$signStatus2.find('.btn-table-savie').addClass('hidden');
					$signStatus2.find('.p-status').removeClass('hidden');
					$signStatus3.find('.btn-table-savie').removeClass('hidden');
					$signStatus3.find('.pending').addClass('hidden');
					$('#sales-signature-modal').modal('hide');
				}
			});
			$('#review-btn-3').on('click', function(e) {
				e.preventDefault();
				if($(this).hasClass('disabled-gray-btn') == false) {
					$signStatus1.removeClass('savie-status').addClass('reviewed');
					$signStatus3.find('.pending').addClass('hidden');
					$signStatus3.find('.btn-table-savie').addClass('hidden');
					$signStatus3.find('.p-status').removeClass('hidden');
					$('#policy-signature-modal').modal('hide');
					$('#btn-acctps-sign').removeClass('disabled-gray-btn');
				}
			});
			$('#btn-acctps-sign').on('click', function(e) {
				e.preventDefault();
				if($(this).hasClass('disabled-gray-btn') == false) {
					$('#signature-box-1').modal('show');
				}
			});
			$('#btn-confirm-1').on('click', function(e) {
				e.preventDefault();
				if($(this).hasClass('disabled-gray-btn') == false) {
					$('#signature-box-1').modal('hide');
				}
			});
			
			function initSignature() {
				var window_width = $(window).width();
				// canvas width and height for mobile
				var _height = mobile_canvas_height;
				var _width = window_width;
				
				if(window_width > 415 && window_width < 992) {
					_width = '412';
				} else if(window_width > 991) {
					// canvas width and height for desktop
					_height = dsktop_canvas_height;
					_width = dsktop_canvas_width;
				}
				
				$signatureFirstDiv.jSignature({
				   height: _height, 
				   width: _width,
				   lineWidth: 2,
				   'decor-color': 'transparent',
				});
			}
			
			function adjustCanvas(height, width) {
				var datapair = $tmpSignature.jSignature("getData", "base30");
				$('canvas.jSignature').prop({"height": height, "width": width, "lineWidth": 2}).css({'height':height + 'px', 'width': width + 'px'});
				$tmpSignature.jSignature("setData", "data:" + datapair.join(","));
			}
		 });
	</script>
</body>
</html>