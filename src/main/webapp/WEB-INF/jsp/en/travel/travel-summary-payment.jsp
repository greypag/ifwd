<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="year" value="${now}" pattern="yyyy" />

<script>
	function confirmPayment() {
		var gateWayUrl = $('#gateway').val();
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
							 document.paymentForm.action = gateWayUrl;
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
						<div id="no-more-tables2">
							<div class="col-xs-12 col-sm-12">
								<div class="travel-tb-td hidden-md hidden-lg text-left wd2">
									<h3 class="color4 h2-1 insur padding-t">Insured Person(s)</h3>
									
									<!-- Mobile Table starts -->
								</div>
								<div  class="hidden-md hidden-lg">
							<table class="col-xs-10 table-condensed cf mob-table">
								
								<%
									PlanDetailsForm planDetailsForm = (PlanDetailsForm) request
											.getAttribute("planDetailsForm");
									for (int i = 0; i < planDetailsForm.getTotalAdultTraveller(); i++) {
								%>
								<tr><td class="col-xs-12"><table class="col-xs-12">
								

								<tbody>
									<tr class="">
										<td  ><span class="bd">Adult <%=i + 1%></span></td>
										<% if (planDetailsForm.getAdultBenificiaryFullName().length > 0) { %>
										<td ><span class="bd gy">Beneficiary</span></td>
										<% } %>
									</tr>
									<tr>
										<td ><span class=""><%=planDetailsForm.getAdultName()[i]%></span></td>
										<% if (planDetailsForm.getAdultBenificiaryFullName().length > 0) { %>
										<td  class="gy"><%=planDetailsForm.getAdultBenificiaryFullName()[i]%></td>
										<% } %>
									</tr>
									<tr>
										<td ><span class=""><%=planDetailsForm.getAdultAgeRangeName()[i]%></span></td>
										<% if (planDetailsForm.getAdultBenificiaryFullName().length > 0) { %>
										<td  class="">&nbsp;</td>
										<% } %>
									</tr>
									<tr>
										<td ><span class=""><%=planDetailsForm.getAdultHKID()[i]%></span></td>
										<% if (planDetailsForm.getAdultBenificiaryFullName().length > 0) { %>
										<td  class="gy"><%=planDetailsForm.getAdultBenificiaryHkid()[i]%></td>
										<% } %>
									</tr>
									<tr>
										<td ><span class="">Own estate</span></td>
										<% if (planDetailsForm.getAdultBenificiaryFullName().length > 0) { %>
										<td  class="gy"><%=planDetailsForm.getAdultBeneficiary()[i]%></td>
										<% } %>
									</tr>
									<tr><td>&nbsp;</td></tr>

									
								</tbody>
								</table></td></tr>
								
								<%
									}
								%>
								<%
									for (int i = 0; i < planDetailsForm.getTotalChildTraveller(); i++) {
								%>
								<tr><td class="col-xs-12"><table class="col-xs-12">
								<tbody>
									<tr><td>&nbsp;</td></tr>
									<tr>
										<td ><span class="bd">Child <%=i + 1%></span></td>
										<% if (planDetailsForm.getChildBenificiaryFullName().length > 0) { %>
										<td ><span class="bd gy" >Beneficiary</span></td>
										<% } %>
									</tr>
									<tr>	
										<td ><%=planDetailsForm.getChildName()[i]%></td>
										<% if (planDetailsForm.getChildBenificiaryFullName().length > 0) { %>
										<td class="gy"><%=planDetailsForm.getChildBenificiaryFullName()[i]%></td>
										<% } %>
									</tr>
									<tr>
										<td ><%=planDetailsForm.getChildAgeRange()[i]%></td>
										<% if (planDetailsForm.getChildBenificiaryFullName().length > 0) { %>
										<td >&nbsp;</td>
										<% } %>
									</tr>
									<tr>
										<td ><%=planDetailsForm.getChildHKID()[i]%></td>
										<% if (planDetailsForm.getChildBenificiaryFullName().length > 0) { %>
										<td  class="gy"><%=planDetailsForm.getChildBenificiaryHkid()[i]%></td>
										<% } %>
									</tr>
									<tr>
										<td >Own estate</td>
										<% if (planDetailsForm.getChildBenificiaryFullName().length > 0) { %>
										<td  class="gy"><%=planDetailsForm.getChildBeneficiary()[i]%></td>
										<% } %>
									</tr>
									<tr><td>&nbsp;</td></tr>
								</tbody>
								</table></td></tr>

								<%
									}
								%>
								<%
									for (int i = 0; i < planDetailsForm.getTotalOtherTraveller(); i++) {
								%>
								<tr><td class="col-xs-12"><table class="col-xs-12">
								<tbody>
									<tr><td>&nbsp;</td></tr>
									<tr class="">
										<td ><span class="bd">Other<%=i + 1%></span></td>
										<% if (planDetailsForm.getOtherBenificiaryFullName().length > 0) { %>
										<td ><span  class="bd gy">Beneficiary</span></td>
										<% } %>
									</tr>
									<tr>
										<td ><%=planDetailsForm.getOtherName()[i]%></td>
										<% if (planDetailsForm.getOtherBenificiaryFullName().length > 0) { %>
										<td  class="gy"><%=planDetailsForm.getOtherBenificiaryFullName()[i]%></td>
										<% } %>
									</tr>
									<tr>
										<td ><%=planDetailsForm.getOtherAgeRangeName()[i]%></td>
										<% if (planDetailsForm.getOtherBenificiaryFullName().length > 0) { %>
										<td >&nbsp;</td>
										<% } %>
									</tr>
									<tr>
										<td ><%=planDetailsForm.getOtherHKID()[i]%></td>
										<% if (planDetailsForm.getOtherBenificiaryFullName().length > 0) { %>
										<td  class="gy"><%=planDetailsForm.getOtherHKID()[i]%></td>
										<% } %>
									</tr>
									<tr>
										<td >Own estate</td>
										<% if (planDetailsForm.getOtherBenificiaryFullName().length > 0) { %>
										<td  class="gy"><%=planDetailsForm.getOtherBeneficiary()[i]%></td>
										<% } %>
									</tr>
									<tr><td>&nbsp;</td></tr>
								</tbody>
								</table></td></tr>
								<%
									}
								%>


							</table>
									<!-- Mobile table ends -->
								</div>
							</div>
						</div>
						<div id="no-more-tables" class="hidden-sm hidden-xs">
							<table class="col-md-12 table-condensed cf pad-left-20 beneList ">
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
									/* PlanDetailsForm planDetailsForm = (PlanDetailsForm) request
											.getAttribute("planDetailsForm"); */
									for (int i = 0; i < planDetailsForm.getTotalAdultTraveller(); i++) {
								%>



								<tbody>
									<tr class="hidden-sm hidden-xs">
										<td data-title="Adult <%=i + 1%>"><span class="h2-1-td">Adult
												<%=i + 1%></span></td>
										<td data-title="Full name"><span class="h4-5"><%=planDetailsForm.getAdultName()[i]%></span></td>
										<td data-title="Age range"><span class="h4-5"><%=planDetailsForm.getAdultAgeRangeName()[i]%></span></td>
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
										<td class="h4-5" data-title="Age range"><%=planDetailsForm.getChildAgeRangeName()[i]%></td>
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
										<td class=" h4-5" data-title="Age range"><%=planDetailsForm.getOtherAgeRangeName()[i]%></td>
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
				<div class="gray-bg1 pad20">
					<div class="clearfix"></div>
					<h2 class="from-control">Payment Details</h2>
					<span id="paymentGatewayErrorMsg"  class="text-red">${errormsg}</span>				
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

					<table class=" travel-tb">

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
<!-- 							<tr style="display: none;"> -->
							<tr style="display: none;">
							 <td ><label class="control-label h4-5">Payment Method</label></td> 
								<td colspan="2">
								<div class="controls">
								<label class="radio-inline">							
								 <input type="radio" name="pMethod" checked="checked" value="VISA" id="chkVisa"> VISA
								</label>	
								<label class="radio-inline">		
									<input type="radio" name="pMethod" value="Master" id="chkMaster"> MasterCard 
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
											onBlur="chkValidCreditCard(this, 'errcardno');"
											onkeypress="return isNumeric(event)"> <span
											id="errcardno" class="error-msg"></span>	<!-- chkMinLength(this.value); -->
									</div></td>
							</tr>
							<tr class="control-group">
								<td class="col-lg-4 ht1"><label class="control-label  h4-5">Expiry Date</label></td>
								<td><select class="pay-details-select" id="month"
									name="epMonth">
										<option value="0">Month</option>
										<option value="1">01</option>
										<option value="2">02</option>
										<option value="3">03</option>
										<option value="4">04</option>
										<option value="5">05</option>
										<option value="6">06</option>
										<option value="7">07</option>
										<option value="8">08</option>
										<option value="9">09</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
								</select></td>
								<td><select class="pay-details-select" id="year"
									name="epYear" onBlur="chkValidCreditCardExpDate(this, 'erryear', 'month', 'errmonth');">
										<option value="0">Year</option>
<!-- 										<option value="2015">2015</option> -->
<!-- 										<option value="2016">2016</option> -->
<!-- 										<option value="2017">2017</option> -->
<!-- 										<option value="2018">2018</option> -->
<!-- 										<option value="2019">2019</option> -->
<!-- 										<option value="2020">2020</option> -->
									<c:forEach begin="0" end="5" varStatus="loop">
										<c:set var="currentYear" value="${year + loop.index}" />
										<option value="${currentYear}">${currentYear}</option>
									</c:forEach>
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
											onblur="replaceAlpha(this); chkNotNullCreditCareName(this, 'errname');"
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
								class="bdr-curve btn btn-primary bck-btn2">Back </a>
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
									class="bdr-curve-none btn btn-primary nxt-btn hidden-xs hidden-sm"
									value="Confirm Payment" onclick="confirmPayment()" />
								<input type="submit"
									class="bdr-curve-none btn btn-primary nxt-btn hidden-md hidden-lg"
									value="Pay Now" onclick="confirmPayment()" />


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