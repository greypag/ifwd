<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.ifwd.fwdhk.model.HomeCareDetailsBean"%>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="year" value="${now}" pattern="yyyy" />

<section>
	<div class="container">
		<div class="row">
			<form name="paymentForm" id="paymentForm"
				onsubmit="return confirmHomeCarePayment(this, 'gateway', 'paymentForm');" method="post">
				<ol class="breadcrumb pad-none">
					<li><a href="#">Home</a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#">Easy HomeCare </a> <i
						class="fa fa-caret-right"></i></li>
					<li><a href="#">Your options </a><i class="fa fa-caret-right"></i>
					</li>
					<li><a href="#">Your details </a></li>
					<li class="active "><i class="fa fa-caret-right"></i> Summary & payment</li>
				</ol>
				<div class="container ">
					<div
						class="col-lg-12 col-md-12 col-sm-12 col-xs-12 shop-tracking-status">
						<div class="center" style="visibility: visible;">
							<h2>Summary & payment</h2>
						</div>
						<br>
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div id="tr-wizard" class="shop-tracking-status">
								<div class="order-status has-four">
									<div class="order-status-timeline-new">
										<div class="order-status-timeline-completion dots-active"></div>
										<div class="order-status-timeline-completion dots-active"></div>
										<div class="order-status-timeline-completion dots-inactive"></div>
									</div>
									<div
										class="image-order-status image-order-status-new active img-circle first">
										<span class="status color3">Your Options</span>
										<div class="icon">1</div>
									</div>

									<div
										class="image-order-status image-order-status-intransit  img-circle second">
										<span class="status color3">Your Details</span>
										<div class="icon">2</div>
									</div>
									<div
										class="image-order-status image-order-status-delivered  img-circle act third">
										<span class="status color2">Summary & Payment</span>
										<div class="icon">3</div>
									</div>
									<div
										class="image-order-status image-order-status-completed  img-circle disabled fourth">
										<span class="status lst-status">Confirmation</span>
										<div class="icon">4</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="container pad-none bdr ur-opt-content gray-bg3">
					<div
						class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pad-none white-bg1">
						
						<div class="row home-summary-heading-row">
							<div class="col-xs-6 col-md-7">
								<h3 class="margin-left-2 h2-3-existing-fwd-head home-summary-heading">Plan Summary</h3>
							</div>
							<div class="col-xs-6 col-md-5">
								<h4 class="h4-trav-full text-right home-summary-change">
									<a href="#" onclick="BackMe()">Change details</a>
								</h4>
							</div>
						</div>
						
						
						<div class="col-lg-6 col-xs-12 col-sm-12 col-md-6 pad-none">
							
							<table class="table activation-form margin-left-2">
								<tbody>
									<tr>
										<td class="h2-1 pad-left1 col-lg-5">Request No.</td>
										<td class=" h4-5">${createdPolicy.getReferenceNo() }<input
											type="hidden" name="referenceNo"
											value="${createdPolicy.getReferenceNo()}"></td>
									</tr>
									<tr>
										<td class="h2-1 ">Plan</td>
										<td class="h4-5 ">Standard Cover<br> Household
											Contents<br>
											<h4 class="h4-4-full"><!-- + Full coverage details --></h4></td>
									</tr>
									<tr>
										<td class="h2-1 ">Correspondence <br>Address
										</td>
										<td class=" h4-5 ">${homeCareDetails.getApplicantRoom()}/${homeCareDetails.getApplicantFloor()},
										${homeCareDetails.getApplicantBlock()},<br>
											${homeCareDetails.getApplicantBuilding() },
											${homeCareDetails.getApplicantEstate() },<br>
											${homeCareDetails.getApplicantStreetName()}
											${homeCareDetails.getApplicantDistrict()}
										</td>
									</tr>
									<tr>
										<td class="h2-1 ">Insured Address</td>
										<td class=" h4-5 ">${homeCareDetails.getaRoom()}/${homeCareDetails.getaFloor()},
											${homeCareDetails.getaBlock() },
											${homeCareDetails.getaBuilding()},
											${homeCareDetails.getaEstate() },${homeCareDetails.getaStreetNo() }
											${homeCareDetails.getaStreetName() }
											${homeCareDetails.getaDistrict()},
											${homeCareDetails.getaArea() }</td>
									</tr>
									<tr>
										<td class="h2-1 ">Net Floor<br>Area(square feet)
										</td>
										<td class=" h4-5 ">${homeCareDetails.getNetFloorArea()}</td>
									</tr>
									<tr>
										<td class="h2-1 ">Period of Insurance</td>
										<td class=" h4-5 ">Yearly</td>
									</tr>
									<tr>
										<td class="h2-1 ">Effective Date of <br>Coverage
										</td>
										<td class=" h4-5 ">From ${effectiveDate } to
											${effectiveEndDate}</td>
									</tr>
									<tr>
										<td class="td-vert-middle"><span class="h4-4-orange-b pad-none">Amount
												due </span></td>
												<%
												HomeCareDetailsBean homeCareDetails = (HomeCareDetailsBean) request.getAttribute("homeCareDetails");%>
										<td class=" "><span class="h4-4-orange-b pad-none">HK$
												<%=String.format("%.2f",Double.parseDouble(homeCareDetails.getTotalDue()))%></span></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div
							class="col-lg-6 col-xs-6 col-sm-6 col-md-6 pad-none hidden-sm hidden-xs">
							
							<table class="table activation-form margin-left-2">
								<tbody>
									<tr>
										<td class="pad-none "><span class="home-summary-applicant h2-3-existing-fwd-head">Applicant</span></td>
										<td class="pad-none h4-5 "></td>
									</tr>
									<tr>
										<td class="h2-1 pad-none ">Full name</td>
										<td class="pad-none h4-5 ">${userDetails.getFullName()}</td>
									</tr>
									<tr>
										<td class="h2-1 pad-none ">HKID</td>
										<td class="pad-none h4-5 ">${userDetails.getHkid() }</td>
									</tr>
									<tr>
										<td class="h2-1 pad-none ">Email Address</td>
										<td class="pad-none h4-5 ">${userDetails.getEmailAddress()}</td>
									</tr>
									<tr>
										<td class="h2-1 pad-none ">Mobile Number</td>
										<td class="pad-none h4-5 ">${userDetails.getMobileNo()}</td>
									</tr>
								</tbody>
							</table>
						</div>


					</div>
					<div class="clearfix"></div>
				</div>
				<input type="hidden" name="merchantId"
							value="${createdPolicy.getMerchantId()}">
						<input type="hidden" name="amount" value="${totalDue.trim()}">
						<input type="hidden" name="orderRef"
							value="${confirm.getTransactionNo() }">
						<input type="hidden" name="currCode"
							value="${createdPolicy.getCurrCode() }">
						<input type="hidden" name="successUrl" value="${path}">
						<input type="hidden" name="failUrl" value="${failurePath}">
						<input type="hidden" name="errorUrl" value="${failurePath}">
						<input type="hidden" name="payType"
							value="${createdPolicy.getPaymentType() }">
						<input type="hidden" name="lang"
							value="${createdPolicy.getLang()}">
						<input type="hidden" name="secureHash"
							value="${confirm.getSecureHash() }">
						<input type="hidden" id="emailAddress" name="emailAddress"
							value="${userDetails.getEmailAddress()}">
						<input type="hidden" id="transactionDate" name="transactionDate"
							value="${effectiveDate}">
						<input type="hidden" id="gateway" name="gateway"
							value="${createdPolicy.getPaymentGateway()}">
				<div class="gray-bg1 pad20">
					<div class="clearfix"></div>
					<h2 class="from-control">Payment Details</h2>
					<h3><span id="paymentGatewayErrorMsg"  class="text-red">${errormsg}</span></h3>
					<table class="travel-tb">
						<tbody>

							<tr class="control-group">
								<td class="col-lg-4 ht1"><label class="control-label h4-5">Card
										Type</label></td>
								<td class="col-lg-8" colspan="2"><div class="controls">
										<div>
											<img src="resources/images/payment.png" alt="">
										</div>
									</div></td>
							</tr>

							<tr style="display: none;">
								
								<td class="col-lg-4 ht1">
								<label class="control-label h4-5">Payment Method</label></td>
								<td><input type="radio" name="pMethod" value="VISA">VISA
									<input type="radio" name="pMethod" value="Master">MasterCard
									<!-- <input type="radio" name="pMethod" value="Diners">Diners
									Club <input type="radio" name="pMethod" value="JCB">JCB
									<input type="radio" name="pMethod" value="AMEX">AMEX --></td>
							</tr>

							<tr class="control-group">
								<td class="col-lg-4 ht1"><label class="control-label h4-5">Credit
										card number</label></td>
								<td colspan="2"><div class="controls">
										<!-- <input id="cardnumber" name="cardnumber" type="text"
											class="input-block-level" maxlength="16" min="16" title=""
											onkeyup="validatecardnumber(this.value)"
											onBlur="chkMinLength(this.value);"
											onkeypress="return isNumeric(event)"> -->
										<input id="cardnumber" name="cardNo" type="text"
											class="input-block-level" maxlength="16" data-min="16"
											title="" placeholder="Credit card number"
											onkeyup="validatecardnumber(this.value)"
											onBlur="chkValidCreditCard(this, 'errcardno');"
											onkeypress="return isNumeric(event)"> <span
											id="errcardno" class="error-msg"></span>

									</div></td>
							</tr>



							<tr class="control-group">
								<td class="col-lg-4 ht1"><label class="control-label  h4-5">Expiry
										Date</label></td>
								<td><select class="pay-details-select" id="month"
									name="epMonth">
										<option VALUE="">Month</option>
										<option VALUE="01">1</option>
										<option VALUE="02">2</option>
										<option VALUE="03">3</option>
										<option VALUE="04">4</option>
										<option VALUE="05">5</option>
										<option VALUE="06">6</option>
										<option VALUE="07">7</option>
										<option VALUE="08">8</option>
										<option VALUE="09">9</option>
										<option VALUE="10">10</option>
										<option VALUE="11">11</option>
										<option VALUE="12">12</option>
								</select></td>
								<td><select class="pay-details-select" id="year"
									name="epYear">
										<option VALUE="">Year</option>
<!-- 										<option VALUE="2015">2015</option> -->
<!-- 										<option VALUE="2016">2016</option> -->
<!-- 										<option VALUE="2017">2017</option> -->
<!-- 										<option VALUE="2018">2018</option> -->
<!-- 										<option VALUE="2019">2019</option> -->
<!-- 										<option VALUE="2020">2020</option> -->
									<c:forEach begin="0" end="5" varStatus="loop">
										<c:set var="currentYear" value="${year + loop.index}" />
										<option value="${currentYear}">${currentYear}</option>
									</c:forEach>
								</select></td>
								
							</tr>
							<tr>
								<td></td>
								<td><span id="errmonth" class="error-msg"></span></td>
								<td><span id="erryear" class="error-msg"></span></td>
							</tr>
							<tr class="control-group">
								<td class="col-lg-4 ht1"><label class="control-label  h4-5">Name
										on credit card</label></td>
								<td colspan="2">
									<div class="controls">
										<input id="holdername" type="text" name="cardHolder" class="input-block-level"
											title="" placeholder="Name on credit card"
											onblur="replaceAlpha(this); chkNotNullCreditCareName(this, 'errname');"
											onkeypress="return alphaOnly(event);"> <span
											id="errname" class="error-msg"></span>
									</div>
								</td>
							</tr>
							<tr class="control-group">
								<td class="col-lg-4 ht1"><label class="control-label  h4-5">Security
										Code</label></td>
								<td><div class="controls">
										<input id="seccode" name="securityCode" type="password" class="input-block-level"
											autocomplete="off" maxlength="3" title="" placeholder="CVV"
											onblur="replaceAlphaNumeric(this);"
											onkeypress="return isAlphaNumeric(event);">

									</div></td>
								<td><img src="resources/images/cards.png" alt=""></td>
							</tr>
							<tr>
								<td></td>
								<td><span id="errcode" class="error-msg"></span></td>
								<td></td>
							</tr>


							<tr class="control-group">
								<td></td>
								<td colspan="2"><!--<a class="sub-link" href="#">What is my
										security code?</a>--></td>
							</tr>




						</tbody>

					</table>
					<div class="clearfix"></div>
					<div class="declaration-content margin-left-small">
						<div class="checkbox">
							<input id="checkbox3" type="checkbox"> <label
								for="checkbox3"> I hereby authorize FWD General
								Insurance Company Limited to debit my Credit Card Account for
								the premium of this insurance. </label>
							<div class="clearfix"></div>
						</div>
						<span id="errchk1" class="error-msg"></span>
						<!-- <div class="checkbox">
							<input id="checkbox2" type="checkbox"> <label
								for="checkbox2"> I/We have read and understand the<a
								href="resources/policy-provisions-pdf/Easy_HomeCare_Provisions_Mar_2015.pdf"
								target="_blank" class="sub-link"> policy coverage</a> and <a href="#" class="sub-link">terms and conditions.</a>
							</label>
							<div class="clearfix"></div>
						</div>
						<span id="errchk2" class="error-msg"></span>-->
						<div class="clearfix"></div>
						<div class="hidden-sm hidden-xs pad-none">

							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
								<input type="button" class="bdr-curve btn btn-primary bck-btn" onclick="BackMe()"
									value="Back">
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
								<!-- <input type="button"
									class="bdr-curve btn btn-primary nxt-btn margin-left"
									onclick="confirmPayment()" value="Confirm Payment"> -->
								<input type="submit"
									class="bdr-curve btn btn-primary btn-next"
									value="Confirm Payment">
							</div>


						</div>
						<br> <br>
						<div class="pad-none hidden-md hidden-lg">
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
								<a href="#" onclick="BackMe()"
									class="bdr-curve btn btn-primary bck-btn col-xs-5 col-sm-5 text-center">Back
								</a>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">


								<input type="submit"
									class="bdr-curve btn btn-primary btn-next text-center"
									value="Pay Now">
							</div>

							<!--  <a href="travel-confirmation.html" class="bdr-curve btn btn-primary nxt-btn margin-left col-xs-6 col-sm-6 text-center" onclick="return payValid();">Pay Now</a> </div>
             -->

							<div class="clearfix"></div>

						</div>
						<br> <br>

					</div>

				</div>
			</form>
		</div>
		<!--/.row-->
	</div>
	<!--/.container-->
</section>
<!--/end Main Content-->

<script>
// moved to fwd.js
// 	function confirmPayment(form) {
// 		if (payValid()) {
// 			var geteWayUrl = $('#gateway').val();
// 			$
// 					.ajax({
// 						type : "POST",
// 						url : "processHomeCarePayment",
// 						data : $("#paymentForm").serialize(),
// 						async : false,
// 						success : function(data) {
// 							if (data == 'success') {
// 								/* form.action = "https://test.paydollar.com/b2cDemo/eng/payment/payForm.jsp"; */
// 								/* form.action = "https://test.paydollar.com/b2cDemo/eng/dPayment/payComp.jsp"; */
// 								form.action = geteWayUrl;
// 							}
// 						}
// 					});
// 		}

// 	}
	
	function BackMe() {
		window.history.back();
	}
</script>