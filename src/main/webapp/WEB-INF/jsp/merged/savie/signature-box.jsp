<%@page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<%@include file="includes/head.jsp" %>
		<meta name="apple-mobile-web-app-capable" content="yes" />
	</head>
	<body>
		<div>
			<button class="btn" data-toggle="modal" data-target="#signature-box">Open signature box</button>			
		</div>
	
		<div id="signature-box" class="modal fade signature-box" role="dialog" aria-labelledby="signaturebox" aria-hidden="true" style="display: none;">
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
								<div id="signature" class="signature-img"></div>
							</div>
							<div class="clearfix">
								<a class="pull-left link-clear">Clear</a>
								<div class="pull-right">
									<div class="correct-signature hidden">
										<img src="assets/images/elite-terms/correct-signature.png">
										<span>Correct Signature</span>
									</div>
									<p class="text-right">Signed in Hong Kong.</p>
								</div>
							</div>
							<center>
								<button type="submit" class="btn savie-common-btn btn-confirm disabled-gray-btn">Confirm</button>
							</center>
						 </form>
					  </div>
				</div> <!-- /.modal-content -->
			</div> <!-- /.modal-diaolog -->
		</div>
	
		<!-- JS INCLUDES -->
		<%@include file="includes/js-include.jsp" %>
		<script type="text/javascript">
			var language = "en";
			
			$(document).ready(function() {
				var mobile_canvas_height = '254';
				var dsktop_canvas_height = '274';
				var dsktop_canvas_width = '532';
				var $signatureDiv = $('#signature');
				
				initSignature();
				
				$(window).resize(function(){
					window_width = $(window).width();
					if(window_width > 991) {					
						adjustCanvas(dsktop_canvas_height, dsktop_canvas_width);
					} else {						
						adjustCanvas(mobile_canvas_height, $signatureDiv.width());
					}
				});
				
				$('.link-clear').on('click', function() {					
					$signatureDiv.jSignature('reset');
					$('.btn-confirm').addClass('disabled-gray-btn');
					$('.correct-signature').addClass('hidden');
				});
				
				$signatureDiv.bind('change', function(e){
					$('.btn-confirm').removeClass('disabled-gray-btn');
					$('.correct-signature').removeClass('hidden');
				})
				
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
					
					$signatureDiv.jSignature({
					   height: _height, 
					   width: _width,
					   'decor-color': 'transparent',
					})
				}
				
				function adjustCanvas(height, width) {
					var datapair = $signatureDiv.jSignature("getData", "base30");
					$('canvas.jSignature').prop({"height": height, "width": width}).css({'height':height + 'px', 'width': width + 'px'});
					$signatureDiv.jSignature("setData", "data:" + datapair.join(","));
				}
			});			
			
		</script>
	</body>
</html>