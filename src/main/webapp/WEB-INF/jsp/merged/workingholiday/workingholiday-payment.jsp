<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.ifwd.fwdhk.model.WorkingHolidayDetailsBean"%>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="year" value="${now}" pattern="yyyy" />

<script>
	function confirmPayment() {
		var geteWayUrl = $('#gateway').val();
		$.ajax({
			type : "POST",
			url : "<%=request.getContextPath()%>/processTravePayment",
			data : $("#paymentForm").serialize(),
			async : false,
			success : function(data) {
				if (data == 'success') {
					document.paymentForm.action = geteWayUrl;
				} else {
					console.log("fail to process payment " + data);
				}
				
			}
		});
	}
	
</script>
<%
WorkingHolidayDetailsBean planDetailsForm = (WorkingHolidayDetailsBean) request.getAttribute("planDetailsForm");
%>
<!--/#main-Content-->
<section>
	<div id="cn" class="container">
		<div class="row">
			<form name="paymentForm" id="paymentForm" method="post" onsubmit="return confirmHomeCarePayment(this, 'gateway', 'paymentForm');">
				<ol class="breadcrumb pad-none">
					<li><a href="#"><fmt:message key="travel.breadcrumb1.item1" bundle="${msg}" /></a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#"><fmt:message key="travel.breadcrumb1.item2" bundle="${msg}" /></a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#"><span class="clearfix"></span> <fmt:message key="travel.breadcrumb1.item3" bundle="${msg}" /></a><i
						class="fa fa-caret-right"></i></li>
					<li><a href="#"><fmt:message key="travel.breadcrumb1.item4" bundle="${msg}" /></a></li>
					<li class="active "><i class="fa fa-caret-right"></i> <fmt:message key="travel.breadcrumb1.item5" bundle="${msg}" /></li>
				</ol>
				<div class="container ">
					<div class="col-md-12 shop-tracking-status">
						<div class="center wow fadeInDown animated"
							style="visibility: visible;">
							<h2><fmt:message key="travel.summary.jumbo" bundle="${msg}" /></h2>
						</div>
						<br>
						<div class="col-lg-12">
							<div id="tr-wizard" class="shop-tracking-status">
								<div class="order-status has-four">
									<div class="order-status-timeline-new">
								<!--
										There can be n '.order-status-timeline-completion'
										dots-inactive and dots-active color the dots -->
										<div class="order-status-timeline-completion dots-active"></div>
										<div class="order-status-timeline-completion dots-active"></div>
										<div class="order-status-timeline-completion dots-inactive"></div>
									</div>
									<div
										class="image-order-status image-order-status-new active img-circle first">
										<span class="status color3"> <fmt:message key="travel.breadcrumb2.item1" bundle="${msg}" /></span>
										<div class="icon">1</div>
									</div>
									<div
										class="image-order-status image-order-status-intransit  img-circle second">
										<span class="status color3"><fmt:message key="travel.breadcrumb2.item2" bundle="${msg}" /></span>
										<div class="icon">2</div>
									</div>
									<div
										class="image-order-status image-order-status-delivered  img-circle act third">
										<span class="status color2"> <fmt:message key="travel.breadcrumb2.item3" bundle="${msg}" /></span>
										<div class="icon">3</div>
									</div>
									<div
										class="image-order-status image-order-status-completed  img-circle disabled fourth">
										<span class="status lst-status"> <fmt:message key="travel.breadcrumb2.item4" bundle="${msg}" /></span>
										<div class="icon">4</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="container pad-none bdr ur-opt-content gray-bg3">
					<div
						class="col-lg-12 col-xs-12 col-sm-12 col-md-12 pad-none white-bg1">
						<div class="col-xs-12 col-md-7  pad-none">
							<h3 class="margin-left-2 h2-3-existing-fwd-head"><fmt:message key="travel.summary.heading" bundle="${msg}" /></h3>
							<table class="table activation-form margin-left-2 vert-middle travel-summary">
								<tbody>
										<td class="h2-1 pad-none "><fmt:message key="travel.summary.applicant.name" bundle="${msg}" /></td>
										<td class="pad-none h4-5 ">${userDetails.getFullName() }</td>
									</tr>
									<tr>

										<td class="h2-1 pad-none "><fmt:message key="travel.summary.applicant.hkid" bundle="${msg}" /></td>
										<td class="pad-none h4-5 ">${userDetails.getHkid()}</td>
									</tr>
									<tr>
										<td class="h2-1 pad-none "><fmt:message key="travel.summary.applicant.email" bundle="${msg}" /></td>
										<td class="pad-none h4-5 ">${userDetails.getEmailAddress() }</td>
									</tr>
									<tr>
										<td class="h2-1 pad-none "><fmt:message key="travel.summary.applicant.mobileNo" bundle="${msg}" /></td>
										<td class="pad-none h4-5 ">${userDetails.getMobileNo() }</td>
									</tr>
									<tr>
										<td class="h2-1 pad-none"><fmt:message key="travel.summary.requestNo" bundle="${msg}" /></td>
										<td class="pad-none h4-5">${createPolicy.getReferenceNo()}</td>
									</tr>

									<tr>
										<td class="h2-1 pad-none"><fmt:message key="travel.summary.plan" bundle="${msg}" /></td>
										<td class="pad-none h4-5">${selectPlanName}  <fmt:message key="travel.summary.plan" bundle="${msg}" /></td>
										<!-- <td class="pad-none h4-5 ">計劃B 基本保障<br> HK$500,000

											醫療保障--><!--<br>
                        <h4 class="h4-4-full">+ [承保範圍]</h4>
										</td>

									</tr>-->
									<tr>
									<tr>
										<td class="h2-1 pad-none"><fmt:message key="travel.summary.period" bundle="${msg}" /></td>
										<td class="pad-none h4-5 "><fmt:message key="travel.summary.period.from" bundle="${msg}" />
											${commencementDate} <fmt:message key="travel.summary.period.to" bundle="${msg}" />
											${expiryDate}</td>
									</tr>
									<tr>
										<td class="h2-1 pad-none"><fmt:message key="travel.summary.days" bundle="${msg}" /></td>
										<td class="h4-4-orange-b pad-none h4-5 ">${totalDays}</td>
									</tr>
									<tr>
										<td class="pad-none"><span class="h4-4-orange-b pad-none"><fmt:message key="travel.summary.amountDue" bundle="${msg}" />
										</span></td>
										<td class="pad-none "><span
											class="h4-4-orange-b pad-none"><fmt:message key="travel.dollar" bundle="${msg}" /> ${dueAmount} </span></td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<div
							class="col-md-5 pad-none pull-right hidden-sm hidden-xs">
							<h4 class="h4-trav-full col-xs-offset-8">
								<a href="<%=request.getContextPath()%>/${language}/workingholiday-insurance/user-details" ><fmt:message key="travel.summary.subheading" bundle="${msg}" /></a>
							</h4>
							
						</div> 
						
						<div class="clearfix"></div>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="gray-bg1 pad20">
					<div class="clearfix"></div>
					<h2 class="from-control"><fmt:message key="travel.payment" bundle="${msg}" /></h2>
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
						type="hidden" name="payType" value="${createPolicy.getPaymentType()}">
					<%
						String payLang = (String) session.getAttribute("language");
						//payLang = payLang.substring(0, 1);
						System.out.println("getLanguage" + session.getAttribute("language"));
						payLang = "C";
						System.out.println("payLang" + payLang);
						//if (payLang.equals("t"))
						
					%>
					<input type="hidden" name="lang" value="<%=payLang%>"> <input
					<input type="hidden" name="lang" value="C"> <input
						type="hidden" name="secureHash"
						value="${createPolicy.getSecureHash() }"> <input
						type="hidden" id="emailAddress" name="emailAddress"
						value="${userDetails.getEmailAddress()}"> <input
						type="hidden" id="gateway" name="gateway"
						value="${createPolicy.getPaymentGateway()}">



					<table class="travel-tb">
						<tbody>
							<tr class="control-group">
								<td class="col-lg-4 ht1"><label class="control-label h4-5"><fmt:message key="travel.payment.card.type" bundle="${msg}" /></label></td>
								<td class="col-lg-8" colspan="2">
									<div class="controls">
										
										
										<div>
											<img src="<%=request.getContextPath()%>/resources/images/payment.png" alt="">
										</div>
									</div>
								</td>
							</tr>
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
								<td class="col-lg-4 ht1"><label class="control-label h4-5"><fmt:message key="travel.payment.card.no" bundle="${msg}" /></label></td>
								<td colspan="2">
									<div class="controls">
											
											<input id="cardnumber" name="cardNo" type="text"
											class="input-block-level" maxlength="16" data-min="16"
											title="" placeholder="<fmt:message key="travel.payment.card.no.placeholder" bundle="${msg}" />"
											onkeyup="" onkeypress="return isNumeric(event)" 
											onBlur="validatecardnumber(this.value)"
											 />
											
											<span
											id="errcardno" class="error-msg"></span>	<!-- chkMinLength(this.value); -->
											
									</div>
								</td>
							</tr>
							<tr class="control-group">
								<td class="col-lg-4 ht1"><label class="control-label  h4-5"><fmt:message key="travel.payment.card.expiryDate" bundle="${msg}" /></label></td>
								<td class="col-lg-4"><div class="styled-select payment-select"><select class="pay-details-select"
									id="month" name="epMonth">
										<option value="0"><fmt:message key="travel.payment.card.expiryDate.month" bundle="${msg}" /></option>
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
								</select></div></td>
								<td><div class="styled-select payment-select"><select class="pay-details-select" id="year"
									name="epYear" onBlur="chkValidCreditCardExpDate(this, 'erryear', 'month', 'errmonth');">
										<option value="0"><fmt:message key="travel.payment.card.expiryDate.year" bundle="${msg}" /></option>
<!-- 										<option value="2015">2015</option> -->
<!-- 										<option value="2016">2016</option> -->
<!-- 										<option value="2017">2017</option> -->
<!-- 										<option value="2018">2018</option> -->
<!-- 										<option value="2019">2019</option> -->
<!-- 										<option value="2020">2020</option> -->
									<%-- <c:forEach begin="0" end="5" varStatus="loop">
										<c:set var="currentYear" value="${year + loop.index}" />
										<option value="${currentYear}">${currentYear}</option>
									</c:forEach> --%>
								</select></div></td>
							</tr>
							<tr>
								<td></td>
								<td style="max-width: 200px"><span id="errmonth"
									class="error-msg"></span></td>
								<td style="max-width: 200px"><span id="erryear"
									class="error-msg"></span></td>
							</tr>
							<tr class="control-group">
								<td class="col-lg-4 ht1"><label class="control-label  h4-5"><fmt:message key="travel.payment.card.holderName" bundle="${msg}" /></label></td>
								<td colspan="2">
									<div class="controls">
										<input id="holdername" name="cardHolder" type="text"
											class="input-block-level" placeholder="<fmt:message key="travel.payment.card.holderName.placeholder" bundle="${msg}" />"
											onblur="replaceAlpha(this); chkNotNullCreditCareName(this, 'errname');"
											onkeypress="return alphaOnly(event);"> <span
											id="errname" class="error-msg"></span>
									</div>
								</td>
							</tr>
							<tr class="control-group">
								<td class="col-lg-4 ht1"><label class="control-label  h4-5"><fmt:message key="travel.payment.card.cvv" bundle="${msg}" /></label></td>
								<td>
									<div class="controls">
										<input id="seccode" type="password" name="securityCode"
											class="input-block-level" autocomplete="off" maxlength="3"
											title="" placeholder="<fmt:message key="travel.payment.card.cvv.placeholder" bundle="${msg}" />"
											onblur="replaceAlphaNumeric(this);"
											onkeypress="return isAlphaNumeric(event);" >

									</div>
								</td>
								<td><img src="<%=request.getContextPath()%>/resources/images/cards.png" alt=""></td>
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
								for="checkbox3"> <fmt:message key="travel.payment.declarations" bundle="${msg}" /></label>
						</div>
						<span id="errchk1" class="error-msg"></span>

						<span id="errchk2" class="error-msg"></span>
						<div class="clearfix"></div>
						<!--     <div class="col-lg-12 pad-none"><a href="travel-plan-details.html" class="bdr-curve btn btn-primary bck-btn2">返回 </a> <a href="travel-confirmation.html" class="bdr-curve btn btn-primary nxt-btn margin-left" onclick="return payValid();"> 確認付款</a> </div>-->
						<!-- <div class="hidden-sm hidden-xs pad-none">
							
								class="bdr-curve btn btn-primary bck-btn2">返回 </a> <input
								type="submit"
								class="bdr-curve btn btn-primary nxt-btn margin-left"
								value="確認付款" onclick="confirmPayment()" />
						</div>
						<br> <br>
						
						<div class="pad-none hidden-md hidden-lg">
							<a href="travel-plan-details.html"
								class="bdr-curve btn btn-primary bck-btn col-xs-5 col-sm-5 text-center">返回
							</a>
						</div> -->
						<!-- vincent add a button for paymnet confirmation (mobile) -->
						<!-- <div class="pad-none hidden-md hidden-lg">
							<input
								type="submit"
								class="bdr-curve btn btn-primary nxt-btn"
								value="確認付款" onclick="confirmPayment()" /> -->
						<!-- vincent add a button for paymnet confirmation (mobile) -->	
						
						
						<!-- <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-left">
								<a href="#" onclick="BackMe()"
									class="bdr-curve btn btn-primary bck-btn">返回 </a>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-right">
								<input type="submit"
									class="bdr-curve-none btn btn-primary nxt-btn "
									value="確認付款" onclick="confirmPayment()" />
								

							</div> -->
							
							<div class="hidden-sm hidden-xs pad-none">
							<a href="<%=request.getContextPath()%>/${language}/workingholiday-insurance/user-details"
								class="bdr-curve btn btn-primary bck-btn2"><fmt:message key="travel.action.back" bundle="${msg}" /> </a>
							<button onclick="confirmPayment();"
								class="bdr-curve btn btn-primary nxt-btn margin-left">
								<fmt:message key="travel.action.payment" bundle="${msg}" /></button>
						</div>
						<br> <br>
						<div class="row hidden-md hidden-lg">
							<div class="clearfix"></div>

							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-left">
								<a href="<%=request.getContextPath()%>/${language}/workingholiday-insurance/user-details"
									class="bdr-curve btn btn-primary bck-btn"><fmt:message key="travel.action.back" bundle="${msg}" />  </a>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-right">
								
								<input type="submit"
									class="bdr-curve-none btn btn-primary nxt-btn"
									value="<fmt:message key="travel.payment.confirmPayment" bundle="${msg}" />" onclick="confirmPayment()" />


							</div>
							<div class="clearfix"></div>
						</div>
							
							
							
													
							<div class="clearfix"></div>
						</div>
						<br>
						<br>
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
<div id="PaymentingDiv" class="waitingDiv" style="display: none">
	<img
		style="width: 200px; height: 200px; position: absolute; top: 40%; left: 40%"
		src="<%=request.getContextPath()%>/resources/images/ajax-loader.gif">
</div>
