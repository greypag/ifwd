<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
	function confirmPayment() {
		var geteWayUrl = $('#gateway').val();
		$
				.ajax({
					type : "POST",
					url : "processTravePayment",
					data : $("#paymentForm").serialize(),
					async : false,
					success : function(data) {
						if (data == 'success') {
							/* document.paymentForm.action = "https://test.paydollar.com/b2cDemo/eng/payment/payForm.jsp"; */
							/* document.paymentForm.action = "https://test.paydollar.com/b2cDemo/eng/payment/payComp.jsp"; */
							 document.paymentForm.action = geteWayUrl;
						}
					}
				});
	}
	function BackMe() {
		window.history.back();
	}
</script>
<!--/#main-Content-->
<%@page import="com.ifwd.fwdhk.model.PlanDetailsForm"%>
<!--/#main-Content-->

<section id="contact-page">
	<div class="container">
		<div class="row">
			<!-- <form action="processTravePayment" method="post" onsubmit="return payValid();"> -->
			<form name="paymentForm" id="paymentForm" method="post" onsubmit="return payValid();">
				<ol class="breadcrumb pad-none">
					<li><a href="#">Home</a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#">Travel </a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#">Your options </a><i class="fa fa-caret-right"></i>
					</li>
					<li><a href="#">Your details </a></li>
					<li class="active "><i class="fa fa-caret-right"></i>
					Summary & payment
					</li>
				</ol>
				<div class="container ">
					<div
						class="col-lg-12 col-md-12 col-sm-12 col-xs-12 shop-tracking-status">
						<div class="center wow fadeInDown animated"
							style="visibility: visible;">
							<h2>Summary & payment</h2>
						</div>
						<br> <br>
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pad-none">
							<div id="tr-wizard" class="shop-tracking-status">
								<div class="order-status">
									<div class="order-status-timeline">
										<!-- class names: c0 c1 c2 c3 and c4 -->
										<div
											class="order-status-timeline-completion order-status-timeline-completion c3"></div>
									</div>
									<div
										class="image-order-status image-order-status-new active img-circle">
										<span class="status color3"> Your Options</span>
										<div class="icon">1</div>
									</div>

									<div
										class="image-order-status image-order-status-intransit  img-circle ">
										<span class="status color3">Your Details</span>
										<div class="icon">2</div>
									</div>
									<div
										class="image-order-status image-order-status-delivered  img-circle act">
										<span class="status color2">Summary & Payment</span>
										<div class="icon">3</div>
									</div>
									<div
										class="image-order-status image-order-status-completed  img-circle disabled">
										<span class="status lst-status">Confirmation</span>
										<div class="icon">4</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<br> <br> <br>
				<div class="container pad-none bdr ur-opt-content gray-bg3">
					<div
						class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pad-none white-bg1">
						<br>

						<div class="col-lg-6 col-xs-12 col-sm-12 col-md-6 pad-none">
							<h3 class="margin-left-2 h2-3-existing-fwd-head">
							Plan Summary
							</h3>
							<table class="table activation-form margin-left-2">
								<tbody>
									<tr>
										<td class="h2-1 pad-none">Request no.</td>
										<td class="pad-none h4-5">${createPolicy.getReferenceNo()}</td>
									</tr>
									<tr>
										<td class="h2-1 pad-none">Plan</td>
										<td class="pad-none h4-5 ">${selectPlanName} Standard Cover<br>
											<!-- HK$500,000 Medical --><br>
											 <!-- <h4 class="h4-4-full"><a href="" class="sub-link">+ Full coverage details</a></h4> -->

										</td>
									</tr>
									<tr>
										<td class="h2-1 pad-none">No. of insured<br>person(s)
										</td>
										<td class="pad-none h4-5 ">${travelBean.getTotalTraveller()}</td>
									</tr>
									<tr>
										<td class="h2-1 pad-none">Period of insurance</td>
										<td class="pad-none h4-5 ">
										From ${travelBean.getTrLeavingDate()} to
											${travelBean.getTrBackDate()}</td>
									</tr>
									<tr>
										<td class="h2-1 pad-none">Number of days</td>
										<td class="pad-none h4-5 ">${totalTravallingDays}</td>
									</tr>
									<tr>
										<td class="pad-none"><span class="h4-4-orange-b pad-none">Amount Due </span></td>
										<td class="pad-none "><span
											class="h4-4-orange-b pad-none">HK$ ${dueAmount} </span></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div
							class="col-lg-6 col-xs-6 col-sm-6 col-md-6 pad-none hidden-sm hidden-xs">
							<h4 class="h4-trav-full col-xs-offset-8">
								<a href="#" onclick="BackMe()">Change details</a>
							</h4>
							<table class="table activation-form margin-left-2">
								<tbody>
									<tr>
										<td class="pad-none h2-3-existing-fwd-head ">Applicant</td>
										<td class="pad-none h4-5 "></td>
									</tr>
									<tr>
										<td class="h2-1 pad-none ">Full name</td>
										<td class="pad-none h4-5 ">${userDetails.getFullName() }</td>
									</tr>
									<tr>
										<td class="h2-1 pad-none ">HKID / Passport no.</td>
										<td class="pad-none h4-5 ">${userDetails.getHkid()}</td>
									</tr>
									<tr>
										<td class="h2-1 pad-none ">Email Address</td>
										<td class="pad-none h4-5 ">${userDetails.getEmailAddress() }</td>
									</tr>
									<tr>
										<td class="h2-1 pad-none ">Mobile Number</td>
										<td class="pad-none h4-5 ">${userDetails.getMobileNo() }</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="clearfix"></div>
						<div id="no-more-tables">
							<div class="col-xs-12 col-sm-12">
								<div class="travel-tb-td hidden-md hidden-lg text-left wd2">
									<h3 class="color4 h2-1 insur padding-t">Insured Person(s)</h3>
								</div>
							</div>
							<table class="col-md-12 table-condensed cf pad-left-20 ">
								<thead class="cf">
									<tr class="travel-tb-td">
										<th><span class="insur">Insured Person(s)</span></th>
										<th>Full name</th>
										<th>Age Range</th>
										<th>HKID/Passport no.</th>
										<th>Relationship</th>
									</tr>
								</thead>
								<%
									PlanDetailsForm planDetailsForm = (PlanDetailsForm) request
											.getAttribute("planDetailsForm");
									for (int i = 0; i < planDetailsForm.getTotalAdultTraveller(); i++) {
								%>



								<tbody>
									<tr class="hidden-sm hidden-xs">
										<td data-title="Adult <%=i + 1%>"><span class="h2-1-td">Adult
												<%=i + 1%></span></td>
										<td data-title="Full name"><span class="h4-5"><%=planDetailsForm.getAdultName()[i]%></span></td>
										<td data-title="Age range"><span class="h4-5"><%=planDetailsForm.getAdultAgeRange()[i]%></span></td>
										<td data-title="HKID"><span class="h4-5"><%=planDetailsForm.getAdultHKID()[i]%></span></td>
										<td data-title="Relationship"><span class="h4-5">Own estate</span></td>
									</tr>

									<%
										if (planDetailsForm.getAdultBenificiaryFullName().length > 0) {
									%>
									<tr>
										<td data-title="Adult1"><span class="h4-6-td">Beneficiary</span></td>
										<td data-title="Full name" class="travel-tb-h3"><%=planDetailsForm.getAdultBenificiaryFullName()[i]%></td>
										<td data-title="Age range" class="travel-tb-h3">&nbsp;</td>
										<td data-title="HKID" class="travel-tb-h3"><%=planDetailsForm.getAdultBenificiaryHkid()[i]%></td>
										<td data-title="Relationship" class="travel-tb-h3"><%=planDetailsForm.getAdultBeneficiary()[i]%></td>
									</tr>
									<%
										}
									%>
								</tbody>
								<%
									}
								%>
								<%
									for (int i = 0; i < planDetailsForm.getTotalChildTraveller(); i++) {
								%>
								<tbody>
									<tr class="hidden-sm hidden-xs">
										<td data-title="Child <%=i + 1%>"><span class="h2-1-td">Child
												<%=i + 1%></span></td>
										<td class="h4-5" data-title="Full name"><%=planDetailsForm.getChildName()[i]%></td>
										<td class="h4-5" data-title="Age range"><%=planDetailsForm.getChildAgeRange()[i]%></td>
										<td class="h4-5" data-title="HKID"><%=planDetailsForm.getChildHKID()[i]%></td>
										<td class="h4-5" data-title="Relationship">Own estate</td>
									</tr>
									<%
										if (planDetailsForm.getChildBenificiaryFullName().length > 0) {
									%>
									<tr>
										<td data-title="Adult1"><span class="h4-6-td">Beneficiary</span></td>
										<td data-title="Full name" class="travel-tb-h3"><%=planDetailsForm.getChildBenificiaryFullName()[i]%></td>
										<td data-title="Age range" class="travel-tb-h3">&nbsp;</td>
										<td data-title="HKID" class="travel-tb-h3"><%=planDetailsForm.getChildBenificiaryHkid()[i]%></td>
										<td data-title="Relationship" class="travel-tb-h3"><%=planDetailsForm.getChildBeneficiary()[i]%></td>
									</tr>
									<%
										}
									%>
								</tbody>

								<%
									}
								%>
								<%
									for (int i = 0; i < planDetailsForm.getTotalOtherTraveller(); i++) {
								%>

								<tbody>
									<tr class="hidden-sm hidden-xs">
										<td data-title="Other<%=i + 1%>"><span class="h2-1-td">Other<%=i + 1%></span></td>
										<td class=" h4-5" data-title="Full name"><%=planDetailsForm.getOtherName()[i]%></td>
										<td class=" h4-5" data-title="Age range"><%=planDetailsForm.getOtherAgeRange()[i]%></td>
										<td class=" h4-5" data-title="HKID"><%=planDetailsForm.getOtherHKID()[i]%></td>
										<td class=" h4-5" data-title="Relationship">Own estate</td>
									</tr>
									<%
										if (planDetailsForm.getOtherBenificiaryFullName().length > 0) {
									%>
									<tr>
										<td data-title="Adult1"><span class="h4-6-td">Beneficiary</span></td>
										<td data-title="Full name" class="travel-tb-h3 "><%=planDetailsForm.getOtherBenificiaryFullName()[i]%></td>
										<td data-title="Age range" class="travel-tb-h3 ">&nbsp;</td>
										<td data-title="HKID" class="travel-tb-h3 "><%=planDetailsForm.getOtherHKID()[i]%></td>
										<td data-title="Relationship" class="travel-tb-h3 "><%=planDetailsForm.getOtherBeneficiary()[i]%></td>
									</tr>
									<%
										}
									%>
								</tbody>
								<%
									}
								%>


							</table>
						</div>

					</div>
					<div class="clearfix"></div>
				</div>
				<div class="gray-bg1">
					<div class="clearfix"></div>
					<h2 class="from-control">Payment Details</h2>
					<input type="hidden" name="merchantId"
						value="${createPolicy.getMerchantId()}"> <input
						type="hidden" name="amount" value="${dueAmount.trim()}"> <input
						type="hidden" name="orderRef"
						value="${createPolicy.getTransactionNo() }"> <input
						type="hidden" name="currCode"
						value="${createPolicy.getCurrCode() }"> <input
						type="hidden" name="successUrl" value="${path}"> <input
						type="hidden" name="failUrl" value="${failurePath }"> <input
						type="hidden" name="errorUrl" value="${failurePath }"> <input
						type="hidden" name="payType"
						value="${createPolicy.getPaymentType()}"> <input
						type="hidden" name="lang" value="${createPolicy.getLang()}">
					<input type="hidden" name="secureHash"
						value="${createPolicy.getSecureHash() }"> <input
						type="hidden" id="emailAddress" name="emailAddress"
						value="${userDetails.getEmailAddress()}"> 
						
						<input
						type="hidden" id="gateway" name="gateway"
						value="${createPolicy.getPaymentGateway()}">

					<table class="table-responsive travel-tb">

						<tbody>
							<tr class="control-group">
								<td class="col-lg-4 ht1"><label class="control-label h4-5">Card Type</label></td>
								<td class="col-lg-8" colspan="2">
									<div class="controls cardtype">
										<div>
											<img src="resources/images/payment.png" alt="">
										</div>
									</div>
								</td>
							</tr>
							<tr>
							 <td><label class="control-label h4-5">Payment Method</label></td> 
								<td colspan="2">
								<div class="controls">
								<label class="radio-inline">							
								 <input type="radio" name="pMethod" checked="checked" value="VISA"> VISA
								</label>	
								<label class="radio-inline">		
									<input type="radio" name="pMethod" value="Master"> MasterCard 
								</label>
								</div>
									<!-- <input type="radio" name="pMethod" value="Diners">Diners
									Club <input type="radio" name="pMethod" value="JCB">JCB
									<input type="radio" name="pMethod" value="AMEX">AMEX
									
									-->
									</td> 
							</tr>
							<tr class="control-group">
								<td class="col-lg-4 ht1"><label class="control-label h4-5">Credit card number</td>
								<td colspan="2"><div class="controls">
										<input id="cardnumber" name="cardNo" type="text"
											class="input-block-level" maxlength="16" min="16" title=""
											onkeyup="validatecardnumber(this.value)"
											placeholder="Credit card number"
											onBlur="chkMinLength(this.value);"
											onkeypress="return isNumeric(event)"> <span
											id="errcardno" class="error-msg"></span>
									</div></td>
							</tr>
							<tr class="control-group">
								<td class="col-lg-4 ht1"><label class="control-label  h4-5">Expiry Date</label></td>
								<td><select class="pay-details-select" id="month"
									name="epMonth">
										<option>Month</option>
										<option>01</option>
										<option>02</option>
										<option>03</option>
										<option>04</option>
										<option>05</option>
										<option>06</option>
										<option>07</option>
										<option>08</option>
										<option>09</option>
										<option>10</option>
										<option>11</option>
										<option>12</option>
								</select></td>
								<td><select class="pay-details-select" id="year"
									name="epYear">
										<option>Year</option>
										<option>2015</option>
										<option>2016</option>
										<option>2017</option>
										<option>2018</option>
										<option>2019</option>
										<option>2020</option>
								</select></td>
							</tr>
							<tr>
								<td></td>
								<td style="max-width: 200px"><span id="errmonth"
									class="error-msg"></span></td>
								<td style="max-width: 200px"><span id="erryear"
									class="error-msg"></span></td>
							</tr>
							<tr class="control-group">
								<td class="col-lg-4 ht1"><label class="control-label  h4-5">Name on credit card</label></td>
								<td colspan="2">
									<div class="controls">
										<input id="holdername" type="text" name="cardHolder"
											class="input-block-level" placeholder="Name on credit card"
											onblur="replaceAlpha(this);"
											onkeypress="return alphaOnly(event);"> <span
											id="errname" class="error-msg"></span>
									</div>
								</td>
							</tr>
							<tr class="control-group">
								<td class="col-lg-4 ht1"><label class="control-label  h4-5">Security Code</label></td>
								<td>
									<div class="controls">
										<input id="seccode" type="password" name="securityCode"
											class="input-block-level" autocomplete="off" maxlength="3"
											title="" placeholder="CVV"
											onblur="replaceAlphaNumeric(this);"
											onkeypress="return isAlphaNumeric(event);">
									</div>
								</td>
								<td><img src="resources/images/cards.png" alt=""></td>
							</tr>
							<tr>
								<td></td>
								<td style="max-width: 200px"><span id="errcode"
									class="error-msg"></span></td>
								<td style="max-width: 200px"></td>
							</tr>
							<tr class="control-group">
								<td></td>
								<td colspan="2">
									<!-- <a class="sub-link" href="#">What is my security code?</a>-->
								</td>
							</tr>
						</tbody>
					</table>
					<div class="clearfix"></div>
					<div class="declaration-content margin-left-small">
						<div class="checkbox">
							<input id="checkbox3" type="checkbox"> <label
								for="checkbox3"> I hereby authorize FWD General Insurance Company Limited to debit my Credit Card Account for the premium of this insurance. </label>
							<div class="clearfix"></div>
						</div>
						<span id="errchk1" class="error-msg"></span>
						<!-- <div class="checkbox">
							<input id="checkbox2" type="checkbox"> <label
								for="checkbox2"> I/We have read and understand the<a
								href="policy-provisions-pdf/TravelCare_Provisions_Mar_2015.pdf"
								target="_blank" class="sub-link"> policy coverage</a> and <a href="#" class="sub-link">terms and conditions.</a>
							</label>
							<div class="clearfix"></div>
						</div>
						<span id="errchk2" class="error-msg"></span> -->
						<div class="clearfix"></div>
						<div class="hidden-sm hidden-xs pad-none">
							<a href="travel-plan-details.html"
								class="bdr-curve btn btn-primary bck-btn">Back </a>
							<button onclick="confirmPayment();"
								class="bdr-curve btn btn-primary nxt-btn margin-left">
								Confirm Payment</button>
						</div>
						<br> <br>
						<div class="pad-none hidden-md hidden-lg">
							<div class="clearfix"></div>

							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-left">
								<a href="#" onclick="BackMe()"
									class="bdr-curve btn btn-primary bck-btn">Back </a>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-right">
								<input type="submit"
									class="bdr-curve-none btn btn-primary nxt-btn"
									value="Confirm Payment" onclick="confirmPayment()" />


							</div>
							<div class="clearfix"></div>
							<!--       <a href="travel-plan-details.html" class="bdr-curve btn btn-primary bck-btn col-xs-6 col-sm-6 text-center">Back </a> 
            <a href="travel-confirmation.html" class="bdr-curve btn btn-primary nxt-btn col-xs-6 col-sm-6 text-center" onclick="return payValid();">Pay Now</a>
            <div class="clearfix"></div>-->
						</div>
						<br> <br>

					</div>

				</div>
			</form>
		</div>
		<!--/.row-->
	</div>
	<!--/.container-->
	<br>
</section>
<!--/end Main Content-->
</body>
</html>