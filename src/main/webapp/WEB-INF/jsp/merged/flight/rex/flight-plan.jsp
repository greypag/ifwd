<%@page import="com.ifwd.fwdhk.model.PlanDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!-- Google Tag Manager -->
<noscript>
	<iframe src="//www.googletagmanager.com/ns.html?id=GTM-MWPF25"
		height="0" width="0" style="display: none; visibility: hidden"></iframe>
</noscript>
<script>
	(function(w, d, s, l, i) {
		w[l] = w[l] || [];
		w[l].push({
			'gtm.start' : new Date().getTime(),
			event : 'gtm.js'
		});
		var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l='
				+ l
				: '';
		j.async = true;
		j.src = '//www.googletagmanager.com/gtm.js?id=' + i + dl;
		f.parentNode.insertBefore(j, f);
	})(window, document, 'script', 'dataLayer', 'GTM-MWPF25');
</script>
<!-- End Google Tag Manager-->




<!--/#main-Content-->
<section>
	<div class="container">
		<div class="row">
			<form action="flight-plan-details" method="post">
				<input type="hidden" name="totalAdultTraveller"
					id="totalAdultTraveller"
					value="${planDetails.getTotalAdultTraveller()}"> <input
					type="hidden" name="totalChildTraveller" id="totalChildTraveller"
					value="${planDetails.getTotalChildTraveller()}"> <input
					type="hidden" name="totalOtherTraveller" id="totalOtherTraveller"
					value="${planDetails.getTotalOtherTraveller()}"> <input
					type="hidden" name="returnDate" id="returnDate"
					value="${planDetails.getReturnDate()}"> <input
					type="hidden" name="departureDate" id="departureDate"
					value="${planDetails.getDepartureDate()}"> <input
					type="hidden" name="days" value="${days}"> <input
					type="hidden" name="travellerCount"
					value="${planDetails.getTravellerCount()}"> <input
					type="hidden" name="ToalDue"
					value="${flightQuoteDetails.getToalDue()}"> <input
					type="hidden" name="planSelected"
					value="${planDetails.getPlanSelected()}">
			


			<ol class="breadcrumb pad-none">
					<li><a href="#">##flight.quote.breadcrumb1.item1@@</a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#">##flight.quote.breadcrumb1.item2@@ </a></li>
					<li class="active "><i class="fa fa-caret-right"></i> ##flight.quote.breadcrumb1.item3@@</li>
				</ol>
				<div class="container ">
					<div
						class="col-md-12 col-lg-12 col-sm-12 col-xs-12  shop-tracking-status">
						<div class="center wow fadeInDown animated"
							style="visibility: visible;">
							<h2>##flight.quote.jumbo@@</h2>
						</div>
						<br> <br>
						<div class="order-status">
							<div class="order-status-timeline-new">
								<!--
								There can be n '.order-status-timeline-completion'
								dots-inactive and dots-active color the dots -->
								<div class="order-status-timeline-completion dots-inactive"></div>
								<div class="order-status-timeline-completion dots-inactive"></div>
								
							</div>
							<div
								class="image-order-status image-order-status-new active  img-circle">
								<div class="icon">1</div>
								<span class="status">##flight.quote.breadcrumb2.item1@@</span>
							</div>
							<div
								class="image-order-status image-order-status-active disabled  img-circle">
								<div class="icon">2</div>
								<span class="status">##flight.quote.breadcrumb2.item2@@</span>
							</div>
							<div
								class="image-order-status image-order-status-intransit disabled  img-circle">
								<div class="icon">3</div>
								<span class="status min-left">##flight.quote.breadcrumb2.item3@@</span>
							</div>
						</div>
					</div>
				</div>
				<br> <br> <br>
				<div class="container pad-none bdr ur-opt-content">
					<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
						<h2 class="h2-3-choose hidden-sm hidden-xs">##flight.quote.choose@@</h2>
						<%
							for (int planCount = 1; planCount <= 1; planCount++) {
						%>
						<div class="plan-box plan-box-flight">
							<div class="col-lg-9 col-md-9 col-sm-6">
								<h2>
									##flight.quote.plan@@<br> ##flight.quote.price@@<br> <span>##flight.quote.price.desc@@</span>
								</h2>
							</div>
							<div class="col-lg-3 col-md-3 col-sm-4 col-xs-4">
								<br>
								<div class="h4">
									<%-- HK$ <br>
									<div class="flightcare-hk">${flightQuoteDetails.getToalDue()}
									</div> --%>
								</div>
							</div>
							<div class="clearfix"></div>
							<div></div>
						</div>

						<!--Full coverage -->
						<div class="fwdpanel">
							<div class="fwdpanel-heading">
								<h4 class="fwdpanel-title h4-4-full">
									<%
										}
									%>
									<span><a href="#" class="fwdpanel-minimize"><i
											class="fa fa-plus"></i> ##flight.quote.fullDetails.heading@@ </a> </span>
								</h4>
							</div>
							<div class="fwdpanel-body" style="display: none;">
								<div class="row">
									<div class="col-md-12">
										<h4 class="h4-3-b">##flight.quote.fullDetails.keyFeature@@</h4>
										<ol class="major-exc">
											<li>##flight.quote.fullDetails.keyFeature.desc1@@</li>
											<li>##flight.quote.fullDetails.keyFeature.desc2@@</li>
											<li>##flight.quote.fullDetails.keyFeature.desc3@@</li>
											
										</ol>
										<br>
										<h4 class="h4-3-b">##flight.quote.fullDetails.eligibility@@</h4>
										 <ul class="major-exc">
											<li>##flight.quote.fullDetails.eligibility.desc1@@</li>
											<li>##flight.quote.fullDetails.eligibility.desc2@@</li>
										</ul>
									</div>
									<!-- / col-md-12 -->
								</div>
								<!-- /row -->
							</div>

						</div>
						<br>
						<!--Full coverage end -->
						<h4 class="h4-3-b">##flight.quote.other.tnc@@</h4>
						<ol class="major-exc">
							<li>##flight.quote.other.tnc.desc1@@</li>
							<li>##flight.quote.other.tnc.desc2@@</li>
							<li>##flight.quote.other.tnc.desc3@@</li>
							<li>##flight.quote.other.tnc.desc4@@</li>
							<li>##flight.quote.other.tnc.desc5@@</li>
							<li>##flight.quote.other.tnc.desc6@@</li>
						</ol>
						<br>

					</div>
					<div class="col-lg-5 col-md-5 gray-bg pad-none hidden-sm hidden-xs">
						<div class="wd2">
							<div class="pull-left">
								<h2 class="h2-3-choose">##flight.quote.summary.product@@</h2>
								<h4>##flight.quote.summary.desc@@</h4>
							</div>
							<div class="pull-right">
								<div class="text-left pad-right1 h2-2 h2">
									<div class="hk">
										<!-- HK$ -->
										<div class="flightcare-hk">
											<%-- ${flightQuoteDetails.getToalDue()} --%>
											&nbsp;
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="clearfix"></div>
						<div class="orange-bdr"></div>
						<div class="form-container">
							<h3>##flight.quote.summary.option1@@</h3>
							<div class="form-group">
								<div class="input-group wd2">
									<input type="text" class="datepicker form-control bcg-trans"
										value='<c:out value="${planDetails.getDepartureDate()}"/>'readonly>
								</div>
							</div>
							<h3>##flight.quote.summary.option2@@</h3>
							<div class="form-group">
								<div class="input-group wd2">
									<input type="text" class="datepicker form-control bcg-trans"
										value="<c:out value="${planDetails.getReturnDate()}"/>"
										readonly>
								</div>
							</div>
							<h3>##flight.quote.summary.option3@@</h3>
						
<!--						<div class="form-group">
								
									<c:if test="${planDetails.getTotalAdultTraveller() !=0 }">Parent :${planDetails.getTotalAdultTraveller()},</c:if>
									<c:if test="${planDetails.getTotalChildTraveller() !=0 }">Child :${planDetails.getTotalChildTraveller()}, </c:if>
									<c:if test="${planDetails.getTotalOtherTraveller() !=0}">Others :${planDetails.getTotalOtherTraveller()}</c:if>
									<c:if test="${planDetails.getTravellerCount() !=0}"> Travellers :${planDetails.getTravellerCount()}</c:if>
								
							</div>
							-->
							
							<div class="form-group likeDatePicker bcg-trans">
              	<div class="input-group wd2 datepicker form-control" > 
              	
              
              		<%-- <input type="text" class="datepicker form-control" value=" --%>
								<c:if test="${planDetails.getTotalAdultTraveller() !=0 }">Parent(s): ${planDetails.getTotalAdultTraveller()} <br></c:if>
								<c:if test="${planDetails.getTotalChildTraveller() !=0 }">Child(ren): ${planDetails.getTotalChildTraveller()} <br></c:if>
								<c:if test="${planDetails.getTotalOtherTraveller() !=0}">Other(s): ${planDetails.getTotalOtherTraveller()} <br></c:if>
								<c:if test="${planDetails.getTravellerCount() !=0}">Traveller(s): ${planDetails.getTravellerCount()}</c:if> <!-- readonly> -->
								
              	</div>
              </div>
							
							
							
							
							<h3>
								##flight.quote.summary.option4@@ <span>${days}</span>
							</h3>
						</div>
						<div class="orange-bdr"></div>
						<h3 class="h4-1-orange-b col-lg-6 col-md-6"><!-- Amount due --></h3>
						<h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right">
							&nbsp;
							<%-- ${flightQuoteDetails.getToalDue()} --%>
						</h3>

						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-left">
							<a href="flight" class="bdr-curve btn btn-primary bck-btn">##flight.quote.action.back@@
							</a>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-right">
							<input type="submit"
								class="bdr-curve-none btn btn-primary btn-next " Value="Next" />
						</div>



						<!--       <h3 class="back-to-travel col-lg-6 col-md-6 text-right"><a href="flight.html">Back to travel</a> </h3>
            <div class="col-lg-6 col-md-6 text-right"> <a href="flight-plan-details.html" class="bdr-curve btn btn-primary nxt-btn ">Next</a> </div>-->
						<div class="clearfix"></div>
						<br> <br>
					</div>
					<div class="clearfix"></div>
				</div>
				<p class="padding1 hidden-sm hidden-xs">
				##flight.quote.other.disclaimer.part1@@ <a class="sub-link"
						href="resources/policy-provisions-pdf/FlightCare_Provisions_Mar_2015.pdf"
						target="_blank">##flight.quote.other.disclaimer.part2@@</a> ##flight.quote.other.disclaimer.part3@@ <br>
						##flight.quote.other.disclaimer.part4@@
					</p>
			</form>
		</div>
		<!--/.row-->
	</div>
	<!--/.container-->
</section>

<!--/end- Main Content-->


<!--mob-#bottom-->
<div class="hidden-lg hidden-md text-center">
	<div class="btn-box">
		<h3 class="text-center marg-t">
			<a href="flight-plan-details">##flight.quote.action.next@@</a>
		</h3>
	</div>

</div>
<!--/mob-#bottom-->


<!--Get promotion code popup-->
<div class="modal fade bs-promo-modal-lg " tabindex="-1" role="dialog"
	aria-hidden="true" style="display: none;">
	<div class="modal-dialog modal-lg">
		<div class="modal-content plan-modal">
			<div class="login-form" id="sendmailofpromocode">
				<form>
					<div class="form-container">
						<h2>##promotion.get.code@@</h2>
						<h4>##promotion.get.code.email@@</h4>
						<div class="form-group">
							<input type="text" class="form-control" placeholder=""
								name="emailToSendPromoCode" id="emailToSendPromoCode">
						</div>
						<span id="errPromoEmail" class="text-red"></span> <br>
						<div class="row">
							<div class="col-lg-6 col-md-6">
								<a class="bdr-curve btn btn-primary btn-lg wd5" href="#"
									onclick="return sendEmail()">##promotion.get.code.action@@</a>
							</div>
							<div class="col-md-2">
								<br>
							</div>
							<div class="col-lg-4 col-md-4">
								<!-- <a class="bdr-curve btn btn-primary btn-lg promo-pop-close wd5" href="#" data-dismiss="modal">Close </a>  -->
							</div>
							<br> <br>
							<div class="col-lg-12 col-md-12">
								<p>##promotion.get.code.disclaimer@@</p>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!--/ Get promotion code popup-->




<script type="text/javascript">

	function sendEmail() {
		if (get_promo_val()) {
			$.ajax({
				type : "POST",
				url : "sendEmail",
				data : $("#sendmailofpromocode form").serialize(),
				async : false,
				success : function(data) {
					alert(data);
					if (data == 'success') {
					} else {
					}

				},
				error : function() {
				}
			});
		}
		return false;
	}
</script>