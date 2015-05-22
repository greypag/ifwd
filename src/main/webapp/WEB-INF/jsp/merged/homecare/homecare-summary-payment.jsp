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

<script>
perventRedirect=true;
</script>

<section>
	<div id="cn" class="container">
		<div class="row">
			<form name="paymentForm" id="paymentForm" method="post">
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
				    <div class="col-lg-12 col-xs-12 col-sm-12 col-md-12 pad-none white-bg1 summary-container">
                       <div class="row">
                            <div class="col-xs-10 col-xs-offset-1 col-sm-10 col-sm-offset-1 col-md-9 col-md-offset-1 col-lg-9 col-lg-offset-1 pad-none">
                                <h3 class="h2-3-existing-fwd-head summary-header summary-header-margin"><fmt:message key="travel.summary.heading" bundle="${msg}" /></h3>
                            </div>
                            <!-- 
                            <div class="hidden-xs hidden-sm col-md-2 col-lg-2 pad-none summary-header-margin">
                                <h4 class="h4-trav-full">
                                    <a href="<%=request.getContextPath()%>/${language}/home-insurance/user-details" onclick="perventRedirect=false;" ><fmt:message key="travel.summary.subheading" bundle="${msg}" /></a>
                                </h4>
                            </div>
                             -->
                        </div>
                        <div class="row">
                            <!-- <table class="table activation-form margin-left-2"> -->
                            <div class="col-xs-10 col-xs-offset-1 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 pad-none">
                                <div class="table activation-form vert-middle travel-summary">
                                    <div class="margin-15">
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 h2-1 pad-none"><span class="home-summary-applicant h2-3-existing-fwd-head"><fmt:message key="home.summary.changedetail.desc1" bundle="${msg}" /></span></div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="home.summary.changedetail.desc2" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none">${userDetails.getFullName()}</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="home.summary.changedetail.desc3" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none"><c:out value="${apphkidandpassport.equals('appPassport')?userDetails.getPassport():userDetails.getHkid()}" /></div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="home.summary.changedetail.desc4" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none">${userDetails.getEmailAddress()}</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="home.summary.changedetail.desc5" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none">${userDetails.getMobileNo()}</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="home.summary.plansummary.desc1" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none">${createdPolicy.getReferenceNo() }<input type="hidden" name="referenceNo" value="${createdPolicy.getReferenceNo()}"></div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="home.summary.plansummary.desc2" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none"><fmt:message key="home.summary.plansummary.desc3" bundle="${msg}" /><br/><h4 class="h4-4-full"></h4></div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="home.summary.plansummary.desc5.part1" bundle="${msg}" /><br/><fmt:message key="home.summary.plansummary.desc5.part2" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none">
                                                <c:if test="${homeCareDetails.getApplicantRoom() != ''}">
	                                                Room/Flat ${homeCareDetails.getApplicantRoom()}, 
	                                            </c:if>
	                                            <c:if test="${homeCareDetails.getApplicantFloor() != ''}">
	                                                Floor ${homeCareDetails.getApplicantFloor()}, 
	                                            </c:if>
	                                            <c:if test="${homeCareDetails.getApplicantBlock() != ''}">
	                                                Block ${homeCareDetails.getApplicantBlock()}, 
	                                            </c:if>
	                                            
	                                            <c:if test="${homeCareDetails.getApplicantBuilding() != ''}">
	                                                ${homeCareDetails.getApplicantBuilding() },
	                                            </c:if>
	                                            <br/>
	                                            <c:if test="${homeCareDetails.getApplicantEstate() != ''}">
	                                                ${homeCareDetails.getApplicantEstate() },
	                                            </c:if>
	                                            
	                                            <c:if test="${homeCareDetails.getApplicantStreetNo() != ''}">
	                                                ${homeCareDetails.getApplicantStreetNo() },
	                                            </c:if>
	                                             <c:if test="${homeCareDetails.getApplicantStreetName() != ''}">
	                                                ${homeCareDetails.getApplicantStreetName() },
	                                            </c:if>
	                                            
	                                            <c:if test="${homeCareDetails.getApplicantDistrictDesc() != ''}">
	                                                ${homeCareDetails.getApplicantDistrictDesc() },
	                                            </c:if>
	                                            <c:if test="${homeCareDetails.getApplicantAreaDesc() != ''}">
	                                                ${homeCareDetails.getApplicantAreaDesc() }
	                                            </c:if>
                                            </div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="home.summary.plansummary.desc6" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none">
                                                <c:if test="${homeCareDetails.getaRoom() != ''}">
	                                                Room/Flat ${homeCareDetails.getaRoom()}, 
	                                            </c:if>
	                                            <c:if test="${homeCareDetails.getaFloor() != ''}">
	                                                Floor ${homeCareDetails.getaFloor()}, 
	                                            </c:if>
	                                            <c:if test="${homeCareDetails.getaBlock() != ''}">
	                                                Block ${homeCareDetails.getaBlock()}, 
	                                            </c:if>
	                                            
	                                            <c:if test="${homeCareDetails.getaBuilding() != ''}">
	                                                ${homeCareDetails.getaBuilding()},
	                                            </c:if>
	                                            <br/>
	                                            <c:if test="${homeCareDetails.getaEstate() != ''}">
	                                                ${homeCareDetails.getaEstate()},
	                                            </c:if>
	                                            
	                                            <c:if test="${homeCareDetails.getaStreetNo() != ''}">
	                                                ${homeCareDetails.getaStreetNo()},
	                                            </c:if>
	                                            <c:if test="${homeCareDetails.getaStreetName() != ''}">
	                                                ${homeCareDetails.getaStreetName()},
	                                            </c:if>
	                                            
	                                            <c:if test="${homeCareDetails.getaDistrictDesc() != ''}">
	                                                ${homeCareDetails.getaDistrictDesc()},
	                                            </c:if>
	                                            <c:if test="${homeCareDetails.getaAreaDesc() != ''}">
	                                                ${homeCareDetails.getaAreaDesc()}
	                                            </c:if>
                                            </div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="home.summary.plansummary.desc7.part1" bundle="${msg}" /><br/><fmt:message key="home.summary.plansummary.desc7.part2" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none">${homeCareDetails.getNetFloorAreaDesc()}</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="home.summary.plansummary.desc8" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none"><fmt:message key="home.summary.plansummary.yearly" bundle="${msg}" /></div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="home.summary.plansummary.desc9.part1" bundle="${msg}" /><br><fmt:message key="home.summary.plansummary.desc9.part2" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none"><fmt:message key="home.summary.plansummary.from" bundle="${msg}" /> ${effectiveDate } <fmt:message key="home.summary.plansummary.to" bundle="${msg}" />${effectiveEndDate}</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><span class="h4-4-orange-b pad-none"><fmt:message key="home.summary.plansummary.desc10" bundle="${msg}" /></span></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none">
                                            <%
	                                            HomeCareDetailsBean homeCareDetails = (HomeCareDetailsBean) request.getAttribute("homeCareDetails");
	                                        %>
                                                <span class="h4-4-orange-b pad-none">HK$<%=String.format("%.2f",Double.parseDouble(homeCareDetails.getTotalDue()))%></span>
                                            </div>
                                        </div>
	                                </div>
	                                <div class="clearfix"></div>
                                </div>
				            </div>
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
					value="${createdPolicy.getCurrCode() }"> 
					<input type="hidden" name="remark" value="${referralCode.trim()}">
					<input type="hidden" name="successUrl" value="${path}"> <input
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
										
										<!-- 										<option VALUE="2021">2021</option> -->
										<!-- 										<option VALUE="2022">2022</option> -->
										<!-- 										<option VALUE="2023">2023</option> -->
										<!-- 										<option VALUE="2024">2024</option> -->
										<!-- 										<option VALUE="2025">2025</option> -->
										
										
										
										
										<c:forEach begin="0" end="10" varStatus="loop">
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
											onblur="replaceAlphaNumeric(this);"
											onkeypress="return isAlphaNumeric(event);">

									</div></td>
								<td><img
									src="<%=request.getContextPath()%>/resources/images/icon-card.png"
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
						
						<!-- old buttons
						<div class="hidden-sm hidden-xs pad-none">
							<a href="<%=request.getContextPath()%>/${language}/home-insurance/user-details"
								class="bdr-curve btn btn-primary bck-btn2"><fmt:message
								key="home.summary.action.back" bundle="${msg}" /> </a>
							<input type="submit" class="bdr-curve btn btn-primary nxt-btn margin-left"
								value="<fmt:message key="home.summary.action.confirmPayment" bundle="${msg}" />">
						</div>
						-->
						<div class="row">
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-left">
	                            <!-- <a href="<%=request.getContextPath()%>/${language}/home-insurance/user-details" class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;">
	                                <fmt:message key="home.summary.action.back" bundle="${msg}" /> 
	                            </a> -->
	                            
	                            <a class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;BackMe();"><fmt:message key="home.summary.action.back" bundle="${msg}" /> </a>
	                        </div>
	                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-left">
	                            <a onclick="perventRedirect=false; confirmHomeCarePayment('paymentForm', 'gateway', 'paymentForm');"
	                                class="bdr-curve-none btn btn-primary nxt-btn"><fmt:message key="home.summary.action.confirmPayment" bundle="${msg}" /></a>
	                        </div>
                        </div>
						
						
						
						<!-- 
						
						
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
						 -->
						<!-- <br>
                            <img src="<%=request.getContextPath()%>/resources/images/icon-paydollar.png" alt="">
                        <br>-->
                        <br/>
                        <!-- <div style="overflow: hidden;">
                          <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 row pull-left">
                              <img src="<%=request.getContextPath()%>/resources/images/icon-paydollar.png" alt="">
                            </div>
                            <div class="col-lg-11 col-md-11 col-sm-11 col-xs-11 pull-left" style="padding-left: 15px;line-height: 45px;">
                              <fmt:message key="travel.action.paydollar" bundle="${msg}" />
                            </div>
                        </div>-->
                        
                        
                        <hr class="summary-hr"/>
                        <div id="paydoller-wrap" class="declaration-content margin-left-small float">
                          <div id="paydollar-container" class="col-xs-12 col-sm-12 col-md-4 col-lg-4 paymethod-container">
                            <div id="paydollar-icon" class="col-xs-5 col-sm-3 col-md-12 col-lg-12 pad-none pull-left paymethod-icon">
                             <img src="<%=request.getContextPath()%>/resources/images/icon-pay-dollar.png" alt="">
                            </div>
                            <div class="col-xs-7 col-sm-9 col-md-12 col-lg-12 pad-none pull-left">
                             <fmt:message key="travel.action.paydollar" bundle="${msg}" />
                            </div>
                          </div>
                          <div id="visa-container" class="col-xs-12 col-sm-12 col-md-4 col-lg-4 paymethod-container">
                            <div id="visa-icon" class="col-xs-5 col-sm-3 col-md-12 col-lg-12 pad-none pull-left paymethod-icon">
                             <img src="<%=request.getContextPath()%>/resources/images/icon-visa.png" alt="">
                            </div>
                            <div class="col-xs-7 col-sm-9 col-md-12 col-lg-12 pad-none pull-left">
                             <fmt:message key="travel.action.visa" bundle="${msg}" />
                            </div>
                          </div>
                          <div id="master-container" class="col-xs-12 col-sm-12 col-md-4 col-lg-4 paymethod-container">
                            <div id="master-icon" class="col-xs-5 col-sm-3 col-md-12 col-lg-12 pad-none pull-left paymethod-icon">
                             <img src="<%=request.getContextPath()%>/resources/images/icon-master.png" alt="">
                            </div>
                            <div class="col-xs-7 col-sm-9 col-md-12 col-lg-12 pad-none pull-left">
                             <fmt:message key="travel.action.master" bundle="${msg}" />
                            </div>
                          </div>
                        </div>

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
					$('#PaymentingDiv').hide();
					if (data == 'success') {
						form.action = geteWayUrl;
						$('#PaymentingDiv').hide();
					} else {
						$('#paymentErrorPopup').modal('show');
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
                                $("#"+form).attr('action', geteWayUrl);
                                $("#"+form).submit();
                            } else {
                                $('#paymentErrorPopup').modal('show');
                                return false;
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