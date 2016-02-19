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
	<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps" id="digital-signature">
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
                         <ul class="common-steps-list five-steps nav nav-pills">
                             <li class="step-number" id="first-step"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Select plan</button></li>
                            <li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
                            <li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Application &amp; Payment</button></li>
                            <li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
                            <li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Summary &amp; Declaration</button></li>
                            <li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
                            <li class="step-number"><button type="button" class="et-header-info-btn active"><span class="status">4</span>Signature</button></li>
                            <li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
                            <li class="step-number" id="last-steps"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">5</span>Confirmation</button></li>
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
						 <p id="step-of">4 of 5</p>
                      </div>
                   </div>
                </div>
             </div>
             <div class="container-fluid fwd-full-container mobile-step-indicator visible-xs visible-sm">
                <div class="step-indicator-container clearfix">
                    <ul class="common-step-indicator five-steps nav nav-pills">
                         <li id="first-step"><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
                         <li><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
                         <li><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
                         <li><a href="#" class="active"><span class="step-no">4</span></a></li>
                         <li id="last-step"><a href="#"><span class="step-no">5</span></a></li>
                    </ul>
                    <div class="step-line"></div>
                </div>
            </div>
			<div class="container-fluid fwd-full-container headerStick" id="container-digitalsignature">
				<div class="fwd-container-limit clearfix sidebar" id="fwd-container-digitalsignature">
					<p>Please review and confirm to accept the
					documents shown below:</p>
					<div id="form-digitalsignature-info">
						<div class="radio-group clearfix">
							 <div class="radio-button-group">
								  <div class="clearfix">
									 <div class="pull-left radio-holder">
										<input type="radio" id="payment-debit" name="payment"> <label for="payment-debit"></label>
									 </div>
									 <div class="pull-left desc" id="id-digi-sign">
										Digital signature
										 <span>Use your mouse or finger to sign the document</span>
									 </div>
								  </div>
								  <div class="clearfix" id="id-offline-signature">
									 <div class="pull-left radio-holder">
										<input type="radio" id="payment-later" name="payment" checked> <label for="payment-later"></label>
									 </div>
									 <div class="pull-left desc" id="id-off-sign">
										Offline signature
										 <span>Refer to customer service and sign documents there</span>
									 </div>
								  </div>
							</div>
						</div>
						<form id="table-info">
							<p>Please review the signature below to make sure all signature is correct</p>
									<table class="table table-bordered table-hover">
										<tbody>
										  <tr>
											<td class="numbers">1</td>
											<td  class="adjust-body-content">Financial
												Needs Analysis</td>
											<td  class="reviewed">
											<p id="id-review">Reviewed</p>
											</td>
										  </tr>
										  <tr>
											<td class="numbers">2</td>
											<td  class="adjust-body-content">Sales illustration</td>
											<td class="savie-status">
											<p class="pending">Pending review</p>
											<button class="btn savie-common-btn btn-table-savie hidden" type="button">Review now</button>
											</td>
										  </tr>
										  <tr>
											<td class="numbers">3</td>
											<td class="adjust-body-content">Policy replacements</td>
											<td  class="savie-status">
											<p class="pending">Pending review</p>
											<button class="btn savie-common-btn btn-table-savie hidden" type="button">Review now</button>
											</td>
										  </tr>
										  <tr>
											<td class="numbers">4</td>
											<td  class="adjust-body-content">Application forms</td>
											<td  class="savie-status">
											<p class="pending">Pending review</p>
											<button class="btn savie-common-btn btn-table-savie hidden" type="button">Review now</button>
											</td>
										  </tr>
										</tbody>
									</table>
									<div class="col-xs-12" id="desktop-position-btn">
										  <div class="text-center clearfix">
												<button class="btn savie-common-btn" type="button" id="btn-acctps-sign">Accept and sign</button>
												<a href="#" class="span-save-continue"><span>Save and continue later</span></a>	
										 </div>
									</div>
						</form>
					</div>
				</div>
			</div> 
			<!-- FOOTER -->
			<%@include file="includes/footer-block.jsp" %>
	</div>
 </div>
	<%@include file="includes/js-include.jsp" %>
	<script type="text/javascript">
		var language = "en";
			$(document).ready(function(){
				$('#table-info tr').mouseenter(function() {
					$(this).find('.pending').addClass('hidden');
					 $(this).find('.btn-table-savie').removeClass('hidden');
				}).on('mouseleave', function () {
					$(this).find('.btn-table-savie').addClass('hidden');
					$(this).find('.pending').removeClass('hidden');
			});
		});
	</script>
</body>
</html>