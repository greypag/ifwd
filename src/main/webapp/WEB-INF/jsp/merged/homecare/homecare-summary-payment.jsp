<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="com.ifwd.fwdhk.model.HomeCareDetailsBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="year" value="${now}" pattern="yyyy" />



<section>
	<div class="container">
		<div class="row">
			<form name="paymentForm" id="paymentForm"
				onsubmit="return confirmHomeCarePayment(this, 'gateway', 'paymentForm');"
				method="post">
				<ol class="breadcrumb pad-none">
					<li><a href="#"><fmt:message key="home.breadcrumb1.item1"
								bundle="${msg}" /></a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#"><fmt:message key="home.breadcrumb1.item2"
								bundle="${msg}" /></a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#"><fmt:message key="home.breadcrumb1.item3"
								bundle="${msg}" /></a><i class="fa fa-caret-right"></i></li>
					<li><a href="#"><fmt:message key="home.breadcrumb1.item4"
								bundle="${msg}" /></a></li>
					<li class="active "><i class="fa fa-caret-right"></i> <fmt:message
							key="home.breadcrumb1.item5" bundle="${msg}" /></li>
				</ol>
				<div class="container ">
					<div
						class="col-lg-12 col-md-12 col-sm-12 col-xs-12 shop-tracking-status">
						<div class="center" style="visibility: visible;">
							<h2>
								<fmt:message key="home.summary.jumbo" bundle="${msg}" />
							</h2>
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
										<span class="status color3"><fmt:message
												key="home.breadcrumb2.item1" bundle="${msg}" /></span>
										<div class="icon">1</div>
									</div>

									<div
										class="image-order-status image-order-status-intransit  img-circle second">
										<span class="status color3"><fmt:message
												key="home.breadcrumb2.item2" bundle="${msg}" /></span>
										<div class="icon">2</div>
									</div>
									<div
										class="image-order-status image-order-status-delivered  img-circle act third">
										<span class="status color2"><fmt:message
												key="home.breadcrumb2.item3" bundle="${msg}" /></span>
										<div class="icon">3</div>
									</div>
									<div
										class="image-order-status image-order-status-completed  img-circle disabled fourth">
										<span class="status lst-status"><fmt:message
												key="home.breadcrumb2.item4" bundle="${msg}" /></span>
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
								<h3
									class="margin-left-2 h2-3-existing-fwd-head home-summary-heading">Plan
									Summary</h3>
							</div>
							<div class="col-xs-6 col-md-5">
								<h4 class="h4-trav-full text-right home-summary-change">
									<a href="" onclick="BackMe()"><fmt:message key="home.summary.changedetail.heading" bundle="${msg}" /></a>
								</h4>
							</div>
						</div>


						<div class="col-lg-6 col-xs-12 col-sm-12 col-md-6 pad-none">

							<table class="table activation-form margin-left-2">
								<tbody>
									<tr>
										<td class="h2-1 pad-left1 col-lg-5"><fmt:message
												key="home.summary.plansummary.desc1" bundle="${msg}" /></td>
										<td class=" h4-5">${createdPolicy.getReferenceNo() }<input
											type="hidden" name="referenceNo"
											value="${createdPolicy.getReferenceNo()}"></td>
									</tr>
									<tr>
										<td class="h2-1 "><fmt:message
												key="home.summary.plansummary.desc2" bundle="${msg}" /></td>
										<td class="h4-5 "><fmt:message
												key="home.summary.plansummary.desc3" bundle="${msg}" /><br>
											<fmt:message key="home.summary.plansummary.desc4"
												bundle="${msg}" /> <br>
											<h4 class="h4-4-full">
												<!-- + Full coverage details -->
											</h4></td>
									</tr>
									<tr>
										<td class="h2-1 "><fmt:message
												key="home.summary.plansummary.desc5.part1" bundle="${msg}" />
											<br>
										<fmt:message key="home.summary.plansummary.desc5.part2"
												bundle="${msg}" /></td>
										<td class=" h4-5 ">${homeCareDetails.getApplicantRoom()}/${homeCareDetails.getApplicantFloor()},
											${homeCareDetails.getApplicantBlock()}, <br>
											${homeCareDetails.getApplicantBuilding() },
											${homeCareDetails.getApplicantEstate() }, ${homeCareDetails.getApplicantStreetNo()}<br>
											${homeCareDetails.getApplicantStreetName()}<br>
											${homeCareDetails.getApplicantDistrictDesc()}, 
											${homeCareDetails.getApplicantAreaDesc() }
										</td>
									</tr>
									<tr>
										<td class="h2-1 "><fmt:message
												key="home.summary.plansummary.desc6" bundle="${msg}" /></td>
										<td class=" h4-5 ">${homeCareDetails.getaRoom()}/${homeCareDetails.getaFloor()},
											${homeCareDetails.getaBlock() },<br>
											${homeCareDetails.getaBuilding()},
											${homeCareDetails.getaEstate() }, ${homeCareDetails.getaStreetNo() }<br>
											${homeCareDetails.getaStreetName() }<br>
											${homeCareDetails.getaDistrictDesc()}, 
											${homeCareDetails.getaAreaDesc() }</td>
									</tr>
									<tr>
										<td class="h2-1 "><fmt:message
												key="home.summary.plansummary.desc7.part1" bundle="${msg}" /><br>
										<fmt:message key="home.summary.plansummary.desc7.part2"
												bundle="${msg}" /></td>
										<td class=" h4-5 ">${homeCareDetails.getNetFloorAreaDesc()}</td>
										<%-- 										${homeCareDetails.getNetFloorArea()} --%>
									</tr>
									<tr>
										<td class="h2-1 "><fmt:message
												key="home.summary.plansummary.desc8" bundle="${msg}" /></td>
										<td class=" h4-5 ">Yearly</td>
									</tr>
									<tr>
										<td class="h2-1 "><fmt:message
												key="home.summary.plansummary.desc9.part1" bundle="${msg}" /><br>
										<fmt:message key="home.summary.plansummary.desc9.part2"
												bundle="${msg}" /></td>
										<td class=" h4-5 ">From ${effectiveDate } to
											${effectiveEndDate}</td>
									</tr>
									<tr>
										<td class="td-vert-middle"><span
											class="h4-4-orange-b pad-none"><fmt:message
													key="home.summary.plansummary.desc10" bundle="${msg}" /></span></td>
										<%
											HomeCareDetailsBean homeCareDetails = (HomeCareDetailsBean) request
													.getAttribute("homeCareDetails");
										%>
										<td class=" "><span class="h4-4-orange-b pad-none">HK$
												<%=String.format("%.2f",
					Double.parseDouble(homeCareDetails.getTotalDue()))%></span></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div
							class="col-lg-6 col-xs-6 col-sm-6 col-md-6 pad-none hidden-sm hidden-xs">

							<table class="table activation-form margin-left-2">
								<tbody>
									<tr>
										<td class="pad-none "><span
											class="home-summary-applicant h2-3-existing-fwd-head"><fmt:message
													key="home.summary.changedetail.desc1" bundle="${msg}" /></span></td>
										<td class="pad-none h4-5 "></td>
									</tr>
									<tr>
										<td class="h2-1 pad-none "><fmt:message
												key="home.summary.changedetail.desc2" bundle="${msg}" /></td>
										<td class="pad-none h4-5 ">${userDetails.getFullName()}</td>
									</tr>
									<tr>
										<td class="h2-1 pad-none "><fmt:message
												key="home.summary.changedetail.desc3" bundle="${msg}" /></td>
										<td class="pad-none h4-5 ">
										
										<c:choose>
										<c:when test=" ${empty userDetails.getHkid()}">
											<c:out value="${userDetails.getPassport()}" /> 
											 </c:when>
											<c:otherwise>
											<c:out value="${userDetails.getHkid()}"/>
											
											</c:otherwise>
										</c:choose>
										</td>
									</tr>
									<tr>
										<td class="h2-1 pad-none "><fmt:message
												key="home.summary.changedetail.desc4" bundle="${msg}" /></td>
										<td class="pad-none h4-5 ">${userDetails.getEmailAddress()}</td>
									</tr>
									<tr>
										<td class="h2-1 pad-none "><fmt:message
												key="home.summary.changedetail.desc5" bundle="${msg}" /></td>
										<td class="pad-none h4-5 ">${userDetails.getMobileNo()}</td>
									</tr>
								</tbody>
							</table>
						</div>


					</div>
					<div class="clearfix"></div>
				</div>
				<input type="hidden" name="merchantId"
					value="${createdPolicy.getMerchantId()}"> <input
					type="hidden" name="amount" value="${totalDue.trim()}"> <input
					type="hidden" name="orderRef"
					value="${confirm.getTransactionNo() }"> <input
					type="hidden" name="currCode"
					value="${createdPolicy.getCurrCode() }"> <input
					type="hidden" name="successUrl" value="${path}"> <input
					type="hidden" name="failUrl" value="${failurePath}"> <input
					type="hidden" name="errorUrl" value="${failurePath}"> <input
					type="hidden" name="payType"
					value="${createdPolicy.getPaymentType() }">
					<%
						String payLang = (String)session.getAttribute("language");
						//payLang = payLang.substring(0, 1);
						if (session.getAttribute("language").equals("tc"))
							payLang = "c";
						else 
							payLang = "e";
						
						System.out.println("getLanguage" + session.getAttribute("language"));
						System.out.println("payLang" + payLang);
					%>


<%-- 				<input type="hidden" name="lang" value="<%=payLang%>"> <input --%>
				<input type="hidden" name="lang" value="C"> <input
					type="hidden" name="secureHash" value="${confirm.getSecureHash() }">
				<input type="hidden" id="emailAddress" name="emailAddress"
					value="${userDetails.getEmailAddress()}"> <input
					type="hidden" id="transactionDate" name="transactionDate"
					value="${effectiveDate}"> <input type="hidden" id="gateway"
					name="gateway" value="${createdPolicy.getPaymentGateway()}">
				<div class="gray-bg1 pad20">
					<div class="clearfix"></div>
					<h2 class="from-control">
						<fmt:message key="home.summary.pmtdetail.heading" bundle="${msg}" />
					</h2>
					<h3>
						<span id="paymentGatewayErrorMsg" class="text-red">${errormsg}</span>
					</h3>
					<table class="travel-tb">
						<tbody>

							<tr class="control-group">
								<td class="col-lg-4 ht1"><label class="control-label h4-5"><fmt:message
											key="home.summary.pmtdetail.desc1" bundle="${msg}" /></label></td>
								<td class="col-lg-8" colspan="2"><div class="controls">
										<div>
											<img
												src="<%=request.getContextPath()%>/resources/images/payment.png"
												alt="">
										</div>
									</div></td>
							</tr>

							<tr style="display: none;">

								<td class="col-lg-4 ht1"><label class="control-label h4-5">Payment
										Method</label></td>
								<td><input type="radio" name="pMethod" id="chkVisa"
									value="VISA">VISA <input type="radio" name="pMethod"
									value="Master" id="chkMaster">MasterCard <!-- <input type="radio" name="pMethod" value="Diners">Diners
									Club <input type="radio" name="pMethod" value="JCB">JCB
									<input type="radio" name="pMethod" value="AMEX">AMEX --></td>
							</tr>

							<tr class="control-group">
								<td class="col-lg-4 ht1"><label class="control-label h4-5"><fmt:message
											key="home.summary.pmtdetail.desc2" bundle="${msg}" /></label></td>
								<td colspan="2"><div class="controls">
										<!-- <input id="cardnumber" name="cardnumber" type="text"
											class="input-block-level" maxlength="16" min="16" title=""
											onkeyup="validatecardnumber(this.value)"
											onBlur="chkMinLength(this.value);"
											onkeypress="return isNumeric(event)"> -->
										<!-- <input id="cardnumber" name="cardNo" type="text"
											class="input-block-level" maxlength="16" data-min="16"
											title="" placeholder="Credit card number"
											onkeyup="validatecardnumber(this.value)" onkeypress="return isNumeric(event)" 
											onBlur="chkValidCreditCard(this, 'errcardno');"
											 /> -->
										<input id="cardnumber" name="cardNo" type="text"
											class="input-block-level" maxlength="16" data-min="16"
											title=""
											placeholder="<fmt:message
											key="home.summary.pmtdetail.desc2.placeholder" bundle="${msg}" />"
											onkeyup="" onkeypress="return isNumeric(event)"
											onBlur="validatecardnumber(this.value)" /> <span
											id="errcardno" class="error-msg"></span>

									</div></td>
							</tr>



							<tr class="control-group">
								<td class="col-lg-4 ht1"><label class="control-label  h4-5"><fmt:message
											key="home.summary.pmtdetail.desc3" bundle="${msg}" /></label></td>
								<td><div class="styled-select payment-select"><select class="pay-details-select" id="month"
									name="epMonth">
										<option value="0"><fmt:message key="home.summary.pmtdetail.desc3.month" bundle="${msg}" /></option>
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
									name="epYear">
										<option VALUE=""><fmt:message
												key="home.summary.pmtdetail.desc3.year" bundle="${msg}" /></option>
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
								</select></div></td>

							</tr>
							<tr>
								<td></td>
								<td><span id="errmonth" class="error-msg"></span></td>
								<td><span id="erryear" class="error-msg"></span></td>
							</tr>
							<tr class="control-group">
								<td class="col-lg-4 ht1"><label class="control-label  h4-5"><fmt:message
											key="home.summary.pmtdetail.desc4" bundle="${msg}" /></label></td>
								<td colspan="2">
									<div class="controls">
										<input id="holdername" type="text" name="cardHolder"
											class="input-block-level" title=""
											placeholder="<fmt:message
											key="home.summary.pmtdetail.desc4.placeholder" bundle="${msg}" />"
											onblur="replaceAlpha(this); chkNotNullCreditCareName(this, 'errname');"
											onkeypress="return alphaOnly(event);"> <span
											id="errname" class="error-msg"></span>
									</div>
								</td>
							</tr>
							<tr class="control-group">
								<td class="col-lg-4 ht1"><label class="control-label  h4-5"><fmt:message
											key="home.summary.pmtdetail.desc5" bundle="${msg}" /></label></td>
								<td><div class="controls">
										<input id="seccode" name="securityCode" type="password"
											class="input-block-level" autocomplete="off" maxlength="3"
											title=""
											placeholder="<fmt:message
											key="home.summary.pmtdetail.desc5.placeholder" bundle="${msg}" />"
											onblur="replaceAlphaNumeric(this);"
											onkeypress="return isAlphaNumeric(event);">

									</div></td>
								<td><img
									src="<%=request.getContextPath()%>/resources/images/cards.png"
									alt=""></td>
							</tr>
							<tr>
								<td></td>
								<td><span id="errcode" class="error-msg"></span></td>
								<td></td>
							</tr>


							<tr class="control-group">
								<td></td>
								<td colspan="2">
									<!--<a class="sub-link" href="#"><fmt:message key="home.summary.pmtdetail.desc6" bundle="${msg}" /></a>-->
								</td>
							</tr>




						</tbody>

					</table>
					<div class="clearfix"></div>
					<div class="declaration-content margin-left-small">
						<div class="checkbox">
							<input id="checkbox3" type="checkbox"> <label
								for="checkbox3"> <fmt:message
									key="home.summary.declarations" bundle="${msg}" />
							</label>
							<div class="clearfix"></div>
						</div>
						<span id="errchk1" class="error-msg"></span>
						<!-- <div class="checkbox">
							<input id="checkbox2" type="checkbox"> <label
								for="checkbox2"> I/We have read and understand the<a
								href="<%=request.getContextPath()%>/resources/policy-provisions-pdf/Easy_HomeCare_Provisions_Mar_2015.pdf"
								target="_blank" class="sub-link"> policy coverage</a> and <a href="#" class="sub-link">terms and conditions.</a>
							</label>
							<div class="clearfix"></div>
						</div>
						<span id="errchk2" class="error-msg"></span>-->
						<div class="clearfix"></div>
						<div class="hidden-sm hidden-xs pad-none">
								<!-- 								<input type="button" class="bdr-curve btn btn-primary bck-btn" onclick="BackMe()" -->
								<%-- 									value="<fmt:message key="home.summary.action.back" bundle="${msg}" />"> --%>
								<a
									href="<%=request.getContextPath()%>/${language}/home-insurance/user-details"
									class="bdr-curve btn btn-primary bck-btn2"><fmt:message
										key="home.summary.action.back" bundle="${msg}" /> </a>
								<!-- <input type="button"
									class="bdr-curve btn btn-primary nxt-btn margin-left"
									onclick="confirmPayment()" value="Confirm Payment"> -->
								<input type="submit" class="bdr-curve btn btn-primary nxt-btn margin-left"
									value="<fmt:message key="home.summary.action.confirmPayment" bundle="${msg}" />">
						</div>
						<br> <br>
						<div class="pad-none hidden-md hidden-lg">
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
								<a href="" onclick="BackMe()"
									class="bdr-curve btn btn-primary bck-btn col-xs-5 col-sm-5 text-center">Back
								</a>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">


								<input type="submit"
									class="bdr-curve btn btn-primary btn-next text-center"
									value="Pay Now">
							</div>


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

<div id="PaymentingDiv" class="waitingDiv" style="display: none">
	<img
		style="width: 200px; height: 200px; position: absolute; top: 40%; left: 40%"
		src="<%=request.getContextPath()%>/resources/images/ajax-loader.gif">
</div>


<script>
 // moved to fwd.js -- re-added by Sneh( cannot find in fwd.js)
 var pay = false;
 	function confirmPayment(form) {
 		if (payValid() && !pay) {
 			pay = true;
 			$('#PaymentingDiv').show();
 			var geteWayUrl = $('#gateway').val();
 				$.ajax({
 						type : "POST",
 						url : "<%=request.getContextPath()%>/processHomeCarePayment",
				data : $("#paymentForm").serialize(),
				async : false,
				success : function(data) {
					if (data == 'success') {
						form.action = geteWayUrl;
						$('#PaymentingDiv').hide();
					} else {
						console.log("process home payment fail " + data);
					}
				}
			});
		}

	}

 	var clicked = false;
 	function confirmHomeCarePayment(form, gatewayUrlId, paymentFormId) {
 		if (payValid() && clicked === false) {
 			clicked = true;
 			$("#PaymentingDiv").show();

 			var gatewayUrlId = '#' + gatewayUrlId;
 			var paymentFormId = '#' + paymentFormId;
 			var method = "<%=request.getContextPath()%>/processHomeCarePayment";
 			
 			var geteWayUrl = $(gatewayUrlId).val();
 			$.ajax({
 						type : "POST",
 						url : method,
 						data : $(paymentFormId).serialize(),
 						async : false,
 						success : function(data) {
 							if (data == 'success') {
 								form.action = geteWayUrl;
 							}
 						}
 					});
 			return true;
 		}else return false;

 	}


	

	function BackMe() {
		window.history.back();
	}
</script>